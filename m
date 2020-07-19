Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63CA92252D1
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Jul 2020 18:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgGSQfh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 19 Jul 2020 12:35:37 -0400
Received: from mout.gmx.net ([212.227.17.21]:60153 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgGSQfh (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 19 Jul 2020 12:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1595176525;
        bh=OoVQovSOsuBGhhgKBU1hAPiUXjv71FKked5bYWEQvPA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=kT0ej6kyCfQblyPpwFL6aoowuJqm0ykw5g+eeI6KVD9VlBjn70n12EajoUpsZwftA
         DzxT67fuEUzQ+PxrKnjfgoYRcqbiGRjUpvS79V4Ctbm9FAm1oqfsqEEKFPbP07HpvL
         AISj5jWvd1VBGDna02qdj//DjtVuRAi4ZMomNt8Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.196]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpSb-1kUbIK0hOT-00gDgv; Sun, 19
 Jul 2020 18:35:25 +0200
Subject: Re: [PATCH v3] parisc: Fix spinlock barriers
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <04485b95-01df-d100-cf3a-1944a69ded26@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <c100c26e-831e-6d65-ec2c-ba42b881f5c7@gmx.de>
Date:   Sun, 19 Jul 2020 18:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <04485b95-01df-d100-cf3a-1944a69ded26@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:altS40bdSYiwyIfUSdiJCUfzAyRcoR7KWOxEKwAVz5r4wL0a/uM
 0zbI1+MTBvN4cK9IGmZt5VnSvJwBPPUSRUduAgQ9bUZbb+kR1PUhuattr+PfinczC8Dbo99
 OuYquaTeGabdk43KsVIiuq3MalfPEEcKu4pIhhfmh2dJjkdvmhSHSjRjbHwt6IwBKbr876M
 eXMF+iXHCwgwopjGeo4Sw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nFxvkBMHg0U=:aSaDn+js493TdFeWkzwkX1
 HsuR8CGXeaavPw8se4gi5cCq6TAlGu90aBr7S3eoUq0hBK3nka5R6UwQxnw2pjp8JRjg6VAUz
 cEBTUpOEc7CV9o58MsHzYmJiJIr9GRDJ4d7OJZYVIYhUhxeKSHUp1+YMRLO0Q30Kdvqp83ltW
 7rcuZnMloo9go9bhXhVRnDnFJZ97hH3N79DeCauraNOYP5ddGXTWjYBV00N1UU1UzdPxZKAO0
 eZrcBVsLPvT9fuUs1NTEpS/FewMOlYdcSIv7+aNvN/nBsRiAsHDm5XFGS4/NLcf1GY/Z97cmz
 /aPRUoWeNphBrdJNC0Xyrl04lm0eofklBTSsaM2Frwg8D4CvXD4i7yxW2XiLAgcKqtUk+iOuV
 oWAq+nVYNa5OBVxHNnUtZMiS2o7q5i7jnV7COyufDy/zQc0yjzNVXwNP8PKvSufZ4D7PAU5RV
 XXqxP2/iMCFvmTd2NF0hCAlYMbxwaZd3N67I2pROEIp+lxzyqtm1Q4urwfCDkgSJcwF6JLDZe
 m79hRWyIh21BHR2MyeiO5yTEjdR3UsKTdntco/spXq34phba5IKlui9rpBrFVBflgcmgDq0o0
 HLObQ3UiquzbklH6vSWtnVIsK/MtvpuBn0rY/tgiOgEsxaw8srODzRviNK76CL9ttTdeN6f81
 zn1TAnax0i5jGd8dkHFieM9d1kHFiPNUY0chDuoKL+Q3YQWOIvFyJGAE5WUAlAN2nuKMe7iPW
 m9btO5yeAVuNBaZXB5dk7TMtFeKxRMDu0wimc/ktsZKXRz0CjuYMiz8Nj4PlIheDkZbGkT7DB
 XbHuKZjsIGAJlHEadoxMSCXgHk5jfzBodqwMQElaqnHJUIMCRYiHQs0a6IYzr5K4VnnO2euxI
 F57f7ElDQYUrFZITkDw+iNUNsi+g/su3y6wwznwjQmQcnzjCp5eyWe7W5ZuGcGJO71wZJZcXL
 J6ehpuPQ0Eas9hSIwKBSi28CLaFweolxWfVpLW8izGdiaXnPlrBPvorBvBsUqwdanvGPu+eyZ
 pflu/86iBqTdSdnTKGyu7CbruGgQAj9OHw7d9qRcgrLGDVREJK73KVXFeAowIy0ZtSW2jSyAY
 QHyFdmjZvd41pCR4Vg3xVvWJolK0yHeUKtt9lcA9pR5RpLj736noFryTpSmpGPE70NfdhnUxp
 fGKC96a+mzTLTNGjVPBbZ86P4LRX2n+2oXtZLQ1L5lEIVgwyoZV+C6IXxOTYzKFnUdxR8bl28
 fbOP+5+vhYOOLttwt
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Dave,

On 19.07.20 16:34, John David Anglin wrote:
> Stalls are quite frequent with recent kernels.  When the stall is detect=
ed by rcu_sched, we
> get a backtrace similar to the following:
>
> rcu: INFO: rcu_sched self-detected stall on CPU
> rcu:    0-...!: (5998 ticks this GP) idle=3D3a6/1/0x4000000000000002 sof=
tirq=3D8356938/8356939 fqs=3D2
>         (t=3D6000 jiffies g=3D8985785 q=3D391)
> rcu: rcu_sched kthread starved for 5992 jiffies! g8985785 f0x0 RCU_GP_WA=
IT_FQS(5) ->state=3D0x0 ->cpu=3D0
> rcu: RCU grace-period kthread stack dump:
> rcu_sched       R  running task        0    10      2 0x00000000
> Backtrace:
>
> Task dump for CPU 0:
> collect2        R  running task        0 16562  16561 0x00000014
> Backtrace:
>  [<000000004017913c>] show_stack+0x44/0x60
>  [<00000000401df694>] sched_show_task.part.77+0xf4/0x180
>  [<00000000401e70e8>] dump_cpu_task+0x68/0x80
>  [<0000000040230a58>] rcu_sched_clock_irq+0x708/0xae0
>  [<0000000040237670>] update_process_times+0x58/0xb8
>  [<00000000407dc39c>] timer_interrupt+0xa4/0x110
>  [<000000004021af30>] __handle_irq_event_percpu+0xb8/0x228
>  [<000000004021b0d4>] handle_irq_event_percpu+0x34/0x98
>  [<00000000402225b8>] handle_percpu_irq+0xa8/0xe8
>  [<000000004021a05c>] generic_handle_irq+0x54/0x70
>  [<0000000040180340>] call_on_stack+0x18/0x24
>  [<000000004017a63c>] execute_on_irq_stack+0x5c/0xa8
>  [<000000004017b76c>] do_cpu_irq_mask+0x2dc/0x410
>  [<000000004017f074>] intr_return+0x0/0xc
>
> However, this doesn't provide any information as to the cause.  I enable=
d CONFIG_SOFTLOCKUP_DETECTOR
> and I caught the following stall:
>
> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [cc1:22803]
> Modules linked in: dm_mod dax binfmt_misc ext4 crc16 jbd2 ext2 mbcache s=
g ipmi_watchdog ipmi_si ipmi_poweroff ipmi_devintf ipmi_msghandler nfsd
> ip_tables x_tables ipv6 autofs4 xfs libcrc32c crc32c_generic raid10 raid=
1 raid0 multipath linear md_mod ses enclosure sd_mod scsi_transport_sas
> t10_pi sr_mod cdrom ata_generic uas usb_storage pata_cmd64x libata ohci_=
pci ehci_pci ohci_hcd sym53c8xx ehci_hcd scsi_transport_spi tg3 usbcore
> scsi_mod usb_common
> CPU: 0 PID: 22803 Comm: cc1 Not tainted 5.6.17+ #3
> Hardware name: 9000/800/rp3440
>
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001001111111100001111 Not tainted
> r00-03  000000ff0804ff0f 0000000040891dc0 000000004037d1c4 000000006d5e8=
890
> r04-07  000000004086fdc0 0000000040ab31ac 000000000004e99a 0000000000001=
f20
> r08-11  0000000040b24710 000000006d5e8488 0000000040a1d280 000000006d5e8=
9b0
> r12-15  000000006d5e88c4 00000001802c2cb8 000000003c812825 0000004122eb4=
d18
> r16-19  0000000040b26630 000000006d5e8898 000000000001d330 000000006d5e8=
8c0
> r20-23  000000000800000f 0000000a0ad24270 b6683633143fce3c 0000004122eb4=
d54
> r24-27  000000006d5e88c4 000000006d5e8488 00000001802c2cb8 000000004086f=
dc0
> r28-31  0000004122d57b69 000000006d5e89b0 000000006d5e89e0 000000006d5e8=
000
> sr00-03  000000000c749000 0000000000000000 0000000000000000 000000000c74=
9000
> sr04-07  0000000000000000 0000000000000000 0000000000000000 000000000000=
0000
>
> IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004037d414 000000004=
037d418
>  IIR: 0e0010dc    ISR: 00000041042d63f0  IOR: 000000004086fdc0
>  CPU:        0   CR30: 000000006d5e8000 CR31: ffffffffffffefff
>  ORIG_R28: 000000004086fdc0
>  IAOQ[0]: d_alloc_parallel+0x384/0x688
>  IAOQ[1]: d_alloc_parallel+0x388/0x688
>  RP(r2): d_alloc_parallel+0x134/0x688
> Backtrace:
>  [<000000004036974c>] __lookup_slow+0xa4/0x200
>  [<0000000040369fc8>] walk_component+0x288/0x458
>  [<000000004036a9a0>] path_lookupat+0x88/0x198
>  [<000000004036e748>] filename_lookup+0xa0/0x168
>  [<000000004036e95c>] user_path_at_empty+0x64/0x80
>  [<000000004035d93c>] vfs_statx+0x104/0x158
>  [<000000004035dfcc>] __do_sys_lstat64+0x44/0x80
>  [<000000004035e5a0>] sys_lstat64+0x20/0x38
>  [<0000000040180054>] syscall_exit+0x0/0x14
>
> The code was stuck in this loop in d_alloc_parallel:
>
>     4037d414:   0e 00 10 dc     ldd 0(r16),ret0
>     4037d418:   c7 fc 5f ed     bb,< ret0,1f,4037d414 <d_alloc_parallel+=
0x384>
>     4037d41c:   08 00 02 40     nop
>
> This is the inner loop of bit_spin_lock which is called by hlist_bl_unlo=
ck in d_alloc_parallel:
>
> static inline void bit_spin_lock(int bitnum, unsigned long *addr)
> {
>         /*
>          * Assuming the lock is uncontended, this never enters
>          * the body of the outer loop. If it is contended, then
>          * within the inner loop a non-atomic test is used to
>          * busywait with less bus contention for a good time to
>          * attempt to acquire the lock bit.
>          */
>         preempt_disable();
> #if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
>         while (unlikely(test_and_set_bit_lock(bitnum, addr))) {
>                 preempt_enable();
>                 do {
>                         cpu_relax();
>                 } while (test_bit(bitnum, addr));
>                 preempt_disable();
>         }
> #endif
>         __acquire(bitlock);
> }
>
> test_and_set_bit_lock() looks like this:
>
> static inline int test_and_set_bit_lock(unsigned int nr,
>                                         volatile unsigned long *p)
> {
>         long old;
>         unsigned long mask =3D BIT_MASK(nr);
>
>         p +=3D BIT_WORD(nr);
>         if (READ_ONCE(*p) & mask)
>                 return 1;
>
>         old =3D atomic_long_fetch_or_acquire(mask, (atomic_long_t *)p);
>         return !!(old & mask);
> }
>
> After some more considerations, I realized that the previous patches wer=
e just affecting the timing
> of the spin lock routines and not fixing the real problem.  The actual p=
roblem is not with the spin lock
> barriers but with unlock code.

Ok.

> We enter the inner loop of bit_spin_lock() when the bit lock is held.  W=
e stall when the lock is never
> released.  This lead me to look at the locking in arch/parisc/include/as=
m/atomic.h.  It turns out we are
> missing a define for atomic64_set_release().  The equivalent is present =
for 32-bit releases.
>
> The release for 64-bit bit operations needs to use atomic64_set() to pre=
vent the loss of release
> operations when there is contention.

Good!!!

> In reviewing the atomic operations in entry.S, I realized that there is =
also a bug in the
> spin lock release code of the TLB handler.  Space id's are 64 bits on 64=
-bit targets.  So,
> using the least significant 32 bits to reset the spin lock is not safe. =
 The lock will not
> be freed if the bits are all zero.

Hmm..
The space ids on 64-bit Linux are limited to (see arch/parisc/mm/init.c):
#define NR_SPACE_IDS 262144
and SID =3D=3D 0 can't happen for userspace (it's blocked in the space_id[=
] bitmap).
So, I think this part was ok.

> @@ -467,10 +466,9 @@
>  	/* Release pa_tlb_lock lock without reloading lock address. */
>  	.macro		tlb_unlock0	spc,tmp,tmp1
>  #ifdef CONFIG_SMP
> +	ldi		1,\tmp1
>  98:	or,COND(=3D)	%r0,\spc,%r0
> -	LDCW		0(\tmp),\tmp1
> -	or,COND(=3D)	%r0,\spc,%r0
> -	stw		\spc,0(\tmp)
> +	stw		\tmp1,0(\tmp)
>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)

