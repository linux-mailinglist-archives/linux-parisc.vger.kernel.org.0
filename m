Return-Path: <linux-parisc+bounces-4563-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEUoFm5bjGnelgAAu9opvQ
	(envelope-from <linux-parisc+bounces-4563-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Feb 2026 11:35:26 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5A123706
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Feb 2026 11:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D78A630541E1
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Feb 2026 10:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037CA367F36;
	Wed, 11 Feb 2026 10:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFe7/nLN"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1576346FA1;
	Wed, 11 Feb 2026 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805934; cv=none; b=F+G7t1Xe1iDw4AOsrmVM8hbqKlK/Z/UCVHOugCzSFQDc6iJIj22lrrDqjQY8/cBoS1mGnvbeYTOu0KtuN81RNsMJ4W3jPL/vWkvrCrz57MNzVhAJhlKbzj+yGQuhCUe/3ZVjyjmLDOoUZ2Svi45kW07r8Hls4lSZObzJRT5ofa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805934; c=relaxed/simple;
	bh=IrP0HcvbxJyr+QPUUgTWRvTOZExBIyn/P520HSFeTE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rdw/2Yz/3Zj4ODbo75y3+TK2sqojW+N/gkOsZprdqu+BGTCDC1ZSzFzEvzrYzJiFxdLnIVkwiJtt/rnvnokvm8qB0l/P2FAVbLBEJ9Ku9MW+qzPKabo+VAGMWFd1rxrWLBpREPOcTaNDW2LWcCmkiKT+CMiL3mJFUEXeDZ/s/rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFe7/nLN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BD6C4CEF7;
	Wed, 11 Feb 2026 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770805934;
	bh=IrP0HcvbxJyr+QPUUgTWRvTOZExBIyn/P520HSFeTE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TFe7/nLN+rKkMzW67S9vCNdZrax/kPne+WpMF87k95gqGlUzqF+fR5WSEUhJQdT3j
	 pPxb8u1Ax2zDRwbXDSOUkXQnSyyGT9ATA7S3mMXNx2TRCmDY+UML8uqdt2x5uN5KOn
	 Myw0c7iyqZfsQ6nIDluj/Ct6feChieIpAVe31sKpg0gTQ8BQT8IA1FdMJRou60J6Id
	 rBVyOi00C1KINFPks7VJijlaVTWk5jn2wnNxzaifUW5ZIAAy72z1/aL01QcnnfNWRP
	 Oom4Kb7P8HeZb9qPQLur3tBkv0FhMqGVt2yWCiPLRGAsku2RHRh3DuKoejRqRBa2Dx
	 Gdc7juu6vCfng==
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
Subject: [PATCH v3 1/4] mm: don't special case !MMU for is_zero_pfn() and my_zero_pfn()
Date: Wed, 11 Feb 2026 12:31:38 +0200
Message-ID: <20260211103141.3215197-2-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211103141.3215197-1-rppt@kernel.org>
References: <20260211103141.3215197-1-rppt@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4563-lists,linux-parisc=lfdr.de];
	FREEMAIL_CC(0.00)[gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-parisc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[53];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-parisc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02E5A123706
X-Rspamd-Action: no action

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

nommu architectures have empty_zero_page and define ZERO_PAGE() and
although they don't really use it to populate page tables, there is no
reason to hardwire !MMU implementation of is_zero_pfn() and my_zero_pfn()
to 0.

Drop #ifdef CONFIG_MMU around implementations of is_zero_pfn() and
my_zero_pfn() and remove !MMU version.

While on it, make zero_pfn __ro_after_init.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/pgtable.h | 14 +-------------
 mm/memory.c             | 13 -------------
 mm/mm_init.c            | 10 ++++++++++
 3 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 827dca25c0bc..08a88b0d56e5 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1882,7 +1882,6 @@ static inline void pfnmap_setup_cachemode_pfn(unsigned long pfn, pgprot_t *prot)
 	pfnmap_setup_cachemode(pfn, PAGE_SIZE, prot);
 }
 
-#ifdef CONFIG_MMU
 #ifdef __HAVE_COLOR_ZERO_PAGE
 static inline int is_zero_pfn(unsigned long pfn)
 {
@@ -1905,18 +1904,7 @@ static inline unsigned long my_zero_pfn(unsigned long addr)
 	extern unsigned long zero_pfn;
 	return zero_pfn;
 }
-#endif
-#else
-static inline int is_zero_pfn(unsigned long pfn)
-{
-	return 0;
-}
-
-static inline unsigned long my_zero_pfn(unsigned long addr)
-{
-	return 0;
-}
-#endif /* CONFIG_MMU */
+#endif /* __HAVE_COLOR_ZERO_PAGE */
 
 #ifdef CONFIG_MMU
 
diff --git a/mm/memory.c b/mm/memory.c
index 187f16b7e996..51d2018a387a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -162,21 +162,8 @@ static int __init disable_randmaps(char *s)
 }
 __setup("norandmaps", disable_randmaps);
 
-unsigned long zero_pfn __read_mostly;
-EXPORT_SYMBOL(zero_pfn);
-
 unsigned long highest_memmap_pfn __read_mostly;
 
-/*
- * CONFIG_MMU architectures set up ZERO_PAGE in their paging_init()
- */
-static int __init init_zero_pfn(void)
-{
-	zero_pfn = page_to_pfn(ZERO_PAGE(0));
-	return 0;
-}
-early_initcall(init_zero_pfn);
-
 void mm_trace_rss_stat(struct mm_struct *mm, int member)
 {
 	trace_rss_stat(mm, member);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1a29a719af58..dcf9eff34f83 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -53,6 +53,9 @@ EXPORT_SYMBOL(mem_map);
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
 
+unsigned long zero_pfn __ro_after_init;
+EXPORT_SYMBOL(zero_pfn);
+
 #ifdef CONFIG_DEBUG_MEMORY_INIT
 int __meminitdata mminit_loglevel;
 
@@ -2667,6 +2670,13 @@ static void __init mem_init_print_info(void)
 		);
 }
 
+static int __init init_zero_pfn(void)
+{
+	zero_pfn = page_to_pfn(ZERO_PAGE(0));
+	return 0;
+}
+early_initcall(init_zero_pfn);
+
 void __init __weak arch_mm_preinit(void)
 {
 }
-- 
2.51.0


