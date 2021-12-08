Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A3F46D075
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Dec 2021 11:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhLHKE0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Dec 2021 05:04:26 -0500
Received: from mout.gmx.net ([212.227.15.19]:58807 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229504AbhLHKE0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Dec 2021 05:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638957647;
        bh=rdlGkRfdY/jpgDyk387k7PKEkFw15D1gHN0n58nTXjQ=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=P2A9nW5KPe276K0OL+m+cWZfZqjb65Epp3o0cyYF3OwQbHJ00PpXq99yX9niA/Rud
         tIqhuYXTHxCdAn9OTdZXrMhpf2Kte8ay72k78IPc5vDbia+LQORz9/oYVTL8++5xnm
         UHuSaj/j5xLgS1GGW0uPbJnSCAF1avdKmHceo4rQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.163.170]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2E1M-1mYKIb2kcI-013eHn; Wed, 08
 Dec 2021 11:00:47 +0100
Date:   Wed, 8 Dec 2021 11:00:34 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Clear stale IIR values on instruction access rights
 trap
Message-ID: <YbCCQtsFp7Dp0dWG@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:H3Epgs0z/WL1eyJYw/l0wn/lcbQ4ZNEAfxu5KonprXK1IRC1xqa
 o25v/qudZVvIcIWP337l7I0pyBb5jfLbVdQAeE/wGR3zSQTb7eDNgljauIw/FYpS3hX8PWR
 R1Jdflr9upCk5h55fiw3RoMWhvAgSVv2xYLRMTBbDC1685qEPLM49hvyKb/GEqLhbK9XBaQ
 DJ36CsG2qdsPYt3UCZh1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oFh1AitPh/w=:LprO0xSeVTtIAAaOMyBxzo
 OZ6q/GA5DjaOKgkgdGP8T8dW2b1eTWtiteRj8dcAbtVkENHLwGbs4MlX9h/u2Doga/4L417/P
 pILjD9qf89anPkd1Y6knsAMEjO9CLs9l39BJFx+2boeHVRDKSeJKHEQKpiquIDDbR56istIgf
 M66JyhEnsQy1XISQg5BlL7ipmWxD/BuDvTLuc3YxnbvspjHtvKevhqlOQCGjoxMMWKvOnbq9c
 oedZQUD/sKtqTWDMnP9/w5G5Erfb4L2/nL3CQ1dwOZMonz1DhzlB3MOZdj4goVBR6DtpY9lZy
 9YlRMKI3XiVUXXJA1ptsLbog7hlmxURi0jbCQ5sH/7QXgxb3Dk7/17SACO5chc1OSLt87DCnk
 uhxNzq4Qug7ySQc/zuNBO4xwmqEmrevcAjr76j0b9sv6eCu78qQJR9W//QWxMPuFTyvkz+SMa
 d+mrHcfsEgmZahl3DbPTw7hh6vYUsAp0XIQR8ab/s2BTE3YNdfUabC6k0iIOj1Er9voKMoEPn
 +7JZbQ0Kvxq4xAjWAaR3Sleqvw4L6iWezNVljAsSqwCXSkNCbwWJ0ASCHtkWN3+iCxQvH8wpC
 tIRXxlo306uHzwA0sWNVrMH2RmnL/+JaJMXHAr3dpq6WzyPun9k3yAdzOqQXoUY7TI6G0A37r
 gyf1XC8wxlwjh7lyTsbSSzvHqXdylPKiQx1RoyjxM86djFBKs2MdAFCR/AeMzN9zIMhZotWVs
 QY73NWBjloeXDI8DP4qFasZlcf2Uk/lS4QXnsWfV3J2DhGk80Mb8lpBV6BnWykv9vDp3Gr2wB
 NNcb98Wx+LMMEfBUgbZHCuHp2r4tpQCwuDAZln6LJ/cL8FcgrYsWKVg4tMM4ieLpL0NLcBQWE
 p3hI9cYe0Us40esc89TdPhkzRohQO+dYTm63WjDHHfW+wk4TU2WItGQ9F4YstAv7j7pbKOKYp
 x5GtVVdOO6nO0R4sKq4mtR62zqIUHe6fO9JJGQS609M7KsKrvPoFw/ALWMEVhZ3WmhSTo2pAL
 P8ehft8hB4AU3ykBwJpaxFLB8ivSRBKFJ/2RmeH5sF5yzUlOa3HpOLTL3NTUIqRsZST/NUfZ4
 XCqERxu5YZy8hV74utRYy3QFZtEIMFvsu4IkqezMG+UXvnn45/aPgGVCchVph8KlCNtOxIym5
 /H3z4IddQD5VRDqIsCn/0BDHnZ
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When a trap 7 (Instruction access rights) occurs, this means the CPU
couldn't execute an instruction due to missing execute permissions on
the memory region.  In this case it seems the CPU didn't even fetched
the instruction from memory and thus did not store it in the cr19 (IIR)
register before calling the trap handler. So, the trap handler will find
some random old stale value in cr19.

This patch simply overwrites the stale IIR value with a constant magic
"bad food" value (0xbaadf00d), in the hope people don't start to try to
understand the various random IIR values in trap 7 dumps.

Noticed-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

=2D--

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index b11fb26ce299..1e6dc2e34c16 100644
=2D-- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -730,6 +730,8 @@ void notrace handle_interruption(int code, struct pt_r=
egs *regs)
 			}
 			mmap_read_unlock(current->mm);
 		}
+		/* CPU could not fetch instruction, so clear IIR stale value. */
+		regs->iir =3D 0xbaadf00d;
 		fallthrough;
 	case 27:
 		/* Data memory protection ID trap */
