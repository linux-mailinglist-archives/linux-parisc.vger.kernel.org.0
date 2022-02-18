Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0654BC2EC
	for <lists+linux-parisc@lfdr.de>; Sat, 19 Feb 2022 00:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbiBRXke (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 18 Feb 2022 18:40:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbiBRXkd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 18 Feb 2022 18:40:33 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65C427B489
        for <linux-parisc@vger.kernel.org>; Fri, 18 Feb 2022 15:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645227605;
        bh=EtqyEhDC0DV7F/K7gXEBrkzz8YBKcIK1mY+uoik2H8c=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=TzTpnxb2m8FsXLwe1Kc4JjmgRg1DuW5Qw1RVnsbqwNyp9D+SSC9bJPVEf0EXK7rae
         K5sbUUtwu6uEGR+51bC5ArEhO5eRtzrCfpiloq2AYT/D7F9xzJXun0nKZbPUhEwPLx
         iF9o+Z88zaYvpBTWhzGfZnPh14RxO9CHA7rYpVfw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.159.38]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUjC-1oCl0w3cPq-00rXq2; Sat, 19
 Feb 2022 00:40:04 +0100
Date:   Sat, 19 Feb 2022 00:40:00 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] Use EFAULT fixup handler in unaligned handlers
Message-ID: <YhAuUBYn+o11XPHD@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:ZAHStIOgV2U/2ebplKhmodu10f/iJnbRzINW/XDfW0zsGwETucT
 1kK1yZMpJ0gFSy3uIUoIc9K5hZxT4G8qQlgmsOBAxtXPv5mAtFnVdrBiYy0fJRy4fTY5iqA
 i1hckhL+myMRjEjJCnLXBWoX6J4JEchJVEMWmEatllcvvX84422sOsjLohhGzGzDYlQeEJq
 qdB7Ze3afv5qwMeID8/ng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sm04cq1sHk4=:lWHE6uZGlcR78VM7kWbfSi
 Jyjh2mdxhfuirYSoM8bm4O5IQMCwhFD54X8U4HI/4i14QZKXpmqLorpFJT6y24EgMB9LRDdKn
 iGdBJb+1VBDOtlr4x4SStity256pBiiMN/fKVCLr6zst7pj56ng08Ajab6iX6c9JI3HZb2YsF
 N3CYGEEzmkZ7lFTiqd2N0NCF8qzWw/kZx/kRaynfpGn1LCn4Evd7E1E1LtbZGMA+RsSCPg1KN
 S48nd9qdm3Q3lNm9L1QSsR5xtS+X6HlvS9mqZ6+MFNWAOsZnv5dpOJQWNO0WkRWaEIrhRl5qV
 1y/6Gv1hiNW9hyq/9/pr2y8qnsMDPoCZ00GpgrwESxfS7NIEcPQ1jRUVRosXtU0q+gT0eb61A
 iWOyOmex3WZGvqPUkgY4sosQMYkEu3iSEeZ0nW3qYBGAL1NRwlRDqDb1Bam/7fHJMzLO3Uhf9
 i0bN+JHGJDe86hH3zl+OHM7ePBAPuI0VGKMBU29w+BEI6oDdHxu6VcnqrlHakTycl3/gABJiH
 ff4j/XfOV9RQFV5hDnS19UdTyvGQMuypwWkEx/K9vJT046FQtAVorvc3l41vB7fASQkrHiY3p
 pRdLInYSOKhqa45HmTJouMJ2Z6Ep6TAwt5sA+0dT614ZbjofhAkyqKUGAB2k+kxEbozEduKk1
 KESGkURjKbELJQ7glCWkCIM+Qowjw94OoNRau1NtC4B7fcMFzzJkqQwJgxBY1M0E4/LVq6aL4
 JCzAme3PBZxbZKqxPhNy8I4QpPhzzllrom0VMySGhii3XYNjKKE4C/yW1Z/M8UsvB0vCtqKfC
 x1oKhEzzpOIQpFF9UO2uqSrgnrkx/IOVijUOmXq8DhHGPoHpkYLlr1aXgct+m8tkNF3ZMHiKY
 YsgeVxFO+B1u7wHbVqrxvvgVn7a83Nn0jNNkKBMe95ezUbp0vYcwl9zFYIphoaNap0SDSyNdD
 YElD8w/Ob9+Fj9LGyc45cPAlXnblvh9c0QyZL7ZuPjDZGYlScVMDvEJPXuKaA+jkIxsPoJdIe
 8WPkJyCbRDth/Lk73zoK9NqCf3g4EPZAvv481/+XAhvXS2y6mFnnI0UJoX92urGZiQLAHMrUK
 27e1axekSHCpl8=
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

