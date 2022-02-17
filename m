Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413134B9FD9
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Feb 2022 13:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235932AbiBQMNC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Feb 2022 07:13:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239451AbiBQMNB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Feb 2022 07:13:01 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4942AE20
        for <linux-parisc@vger.kernel.org>; Thu, 17 Feb 2022 04:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645099960;
        bh=mIdgiUm8SRqMv9C/YMIEpsaRCjA3xMOMPxaLFhpkBoc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=G1EeNedvZCYohyWV0ckJ5N6SOant0/y5mbFrYWSayQFcysFiN2jO6p/oA37el3IFC
         +iuKERaElys6j802wjkmaYjXy4u1pRvbXhuDBjKyM2gMi0ueQTuETqFNTW6mTqFuFb
         Nl1uWp1xbMiO3QUho/lItivNtP0PeCsNTuqiFr58=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.175.13]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4z6k-1oJLJ61Cqa-010tlJ; Thu, 17
 Feb 2022 13:12:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 1/2] parisc: Use constants to encode the space registers like PRIV_KERNEL
Date:   Thu, 17 Feb 2022 13:12:38 +0100
Message-Id: <20220217121239.158611-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NdXUqog88Dattb7GNX8wjArCeWNb2kx8KTUrQ2dD27JzFvOnlp7
 uU6/ywiRfb24/hcTiOJ1KRAL2ZLWEubic3ny5Q70ndxJBV/KISqOcpLBnMZNql4KMExr0vm
 6JV/gY1WTzjwFDFds3b1AQxZwohBvAdyxLLOeNTakBZ+jxN2IVGM3iAOomj7CWJp6+M41/9
 05O/BKkvrZ5hjvUV1QswQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BW5CBKmIIww=:Ba+IwXvvh66NlpwpyIKFyd
 FzlESL0rwRUDrHkdsgJs1CskDi4z4uE/X3kqng8Knb4DEoY52MGIyQazmDXdr7qPSsad//PSn
 vHdaE/NSfeRN5mJ1lUDgABKRVaaRfgwwoIZN6OqS2wwbxCC3SbAI4+hvMtYRwl4CJVw4O85pm
 /LV+8F1hJbHER+0/SLv+l55WFhOYAFzB0rpC1xkPWSOhysUJa0cW9Ff/ALykbGUVRfu9LfXx+
 XMl7xeCCexXA87ny45DCGwTwcAlQoMRHgSFBgQWx0b/PN1dCchvQMc96OJzTsFqSUSN2VPS4H
 YC5znDdsqq8u0tGqOmkY+sna2fn6ujuUCms7D5xI2aIFXCNfv+KT2LoO0/FW9+xVtDV5i3w0H
 xb1cTRyDIULU0b7xbvnTnf/UwMPvIphvSSjFliNJrjMy1W7j6nLOpOhgRpwUEvCw+Ffd2Wod9
 3ZQjU6/I+85LENfYpPf++uThLxe4//i+8ASgZfAT65F8f6oVfQYnvpPqUJ9AJQn5Y7Sd05O5U
 5WnnpOfUv77L+1NWb7dMBgzb5yh1WfKnXUU14G1CzjhnsncBu7wAjip5sJXjbHFvm0NcIbazB
 JyT8GZZBb3CAHKuSWTl3BGwfjfsIBG0uf3xlw7ZL3hu0y6S4t2KhvS2XSjROPBcxENGzsz6oM
 IQjHV846RZQb78eQ9DlMjQWPGwV9klyC3RyopNmZ1L+WcZCiK7YUgbVvtyJv65YAlzry79MC7
 lyv5hIqOD8YJgdopeoArLGsuqTyMaokbdIx92hD7la9ZRN9TSLFF+czHwT4Z3ElSXVokJburp
 N5NIZTtqPQ2Mttw8Gdj5/PNufjpdm37+jpl6b5G0mp3BcgN9FKm0nRY2HDfoJ3Tw+NYOZlzpn
 HqaDdBLrN9vqWvMBfqfKQZ3yfoMrB5hIwx999yRh9noAaqIr8yyRtFb9f4FxVw7wRMMqBOVws
 m5+BfqhTNeWyiQuaSj/E3kg3CoIN/ikC1oLe6fAGpPiXF2axjV5cASNwaZFKff9KINL6OTUQc
 BvNPOsS9l0R2YQLgnAzkweikZeuYNQAPwBH/wCsJfK74M8qBu1Wu9cGq1Ej8quEBCUH0QxdOh
 BhJdbL60jnQKDs=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Instead of hardcoding various space registers, use the space register
