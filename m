Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B3247F2FE
	for <lists+linux-parisc@lfdr.de>; Sat, 25 Dec 2021 11:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbhLYKkT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 Dec 2021 05:40:19 -0500
Received: from mout.gmx.net ([212.227.15.18]:33563 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229728AbhLYKkT (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 Dec 2021 05:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1640428807;
        bh=EJz55nzdpuarDhnonmDc5wtXXlm3N2/HpQ11zsKx6vY=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=AGBxM97O/j8x2CgifRr5bMOn8fwZh3+neg2tmLchn/cWcm6w9XyGcL9OpczEqqCXo
         eubE4hIIJ092JCXfH1hZlpbCek7kgXlVcNf2oMgIQD2lWvLEns7wiXDTh5+vtDELQj
         WTYQAZXq6b67g4enmgbDJ0l2gRchOYBeYkFv6y2s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.149.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzyya-1mCndR2agg-00x7Nh; Sat, 25
 Dec 2021 11:40:07 +0100
Message-ID: <deb12c5d-419d-0c5f-cc58-ecf894170149@gmx.de>
Date:   Sat, 25 Dec 2021 11:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] parisc: Rewrite light-weight syscall and futex code
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YcYWXDu1jXpAQBiq@mx3210.localdomain>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <YcYWXDu1jXpAQBiq@mx3210.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GKfAnWOtXgzGxBquhPBvVf8CsO3rt+dzgjNG+56+RI3Gt7Z1/he
 LND4XCQrIuFUCv0kFXDMQ5czIstsxUql/BNTgca6HBPpYHX9M0LB2R7MR/Af/AlS0Gk63ks
 BTGruaOtY9vUpUZ6icK8SFOMkM4Vlex7qQZwuvRvUUy0MRGlaDuFZPtiCPCKy1lb6C27stC
 XC8n6rbMInCRahOCOMLKQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mX3yxYEBWdk=:X5CMYS8+M7GUnU2B/Quq3T
 7MPcQFkbjCw2hZpSBpkwvxX+y8McYZz9ymav47WnH3clX8+EEtaqG3B4QHvVaMA+WWtvz5nzv
 LTeaAxtTNEsgkoFH3Xl2VdPc5Mjh7WifyoyN775jUnMycLpwXpkPVndoXIf8FsHyEko36cRad
 XDBe5frmNt5nT/esczYgaNbUoE6/eWyZJkBoRiDuw5uV8V5/CZ3etejVvaeydeIXD2lof35O3
 wL6rkXxzo0PaxdlElubatTVVWu1mTL74KKmtUSCXFGniPeeJ1PTOYwoz+M5bnwN4dpTDymo8y
 ZwLBy/XcMocImFsv3X9rcqZX8wIb0qsJcLUi/OyOsml+MTYnjEKyOK+q3Ov0uK8t+vWEiGNlw
 a1CxF5dTnmQzqWCFWZB35/HEFFtLCLiUcNXZ+FCteXLMfLWOFE5bL3uzEnS0W+uXKNPkGakex
 sZN5IDTMrh3oBbewDbk75XGP3ijPN1NophP84fZHmjNp10blumXE7t3xdJLJmmNdkBoo2yV+Q
 V4DKl3U6o3hY93lndbMUJDeaHF2S+tcKUYo0OoBQM2Aysp8iasfQX5b9V9niP5LADTHJCGsZ6
 r8ImspFf9fMknQu95Tt8EUe2/Jr2hqUkyBC7l4AkLOhpglBXiman6iRLHJT0LEFseu2pBI5Tx
 3gHQQE7AdOwyHuA6ysOgnSt1AN3BBUf/8fYV4HJZtD+85Y9oMJOYM1BqddIt+EFul64w/j4Si
 SCe3PlGQprp3n+dGwNbhk7wLBfuf2RNQZhFaYdf7/dMPZiAyv1nRfokQfNe/oLvJOtQ8+Y+E6
 mJnRSl7uuKaQaUACgwLuDRIzOvyYxjzWBiC3vEtDpPEQLYTszFwNior/BQp8F1neIPOIE1f0Y
 0KYFw57lJYFqH4/ZuwqHgj+Yg8fPxIJJ0+NLjsr8z2rJrABHdRBc8+cdZxKpW7FqBXcBpRA6w
 OwEuYIRL3EYKJIe56hpeSK1hJSj915ak3K9Yyg2JkcEj9O2PRj1j58N5lsmvETyVvCjjvW4LX
 VE/vThmbQ7P88EVAp3MsKNwPrVPqrA4tvt34273p9OaOTTQbOHXYSF7VtbllsjMiPJ17iKAfa
 00koTtvf5YCgw4=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/24/21 19:50, John David Anglin wrote:
> The parisc architecture lacks general hardware support for compare and s=
wap.
> Particularly for userspace, it is difficult to implement software atomic
> support. Page faults in critical regions can cause processes to sleep an=
d
> block the forward progress of other processes.  Thus, it is essential th=
at
> page faults be disabled in critical regions. For performance reasons, we
> also need to disable external interrupts in critical regions.
>
> In order to do this, we need a mechanism to trigger COW breaks outside t=
he
> critical region. Fortunately, parisc has the "stbys,e" instruction. When
> the leftmost byte of a word is addressed, this instruction triggers all
> the exceptions of a normal store but it does not write to memory. Thus,
> we can use it to trigger COW breaks outside the critical region without
> modifying the data that is to be updated atomically.
>
> COW breaks occur randomly.  So even if we have priviously executed a "st=
bys,e"
> instruction, we still need to disable pagefaults around the critical reg=
ion.
> If a fault occurs in the critical region, we return -EAGAIN. I had to ad=
d
> a wrapper around _arch_futex_atomic_op_inuser() as I found in testing th=
at
> returning -EAGAIN caused problems for some processes even though it is
> listed as a possible return value.
>
> The patch implements the above. The code no longer attempts to sleep wit=
h
> interrupts disabled and I haven't seen any stalls with the change.
>
> I have attempted to merge common code and streamline the fast path.  In =
the
> futex code, we only compute the spinlock address once.
>
> I eliminated some debug code in the original CAS routine that just made =
the
> flow more complicated.
>
> I don't clip the arguments when called from wide mode. As a result, the =
LWS
> routines should work when called from 64-bit processes.
>
> I defined TASK_PAGEFAULT_DISABLED offset for use in the lws_pagefault_di=
sable
> and lws_pagefault_enable macros.
>
> Since we now disable interrupts on the gateway page where necessary, it
> might be possible to allow processes to be scheduled when they are on th=
e
> gateway page.
>
> Change has been tested on c8000 and rp3440. It improves glibc build and =
test
> time by about 10%.
>
> In v2, I removed the lws_atomic_xchg and and lws_atomic_store calls. I
> also removed the bug fixes that were not directly related to this patch.
>
> In v3, I removed the code to force interruptions from
> arch_futex_atomic_op_inuser(). It is always called with page faults
> disabled, so this code had no effect.
>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>

applied.
Thanks,
Helge


> ---
>
> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/f=
utex.h
> index 9cd4dd6e63ad..b5835325d44b 100644
> --- a/arch/parisc/include/asm/futex.h
> +++ b/arch/parisc/include/asm/futex.h
> @@ -8,39 +8,47 @@
>  #include <asm/errno.h>
>
>  /* The following has to match the LWS code in syscall.S.  We have
> -   sixteen four-word locks. */
> + * 256 four-word locks. We use bits 20-27 of the futex virtual
> + * address for the hash index.
> + */
> +
> +static inline unsigned long _futex_hash_index(unsigned long ua)
> +{
> +	return (ua >> 2) & 0x3fc;
> +}
>
>  static inline void
> -_futex_spin_lock(u32 __user *uaddr)
> +_futex_spin_lock_irqsave(arch_spinlock_t *s, unsigned long *flags)
>  {
> -	extern u32 lws_lock_start[];
> -	long index =3D ((long)uaddr & 0x7f8) >> 1;
> -	arch_spinlock_t *s =3D (arch_spinlock_t *)&lws_lock_start[index];
> -	preempt_disable();
> +	local_irq_save(*flags);
>  	arch_spin_lock(s);
>  }
>
>  static inline void
> -_futex_spin_unlock(u32 __user *uaddr)
> +_futex_spin_unlock_irqrestore(arch_spinlock_t *s, unsigned long *flags)
>  {
> -	extern u32 lws_lock_start[];
> -	long index =3D ((long)uaddr & 0x7f8) >> 1;
> -	arch_spinlock_t *s =3D (arch_spinlock_t *)&lws_lock_start[index];
>  	arch_spin_unlock(s);
> -	preempt_enable();
> +	local_irq_restore(*flags);
>  }
>
>  static inline int
>  arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *u=
addr)
>  {
> +	extern u32 lws_lock_start[];
> +	unsigned long ua =3D (unsigned long)uaddr;
> +	arch_spinlock_t *s;
> +	unsigned long flags;
>  	int oldval, ret;
>  	u32 tmp;
>
> -	ret =3D -EFAULT;
> +	s =3D (arch_spinlock_t *)&lws_lock_start[_futex_hash_index(ua)];
> +	_futex_spin_lock_irqsave(s, &flags);
>
> -	_futex_spin_lock(uaddr);
> -	if (unlikely(get_user(oldval, uaddr) !=3D 0))
> +	/* Return -EFAULT if we encounter a page fault or COW break */
> +	if (unlikely(get_user(oldval, uaddr) !=3D 0)) {
> +		ret =3D -EFAULT;
>  		goto out_pagefault_enable;
> +	}
>
>  	ret =3D 0;
>  	tmp =3D oldval;
> @@ -63,13 +71,14 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *=
oval, u32 __user *uaddr)
>  		break;
>  	default:
>  		ret =3D -ENOSYS;
> +		goto out_pagefault_enable;
>  	}
>
> -	if (ret =3D=3D 0 && unlikely(put_user(tmp, uaddr) !=3D 0))
> +	if (unlikely(put_user(tmp, uaddr) !=3D 0))
>  		ret =3D -EFAULT;
>
>  out_pagefault_enable:
> -	_futex_spin_unlock(uaddr);
> +	_futex_spin_unlock_irqrestore(s, &flags);
>
>  	if (!ret)
>  		*oval =3D oldval;
> @@ -81,7 +90,11 @@ static inline int
>  futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>  			      u32 oldval, u32 newval)
>  {
> +	extern u32 lws_lock_start[];
> +	unsigned long ua =3D (unsigned long)uaddr;
> +	arch_spinlock_t *s;
>  	u32 val;
> +	unsigned long flags;
>
>  	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
>  	 * our gateway page, and causes no end of trouble...
> @@ -94,23 +107,25 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user=
 *uaddr,
>
>  	/* HPPA has no cmpxchg in hardware and therefore the
>  	 * best we can do here is use an array of locks. The
> -	 * lock selected is based on a hash of the userspace
> -	 * address. This should scale to a couple of CPUs.
> +	 * lock selected is based on a hash of the virtual
> +	 * address of the futex. This should scale to a couple
> +	 * of CPUs.
>  	 */
>
> -	_futex_spin_lock(uaddr);
> +	s =3D (arch_spinlock_t *)&lws_lock_start[_futex_hash_index(ua)];
> +	_futex_spin_lock_irqsave(s, &flags);
>  	if (unlikely(get_user(val, uaddr) !=3D 0)) {
> -		_futex_spin_unlock(uaddr);
> +		_futex_spin_unlock_irqrestore(s, &flags);
>  		return -EFAULT;
>  	}
>
>  	if (val =3D=3D oldval && unlikely(put_user(newval, uaddr) !=3D 0)) {
> -		_futex_spin_unlock(uaddr);
> +		_futex_spin_unlock_irqrestore(s, &flags);
>  		return -EFAULT;
>  	}
>
>  	*uval =3D val;
> -	_futex_spin_unlock(uaddr);
> +	_futex_spin_unlock_irqrestore(s, &flags);
>
>  	return 0;
>  }
> diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-o=
ffsets.c
> index 55c1c5189c6a..396aa3b47712 100644
> --- a/arch/parisc/kernel/asm-offsets.c
> +++ b/arch/parisc/kernel/asm-offsets.c
> @@ -37,6 +37,7 @@ int main(void)
>  {
>  	DEFINE(TASK_TI_FLAGS, offsetof(struct task_struct, thread_info.flags))=
;
>  	DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
> +	DEFINE(TASK_PAGEFAULT_DISABLED, offsetof(struct task_struct, pagefault=
_disabled));
>  	BLANK();
>  	DEFINE(TASK_REGS, offsetof(struct task_struct, thread.regs));
>  	DEFINE(TASK_PT_PSW, offsetof(struct task_struct, thread.regs.gr[ 0]));
> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index 65c88ca7a7ac..71cb6d17afac 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -50,6 +50,22 @@ registers).
>
>  	.level          PA_ASM_LEVEL
>
> +	.macro	lws_pagefault_disable reg1,reg2
> +	mfctl	%cr30, \reg2
> +	ldo	TASK_PAGEFAULT_DISABLED(\reg2), \reg2
> +	ldw	0(%sr2,\reg2), \reg1
> +	ldo	1(\reg1), \reg1
> +	stw	\reg1, 0(%sr2,\reg2)
> +	.endm
> +
> +	.macro	lws_pagefault_enable reg1,reg2
> +	mfctl	%cr30, \reg2
> +	ldo	TASK_PAGEFAULT_DISABLED(\reg2), \reg2
> +	ldw	0(%sr2,\reg2), \reg1
> +	ldo	-1(\reg1), \reg1
> +	stw	\reg1, 0(%sr2,\reg2)
> +	.endm
> +
>  	.text
>
>  	.import syscall_exit,code
> @@ -490,8 +506,35 @@ lws_start:
>  	/* Jump to lws, lws table pointers already relocated */
>  	be,n	0(%sr2,%r21)
>
> +lws_exit_noerror:
> +	stw,ma	%r20, 0(%sr2,%r20)
> +	ssm	PSW_SM_I, %r0
> +	lws_pagefault_enable	%r1,%r21
> +	b	lws_exit
> +	copy	%r0, %r21
> +
> +lws_wouldblock:
> +	ssm	PSW_SM_I, %r0
> +	lws_pagefault_enable	%r1,%r21
> +	ldo	2(%r0), %r28
> +	b	lws_exit
> +	ldo	-EAGAIN(%r0), %r21
> +
> +lws_pagefault:
> +	stw,ma	%r20, 0(%sr2,%r20)
> +	ssm	PSW_SM_I, %r0
> +	lws_pagefault_enable	%r1,%r21
> +	ldo	3(%r0),%r28
> +	b	lws_exit
> +	ldo	-EAGAIN(%r0),%r21
> +
> +lws_fault:
> +	ldo	1(%r0),%r28
> +	b	lws_exit
> +	ldo	-EFAULT(%r0),%r21
> +
>  lws_exit_nosys:
> -	ldo	-ENOSYS(%r0),%r21		   /* set errno */
> +	ldo	-ENOSYS(%r0),%r21
>  	/* Fall through: Return to userspace */
>
>  lws_exit:
> @@ -518,27 +561,19 @@ lws_exit:
>  		%r28 - Return prev through this register.
>  		%r21 - Kernel error code
>
> -		If debugging is DISabled:
> -
> -		%r21 has the following meanings:
> -
> +		%r21 returns the following error codes:
>  		EAGAIN - CAS is busy, ldcw failed, try again.
>  		EFAULT - Read or write failed.
>
> -		If debugging is enabled:
> -
> -		EDEADLOCK - CAS called recursively.
> -		EAGAIN && r28 =3D=3D 1 - CAS is busy. Lock contended.
> -		EAGAIN && r28 =3D=3D 2 - CAS is busy. ldcw failed.
> -		EFAULT - Read or write failed.
> +		If EAGAIN is returned, %r28 indicates the busy reason:
> +		r28 =3D=3D 1 - CAS is busy. lock contended.
> +		r28 =3D=3D 2 - CAS is busy. ldcw failed.
> +		r28 =3D=3D 3 - CAS is busy. page fault.
>
>  		Scratch: r20, r28, r1
>
>  	****************************************************/
>
> -	/* Do not enable LWS debugging */
> -#define ENABLE_LWS_DEBUG 0
> -
>  	/* ELF64 Process entry path */
>  lws_compare_and_swap64:
>  #ifdef CONFIG_64BIT
> @@ -551,59 +586,44 @@ lws_compare_and_swap64:
>  	b,n	lws_exit_nosys
>  #endif
>
> -	/* ELF32 Process entry path */
> +	/* ELF32/ELF64 Process entry path */
>  lws_compare_and_swap32:
>  #ifdef CONFIG_64BIT
> -	/* Clip all the input registers */
> +	/* Wide mode user process? */
> +	bb,<,n  %sp, 31, lws_compare_and_swap
> +
> +	/* Clip all the input registers for 32-bit processes */
>  	depdi	0, 31, 32, %r26
>  	depdi	0, 31, 32, %r25
>  	depdi	0, 31, 32, %r24
>  #endif
>
>  lws_compare_and_swap:
> -	/* Load start of lock table */
> -	ldil	L%lws_lock_start, %r20
> -	ldo	R%lws_lock_start(%r20), %r28
> +	/* Trigger memory reference interruptions without writing to memory */
> +1:	ldw	0(%r26), %r28
> +2:	stbys,e	%r0, 0(%r26)
>
> -	/* Extract eight bits from r26 and hash lock (Bits 3-11) */
> -	extru_safe  %r26, 28, 8, %r20
> +	/* Calculate 8-bit hash index from virtual address */
> +	extru_safe	%r26, 27, 8, %r20
> +
> +	/* Load start of lock table */
> +	ldil	L%lws_lock_start, %r28
> +	ldo	R%lws_lock_start(%r28), %r28
>
> -	/* Find lock to use, the hash is either one of 0 to
> -	   15, multiplied by 16 (keep it 16-byte aligned)
> +	/* Find lock to use, the hash index is one of 0 to
> +	   255, multiplied by 16 (keep it 16-byte aligned)
>  	   and add to the lock table offset. */
>  	shlw	%r20, 4, %r20
>  	add	%r20, %r28, %r20
>
> -# if ENABLE_LWS_DEBUG
> -	/*
> -		DEBUG, check for deadlock!
> -		If the thread register values are the same
> -		then we were the one that locked it last and
> -		this is a recurisve call that will deadlock.
> -		We *must* giveup this call and fail.
> -	*/
> -	ldw	4(%sr2,%r20), %r28			/* Load thread register */
> -	/* WARNING: If cr27 cycles to the same value we have problems */
> -	mfctl	%cr27, %r21				/* Get current thread register */
> -	cmpb,<>,n	%r21, %r28, cas_lock		/* Called recursive? */
> -	b	lws_exit				/* Return error! */
> -	ldo	-EDEADLOCK(%r0), %r21
> -cas_lock:
> -	cmpb,=3D,n	%r0, %r28, cas_nocontend	/* Is nobody using it? */
> -	ldo	1(%r0), %r28				/* 1st case */
> -	b	lws_exit				/* Contended... */
> -	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
> -cas_nocontend:
> -# endif
> -/* ENABLE_LWS_DEBUG */
> -
> -	/* COW breaks can cause contention on UP systems */
> -	LDCW	0(%sr2,%r20), %r28			/* Try to acquire the lock */
> -	cmpb,<>,n	%r0, %r28, cas_action		/* Did we get it? */
> -cas_wouldblock:
> -	ldo	2(%r0), %r28				/* 2nd case */
> -	b	lws_exit				/* Contended... */
> -	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
> +	/* Disable page faults to prevent sleeping in critical region */
> +	lws_pagefault_disable	%r21,%r28
> +	rsm	PSW_SM_I, %r0				/* Disable interrupts */
> +
> +	/* Try to acquire the lock */
> +	LDCW	0(%sr2,%r20), %r28
> +	comclr,<>	%r0, %r28, %r0
> +	b,n	lws_wouldblock
>
>  	/*
>  		prev =3D *addr;
> @@ -613,59 +633,35 @@ cas_wouldblock:
>  	*/
>
>  	/* NOTES:
> -		This all works becuse intr_do_signal
> +		This all works because intr_do_signal
>  		and schedule both check the return iasq
>  		and see that we are on the kernel page
>  		so this process is never scheduled off
>  		or is ever sent any signal of any sort,
> -		thus it is wholly atomic from usrspaces
> +		thus it is wholly atomic from usrspace's
>  		perspective
>  	*/
> -cas_action:
> -#if defined CONFIG_SMP && ENABLE_LWS_DEBUG
> -	/* DEBUG */
> -	mfctl	%cr27, %r1
> -	stw	%r1, 4(%sr2,%r20)
> -#endif
>  	/* The load and store could fail */
> -1:	ldw	0(%r26), %r28
> +3:	ldw	0(%r26), %r28
>  	sub,<>	%r28, %r25, %r0
> -2:	stw	%r24, 0(%r26)
> -	/* Free lock */
> -	stw,ma	%r20, 0(%sr2,%r20)
> -#if ENABLE_LWS_DEBUG
> -	/* Clear thread register indicator */
> -	stw	%r0, 4(%sr2,%r20)
> -#endif
> -	/* Return to userspace, set no error */
> -	b	lws_exit
> -	copy	%r0, %r21
> +4:	stw	%r24, 0(%r26)
> +	b,n	lws_exit_noerror
>
> -3:
> -	/* Error occurred on load or store */
> -	/* Free lock */
> -	stw,ma	%r20, 0(%sr2,%r20)
> -#if ENABLE_LWS_DEBUG
> -	stw	%r0, 4(%sr2,%r20)
> -#endif
> -	b	lws_exit
> -	ldo	-EFAULT(%r0),%r21	/* set errno */
> -	nop
> -	nop
> -	nop
> -	nop
> +	/* A fault occurred on load or stbys,e store */
> +5:	b,n	lws_fault
> +	ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 5b-linux_gateway_page)
> +	ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 5b-linux_gateway_page)
>
> -	/* Two exception table entries, one for the load,
> -	   the other for the store. Either return -EFAULT.
> -	   Each of the entries must be relocated. */
> -	ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 3b-linux_gateway_page)
> -	ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 3b-linux_gateway_page)
> +	/* A page fault occurred in critical region */
> +6:	b,n	lws_pagefault
> +	ASM_EXCEPTIONTABLE_ENTRY(3b-linux_gateway_page, 6b-linux_gateway_page)
> +	ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 6b-linux_gateway_page)
>
>
>  	/***************************************************
>  		New CAS implementation which uses pointers and variable size
>  		information. The value pointed by old and new MUST NOT change
> -		while performing CAS. The lock only protect the value at %r26.
> +		while performing CAS. The lock only protects the value at %r26.
>
>  		%r26 - Address to examine
>  		%r25 - Pointer to the value to check (old)
> @@ -674,25 +670,32 @@ cas_action:
>  		%r28 - Return non-zero on failure
>  		%r21 - Kernel error code
>
> -		%r21 has the following meanings:
> -
> +		%r21 returns the following error codes:
>  		EAGAIN - CAS is busy, ldcw failed, try again.
>  		EFAULT - Read or write failed.
>
> +		If EAGAIN is returned, %r28 indicates the busy reason:
> +		r28 =3D=3D 1 - CAS is busy. lock contended.
> +		r28 =3D=3D 2 - CAS is busy. ldcw failed.
> +		r28 =3D=3D 3 - CAS is busy. page fault.
> +
>  		Scratch: r20, r22, r28, r29, r1, fr4 (32bit for 64bit CAS only)
>
>  	****************************************************/
>
> -	/* ELF32 Process entry path */
>  lws_compare_and_swap_2:
>  #ifdef CONFIG_64BIT
> -	/* Clip the input registers. We don't need to clip %r23 as we
> -	   only use it for word operations */
> +	/* Wide mode user process? */
> +	bb,<,n	%sp, 31, cas2_begin
> +
> +	/* Clip the input registers for 32-bit processes. We don't
> +	   need to clip %r23 as we only use it for word operations */
>  	depdi	0, 31, 32, %r26
>  	depdi	0, 31, 32, %r25
>  	depdi	0, 31, 32, %r24
>  #endif
>
> +cas2_begin:
>  	/* Check the validity of the size pointer */
>  	subi,>>=3D 3, %r23, %r0
>  	b,n	lws_exit_nosys
> @@ -703,69 +706,76 @@ lws_compare_and_swap_2:
>  	blr	%r29, %r0
>  	nop
>
> -	/* 8bit load */
> -4:	ldb	0(%r25), %r25
> +	/* 8-bit load */
> +1:	ldb	0(%r25), %r25
>  	b	cas2_lock_start
> -5:	ldb	0(%r24), %r24
> +2:	ldb	0(%r24), %r24
>  	nop
>  	nop
>  	nop
>  	nop
>  	nop
>
> -	/* 16bit load */
> -6:	ldh	0(%r25), %r25
> +	/* 16-bit load */
> +3:	ldh	0(%r25), %r25
>  	b	cas2_lock_start
> -7:	ldh	0(%r24), %r24
> +4:	ldh	0(%r24), %r24
>  	nop
>  	nop
>  	nop
>  	nop
>  	nop
>
> -	/* 32bit load */
> -8:	ldw	0(%r25), %r25
> +	/* 32-bit load */
> +5:	ldw	0(%r25), %r25
>  	b	cas2_lock_start
> -9:	ldw	0(%r24), %r24
> +6:	ldw	0(%r24), %r24
>  	nop
>  	nop
>  	nop
>  	nop
>  	nop
>
> -	/* 64bit load */
> +	/* 64-bit load */
>  #ifdef CONFIG_64BIT
> -10:	ldd	0(%r25), %r25
> -11:	ldd	0(%r24), %r24
> +7:	ldd	0(%r25), %r25
> +8:	ldd	0(%r24), %r24
>  #else
>  	/* Load old value into r22/r23 - high/low */
> -10:	ldw	0(%r25), %r22
> -11:	ldw	4(%r25), %r23
> +7:	ldw	0(%r25), %r22
> +8:	ldw	4(%r25), %r23
>  	/* Load new value into fr4 for atomic store later */
> -12:	flddx	0(%r24), %fr4
> +9:	flddx	0(%r24), %fr4
>  #endif
>
>  cas2_lock_start:
> -	/* Load start of lock table */
> -	ldil	L%lws_lock_start, %r20
> -	ldo	R%lws_lock_start(%r20), %r28
> +	/* Trigger memory reference interruptions without writing to memory */
> +	copy	%r26, %r28
> +	depi_safe	0, 31, 2, %r21
> +10:	ldw	0(%r28), %r1
> +11:	stbys,e	%r0, 0(%r28)
>
> -	/* Extract eight bits from r26 and hash lock (Bits 3-11) */
> -	extru_safe  %r26, 28, 8, %r20
> +	/* Calculate 8-bit hash index from virtual address */
> +	extru_safe	%r26, 27, 8, %r20
>
> -	/* Find lock to use, the hash is either one of 0 to
> -	   15, multiplied by 16 (keep it 16-byte aligned)
> +	/* Load start of lock table */
> +	ldil	L%lws_lock_start, %r28
> +	ldo	R%lws_lock_start(%r28), %r28
> +
> +	/* Find lock to use, the hash index is one of 0 to
> +	   255, multiplied by 16 (keep it 16-byte aligned)
>  	   and add to the lock table offset. */
>  	shlw	%r20, 4, %r20
>  	add	%r20, %r28, %r20
>
> -	/* COW breaks can cause contention on UP systems */
> -	LDCW	0(%sr2,%r20), %r28		/* Try to acquire the lock */
> -	cmpb,<>,n	%r0, %r28, cas2_action	/* Did we get it? */
> -cas2_wouldblock:
> -	ldo	2(%r0), %r28			/* 2nd case */
> -	b	lws_exit			/* Contended... */
> -	ldo	-EAGAIN(%r0), %r21		/* Spin in userspace */
> +	/* Disable page faults to prevent sleeping in critical region */
> +	lws_pagefault_disable	%r21,%r28
> +	rsm	PSW_SM_I, %r0			/* Disable interrupts */
> +
> +	/* Try to acquire the lock */
> +	LDCW	0(%sr2,%r20), %r28
> +	comclr,<>	%r0, %r28, %r0
> +	b,n	lws_wouldblock
>
>  	/*
>  		prev =3D *addr;
> @@ -775,110 +785,102 @@ cas2_wouldblock:
>  	*/
>
>  	/* NOTES:
> -		This all works becuse intr_do_signal
> +		This all works because intr_do_signal
>  		and schedule both check the return iasq
>  		and see that we are on the kernel page
>  		so this process is never scheduled off
>  		or is ever sent any signal of any sort,
> -		thus it is wholly atomic from usrspaces
> +		thus it is wholly atomic from usrspace's
>  		perspective
>  	*/
> -cas2_action:
> +
>  	/* Jump to the correct function */
>  	blr	%r29, %r0
>  	/* Set %r28 as non-zero for now */
>  	ldo	1(%r0),%r28
>
> -	/* 8bit CAS */
> -13:	ldb	0(%r26), %r29
> +	/* 8-bit CAS */
> +12:	ldb	0(%r26), %r29
>  	sub,=3D	%r29, %r25, %r0
> -	b,n	cas2_end
> -14:	stb	%r24, 0(%r26)
> -	b	cas2_end
> +	b,n	lws_exit_noerror
> +13:	stb	%r24, 0(%r26)
> +	b	lws_exit_noerror
>  	copy	%r0, %r28
>  	nop
>  	nop
>
> -	/* 16bit CAS */
> -15:	ldh	0(%r26), %r29
> +	/* 16-bit CAS */
> +14:	ldh	0(%r26), %r29
>  	sub,=3D	%r29, %r25, %r0
> -	b,n	cas2_end
> -16:	sth	%r24, 0(%r26)
> -	b	cas2_end
> +	b,n	lws_exit_noerror
> +15:	sth	%r24, 0(%r26)
> +	b	lws_exit_noerror
>  	copy	%r0, %r28
>  	nop
>  	nop
>
> -	/* 32bit CAS */
> -17:	ldw	0(%r26), %r29
> +	/* 32-bit CAS */
> +16:	ldw	0(%r26), %r29
>  	sub,=3D	%r29, %r25, %r0
> -	b,n	cas2_end
> -18:	stw	%r24, 0(%r26)
> -	b	cas2_end
> +	b,n	lws_exit_noerror
> +17:	stw	%r24, 0(%r26)
> +	b	lws_exit_noerror
>  	copy	%r0, %r28
>  	nop
>  	nop
>
> -	/* 64bit CAS */
> +	/* 64-bit CAS */
>  #ifdef CONFIG_64BIT
> -19:	ldd	0(%r26), %r29
> +18:	ldd	0(%r26), %r29
>  	sub,*=3D	%r29, %r25, %r0
> -	b,n	cas2_end
> -20:	std	%r24, 0(%r26)
> +	b,n	lws_exit_noerror
> +19:	std	%r24, 0(%r26)
>  	copy	%r0, %r28
>  #else
>  	/* Compare first word */
> -19:	ldw	0(%r26), %r29
> +18:	ldw	0(%r26), %r29
>  	sub,=3D	%r29, %r22, %r0
> -	b,n	cas2_end
> +	b,n	lws_exit_noerror
>  	/* Compare second word */
> -20:	ldw	4(%r26), %r29
> +19:	ldw	4(%r26), %r29
>  	sub,=3D	%r29, %r23, %r0
> -	b,n	cas2_end
> +	b,n	lws_exit_noerror
>  	/* Perform the store */
> -21:	fstdx	%fr4, 0(%r26)
> +20:	fstdx	%fr4, 0(%r26)
>  	copy	%r0, %r28
>  #endif
> +	b	lws_exit_noerror
> +	copy	%r0, %r28
>
> -cas2_end:
> -	/* Free lock */
> -	stw,ma	%r20, 0(%sr2,%r20)
> -	/* Return to userspace, set no error */
> -	b	lws_exit
> -	copy	%r0, %r21
> -
> -22:
> -	/* Error occurred on load or store */
> -	/* Free lock */
> -	stw,ma	%r20, 0(%sr2,%r20)
> -	ldo	1(%r0),%r28
> -	b	lws_exit
> -	ldo	-EFAULT(%r0),%r21	/* set errno */
> -	nop
> -	nop
> -	nop
> +	/* A fault occurred on load or stbys,e store */
> +30:	b,n	lws_fault
> +	ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 30b-linux_gateway_page=
)
> +	ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 30b-linux_gateway_page=
)
> +	ASM_EXCEPTIONTABLE_ENTRY(3b-linux_gateway_page, 30b-linux_gateway_page=
)
> +	ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 30b-linux_gateway_page=
)
> +	ASM_EXCEPTIONTABLE_ENTRY(5b-linux_gateway_page, 30b-linux_gateway_page=
)
> +	ASM_EXCEPTIONTABLE_ENTRY(6b-linux_gateway_page, 30b-linux_gateway_page=
)
> +	ASM_EXCEPTIONTABLE_ENTRY(7b-linux_gateway_page, 30b-linux_gateway_page=
)
> +	ASM_EXCEPTIONTABLE_ENTRY(8b-linux_gateway_page, 30b-linux_gateway_page=
)
> +#ifndef CONFIG_64BIT
> +	ASM_EXCEPTIONTABLE_ENTRY(9b-linux_gateway_page, 30b-linux_gateway_page=
)
> +#endif
>
> -	/* Exception table entries, for the load and store, return EFAULT.
> -	   Each of the entries must be relocated. */
> -	ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 22b-linux_gateway_page=
)
> -	ASM_EXCEPTIONTABLE_ENTRY(5b-linux_gateway_page, 22b-linux_gateway_page=
)
> -	ASM_EXCEPTIONTABLE_ENTRY(6b-linux_gateway_page, 22b-linux_gateway_page=
)
> -	ASM_EXCEPTIONTABLE_ENTRY(7b-linux_gateway_page, 22b-linux_gateway_page=
)
> -	ASM_EXCEPTIONTABLE_ENTRY(8b-linux_gateway_page, 22b-linux_gateway_page=
)
> -	ASM_EXCEPTIONTABLE_ENTRY(9b-linux_gateway_page, 22b-linux_gateway_page=
)
> -	ASM_EXCEPTIONTABLE_ENTRY(10b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> -	ASM_EXCEPTIONTABLE_ENTRY(11b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> -	ASM_EXCEPTIONTABLE_ENTRY(13b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> -	ASM_EXCEPTIONTABLE_ENTRY(14b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> -	ASM_EXCEPTIONTABLE_ENTRY(15b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> -	ASM_EXCEPTIONTABLE_ENTRY(16b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> -	ASM_EXCEPTIONTABLE_ENTRY(17b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> -	ASM_EXCEPTIONTABLE_ENTRY(18b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> -	ASM_EXCEPTIONTABLE_ENTRY(19b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> -	ASM_EXCEPTIONTABLE_ENTRY(20b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> +	ASM_EXCEPTIONTABLE_ENTRY(10b-linux_gateway_page, 30b-linux_gateway_pag=
e)
> +	ASM_EXCEPTIONTABLE_ENTRY(11b-linux_gateway_page, 30b-linux_gateway_pag=
e)
> +
> +	/* A page fault occurred in critical region */
> +31:	b,n	lws_pagefault
> +	ASM_EXCEPTIONTABLE_ENTRY(12b-linux_gateway_page, 31b-linux_gateway_pag=
e)
> +	ASM_EXCEPTIONTABLE_ENTRY(13b-linux_gateway_page, 31b-linux_gateway_pag=
e)
> +	ASM_EXCEPTIONTABLE_ENTRY(14b-linux_gateway_page, 31b-linux_gateway_pag=
e)
> +	ASM_EXCEPTIONTABLE_ENTRY(15b-linux_gateway_page, 31b-linux_gateway_pag=
e)
> +	ASM_EXCEPTIONTABLE_ENTRY(16b-linux_gateway_page, 31b-linux_gateway_pag=
e)
> +	ASM_EXCEPTIONTABLE_ENTRY(17b-linux_gateway_page, 31b-linux_gateway_pag=
e)
> +	ASM_EXCEPTIONTABLE_ENTRY(18b-linux_gateway_page, 31b-linux_gateway_pag=
e)
> +	ASM_EXCEPTIONTABLE_ENTRY(19b-linux_gateway_page, 31b-linux_gateway_pag=
e)
>  #ifndef CONFIG_64BIT
> -	ASM_EXCEPTIONTABLE_ENTRY(12b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> -	ASM_EXCEPTIONTABLE_ENTRY(21b-linux_gateway_page, 22b-linux_gateway_pag=
e)
> +	ASM_EXCEPTIONTABLE_ENTRY(20b-linux_gateway_page, 31b-linux_gateway_pag=
e)
>  #endif
>
>  	/* Make sure nothing else is placed on this page */
> @@ -899,7 +901,7 @@ ENTRY(end_linux_gateway_page)
>  ENTRY(lws_table)
>  	LWS_ENTRY(compare_and_swap32)		/* 0 - ELF32 Atomic 32bit CAS */
>  	LWS_ENTRY(compare_and_swap64)		/* 1 - ELF64 Atomic 32bit CAS */
> -	LWS_ENTRY(compare_and_swap_2)		/* 2 - ELF32 Atomic 64bit CAS */
> +	LWS_ENTRY(compare_and_swap_2)		/* 2 - Atomic 64bit CAS */
>  END(lws_table)
>  	/* End of lws table */
>
>

