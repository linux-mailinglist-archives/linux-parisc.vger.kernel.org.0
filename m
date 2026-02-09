Return-Path: <linux-parisc+bounces-4550-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBLtFHPziWnGEgAAu9opvQ
	(envelope-from <linux-parisc+bounces-4550-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Mon, 09 Feb 2026 15:47:15 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280D110F39
	for <lists+linux-parisc@lfdr.de>; Mon, 09 Feb 2026 15:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73A7030159CA
	for <lists+linux-parisc@lfdr.de>; Mon,  9 Feb 2026 14:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5160D37BE8C;
	Mon,  9 Feb 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoiSaopD"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2987F378D84;
	Mon,  9 Feb 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648099; cv=none; b=XRf8mOHw05ep3cftPsBCicOOMEq49/gfDu9ZO2+KWa6CTlj4r7B2fzgkPlNcxKNtSgb2BhMH6N/cGbQcqb4xOXLBK7lKUrH689o8LxgY+tra/HDoEBYY2uWLl4GkO+ce7Dc2He2HA+ntNk2ZOhtynmLFRefBUr5IV6IcfCqWyq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648099; c=relaxed/simple;
	bh=dIkOhzWY1xuDq5ewEz/XDIyATuNWlEhxlmAB0qWidMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tX7BSJ3zt8+dRhTizHlAMXdwLDBvLFneV/0YSCPVwioCe+qef8LcWFJUMxkT2i4si3CRd6ZTs5AlwlkfnNRe0trH0H/rgWz0mOq3juCUlw/wFqtTJPKwn+CQEV0lshzIsGY26wKQcYpPzmrsqUXf9SbEzUT40oM3xGEIHUodJBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoiSaopD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D57DC116C6;
	Mon,  9 Feb 2026 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770648099;
	bh=dIkOhzWY1xuDq5ewEz/XDIyATuNWlEhxlmAB0qWidMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IoiSaopDKfrfSZ7+rlBU8LjocFAFB8EJgAVaUZ/W+cBxwixSmGT1x/E8BIkMkjYP8
	 SzhptbW3ELmnRGgPqG0GC6S3X5YQ0NFlsp7/MwlGEwmonjJfjX36w6Zrid+02MdXYD
	 aD13CKitrIkfiTc+tMswjO0GZ7FkCVjL6pg6DrkfeYhc3cdJymj5D1FMzCONDpjNPt
	 CRTH696/5neg33D9wpXGgfmmIGyqUJnxX11v6uXDMEkOIdpDtKcYEzjVktAE2R8WVo
	 jD3MvmL5DA+h5y6UTuTlFtK2d3SzKn7oXhmb/Hq02WBSEx3CHrl4//hhcmH0UMQ0G3
	 Ad/W6NbiDr+Ig==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v2 2/4] mm: rename my_zero_pfn() to zero_pfn()