constants. Introduce PRIV_TEMP1 and PRIV_TEMP2 for %sr1 and %sr2.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/assembly.h      |  7 +++++--
 arch/parisc/include/asm/cache.h         | 11 ++++-------
 arch/parisc/include/asm/mmu_context.h   |  2 +-
 arch/parisc/include/asm/pgtable.h       |  6 +++---
 arch/parisc/include/asm/special_insns.h |  4 ++--
 arch/parisc/kernel/cache.c              |  8 ++++----
 arch/parisc/kernel/pci-dma.c            |  4 ++--
 arch/parisc/lib/memcpy.c                | 16 ++++++++--------
 8 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index 6369082c6c74..a9b4c7c790db 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -43,9 +43,12 @@
 #define PA_ASM_LEVEL	1.1
 #endif

-/* Privilege level field in the rightmost two bits of the IA queues */
-#define PRIV_USER	3
+/* Various space registers used in the kernel, additionally used to encod=
e the
+ * privilege level field in the rightmost two bits of the IA queues. */
 #define PRIV_KERNEL	0
+#define PRIV_TEMP1	1
+#define PRIV_TEMP2	2
+#define PRIV_USER	3

 #ifdef __ASSEMBLY__

diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cac=
he.h
index d53e9e27dba0..5032e758594e 100644
=2D-- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -39,16 +39,13 @@ extern int icache_stride;
 extern struct pdc_cache_info cache_info;
 void parisc_setup_cache_timing(void);

-#define pdtlb(addr)	asm volatile("pdtlb 0(%%sr1,%0)" \
+#define pdtlb(sr, addr)	asm volatile("pdtlb 0(%%sr%0,%1)" \
 			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
-			: : "r" (addr) : "memory")
-#define pitlb(addr)	asm volatile("pitlb 0(%%sr1,%0)" \
+			: : "i"(sr), "r" (addr) : "memory")
+#define pitlb(sr, addr)	asm volatile("pitlb 0(%%sr%0,%1)" \
 			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
 			ALTERNATIVE(ALT_COND_NO_SPLIT_TLB, INSN_NOP) \
-			: : "r" (addr) : "memory")
-#define pdtlb_kernel(addr)  asm volatile("pdtlb 0(%0)"   \
-			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
-			: : "r" (addr) : "memory")
+			: : "i"(sr), "r" (addr) : "memory")

 #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
 			ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/a=
sm/mmu_context.h
index 726257648d9f..eaf29632c3ce 100644
=2D-- a/arch/parisc/include/asm/mmu_context.h
+++ b/arch/parisc/include/asm/mmu_context.h
@@ -43,7 +43,7 @@ static inline unsigned long __space_to_prot(mm_context_t=
 context)

 static inline void load_context(mm_context_t context)
 {
-	mtsp(context, 3);
+	mtsp(context, PRIV_USER);
 	mtctl(__space_to_prot(context), 8);
 }

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/p=
gtable.h
index 3e7cf882639f..fac6babb1e68 100644
=2D-- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -70,9 +70,9 @@ static inline void purge_tlb_entries(struct mm_struct *m=
m, unsigned long addr)
 	unsigned long flags;

 	purge_tlb_start(flags);
-	mtsp(mm->context, 1);
-	pdtlb(addr);
-	pitlb(addr);
+	mtsp(mm->context, PRIV_TEMP1);
+	pdtlb(PRIV_TEMP1, addr);
+	pitlb(PRIV_TEMP1, addr);
 	purge_tlb_end(flags);
 }

diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/include=
/asm/special_insns.h
index 16ee41e77174..41b3ddbd344c 100644
=2D-- a/arch/parisc/include/asm/special_insns.h
+++ b/arch/parisc/include/asm/special_insns.h
@@ -55,8 +55,8 @@ static inline void set_eiem(unsigned long val)
 #define mfsp(reg)	({		\
 	unsigned long cr;		\
 	__asm__ __volatile__(		\
-		"mfsp " #reg ",%0" :	\
-		 "=3Dr" (cr)		\
+		"mfsp %%sr%1,%0"	\
+		: "=3Dr" (cr) : "i"(reg)	\
 	);				\
 	cr;				\
 })
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 94150b91c96f..00ed9d57198c 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -457,7 +457,7 @@ void flush_kernel_dcache_page_addr(void *addr)

 	flush_kernel_dcache_page_asm(addr);
 	purge_tlb_start(flags);
