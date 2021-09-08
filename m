Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2914F404042
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Sep 2021 22:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350509AbhIHUq6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Sep 2021 16:46:58 -0400
Received: from mout.gmx.net ([212.227.15.15]:58937 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350507AbhIHUq5 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Sep 2021 16:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631133943;
        bh=8d7ZSLcb7d0TOxgCagafc+5WDsH8LCwEDmhoEPyeGnM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Bt4ejq5wgReZ1e9lWBf7G79CTFZKtVjYeM1cCv1LXl7oTFj62/qQ0w0D3ACodrlIu
         EQ2qYRT1GA646m9GINbqduOBNbGw4ah00EBiuZZ2uMWXVwfj439sgyPcR0GsRBKAut
         zFjhlONKRYeocF5CLfH6gIKmziZvHxhaPHG4jclo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.187.121.129]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mwfai-1n93EL1AJW-00y5Jx; Wed, 08 Sep 2021 22:45:43 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 2/4] parisc: Drop useless debug info and comments from signal.c
Date:   Wed,  8 Sep 2021 22:44:03 +0200
Message-Id: <20210908204405.127665-2-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908204405.127665-1-deller@gmx.de>
References: <20210908204405.127665-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+YzxvjwDUf2zjXTJdyHyOUPefo99TLZWmsmsl/wJHrp0qFSTr1N
 yrtr3ihRZDsQ2yS6HgyuqOQYURsVn62cg6h48uImWq1YAORF9+6xLC8dNaDVo15sNdrKAlH
 5Ur2HfRy77wEOzrYrv0+DAQJ3EuWAs6zTwd3ImTAAlEgl/KailDDYUDL3uvraJ6qC//dbM+
 cX7Ml3azXwenIcg+Mfi2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M5AiObE1Lh0=:RNa7z1PrHj+hU7GjHFCpEV
 mxHouNqizNzuPlwGANnIr4FxhCxA4D83F8dTlYquc+yDGgHPU6Bd5VUNxWa4D4Wth7X8sli3C
 U4/8yPcM1T96iTlrisFaJXB+m/H+ByTN9jom7N+iV3QKPirStm/spmCbVAZfIjwj94rIC0VXZ
 bFE1qtjCJusV/9no2afKCLaEzIKYbl2cmAvHop184BeLrDEluYokmu9aG1WP75ud8IOC+s9Ff
 z3+v+QCl1SrW/qUhsWw7CwGmuZiPhkJyTbMdHviGA9823ifuGTG18TzCS04OTMAwPLNh3FgG8
 ma36+UsEEeQPECP+re8nTONWdrtDtKJnS10JXwJn7xJfgYEkVJyC7LBdFTI7tUhlEjlyemvDv
 MbKXETNGr2q/+luvTrwQUEImh/vwDYBNKmb/zvmHAddSS2TVvCRPG7im+3JXFCQ+htVmIGD7I
 6fZVRX5yy0Auq8LE1wwi2KHSwWz91vaBCkVfunTEiHE+0HAxDrJiI9JV28HbJfsuBA+S6ZOIu
 yNov/xXU+6MuFXK8j1T1vQ1G9uMJ62MoizWsXsa3R6eE62SRRBUMg67/E2PX+46t9baNotv6T
 iU5WdsaDdCmsSuxe3fEYv0n7sFvwsnyNCcI2fOB3y3H9qX6IvD+HOlFGWfOPAblheTtkqHz5n
 aIh9skdPe2811OTd8jTW2lDNA/FDPwkh8BP0qpCcyp4c5dOcoiROSbAwzUvllCQFNIx3mfmli
 FAfCFqhcidFkW+QPPGnldbf6KRDOCSHwZEppVNhlmM6yYSNt30mfBO+CaH2N0TSErRVM8t/Av
 auWlImAfijEaHhXVzFF7lm2QSaOW3WN7JsSbqN81GqpumLa5MiKdvZbhNSExCz23JRug8TdpM
 V6rtqZ7q7++R8T68xuUm4R3g6B8ggnDs/cQwgfcbcPsgazDRbaaeFkgKrrzrGXtop5JUSIOWW
 g1Tkw5hQzRojuMLkr8+gjUOHM8kIt7Nc1Q+WkeR57HWrnKsh4qc7pB40LMnfQCeNeQgu3v9Pe
 hNi0zB4toAeS/zx+vaC6ljUjLSzqncm0K+WuK7l/osgUIE8RUB9ChQIYtFKm5/UTAr+6VjUuo
 M9t6XLDbRZrHks=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/signal.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index db1a47cf424d..77db707ce391 100644
=2D-- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -293,16 +293,6 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, s=
truct pt_regs *regs,
 			&frame->tramp[SIGRESTARTBLOCK_TRAMP+2]);
 	err |=3D __put_user(INSN_NOP, &frame->tramp[SIGRESTARTBLOCK_TRAMP+3]);

-#if DEBUG_SIG
-	/* Assert that we're flushing in the correct space... */
-	{
-		unsigned long sid;
-		asm ("mfsp %%sr3,%0" : "=3Dr" (sid));
-		DBG(1,"setup_rt_frame: Flushing 64 bytes at space %#x offset %p\n",
-		       sid, frame->tramp);
-	}
-#endif
-
 	start =3D (unsigned long) &frame->tramp[0];
 	end =3D (unsigned long) &frame->tramp[TRAMP_SIZE];
 	flush_user_dcache_range_asm(start, end);
@@ -501,7 +491,6 @@ syscall_restart(struct pt_regs *regs, struct k_sigacti=
on *ka)
 		DBG(1,"ERESTARTNOHAND: returning -EINTR\n");
 		regs->gr[28] =3D -EINTR;
 		break;
-
 	case -ERESTARTSYS:
 		if (!(ka->sa.sa_flags & SA_RESTART)) {
 			DBG(1,"ERESTARTSYS: putting -EINTR\n");
@@ -569,10 +558,6 @@ insert_restart_trampoline(struct pt_regs *regs)
 }

 /*
- * Note that 'init' is a special process: it doesn't get signals it doesn=
't
- * want to handle. Thus you cannot kill init even with a SIGKILL even by
- * mistake.
- *
  * We need to be able to restore the syscall arguments (r21-r26) to
  * restart syscalls.  Thus, the syscall path should save them in the
  * pt_regs structure (it's okay to do so since they are caller-save
=2D-
2.31.1

