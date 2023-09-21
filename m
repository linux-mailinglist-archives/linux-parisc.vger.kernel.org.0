Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8EF87A9998
	for <lists+linux-parisc@lfdr.de>; Thu, 21 Sep 2023 20:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjIUSQ1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 21 Sep 2023 14:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjIUSQP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 21 Sep 2023 14:16:15 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2D5BB7EA33;
        Thu, 21 Sep 2023 10:37:38 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 911D21764;
        Thu, 21 Sep 2023 09:21:37 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26AFE3F59C;
        Thu, 21 Sep 2023 09:20:56 -0700 (PDT)
From:   Ryan Roberts <ryan.roberts@arm.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <muchun.song@linux.dev>,
        SeongJae Park <sj@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Peter Xu <peterx@redhat.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     Ryan Roberts <ryan.roberts@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        stable@vger.kernel.org
Subject: [PATCH v1 8/8] arm64: hugetlb: Fix set_huge_pte_at() to work with all swap entries
Date:   Thu, 21 Sep 2023 17:20:07 +0100
Message-Id: <20230921162007.1630149-9-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921162007.1630149-1-ryan.roberts@arm.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When called with a swap entry that does not embed a PFN (e.g.
PTE_MARKER_POISONED or PTE_MARKER_UFFD_WP), the previous implementation
of set_huge_pte_at() would either cause a BUG() to fire (if
CONFIG_DEBUG_VM is enabled) or cause a dereference of an invalid address
and subsequent panic.

arm64's huge pte implementation supports multiple huge page sizes, some
of which are implemented in the page table with contiguous mappings. So
set_huge_pte_at() needs to work out how big the logical pte is, so that
it can also work out how many physical ptes (or pmds) need to be
written. It does this by grabbing the folio out of the pte and querying
its size.

However, there are cases when the pte being set is actually a swap
entry. But this also used to work fine, because for huge ptes, we only
ever saw migration entries and hwpoison entries. And both of these types
of swap entries have a PFN embedded, so the code would grab that and
everything still worked out.

But over time, more calls to set_huge_pte_at() have been added that set
swap entry types that do not embed a PFN. And this causes the code to go
bang. The triggering case is for the uffd poison test, commit
99aa77215ad0 ("selftests/mm: add uffd unit test for UFFDIO_POISON"),
which sets a PTE_MARKER_POISONED swap entry. But review shows there are
other places too (PTE_MARKER_UFFD_WP).

So the root cause is due to commit 18f3962953e4 ("mm: hugetlb: kill
set_huge_swap_pte_at()"), which aimed to simplify the interface to the
core code by removing set_huge_swap_pte_at() (which took a page size
parameter) and replacing it with calls to set_huge_swap_pte_at() where
the size was inferred from the folio, as descibed above. While that
commit didn't break anything at the time, it did break the interface
because it couldn't handle swap entries without PFNs. And since then new
callers have come along which rely on this working.

Now that we have modified the set_huge_pte_at() interface to pass the
vma, we can extract the huge page size from it and fix this issue.

I'm tagging the commit that added the uffd poison feature, since that is
what exposed the problem, as well as the original change that broke the
interface. Hopefully this is valuable for people doing bisect.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Fixes: 18f3962953e4 ("mm: hugetlb: kill set_huge_swap_pte_at()")
Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
---
 arch/arm64/mm/hugetlbpage.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 844832511c1e..a08601a14689 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -241,13 +241,6 @@ static void clear_flush(struct mm_struct *mm,
 	flush_tlb_range(&vma, saddr, addr);
 }
 
-static inline struct folio *hugetlb_swap_entry_to_folio(swp_entry_t entry)
-{
-	VM_BUG_ON(!is_migration_entry(entry) && !is_hwpoison_entry(entry));
-
-	return page_folio(pfn_to_page(swp_offset_pfn(entry)));
-}
-
 void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
 			    pte_t *ptep, pte_t pte)
 {
@@ -258,13 +251,10 @@ void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
 	unsigned long pfn, dpfn;
 	pgprot_t hugeprot;
 
-	if (!pte_present(pte)) {
-		struct folio *folio;
-
-		folio = hugetlb_swap_entry_to_folio(pte_to_swp_entry(pte));
-		ncontig = num_contig_ptes(folio_size(folio), &pgsize);
+	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
 
-		for (i = 0; i < ncontig; i++, ptep++)
+	if (!pte_present(pte)) {
+		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
 			set_pte_at(mm, addr, ptep, pte);
 		return;
 	}
@@ -274,7 +264,6 @@ void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
 		return;
 	}
 
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
 	pfn = pte_pfn(pte);
 	dpfn = pgsize >> PAGE_SHIFT;
 	hugeprot = pte_pgprot(pte);
-- 
2.25.1

