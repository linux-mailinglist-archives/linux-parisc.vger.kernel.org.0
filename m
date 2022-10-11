Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2D25FAFBB
	for <lists+linux-parisc@lfdr.de>; Tue, 11 Oct 2022 11:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiJKJzG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 11 Oct 2022 05:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJKJzB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 11 Oct 2022 05:55:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0497B19C2F
        for <linux-parisc@vger.kernel.org>; Tue, 11 Oct 2022 02:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1665482095;
        bh=9MR/vIC10qIRft4WhPQ6QFDKGEwmCyQCBEVkhcEWjLY=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=eiFzRioyywNqT729iE+iIWOyAhbp3zdblqLy5i2KGPcjuxAAXFLOsZL4NlrhKth4O
         IeO2+kkAyxnU11UY95TTHrjAa1/LCNrZWDei+y/ElbBC+mVwGM8j3z6qDyjAm1K81W
         CDWnJOCIHqwUWAplV0LpB9y3xldNVKhY92syKr8w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.132.182]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mFY-1p9qj50vGe-0136Pw; Tue, 11
 Oct 2022 11:54:55 +0200
Date:   Tue, 11 Oct 2022 11:54:53 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Reduce kernel size by packing alternative tables -
 variant 2
Message-ID: <Y0U9bXkZk4Pfab12@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:73VKOoX56D7TLbc1pI+DXMndde547O44M/yYM7EbkhKh+A18FVW
 PiC+wBbTSjgO0CINnz3NpCBYekX5WCj2LP0n+2t3AJNA4fg6s1ds9hHFOOlO3ieDELCwksH
 QEniIsgp/usgC+Sbo02ohWQoL//Hq+nrQnJ+y7ZW7JdgQc9NYGcz+gXMLFD22JQavyT4j7H
 uwAik4ki+e3wZs2dMxw3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LQsxqgXSk0I=:YoXf4miNojSy/oWdpQAtf0
 qjqKZwKNtm07kja2CWH94fSqEhn9vybRw0ruSRS3eX0Ml+OOnor6JSJTuOfrVlDyxBiMDb4Hl
 ICResxwy6iHAOurbqIojWGxo0But/WLsTeFH1VTXIUwe/THhVSGvGhH639UQYUetkD/ItqqwO
 +GvLon9/uVZuWC/gis4BqHHJTBHh9Qk9KSjTZAZovCJ7Fh3UZReIKhiPYokiEaE24NsA3WjcA
 qmcJLReXrBRse+XyySR9lAuNfmwvgfQO7Rbys3P/WhN0YFF9nkUsiA84pK1ZIh5WK9PfMK9K6
 +j7zjGrq+s+uyD+vyk3Ht7JOjOHzIm8tNy7sNulLGc27sCrGjClkPb3p5I7KuBzehVeyj8M9A
 fXVQgyKGGpyKdde+FBjtMgYa/HsZk2ekBaEZOZeb4YVb1LaWkc6HI9VY8YWR+K2UrxaFmlEZt
 pmCcDjTl0ns3F3jA9mJQGQWMWqmrMEMyA+lAyOJN2F2dHK02V5g5Nducs33hxzXPO18Wlr7xU
 TpksLzDKTowqacXpbTA4EFgB01E8vS57DY136QtmrZ8ETm5yLoIHo7t/Ct2rpemy9Z/QPZGQa
 5oXLki9UiFWSNn1nzOcL0wnhkMe4iERvPapMQBwGlXGdcupUi7V5DBQMwxeAc/PSxmn7oetmH
 V2/KmjiMb1QjTSWGxOnFaAt8poaE275oA7NO7Ab/+X/QvjDE2wPszWsetHpUAwMVhqWEFrXV/
 ci3IE8bRLCuRtd3ya3qpgAsZllJ7qWdpFX5HJ2XtIySBfVPID58WERLd4lzoDN489p1TtqURs
 hnUbXKwiKpXn5Cx0slAqBpkCi395qH3oX5+KLhKiaDeKGbF37fUCtMxiUUM7e9Ae8Yx9ZM6L0
 twc+dKF26JGlozCW/a1lQaZ593I7lMqQ4WE09v3HyQDW4Si1SMJxY/tGi4kOzv4+saHfwqlO/
 DZrnH6m/uaGOm2+cr/BhOpqSnnh3VYqfVZ1guOCvsX0duzaxjy56uCpt+XK+Jl5RqfPbvy8BB
 5tdWd7vKNGDBescYtVk1eAuP8O9mh09tyFJedj+6MLSXc2awjcRcCEbWxKrmlM1VnIvqNDzQc
 Lp3uCftXZwDGgcMxdXEpdnWkVkpf7g65nLH4IJwz0NyewkgVl7QYRRZ80OVyx7s79s3ns6diH
 ZSp8tYqNrIa7bTndLgF6Vbz1yuRy/HFyr4pdHKRav+Uri/QgE7K8GicZ585DMsTnpQt6FgZoj
 bVU5G4dSkNqSzsfx2PrfEzTlpD73MAx2N+VLBKR3esmIiwCbxLnEJs3aTaQ1SO0Dnj76b4dnP
 D6JZrww0vBlGdzBbkVq6ieCgsj8C4e/6qr8kzVIDQuK1B47VdQd0uNbtFQiBoAUidoEhPPKLP
 W+I57i7FNa5biSXhj35fyrFOHAAvoyH0cgpx3HXggLNBzhwWMIwIDXZWR/h1eR8iwedbP0Xf5
 PfyiEjAqRT7h7v/9lYGpZXvz+qTh4iEOZiwqJ0ZJPaEqRJdctvq1xHZ5gQCrDqH6745/5D69+
 Jod4xpnu/YT3tS99BQPQ0w9VoEcUMoDLBluQAVliyvUMu
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is the second variant to reduce the size of the alternative tables.
Basically it halves the size by reducing length, condition and replacement
fields.

