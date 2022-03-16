Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D894DBA5D
	for <lists+linux-parisc@lfdr.de>; Wed, 16 Mar 2022 22:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241506AbiCPVxW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 16 Mar 2022 17:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238373AbiCPVxV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 16 Mar 2022 17:53:21 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C2311A2E
        for <linux-parisc@vger.kernel.org>; Wed, 16 Mar 2022 14:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647467517;
        bh=L5q6xGLcUStxaDi9kH3mjcyGFoReock9WapThrg8J1Y=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=ByXbT/1pbnN9QXze6iuo36/Sbt39T0WqKC0G00wDV/uiw3GUHOrMFVQoDRwoDyPL7
         S8i43sCoqb7qRd280VCJSmR0sfxmcwyh1UJc2yWoamp2BYiqNeWJUC1kN4yJpal7vG
         aLDmVcd2oGDjtJ8W4ndFo34pcF/cL2N+j45hAiVA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.188.58]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1o2om92Mge-00h3t7; Wed, 16
 Mar 2022 22:51:57 +0100
Date:   Wed, 16 Mar 2022 22:51:55 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v3] parisc: Avoid calling SMP cache flush functions on
 cache-less machines
Message-ID: <YjJb+7vpPxs/u4x+@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:jB4DsPCF6Dv9A41v/9LnuPUc3XtFYz+KkNPtJURroO5Ai6JU07N
 twG8nXMxSSvth6rv8OK/kYLGKuuFWIx7J2Wy9eE1EvSqaGqh4AtpYI1oVxQYF10bS+hHvwX
 3vIv9UJA8wN0fX4AvC7l5N7D6Kp/vAVWB7a/zjtUE1lZvbSjJQlVilBts9LCY1If3XwHelr
 c2FhMLMx7w1BHM9AkjZ/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LBQbCHTG1YI=:g51RJtLYkEX4oju08PKCk9
 d0rXjeba1yOg1orvmZXaAtU0/l4bfGNSvHjrUThqqv78qN9DOWQPoZwvSxf//OndHpVbpvONO
 TJySKCxPWS/hUvm3gHnIAOdH2f8U/e2N+785hhK3VzrKUiKAzN1wIgY5/zgOLTJxlNR9+/tL/
 xDohIi1gojSoUkgKPjwdyI3oWM2JeFV7Duf8RymU+n1imgBFrZG7/JTAdRKKBuln3IfwdhvMt
 U5LmOmviiBAHZuvFPnAtfZlWrcWK6h8sxgpjkwQbbky0WY08m32t3u6A2/Sxtu2crUEVex1+H
 52PeVzSzIcFDIUbJ5v1Ahowqwz8wLY9dUGHqgzOrHD14AQXpcdznQzWKIYRup7BzZ6zTBMxsy
 sT4QixmAKzaghPoJ3k2LVm4zlGm0pGIlKkguESqo8VLIQz7fsK0wTCfzve9RxgeD3VfErxnHQ
 J0+eK2/k2jOfgMnZb5KNeQvDg/FU4xSGaYUvpe+6hn0j8sx/PCDB/X6JUdu4OnW4Exd7KLTr3
 5I1xk1IMdn1aFV18MncyVkTr85pYpw+8y2L3PHw4B3uuodEiLb3gFQqRH1HO6hgBB7ijmGsco
 kOwhlhKPAXKD4s/Geehoqic1qPKnT/4S1xRk6F2jh+PmNuMByo0gWXwV4F5M1WVUl24M6PS5z
 cMtQbadbFHErxI+hM1kxJQObkRbzJpaHHsKQEBHU5knsnyrAHzi8lXUM6SYEE52iewVhSy88K
 VxgSdRfxb+5Y+peez9R0QLeVCAkJybKlBV6xsWHnHsXVgf5AO0ZalcDJ6T3TTp0dgEDMsKUf8
 HBlEzjCWADcbcRIWBcGlF/2CP31AJ4iYi5B4kahmSZvsixYBEB4ShbwvbDvgDLENaIhIqGIFb
 iUthPjberHZoqgGgHOasHIqsWiNqAx8iWHXw6a4oqwrdzhS42QiTpAyalVtb7fE1bP+IDmZa0
 yOrti7fGlqNSY+Z67l9io479mJjwlEkyoAZqNSjqFvqCUKd2Cxq3LlTnAXnO7py29bw/lS8s9
 cPGyG4EnzGOPUbnchdlcRpK8pEGgPVPkYynZHMcfboteysrlTEI2TOnG+Ayl2/d2Lh04Ci4pK
 yW1D7ZZ4vv5ryo=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

At least the qemu virtual machine does not provide D- and I-caches,
so skip triggering SMP irqs to flush caches on such machines.

Further optimize the caching code by using static branches and making
some functions static.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--
v3: re-introduce flush_data_cache()
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
index 81f36d6407f0..231cebb3fc0d 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -38,6 +38,9 @@ EXPORT_SYMBOL(flush_dcache_page_asm);
 void purge_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
 void flush_icache_page_asm(unsigned long phys_addr, unsigned long vaddr);

+/* Internal implementation in arch/parisc/kernel/pacache.S */
+void flush_data_cache_local(void *);  /* flushes local data-cache only */
+void flush_instruction_cache_local(void); /* flushes local code-cache onl=
y */

 /* On some machines (i.e., ones with the Merced bus), there can be
  * only a single PxTLB broadcast at a time; this must be guaranteed
@@ -58,26 +61,35 @@ struct pdc_cache_info cache_info __ro_after_init;
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
+		flush_data_cache_local(NULL);
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
+{
+	if (static_branch_likely(&parisc_has_cache))
+		on_each_cpu(cache_flush_local_cpu, NULL, 1);
+}
+
+static inline void flush_data_cache(void)
 {
-	flush_instruction_cache_local(NULL);
-	flush_data_cache_local(NULL);
+	if (static_branch_likely(&parisc_has_dcache))
+		on_each_cpu(flush_data_cache_local, NULL, 1);
 }
-EXPORT_SYMBOL(flush_cache_all_local);
+

 /* Virtual address of pfn.  */
 #define pfn_va(pfn)	__va(PFN_PHYS(pfn))
@@ -375,7 +387,6 @@ EXPORT_SYMBOL(flush_dcache_page);

 /* Defined in arch/parisc/kernel/pacache.S */
 EXPORT_SYMBOL(flush_kernel_dcache_range_asm);
-EXPORT_SYMBOL(flush_data_cache_local);
 EXPORT_SYMBOL(flush_kernel_icache_range_asm);

 #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
@@ -517,16 +528,6 @@ int __flush_tlb_range(unsigned long sid, unsigned lon=
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