-	pdtlb_kernel(addr);
+	pdtlb(PRIV_KERNEL, addr);
 	purge_tlb_end(flags);
 }
 EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
@@ -496,9 +496,9 @@ int __flush_tlb_range(unsigned long sid, unsigned long=
 start,
 	   but cause a purge request to be broadcast to other TLBs.  */
 	while (start < end) {
 		purge_tlb_start(flags);
-		mtsp(sid, 1);
-		pdtlb(start);
-		pitlb(start);
+		mtsp(sid, PRIV_TEMP1);
+		pdtlb(PRIV_TEMP1, start);
+		pitlb(PRIV_TEMP1, start);
 		purge_tlb_end(flags);
 		start +=3D PAGE_SIZE;
 	}
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 36a57aa38e87..7f9b05d36789 100644
=2D-- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -91,7 +91,7 @@ static inline int map_pte_uncached(pte_t * pte,
 			printk(KERN_ERR "map_pte_uncached: page already exists\n");
 		purge_tlb_start(flags);
 		set_pte(pte, __mk_pte(*paddr_ptr, PAGE_KERNEL_UNC));
-		pdtlb_kernel(orig_vaddr);
+		pdtlb(PRIV_KERNEL, orig_vaddr);
 		purge_tlb_end(flags);
 		vaddr +=3D PAGE_SIZE;
 		orig_vaddr +=3D PAGE_SIZE;
@@ -175,7 +175,7 @@ static inline void unmap_uncached_pte(pmd_t * pmd, uns=
igned long vaddr,

 		pte_clear(&init_mm, vaddr, pte);
 		purge_tlb_start(flags);
-		pdtlb_kernel(orig_vaddr);
+		pdtlb(PRIV_KERNEL, orig_vaddr);
 		purge_tlb_end(flags);
 		vaddr +=3D PAGE_SIZE;
 		orig_vaddr +=3D PAGE_SIZE;
diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index ea70a0e08321..a32695eb56fa 100644
=2D-- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -13,8 +13,8 @@
 #include <linux/compiler.h>
 #include <linux/uaccess.h>

-#define get_user_space() (uaccess_kernel() ? 0 : mfsp(3))
-#define get_kernel_space() (0)
+#define get_user_space()	mfsp(PRIV_USER)
+#define get_kernel_space()	PRIV_KERNEL

 /* Returns 0 for success, otherwise, returns number of bytes not transfer=
red. */
 extern unsigned long pa_memcpy(void *dst, const void *src,
@@ -23,8 +23,8 @@ extern unsigned long pa_memcpy(void *dst, const void *sr=
c,
 unsigned long raw_copy_to_user(void __user *dst, const void *src,
 			       unsigned long len)
 {
-	mtsp(get_kernel_space(), 1);
-	mtsp(get_user_space(), 2);
+	mtsp(get_kernel_space(), PRIV_TEMP1);
+	mtsp(get_user_space(), PRIV_TEMP2);
 	return pa_memcpy((void __force *)dst, src, len);
 }
 EXPORT_SYMBOL(raw_copy_to_user);
@@ -32,16 +32,16 @@ EXPORT_SYMBOL(raw_copy_to_user);
 unsigned long raw_copy_from_user(void *dst, const void __user *src,
 			       unsigned long len)
 {
-	mtsp(get_user_space(), 1);
-	mtsp(get_kernel_space(), 2);
+	mtsp(get_user_space(), PRIV_TEMP1);
+	mtsp(get_kernel_space(), PRIV_TEMP2);
 	return pa_memcpy(dst, (void __force *)src, len);
 }
 EXPORT_SYMBOL(raw_copy_from_user);

 void * memcpy(void * dst,const void *src, size_t count)
 {
-	mtsp(get_kernel_space(), 1);
-	mtsp(get_kernel_space(), 2);
+	mtsp(get_kernel_space(), PRIV_TEMP1);
+	mtsp(get_kernel_space(), PRIV_TEMP2);
 	pa_memcpy(dst, src, count);
 	return dst;
 }
=2D-
2.34.1