bloat-o-meter shows a reduction of -0.01% by this change:
Total: Before=3D10254498, After=3D10253654, chg -0.01%

Since this patch introduces more changes without benefit, I won't
apply it for now, but want it to show up in patchwork.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/alternative.h b/arch/parisc/include/a=
sm/alternative.h
index 0ec54f43d6d2..1705abd97f5f 100644
=2D-- a/arch/parisc/include/asm/alternative.h
+++ b/arch/parisc/include/asm/alternative.h
@@ -10,7 +10,9 @@
 #define ALT_COND_NO_IOC_FDC	0x10	/* if I/O cache does not need flushes */
 #define ALT_COND_RUN_ON_QEMU	0x20	/* if running on QEMU */

-#define INSN_PxTLB	0x02		/* modify pdtlb, pitlb */
+#define ALTCODE_PxTLB	0x01		/* add local flag to pdtlb & pitlb */
+#define ALTCODE_NOP	0x02		/* insert nops */
+
 #define INSN_NOP	0x08000240	/* nop */

 #ifndef __ASSEMBLY__
@@ -22,10 +24,10 @@

 struct alt_instr {
 	s32 orig_offset;	/* offset to original instructions */
-	s32 len;		/* end of original instructions */
-	u32 cond;		/* see ALT_COND_XXX */
-	u32 replacement;	/* replacement instruction or code */
-};
+	u16 len;		/* number of instructions */
+	u8 cond;		/* see ALT_COND_XXX condition */
+	u8 replacement;		/* see ALTCODE_XXX replacement instruction */
+} __packed;

 void set_kernel_text_rw(int enable_read_write);
 void apply_alternatives_all(void);
