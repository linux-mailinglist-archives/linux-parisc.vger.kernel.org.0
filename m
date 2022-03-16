Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C264DBA09
	for <lists+linux-parisc@lfdr.de>; Wed, 16 Mar 2022 22:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241578AbiCPVUg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 16 Mar 2022 17:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345919AbiCPVUg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 16 Mar 2022 17:20:36 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71CD33E97
        for <linux-parisc@vger.kernel.org>; Wed, 16 Mar 2022 14:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647465551;
        bh=rToIX6tdUSwCwagKiJ2P3VLLKNSqwgTqJW1yBXWEExI=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=HxjvD6Jp+Hc3LTIOGcBZL7wE5dyIb2Al7SJ3C1Mxybm9gZLqOPzyDkH8QO8/NT9I7
         BcCVWnl2PRo3j6a6OjN03O0jfsAFOGdkRTVJrdhzE1spQlk1QWVL4a5Dj5oyoxqo2T
         z4sv2eXId8yVk1MdYknXKExAmnQICQG/+VZxbdNo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.188.58]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC30Z-1nPPaU0PeP-00CQVH; Wed, 16
 Mar 2022 22:19:11 +0100
Date:   Wed, 16 Mar 2022 22:19:08 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v2] parisc: Avoid calling SMP cache flush functions on
 cache-less machines
Message-ID: <YjJUTOEvEpaV28Ja@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:bzjPiSuYy44YhGUA/wT5H+15Fe2TBdRpW5EAXv9yOmhD0v+VnjY
 AjJux6aHWbMm0//8PzezJtl75tiatU/6HzIhGpWUJES3s8AHUB/h4qSIRgqt8EbH4zGGkz3
 k7vCLpc40QwHBRnbgIHKmkKMTTuVwL/P+5/QVVaTYIb9IiMgs9gOg48B/8OxyYK6/fwUoQR
 wXE+7jY0EM0qoAZmPUetQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FAgogg9rhZs=:wO3OQj+gnByd7bP0AXMx6Q
 JPGtMUGGqL/7nFNjCOe2P8leUsT22v2OHmaI+uz0RzaWwJbJ2Uo6XlbTMB1aykUrtEniY6Gbl
 tcInQuVpw+6lxP3GLBJUNsGdP+hWgYdHV2XaQYY71JKTHn/zBp+sjUoki5zuCHCUz1/5KIyK3
 ruwNxxgJlGUmzLCxSapBRrLe9Ey53cdOTrs5FBMTQD6D0jQ8U3kVY/FCFYuLQzYOmo1doMa2M
 QLr7J3U7f1e9SLBn2RisvJOExV3xglkbuL2ObcvHYuzUsKofiv5hx5OIfNoQ2lQW/9LB/TgjD
 EVG/zNkyKyCEDuuupcOHy7kV25LdRIhc1hSdcHaE5au3gfiwOeWW9cZ+CAyWqZ4faVPUsOvgK
 VN2uFEEtRQgmmjmO60am3GyVBlIWiqTnVyEV3XU97XkN7LQsVdmIKeeql3c5a9OF5xMbfcq9k
 e89yFY2ouvhX2In0M2vPR69iK+q5mbpas/S2QxZDgcJMXNCQBk3mEgRGMpSWB8pPh7EDNu+Mz
 btfy3RT3ukvXyf+Jz210cg3aNAzdl+0zw1BZkZfF/qXkXzYfuMcuAE4m1MDypnrMhOP8m0LqR
 AbwwiYKuoxfJe2s2r9p7LqNMMBYvM8yMzAZ5/w6t9vo5GxDKgWwAlqmfg90nJkLgJYlnnfQbq
 3kMcJX/2yww6uHM8vgU1z9S45z7zZzb4a40cSBaqNk0Q00S9aD/Kjleo7BEjyv11upgXifgWC
 YJY8IqG7Sba7ImH5/keXZzolyhNnJncDcJB9cP9YO+lw6ySkMFdUtzGyjzJu+QvS1O7owscb5
 mXwjVZDaRdiePfXKyxVDYvoKD5OYX/rKrS19LM/wDKEjEjurYpvVGtYgIbVOfifya97yU1D8D
 9p8ZaoCwhfI1IrCdo9bAmFrJl3Wp9PAgeR6U0yqqotx0MpnGQ9mT3hWLmpI3sR2oF+exDGUq0
 eRRgHo8rn4akMQEDPlmlk+kNLBU8FG+Dw9Pv7SMjvKZQSv1NMXcgShQ+HorBch0LPwSbGXruJ
 OqZ0ThD1vqkRfathwNli6zqJrz2jaGSdrd4lkG5dL31tzjNALQBEfLC7jux3dN/Y4ePJcXMm2
 1SrEwaWlyJcj9k=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

At least the qemu virtual machine does not provide D- and I-caches,
so skip triggering SMP irqs to flush caches on such machines.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D-
v2: rewrite with static keys as suggested by Sven Schnelle, and rework all
    cache functions (e.g. make many static)

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/as=
m/cacheflush.h
index 859b8a34adcf..e8b4a03343d3 100644
=2D-- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -9,16 +9,11 @@
 /* The usual comment is "Caches aren't brain-dead on the <architecture>".
  * Unfortunately, that doesn't apply to PA-RISC. */

