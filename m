Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C415EE862
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Sep 2022 23:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiI1Vhl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 28 Sep 2022 17:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbiI1Vhj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Sep 2022 17:37:39 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70408A7C6
        for <linux-parisc@vger.kernel.org>; Wed, 28 Sep 2022 14:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664401044;
        bh=ro8G38JbqqoFoGz7lMaE6CS0CH99TpORhyFM+6Hh1ho=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=i/srHgdOXnGPp69D4LUfAhdWzwPbScbXko6/1Z2iRHGq1vB5Kgz46Y6GfJY6b1B6V
         2uCVJYOkBPdjyS2MrxJawbKMtY6gaQXPj5rdYG44p9OF0cvRgQ+026Tq+y6YjpFj8p
         xlo56Mbn7dskjGMKiINGAkxBJ9tgmVE4moctrQI4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.180.135]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlXK-1p3KGA0A6A-00jo8B; Wed, 28
 Sep 2022 23:37:24 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Reduce kernel size by packing the alternative tables
Date:   Wed, 28 Sep 2022 23:37:18 +0200
Message-Id: <20220928213718.819482-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JfyWy1R5nj6BvITLIdj/7jMeSsQIrPBdLeVNH6yqMjJx99miUjt
 BU6pWXamjxoZxk7j8ve/QeW+z8pnlpm9fEjajtUSstORQ1XIN/3Mw2aBxnio7m1QobVRWhq
 w3OivLpMVlKOxGrz5UaPb8Xi/NzXCpth1Wq7L7PgfVegMxIm/wPT/sVVzSd9giwwRKlDdTh
 hYD07fknrFEiRlx8qA7jg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2zd8zuFqHBc=:LJPCMpZBgQ3rFG4IXb9rei
 Cx3XSLutW01v8If5haS56oGqt1tcvZa1K6FJjuHsyMx8vLFxoaOVKQOdRVYgcFKMgttJ/DPtU
 gWgvEYYgF96Ten1BVM14gCmRJ6UkGLlUbExhvNb1AAv1uws4/av3DtKd3pPZenW02Xyznavte
 5YkojP1vc75PTwcxr8vJt2M0lLML4+DDH163DzF/k2dFrUrHWquR0PLmN4/7WKA+lcMlLqU+o
 0ZtBSZVE/H0AwdDRydP1BxMfFFzaRl+DdZcKT9eTyDKEwuf390HA5HZ/C0/JgQaog41pTIoXe
 wYCKm0ZS4Cc4/bmHd3BSE4mpbOO+W1wzFRvbDZ1Pd08pWwAXC/XHsTtI9SiVc7um8fPjJ66B+
 NRQj0VClg/KgESuKDSRoCnhQx7vGw8iBp0Q7IIPPbW2haK5aeXoE/6kWUUlPvMQ9Ruwg/wMAF
 whpleGksNRE1ay6Lc0waiS9RU+BOam+VqSqqk6xoisUGnmezdiYF7WjN5A1eAXsEjpqPogSj8
 QU4+gGeVpNTZVMvpByvWf0mj7jB+FuD8VmIfwVbjQDqVFbHF3o+T/cEZKOqjqtx55oYshvurZ
 CjzMbIEpXpzdqjJ1iSqIvWxT2RpAyMP416ipQDHSj8EBPYxRgCyydahg2jFzYVrgzjkr7Sssq
 T37veTtrPIm47q8/xbpuEghQO6X5LQjrxePFcB0tKwamUAi/KnoBoHNcrrsASedFyQn1gyFct
 mkuisXx76Z4keNtXmQneU5LMmquNCyILpIa5QVsKlu6kr52iGQUwBOR/2wO2tVMEotpaj7fuc
 MsKgSBiFG4uZfpxM/ns/9G3l/n8EkhslxT+tp7CzgC1qP20Y/tfaHAaM86qnkBBuaX03M2mVr
 ua4wbeNLiQgLYvTumbv1IUFw732BJqMtHR/drIJ6wJkQ9eOlWznQNAbAI1a2zBIwFeg48yNSi
 TJWRUXJdcR1zVRr/UCbNDRIH9h25rKoLlZh1LkqjoDIDDhNj9G9nwsIVGJ6ScDbWZpzpBDApI
 C2gqvmL0eSb8Bxj/JXsW06DawUSCYfvhHZu6FgrqQZdQugHlx4WpB/6L1ZOAX9tPFdy0kDOSU
 eFODRKAkOyPg6kKo0uHB9dr/1gOSW4cBIPYVjlA43t8F00PlY1P41RBVyqLtCSgJx9J4/jKZ1
 64rRe+GS5SUhz+Nrsniqzu7kEw
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

It's sufficient to use only 16 bits instead of 32 bits for the
length and condition fields of the alternative table.

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