@@ -34,9 +36,11 @@ void apply_alternatives(struct alt_instr *start, struct=
 alt_instr *end,

 /* Alternative SMP implementation. */
 #define ALTERNATIVE(cond, replacement)		"!0:"	\
-	".section .altinstructions, \"aw\"	!"	\
-	".word (0b-4-.), 1, " __stringify(cond) ","	\
-		__stringify(replacement) "	!"	\
+	".section .altinstructions, \"aw\"	 !"	\
+	".word (0b-4) - .			 !"	\
+	".hword 1				 !"	\
+	".byte " __stringify(cond)		"!"	\
+	".byte " __stringify(replacement)	"!"	\
 	".previous"

 #else
@@ -44,15 +48,9 @@ void apply_alternatives(struct alt_instr *start, struct=
 alt_instr *end,
 /* to replace one single instructions by a new instruction */
 #define ALTERNATIVE(from, to, cond, replacement)\
 	.section .altinstructions, "aw"	!	\
-	.word (from - .), (to - from)/4	!	\
-	.word cond, replacement		!	\
-	.previous
-
-/* to replace multiple instructions by new code */
-#define ALTERNATIVE_CODE(from, num_instructions, cond, new_instr_ptr)\
-	.section .altinstructions, "aw"	!	\
-	.word (from - .), -num_instructions !	\
-	.word cond, (new_instr_ptr - .)	!	\
+	.word from - .			!	\
+	.hword (to - from)/4		!	\
+	.byte cond, replacement		!	\
 	.previous

 #endif  /*  __ASSEMBLY__  */
diff --git a/arch/parisc/include/asm/barrier.h b/arch/parisc/include/asm/b=
arrier.h
index c705decf2bed..f99bb8feff78 100644
=2D-- a/arch/parisc/include/asm/barrier.h
+++ b/arch/parisc/include/asm/barrier.h
@@ -9,7 +9,7 @@
 /* The synchronize caches instruction executes as a nop on systems in
    which all memory references are performed in order. */
 #define synchronize_caches() asm volatile("sync" \
-	ALTERNATIVE(ALT_COND_NO_SMP, INSN_NOP) \
+	ALTERNATIVE(ALT_COND_NO_SMP, ALTCODE_NOP) \
 	: : : "memory")

 #if defined(CONFIG_SMP)
diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cac=
he.h
index e23d06b51a20..41fa03e7efa1 100644
=2D-- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -40,20 +40,20 @@ extern struct pdc_cache_info cache_info;
 void parisc_setup_cache_timing(void);

 #define pdtlb(sr, addr)	asm volatile("pdtlb 0(%%sr%0,%1)" \
-			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
+			ALTERNATIVE(ALT_COND_NO_SMP, ALTCODE_PxTLB) \
 			: : "i"(sr), "r" (addr) : "memory")
 #define pitlb(sr, addr)	asm volatile("pitlb 0(%%sr%0,%1)" \
-			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
-			ALTERNATIVE(ALT_COND_NO_SPLIT_TLB, INSN_NOP) \
+			ALTERNATIVE(ALT_COND_NO_SMP, ALTCODE_PxTLB) \
+			ALTERNATIVE(ALT_COND_NO_SPLIT_TLB, ALTCODE_NOP) \
 			: : "i"(sr), "r" (addr) : "memory")

 #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
-			ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
-			ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) \
+			ALTERNATIVE(ALT_COND_NO_DCACHE, ALTCODE_NOP) \
+			ALTERNATIVE(ALT_COND_NO_IOC_FDC, ALTCODE_NOP) \
 			: : "r" (addr) : "memory")
 #define asm_io_sync()	asm volatile("sync" \
-			ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
-			ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) :::"memory")
+			ALTERNATIVE(ALT_COND_NO_DCACHE, ALTCODE_NOP) \
+			ALTERNATIVE(ALT_COND_NO_IOC_FDC, ALTCODE_NOP) :::"memory")
 #define asm_syncdma()	asm volatile("syncdma" :::"memory")

 #endif /* ! __ASSEMBLY__ */
diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alterna=
tive.c
index daa1e9047275..0c455ae13150 100644
=2D-- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -26,7 +26,7 @@ void __init_or_module apply_alternatives(struct alt_inst=
r *start,
 	struct alt_instr *entry;
 	int index =3D 0, applied =3D 0;
 	int num_cpus =3D num_online_cpus();
-	u32 cond_check;
+	u8 cond_check;

 	cond_check =3D ALT_COND_ALWAYS |
 		((num_cpus =3D=3D 1) ? ALT_COND_NO_SMP : 0) |
@@ -45,15 +45,19 @@ void __init_or_module apply_alternatives(struct alt_in=
str *start,

 	for (entry =3D start; entry < end; entry++, index++) {

-		u32 *from, cond, replacement;
-		s32 len;
+		u32 *from, replacement;
+		u8 cond;
+		u16 len;

 		from =3D (u32 *)((ulong)&entry->orig_offset + entry->orig_offset);
 		len =3D entry->len;
 		cond =3D entry->cond;
 		replacement =3D entry->replacement;

-		WARN_ON(!cond);
+		if (WARN_ON(!cond || !len))
+			continue;
+		if (WARN_ON(replacement !=3D ALTCODE_PxTLB && replacement !=3D ALTCODE_=
NOP))
+			continue;

 		if ((cond & ALT_COND_ALWAYS) =3D=3D 0 && no_alternatives)
 			continue;
@@ -66,7 +70,7 @@ void __init_or_module apply_alternatives(struct alt_inst=
r *start,
 			continue;

 		/* Want to replace pdtlb by a pdtlb,l instruction? */
-		if (replacement =3D=3D INSN_PxTLB) {
+		if (replacement =3D=3D ALTCODE_PxTLB) {
 			replacement =3D *from;
 			if (boot_cpu_data.cpu_type >=3D pcxu) /* >=3D pa2.0 ? */
 				replacement |=3D (1 << 10); /* set el bit */
@@ -76,21 +80,20 @@ void __init_or_module apply_alternatives(struct alt_in=
str *start,
 		 * Replace instruction with NOPs?
 		 * For long distance insert a branch instruction instead.
 		 */
-		if (replacement =3D=3D INSN_NOP && len > 1)
-			replacement =3D 0xe8000002 + (len-2)*8; /* "b,n .+8" */
+		if (replacement =3D=3D ALTCODE_NOP) {
+			if (len > 1)
+				replacement =3D 0xe8000002 + (len-2)*8; /* "b,n .+8" */
+			else
+				replacement =3D INSN_NOP;
+			len =3D 1;
+		}

 		pr_debug("ALTERNATIVE %3d: Cond %2x, Replace %2d instructions to 0x%08x=
 @ 0x%px (%pS)\n",
 			index, cond, len, replacement, from, from);

-		if (len < 0) {
-			/* Replace multiple instruction by new code */
-			u32 *source;
-			len =3D -len;
-			source =3D (u32 *)((ulong)&entry->replacement + entry->replacement);
-			memcpy(from, source, 4 * len);
-		} else {
+		while (len--) {
 			/* Replace by one instruction */
-			*from =3D replacement;
+			*from++ =3D replacement;
 		}
 		applied++;
 	}
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index df8102fb435f..32167b276c26 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -407,7 +407,7 @@
 	bb,<,n		\pte,_PAGE_PRESENT_BIT,3f
 	b		\fault
 	stw		\spc,0(\tmp)
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
+99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, ALTCODE_NOP)
 #endif
 2:	LDREG		0(\ptp),\pte
 	bb,>=3D,n		\pte,_PAGE_PRESENT_BIT,\fault
@@ -424,7 +424,7 @@
 #ifdef CONFIG_TLB_PTLOCK
 98:	or,COND(=3D)	%r0,\spc,%r0
 	stw,ma		\spc,0(\tmp)
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
+99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, ALTCODE_NOP)
 #endif
 	.endm

@@ -433,7 +433,7 @@
 #ifdef CONFIG_TLB_PTLOCK
 98:	get_ptl		\tmp
 	ptl_unlock0	\spc,\tmp
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
+99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, ALTCODE_NOP)
 #endif
 	.endm

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 9a0018f1f42c..038d876b0a92 100644
=2D-- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -103,7 +103,7 @@ fitonemiddle:					/* Loop if LOOP =3D 1 */
 	add		%r21, %r20, %r20		/* increment space */

 fitdone:
-	ALTERNATIVE(88b, fitdone, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
+	ALTERNATIVE(88b, fitdone, ALT_COND_NO_SPLIT_TLB, ALTCODE_NOP)

 	/* Flush Data Tlb */

@@ -172,17 +172,16 @@ fdtdone:
 	rfi
 	nop

-2:      bv		%r0(%r2)
-	nop
+	bv,n		%r0(%r2)

 	/*
 	 * When running in qemu, drop whole flush_tlb_all_local function and
 	 * replace by one pdtlbe instruction, for which QEMU will drop all
 	 * local TLB entries.
 	 */
-3:	pdtlbe		%r0(%sr1,%r0)
-	bv,n		%r0(%r2)
-	ALTERNATIVE_CODE(flush_tlb_all_local, 2, ALT_COND_RUN_ON_QEMU, 3b)
+3:	ALTERNATIVE(flush_tlb_all_local, 3b, ALT_COND_RUN_ON_QEMU, ALTCODE_NOP=
)
+	bv		%r0(%r2)
+	pdtlbe		%r0(%sr1,%r0)
 ENDPROC_CFI(flush_tlb_all_local)

 	.import cache_info,data
@@ -241,7 +240,7 @@ fioneloop2:
 fisync:
 	sync
 	mtsm		%r22			/* restore I-bit */
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, ALTCODE_NOP)
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_instruction_cache_local)
@@ -302,7 +301,7 @@ fdoneloop2:
 fdsync:
 	sync
 	mtsm		%r22			/* restore I-bit */
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, ALTCODE_NOP)
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_data_cache_local)
@@ -545,8 +544,8 @@ ENTRY_CFI(copy_user_page_asm)
 #else
 0:	pdtlb		%r0(%r28)
 1:	pdtlb		%r0(%r29)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
+	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, ALTCODE_PxTLB)
+	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, ALTCODE_PxTLB)
 #endif

 #ifdef CONFIG_64BIT
