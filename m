Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B655F870E
	for <lists+linux-parisc@lfdr.de>; Sat,  8 Oct 2022 21:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiJHTWg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 8 Oct 2022 15:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiJHTWf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 8 Oct 2022 15:22:35 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9299B3CBC0
        for <linux-parisc@vger.kernel.org>; Sat,  8 Oct 2022 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1665256945;
        bh=Xy+KKdsLoBNskeknAMGSKYp7HGpcOM6591Pj2k/YcSo=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=OnZE8UC7PC4hRhwwpFaJmPQcp/wCfn0MicaLC6nmTPI5EcWKm5wiP4/aoyD3X++4C
         kw2MJ0d1VERdN2Vq8cKccFsEe8rOUdpQUU/ZkYfOQqJXcO4LhdgAGgfrAualB95spe
         kHoZcb8S4Ft4jxCaKQnwIdpg/FxvmDrWb9O/jPhc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.144.139]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N95e9-1pDGH13bd9-0168PN; Sat, 08
 Oct 2022 21:22:24 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 1/2] parisc: Reduce kernel size by packing alternative tables
Date:   Sat,  8 Oct 2022 21:22:22 +0200
Message-Id: <20221008192223.491837-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NxCnz6ai3dWOfQ3vtAizZ0yiBVV3xA2znoWDTRR3+KinGPUtgbw
 LWbrvw1pYGeHCTo/0PC6/8wRuDgTVS/g6cvaQeMCVuMqXaH08NY7p5kQc4J2GcouMqrCLfh
 cXWlcZnvc8mtZW94PNL2Iq13XmHEJvluY1mDEgB34nOqsosoNcXBdkhR9OjDz4sRBT8mRh6
 oP6Tgm+ZiKEHwlnfPZQ3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MwOT/g7JETw=:LNwpebvLiZQYo/V4nR0ZAA
 rgZagBaIK2KiQoGzQ7P9F9LhjakEmCfHzUfwgUOc1Yc3DrRu6p8lYFcUO6LZeP/mk8mIcKDkc
 gLLzta7+AISE0E7Ec5vCOTI7/md2WbOhAtIDiRP6pJwD4OIbCYk0inCGBsyLhKt8M9qd2WfHJ
 WyKuBOAlBaEuUwQAZ5vnFjMZJknEsR+KD7Jf653bd/FXDx7D3AMLxOK/DUyE3hXuGqL7CfvAq
 R0SFuuweO7UelzISXGkbEPHfjgq13uXj/gF9BjD7XhYoVazo3f/OVP+Cm12Q7TM9ajx/3PXQS
 Kgz486xFNEZBCMgObx1S2O77+WwFkbkNZFLPWGJ5i4b3gnIrPYLtKo2V/IKi+0R3bIjJOO5jr
 qYMe/MmyzQOeZ1fdqMsF/tA1S8VbCog6hbY3QQ8nrU2ymaZVmVsxEfF+LZPMBT6pTQU0+3Qqx
 H+c8XTRuzoGoUJH0Oct6eSjw3yYl6LIPAEJ2sdclBqg+U8G+2UxmCuL9Ysv9S82JAJafGysbQ
 DIMeWUotuQ+uw56UmdFnmlXgJyInM/3Tl8LIicRUQsVsKEJ1J6gVXimhiKK0d4jmCWHA8ToZq
 3w3Q6CUiEiBdBumpfYUJB+gMvttpmJ76rb90SC/DTHMQW39Yojb9F3WzU2uDsQ6Sy73l63FEF
 ouAXQQUR5d8a7naQBCNit1/fUmZO8+epw987yjerbEomixByMXoXo1DUwVwhDtI4sekDCnCyx
 w1coml7J3u122jTOuBYAtPFiLlipg5zD2ykzSF70TexmpR2k2dPK99KtRdMdcqQmOoIkiVuav
 VvXwAAQUNWHKuhIRXrfRdsjn8mkdDzsgYd8FYuGpKC2R9VQrcz1KIcPcbk+gjtLRg5w/60vJv
 xYL7nvJVW29AnIj3RHCh1+IXGZiugxTd9bSDHp72RBKF5l6BuaYuUijFnIJp03J/PxVR1m0NI
 ffRINTffP9ZJnbsq0ab0iTfFN1+1JzvPCv16JW6N6AjYtfeBUmZ2eR7i8hjEWdi8YTBDidpNd
 QaD+SNrF2ikFEqg59R/rO83L4M8madzoC/oDQ9MGDU2/9yJGLxGkWtjUSXqigevua5GAyovGU
 ZMaE5e+4Bjvyt5EOWNefnkO2n++avaV5I8rqt1lYOL7E9NFO4tJGHtuIn08QngABCDIu1jQnR
 MXrbACvRc2txIedUaSv7Ez8bmn2J2I5H12+aGQmF0bltxMRu2ehXBDfKIvVfc3nX6oDFs6zL6
 /MnvNVr3jbykSVeh+z/HDWTwC8QME6ADGVe43ME8aNtiV3pgfaq8Rsu0EbkWsNU14ZVnqalYr
 9qU+G6sQaQoyRKowur3lqG4ciBabX5ssVl3S6lxabdNZ3vpr0Ht8FvC7ogb3TLVdEP3q5437D
 6FgU90zuxG+oZP9eUR1iI6Y66pSis0n28l+w3KGV868ytmLrpNrAXUijUKMCJBaTRV8+3WnXB
 8p/1if3DqK6YyaEJ7mElmLvPneSHVb/KLqjI3+EbYxZiWmBE8PXQN+6+ILVOLuGzrUKVsQFFn
 xUcSVb2Wl2S5oRaALb8o6FhrNrHMLGSV/nCHM58mgMoqD
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The values stored in the length and condition fields of the alternative
table fit in 16 bits, and thus reduce the struct.

