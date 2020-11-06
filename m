Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40DD82A8C9E
	for <lists+linux-parisc@lfdr.de>; Fri,  6 Nov 2020 03:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgKFCSC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 5 Nov 2020 21:18:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:37436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbgKFCSC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 5 Nov 2020 21:18:02 -0500
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 551CC20735;
        Fri,  6 Nov 2020 02:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604629081;
        bh=XqYBzQLL2R8K93EL5vhK41zMdWwhehJpa57Qou/yMpQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hdHpEkcMNXKCtuU96tu3ub7OvXqywxAlZMiXLgSEcLIwQh2DZdGSVHUKmzkmQZDYC
         C08FkDwLniYC4RjGvvlHRHtl5oVct1+N/E5vvS2Y9+ouoaCNUx2qlrv4d1o5ba6RhM
         hmeurZFiJvYdtDqv6cn6Td+FTBVYamEAJFURb1ws=
Date:   Fri, 6 Nov 2020 11:17:58 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] parisc: ftrace: get_kprobe() must be called with
 preempt disabled
Message-Id: <20201106111758.8b4d6d0197acec6ca4be9a2c@kernel.org>
In-Reply-To: <20201103074244.GA5615@ls3530.fritz.box>
References: <20201103074244.GA5615@ls3530.fritz.box>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 3 Nov 2020 08:42:44 +0100
Helge Deller <deller@gmx.de> wrote:

> As noticed by Masami Hiramatsu, get_kprobe() must be called with preempt
> disabled.

Doesn't parisc ftrace implementation preempt off? Then it is required.

Steve, can we expect that op->func() is called under preempt off always
on any arch or is it arch dependent?

Thank you,

> 
> Noticed-by: Masami Hiramatsu <mhiramat@kernel.org>
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
> index 63e3ecb9da81..dd356ad18aca 100644
> --- a/arch/parisc/kernel/ftrace.c
> +++ b/arch/parisc/kernel/ftrace.c
> @@ -207,13 +212,22 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  			   struct ftrace_ops *ops, struct pt_regs *regs)
>  {
>  	struct kprobe_ctlblk *kcb;
> -	struct kprobe *p = get_kprobe((kprobe_opcode_t *)ip);
> +	struct kprobe *p;
> +
> +	/*
> +	 * We don't want to be preempted for the entire
> +	 * duration of kprobe processing
> +	 */
> +	preempt_disable();
> +	p = get_kprobe((kprobe_opcode_t *)ip);
> 
>  	if (unlikely(!p) || kprobe_disabled(p))
> +		preempt_enable_no_resched();
>  		return;
> 
>  	if (kprobe_running()) {
>  		kprobes_inc_nmissed_count(p);
> +		preempt_enable_no_resched();
>  		return;
>  	}
> 
> @@ -235,6 +249,8 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  		}
>  	}
>  	__this_cpu_write(current_kprobe, NULL);
> +
> +	preempt_enable_no_resched();
>  }
>  NOKPROBE_SYMBOL(kprobe_ftrace_handler);
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
