Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0328F24A3A1
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Aug 2020 17:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgHSP45 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 11:56:57 -0400
Received: from foss.arm.com ([217.140.110.172]:40394 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726632AbgHSP44 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 11:56:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05B4C1FB;
        Wed, 19 Aug 2020 08:56:55 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 081503F6CF;
        Wed, 19 Aug 2020 08:56:52 -0700 (PDT)
Date:   Wed, 19 Aug 2020 16:56:50 +0100
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
Subject: Re: [PATCH v9 6/6] arm64: expose FAR_EL1 tag bits in siginfo
Message-ID: <20200819155650.GI6642@arm.com>
References: <cover.1597720138.git.pcc@google.com>
 <9df0de08df310052df01d63bc8bddc5dd71c2bdb.1597720138.git.pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9df0de08df310052df01d63bc8bddc5dd71c2bdb.1597720138.git.pcc@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Aug 17, 2020 at 08:33:51PM -0700, Peter Collingbourne wrote:
> The kernel currently clears the tag bits (i.e. bits 56-63) in the fault
> address exposed via siginfo.si_addr and sigcontext.fault_address. However,
> the tag bits may be needed by tools in order to accurately diagnose
> memory errors, such as HWASan [1] or future tools based on the Memory
> Tagging Extension (MTE).
> 
> We should not stop clearing these bits in the existing fault address
> fields, because there may be existing userspace applications that are
> expecting the tag bits to be cleared. Instead, create a new pair of
> union fields in siginfo._sigfault, and store the tag bits of FAR_EL1
> there, together with a mask specifying which bits are valid.
> 
> A flag is added to si_xflags to allow userspace to determine whether
> the values in the fields are valid.
> 
> [1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
> View this change in Gerrit: https://linux-review.googlesource.com/q/Ia8876bad8c798e0a32df7c2ce1256c4771c81446
> 
> v9:
> - make the ignored bits fields generic
> - add some new dependent patches that prepare us to store the
>   field in such a way that userspace can detect their presence
> 
> v8:
> - rebase onto 5.8rc2
> 
> v7:
> - switch to a new siginfo field instead of using sigcontext
> - merge the patch back into one since the other patches are now
>   unnecessary
> 
> v6:
> - move fault address and fault code into the kernel_siginfo data structure
> - split the patch in three since it was getting large and now has
>   generic and arch-specific parts
> 
> v5:
> - add padding to fault_addr_top_byte_context in order to ensure the correct
>   size and preserve sp alignment
> 
> v4:
> - expose only the tag bits in the context instead of the entire FAR_EL1
> - remove mention of the new context from the sigcontext.__reserved[] note
> 
> v3:
> - add documentation to tagged-pointers.rst
> - update comments in sigcontext.h
> 
> v2:
> - revert changes to hw_breakpoint.c
> - rename set_thread_esr to set_thread_far_esr
> 
>  Documentation/arm64/tagged-pointers.rst | 21 +++++++---
>  arch/arm64/include/asm/exception.h      |  2 +-
>  arch/arm64/include/asm/traps.h          |  7 +++-
>  arch/arm64/kernel/debug-monitors.c      |  4 +-
>  arch/arm64/kernel/entry-common.c        |  2 -
>  arch/arm64/kernel/ptrace.c              |  2 +-
>  arch/arm64/kernel/traps.c               | 15 ++++---
>  arch/arm64/mm/fault.c                   | 54 ++++++++++++++-----------
>  arch/mips/kernel/traps.c                |  2 +-
>  arch/parisc/kernel/ptrace.c             |  2 +-
>  arch/parisc/mm/fault.c                  |  2 +-
>  arch/powerpc/mm/fault.c                 |  2 +-
>  arch/x86/mm/fault.c                     |  3 +-
>  include/linux/compat.h                  |  2 +
>  include/linux/sched/signal.h            | 12 +++++-
>  include/uapi/asm-generic/siginfo.h      | 10 +++++
>  kernel/signal.c                         | 50 +++++++++++++++++++----
>  mm/memory-failure.c                     |  2 +-
>  18 files changed, 136 insertions(+), 58 deletions(-)
> 
> diff --git a/Documentation/arm64/tagged-pointers.rst b/Documentation/arm64/tagged-pointers.rst
> index eab4323609b9..bd23039841a5 100644
> --- a/Documentation/arm64/tagged-pointers.rst
> +++ b/Documentation/arm64/tagged-pointers.rst
> @@ -53,12 +53,21 @@ visibility.
>  Preserving tags
>  ---------------
>  
> -Non-zero tags are not preserved when delivering signals. This means that
> -signal handlers in applications making use of tags cannot rely on the
> -tag information for user virtual addresses being maintained for fields
> -inside siginfo_t. One exception to this rule is for signals raised in
> -response to watchpoint debug exceptions, where the tag information will
> -be preserved.
> +Non-zero tags are not preserved in the fault address fields
> +siginfo.si_addr or sigcontext.fault_address when delivering
> +signals. This means that signal handlers in applications making use
> +of tags cannot rely on the tag information for user virtual addresses
> +being maintained in these fields. One exception to this rule is for
> +signals raised in response to watchpoint debug exceptions, where the
> +tag information will be preserved.
> +
> +The fault address tag is preserved in the si_addr_ignored_bits field
> +of siginfo, which is set for signals raised in response to data aborts
> +and instruction aborts. The si_addr_ignored_bits_mask field indicates
> +which bits of the field are valid. The validity of these fields is
> +indicated by the SI_XFLAG_IGNORED_BITS flag in siginfo.si_xflags,
> +and the validity of si_xflags in turn is indicated by the kernel
> +indicating support for the sigaction.sa_flags flag SA_XFLAGS.
>  
>  The architecture prevents the use of a tagged PC, so the upper byte will
>  be set to a sign-extension of bit 55 on exception return.
> diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
> index 7577a754d443..950d55dae948 100644
> --- a/arch/arm64/include/asm/exception.h
> +++ b/arch/arm64/include/asm/exception.h
> @@ -32,7 +32,7 @@ static inline u32 disr_to_esr(u64 disr)
>  }
>  
>  asmlinkage void enter_from_user_mode(void);
> -void do_mem_abort(unsigned long addr, unsigned int esr, struct pt_regs *regs);
> +void do_mem_abort(unsigned long far, unsigned int esr, struct pt_regs *regs);
>  void do_undefinstr(struct pt_regs *regs);
>  void do_bti(struct pt_regs *regs);
>  asmlinkage void bad_mode(struct pt_regs *regs, int reason, unsigned int esr);
> diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
> index cee5928e1b7d..8e4f6c5b97af 100644
> --- a/arch/arm64/include/asm/traps.h
> +++ b/arch/arm64/include/asm/traps.h
> @@ -26,8 +26,11 @@ void register_undef_hook(struct undef_hook *hook);
>  void unregister_undef_hook(struct undef_hook *hook);
>  void force_signal_inject(int signal, int code, unsigned long address);
>  void arm64_notify_segfault(unsigned long addr);
> -void arm64_force_sig_fault(int signo, int code, void __user *addr, const char *str);
> -void arm64_force_sig_mceerr(int code, void __user *addr, short lsb, const char *str);
> +void arm64_force_sig_fault(int signo, int code, void __user *addr,
> +			   unsigned long far, unsigned char far_tb_mask,
> +			   const char *str);
> +void arm64_force_sig_mceerr(int code, void __user *addr, short lsb,
> +			    unsigned long far, const char *str);
>  void arm64_force_sig_ptrace_errno_trap(int errno, void __user *addr, const char *str);
>  
>  /*
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 7310a4f7f993..bc9e02fbb710 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -235,8 +235,8 @@ static void send_user_sigtrap(int si_code)
>  		local_irq_enable();
>  
>  	arm64_force_sig_fault(SIGTRAP, si_code,
> -			     (void __user *)instruction_pointer(regs),
> -			     "User debug trap");
> +			      (void __user *)instruction_pointer(regs), 0, 0,
> +			      "User debug trap");
>  }
>  
>  static int single_step_handler(unsigned long unused, unsigned int esr,
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index d3be9dbf5490..65ed01606480 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -22,7 +22,6 @@ static void notrace el1_abort(struct pt_regs *regs, unsigned long esr)
>  	unsigned long far = read_sysreg(far_el1);
>  
>  	local_daif_inherit(regs);
> -	far = untagged_addr(far);
>  	do_mem_abort(far, esr, regs);
>  }
>  NOKPROBE_SYMBOL(el1_abort);
> @@ -104,7 +103,6 @@ static void notrace el0_da(struct pt_regs *regs, unsigned long esr)
>  
>  	user_exit_irqoff();
>  	local_daif_restore(DAIF_PROCCTX);
> -	far = untagged_addr(far);
>  	do_mem_abort(far, esr, regs);
>  }
>  NOKPROBE_SYMBOL(el0_da);
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index d8ebfd813e28..c73312064220 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -197,7 +197,7 @@ static void ptrace_hbptriggered(struct perf_event *bp,
>  	}
>  #endif
>  	arm64_force_sig_fault(SIGTRAP, TRAP_HWBKPT,
> -			      (void __user *)(bkpt->trigger),
> +			      (void __user *)(bkpt->trigger), 0, 0,
>  			      desc);
>  }
>  
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 13ebd5ca2070..c945c5cc1312 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -235,20 +235,25 @@ static void arm64_show_signal(int signo, const char *str)
>  }
>  
>  void arm64_force_sig_fault(int signo, int code, void __user *addr,
> +			   unsigned long far, unsigned char far_tb_mask,
>  			   const char *str)
>  {
> +	unsigned long ignored_bits_mask = ((unsigned long)far_tb_mask) << 56;
> +
>  	arm64_show_signal(signo, str);
>  	if (signo == SIGKILL)
>  		force_sig(SIGKILL);
>  	else
> -		force_sig_fault(signo, code, addr);
> +		force_sig_fault_with_ignored_bits(signo, code, addr,
> +						  far & ignored_bits_mask,
> +						  ignored_bits_mask);
>  }
>  
>  void arm64_force_sig_mceerr(int code, void __user *addr, short lsb,
> -			    const char *str)
> +			    unsigned long far, const char *str)
>  {
>  	arm64_show_signal(SIGBUS, str);
> -	force_sig_mceerr(code, addr, lsb);
> +	force_sig_mceerr(code, addr, lsb, far & (0xffUL << 56), 0xffUL << 56);
>  }
>  
>  void arm64_force_sig_ptrace_errno_trap(int errno, void __user *addr,
> @@ -267,7 +272,7 @@ void arm64_notify_die(const char *str, struct pt_regs *regs,
>  		current->thread.fault_address = 0;
>  		current->thread.fault_code = err;
>  
> -		arm64_force_sig_fault(signo, sicode, addr, str);
> +		arm64_force_sig_fault(signo, sicode, addr, 0, 0, str);
>  	} else {
>  		die(str, regs, err);
>  	}
> @@ -829,7 +834,7 @@ void bad_el0_sync(struct pt_regs *regs, int reason, unsigned int esr)
>  	current->thread.fault_address = 0;
>  	current->thread.fault_code = esr;
>  
> -	arm64_force_sig_fault(SIGILL, ILL_ILLOPC, pc,
> +	arm64_force_sig_fault(SIGILL, ILL_ILLOPC, pc, 0, 0,
>  			      "Bad EL0 synchronous exception");
>  }
>  
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index f07333e86c2f..82f05644417e 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -40,7 +40,7 @@
>  #include <asm/traps.h>
>  
>  struct fault_info {
> -	int	(*fn)(unsigned long addr, unsigned int esr,
> +	int	(*fn)(unsigned long far, unsigned int esr,
>  		      struct pt_regs *regs);
>  	int	sig;
>  	int	code;
> @@ -383,8 +383,11 @@ static void set_thread_esr(unsigned long address, unsigned int esr)
>  	current->thread.fault_code = esr;
>  }
>  
> -static void do_bad_area(unsigned long addr, unsigned int esr, struct pt_regs *regs)
> +static void do_bad_area(unsigned long far, unsigned int esr,
> +			struct pt_regs *regs)
>  {
> +	unsigned long addr = untagged_addr(far);
> +
>  	/*
>  	 * If we are in kernel mode at this point, we have no context to
>  	 * handle this fault with.
> @@ -394,7 +397,7 @@ static void do_bad_area(unsigned long addr, unsigned int esr, struct pt_regs *re
>  
>  		set_thread_esr(addr, esr);
>  		arm64_force_sig_fault(inf->sig, inf->code, (void __user *)addr,
> -				      inf->name);
> +				      far, 0xff, inf->name);
>  	} else {
>  		__do_kernel_fault(addr, esr, regs);
>  	}
> @@ -446,7 +449,7 @@ static bool is_write_abort(unsigned int esr)
>  	return (esr & ESR_ELx_WNR) && !(esr & ESR_ELx_CM);
>  }
>  
> -static int __kprobes do_page_fault(unsigned long addr, unsigned int esr,
> +static int __kprobes do_page_fault(unsigned long far, unsigned int esr,
>  				   struct pt_regs *regs)
>  {
>  	const struct fault_info *inf;
> @@ -454,6 +457,7 @@ static int __kprobes do_page_fault(unsigned long addr, unsigned int esr,
>  	vm_fault_t fault;
>  	unsigned long vm_flags = VM_ACCESS_FLAGS;
>  	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
> +	unsigned long addr = untagged_addr(far);
>  
>  	if (kprobe_page_fault(regs, esr))
>  		return 0;
> @@ -566,7 +570,7 @@ static int __kprobes do_page_fault(unsigned long addr, unsigned int esr,
>  		 * this page fault.
>  		 */
>  		arm64_force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *)addr,
> -				      inf->name);
> +				      far, 0xff, inf->name);
>  	} else if (fault & (VM_FAULT_HWPOISON_LARGE | VM_FAULT_HWPOISON)) {
>  		unsigned int lsb;
>  
> @@ -575,7 +579,7 @@ static int __kprobes do_page_fault(unsigned long addr, unsigned int esr,
>  			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
>  
>  		arm64_force_sig_mceerr(BUS_MCEERR_AR, (void __user *)addr, lsb,
> -				       inf->name);
> +				       far, inf->name);
>  	} else {
>  		/*
>  		 * Something tried to access memory that isn't in our memory
> @@ -583,8 +587,7 @@ static int __kprobes do_page_fault(unsigned long addr, unsigned int esr,
>  		 */
>  		arm64_force_sig_fault(SIGSEGV,
>  				      fault == VM_FAULT_BADACCESS ? SEGV_ACCERR : SEGV_MAPERR,
> -				      (void __user *)addr,
> -				      inf->name);
> +				      (void __user *)addr, far, 0xff, inf->name);
>  	}
>  
>  	return 0;
> @@ -594,30 +597,32 @@ static int __kprobes do_page_fault(unsigned long addr, unsigned int esr,
>  	return 0;
>  }
>  
> -static int __kprobes do_translation_fault(unsigned long addr,
> +static int __kprobes do_translation_fault(unsigned long far,
>  					  unsigned int esr,
>  					  struct pt_regs *regs)
>  {
> +	unsigned long addr = untagged_addr(far);
> +
>  	if (is_ttbr0_addr(addr))
> -		return do_page_fault(addr, esr, regs);
> +		return do_page_fault(far, esr, regs);
>  
> -	do_bad_area(addr, esr, regs);
> +	do_bad_area(far, esr, regs);
>  	return 0;
>  }
>  
> -static int do_alignment_fault(unsigned long addr, unsigned int esr,
> +static int do_alignment_fault(unsigned long far, unsigned int esr,
>  			      struct pt_regs *regs)
>  {
> -	do_bad_area(addr, esr, regs);
> +	do_bad_area(far, esr, regs);
>  	return 0;
>  }
>  
> -static int do_bad(unsigned long addr, unsigned int esr, struct pt_regs *regs)
> +static int do_bad(unsigned long far, unsigned int esr, struct pt_regs *regs)
>  {
>  	return 1; /* "fault" */
>  }
>  
> -static int do_sea(unsigned long addr, unsigned int esr, struct pt_regs *regs)
> +static int do_sea(unsigned long far, unsigned int esr, struct pt_regs *regs)
>  {
>  	const struct fault_info *inf;
>  	void __user *siaddr;
> @@ -635,7 +640,7 @@ static int do_sea(unsigned long addr, unsigned int esr, struct pt_regs *regs)
>  	if (esr & ESR_ELx_FnV)
>  		siaddr = NULL;
>  	else
> -		siaddr  = (void __user *)addr;
> +		siaddr  = (void __user *)untagged_addr(far);
>  	arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);
>  
>  	return 0;
> @@ -708,11 +713,12 @@ static const struct fault_info fault_info[] = {
>  	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 63"			},
>  };
>  
> -void do_mem_abort(unsigned long addr, unsigned int esr, struct pt_regs *regs)
> +void do_mem_abort(unsigned long far, unsigned int esr, struct pt_regs *regs)
>  {
>  	const struct fault_info *inf = esr_to_fault_info(esr);
> +	unsigned long addr = untagged_addr(far);
>  
> -	if (!inf->fn(addr, esr, regs))
> +	if (!inf->fn(far, esr, regs))
>  		return;
>  
>  	if (!user_mode(regs)) {
> @@ -721,8 +727,8 @@ void do_mem_abort(unsigned long addr, unsigned int esr, struct pt_regs *regs)
>  		show_pte(addr);
>  	}
>  
> -	arm64_notify_die(inf->name, regs,
> -			 inf->sig, inf->code, (void __user *)addr, esr);
> +	arm64_notify_die(inf->name, regs, inf->sig, inf->code,
> +			 (void __user *)addr, esr);
>  }
>  NOKPROBE_SYMBOL(do_mem_abort);
>  
> @@ -735,8 +741,8 @@ NOKPROBE_SYMBOL(do_el0_irq_bp_hardening);
>  
>  void do_sp_pc_abort(unsigned long addr, unsigned int esr, struct pt_regs *regs)
>  {
> -	arm64_notify_die("SP/PC alignment exception", regs,
> -			 SIGBUS, BUS_ADRALN, (void __user *)addr, esr);
> +	arm64_notify_die("SP/PC alignment exception", regs, SIGBUS, BUS_ADRALN,
> +			 (void __user *)addr, esr);
>  }
>  NOKPROBE_SYMBOL(do_sp_pc_abort);
>  
> @@ -862,8 +868,8 @@ void do_debug_exception(unsigned long addr_if_watchpoint, unsigned int esr,
>  		arm64_apply_bp_hardening();
>  
>  	if (inf->fn(addr_if_watchpoint, esr, regs)) {
> -		arm64_notify_die(inf->name, regs,
> -				 inf->sig, inf->code, (void __user *)pc, esr);
> +		arm64_notify_die(inf->name, regs, inf->sig, inf->code,
> +				 (void __user *)pc, esr);
>  	}
>  
>  	debug_exception_exit(regs);
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 38aa07ccdbcc..73a181c904b0 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -775,7 +775,7 @@ void force_fcr31_sig(unsigned long fcr31, void __user *fault_addr,
>  	else if (fcr31 & FPU_CSR_INE_X)
>  		si_code = FPE_FLTRES;
>  
> -	force_sig_fault_to_task(SIGFPE, si_code, fault_addr, tsk);
> +	force_sig_fault_to_task(SIGFPE, si_code, fault_addr, 0, 0, tsk);
>  }
>  
>  int process_fpemu_return(int sig, void __user *fault_addr, unsigned long fcr31)
> diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
> index 2127974982df..62c8bb0d7d31 100644
> --- a/arch/parisc/kernel/ptrace.c
> +++ b/arch/parisc/kernel/ptrace.c
> @@ -89,7 +89,7 @@ void user_enable_single_step(struct task_struct *task)
>  		   parent know something happened. */
>  		force_sig_fault_to_task(SIGTRAP, TRAP_TRACE,
>  					(void __user *) (task_regs(task)->iaoq[0] & ~3),
> -					task);
> +					0, 0, task);
>  		/* notify_parent(task, SIGCHLD); */
>  		return;
>  	}
> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index 4bfe2da9fbe3..2a6064ea2dfc 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -400,7 +400,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
>  				lsb = PAGE_SHIFT;
>  
>  			force_sig_mceerr(BUS_MCEERR_AR, (void __user *) address,
> -					 lsb);
> +					 lsb, 0, 0);
>  			return;
>  		}
>  #endif
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 0add963a849b..4ffe2fb8e31a 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -152,7 +152,7 @@ static int do_sigbus(struct pt_regs *regs, unsigned long address,
>  		if (fault & VM_FAULT_HWPOISON)
>  			lsb = PAGE_SHIFT;
>  
> -		force_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb);
> +		force_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb, 0, 0);
>  		return 0;
>  	}
>  
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index 35f1498e9832..a443eec157f6 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -898,7 +898,8 @@ do_sigbus(struct pt_regs *regs, unsigned long error_code, unsigned long address,
>  			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
>  		if (fault & VM_FAULT_HWPOISON)
>  			lsb = PAGE_SHIFT;
> -		force_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb);
> +		force_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb, 0,
> +				 0);
>  		return;
>  	}
>  #endif
> diff --git a/include/linux/compat.h b/include/linux/compat.h
> index 55d4228dfd88..273146cf30fd 100644
> --- a/include/linux/compat.h
> +++ b/include/linux/compat.h
> @@ -234,6 +234,8 @@ typedef struct compat_siginfo {
>  				compat_uptr_t _pad[6];
>  			};
>  			compat_uptr_t _xflags;
> +			compat_uptr_t _addr_ignored_bits;
> +			compat_uptr_t _addr_ignored_bits_mask;
>  		} _sigfault;
>  
>  		/* SIGPOLL */
> diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
> index 1bad18a1d8ba..f62a014a5a4d 100644
> --- a/include/linux/sched/signal.h
> +++ b/include/linux/sched/signal.h
> @@ -311,16 +311,24 @@ static inline void kernel_signal_stop(void)
>  int force_sig_fault_to_task(int sig, int code, void __user *addr
>  	___ARCH_SI_TRAPNO(int trapno)
>  	___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
> -	, struct task_struct *t);
> +	, unsigned long addr_ignored_bits, unsigned long addr_ignored_bits_mask,
> +	struct task_struct *t);
>  int force_sig_fault(int sig, int code, void __user *addr
>  	___ARCH_SI_TRAPNO(int trapno)
>  	___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr));
> +int force_sig_fault_with_ignored_bits(int sig, int code, void __user *addr
> +	___ARCH_SI_TRAPNO(int trapno)
> +	___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
> +	, unsigned long addr_ignored_bits,
> +	unsigned long addr_ignored_bits_mask);
>  int send_sig_fault(int sig, int code, void __user *addr
>  	___ARCH_SI_TRAPNO(int trapno)
>  	___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
>  	, struct task_struct *t);
>  
> -int force_sig_mceerr(int code, void __user *, short);
> +int force_sig_mceerr(int code, void __user *addr, short addr_lsb,
> +		     unsigned long addr_ignored_bits,
> +		     unsigned long addr_ignored_bits_mask);
>  int send_sig_mceerr(int code, void __user *, short, struct task_struct *);
>  
>  int force_sig_bnderr(void __user *addr, void __user *lower, void __user *upper);
> diff --git a/include/uapi/asm-generic/siginfo.h b/include/uapi/asm-generic/siginfo.h
> index 413d804623c0..1fc6482b0ad4 100644
> --- a/include/uapi/asm-generic/siginfo.h
> +++ b/include/uapi/asm-generic/siginfo.h
> @@ -94,6 +94,8 @@ union __sifields {
>  			void *_pad[6];
>  		};
>  		unsigned long _xflags;
> +		unsigned long _addr_ignored_bits;
> +		unsigned long _addr_ignored_bits_mask;
>  	} _sigfault;
>  
>  	/* SIGPOLL */
> @@ -155,6 +157,8 @@ typedef struct siginfo {
>  #endif
>  #define si_addr_lsb	_sifields._sigfault._addr_lsb
>  #define si_xflags	_sifields._sigfault._xflags
> +#define si_addr_ignored_bits		_sifields._sigfault._addr_ignored_bits
> +#define si_addr_ignored_bits_mask	_sifields._sigfault._addr_ignored_bits_mask
>  #define si_lower	_sifields._sigfault._addr_bnd._lower
>  #define si_upper	_sifields._sigfault._addr_bnd._upper
>  #define si_pkey		_sifields._sigfault._addr_pkey._pkey
> @@ -295,6 +299,12 @@ typedef struct siginfo {
>  #define EMT_TAGOVF	1	/* tag overflow */
>  #define NSIGEMT		1
>  
> +/*
> + * SIGILL, SIGFPE, SIGSEGV, SIGBUS, SIGTRAP, SIGEMT si_xflags
> + */
> +#define SI_XFLAG_IGNORED_BITS	1
> +/* si_addr_ignored_bits{,_mask} fields valid */
> +
>  /*
>   * sigevent definitions
>   * 
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 72182eed1b8d..1f1e42adc57d 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1652,7 +1652,8 @@ void force_sigsegv(int sig)
>  int force_sig_fault_to_task(int sig, int code, void __user *addr
>  	___ARCH_SI_TRAPNO(int trapno)
>  	___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
> -	, struct task_struct *t)
> +	, unsigned long addr_ignored_bits, unsigned long addr_ignored_bits_mask,
> +	struct task_struct *t)
>  {
>  	struct kernel_siginfo info;
>  
> @@ -1669,17 +1670,32 @@ int force_sig_fault_to_task(int sig, int code, void __user *addr
>  	info.si_flags = flags;
>  	info.si_isr = isr;
>  #endif
> -	info.si_xflags = 0;
> +	info.si_xflags = SI_XFLAG_IGNORED_BITS;
> +	info.si_addr_ignored_bits = addr_ignored_bits;
> +	info.si_addr_ignored_bits_mask = addr_ignored_bits_mask;
>  	return force_sig_info_to_task(&info, t);
>  }
>  
> -int force_sig_fault(int sig, int code, void __user *addr
> +int force_sig_fault_with_ignored_bits(int sig, int code, void __user *addr
>  	___ARCH_SI_TRAPNO(int trapno)
> -	___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr))
> +	___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr),
> +	unsigned long addr_ignored_bits, unsigned long addr_ignored_bits_mask)
>  {
>  	return force_sig_fault_to_task(sig, code, addr
>  				       ___ARCH_SI_TRAPNO(trapno)
> -				       ___ARCH_SI_IA64(imm, flags, isr), current);
> +				       ___ARCH_SI_IA64(imm, flags, isr),
> +				       addr_ignored_bits,
> +				       addr_ignored_bits_mask, current);
> +}
> +
> +int force_sig_fault(int sig, int code, void __user *addr
> +	___ARCH_SI_TRAPNO(int trapno)
> +	___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr))
> +{
> +	return force_sig_fault_with_ignored_bits(sig, code, addr
> +						 ___ARCH_SI_TRAPNO(trapno)
> +						 ___ARCH_SI_IA64(imm, flags,
> +								 isr), 0, 0);
>  }
>  
>  int send_sig_fault(int sig, int code, void __user *addr
> @@ -1706,7 +1722,9 @@ int send_sig_fault(int sig, int code, void __user *addr
>  	return send_sig_info(info.si_signo, &info, t);
>  }
>  
> -int force_sig_mceerr(int code, void __user *addr, short lsb)
> +int force_sig_mceerr(int code, void __user *addr, short lsb,
> +		     unsigned long addr_ignored_bits,
> +		     unsigned long addr_ignored_bits_mask)

Rather than having to pass these extra arguments all over the place, can
we just pass the far for addr, and have an arch-specific hook for
splitting the ignored from non-ignored bits.  For now at least, I expect
that ignored bits mask to be constant for a given platform and kernel.

>  {
>  	struct kernel_siginfo info;
>  
> @@ -1717,7 +1735,9 @@ int force_sig_mceerr(int code, void __user *addr, short lsb)
>  	info.si_code = code;
>  	info.si_addr = addr;
>  	info.si_addr_lsb = lsb;
> -	info.si_xflags = 0;
> +	info.si_xflags = SI_XFLAG_IGNORED_BITS;

Maybe drop the first _, so that this becomes

	SIXFLAG_IGNORED_BITS

?  This may help to avoid anyone thinking this might be an si_code
value.  Maybe ..._IGNORED_ADDR_BITS would also help make it clearer what
this bit is referring to.


> +	info.si_addr_ignored_bits = addr_ignored_bits;
> +	info.si_addr_ignored_bits_mask = addr_ignored_bits_mask;
>  	return force_sig_info(&info);
>  }
>  
> @@ -3298,6 +3318,8 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
>  		to->si_trapno = from->si_trapno;
>  #endif
>  		to->si_xflags = from->si_xflags;
> +		to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> +		to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
>  		break;
>  	case SIL_FAULT_MCEERR:
>  		to->si_addr = ptr_to_compat(from->si_addr);
> @@ -3306,6 +3328,8 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
>  #endif
>  		to->si_addr_lsb = from->si_addr_lsb;
>  		to->si_xflags = from->si_xflags;
> +		to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> +		to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
>  		break;
>  	case SIL_FAULT_BNDERR:
>  		to->si_addr = ptr_to_compat(from->si_addr);
> @@ -3315,6 +3339,8 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
>  		to->si_lower = ptr_to_compat(from->si_lower);
>  		to->si_upper = ptr_to_compat(from->si_upper);
>  		to->si_xflags = from->si_xflags;
> +		to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> +		to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
>  		break;
>  	case SIL_FAULT_PKUERR:
>  		to->si_addr = ptr_to_compat(from->si_addr);
> @@ -3323,6 +3349,8 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
>  #endif
>  		to->si_pkey = from->si_pkey;
>  		to->si_xflags = from->si_xflags;
> +		to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> +		to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
>  		break;>  	case SIL_CHLD:
>  		to->si_pid = from->si_pid;
> @@ -3382,6 +3410,8 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
>  		to->si_trapno = from->si_trapno;
>  #endif
>  		to->si_xflags = from->si_xflags;
> +		to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> +		to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
>  		break;
>  	case SIL_FAULT_MCEERR:
>  		to->si_addr = compat_ptr(from->si_addr);
> @@ -3390,6 +3420,8 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
>  #endif
>  		to->si_addr_lsb = from->si_addr_lsb;
>  		to->si_xflags = from->si_xflags;
> +		to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> +		to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
>  		break;
>  	case SIL_FAULT_BNDERR:
>  		to->si_addr = compat_ptr(from->si_addr);
> @@ -3399,6 +3431,8 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
>  		to->si_lower = compat_ptr(from->si_lower);
>  		to->si_upper = compat_ptr(from->si_upper);
>  		to->si_xflags = from->si_xflags;
> +		to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> +		to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
>  		break;
>  	case SIL_FAULT_PKUERR:
>  		to->si_addr = compat_ptr(from->si_addr);
> @@ -3407,6 +3441,8 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
>  #endif
>  		to->si_pkey = from->si_pkey;
>  		to->si_xflags = from->si_xflags;
> +		to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> +		to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;

Again, can you justify why this is exhaustive?  If there any way to
factor this so as to reduce the number of places we need to hack this
in?

[...]

Cheers
---Dave