@@ -674,7 +673,7 @@ ENTRY_CFI(clear_user_page_asm)
 	pdtlb,l		%r0(%r28)
 #else
 0:	pdtlb		%r0(%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
+	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, ALTCODE_PxTLB)
 #endif

 #ifdef CONFIG_64BIT
@@ -740,7 +739,7 @@ ENTRY_CFI(flush_dcache_page_asm)
 	pdtlb,l		%r0(%r28)
 #else
 0:	pdtlb		%r0(%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
+	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, ALTCODE_PxTLB)
 #endif

 88:	ldil		L%dcache_stride, %r1
@@ -772,7 +771,7 @@ ENTRY_CFI(flush_dcache_page_asm)
 	cmpb,COND(>>)	%r25, %r28, 1b /* predict taken */
 	fdc,m		r31(%r28)

-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, ALTCODE_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -789,7 +788,7 @@ ENTRY_CFI(purge_dcache_page_asm)
 	pdtlb,l		%r0(%r28)
 #else
 0:	pdtlb		%r0(%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
+	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, ALTCODE_PxTLB)
 #endif

 88:	ldil		L%dcache_stride, %r1
@@ -821,7 +820,7 @@ ENTRY_CFI(purge_dcache_page_asm)
 	cmpb,COND(>>)	%r25, %r28, 1b /* predict taken */
 	pdc,m		r31(%r28)

-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, ALTCODE_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -840,13 +839,13 @@ ENTRY_CFI(flush_icache_page_asm)
 #ifdef CONFIG_PA20
 	pdtlb,l		%r0(%r28)
 1:	pitlb,l         %r0(%sr4,%r28)
-	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
+	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, ALTCODE_NOP)
 #else
 0:	pdtlb		%r0(%r28)
 1:	pitlb           %r0(%sr4,%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
+	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, ALTCODE_PxTLB)
+	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, ALTCODE_PxTLB)
+	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, ALTCODE_NOP)
 #endif

 88:	ldil		L%icache_stride, %r1
@@ -880,7 +879,7 @@ ENTRY_CFI(flush_icache_page_asm)
 	cmpb,COND(>>)	%r25, %r28, 1b /* predict taken */
 	fic,m		%r31(%sr4,%r28)

-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, ALTCODE_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -916,7 +915,7 @@ ENTRY_CFI(flush_kernel_dcache_page_asm)
 	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
 	fdc,m		%r23(%r26)

-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, ALTCODE_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -952,7 +951,7 @@ ENTRY_CFI(purge_kernel_dcache_page_asm)
 	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
 	pdc,m		%r23(%r26)

-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, ALTCODE_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -993,7 +992,7 @@ ENTRY_CFI(flush_user_dcache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b
 	fdc,m		%r23(%sr3, %r26)

-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, ALTCODE_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -1035,7 +1034,7 @@ ENTRY_CFI(flush_kernel_dcache_range_asm)
 	fdc,m		%r23(%r26)

 	sync
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, ALTCODE_NOP)
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_kernel_dcache_range_asm)
@@ -1076,7 +1075,7 @@ ENTRY_CFI(purge_kernel_dcache_range_asm)
 	pdc,m		%r23(%r26)

 	sync
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, ALTCODE_NOP)
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(purge_kernel_dcache_range_asm)
@@ -1116,7 +1115,7 @@ ENTRY_CFI(flush_user_icache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b
 	fic,m		%r23(%sr3, %r26)

-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, ALTCODE_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -1153,7 +1152,7 @@ ENTRY_CFI(flush_kernel_icache_page)
 	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
 	fic,m		%r23(%sr4, %r26)

-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, ALTCODE_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -1194,7 +1193,7 @@ ENTRY_CFI(flush_kernel_icache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b /* predict taken */
 	fic,m		%r23(%sr4, %r26)

-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
+89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, ALTCODE_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
