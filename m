Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECA52145C2
	for <lists+linux-parisc@lfdr.de>; Sat,  4 Jul 2020 14:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgGDMOJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 4 Jul 2020 08:14:09 -0400
Received: from mout.gmx.net ([212.227.17.20]:38363 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726667AbgGDMOI (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 4 Jul 2020 08:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1593864784;
        bh=ntqtRXriEvlTQZX7E9tgu9xYlAp6y6JNcyiMi9Omzoc=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=JUkMJUai3QzWrXqWeQMRITAMx7R/NnfqOVFG3I/eAblyTfZcqnZfDhhN5uxnrYnj6
         PD1dk/Zthh5vvRXSTl3SFcGggwHsyXTIVwbtuZGpZ0e9YE94oqnk3xTsAXEznlDJ4l
         H7U4NCPMEs+io6untnzXIA+3BRGJFaqLDlvUpC7s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ubuntu ([79.150.73.70]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MLzBp-1k9V0T04DB-00HwEN; Sat, 04
 Jul 2020 14:13:04 +0200
Date:   Sat, 4 Jul 2020 14:12:36 +0200
From:   Oscar Carter <oscar.carter@gmx.com>
To:     Helge Deller <deller@gmx.de>
Cc:     Oscar Carter <oscar.carter@gmx.com>,
        Kees Cook <keescook@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        kernel-hardening@lists.openwall.com, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] parisc/kernel/ftrace: Remove function callback casts
Message-ID: <20200704121236.GA3143@ubuntu>
References: <20200627134348.30601-1-oscar.carter@gmx.com>
 <97375269-f6f1-6157-c8a8-3b925232f00c@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97375269-f6f1-6157-c8a8-3b925232f00c@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:/qNr8bYfFud/XeUItqhmgkKVnnfxe46IOngSaoy6F0Qcr6uUaIc
 Tgljscv4oMiCP4kLp3uYe06SW9rXv5lRQMjr9C0q6HbdQanooc+Z07KPmfppUHLRZNG99n2
 GPyUSy5I5OAZttmQrI1+V3i34fhg6yOS704KXOiebV+gtwcorRToTiEyVpGRBPqu7ytjhFw
 q+zGA+Z+KRwc26UH0t85A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:co0hVsy69TI=:ANUkg5pptO4ssqtSkfsBjf
 SSolZ8XyQPs+cBQnZcJZ/p5PnlE8RJivOzLU/FrI/AUQa4xlX70G3zFEYK985+2TxWNcbUYHU
 PZSGx9pSTm7spZqJRJ5IbVVSTqg47tp11PMpSOOtvYSnIJhkrj+0fFlcoqLYa49SFdD5iVIQR
 97RCnqhjwnIGzXEmNFSrtIlpIbfdwp+EI9V2mTihRRXgIuKMvsZO4Z2Go/HnB+efD4J0dV2BK
 oaIdzjrB5oOjpXb83PCH7BFtASQNXuraqLazHEJiwdQ7SXW0pcPSGtPcDHfY480Vf2dZvBIvc
 uqicLGn5vdGJGAXsK30mLLsBmOdmLB0U4CJevkk/NolXL7n72VNF3Y+HzOoMDktfERGeaA9hx
 Gajsduj26xTYXN8ItPqAvMfgs0PB1jvpedoLcmKHQ1Wt9SwqMT5jdeUZ2VsfiyNfAd3cRVvh6
 EYbiZwYsApSemwB803jsmAgHcVePGyTEBxi6g6c2RZhYaZgu/hkFMGrPrkSfR2CmcqeFHrqdh
 fA178SJ1iHqqvrBtEqHTVVs93T+825EJ8NPx5OHQxo8FddAlj93oG4cBOaekbWFpK31QxSrEN
 uTSV1cEg+SO/NODCR5Hbi1Pdso4DnsqkkyxesbM2+DqYGKfCqNOJzvajt8O++B9tT89W/kSpu
 AcMC/0IJH/tdjXvPzVw6XgYKzZqjnqROr76YUoHDEP2u+gPz6c9/vF96Q7K7DpHkPGNcsq3p1
 e9vNO5SBNs5Xzd8GP4hP0dhuh7SfUhTC7KdnmgUNypFF3RcOCVO2w5NFFe6fEFMDbP+rM1Ft3
 +AXoogsSqr1YAaIpoICgpy6my+28a6YhbQn/tW8ghLGoKSRJdsYcVCQTRIUQdL8hUC/Hi41mK
 VPbfdtDl9B/hmMBzAXv5LIkW0DFDeB76KxD7YRyx34T3r+5EeHADmSS9YCnZIolMR2YrYaF5W
 Nt8jFni+/NfOUA/5fGY7IOoOzHHlFFpskZgIPY7bVTFYIj8Eu+rgrrqHfPSpBZ6j6BtXsz1BK
 uIhDEDCOFo2eIlq6fKMRXGWhplcUg2jqY4+xQ/fHiZz793u+wgNV6Ora7fm3H2Lcgojewl6c5
 NBhlkf2baB1n0u7OEoYSjnM3mhRzNta5QepPsHI0WA3VpHWB1H5ENzJ2rhAdrnF2yChHMPx2j
 1eYDzUuvUOQVC9ubFi5Oxkmlcf1sn4uykGFiaKSXAj4SguoxDh0bC9hmsGTerT0ItUNDNzN0F
 Ba77Texv2mtuEph8g
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Jun 27, 2020 at 10:09:40PM +0200, Helge Deller wrote:
> On 27.06.20 15:43, Oscar Carter wrote:
> > In an effort to enable -Wcast-function-type in the top-level Makefile =
to
> > support Control Flow Integrity builds, remove all the function callbac=
k
> > casts.
> >
> > To do this remove the cast to a function pointer type in the compariso=
n
> > statement and add to the right and left operand a cast to unsigned lon=
g
> > type. This can be done since the comparison is against function addres=
s
> > (these operands are not function calls).
>
> On some architectures (namely ia64, ppc64 and parisc64) function pointer=
s
> actually refer to function descriptors, which in turn point to the real
> function address. The compiler usually takes care of such comparism.
> That said, casting to "unsigned long" might break this...

Ok, thanks for the clarification. Today I have learned about function
descriptors.

> > Signed-off-by: Oscar Carter <oscar.carter@gmx.com>
> > ---
> >  arch/parisc/kernel/ftrace.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
> > index 1df0f67ed667..86b49a5fc049 100644
> > --- a/arch/parisc/kernel/ftrace.c
> > +++ b/arch/parisc/kernel/ftrace.c
> > @@ -64,7 +64,7 @@ void notrace __hot ftrace_function_trampoline(unsign=
ed long parent,
> >  				function_trace_op, regs);
> >
> >  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> > -	if (ftrace_graph_return !=3D (trace_func_graph_ret_t) ftrace_stub ||
> > +	if ((unsigned long)ftrace_graph_return !=3D (unsigned long)ftrace_st=
ub ||
>
> Untested, but maybe better use:
> 	dereference_function_descriptor(ftrace_graph_return) !=3D
> 		dereference_function_descriptor(ftrace_stub)

Thanks for point me to the right direction about this theme. I will do a
new version and I will resend.

> ?
> Helge

Regards,
Oscar Carter