Date: Mon,  9 Feb 2026 16:40:55 +0200
Message-ID: <20260209144058.2092871-3-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260209144058.2092871-1-rppt@kernel.org>
References: <20260209144058.2092871-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	TAGGED_FROM(0.00)[bounces-4550-lists,linux-parisc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-parisc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[53];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-parisc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8280D110F39
X-Rspamd-Action: no action

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

my_zero_pfn() is a silly name.

Rename zero_pfn variable to zero_page_pfn and my_zero_pfn() function to
zero_pfn().

While on it, move extern declarations of zero_page_pfn outside the
functions that use it and add a comment about what ZERO_PAGE is.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kvm/mmu/spte.h |  2 +-
 fs/dax.c                |  2 +-
 fs/proc/vmcore.c        |  2 +-
 include/linux/pgtable.h | 25 +++++++++++++++++--------
 mm/huge_memory.c        |  2 +-
 mm/memory.c             |  2 +-
 mm/migrate.c            |  2 +-
 mm/mm_init.c            | 10 +++++-----
 mm/userfaultfd.c        |  4 ++--
 9 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index 91ce29fd6f1b..8c0ffa2cded6 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -248,7 +248,7 @@ extern u64 __read_mostly shadow_nonpresent_or_rsvd_lower_gfn_mask;
 
 static inline hpa_t kvm_mmu_get_dummy_root(void)
 {
-	return my_zero_pfn(0) << PAGE_SHIFT;
+	return zero_pfn(0) << PAGE_SHIFT;
 }
 
 static inline bool kvm_mmu_is_dummy_root(hpa_t shadow_page)
diff --git a/fs/dax.c b/fs/dax.c
index 289e6254aa30..b78cff9c91b3 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1360,7 +1360,7 @@ static vm_fault_t dax_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 {
 	struct inode *inode = iter->inode;
 	unsigned long vaddr = vmf->address;
-	unsigned long pfn = my_zero_pfn(vaddr);
+	unsigned long pfn = zero_pfn(vaddr);
 	vm_fault_t ret;
 
 	*entry = dax_insert_entry(xas, vmf, iter, *entry, pfn, DAX_ZERO_PAGE);
diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
index f188bd900eb2..44d15436439f 100644
--- a/fs/proc/vmcore.c
+++ b/fs/proc/vmcore.c
@@ -525,7 +525,7 @@ static int remap_oldmem_pfn_checked(struct vm_area_struct *vma,
 {
 	unsigned long map_size;
 	unsigned long pos_start, pos_end, pos;
-	unsigned long zeropage_pfn = my_zero_pfn(0);
+	unsigned long zeropage_pfn = zero_pfn(0);
 	size_t len = 0;
 
 	pos_start = pfn;
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 08a88b0d56e5..a965e2f8b8de 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1882,27 +1882,36 @@ static inline void pfnmap_setup_cachemode_pfn(unsigned long pfn, pgprot_t *prot)
 	pfnmap_setup_cachemode(pfn, PAGE_SIZE, prot);
 }
 
+/*
+ * ZERO_PAGE() is global shared page(s) that is always zero. It is used for
+ * zero-mapped memory areas, CoW etc.
+ *
+ * On architectures that __HAVE_COLOR_ZERO_PAGE there are several such pages
+ * for different ranges in the virtual address space.
+ *
+ * zero_page_pfn identifies the first (or the only) pfn for these pages.
+ */
+extern unsigned long zero_page_pfn;
+
 #ifdef __HAVE_COLOR_ZERO_PAGE
 static inline int is_zero_pfn(unsigned long pfn)
 {
-	extern unsigned long zero_pfn;
-	unsigned long offset_from_zero_pfn = pfn - zero_pfn;
+	unsigned long offset_from_zero_pfn = pfn - zero_page_pfn;
+
 	return offset_from_zero_pfn <= (zero_page_mask >> PAGE_SHIFT);
 }
 
-#define my_zero_pfn(addr)	page_to_pfn(ZERO_PAGE(addr))
+#define zero_pfn(addr)	page_to_pfn(ZERO_PAGE(addr))
 
 #else
 static inline int is_zero_pfn(unsigned long pfn)
 {
-	extern unsigned long zero_pfn;
-	return pfn == zero_pfn;
+	return pfn == zero_page_pfn;
 }
 
-static inline unsigned long my_zero_pfn(unsigned long addr)
+static inline unsigned long zero_pfn(unsigned long addr)
 {
-	extern unsigned long zero_pfn;
-	return zero_pfn;
+	return zero_page_pfn;
 }
 #endif /* __HAVE_COLOR_ZERO_PAGE */
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 44ff8a648afd..bc15fd152526 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2968,7 +2968,7 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
 	for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 		pte_t entry;
 
-		entry = pfn_pte(my_zero_pfn(addr), vma->vm_page_prot);
+		entry = pfn_pte(zero_pfn(addr), vma->vm_page_prot);
 		entry = pte_mkspecial(entry);
 		if (pmd_uffd_wp(old_pmd))
 			entry = pte_mkuffd_wp(entry);
diff --git a/mm/memory.c b/mm/memory.c
index 51d2018a387a..ae610afa9cea 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5165,7 +5165,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	/* Use the zero-page for reads */
 	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
 			!mm_forbids_zeropage(vma->vm_mm)) {
-		entry = pte_mkspecial(pfn_pte(my_zero_pfn(vmf->address),
+		entry = pte_mkspecial(pfn_pte(zero_pfn(vmf->address),
 						vma->vm_page_prot));
 		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
 				vmf->address, &vmf->ptl);
diff --git a/mm/migrate.c b/mm/migrate.c
index 1bf2cf8c44dd..739c4e03769b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -321,7 +321,7 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 	if (!pages_identical(page, ZERO_PAGE(0)))
 		return false;
 
-	newpte = pte_mkspecial(pfn_pte(my_zero_pfn(pvmw->address),
+	newpte = pte_mkspecial(pfn_pte(zero_pfn(pvmw->address),
 					pvmw->vma->vm_page_prot));
 
 	if (pte_swp_soft_dirty(old_pte))
diff --git a/mm/mm_init.c b/mm/mm_init.c
index dcf9eff34f83..a0ca236eb4f5 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -53,8 +53,8 @@ EXPORT_SYMBOL(mem_map);
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
 
-unsigned long zero_pfn __ro_after_init;
-EXPORT_SYMBOL(zero_pfn);
+unsigned long zero_page_pfn __ro_after_init;
+EXPORT_SYMBOL(zero_page_pfn);
 
 #ifdef CONFIG_DEBUG_MEMORY_INIT
 int __meminitdata mminit_loglevel;
@@ -2670,12 +2670,12 @@ static void __init mem_init_print_info(void)
 		);
 }
 
-static int __init init_zero_pfn(void)
+static int __init init_zero_page_pfn(void)
 {
-	zero_pfn = page_to_pfn(ZERO_PAGE(0));
+	zero_page_pfn = page_to_pfn(ZERO_PAGE(0));
 	return 0;
 }
-early_initcall(init_zero_pfn);
+early_initcall(init_zero_page_pfn);
 
 void __init __weak arch_mm_preinit(void)
 {
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 927086bb4a3c..e19872e51878 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -357,7 +357,7 @@ static int mfill_atomic_pte_zeropage(pmd_t *dst_pmd,
 	if (mm_forbids_zeropage(dst_vma->vm_mm))
 		return mfill_atomic_pte_zeroed_folio(dst_pmd, dst_vma, dst_addr);
 
-	_dst_pte = pte_mkspecial(pfn_pte(my_zero_pfn(dst_addr),
+	_dst_pte = pte_mkspecial(pfn_pte(zero_pfn(dst_addr),
 					 dst_vma->vm_page_prot));
 	ret = -EAGAIN;
 	dst_pte = pte_offset_map_lock(dst_vma->vm_mm, dst_pmd, dst_addr, &ptl);
@@ -1229,7 +1229,7 @@ static int move_zeropage_pte(struct mm_struct *mm,
 		return -EAGAIN;
 	}
 
-	zero_pte = pte_mkspecial(pfn_pte(my_zero_pfn(dst_addr),
+	zero_pte = pte_mkspecial(pfn_pte(zero_pfn(dst_addr),
 					 dst_vma->vm_page_prot));
 	ptep_clear_flush(src_vma, src_addr, src_pte);
 	set_pte_at(mm, dst_addr, dst_pte, zero_pte);
-- 
2.51.0


