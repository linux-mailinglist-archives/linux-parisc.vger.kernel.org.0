Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 189CA6AFE4
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Jul 2019 21:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbfGPTbQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Jul 2019 15:31:16 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:34297 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbfGPTbQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Jul 2019 15:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=oE9nXmMjyTRZN4NkgHg5wAldIc8LFw4+BveSHDILNRU=; b=YIFkcSO8Ho1qweUAWl1AzmBOWY
        GZfxQQ41Kqw4xfpclqAz5VpYBVsWKztLytBCsgdkUTkgZqvAm33egCZY/6PkSkQjJfhfvwu8i8grP
        8OwsaFlIH61D8gKI1lqAonvgesaDR1KHRWt0C9BIalSWfw0ym1QsU5NLNDP6P0Ru9FcA=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hnTAO-0001W5-4L; Tue, 16 Jul 2019 21:31:12 +0200
Date:   Tue, 16 Jul 2019 21:31:10 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Avoid kernel panic triggered by invalid kprobe
Message-ID: <20190716193110.GB12537@t470p.stackframe.org>
References: <20190716191626.GA6959@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716191626.GA6959@ls3530.fritz.box>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Tue, Jul 16, 2019 at 09:16:26PM +0200, Helge Deller wrote:
> When running gdb I was able to trigger this kernel panic:
> [OOps]

> Avoid this panic by checking the return value of kprobe_running() and
> skip kprobe if none is currently active.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: <stable@vger.kernel.org> # v5.2
> 
> diff --git a/arch/parisc/kernel/kprobes.c b/arch/parisc/kernel/kprobes.c
> index d58960b33bda..0385a8fd74aa 100644
> --- a/arch/parisc/kernel/kprobes.c
> +++ b/arch/parisc/kernel/kprobes.c
> @@ -133,6 +133,9 @@ int __kprobes parisc_kprobe_ss_handler(struct pt_regs *regs)
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
>  	struct kprobe *p = kprobe_running();
> 
> +	if (!p)
> +		return 0;
> +
>  	if (regs->iaoq[0] != (unsigned long)p->ainsn.insn+4)
>  		return 0;
> 

Looks ok to me. I assume this happened during single-stepping?

Acked-by: Sven Schnelle <svens@stackframe.org>
