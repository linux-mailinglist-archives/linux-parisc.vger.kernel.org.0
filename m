Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28E504C191E
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Feb 2022 17:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243052AbiBWQzf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 23 Feb 2022 11:55:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243053AbiBWQzd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 23 Feb 2022 11:55:33 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF1E36B70
        for <linux-parisc@vger.kernel.org>; Wed, 23 Feb 2022 08:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645635296;
        bh=nGM1QQCRCwAe/LWDeH/TBmOGkkN5SOBljxBuDGSaav8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XSG/IN/nV2yNfzo9sCVCsmXodtjr31xtnIAlAk6nbYMcjadHc3uAJgEqjbStRIS/P
         0sYVqexOZ6Roj4uAOMp5txUuXzGVIpeK1/WypM50DgR9e7vfiUi+3OTVqMwR1vT1Ff
         /g+RKMHwz2CpOYQuxWoJ2bH8toZd5/6kxfKle7Vo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.191.154]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzfl-1nlJWL079l-00XO3x; Wed, 23
 Feb 2022 17:54:56 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 2/4] parisc/unaligned: Tweak inline assembly of emulate_ldw()
Date:   Wed, 23 Feb 2022 17:54:53 +0100
Message-Id: <20220223165455.3764-2-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223165455.3764-1-deller@gmx.de>
References: <20220223165455.3764-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A3qA8z92TTmh7feIsydA4mENBpMcie67nPQ+0IYv1v9VScCOJsU
 dEmBqs7JBkPq75i1zggjsoEWAjPDAD01jbCzHm9clrNWxfCFbjWefOFNMzwCaX4/kazzPHh
 eFCxuYwCvEVNo2zOOBcjk0GGF959w74RzgQbctS6tXPhH8M4jfJ2PAbgMEdlK+ToCdxFyA/
 inRYu/qqwRBpIyXBQaQeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3gBnCdcRltk=:x/eZTOMh01tA5wvkUtK76s
 OBpXbFnCeZzVQb7VBJB60OCMfvwSP7pZjybWVN3G8R6DhAvh7LVauOjiSjBB0npXrA0ANz7mT
 VhR9Wh6vjaommQGtTeEyDdYBCxVygbBmTF6uC4NnsllJ0zevUdeGR4c//SGpQFzG/Rmwa2dwt
 kIaX6gpHhjEWqJ+kvkj+LEee5Xz0tNHecfirXkWC/YLPiAA+osMwa4I0H0jGHF//E3mb1jGnd
 yXnJNz9JAnOeYOfnpAd8rsTqxnWOFLbAp6Y+gLCz7U+kx4YN4jqbXspCeJa/BWZya26K7L78k
 jAgcYWG7Wkx3Fgu4BVeIDQnmjhy8PS1GpgK86eRzcCVFmIBplAldz07Se0AOje5D3gOr5Vnlf
 fErJv+YV3Zk5xdLvz507me3FfzKdgA7cRrkzQIpb95alKcsC0imyuw0Tl1iKtmBbmYbd6jpB5
 dIXUESMz/6nyu+TtuEhoQlayHaxIrroI4KqrvCidJ29/HAk1fJXFBPImh/Rq0zn0kSMLZvGZk
 L/gw6zoxf0OM5f1OON0VCWC4gvOhlfwg98wKN99XOYLf5u0JH4h/Uuky42ok3LrQd0fKXFpbQ
 e87/SSc/Imd6HpwhdCNwy/DuwIDPgj0hTfkVAf4IXor9sWt1F7Ve+9zpqxNC6LmY4EKL/JWym
 TLvOkRYB6/hhS6crFA77YasHIN73eTxZyMIL3dl/ZGY9cmqICM+Oy+fxyg8CGQzQa/2pAdSlt
 zzpst6W0equUTznIOe7lWArL3Fm2UellcudM2mH15F8/qc02hFNwW3cUEAD/VmYwKEUTY8qzt
 esTKM01Ry80r31HQ4+NLm2DurGDRrtiWO4MOBCnEumtIXmxAcCIvcS6TKrhhjwgZ3r5pKm8Wb
 ErCkm0C9uGv1y0OIq1u+9n3mI8ly5ZBZMtbOcBUm55PUVWE7eiRWUxw/S0aOOFYFzdPmskmWp
 cmr2rvduxczFMU85DU1nG26cV5nCdy2d1Ih5Ux/LI0eex4EUZE2au1u7+wl5K3cYdgnRVbqN3
 PIem5ZLGSGV11uPX9CKnwSwVFy+O2PK8seCOUZc+uUd7rZRKTDZhDLD0ocHbtN9RHaY8Rj8fl
 iRyjmYIiKb2ERE=
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
 arch/parisc/kernel/unaligned.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned=
.c
index b923bc135d29..e8bc0cd8140c 100644
=2D-- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -141,27 +141,26 @@ static int emulate_ldh(struct pt_regs *regs, int tor=
eg)
 static int emulate_ldw(struct pt_regs *regs, int toreg, int flop)
 {
 	unsigned long saddr =3D regs->ior;
-	unsigned long val =3D 0;
+	unsigned long val =3D 0, temp1, temp2;
 	ASM_EXCEPTIONTABLE_VAR(ret);

 	DPRINTF("load " RFMT ":" RFMT " to r%d for 4 bytes\n",
 		regs->isr, regs->ior, toreg);

 	__asm__ __volatile__  (
-"	zdep	%3,28,2,%%r19\n"		/* r19=3D(ofs&3)*8 */
-"	mtsp	%4, %%sr1\n"
-"	depw	%%r0,31,2,%3\n"
-"1:	ldw	0(%%sr1,%3),%0\n"
-"2:	ldw	4(%%sr1,%3),%%r20\n"
-"	subi	32,%%r19,%%r19\n"
-"	mtctl	%%r19,11\n"
-"	vshd	%0,%%r20,%0\n"
+"	zdep	%4,28,2,%2\n"		/* r19=3D(ofs&3)*8 */
+"	mtsp	%5, %%sr1\n"
+"	depw	%%r0,31,2,%4\n"
+"1:	ldw	0(%%sr1,%4),%0\n"
+"2:	ldw	4(%%sr1,%4),%3\n"
+"	subi	32,%4,%2\n"
+"	mtctl	%2,11\n"
+"	vshd	%0,%3,%0\n"
 "3:	\n"
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
-	: "=3Dr" (val), "+r" (ret)
-	: "0" (val), "r" (saddr), "r" (regs->isr)
-	: "r19", "r20" );
+	: "+r" (val), "+r" (ret), "=3D&r" (temp1), "=3D&r" (temp2)
+	: "r" (saddr), "r" (regs->isr) );

 	DPRINTF("val =3D 0x" RFMT "\n", val);

=2D-
2.34.1