Convert the inline assembly code to use the automatic EFAULT exception
handler. With that the fixup code can be dropped.

The other change is to allow double-word only when a 64-bit kernel is
used instead of depending on CONFIG_PA20.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned=
.c
index 02fd2ecf4b16..b57e83a54bac 100644
=2D-- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -31,13 +31,6 @@
 #define RFMT "%08lx"
 #endif

-#define FIXUP_BRANCH(lbl) \
-	"\tldil L%%" #lbl ", %%r1\n"			\
-	"\tldo R%%" #lbl "(%%r1), %%r1\n"		\
-	"\tbv,n %%r0(%%r1)\n"
-/* If you use FIXUP_BRANCH, then you must list this clobber */
-#define FIXUP_BRANCH_CLOBBER "r1"
-
 /* 1111 1100 0000 0000 0001 0011 1100 0000 */
 #define OPCODE1(a,b,c)	((a)<<26|(b)<<12|(c)<<6)
 #define OPCODE2(a,b)	((a)<<26|(b)<<1)
@@ -114,7 +107,6 @@
 #define IM14(i) IM((i),14)

 #define ERR_NOTHANDLED	-1
-#define ERR_PAGEFAULT	-2

 int unaligned_enabled __read_mostly =3D 1;

@@ -122,7 +114,7 @@ static int emulate_ldh(struct pt_regs *regs, int toreg=
)
 {
 	unsigned long saddr =3D regs->ior;
 	unsigned long val =3D 0;
-	int ret;
+	ASM_EXCEPTIONTABLE_VAR(ret);

 	DPRINTF("load " RFMT ":" RFMT " to r%d for 2 bytes\n",
 		regs->isr, regs->ior, toreg);
@@ -132,17 +124,12 @@ static int emulate_ldh(struct pt_regs *regs, int tor=
eg)
 "1:	ldbs	0(%%sr1,%3), %%r20\n"
 "2:	ldbs	1(%%sr1,%3), %0\n"
 "	depw	%%r20, 23, 24, %0\n"
-"	copy	%%r0, %1\n"
 "3:	\n"
-"	.section .fixup,\"ax\"\n"
-"4:	ldi	-2, %1\n"
-	FIXUP_BRANCH(3b)
-"	.previous\n"
-	ASM_EXCEPTIONTABLE_ENTRY(1b, 4b)
-	ASM_EXCEPTIONTABLE_ENTRY(2b, 4b)
-	: "=3Dr" (val), "=3Dr" (ret)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
+	: "=3Dr" (val), "+r" (ret)
 	: "0" (val), "r" (saddr), "r" (regs->isr)
-	: "r20", FIXUP_BRANCH_CLOBBER );
+	: "r20" );

 	DPRINTF("val =3D 0x" RFMT "\n", val);

