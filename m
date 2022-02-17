Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987554BAB3B
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Feb 2022 21:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239368AbiBQUqR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Feb 2022 15:46:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiBQUqR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Feb 2022 15:46:17 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1986715DB0D
        for <linux-parisc@vger.kernel.org>; Thu, 17 Feb 2022 12:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645130755;
        bh=iauLLkQAvZVu/wa2QfqYvg2LylWC/9gKuNFnCKiCor0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=bncZfwjBVp1ohDzuz2zr67T2WPG+OgueSokKIBFpQZgZfW7vjKskIXeQ2m/1wHFJf
         vl+AnIIGQPcqLpfYtkdk50R/TGshUAzdDiRgu799+pzbo6S6mHvX1dH/wHhcfWzlDC
         psaW5pUAhXfGWZzXU9qLd8O15TzdoTvwjHlwf+aA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.175.13]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQv8x-1nfTTo23UN-00O00I; Thu, 17
 Feb 2022 21:45:55 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 3/4] parisc: Use constants to encode the space registers like SR_KERNEL
Date:   Thu, 17 Feb 2022 21:45:53 +0100
Message-Id: <20220217204554.305554-3-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217204554.305554-1-deller@gmx.de>
References: <20220217204554.305554-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bsb81psoXSBGvrKuVunFCkv948MrbtyWsgxiSY9vdkJCeqnwyEf
 DdbRgMRtuoS6ETCk8bPp5VS2YU7DUuXEb+T1e8bHWQOLtBLdKXUoqX0nEhNfNG7FfWBbIMr
 ZVXBZVgIZVSdenPbGI7lnKKS3vt8QisOKMkzs/4kF4vg9rayoldjww0O8dyG+D9lzDyHekb
 YmYbMdaUUw1/9QtIbXHtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:i0U393wdMOA=:AlroKLsjK0Y01zmTi5vaJs
 65lOZZtCp4lGQE1K1oxhBG+LYtPMkdKf4vJSV8gzFMdxA/5RiZ6eYbOIJ/tAw76iaFDKLmyY0
 aCnyIImkHJObhmK6AFQiP1Lk1VmQZ8DmYEP1G2pa0wirulUYxV2zpXgmxwurq2AjHRJT1wQzx
 gB6sLK4+uTFOOoSA9qR2+RXBK8uGp89c9H2qu9pFBM0054z+BsXAV/bkcpoOhd9/bi70AND5T
 IQfqSB2+ObhV3ZWNAUglzdG4tcI6TW6DWsAFfAyDrqi1Wf42WmcGqeB4Nkg0Jwj5BzAhzbYNb
 bRwHxxGSpBDQiqTU976SRtTGyGT0f9+vG88p8uJbV26hK8gVWDzJg4khsSUdayE26hp4eArTu
 O/yCv6/q5TsnI1FUP7askllU22JjWxm3BC4sWb9YvyIE84EmUve4EOo7cyjb21+ICFPkSspvU
 S3UpDrbihfBs9rHS3jV9UMRmsP/0/SaDrYLKLNJAbUPFJocTbCG0J3pRW5GEkmraiPVVKxJVk
 iCBq/smcmPI4tPxjQuGxax/D/WtIhDyXSuAPAyeKyp999Psi5gCULMyumN7YLVR/x02d53BS7
 AqBxrMdvone8qlC5/DesYg2MG4ggjCrb+cjS+tlucpikD77KJcwXTMwFryPq8e1TAeo3f2fcw
 dFgaKwynDAI1+MdCHlmbmIygbpHT1xBuHAoy/TZyqbyL+CYV5QAFdYBqCLdEUriU0BwxKsmVH
 KhGCTK0MiiLorkfzoVsVpkHWryaCyWC4cM6XsBBtsomsINSkcvt8q3P9ijDqSs11kf5iPvNsp
 Bsf5DHGoE0kGGd9VX27aqBtDN17vRjZrkU1sINgNbExvIcWw4FZCh0kHZnkilqFU7el/37qGM
 hwavVF8TYfe+yQ5tH9ydV3gAmlFoKKewYpRoP6m0bEOoSJflUulDbPH5shYgQJYC5ykbNs8FE
 zfgs3utJt15DWG+RikDfxX2Ht3iDWEp6VfnZd3iirPfoSczmocNBzqTRJhcvPAEg4EZZyziRI
 mYt1Vaox6xQaf8JexZQRO6Th40mIZbU3tHcVgS50c2hDZkH5/a5yU0av0a7vhBMcCSOMwBRUY
 L5XJxHGondJDOk=
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
constants. Introduce SR_TEMP1 and SR_TEMP2 for %sr1 and %sr2.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/cache.h         | 11 ++++-------
 arch/parisc/include/asm/mmu_context.h   |  2 +-
 arch/parisc/include/asm/pgtable.h       |  6 +++---
 arch/parisc/include/asm/special_insns.h |  4 ++--
 arch/parisc/kernel/cache.c              |  8 ++++----
 arch/parisc/kernel/pci-dma.c            |  4 ++--
 arch/parisc/lib/memcpy.c                | 16 ++++++++--------
 7 files changed, 24 insertions(+), 27 deletions(-)

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
index e788e995bd7a..c9187fe836a3 100644
=2D-- a/arch/parisc/include/asm/mmu_context.h
+++ b/arch/parisc/include/asm/mmu_context.h
@@ -43,7 +43,7 @@ static inline unsigned long __space_to_prot(mm_context_t=
 context)

 static inline void load_context(mm_context_t context)
 {
-	mtsp(context.space_id, 3);
+	mtsp(context.space_id, SR_USER);
 	mtctl(__space_to_prot(context), 8);
 }

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/p=
gtable.h
index f0393f00c2ff..7dff736936d0 100644
=2D-- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -70,9 +70,9 @@ static inline void purge_tlb_entries(struct mm_struct *m=
m, unsigned long addr)
 	unsigned long flags;

 	purge_tlb_start(flags);
