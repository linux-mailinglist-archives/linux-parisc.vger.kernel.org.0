Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E1916A05
	for <lists+linux-parisc@lfdr.de>; Tue,  7 May 2019 20:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfEGSTQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 7 May 2019 14:19:16 -0400
Received: from mout.gmx.net ([212.227.15.15]:53325 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfEGSTQ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 7 May 2019 14:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557253149;
        bh=GXWnyqTq9JXZVCf1Sjv/d7BtG+W/HEM63VNJDRNSkbE=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=BvN3BNWoRv9llAt9+1yWuKNa2FmMmZn5vtvtKI9i0+ApMntId7D6IWyCCeSHQXH6V
         /E+xQSMasD5ZfEkRBjjWBh0M282TPiCJPOtj7EExdPlkXwL5CptT1BVwaejgDIcNcY
         5/6W/OgyyOmy+lD4/vUrAs/pDcTSXMyguB1UESuQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.181.99]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSbxD-1hH9sq1tpx-00SxvL; Tue, 07
 May 2019 20:19:09 +0200
Date:   Tue, 7 May 2019 20:19:05 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Drop LDCW barrier in CAS code when running UP
Message-ID: <20190507181905.GA16683@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:PhqNhbicWiK7XxaYsCcUAydWg8QyTMGaKmsPiXx+bZvIPa2/aDr
 dVdjUQc1fLq/C+b2FWp+DvzTgJHvj6G+hWhinmZdWgwnfGnP95Mw3y7tq0FYzVvk+qAOa39
 zmtfIBWX8V9PlYi7zxy0IByiLfKzGD3NEajy3ikJQFXknh2xJ7S0GHXkwTtuF4xqMaHBXe2
 XDVh8470HQNrlAld8MvOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XepoeB8+8YE=:undtC4KcJyvuZ4o4Fzprzi
 Pc9O0FxlkIsXePmkcd0kyD/vgJ2nprotrTq2KbWrHA0OzpS6tisTkB6H0AHuvaGgeXE7aYUO/
 k1NloITtZtAY/5ZMICBB2aDhi3IDp8SJiKHW1neu649aGNQw86H99SfUewiUp29ZRZbrB/3K/
 MLyKkGYsSas0Q4l6wnZw9JqKi8PMkVbuy6N1lSrRAQq3CrJb8T6eFUdRYv8q1L+n2cZAuxxs+
 Ul51dMN6yXhh0Zs2LerJGqlWLlrBOPj/lzjsLoSmqPJGe9Ac0ocv/GYrHTgyqziOp1LgA6cXX
 tJ22tDOjo0MKL9A1oPESTXsxG1WXL2l0MVZ73z/gqd8xwC82TC+F/o5pC37RGfit4vq1USOII
 ucmNQ7ZTzijDOxHYDNocoqHLaFIbR3R0NZVBA4utipPuo5GtqbzqP/VHMHUVtrdoe5mOWJFKO
 tc7/noS5SzI7Wz61jukwCA5K76WaI+zDTfKNB7c5NpOyhi3ne72cltUYKbReZM7+x6RzC58ai
 yAP4w5BLz/rSEYSFnutVrw6GTyPHBrvN5eoSeqGlDnfdu6Yo/BJmNfL7pEbYqwINkNEZ1B6Oz
 A8NWqJ8ihTMsRl0tNao4zDDjvSzM7xyGVVnSgje24jc7xkdbKIH0vWLSFnIJlfqvDLwnCVn4t
 P7g10CK4UBwV5evfeyucpG6/XVysrh2918U/6FUkZbI+sipDgs1zpvO6ZEPN5r4E7evjj6z2h
 nJDcGmlTKk7fNgV+HutxcbtmWAY0Ci0e5CqDcfHmaG//FfUhkWl4JiaI2LG8cZlVOCq4c+YeK
 5ha2ODIjPpuLM8+UCJGDsUCfwcnEvt6g2UUUx3TZ7KUk5JqqlxV+ekxrC7qShd7qcP+69NJRJ
 k/B1iQGS50WKO0EWZD8TD0Oqi/oVM+1CuNXDVXUDOY0sX6/0oP34NEMlE6JlQe
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When running an SMP kernel on a single-CPU machine, we can speed up the
CAS code by replacing the LDCW sync barrier with NOP.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index e54d5e4d3489..97ac707c6bff 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -641,7 +641,8 @@ cas_action:
 2:	stw	%r24, 0(%r26)
 	/* Free lock */
 #ifdef CONFIG_SMP
-	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	stw	%r20, 0(%sr2,%r20)
 #if ENABLE_LWS_DEBUG
@@ -658,7 +659,8 @@ cas_action:
 	/* Error occurred on load or store */
 	/* Free lock */
 #ifdef CONFIG_SMP
-	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	stw	%r20, 0(%sr2,%r20)
 #if ENABLE_LWS_DEBUG
@@ -862,7 +864,8 @@ cas2_action:
 cas2_end:
 	/* Free lock */
 #ifdef CONFIG_SMP
-	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	stw	%r20, 0(%sr2,%r20)
 	/* Enable interrupts */
@@ -875,7 +878,8 @@ cas2_end:
 	/* Error occurred on load or store */
 	/* Free lock */
 #ifdef CONFIG_SMP
-	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	stw	%r20, 0(%sr2,%r20)
 	ssm	PSW_SM_I, %r0