-/* Internal implementation */
-void flush_data_cache_local(void *);  /* flushes local data-cache only */
-void flush_instruction_cache_local(void *); /* flushes local code-cache o=
nly */
-#ifdef CONFIG_SMP
-void flush_data_cache(void); /* flushes data-cache only (all processors) =
*/
-void flush_instruction_cache(void); /* flushes i-cache only (all processo=
rs) */
-#else
-#define flush_data_cache() flush_data_cache_local(NULL)
-#define flush_instruction_cache() flush_instruction_cache_local(NULL)
-#endif
+#include <linux/jump_label.h>
+
+DECLARE_STATIC_KEY_TRUE(parisc_has_cache);
+DECLARE_STATIC_KEY_TRUE(parisc_has_dcache);
+DECLARE_STATIC_KEY_TRUE(parisc_has_icache);

 #define flush_cache_dup_mm(mm) flush_cache_mm(mm)

diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alterna=
tive.c
index fa28c4c9f972..daa1e9047275 100644
=2D-- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -8,6 +8,7 @@
 #include <asm/processor.h>
 #include <asm/sections.h>
 #include <asm/alternative.h>
+#include <asm/cacheflush.h>

 #include <linux/module.h>

@@ -107,5 +108,14 @@ void __init apply_alternatives_all(void)
 	apply_alternatives((struct alt_instr *) &__alt_instructions,
 		(struct alt_instr *) &__alt_instructions_end, NULL);

+	if (cache_info.dc_size =3D=3D 0 && cache_info.ic_size =3D=3D 0) {
+		pr_info("alternatives: optimizing cache-flushes.\n");
+		static_branch_disable(&parisc_has_cache);
+	}
+	if (cache_info.dc_size =3D=3D 0)
+		static_branch_disable(&parisc_has_dcache);
+	if (cache_info.ic_size =3D=3D 0)
+		static_branch_disable(&parisc_has_icache);
+
 	set_kernel_text_rw(0);
 }
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 81f36d6407f0..46914dc37813 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -38,6 +38,9 @@ EXPORT_SYMBOL(flush_dcache_page_asm);
 void purge_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
 void flush_icache_page_asm(unsigned long phys_addr, unsigned long vaddr);

+/* Internal implementation in arch/parisc/kernel/pacache.S */
+void flush_data_cache_local(void);  /* flushes local data-cache only */
+void flush_instruction_cache_local(void); /* flushes local code-cache onl=
y */

 /* On some machines (i.e., ones with the Merced bus), there can be
  * only a single PxTLB broadcast at a time; this must be guaranteed
@@ -58,26 +61,28 @@ struct pdc_cache_info cache_info __ro_after_init;
 static struct pdc_btlb_info btlb_info __ro_after_init;
 #endif

-#ifdef CONFIG_SMP
-void
-flush_data_cache(void)
+DEFINE_STATIC_KEY_TRUE(parisc_has_cache);
+DEFINE_STATIC_KEY_TRUE(parisc_has_dcache);
+DEFINE_STATIC_KEY_TRUE(parisc_has_icache);
+
+static void cache_flush_local_cpu(void *dummy)
 {
-	on_each_cpu(flush_data_cache_local, NULL, 1);
+	if (static_branch_likely(&parisc_has_icache))
+		flush_instruction_cache_local();
+	if (static_branch_likely(&parisc_has_dcache))
+		flush_data_cache_local();
 }
-void
-flush_instruction_cache(void)
+
+void flush_cache_all_local(void)
 {
-	on_each_cpu(flush_instruction_cache_local, NULL, 1);
+	cache_flush_local_cpu(NULL);
 }
-#endif

-void
-flush_cache_all_local(void)
+void flush_cache_all(void)
 {
-	flush_instruction_cache_local(NULL);
-	flush_data_cache_local(NULL);
+	if (static_branch_likely(&parisc_has_cache))
+		on_each_cpu(cache_flush_local_cpu, NULL, 1);
 }
-EXPORT_SYMBOL(flush_cache_all_local);

 /* Virtual address of pfn.  */
 #define pfn_va(pfn)	__va(PFN_PHYS(pfn))
@@ -375,7 +380,6 @@ EXPORT_SYMBOL(flush_dcache_page);

 /* Defined in arch/parisc/kernel/pacache.S */
 EXPORT_SYMBOL(flush_kernel_dcache_range_asm);
-EXPORT_SYMBOL(flush_data_cache_local);
 EXPORT_SYMBOL(flush_kernel_icache_range_asm);

 #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
@@ -391,7 +395,7 @@ void __init parisc_setup_cache_timing(void)
 	unsigned long threshold, threshold2;

 	alltime =3D mfctl(16);
-	flush_data_cache();
+	flush_cache_all();
 	alltime =3D mfctl(16) - alltime;

 	size =3D (unsigned long)(_end - _text);
@@ -517,16 +521,6 @@ int __flush_tlb_range(unsigned long sid, unsigned lon=
g start,
 	return 0;
 }

-static void cacheflush_h_tmp_function(void *dummy)
-{
-	flush_cache_all_local();
-}
-
-void flush_cache_all(void)
-{
-	on_each_cpu(cacheflush_h_tmp_function, NULL, 1);
-}
-
 static inline unsigned long mm_total_size(struct mm_struct *mm)
 {
 	struct vm_area_struct *vma;
@@ -623,7 +617,7 @@ void flush_kernel_vmap_range(void *vaddr, int size)
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
 		flush_tlb_kernel_range(start, end);
-		flush_data_cache();
+		flush_cache_all();
 		return;
 	}

@@ -640,7 +634,7 @@ void invalidate_kernel_vmap_range(void *vaddr, int siz=
e)
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
 		flush_tlb_kernel_range(start, end);
-		flush_data_cache();
+		flush_cache_all();
 		return;
 	}