@@ -156,7 +143,7 @@ static int emulate_ldw(struct pt_regs *regs, int toreg=
, int flop)
 {
 	unsigned long saddr =3D regs->ior;
 	unsigned long val =3D 0;
-	int ret;
+	ASM_EXCEPTIONTABLE_VAR(ret);

 	DPRINTF("load " RFMT ":" RFMT " to r%d for 4 bytes\n",
 		regs->isr, regs->ior, toreg);
@@ -170,17 +157,12 @@ static int emulate_ldw(struct pt_regs *regs, int tor=
eg, int flop)
 "	subi	32,%%r19,%%r19\n"
 "	mtctl	%%r19,11\n"
 "	vshd	%0,%%r20,%0\n"
-"	copy	%%r0, %1\n"
 "3:	\n"
-"	.section .fixup,\"ax\"\n"
-"4:	ldi	-2, %1\n"
-	FIXUP_BRANCH(3b)
-"	.previous\n"
-	ASM_EXCEPTIONTABLE_ENTRY(1b, 4b)
-	ASM_EXCEPTIONTABLE_ENTRY(2b, 4b)
-	: "=3Dr" (val), "=3Dr" (ret)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
+	: "=3Dr" (val), "+r" (ret)
 	: "0" (val), "r" (saddr), "r" (regs->isr)
-	: "r19", "r20", FIXUP_BRANCH_CLOBBER );
+	: "r19", "r20" );

 	DPRINTF("val =3D 0x" RFMT "\n", val);

@@ -195,16 +177,15 @@ static int emulate_ldd(struct pt_regs *regs, int tor=
eg, int flop)
 {
 	unsigned long saddr =3D regs->ior;
 	__u64 val =3D 0;
-	int ret;
+	ASM_EXCEPTIONTABLE_VAR(ret);

 	DPRINTF("load " RFMT ":" RFMT " to r%d for 8 bytes\n",
 		regs->isr, regs->ior, toreg);
-#ifdef CONFIG_PA20

-#ifndef CONFIG_64BIT
-	if (!flop)
-		return -1;
-#endif
+	if (!IS_ENABLED(CONFIG_64BIT) && !flop)
+		return ERR_NOTHANDLED;
+
+#ifdef CONFIG_64BIT
 	__asm__ __volatile__  (
 "	depd,z	%3,60,3,%%r19\n"		/* r19=3D(ofs&7)*8 */
 "	mtsp	%4, %%sr1\n"
@@ -214,17 +195,12 @@ static int emulate_ldd(struct pt_regs *regs, int tor=
eg, int flop)
 "	subi	64,%%r19,%%r19\n"
 "	mtsar	%%r19\n"
 "	shrpd	%0,%%r20,%%sar,%0\n"
-"	copy	%%r0, %1\n"
 "3:	\n"
-"	.section .fixup,\"ax\"\n"
-"4:	ldi	-2, %1\n"
-	FIXUP_BRANCH(3b)
-"	.previous\n"
-	ASM_EXCEPTIONTABLE_ENTRY(1b,4b)
-	ASM_EXCEPTIONTABLE_ENTRY(2b,4b)
-	: "=3Dr" (val), "=3Dr" (ret)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
+	: "=3Dr" (val), "+r" (ret)
 	: "0" (val), "r" (saddr), "r" (regs->isr)
-	: "r19", "r20", FIXUP_BRANCH_CLOBBER );
+	: "r19", "r20" );
 #else
     {
 	unsigned long valh=3D0,vall=3D0;
@@ -239,18 +215,13 @@ static int emulate_ldd(struct pt_regs *regs, int tor=
eg, int flop)
 "	mtsar	%%r19\n"
 "	vshd	%0,%1,%0\n"
 "	vshd	%1,%%r20,%1\n"
-"	copy	%%r0, %2\n"
 "4:	\n"
-"	.section .fixup,\"ax\"\n"
-"5:	ldi	-2, %2\n"
-	FIXUP_BRANCH(4b)
-"	.previous\n"
-	ASM_EXCEPTIONTABLE_ENTRY(1b,5b)
-	ASM_EXCEPTIONTABLE_ENTRY(2b,5b)
-	ASM_EXCEPTIONTABLE_ENTRY(3b,5b)
-	: "=3Dr" (valh), "=3Dr" (vall), "=3Dr" (ret)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 4b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 4b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(3b, 4b)
+	: "=3Dr" (valh), "=3Dr" (vall), "+r" (ret)
 	: "0" (valh), "1" (vall), "r" (saddr), "r" (regs->isr)
-	: "r19", "r20", FIXUP_BRANCH_CLOBBER );
+	: "r19", "r20" );
 	val=3D((__u64)valh<<32)|(__u64)vall;
     }
 #endif