-	mtsp(mm->context.space_id, 1);
-	pdtlb(addr);
-	pitlb(addr);
+	mtsp(mm->context.space_id, SR_TEMP1);
+	pdtlb(SR_TEMP1, addr);
+	pitlb(SR_TEMP1, addr);
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
index a08f8499b720..e7b8e74dad8e 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -457,7 +457,7 @@ void flush_kernel_dcache_page_addr(void *addr)

 	flush_kernel_dcache_page_asm(addr);
 	purge_tlb_start(flags);
-	pdtlb_kernel(addr);
+	pdtlb(SR_KERNEL, addr);
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
+		mtsp(sid, SR_TEMP1);
+		pdtlb(SR_TEMP1, start);
+		pitlb(SR_TEMP1, start);
 		purge_tlb_end(flags);
 		start +=3D PAGE_SIZE;
 	}
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 36a57aa38e87..160996f2198e 100644
=2D-- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -91,7 +91,7 @@ static inline int map_pte_uncached(pte_t * pte,
 			printk(KERN_ERR "map_pte_uncached: page already exists\n");
 		purge_tlb_start(flags);
 		set_pte(pte, __mk_pte(*paddr_ptr, PAGE_KERNEL_UNC));
-		pdtlb_kernel(orig_vaddr);
+		pdtlb(SR_KERNEL, orig_vaddr);
 		purge_tlb_end(flags);
 		vaddr +=3D PAGE_SIZE;
 		orig_vaddr +=3D PAGE_SIZE;
@@ -175,7 +175,7 @@ static inline void unmap_uncached_pte(pmd_t * pmd, uns=
igned long vaddr,

 		pte_clear(&init_mm, vaddr, pte);
 		purge_tlb_start(flags);
-		pdtlb_kernel(orig_vaddr);
+		pdtlb(SR_KERNEL, orig_vaddr);
 		purge_tlb_end(flags);
 		vaddr +=3D PAGE_SIZE;
 		orig_vaddr +=3D PAGE_SIZE;
diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index ea70a0e08321..5fc0c852c84c 100644
=2D-- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -13,8 +13,8 @@
 #include <linux/compiler.h>
 #include <linux/uaccess.h>

-#define get_user_space() (uaccess_kernel() ? 0 : mfsp(3))
-#define get_kernel_space() (0)
+#define get_user_space()	mfsp(SR_USER)
+#define get_kernel_space()	SR_KERNEL

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
+	mtsp(get_kernel_space(), SR_TEMP1);
+	mtsp(get_user_space(), SR_TEMP2);
 	return pa_memcpy((void __force *)dst, src, len);
 }
 EXPORT_SYMBOL(raw_copy_to_user);
@@ -32,16 +32,16 @@ EXPORT_SYMBOL(raw_copy_to_user);
 unsigned long raw_copy_from_user(void *dst, const void __user *src,
 			       unsigned long len)
 {
-	mtsp(get_user_space(), 1);
-	mtsp(get_kernel_space(), 2);
+	mtsp(get_user_space(), SR_TEMP1);
+	mtsp(get_kernel_space(), SR_TEMP2);
 	return pa_memcpy(dst, (void __force *)src, len);
 }
 EXPORT_SYMBOL(raw_copy_from_user);

 void * memcpy(void * dst,const void *src, size_t count)
 {
-	mtsp(get_kernel_space(), 1);
-	mtsp(get_kernel_space(), 2);
+	mtsp(get_kernel_space(), SR_TEMP1);
+	mtsp(get_kernel_space(), SR_TEMP2);
 	pa_memcpy(dst, src, count);
 	return dst;
 }
=2D-
2.34.1