In tlb_lock() we only lock for non-kernel SIDs (!=3D0),
but now you unlock unconditionally.


> This patch modifies the code to unlock the lock in the TLB handler with =
the value one.  Using
> one is consistent with the release value used in the spin lock code.  It=
 also would allow one to
> dirty the lock cache line with a stb to the most significant byte.  This=
 optimization may speed
> up the ldcw instruction on some machines.
>
> I removed the LDCW barriers from this code as I don't believe they are n=
ecessary.  When the page
> is not present, nothing has been done other than to test the page presen=
t bit.  The release is done
> after the TLB entry is updated.  I believe it is strongly ordered and fo=
rces prior writes to complete.

Ok.

> This fixes the stall in building libpreludedb.

I wonder if the stall is still fixed if you omit your patch to  pa_tlb_loc=
k().

Thanks for your work on this!!!

Helge


>
> Signed-off-by: Dave Anglin <dave.anglin@bell.net>
> ---
>
> diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/=
atomic.h
> index 118953d41763..6dd4171c9530 100644
> --- a/arch/parisc/include/asm/atomic.h
> +++ b/arch/parisc/include/asm/atomic.h
> @@ -212,6 +212,8 @@ atomic64_set(atomic64_t *v, s64 i)
>  	_atomic_spin_unlock_irqrestore(v, flags);
>  }
>
> +#define atomic64_set_release(v, i)	atomic64_set((v), (i))
> +
>  static __inline__ s64
>  atomic64_read(const atomic64_t *v)
>  {
> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
> index 4b484ec7c7da..28a17e3c5383 100644
> --- a/arch/parisc/kernel/entry.S
> +++ b/arch/parisc/kernel/entry.S
> @@ -454,7 +454,6 @@
>  	nop
>  	LDREG		0(\ptp),\pte
>  	bb,<,n		\pte,_PAGE_PRESENT_BIT,3f
> -	LDCW		0(\tmp),\tmp1
>  	b		\fault
>  	stw		\spc,0(\tmp)
>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
> @@ -467,10 +466,9 @@
>  	/* Release pa_tlb_lock lock without reloading lock address. */
>  	.macro		tlb_unlock0	spc,tmp,tmp1
>  #ifdef CONFIG_SMP
> +	ldi		1,\tmp1
>  98:	or,COND(=3D)	%r0,\spc,%r0
> -	LDCW		0(\tmp),\tmp1
> -	or,COND(=3D)	%r0,\spc,%r0
> -	stw		\spc,0(\tmp)
> +	stw		\tmp1,0(\tmp)
>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
>  #endif
>  	.endm
>

