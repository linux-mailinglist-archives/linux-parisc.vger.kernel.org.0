Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D61296A09
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 09:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375533AbgJWHCl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 03:02:41 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:55203 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S373768AbgJWHCk (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 03:02:40 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud8.xs4all.net with ESMTPSA
        id Vr5ukhP1WRk2zVr5vkM7Mq; Fri, 23 Oct 2020 09:02:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603436558; bh=4G763JRxq5EP+5lfPE4sy2YYRra+keEC2ZpVryeMm4U=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=kaTQsdOHZugBc/vEj/4GZfIAU6zR0iMF4D9GgrDAAYXwWGn9k1liW8MSAFnYfSG1E
         tEQQd1YQs56FshqPvcw1kUGD9xtmS7/5jUHv5IXFkfFFtS7r+XeU2FAd6TTP0DJdAh
         fNjejilCgB8OMHCfL7111WWfk4SQJm58GBPdirhoC7+gtEHC/sOqRHXenQKFOkSJfU
         S6pX7u0fbZOlXxvDROSc3WX/B/TEcs7/IqG1yvi+F0qkuQI1q1MOKssCVTVfp8LZYc
         RKUU2I9gKL4AJ4GNzPNuVPRHK4ZgIUxWX1qzh++rshg81aEsebqLFI6MiZVKsLOyx2
         y2YCellQ7UqTA==
Date:   Fri, 23 Oct 2020 09:02:32 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag
 usage
Message-ID: <20201023090232.3b56d308@wim.jer>
In-Reply-To: <b187505a-2ca1-c385-3b4e-16ae49f5c1ce@gmx.de>
References: <20200829122017.GA3988@ls3530.fritz.box>
        <20201020192101.772bedd5@wim.jer>
        <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
        <20201022173824.49b6b7f5@wim.jer>
        <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
        <20201022164007.GA10653@ls3530.fritz.box>
        <6f58641f-d4d3-ea28-3863-83a227aeff1a@linux.ee>
        <b187505a-2ca1-c385-3b4e-16ae49f5c1ce@gmx.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFp8KNXmyl1hFCGDNQCRuBgqnoxG4LqgQBoLUkSOp2nDtaDdqCOVnCP7IPwoBSs++4VKpE2W8oT4g8C/5xkVvaNJRWugy3fu74k14Jzzoo2Sm31t/NY/
 570D+JUr8e4wGpEM6nb2ct6ppyiCdEmnE8bPwII4QNsc/tjr/YvNVV+2Mk2f9xDWEs9PcDg9uFGARXiSsUr65Kx6UHRvCNYs3JOR5YsfgSL3f4V0lwNtprtA
 bSyly6YgiQrfMqJM6HnsOnLIL+uwmVg73+rw/wcszWoUwFUZFlJRLJA9Wq6d6HB7/QKNQ3p2600dqMKc/LS4Og==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, 22 Oct 2020 22:29:18 +0200
Helge Deller <deller@gmx.de> wrote:

> On 10/22/20 9:11 PM, Meelis Roos wrote:
> >
> > 22.10.20 19:40 Helge Deller wrotw:  
> >> This patch adds wrapper functions for the relevant syscalls. The
> >> wrappers masks out any old invalid O_NONBLOCK flags, reports in the
> >> syslog if the old O_NONBLOCK value was used and then calls the
> >> target syscall with the new O_NONBLOCK value.
> >>
> >> Fixes: 75ae04206a4d ("parisc: Define O_NONBLOCK to become
> >> 000200000") Signed-off-by: Helge Deller <deller@gmx.de>  
> >
> > Works for me on RP2470 - boots up in full functionality and logs
> > the recompilation warning about systemd-udevd and syslog-ng.
> >
> > Tested-by: Meelis Roos <mroos@linux.ee>  
> 
> Thank you Meelis & Jeroen for testing!
> 
> The big question is:
> We have two options
> a) revert my original commit 75ae04206a4d ("parisc: Define O_NONBLOCK
> to become 000200000"), or b) apply and submit this new patch on top
> of it.
> 
> The benefit in b) is that we will get long term rid of the two-bit
> O_NONBLOCK define and thus will get more compatible to other Linux
> architectures. This comes with the downside of (at least for a few
> years) added overhead for those non-performance critical syscalls.

The performance issue is resolved once the installed kernel
headers/libc have been updated accordingly. I think after that the
overhead should be minimal.

> 
> The benefit with a) is that we then step back again and stay
> compatible now. The downside is, that in the future we may run into
> other issues and need to keep special-handling in some other syscalls
> forever.
> 
> I'm still for going with b), and I hope we got all corner cases ruled
> out. Opinions?

I think the performance penalty isn't that great, but could be
improved, so I'd go for b) with a small change. The warning that it
issues seems redundant, because the immediate problem has already been
"solved", and because the proposed solution does not work:

+{
+	if (flags & O_NONBLOCK_MASK_OUT) {
+		struct task_struct *tsk = current;
+		pr_warn("%s(%d) uses old O_NONBLOCK value. "
+			"Please recompile the application.\n",
+			tsk->comm, tsk->pid);
+	}
+	return flags & ~O_NONBLOCK_MASK_OUT;
+}
+

The text assumes that the officially packaged kernel headers are in
sync with the kernel, which normally isn't the case as most
distributions seem to either pick an LTS kernel for their toolchain, or
keep the installed kernel in sync with the installed kernel headers,
but do not prevent running newer kernels and may even encourage doing
so. Simply recompiling the programs that use the old O_NONBLOCK value
does not solve the problem in most cases.

If you'd remove that if() { pr_warn } entirely, you'd probably be
rid of most of the performance penalty anyway.


Regards,
     jer