@@ -268,7 +239,7 @@ static int emulate_ldd(struct pt_regs *regs, int toreg=
, int flop)
 static int emulate_sth(struct pt_regs *regs, int frreg)
 {
 	unsigned long val =3D regs->gr[frreg];
-	int ret;
+	ASM_EXCEPTIONTABLE_VAR(ret);

 	if (!frreg)
 		val =3D 0;
@@ -281,17 +252,12 @@ static int emulate_sth(struct pt_regs *regs, int frr=
eg)
 "	extrw,u %1, 23, 8, %%r19\n"
 "1:	stb %1, 1(%%sr1, %2)\n"
 "2:	stb %%r19, 0(%%sr1, %2)\n"
-"	copy	%%r0, %0\n"
 "3:	\n"
-"	.section .fixup,\"ax\"\n"
-"4:	ldi	-2, %0\n"
-	FIXUP_BRANCH(3b)
-"	.previous\n"
-	ASM_EXCEPTIONTABLE_ENTRY(1b,4b)
-	ASM_EXCEPTIONTABLE_ENTRY(2b,4b)
-	: "=3Dr" (ret)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
+	: "+r" (ret)
 	: "r" (val), "r" (regs->ior), "r" (regs->isr)
-	: "r19", FIXUP_BRANCH_CLOBBER );
+	: "r19" );

 	return ret;
 }
