Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1EA2A3DE1
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Nov 2020 08:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbgKCHm7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 3 Nov 2020 02:42:59 -0500
Received: from mout.gmx.net ([212.227.17.22]:37619 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbgKCHm7 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 3 Nov 2020 02:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1604389368;
        bh=JXoZ3DJs7tTf+9e90QZDxrRNntpyaMPfJgfOZiE4IMM=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=fDRhlBEqgdOzRajZyfAM/ObP1Sn4AhnRO237F4e2Mx2VKhEAt3nQnphIHgB/NEfzn
         b3+mPbriBD2e46Ld0vC0kACOYrVNyTHSN2z5T9QNLvg9hFjMdFPrpfC03tQSGjLJmj
         oSjLtKDGxVMXVf3BjWXtHAQowdiXD5NLva1XwZk8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.135.9]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5mGB-1kGZwh033r-017Fmh; Tue, 03
 Nov 2020 08:42:48 +0100
Date:   Tue, 3 Nov 2020 08:42:44 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: ftrace: get_kprobe() must be called with preempt
 disabled
Message-ID: <20201103074244.GA5615@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:J1J65whV6iiT+BfuDbI3SeizsD8NR4Tx2V0SrXDa4z0sNsPlB0k
 CpYeqOa0Mu8lGp70Jzsq9s7LP5qenc2w2Y/FryidTvFWFRNHzpzJUhZBI2tRQ1eXmlF4lAm
 Q6b0xd5pHj7f0kt8pDU3b+CwftdahQqn8keu2DcVGjkBYUTdpzWQDaB7IQQ/6Ztff2gCwDB
 PCy5N/LL+vL2QhJPhXlUg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Aq1iST3Xr8U=:8tQXLMpHsRUn2neehFtE5p
 cGdmoSJFViFfh2HzUv865pUfkX4q6nE2trrJ69+hHSOHNfGE2s4xxhX303uVyFzgSM8huSPvC
 8tQBz1XsoG0wx9FwVAM3jUzJHm86c5SaVnjPGHESYyhMQeCvNIij6tMd7/TjG/1gEXW2qtcDW
 7pJsA/y2IbSUrlVvuN78Zv6RSQAR7m6stXdRHlynratC+6g0WDzYs9Tv7spF/MbQCofeehxpC
 Ta4naORD0a8U4B8cxTKvy4gwaTzjdiLIMy/E0f1+IuNXfVW3K5+6x+gY53PbcyUcfQYTpRL5T
 xVIXS5L6DNbBADyMkJjQCqETTFsqaoMu3ft/L5GGPHv7O7ApdsH5xfDm+XzgxxBdja336QKtF
 8Ea7+zO8/ImTDQO9monmVodbmLLNWUwxjjNJ70fIq91wTk+ILnbMt4DBIrkavDRpauQosH2XO
 FpMiIVmqZJ2xEL2LT9C3uxrp7KQYt8AM0zwxviF4a/qgQHfYM26ZcG2QDs+9mbXa3ogoTNV31
 9Ug6ApR+eL64Kc30U4/s+oCZdkYIJyhtfZImEvjjUcaywHv8y+YAgGdby5x1eoR3DfyiHoxt1
 Sam9UGsGfhmyXK6gvGCrvd02CFp/L0eL0yjnnRe32PRDH99dUz+1syRtMiHFmy+vYvzOEDfax
 iFWWSdvSUiSY1a2J43XuNeSDT9RFGxit9UBP2DmIPRdqvyKeSoPVwk71sGOT4VwPGQX16iWD2
 JllZtHYw7kak2LpNsR7FjbQhYb/kmoMx+tBgx9sKw2z4uEI+gSEijqa5hxwqOIAfy5yZYfom/
 uJR3ywAZVXJJGMvLKXSLRCNl0l1Pgp8D0wkLAP3cWXe19oOnT/9RlrkMevFTkoeDRlZTjbCVl
 qHIqbalTeT7UtuiR7+Ag==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

As noticed by Masami Hiramatsu, get_kprobe() must be called with preempt
disabled.

Noticed-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 63e3ecb9da81..dd356ad18aca 100644
=2D-- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -207,13 +212,22 @@ void kprobe_ftrace_handler(unsigned long ip, unsigne=
d long parent_ip,
 			   struct ftrace_ops *ops, struct pt_regs *regs)
 {
 	struct kprobe_ctlblk *kcb;
-	struct kprobe *p =3D get_kprobe((kprobe_opcode_t *)ip);
+	struct kprobe *p;
+
+	/*
+	 * We don't want to be preempted for the entire
+	 * duration of kprobe processing
+	 */
+	preempt_disable();
+	p =3D get_kprobe((kprobe_opcode_t *)ip);

 	if (unlikely(!p) || kprobe_disabled(p))
+		preempt_enable_no_resched();
 		return;

 	if (kprobe_running()) {
 		kprobes_inc_nmissed_count(p);
+		preempt_enable_no_resched();
 		return;
 	}

@@ -235,6 +249,8 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned =
long parent_ip,
 		}
 	}
 	__this_cpu_write(current_kprobe, NULL);
+
+	preempt_enable_no_resched();
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);

