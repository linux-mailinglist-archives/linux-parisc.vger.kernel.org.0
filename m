Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC4818A40A
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Aug 2019 19:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbfHLRLV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Aug 2019 13:11:21 -0400
Received: from mout.gmx.net ([212.227.15.18]:37625 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbfHLRLV (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Aug 2019 13:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565629870;
        bh=j6o9KOKpMXkkhk6q7Ed7RMae/O2ABwbAvCJW8z2NJ0Q=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=MIBhghzW2zW1Di3myjcndSFBDMsCPzzVvrJhffgS0WNRDrVZuJJQGbWyTV2ttWSGE
         CMTSPVdfeZdelRe5PGEA85dgz1GEJp4aPGBqqQh3x/Gxszlx5znOcU7ijU1aGhklXr
         dq+i0mr0Mcslv6aHw+DDHXWIN4APfCnquKXFIMfY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.135.102]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Me8di-1hf7AZ3e7a-00PtaZ; Mon, 12
 Aug 2019 19:11:09 +0200
Date:   Mon, 12 Aug 2019 19:11:06 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add ALTERNATIVE_CODE() and ALT_COND_RUN_ON_QEMU
Message-ID: <20190812171106.GA28906@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Provags-ID: V03:K1:Uz7AleCDQfloOw4k/ux+48hRKdfoyWp+01vIdpPbFD5zlhGlbnF
 1Q3fzEiTUPWqje+T2JaqHtiO5R2NYP9yVdb3dEd06rQojVNB9DXl6J5NHeuXDVj7liogy0u
 +xolcl7rnXGAksaQe2Wa4VX374UgsUSl/mh81Qh8MgpdtL9tinK4FkRY0OtNY4j64is7gJ3
 0KxbpQ59wqv3LGKdPtX9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B84RFmFVdNQ=:f1TUTctzdJg1EggUTSOKIR
 i0NmpW8ed98gEznNYsGuytT5Q71GqBaffvslD9yDNWrShXcLWIpVSU5Iww8Dbt2kBFcbcIjT9
 chg2lmduihQrNRJdnGw9OTsaxaS/vY16cUFeAcM1dSYoKhyoreN5qQUDOZna0PezwV9IAv5CE
 FPw5SD9xeQHPIOC6H9hmSlm1Cl/NPd00gKdntm5vOn1zZfgg9MdUdSZZVIfHYw/EQRMNHW2t1
 DPJ7O0jYFSMXuHrLs7VWMu5l29NA4QAnjehxAdAW/bmRXkK9KOh03uB9NEmFoxVSF6cfovUEt
 r2NtWvzztpA3IbUueud1EJfrYLaDyfOGxaC372x6jsfskD31bP239qXQQuNqR4z/4QHA0Bih3
 kIYm0mH+NaYMy6vlWPwVWZCeuYvs8Fcu+aOqXizzpdfJw6vC3G5CR94vyh3LyPEsTRjmzVYrs
 O8CB1BbXLVOLZUKJ2OW8CWoc2i87DUWyvjPg4WS02LO+kmJlP7x9a0PdaJIAyhlcI/zmF9vp6
 liZsJcpOKjK4sPPf9XdcDK3KDK8aS/gxdjjups2U+Bx4ilqfhkj8ODOzk4szwcvLiT5tlx2Ao
 Z0Iq+DHwxAChCxrIWf3QhUet6GoIeWZDkcagxjx8Atrykc8hQ0J1GZhgAAspOZs+VdJxmiFeR
 VZGXtITWuVJgu08cWgQ0LtsRNl2GaQSp0jw7/cler8y1jDxqRqXn2mFqFqnF1HLjd+xJ3PMUZ
 7WPBYhkrrBUewtHk9yqUkOQ7a1J8uCgA3U8QBHUsBaQ6839PPfU1lyEQi3vfRlVRfVK24CixG
 cjFAqZmL8IbiGFvDBat3AGxj7FjSXUYzNt+MblAwTDIDcLwNkvUyKv7m0ynq1ewK5wnNNidZ8
 6lioSt2eD1zsxLC4yHb93J8cm6FwD8uGxnnl6tVpVPQrJisZ1q+CzLQtjT8qk0HqMkBTrxnLi
 qL68Xctz5YSjzbajpQ0HDuEPUH+rLfnWLvDkrZqMBZWOde2WK/0zHHzfJPuNWhM+BxAocR/Ng
 foTx1EUkTt4LDKEqtaNHstA6JAcDUGV2L0nO7e3ceJ4lobOmtmC/7Zj+1Qi1E4vxJZyRq4mDG
 Sm/GabQMUmmur14lAnivogH0oMfq2h+HQpIts8lORf+GkfIR70I4ow89w==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The macro ALTERNATIVE_CODE() allows assembly code to patch in a series
of new assembler statements given at a specific start address.
The ALT_COND_RUN_ON_QEMU condition is true if the kernel is started in a
qemu emulation.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/alternative.h b/arch/parisc/include/a=
sm/alternative.h
index 793d8baa3a10..0ec54f43d6d2 100644
=2D-- a/arch/parisc/include/asm/alternative.h
+++ b/arch/parisc/include/asm/alternative.h
@@ -8,6 +8,7 @@
 #define ALT_COND_NO_ICACHE	0x04	/* if system has no i-cache  */
 #define ALT_COND_NO_SPLIT_TLB	0x08	/* if split_tlb =3D=3D 0  */
 #define ALT_COND_NO_IOC_FDC	0x10	/* if I/O cache does not need flushes */
+#define ALT_COND_RUN_ON_QEMU	0x20	/* if running on QEMU */

 #define INSN_PxTLB	0x02		/* modify pdtlb, pitlb */
 #define INSN_NOP	0x08000240	/* nop */
@@ -21,7 +22,7 @@

 struct alt_instr {
 	s32 orig_offset;	/* offset to original instructions */
-	u32 len;		/* end of original instructions */
+	s32 len;		/* end of original instructions */
 	u32 cond;		/* see ALT_COND_XXX */
 	u32 replacement;	/* replacement instruction or code */
 };
@@ -40,12 +41,20 @@ void apply_alternatives(struct alt_instr *start, struc=
t alt_instr *end,

 #else

+/* to replace one single instructions by a new instruction */
 #define ALTERNATIVE(from, to, cond, replacement)\
 	.section .altinstructions, "aw"	!	\
 	.word (from - .), (to - from)/4	!	\
 	.word cond, replacement		!	\
 	.previous

+/* to replace multiple instructions by new code */
+#define ALTERNATIVE_CODE(from, num_instructions, cond, new_instr_ptr)\
+	.section .altinstructions, "aw"	!	\
+	.word (from - .), -num_instructions !	\
+	.word cond, (new_instr_ptr - .)	!	\
+	.previous
+
 #endif  /*  __ASSEMBLY__  */

 #endif /* __ASM_PARISC_ALTERNATIVE_H */
diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alterna=
tive.c
index ca1f5ca0540a..3c66d5c4d90d 100644
=2D-- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -28,7 +28,8 @@ void __init_or_module apply_alternatives(struct alt_inst=
r *start,

 	for (entry =3D start; entry < end; entry++, index++) {

-		u32 *from, len, cond, replacement;
+		u32 *from, cond, replacement;
+		s32 len;

 		from =3D (u32 *)((ulong)&entry->orig_offset + entry->orig_offset);
 		len =3D entry->len;
@@ -49,6 +50,8 @@ void __init_or_module apply_alternatives(struct alt_inst=
r *start,
 			continue;
 		if ((cond & ALT_COND_NO_ICACHE) && (cache_info.ic_size !=3D 0))
 			continue;
+		if ((cond & ALT_COND_RUN_ON_QEMU) && !running_on_qemu)
+			continue;

 		/*
 		 * If the PDC_MODEL capabilities has Non-coherent IO-PDIR bit
@@ -74,11 +77,19 @@ void __init_or_module apply_alternatives(struct alt_in=
str *start,
 		if (replacement =3D=3D INSN_NOP && len > 1)
 			replacement =3D 0xe8000002 + (len-2)*8; /* "b,n .+8" */

-		pr_debug("Do    %d: Cond 0x%x, Replace %02d instructions @ 0x%px with 0=
x%08x\n",
-			index, cond, len, from, replacement);
-
-		/* Replace instruction */
-		*from =3D replacement;
+		pr_debug("ALTERNATIVE %3d: Cond %2x, Replace %2d instructions to 0x%08x=
 @ 0x%px (%pS)\n",
+			index, cond, len, replacement, from, from);
+
+		if (len < 0) {
+			/* Replace multiple instruction by new code */
+			u32 *source;
+			len =3D -len;
+			source =3D (u32 *)((ulong)&entry->replacement + entry->replacement);
+			memcpy(from, source, 4 * len);
+		} else {
+			/* Replace by one instruction */
+			*from =3D replacement;
+		}
 		applied++;
 	}

