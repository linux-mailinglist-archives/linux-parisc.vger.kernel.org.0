Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD417261E57
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Sep 2020 21:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730799AbgIHTuw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 8 Sep 2020 15:50:52 -0400
Received: from foss.arm.com ([217.140.110.172]:56348 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730808AbgIHPuk (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:50:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCD5616A3;
        Tue,  8 Sep 2020 08:13:30 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 092AF3F73C;
        Tue,  8 Sep 2020 08:13:28 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:13:26 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     Peter Collingbourne <pcc@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org,
        Andrey Konovalov <andreyknvl@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        David Spickett <david.spickett@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v10 5/7] signal: deduplicate code dealing with common
 _sigfault fields
Message-ID: <20200908151326.GV6642@arm.com>
References: <cover.1598072840.git.pcc@google.com>
 <a360ad2d44d0971f5864033022b53fbdcf105b90.1598072840.git.pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a360ad2d44d0971f5864033022b53fbdcf105b90.1598072840.git.pcc@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Aug 21, 2020 at 10:10:15PM -0700, Peter Collingbourne wrote:
> We're about to add more common _sigfault fields, so deduplicate the
> existing code for initializing _sigfault fields in {send,force}_sig_*,
> and for copying _sigfault fields in copy_siginfo_to_external32 and
> post_copy_siginfo_from_user32, to reduce the number of places that
> will need to be updated by upcoming changes.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
> View this change in Gerrit: https://linux-review.googlesource.com/q/I4f56174e1b7b2bf4a3c8139e6879cbfd52750a24
> 
>  include/linux/signal.h |  13 ++++++
>  kernel/signal.c        | 101 ++++++++++++++++-------------------------
>  2 files changed, 53 insertions(+), 61 deletions(-)
> 
> diff --git a/include/linux/signal.h b/include/linux/signal.h
> index 6bb1a3f0258c..3edbf54493ee 100644
> --- a/include/linux/signal.h
> +++ b/include/linux/signal.h
> @@ -50,6 +50,19 @@ enum siginfo_layout {
>  
>  enum siginfo_layout siginfo_layout(unsigned sig, int si_code);
>  
> +static inline bool siginfo_layout_is_fault(enum siginfo_layout layout)
> +{
> +	switch (layout) {
> +	case SIL_FAULT:
> +	case SIL_FAULT_MCEERR:
> +	case SIL_FAULT_BNDERR:
> +	case SIL_FAULT_PKUERR:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  /*
>   * Define some primitives to manipulate sigset_t.
>   */
> diff --git a/kernel/signal.c b/kernel/signal.c
> index c80e70bde11d..4ee9dc03f20f 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1649,6 +1649,15 @@ void force_sigsegv(int sig)
>  	force_sig(SIGSEGV);
>  }
>  
> +static void set_sigfault_common_fields(struct kernel_siginfo *info, int sig,
> +				       int code, void __user *addr)
> +{
> +	info->si_signo = sig;
> +	info->si_errno = 0;
> +	info->si_code = code;
> +	info->si_addr = addr;
> +}
> +
>  int force_sig_fault_to_task(int sig, int code, void __user *addr
>  	___ARCH_SI_TRAPNO(int trapno)
>  	___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
> @@ -1657,10 +1666,7 @@ int force_sig_fault_to_task(int sig, int code, void __user *addr
>  	struct kernel_siginfo info;
>  
>  	clear_siginfo(&info);
> -	info.si_signo = sig;
> -	info.si_errno = 0;
> -	info.si_code  = code;
> -	info.si_addr  = addr;
> +	set_sigfault_common_fields(&info, sig, code, addr);
>  #ifdef __ARCH_SI_TRAPNO
>  	info.si_trapno = trapno;
>  #endif
> @@ -1689,10 +1695,7 @@ int send_sig_fault(int sig, int code, void __user *addr
>  	struct kernel_siginfo info;
>  
>  	clear_siginfo(&info);
> -	info.si_signo = sig;
> -	info.si_errno = 0;
> -	info.si_code  = code;
> -	info.si_addr  = addr;
> +	set_sigfault_common_fields(&info, sig, code, addr);
>  #ifdef __ARCH_SI_TRAPNO
>  	info.si_trapno = trapno;
>  #endif
> @@ -1710,10 +1713,7 @@ int force_sig_mceerr(int code, void __user *addr, short lsb)
>  
>  	WARN_ON((code != BUS_MCEERR_AO) && (code != BUS_MCEERR_AR));
>  	clear_siginfo(&info);
> -	info.si_signo = SIGBUS;
> -	info.si_errno = 0;
> -	info.si_code = code;
> -	info.si_addr = addr;
> +	set_sigfault_common_fields(&info, SIGBUS, code, addr);
>  	info.si_addr_lsb = lsb;
>  	return force_sig_info(&info);
>  }
> @@ -1724,10 +1724,7 @@ int send_sig_mceerr(int code, void __user *addr, short lsb, struct task_struct *
>  
>  	WARN_ON((code != BUS_MCEERR_AO) && (code != BUS_MCEERR_AR));
>  	clear_siginfo(&info);
> -	info.si_signo = SIGBUS;
> -	info.si_errno = 0;
> -	info.si_code = code;
> -	info.si_addr = addr;
> +	set_sigfault_common_fields(&info, SIGBUS, code, addr);
>  	info.si_addr_lsb = lsb;
>  	return send_sig_info(info.si_signo, &info, t);
>  }
> @@ -1738,10 +1735,7 @@ int force_sig_bnderr(void __user *addr, void __user *lower, void __user *upper)
>  	struct kernel_siginfo info;
>  
>  	clear_siginfo(&info);
> -	info.si_signo = SIGSEGV;
> -	info.si_errno = 0;
> -	info.si_code  = SEGV_BNDERR;
> -	info.si_addr  = addr;
> +	set_sigfault_common_fields(&info, SIGSEGV, SEGV_BNDERR, addr);
>  	info.si_lower = lower;
>  	info.si_upper = upper;
>  	return force_sig_info(&info);
> @@ -1753,10 +1747,7 @@ int force_sig_pkuerr(void __user *addr, u32 pkey)
>  	struct kernel_siginfo info;
>  
>  	clear_siginfo(&info);
> -	info.si_signo = SIGSEGV;
> -	info.si_errno = 0;
> -	info.si_code  = SEGV_PKUERR;
> -	info.si_addr  = addr;
> +	set_sigfault_common_fields(&info, SIGSEGV, SEGV_PKUERR, addr);
>  	info.si_pkey  = pkey;
>  	return force_sig_info(&info);
>  }
> @@ -1770,10 +1761,8 @@ int force_sig_ptrace_errno_trap(int errno, void __user *addr)
>  	struct kernel_siginfo info;
>  
>  	clear_siginfo(&info);
> -	info.si_signo = SIGTRAP;
> +	set_sigfault_common_fields(&info, SIGTRAP, TRAP_HWBKPT, addr);
>  	info.si_errno = errno;
> -	info.si_code  = TRAP_HWBKPT;
> -	info.si_addr  = addr;
>  	return force_sig_info(&info);
>  }
>  
> @@ -3266,12 +3255,23 @@ int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from)
>  void copy_siginfo_to_external32(struct compat_siginfo *to,
>  		const struct kernel_siginfo *from)
>  {
> +	enum siginfo_layout layout =
> +		siginfo_layout(from->si_signo, from->si_code);
> +
>  	memset(to, 0, sizeof(*to));
>  
>  	to->si_signo = from->si_signo;
>  	to->si_errno = from->si_errno;
>  	to->si_code  = from->si_code;
> -	switch(siginfo_layout(from->si_signo, from->si_code)) {
> +
> +	if (siginfo_layout_is_fault(layout)) {
> +		to->si_addr = ptr_to_compat(from->si_addr);
> +#ifdef __ARCH_SI_TRAPNO
> +		to->si_trapno = from->si_trapno;
> +#endif
> +	}
> +
> +	switch (layout) {

I find the code flow slightly awkward with this change, because the
fault signal fields are populated partly in the if() above and partly
in the switch().  Previously, only the universal stuff was done outside.

Would this be easier on future maintainers if we pulled the common
stuff out into a helper and then called it from the appropriate switch
cases?  The compiler will probably output some duplicated code in that
case (depending on how clever it is at undoing the duplication), but
the amount of affected code is small.


>  	case SIL_KILL:
>  		to->si_pid = from->si_pid;
>  		to->si_uid = from->si_uid;
> @@ -3286,31 +3286,15 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
>  		to->si_fd   = from->si_fd;
>  		break;
>  	case SIL_FAULT:
> -		to->si_addr = ptr_to_compat(from->si_addr);
> -#ifdef __ARCH_SI_TRAPNO
> -		to->si_trapno = from->si_trapno;
> -#endif
>  		break;
>  	case SIL_FAULT_MCEERR:
> -		to->si_addr = ptr_to_compat(from->si_addr);
> -#ifdef __ARCH_SI_TRAPNO
> -		to->si_trapno = from->si_trapno;
> -#endif
>  		to->si_addr_lsb = from->si_addr_lsb;
>  		break;
>  	case SIL_FAULT_BNDERR:
> -		to->si_addr = ptr_to_compat(from->si_addr);
> -#ifdef __ARCH_SI_TRAPNO
> -		to->si_trapno = from->si_trapno;
> -#endif
>  		to->si_lower = ptr_to_compat(from->si_lower);
>  		to->si_upper = ptr_to_compat(from->si_upper);
>  		break;
>  	case SIL_FAULT_PKUERR:
> -		to->si_addr = ptr_to_compat(from->si_addr);
> -#ifdef __ARCH_SI_TRAPNO
> -		to->si_trapno = from->si_trapno;
> -#endif
>  		to->si_pkey = from->si_pkey;
>  		break;
>  	case SIL_CHLD:
> @@ -3347,11 +3331,22 @@ int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
>  static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
>  					 const struct compat_siginfo *from)
>  {
> +	enum siginfo_layout layout =
> +		siginfo_layout(from->si_signo, from->si_code);
> +
>  	clear_siginfo(to);
>  	to->si_signo = from->si_signo;
>  	to->si_errno = from->si_errno;
>  	to->si_code  = from->si_code;
> -	switch(siginfo_layout(from->si_signo, from->si_code)) {
> +
> +	if (siginfo_layout_is_fault(layout)) {
> +		to->si_addr = compat_ptr(from->si_addr);
> +#ifdef __ARCH_SI_TRAPNO
> +		to->si_trapno = from->si_trapno;
> +#endif
> +	}
> +
> +	switch (layout) {

Same comment as for copy_siginfo_to_external32()?

[...]

Otherwise, looks reasonable.

Cheers
---Dave
