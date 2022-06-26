Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B630955B47B
	for <lists+linux-parisc@lfdr.de>; Mon, 27 Jun 2022 01:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiFZXjV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 26 Jun 2022 19:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiFZXjU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 26 Jun 2022 19:39:20 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071A82BE9
        for <linux-parisc@vger.kernel.org>; Sun, 26 Jun 2022 16:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656286753;
        bh=A6fOJE9gObGjezlT8ct8L5wOlaQEW03uUX4MpQVrUYI=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=hCp2pH0C6i+GTR9VEcnH2A+9ZjVhrvC+sa78hHMihQN9Y3rAhcG1QX4bgTfqiXq7g
         uu8Ygs5eu7jZzCZAQ5F0e6jc1cfHJAIYixUmsBvwbBBrjKOeL1EiONa+P6ztYZ6PUQ
         yrqZoNaHAKjdZuOBQEB84DImmrKL4E6Mp5ynzPms=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1nP5Hi4474-00jqp0; Mon, 27
 Jun 2022 01:39:13 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc/unaligned: Fix emulate_ldw() breakage
Date:   Mon, 27 Jun 2022 01:39:11 +0200
Message-Id: <20220626233911.1023515-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3U4lHossOBkiHWtL76PXG3PNK0TC9WxRCqEVtUvptPq/0cM+4uo
 MWjrT9GTv3VP6/nEjfPSo8mKUxR3UgxmDjSFmho6wOsAN1yz2nS4PTuAUAtkWduOjQ+Fbdu
 zEz4P3m4yyqnT70GKYc6Z7LruzDxxij+RLppIgv9jpqHzcctMlkRKzGAjlkUtiwYSXq5wUJ
 LL6ggoVA/1Gm1BMSpV04g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EsnHIQ6SLi8=:Ef/JwdZX1wwBgeTs4zt1CS
 2fSxVzVxJI49dTQ1KXJCsplQ9/J730qyr073zlGiTsVxCb2NDN52AE4nlBlBOBFdvUCpzQ+RG
 nSBeKYtrxCYiHu2n3BRDsbbpuu5dD85oMU8m7QZkkEFbo2PisxUeWKhdwhfI2gk1JukRbQ3lX
 SzJvnEZfix1THYol+rPpRiRR+M7tQqplWHCSCDx0LMEk9T0I66Akq+3pJu4dRGJ4poNF8OsX5
 XxF16Vv62M5/EKoAfkpMiEoygrltp1h7gG0Trji5HO5Hbs8lqUh8T2kJHpBAewyjw2eOr34Wc
 rcNTeLbUOmNwNfvZS5V8+hpkL0GsyoF4EB+G9V8eLfMAxcsVqzyCvlizrBtKW0l8VZ2wqMmwW
 G2F9wrtUZtYBbUtPf5Rnbqpe0RKDdz4nC/rW+vCYQImCtdTjdyirsf8b4YvExFpRuNpjVZS2K
 xSE8Rt/xj9LLa8gpgxWJFzxlqFZ6O+Kj7b+C7a6JHfRaRA9gPbSJ49r1LO2gPyjZdgpVPAbMl
 JBKY+4oPZLcuw141dbhjVnCI/kgJTbJQtAOOMWnR2dCVjLfxhfiNffAJxRm4bdvR8bwPfO+sP
 d1pRPNjDFSd1p7c228JQLlHixgl9Ad0QZjOO1K61s4In7snPH/ibswQ4dMikG4BQd6siQykpD
 e47+FBSdhYXwHeFlbfECDAcrDhNqKKkm99+j0t4sYor+z3F0ng8S7TnHd/fg8BSVqAvkmGG0u
 sJjEYuFrDJmsjFaXwYOWr8R1tinUwkR4N8HL5XqHzXmtLpOBo6nQSvnGv0j3/d+JN9Ajll2rH
 Ri+wOXIgbst0ENwHMXQMM8oGw/KidqzrIr1PrbjEU0bk7OLzyf/AgMfq9067fTyx3qj43w+UF
 WdI34zUO5UUxL3yI9BFMFqUzpYjrhu+etxMDkfpDHE+ZMy5hUpngkK2ssGRaAsDSwv/NrgzaC
 EXkIYTXKNfjp9SKcfDAVuoHDnLmCIMg8VzvgbLuvE8H4Yit5vweOO6KUbqWQpKkNFME3uJdz1
 dC+EACUJwlFva5meHl93fcra2WbUETqa0y7h8FDcUP0CkthKosrgaUIDUccHRqzqwXAZrYE0N
 dw+9vIunlf0CK2GEeaovPlS3zBYbRJTY1CiQLUzbRRK5uvQ/xxk2QXu2g==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix the 32-bit ldw() emulation by using the correct register when calculat=
ing
the shift of two 32-bit registers.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: e8aa7b17fe41 ("parisc/unaligned: Rewrite inline assembly of emulate=
_ldw()")
Cc: stable@vger.kernel.org   # v5.18
=2D--
 arch/parisc/kernel/unaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned=
.c
index ed1e88a74dc4..bac581b5ecfc 100644
=2D-- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -146,7 +146,7 @@ static int emulate_ldw(struct pt_regs *regs, int toreg=
, int flop)
 "	depw	%%r0,31,2,%4\n"
 "1:	ldw	0(%%sr1,%4),%0\n"
 "2:	ldw	4(%%sr1,%4),%3\n"
-"	subi	32,%4,%2\n"
+"	subi	32,%2,%2\n"
 "	mtctl	%2,11\n"
 "	vshd	%0,%3,%0\n"
 "3:	\n"
=2D-
2.35.3