bloat-o-meter shows a reduction of -0.01% by this change:
Total: Before=3D10196505, After=3D10195529, chg -0.01%

$ ls -la vmlinux vmlinux.before
-rwxr-xr-x  14437324 vmlinux
-rwxr-xr-x  14449512 vmlinux.before

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/alternative.h | 21 ++++++++++++---------
 arch/parisc/kernel/alternative.c      |  7 ++++---
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/parisc/include/asm/alternative.h b/arch/parisc/include/a=
sm/alternative.h
index 0ec54f43d6d2..1ed45fd085d3 100644
=2D-- a/arch/parisc/include/asm/alternative.h
+++ b/arch/parisc/include/asm/alternative.h
@@ -22,10 +22,10 @@

 struct alt_instr {
 	s32 orig_offset;	/* offset to original instructions */
-	s32 len;		/* end of original instructions */
-	u32 cond;		/* see ALT_COND_XXX */
+	s16 len;		/* end of original instructions */
+	u16 cond;		/* see ALT_COND_XXX */
 	u32 replacement;	/* replacement instruction or code */
-};
+} __packed;

 void set_kernel_text_rw(int enable_read_write);
 void apply_alternatives_all(void);
@@ -35,8 +35,9 @@ void apply_alternatives(struct alt_instr *start, struct =
alt_instr *end,
 /* Alternative SMP implementation. */
 #define ALTERNATIVE(cond, replacement)		"!0:"	\
 	".section .altinstructions, \"aw\"	!"	\
-	".word (0b-4-.), 1, " __stringify(cond) ","	\
-		__stringify(replacement) "	!"	\
+	".word (0b-4-.)				!"	\
+	".hword 1, " __stringify(cond) "	!"	\
+	".word " __stringify(replacement) "	!"	\
 	".previous"

 #else
@@ -44,15 +45,17 @@ void apply_alternatives(struct alt_instr *start, struc=
t alt_instr *end,
 /* to replace one single instructions by a new instruction */
 #define ALTERNATIVE(from, to, cond, replacement)\
 	.section .altinstructions, "aw"	!	\
-	.word (from - .), (to - from)/4	!	\
-	.word cond, replacement		!	\
+	.word (from - .)		!	\
+	.hword (to - from)/4, cond	!	\
+	.word replacement		!	\
 	.previous

 /* to replace multiple instructions by new code */
 #define ALTERNATIVE_CODE(from, num_instructions, cond, new_instr_ptr)\
 	.section .altinstructions, "aw"	!	\
-	.word (from - .), -num_instructions !	\
-	.word cond, (new_instr_ptr - .)	!	\
+	.word (from - .)		!	\
+	.hword -num_instructions, cond	!	\
+	.word (new_instr_ptr - .)	!	\
 	.previous

 #endif  /*  __ASSEMBLY__  */
diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alterna=
tive.c
index daa1e9047275..66f5672c70bd 100644
=2D-- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -26,7 +26,7 @@ void __init_or_module apply_alternatives(struct alt_inst=
r *start,
 	struct alt_instr *entry;
 	int index =3D 0, applied =3D 0;
 	int num_cpus =3D num_online_cpus();
-	u32 cond_check;
+	u16 cond_check;

 	cond_check =3D ALT_COND_ALWAYS |
 		((num_cpus =3D=3D 1) ? ALT_COND_NO_SMP : 0) |
@@ -45,8 +45,9 @@ void __init_or_module apply_alternatives(struct alt_inst=
r *start,

 	for (entry =3D start; entry < end; entry++, index++) {

-		u32 *from, cond, replacement;
-		s32 len;
+		u32 *from, replacement;
+		u16 cond;
+		s16 len;

 		from =3D (u32 *)((ulong)&entry->orig_offset + entry->orig_offset);
 		len =3D entry->len;
=2D-
2.37.3

