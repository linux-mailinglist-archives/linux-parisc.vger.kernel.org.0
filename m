Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E30884C1920
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Feb 2022 17:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243058AbiBWQze (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 23 Feb 2022 11:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243051AbiBWQzb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 23 Feb 2022 11:55:31 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C44025EB4
        for <linux-parisc@vger.kernel.org>; Wed, 23 Feb 2022 08:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645635296;
        bh=WFiy3z2HnZvePTT5VzZ1i9d6tq96VcnqVt/x/KW7AoA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=LzbGeIhCcY3Zx8+mdeX/sl3+O3Jfe9GDvvYp6VJe2q0m+zazEINSM9Vc7SpPBzWxk
         7/2yKDD9XB/VGf2xleGSncdy7uTUelRyREOd3Bmvcj8n/iyzbde2O9rEOH67qpcL2c
         HdwlNDGWq/4+GytP32ABkz1zoao1a2ydLZB4j5JI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.191.154]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOREc-1nacHu17cM-00PvgY; Wed, 23
 Feb 2022 17:54:56 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 4/4] parisc/unaligned: Tweak 32-bit inline assembly of emulate_sth()
Date:   Wed, 23 Feb 2022 17:54:55 +0100
Message-Id: <20220223165455.3764-4-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223165455.3764-1-deller@gmx.de>
References: <20220223165455.3764-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+JJc77G20F4H5bzlSXvAUn6kEweSDP87GPO+RmYXuXIOG8L6nbq
 a9wI8ukO6uAGX6udg8a0tNaSGHRs1yhOZWk4BLUeROm6xkFU31CPQVTfqyp5gMq+TRkAOxP
 PpsgKHr+C6j5qm1FEYkYeDjJdhudMEBADQfOcw2Tog9ufZl3VynYPDfRNTFBU53V0hRwWgU
 +BGGzOnN8CXjTwGDXzUTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZfXE3JToCjQ=:nMOv4KHridTxxWyOG+RhHo
 7VnXKcYkugSVRW612F4sCKX8bZWxLkDATBG5Kw3MwSaEVQxQYyzONiQwwCDLzHCpasNniiz+O
 J/B6LKoS+5l8chOwR6Ovj/14W8hY5R80UpsDDTX70Au/phs7faGYDeCf7ko/S6orM8NtiznPf
 a1Y7Y34aUeHQDFFcPEZ/votltZql0VFFuGBRAxVvZUMwa0aOn9I8CT0sYRiPT+MSAwgm2tAr6
 s3K9i4TpmdH75iO16P1moMPwqtQ9r4cEip3pvn84F1RkCPCnIfMrOz6pfanEqbvbfRWNJaT1q
 da/mGUVof/AORluIFeS3MrBFEbWjmCphLrWuTVSRw2/0vTLxnqWUGIDCwYTC3sJUCsbvTKyEn
 FAE5wa5hHCINL+pftHWJjFShPWfIyxLcT3gWEJRD5Ei+JQvIObOA/QiSCfk9FjDQi1/LrBgRM
 PKGMsn30TvPmrUykMhE2lB3osaANCa5UFkCltd44IvHO6P4qlDFQfvNZy3iFi6u9lJ9YpZKlb
 S2XUXxAl8xWCL1bjwgfkujkFFbRDXGSRojEOzi3ELYytfVerAhdlQ3NffYl1p3jcuZlZfcIgW
 pINQzH2B1BFgqe0wOuoi6kEVLgO1Hdsbz5vJspEAEgbgy5z3nBckVDAMySB7K/1RPtkCqL7LL
 Z0wdP4oR8k8N+z82nHJTaZNTlkJmtYqZt6LGn1JfRdkxrjZwxAxCN5y83ko79OyDFTTB6Ac1U
 DSv9IzEVULc0KhoRWac/kh4wIlfsv9rbBSXGtNQL8ebQE6kXXxToeuAi0hUeANTR+zT8PTuGq
 q/LTfH/jI25sxFCX7uBkvhurjHins6K2akni9jUtZWfRcjQDLWxB6lDoLYrlF4lMZFscRtwnf
 KUK90mbs55ZJDzjQrF1gD324FkhKVTmmEoPO30w/KAvqpLXcHYnb6FEQ0q7hDc0T1XSUIka4D
 hPbxELLDC5wuAXyaEdAgCnXmnmApVLEJWGEmaJMpS6h4EjWeedyBJxURbcGkfClo07qxL3aff
 10aXZ2Nc0vyHbvDPx73VySmTTeRJAt2Qp7ZMeRTajyP2umfJlykyH5dxEQ+fgooGoVVl0rcee
 iZs4JW7PIotzzg=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Convert to use real temp variables instead of clobbering processor
registers.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/unaligned.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned=
.c
index 8fbe000b33e7..0d6e90d6f497 100644
=2D-- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -234,7 +234,7 @@ static int emulate_ldd(struct pt_regs *regs, int toreg=
, int flop)

 static int emulate_sth(struct pt_regs *regs, int frreg)
 {
-	unsigned long val =3D regs->gr[frreg];
+	unsigned long val =3D regs->gr[frreg], temp1;
 	ASM_EXCEPTIONTABLE_VAR(ret);

 	if (!frreg)
@@ -244,16 +244,15 @@ static int emulate_sth(struct pt_regs *regs, int frr=
eg)
 		val, regs->isr, regs->ior);

 	__asm__ __volatile__ (
-"	mtsp %3, %%sr1\n"
-"	extrw,u %1, 23, 8, %%r19\n"
-"1:	stb %1, 1(%%sr1, %2)\n"
-"2:	stb %%r19, 0(%%sr1, %2)\n"
+"	mtsp %4, %%sr1\n"
+"	extrw,u %2, 23, 8, %1\n"
+"1:	stb %1, 0(%%sr1, %3)\n"
+"2:	stb %2, 1(%%sr1, %3)\n"
 "3:	\n"
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
-	: "+r" (ret)
-	: "r" (val), "r" (regs->ior), "r" (regs->isr)
-	: "r19" );
+	: "+r" (ret), "=3D&r" (temp1)
+	: "r" (val), "r" (regs->ior), "r" (regs->isr) );

 	return ret;
 }
=2D-
2.34.1

