Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDF5EE0EC
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Nov 2019 14:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbfKDNWe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 4 Nov 2019 08:22:34 -0500
Received: from smtprelay0077.hostedemail.com ([216.40.44.77]:50517 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727332AbfKDNWe (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 4 Nov 2019 08:22:34 -0500
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id B0C64180289B8
        for <linux-parisc@vger.kernel.org>; Mon,  4 Nov 2019 13:16:30 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 3E06C18223820;
        Mon,  4 Nov 2019 13:16:29 +0000 (UTC)
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,rostedt@goodmis.org,:::::::::::::::::::::::::::::::::::,RULES_HIT:2:41:334:355:368:369:379:541:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1535:1593:1594:1605:1606:1730:1747:1777:1792:2393:2553:2559:2562:2689:2693:2895:2899:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3871:3872:3874:4117:4250:4321:5007:6261:6742:7875:7903:8660:10004:10967:11026:11232:11473:11658:11914:12043:12050:12291:12296:12297:12438:12555:12683:12740:12760:12895:12986:13148:13230:13439:14096:14097:14659:21080:21433:21451:21627:21796:21966:30003:30012:30025:30036:30045:30054:30070:30089:30090:30091,0,RBL:146.247.46.6:@goodmis.org:.lbl8.mailshell.net-62.8.41.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:25,LUA_SUMMARY:none
X-HE-Tag: bun95_37f61587f310e
X-Filterd-Recvd-Size: 6513
Received: from grimm.local.home (unknown [146.247.46.6])
        (Authenticated sender: rostedt@goodmis.org)
        by omf13.hostedemail.com (Postfix) with ESMTPA;
        Mon,  4 Nov 2019 13:16:24 +0000 (UTC)
Date:   Mon, 4 Nov 2019 08:16:20 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        amit.kachhap@arm.com, catalin.marinas@arm.com, deller@gmx.de,
        duwe@suse.de, James.Bottomley@HansenPartnership.com,
        james.morse@arm.com, jeyu@kernel.org, jpoimboe@redhat.com,
        jthierry@redhat.com, linux-parisc@vger.kernel.org,
        mingo@redhat.com, peterz@infradead.org, svens@stackframe.org,
        takahiro.akashi@linaro.org, will@kernel.org
Subject: Re: [PATCHv2 1/8] ftrace: add ftrace_init_nop()
Message-ID: <20191104081620.732320a8@grimm.local.home>
In-Reply-To: <20191029165832.33606-2-mark.rutland@arm.com>
References: <20191029165832.33606-1-mark.rutland@arm.com>
        <20191029165832.33606-2-mark.rutland@arm.com>
X-Mailer: Claws Mail 3.17.4git49 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 29 Oct 2019 16:58:25 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> Architectures may need to perform special initialization of ftrace
> callsites, and today they do so by special-casing ftrace_make_nop() when
> the expected branch address is MCOUNT_ADDR. In some cases (e.g. for
> patchable-function-entry), we don't have an mcount-like symbol and don't
> want a synthetic MCOUNT_ADDR, but we may need to perform some
> initialization of callsites.
> 
> To make it possible to separate initialization from runtime
> modification, and to handle cases without an mcount-like symbol, this
> patch adds an optional ftrace_init_nop() function that architectures can
> implement, which does not pass a branch address.
> 
> Where an architecture does not provide ftrace_init_nop(), we will fall
> back to the existing behaviour of calling ftrace_make_nop() with
> MCOUNT_ADDR.
> 
> At the same time, ftrace_code_disable() is renamed to
> ftrace_nop_initialize() to make it clearer that it is intended to
> intialize a callsite into a disabled state, and is not for disabling a
> callsite that has been runtime enabled. The kerneldoc description of rec
> arguments is updated to cover non-mcount callsites.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

> Cc: Torsten Duwe <duwe@suse.de>
> ---
>  include/linux/ftrace.h | 35 ++++++++++++++++++++++++++++++++---
>  kernel/trace/ftrace.c  |  6 +++---
>  2 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 8a8cb3c401b2..9867d90d635e 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -499,7 +499,7 @@ static inline int ftrace_disable_ftrace_graph_caller(void) { return 0; }
>  /**
>   * ftrace_make_nop - convert code into nop
>   * @mod: module structure if called by module load initialization
> - * @rec: the mcount call site record
> + * @rec: the call site record (e.g. mcount/fentry)
>   * @addr: the address that the call site should be calling
>   *
>   * This is a very sensitive operation and great care needs
> @@ -520,9 +520,38 @@ static inline int ftrace_disable_ftrace_graph_caller(void) { return 0; }
>  extern int ftrace_make_nop(struct module *mod,
>  			   struct dyn_ftrace *rec, unsigned long addr);
>  
> +
> +/**
> + * ftrace_init_nop - initialize a nop call site
> + * @mod: module structure if called by module load initialization
> + * @rec: the call site record (e.g. mcount/fentry)
> + *
> + * This is a very sensitive operation and great care needs
> + * to be taken by the arch.  The operation should carefully
> + * read the location, check to see if what is read is indeed
> + * what we expect it to be, and then on success of the compare,
> + * it should write to the location.
> + *
> + * The code segment at @rec->ip should contain the contents created by
> + * the compiler
> + *
> + * Return must be:
> + *  0 on success
> + *  -EFAULT on error reading the location
> + *  -EINVAL on a failed compare of the contents
> + *  -EPERM  on error writing to the location
> + * Any other value will be considered a failure.
> + */
> +#ifndef ftrace_init_nop
> +static inline int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
> +{
> +	return ftrace_make_nop(mod, rec, MCOUNT_ADDR);
> +}
> +#endif
> +
>  /**
>   * ftrace_make_call - convert a nop call site into a call to addr
> - * @rec: the mcount call site record
> + * @rec: the call site record (e.g. mcount/fentry)
>   * @addr: the address that the call site should call
>   *
>   * This is a very sensitive operation and great care needs
> @@ -545,7 +574,7 @@ extern int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr);
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  /**
>   * ftrace_modify_call - convert from one addr to another (no nop)
> - * @rec: the mcount call site record
> + * @rec: the call site record (e.g. mcount/fentry)
>   * @old_addr: the address expected to be currently called to
>   * @addr: the address to change to
>   *
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index f296d89be757..5259d4dea675 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -2494,14 +2494,14 @@ struct dyn_ftrace *ftrace_rec_iter_record(struct ftrace_rec_iter *iter)
>  }
>  
>  static int
> -ftrace_code_disable(struct module *mod, struct dyn_ftrace *rec)
> +ftrace_nop_initialize(struct module *mod, struct dyn_ftrace *rec)
>  {
>  	int ret;
>  
>  	if (unlikely(ftrace_disabled))
>  		return 0;
>  
> -	ret = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
> +	ret = ftrace_init_nop(mod, rec);
>  	if (ret) {
>  		ftrace_bug_type = FTRACE_BUG_INIT;
>  		ftrace_bug(ret, rec);
> @@ -2943,7 +2943,7 @@ static int ftrace_update_code(struct module *mod, struct ftrace_page *new_pgs)
>  			 * to the NOP instructions.
>  			 */
>  			if (!__is_defined(CC_USING_NOP_MCOUNT) &&
> -			    !ftrace_code_disable(mod, p))
> +			    !ftrace_nop_initialize(mod, p))
>  				break;
>  
>  			update_cnt++;

