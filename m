Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23CB4C191D
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Feb 2022 17:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243057AbiBWQzf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 23 Feb 2022 11:55:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243056AbiBWQze (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 23 Feb 2022 11:55:34 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC0549248
        for <linux-parisc@vger.kernel.org>; Wed, 23 Feb 2022 08:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645635296;
        bh=aIuSp5XEcCBCUpXkC5SFSqxsTRWBcfx3QCV5lEE+ycI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=JRPjlUe0865hHMJkMCLIp2bub+UdRbVMk8YxVE7gx8fwaCjxJG5ea+3XWmCQb1Xxx
         kBH5fz3+ZFrqpz2O727tijWHRtGLVzZX6n9gJrUKjTAiS1SmPQtCIqxlPkVCzAHbQt
         4ATGD188bk+0B4MWPZVLmxtDMM7JrqmuhvnwcZN8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.191.154]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqs0X-1o0uVC3lXF-00mqXt; Wed, 23
 Feb 2022 17:54:55 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 1/4] parisc/unaligned: Tweak inline assembly of emulate_ldh()
Date:   Wed, 23 Feb 2022 17:54:52 +0100
Message-Id: <20220223165455.3764-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+F/SQEpOwQs0YB+c8PZH2Bf9e3thnJtSjTvPDlVVxHWYdYKL+vk
 m1xvUjMu6HYOntgsyXWepfEHV/avcI7c+BNFS1odcOC3dlsKjt9egc9iKfKjotFR7H4Va+A
 DhRXX6DXzyRAE55ea8/v7bfStoyWCRM2sxshe6/Hv7v3nOKQOgbdFRhiWea0CchbLLVvp9V
 lz/D8f6i9oFYX0Jzw21hg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EeC9fhP9I/A=:QWt/zfts9PcUi3qkNZpi3u
 0POztU3UpcXytdtQJpS3GYCGEMwo+1lDiMZLbY2O4Vv2twZK/ZFe4sROp7HdRmX4swrqzVfVF
 WjhSC3qXyqje2UK2Ofqtvbua2x2Dq1jGPvHFVKTuEnPT3fZTM6grdJLGKV0bNeSy3IMghKiGw
 CyPHokdFnT+14o2UoLGfSct/MNnW4SMHUhvYoaowuneDqQEA+ymMD4A/Z/esX+9TDCQIvb9h2
 LLHDed0noui3ywQ+DsPOzoUdxi9v0WyjPHJnGCgF39TjhrSa7pTSfQ0ThC33y/voQKOz4FNsP
 A2jxE/2qOniqfZ0wDDs5/SNPSRuEW8girwPo1IxntZ2nLCcpO2EoFOcFFRgYyemSyIuspt0Hx
 Oi8CyZBNNXGqCfkM85FCzG/rtgzvFy5YZZpr/0wE3NPD6fwaXgiyQPszIOUuo524Z7WHggUnt
 WtZM3s7As8WnVEGF/lav6gehYODqJzwvxsweNqMrjCVkSDmTz+1eFWhittBoz0MLTSIcvWM3e
 jgSOFXIsAtjAzF3hGOVxR35PgvywWbv0Z6Ch2xH0hETgokga0TSCLxFjBnF+1wWDdmv82idJX
 5mmEQfoSyU4oycdgGJezD0+5cJsL835Qzbz1WswnyYIlwzQDqBDX3H/QnERoGiTgvriaLqDTn
 Unn5NGxcpdEQCiv34LMVPOZQ6Flwbb3EU4/xijlDBQOEdo9Fk0Kj3/tbj6o01XNOMD04S1lmg
 18waKXTn7XVrreUfOP9XVdI5HpwI6MyAIh3dKMzi83t+tIK8Xo0x9ued6ev3Ff2CXPNHXR5xR
 N44UH4wjVvEucC6Jk8KPFJiSfUpVxyXrF1m1A7Ibf1XVSJuUFLqN1YP/q0hBgE05kO6XMA9S/
 EZHy6g3xNiUki5YlArvTKFIGUliRkB2HwsSbBQAY00dC9vJ7DXgQjmyRIf0M00O1DxWxizw/s
 KeoKTKLPoTbrPTI4l9H0nDQg4gyZ06iz5NjSS/blSMWLILlNku4LQ1fhD8YdlWwdZk+oLmtP4
 sue7PD7IYI3mEv7//ElGTAd6F4hJumkxr86oFAsIKQy3Qh1zo6uUN0IXtrGhf+NAO/YazKO+g
 in1FvmDZCRW8oo=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Convert to use real temp variables instead of clobbering processor
registers.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/unaligned.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned=
.c
index 857dcc790122..b923bc135d29 100644
=2D-- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -113,7 +113,7 @@ int unaligned_enabled __read_mostly =3D 1;
 static int emulate_ldh(struct pt_regs *regs, int toreg)
 {
 	unsigned long saddr =3D regs->ior;
-	unsigned long val =3D 0;
+	unsigned long val =3D 0, temp1;
 	ASM_EXCEPTIONTABLE_VAR(ret);

 	DPRINTF("load " RFMT ":" RFMT " to r%d for 2 bytes\n",
@@ -121,15 +121,14 @@ static int emulate_ldh(struct pt_regs *regs, int tor=
eg)

 	__asm__ __volatile__  (
 "	mtsp	%4, %%sr1\n"
-"1:	ldbs	0(%%sr1,%3), %%r20\n"
+"1:	ldbs	0(%%sr1,%3), %2\n"
 "2:	ldbs	1(%%sr1,%3), %0\n"
-"	depw	%%r20, 23, 24, %0\n"
+"	depw	%2, 23, 24, %0\n"
 "3:	\n"
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
-	: "=3Dr" (val), "+r" (ret)
-	: "0" (val), "r" (saddr), "r" (regs->isr)
-	: "r20" );
+	: "+r" (val), "+r" (ret), "=3D&r" (temp1)
+	: "r" (saddr), "r" (regs->isr) );

 	DPRINTF("val =3D 0x" RFMT "\n", val);

=2D-
2.34.1