@@ -299,7 +265,7 @@ static int emulate_sth(struct pt_regs *regs, int frreg=
)
 static int emulate_stw(struct pt_regs *regs, int frreg, int flop)
 {
 	unsigned long val;
-	int ret;
+	ASM_EXCEPTIONTABLE_VAR(ret);

 	if (flop)
 		val =3D ((__u32*)(regs->fr))[frreg];
@@ -328,24 +294,19 @@ static int emulate_stw(struct pt_regs *regs, int frr=
eg, int flop)
 "	or	%%r1, %%r21, %%r21\n"
 "	stw	%%r20,0(%%sr1,%2)\n"
 "	stw	%%r21,4(%%sr1,%2)\n"
-"	copy	%%r0, %0\n"
 "3:	\n"
-"	.section .fixup,\"ax\"\n"
-"4:	ldi	-2, %0\n"
-	FIXUP_BRANCH(3b)
-"	.previous\n"
-	ASM_EXCEPTIONTABLE_ENTRY(1b,4b)
-	ASM_EXCEPTIONTABLE_ENTRY(2b,4b)
-	: "=3Dr" (ret)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
+	: "+r" (ret)
 	: "r" (val), "r" (regs->ior), "r" (regs->isr)
-	: "r19", "r20", "r21", "r22", "r1", FIXUP_BRANCH_CLOBBER );
+	: "r19", "r20", "r21", "r22", "r1" );

 	return ret;
 }
 static int emulate_std(struct pt_regs *regs, int frreg, int flop)
 {
 	__u64 val;
-	int ret;
+	ASM_EXCEPTIONTABLE_VAR(ret);

 	if (flop)
 		val =3D regs->fr[frreg];
@@ -357,11 +318,10 @@ static int emulate_std(struct pt_regs *regs, int frr=
eg, int flop)
 	DPRINTF("store r%d (0x%016llx) to " RFMT ":" RFMT " for 8 bytes\n", frre=
g,
 		val,  regs->isr, regs->ior);

-#ifdef CONFIG_PA20
-#ifndef CONFIG_64BIT
-	if (!flop)
-		return -1;
-#endif
+	if (!IS_ENABLED(CONFIG_64BIT) && !flop)
+		return ERR_NOTHANDLED;
+
+#ifdef CONFIG_64BIT
 	__asm__ __volatile__ (
 "	mtsp %3, %%sr1\n"
 "	depd,z	%2, 60, 3, %%r19\n"
@@ -378,19 +338,14 @@ static int emulate_std(struct pt_regs *regs, int frr=
eg, int flop)
 "	or	%%r1, %%r21, %%r21\n"
 "3:	std	%%r20,0(%%sr1,%2)\n"
 "4:	std	%%r21,8(%%sr1,%2)\n"
-"	copy	%%r0, %0\n"
 "5:	\n"
-"	.section .fixup,\"ax\"\n"
-"6:	ldi	-2, %0\n"
-	FIXUP_BRANCH(5b)
-"	.previous\n"
-	ASM_EXCEPTIONTABLE_ENTRY(1b,6b)
-	ASM_EXCEPTIONTABLE_ENTRY(2b,6b)
-	ASM_EXCEPTIONTABLE_ENTRY(3b,6b)
-	ASM_EXCEPTIONTABLE_ENTRY(4b,6b)
-	: "=3Dr" (ret)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 5b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 5b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(3b, 5b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(4b, 5b)
+	: "+r" (ret)
 	: "r" (val), "r" (regs->ior), "r" (regs->isr)
-	: "r19", "r20", "r21", "r22", "r1", FIXUP_BRANCH_CLOBBER );
+	: "r19", "r20", "r21", "r22", "r1" );
 #else
     {
 	unsigned long valh=3D(val>>32),vall=3D(val&0xffffffffl);
@@ -412,20 +367,15 @@ static int emulate_std(struct pt_regs *regs, int frr=
eg, int flop)
 "3:	stw	%1,0(%%sr1,%3)\n"
 "4:	stw	%%r1,4(%%sr1,%3)\n"
 "5:	stw	%2,8(%%sr1,%3)\n"
-"	copy	%%r0, %0\n"
 "6:	\n"
-"	.section .fixup,\"ax\"\n"
-"7:	ldi	-2, %0\n"
-	FIXUP_BRANCH(6b)
-"	.previous\n"
-	ASM_EXCEPTIONTABLE_ENTRY(1b,7b)
-	ASM_EXCEPTIONTABLE_ENTRY(2b,7b)
-	ASM_EXCEPTIONTABLE_ENTRY(3b,7b)
-	ASM_EXCEPTIONTABLE_ENTRY(4b,7b)
-	ASM_EXCEPTIONTABLE_ENTRY(5b,7b)
-	: "=3Dr" (ret)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 6b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 6b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(3b, 6b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(4b, 6b)
+	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(5b, 6b)
+	: "+r" (ret)
 	: "r" (valh), "r" (vall), "r" (regs->ior), "r" (regs->isr)
-	: "r19", "r20", "r21", "r1", FIXUP_BRANCH_CLOBBER );
+	: "r19", "r20", "r21", "r1" );
     }
 #endif

@@ -547,7 +497,7 @@ void handle_unaligned(struct pt_regs *regs)
 		ret =3D emulate_stw(regs, R2(regs->iir),0);
 		break;

-#ifdef CONFIG_PA20
+#ifdef CONFIG_64BIT
 	case OPCODE_LDD_I:
 	case OPCODE_LDDA_I:
 	case OPCODE_LDD_S:
@@ -606,7 +556,7 @@ void handle_unaligned(struct pt_regs *regs)
 		flop=3D1;
 		ret =3D emulate_std(regs, R2(regs->iir),1);
 		break;
-#ifdef CONFIG_PA20
+#ifdef CONFIG_64BIT
 	case OPCODE_LDD_L:
 		ret =3D emulate_ldd(regs, R2(regs->iir),0);
 		break;
@@ -673,7 +623,7 @@ void handle_unaligned(struct pt_regs *regs)
 		printk(KERN_CRIT "Unaligned handler failed, ret =3D %d\n", ret);
 		die_if_kernel("Unaligned data reference", regs, 28);

-		if (ret =3D=3D ERR_PAGEFAULT)
+		if (ret =3D=3D -EFAULT)
 		{
 			force_sig_fault(SIGSEGV, SEGV_MAPERR,
 					(void __user *)regs->ior);
