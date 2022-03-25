Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009B14E7531
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359345AbiCYOkX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359351AbiCYOkS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:18 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9EB972DB
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219115;
        bh=OxcoQczI/0Cr52qdPAjGZ9CUMYyrPLyk9TUFyHKkrZQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OBr6JJnz4It2eGkCeZNUPDBpTV7vlHfxo08x7lwcQC18n2RpR2wPZMdcSL4calBWC
         ZOzlshuUttecWeAs4106QYJ6h+NsTj7zbD6hJiZ/26BpxVrlsJG6urg71+yiEeb3pV
         hJhEYv2aL/cPQXGP17BEjahZI9FYU1SWoAIUs90c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9UK-1oNFi324BQ-00s5G7; Fri, 25
 Mar 2022 15:38:35 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 08/12] parisc: Move init_IRQ() into __cpuinit section
Date:   Fri, 25 Mar 2022 15:38:29 +0100
Message-Id: <20220325143833.402631-8-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qTJtg3u8q366DIplyC9ct8sH8EUo4i9AqcDVdobB9uCw7n6r5s9
 lBlEvRljxyym1VmboUCSj2X5G4O+8Gx1w6kU0qUruPI66KB8R9ilf3dV4v57JKq+zaUP8gB
 H30G4yhwepxIp2WMhNstGcYFNBV43HX/eUwfrNyhgzY/gABuYuqMjQZLWLBkN6DHYwiVamC
 9gl2/nTqxoP0mfXM1zLWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aOt72KrgqwI=:tVaiMDyg1+YvTUXkyAPmDs
 VnmJ+TbnPiM49NKbe+prN2I/xwje4/bIHoFnDx0Z9D+yKl37agEBNPyhnBTLBOaqyLpnzCzEL
 PGUb58fjdYTOYvPRkg4MXbBTcD5Efof92Pzak+wt4k54SGvNEVI8MHa4gPGv/YfAAs0Gzeh2m
 fCYxfJ9E3QXWcSOKqFylCOyLXkbcnbAkgvnpUstVv2CGQA9P6H2uIDCyIbCgQD4LBbHxl7iBJ
 GVvCzz/JsMFuxaQtknm/YmwoKehed3ZRegKbtjNw+6iqpil+SD6yD5swThf6fsiDCAdMGSgR5
 9rX8ZLFJoiyonI9Ftwj2uFlgz0VoAd5wFQnrnnYIlgTujQUeJpvQuZN1uxyiKJ5rOlpiKQkT6
 xJ4qQViBsjgft1Cc3EtOQ68TOTY/zINU9SixLOV8wABYkPMHn4gDerWa0ct82o1hX3MxqGud5
 qKanzVwj6e7Rb0SlNHKOMQziO9j3kuksMDgNa46Ma8oBpjAhry60yjTRpnlhkNwx9zoi7nhZu
 YvGYuNE8lQN7uLj2QBW3xKoeh2JNcTsKegleTY9XhIJdUYGd7k28wR4Td4SPsN0H2YrgTyXTL
 88OfWUHAT5cuERzHduu4rixYdYdlWgz6FpKhWH/s4Mhkyykz4TXkh7+GLLfzoDmb38oiSOo4g
 wAQ3J49j5sD2ES1iLQZIeRdmzRCEr6PhxW9RGjB5biEaQDyl+8Dt3CV2YNbM9dvLOLkqD2LnS
 eCFeJv7WuBOgVmqvQofxZVBnR5wlSP4KA7TBRDrnhAi6U0pAuzDfZ7C2vZcZCuobe9ebT6L7s
 Fwi0qpWxelj9gsrJAcahF47rnQq4Sm7+u1rBdFHOpaz+MH9YkYt14SqnxGxi8b203dxZXY9yN
 nCyE0sfD40GRPEKSEgOLisPdge6vS/IY7alng4XLl1B6DiZT7H37FJkfpttehlUX1B0XnqkKh
 UUFVk+XhPpLF/G8vQYl6SS5bsYGcBaJ3FDn8xcbJFgVxS8SrWncxmWE9zAfVXf+HHUkYGsDZ9
 2Q0SPgtTjmsorl75qG8KxP54GgnpnOkjXi3AYI0/7jFLwcdhAyPuyH/OaWOihsgMCGSemP6id
 iKckr5tUkj2nBs=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index eb18e16362f6..a8372db32492 100644
=2D-- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -582,7 +582,7 @@ static void claim_cpu_irqs(void)
 #endif
 }

-void __init init_IRQ(void)
+void __cpuinit init_IRQ(void)
 {
 	local_irq_disable();	/* PARANOID - should already be disabled */
 	mtctl(~0UL, 23);	/* EIRR : clear all pending external intr */
=2D-
2.35.1

