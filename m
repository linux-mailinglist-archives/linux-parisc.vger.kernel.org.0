Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6030847ACBD
	for <lists+linux-parisc@lfdr.de>; Mon, 20 Dec 2021 15:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236331AbhLTOqg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 20 Dec 2021 09:46:36 -0500
Received: from mta-tor-003.bell.net ([209.71.212.30]:57950 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S235772AbhLTOnD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 20 Dec 2021 09:43:03 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197A9B102A73A03
X-CM-Envelope: MS4xfMIkwBxGmg5e/z3GtUGPuffWFOgSRCrstPauhq0fcW17meODn1oCbZzjIH/KHtUkU2gsAx+g2BVrzUuydsGeRItKZm1eUF/s1RGznghaKB7bOAdO9EBB
 me0F7ACGQlwLhdufXHo058i0nAoi3jhaV3kAQPVaEnml1q3NIm/awyJNebnJfORkFKQpu2qGKSB6p4g22uI0inbayWVlfmQCxQNCro+fFQS051PyQhf+Lotn
 mon1uY/zLA4so/zcBfTAR25xXFDNt19A6n1Luh9BWrTB5MDh7ctOqfNqksxv7wcxY6lwnlIrz2w2TKvxQt4QVmhSYGU6yzpr141job4660bWHlHr0zBETlC6
 sh25fDh/
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61c09673
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=PIE9XBQKWanqsdbnOAAA:9
 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=eHS_UQT93enIUNV8:21 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197A9B102A73A03; Mon, 20 Dec 2021 09:42:59 -0500
Message-ID: <556db5e9-6ef0-c78a-7c1a-489c0f64e5ec@bell.net>
Date:   Mon, 20 Dec 2021 09:42:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1] parisc: Rewrite light-weight syscall and futex code
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <6405f1f1-77bd-2ebb-168d-d150cc945078@bell.net>
 <e10964e7-262d-f8b4-0ebf-6cd72a5512aa@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <e10964e7-262d-f8b4-0ebf-6cd72a5512aa@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-20 9:02 a.m., Helge Deller wrote:
> Hi Dave,
>
> nice work!!
>
> Sadly it fails to apply to git head...
>
> 1 out of 1 hunk FAILED -- saving rejects to file arch/parisc/include/asm/assembly.h.rej
> 4 out of 4 hunks FAILED -- saving rejects to file arch/parisc/include/asm/futex.h.rej
> 1 out of 1 hunk FAILED -- saving rejects to file arch/parisc/kernel/asm-offsets.c.rej
> 11 out of 11 hunks FAILED -- saving rejects to file arch/parisc/kernel/syscall.S.rej
> 1 out of 1 hunk FAILED -- saving rejects to file arch/parisc/kernel/traps.c.rej

Is this a newline issue? Patch diff was generated against mainline master.
>
> Some additional notes below...
>
> On 12/19/21 20:05, John David Anglin wrote:
>> Rewrite light-weight syscall and futex code.
>>
>> The parisc architecture lacks general hardware support for compare and swap. Particularly for
>> userspace, it is difficult to implement software atomic support. Page faults in critical regions
>> can cause processes to sleep and block the forward progress of other processes.  Thus, it is
>> essential that page faults be disabled in critical regions. For performance reasons, we also
>> need to disable external interrupts in critical regions.
>>
>> In order to do this, we need a mechanism to trigger COW breaks outside the critical region.
>> Fortunately, parisc has the "stbys,e" instruction. When the leftmost byte of a word is addressed,
>> this instruction triggers all the exceptions of a normal store but it does not write to memory.
>> Thus, we can use it to trigger COW breaks outside the critical region without modifying the data
>> that is to be updated atomically.
> I hope qemu emulation handles this correctly....
Hopefully, Richard read the fine print in the architecture regarding exceptions for stby.
>
>> COW breaks occur randomly.  So even if we have priviously executed a "stbys,e" instruction, we
>> still need to disable pagefaults around the critical region. If a fault occurs in the critical
>> region, we return -EAGAIN. I had to add a wrapper around _arch_futex_atomic_op_inuser() as I found
>> in testing that returning -EAGAIN caused problems for some processes even though it is listed as a
>> possible return value.
>>
>> The patch implements the above. The code no longer attempts to sleep with interrupts disabled and
>> I haven't seen any stalls with the change.
>>
>> I have attempted to merge common code and streamline the fast path.  In the futex code, we only
>> compute the spinlock address once.
>>
>> I eliminated some debug code in the original CAS routine that just made the flow more complicated.
>>
>> I have added two new LWS routines - lws_atomic_xchg and lws_atomic_store. These are simpler than
>> the CAS operations.  Currently, we use the CAS operations for atomic stores.  This is inefficient.
> I think this should go in a seperate patch.
Okay.
>
>> I don't clip the arguments when called from wide mode. As a result, the LWS routines should work
>> when called from 64-bit processes.
>>
>> I fixed a couple of bugs. The completer in the "or,ev   %r1,%r30,%r30" was reversed, so we were
>> not clipping the LWS number. The spinlock index was also computed incorrectly in the futex code.
>> The mask "0x3f8" only selected seven bits.
> Both should be backported, no?
The or patch can easily be separated.

The mask fix is not so easy as I changed the hash bit selection from bits 21-28 to 20-27 so we use the same
lock for byte, short, word, double word and quad word.  I thought we should handle quad the same as the others.
> If so we should patch them seperately to ease the backporting.
The change in hash bits is tied to reworking hash.h, so patches would need sequencing. 🙁
>
>> I defined a new depi_safe macro.  The depi instruction suffers from same issue as extru. There are
>> probably more places where it could be used.
> Good. Seems backport-worth too.
There may be instances but I added it to clear the least-significant two bits of addresses for stbys,e.
>   
>> I defined TASK_PAGEFAULT_DISABLED offset for use in the lws_pagefault_disable and lws_pagefault_enable
>> macros.
>>
>> I modified the code in handle_interruption() so faulthandler_disabled() is only called once. Maybe
>> do_page_fault() can now be optimized.
>>
>> Since we now disable interrupts on the gateway page where necessary, it might be possible to allow
>> processes to be scheduled when they are on the gateway page.
>>
>> Change has been tested on c8000 and rp3440.
>>
>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>> ---
>>
>> diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
>> index 6d13ae236fcb..6369082c6c74 100644
>> --- a/arch/parisc/include/asm/assembly.h
>> +++ b/arch/parisc/include/asm/assembly.h
>> @@ -158,6 +158,16 @@
>>   #endif
>>       .endm
>>
>> +    /* The depi instruction leaves the most significant 32 bits of the
>> +     * target register in an undefined state on PA 2.0 systems. */
>> +    .macro depi_safe i, p, len, t
>> +#ifdef CONFIG_64BIT
>> +    depdi    \i, 32+(\p), \len, \t
>> +#else
>> +    depi    \i, \p, \len, \t
>> +#endif
>> +    .endm
>> +
> this should be a patch on it's own.
>
>
>>       /* load 32-bit 'value' into 'reg' compensating for the ldil
>>        * sign-extension when running in wide mode.
>>        * WARNING!! neither 'value' nor 'reg' can be expressions
>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
>> index 70cf8f0a7617..6768230ca6d5 100644
>> --- a/arch/parisc/include/asm/futex.h
>> +++ b/arch/parisc/include/asm/futex.h
>> @@ -8,39 +8,72 @@
>>   #include <asm/errno.h>
>>
>>   /* The following has to match the LWS code in syscall.S.  We have
>> -   sixteen four-word locks. */
>> +   256 four-word locks. We use bits 20-27 of the futex virtual
>> +   address for the hash index. */
>> +
>> +static inline unsigned long _futex_hash_index(unsigned long ua)
>> +{
>> +    return (ua >> 2) & 0x3fc;
>> +}
> same here.
>
>> +
>> +/* Force store interruptions without writing anything. Return true
>> +   if load and store fault. */
>> +
>> +static inline bool _futex_force_interruptions(unsigned long ua)
>> +{
>> +    bool result;
>> +
>> +    __asm__ __volatile__(
>> +        "1:\tldw 0(%1), %0\n"
>> +        "2:\tstbys,e %%r0, 0(%1)\n"
>> +        "\tcomclr,= %%r0, %%r0, %0\n"
>> +        "3:\tldi 1, %0\n"
>> +        ASM_EXCEPTIONTABLE_ENTRY(1b, 3b)
>> +        ASM_EXCEPTIONTABLE_ENTRY(2b, 3b)
>> +        : "=&r" (result) : "r" (ua) : "memory"
>> +    );
>> +    return result;
>> +}
>>
>>   static inline void
>> -_futex_spin_lock(u32 __user *uaddr)
>> +_futex_spin_lock_irqsave(arch_spinlock_t *s, unsigned long int *flags)
>>   {
>> -    extern u32 lws_lock_start[];
>> -    long index = ((long)uaddr & 0x3f8) >> 1;
>> -    arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
>> -    preempt_disable();
>> +    local_irq_save(*flags);
>>       arch_spin_lock(s);
>>   }
>>
>>   static inline void
>> -_futex_spin_unlock(u32 __user *uaddr)
>> +_futex_spin_unlock_irqrestore(arch_spinlock_t *s, unsigned long int *flags)
>>   {
>> -    extern u32 lws_lock_start[];
>> -    long index = ((long)uaddr & 0x3f8) >> 1;
>> -    arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
>>       arch_spin_unlock(s);
>> -    preempt_enable();
>> +    local_irq_restore(*flags);
>>   }
>>
>>   static inline int
>> -arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
>> +_arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
>>   {
>> +    extern u32 lws_lock_start[];
>> +    unsigned long ua = (unsigned long)uaddr;
>> +    arch_spinlock_t *s;
>> +    unsigned long int flags;
>>       int oldval, ret;
>>       u32 tmp;
>>
>> -    ret = -EFAULT;
>> +    /* Force interruptions and page faults */
>> +    if (_futex_force_interruptions(ua))
>> +        return -EFAULT;
>>
>> -    _futex_spin_lock(uaddr);
>> -    if (unlikely(get_user(oldval, uaddr) != 0))
>> +    s = (arch_spinlock_t *)&lws_lock_start[_futex_hash_index(ua)];
>> +
>> +    /* Don't sleep */
>> +    pagefault_disable();
>> +    _futex_spin_lock_irqsave(s, &flags);
>> +
>> +    /* Return -EAGAIN if we encounter page fault contention */
>> +    if (unlikely(get_user(oldval, uaddr) != 0)) {
>> +        ret = -EAGAIN;
>>           goto out_pagefault_enable;
>> +    }
>>
>>       ret = 0;
>>       tmp = oldval;
>> @@ -63,13 +96,15 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
>>           break;
>>       default:
>>           ret = -ENOSYS;
>> +        goto out_pagefault_enable;
>>       }
>>
>> -    if (ret == 0 && unlikely(put_user(tmp, uaddr) != 0))
>> -        ret = -EFAULT;
>> +    if (unlikely(put_user(tmp, uaddr) != 0))
>> +        ret = -EAGAIN;
>>
>>   out_pagefault_enable:
>> -    _futex_spin_unlock(uaddr);
>> +    _futex_spin_unlock_irqrestore(s, &flags);
>> +    pagefault_enable();
>>
>>       if (!ret)
>>           *oval = oldval;
>> @@ -77,11 +112,27 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
>>       return ret;
>>   }
>>
>> +static inline int
>> +arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
>> +{
>> +    int ret, cnt = 0;
>> +
>> +    /* Avoid returning -EAGAIN */
>> +    do {
>> +        ret = _arch_futex_atomic_op_inuser(op, oparg, oval, uaddr);
>> +    } while (ret == -EAGAIN && cnt++ < 4);
>> +    return ret == -EAGAIN ? -EFAULT : ret;
>> +}
>> +
>>   static inline int
>>   futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>>                     u32 oldval, u32 newval)
>>   {
>> +    extern u32 lws_lock_start[];
>> +    unsigned long ua = (unsigned long)uaddr;
>> +    arch_spinlock_t *s;
>>       u32 val;
>> +    unsigned long int flags;
>>
>>       /* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
>>        * our gateway page, and causes no end of trouble...
>> @@ -94,23 +145,25 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>>
>>       /* HPPA has no cmpxchg in hardware and therefore the
>>        * best we can do here is use an array of locks. The
>> -     * lock selected is based on a hash of the userspace
>> -     * address. This should scale to a couple of CPUs.
>> +     * lock selected is based on a hash of the virtual
>> +     * address of the futex. This should scale to a couple
>> +     * of CPUs.
>>        */
>>
>> -    _futex_spin_lock(uaddr);
>> +    s = (arch_spinlock_t *)&lws_lock_start[_futex_hash_index(ua)];
>> +    _futex_spin_lock_irqsave(s, &flags);
>>       if (unlikely(get_user(val, uaddr) != 0)) {
>> -        _futex_spin_unlock(uaddr);
>> +        _futex_spin_unlock_irqrestore(s, &flags);
>>           return -EFAULT;
>>       }
>>
>>       if (val == oldval && unlikely(put_user(newval, uaddr) != 0)) {
>> -        _futex_spin_unlock(uaddr);
>> +        _futex_spin_unlock_irqrestore(s, &flags);
>>           return -EFAULT;
>>       }
>>
>>       *uval = val;
>> -    _futex_spin_unlock(uaddr);
>> +    _futex_spin_unlock_irqrestore(s, &flags);
>>
>>       return 0;
>>   }
>> diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
>> index 55c1c5189c6a..396aa3b47712 100644
>> --- a/arch/parisc/kernel/asm-offsets.c
>> +++ b/arch/parisc/kernel/asm-offsets.c
>> @@ -37,6 +37,7 @@ int main(void)
>>   {
>>       DEFINE(TASK_TI_FLAGS, offsetof(struct task_struct, thread_info.flags));
>>       DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
>> +    DEFINE(TASK_PAGEFAULT_DISABLED, offsetof(struct task_struct, pagefault_disabled));
>>       BLANK();
>>       DEFINE(TASK_REGS, offsetof(struct task_struct, thread.regs));
>>       DEFINE(TASK_PT_PSW, offsetof(struct task_struct, thread.regs.gr[ 0]));
>> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
>> index d2497b339d13..099ca7cf7343 100644
>> --- a/arch/parisc/kernel/syscall.S
>> +++ b/arch/parisc/kernel/syscall.S
>> @@ -50,6 +50,22 @@ registers).
>>
>>       .level          PA_ASM_LEVEL
>>
>> +    .macro    lws_pagefault_disable reg1,reg2
>> +    mfctl    %cr30, \reg2
>> +    ldo    TASK_PAGEFAULT_DISABLED(\reg2), \reg2
>> +    ldw    0(%sr2,\reg2), \reg1
>> +    ldo    1(\reg1), \reg1
>> +    stw    \reg1, 0(%sr2,\reg2)
>> +    .endm
>> +
>> +    .macro    lws_pagefault_enable reg1,reg2
>> +    mfctl    %cr30, \reg2
>> +    ldo    TASK_PAGEFAULT_DISABLED(\reg2), \reg2
>> +    ldw    0(%sr2,\reg2), \reg1
>> +    ldo    -1(\reg1), \reg1
>> +    stw    \reg1, 0(%sr2,\reg2)
>> +    .endm
>> +
>>       .text
>>
>>       .import syscall_exit,code
>> @@ -74,7 +90,7 @@ ENTRY(linux_gateway_page)
>>       /* ADDRESS 0xb0 to 0xb8, lws uses two insns for entry */
>>       /* Light-weight-syscall entry must always be located at 0xb0 */
>>       /* WARNING: Keep this number updated with table size changes */
>> -#define __NR_lws_entries (3)
>> +#define __NR_lws_entries (5)
>>
>>   lws_entry:
>>       gate    lws_start, %r0        /* increase privilege */
>> @@ -472,7 +488,7 @@ lws_start:
>>       extrd,u    %r1,PSW_W_BIT,1,%r1
>>       /* sp must be aligned on 4, so deposit the W bit setting into
>>        * the bottom of sp temporarily */
>> -    or,ev    %r1,%r30,%r30
>> +    or,od    %r1,%r30,%r30
> own patch...
>
>>       /* Clip LWS number to a 32-bit value for 32-bit processes */
>>       depdi    0, 31, 32, %r20
>> @@ -490,8 +506,35 @@ lws_start:
>>       /* Jump to lws, lws table pointers already relocated */
>>       be,n    0(%sr2,%r21)
>>
>> +lws_exit_noerror:
>> +    stw,ma    %r20, 0(%sr2,%r20)
>> +    ssm    PSW_SM_I, %r0
>> +    lws_pagefault_enable    %r1,%r21
>> +    b    lws_exit
>> +    copy    %r0, %r21
>> +
>> +lws_wouldblock:
>> +    ssm    PSW_SM_I, %r0
>> +    lws_pagefault_enable    %r1,%r21
>> +    ldo    2(%r0), %r28
>> +    b    lws_exit
>> +    ldo    -EAGAIN(%r0), %r21
>> +
>> +lws_pagefault:
>> +    stw,ma    %r20, 0(%sr2,%r20)
>> +    ssm    PSW_SM_I, %r0
>> +    lws_pagefault_enable    %r1,%r21
>> +    ldo    3(%r0),%r28
>> +    b    lws_exit
>> +    ldo    -EAGAIN(%r0),%r21
>> +
>> +lws_fault:
>> +    ldo    1(%r0),%r28
>> +    b    lws_exit
>> +    ldo    -EFAULT(%r0),%r21
>> +
>>   lws_exit_nosys:
>> -    ldo    -ENOSYS(%r0),%r21           /* set errno */
>> +    ldo    -ENOSYS(%r0),%r21
>>       /* Fall through: Return to userspace */
>>
>>   lws_exit:
>> @@ -518,27 +561,19 @@ lws_exit:
>>           %r28 - Return prev through this register.
>>           %r21 - Kernel error code
>>
>> -        If debugging is DISabled:
>> -
>> -        %r21 has the following meanings:
>> -
>> +        %r21 returns the following error codes:
>>           EAGAIN - CAS is busy, ldcw failed, try again.
>>           EFAULT - Read or write failed.
>>
>> -        If debugging is enabled:
>> -
>> -        EDEADLOCK - CAS called recursively.
>> -        EAGAIN && r28 == 1 - CAS is busy. Lock contended.
>> -        EAGAIN && r28 == 2 - CAS is busy. ldcw failed.
>> -        EFAULT - Read or write failed.
>> +        If EAGAIN is returned, %r28 indicates the busy reason:
>> +        r28 == 1 - CAS is busy. lock contended.
>> +        r28 == 2 - CAS is busy. ldcw failed.
>> +        r28 == 3 - CAS is busy. page fault.
>>
>>           Scratch: r20, r28, r1
>>
>>       ****************************************************/
>>
>> -    /* Do not enable LWS debugging */
>> -#define ENABLE_LWS_DEBUG 0
>> -
>>       /* ELF64 Process entry path */
>>   lws_compare_and_swap64:
>>   #ifdef CONFIG_64BIT
>> @@ -551,59 +586,44 @@ lws_compare_and_swap64:
>>       b,n    lws_exit_nosys
>>   #endif
>>
>> -    /* ELF32 Process entry path */
>> +    /* ELF32/ELF64 Process entry path */
>>   lws_compare_and_swap32:
>>   #ifdef CONFIG_64BIT
>> -    /* Clip all the input registers */
>> +    /* Wide mode user process? */
>> +    bb,<,n  %sp, 31, lws_compare_and_swap
>> +
>> +    /* Clip all the input registers for 32-bit processes */
>>       depdi    0, 31, 32, %r26
>>       depdi    0, 31, 32, %r25
>>       depdi    0, 31, 32, %r24
>>   #endif
> although we don't have 64bit userspace yet, I think this needs backporting,
> otherwise in case we at some point get 64bit userspace it will break with old
> kernels.
>
>>   lws_compare_and_swap:
>> -    /* Load start of lock table */
>> -    ldil    L%lws_lock_start, %r20
>> -    ldo    R%lws_lock_start(%r20), %r28
>> +    /* Trigger memory reference interruptions without writing to memory */
>> +1:    ldw    0(%r26), %r28
>> +2:    stbys,e    %r0, 0(%r26)
>>
>> -    /* Extract eight bits from r26 and hash lock (Bits 3-11) */
>> -    extru_safe  %r26, 28, 8, %r20
>> +    /* Calculate 8-bit hash index from virtual address */
>> +    extru_safe    %r26, 27, 8, %r20
>>
>> -    /* Find lock to use, the hash is either one of 0 to
>> -       15, multiplied by 16 (keep it 16-byte aligned)
>> +    /* Load start of lock table */
>> +    ldil    L%lws_lock_start, %r28
>> +    ldo    R%lws_lock_start(%r28), %r28
> load32 ?
>
>> +
>> +    /* Find lock to use, the hash index is one of 0 to
>> +       255, multiplied by 16 (keep it 16-byte aligned)
>>          and add to the lock table offset. */
>>       shlw    %r20, 4, %r20
>>       add    %r20, %r28, %r20
>>
>> -# if ENABLE_LWS_DEBUG
>> -    /*
>> -        DEBUG, check for deadlock!
>> -        If the thread register values are the same
>> -        then we were the one that locked it last and
>> -        this is a recurisve call that will deadlock.
>> -        We *must* giveup this call and fail.
>> -    */
>> -    ldw    4(%sr2,%r20), %r28            /* Load thread register */
>> -    /* WARNING: If cr27 cycles to the same value we have problems */
>> -    mfctl    %cr27, %r21                /* Get current thread register */
>> -    cmpb,<>,n    %r21, %r28, cas_lock        /* Called recursive? */
>> -    b    lws_exit                /* Return error! */
>> -    ldo    -EDEADLOCK(%r0), %r21
>> -cas_lock:
>> -    cmpb,=,n    %r0, %r28, cas_nocontend    /* Is nobody using it? */
>> -    ldo    1(%r0), %r28                /* 1st case */
>> -    b    lws_exit                /* Contended... */
>> -    ldo    -EAGAIN(%r0), %r21            /* Spin in userspace */
>> -cas_nocontend:
>> -# endif
>> -/* ENABLE_LWS_DEBUG */
>> -
>> -    /* COW breaks can cause contention on UP systems */
>> -    LDCW    0(%sr2,%r20), %r28            /* Try to acquire the lock */
>> -    cmpb,<>,n    %r0, %r28, cas_action        /* Did we get it? */
>> -cas_wouldblock:
>> -    ldo    2(%r0), %r28                /* 2nd case */
>> -    b    lws_exit                /* Contended... */
>> -    ldo    -EAGAIN(%r0), %r21            /* Spin in userspace */
>> +    /* Disable page faults to prevent sleeping in critical region */
>> +    lws_pagefault_disable    %r21,%r28
>> +    rsm    PSW_SM_I, %r0                /* Disable interrupts */
>> +
>> +    /* Try to acquire the lock */
>> +    LDCW    0(%sr2,%r20), %r28
>> +    comclr,<>    %r0, %r28, %r0
>> +    b,n    lws_wouldblock
>>
>>       /*
>>           prev = *addr;
>> @@ -613,59 +633,35 @@ cas_wouldblock:
>>       */
>>
>>       /* NOTES:
>> -        This all works becuse intr_do_signal
>> +        This all works because intr_do_signal
>>           and schedule both check the return iasq
>>           and see that we are on the kernel page
>>           so this process is never scheduled off
>>           or is ever sent any signal of any sort,
>> -        thus it is wholly atomic from usrspaces
>> +        thus it is wholly atomic from usrspace's
>>           perspective
>>       */
>> -cas_action:
>> -#if defined CONFIG_SMP && ENABLE_LWS_DEBUG
>> -    /* DEBUG */
>> -    mfctl    %cr27, %r1
>> -    stw    %r1, 4(%sr2,%r20)
>> -#endif
>>       /* The load and store could fail */
>> -1:    ldw    0(%r26), %r28
>> +3:    ldw    0(%r26), %r28
>>       sub,<>    %r28, %r25, %r0
>> -2:    stw    %r24, 0(%r26)
>> -    /* Free lock */
>> -    stw,ma    %r20, 0(%sr2,%r20)
>> -#if ENABLE_LWS_DEBUG
>> -    /* Clear thread register indicator */
>> -    stw    %r0, 4(%sr2,%r20)
>> -#endif
>> -    /* Return to userspace, set no error */
>> -    b    lws_exit
>> -    copy    %r0, %r21
>> +4:    stw    %r24, 0(%r26)
>> +    b,n    lws_exit_noerror
>>
>> -3:
>> -    /* Error occurred on load or store */
>> -    /* Free lock */
>> -    stw,ma    %r20, 0(%sr2,%r20)
>> -#if ENABLE_LWS_DEBUG
>> -    stw    %r0, 4(%sr2,%r20)
>> -#endif
>> -    b    lws_exit
>> -    ldo    -EFAULT(%r0),%r21    /* set errno */
>> -    nop
>> -    nop
>> -    nop
>> -    nop
>> +    /* A fault occurred on load or stbys,e store */
>> +5:    b,n    lws_fault
>> +    ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 5b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 5b-linux_gateway_page)
>>
>> -    /* Two exception table entries, one for the load,
>> -       the other for the store. Either return -EFAULT.
>> -       Each of the entries must be relocated. */
>> -    ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 3b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 3b-linux_gateway_page)
>> +    /* A page fault occured in critical region */
>> +6:    b,n    lws_pagefault
>> +    ASM_EXCEPTIONTABLE_ENTRY(3b-linux_gateway_page, 6b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 6b-linux_gateway_page)
>>
>>
>>       /***************************************************
>>           New CAS implementation which uses pointers and variable size
>>           information. The value pointed by old and new MUST NOT change
>> -        while performing CAS. The lock only protect the value at %r26.
>> +        while performing CAS. The lock only protects the value at %r26.
>>
>>           %r26 - Address to examine
>>           %r25 - Pointer to the value to check (old)
>> @@ -674,25 +670,32 @@ cas_action:
>>           %r28 - Return non-zero on failure
>>           %r21 - Kernel error code
>>
>> -        %r21 has the following meanings:
>> -
>> +        %r21 returns the following error codes:
>>           EAGAIN - CAS is busy, ldcw failed, try again.
>> -        EFAULT - Read or write failed.
>> +        EFAULT - Read or write failed.
>> +
>> +        If EAGAIN is returned, %r28 indicates the busy reason:
>> +        r28 == 1 - CAS is busy. lock contended.
>> +        r28 == 2 - CAS is busy. ldcw failed.
>> +        r28 == 3 - CAS is busy. page fault.
>>
>>           Scratch: r20, r22, r28, r29, r1, fr4 (32bit for 64bit CAS only)
>>
>>       ****************************************************/
>>
>> -    /* ELF32 Process entry path */
>>   lws_compare_and_swap_2:
>>   #ifdef CONFIG_64BIT
>> -    /* Clip the input registers. We don't need to clip %r23 as we
>> -       only use it for word operations */
>> +    /* Wide mode user process? */
>> +    bb,<,n    %sp, 31, cas2_begin
>> +
>> +    /* Clip the input registers for 32-bit processes. We don't
>> +       need to clip %r23 as we only use it for word operations */
>>       depdi    0, 31, 32, %r26
>>       depdi    0, 31, 32, %r25
>>       depdi    0, 31, 32, %r24
>>   #endif
>>
>> +cas2_begin:
>>       /* Check the validity of the size pointer */
>>       subi,>>= 3, %r23, %r0
>>       b,n    lws_exit_nosys
>> @@ -703,69 +706,76 @@ lws_compare_and_swap_2:
>>       blr    %r29, %r0
>>       nop
>>
>> -    /* 8bit load */
>> -4:    ldb    0(%r25), %r25
>> +    /* 8-bit load */
>> +1:    ldb    0(%r25), %r25
>>       b    cas2_lock_start
>> -5:    ldb    0(%r24), %r24
>> +2:    ldb    0(%r24), %r24
>>       nop
>>       nop
>>       nop
>>       nop
>>       nop
>>
>> -    /* 16bit load */
>> -6:    ldh    0(%r25), %r25
>> +    /* 16-bit load */
>> +3:    ldh    0(%r25), %r25
>>       b    cas2_lock_start
>> -7:    ldh    0(%r24), %r24
>> +4:    ldh    0(%r24), %r24
>>       nop
>>       nop
>>       nop
>>       nop
>>       nop
>>
>> -    /* 32bit load */
>> -8:    ldw    0(%r25), %r25
>> +    /* 32-bit load */
>> +5:    ldw    0(%r25), %r25
>>       b    cas2_lock_start
>> -9:    ldw    0(%r24), %r24
>> +6:    ldw    0(%r24), %r24
>>       nop
>>       nop
>>       nop
>>       nop
>>       nop
>>
>> -    /* 64bit load */
>> +    /* 64-bit load */
>>   #ifdef CONFIG_64BIT
>> -10:    ldd    0(%r25), %r25
>> -11:    ldd    0(%r24), %r24
>> +7:    ldd    0(%r25), %r25
>> +8:    ldd    0(%r24), %r24
>>   #else
>>       /* Load old value into r22/r23 - high/low */
>> -10:    ldw    0(%r25), %r22
>> -11:    ldw    4(%r25), %r23
>> +7:    ldw    0(%r25), %r22
>> +8:    ldw    4(%r25), %r23
>>       /* Load new value into fr4 for atomic store later */
>> -12:    flddx    0(%r24), %fr4
>> +9:    flddx    0(%r24), %fr4
>>   #endif
>>
>>   cas2_lock_start:
>> -    /* Load start of lock table */
>> -    ldil    L%lws_lock_start, %r20
>> -    ldo    R%lws_lock_start(%r20), %r28
>> +    /* Trigger memory reference interruptions without writing to memory */
>> +    copy    %r26, %r28
>> +    depi_safe    0, 31, 2, %r21
>> +10:    ldw    0(%r28), %r1
>> +11:    stbys,e    %r0, 0(%r28)
>> +
>> +    /* Calculate 8-bit hash index from virtual address */
>> +    extru_safe    %r26, 27, 8, %r20
>>
>> -    /* Extract eight bits from r26 and hash lock (Bits 3-11) */
>> -    extru_safe  %r26, 28, 8, %r20
>> +    /* Load start of lock table */
>> +    ldil    L%lws_lock_start, %r28
>> +    ldo    R%lws_lock_start(%r28), %r28
> load32 ?
>
>> -    /* Find lock to use, the hash is either one of 0 to
>> -       15, multiplied by 16 (keep it 16-byte aligned)
>> +    /* Find lock to use, the hash index is one of 0 to
>> +       255, multiplied by 16 (keep it 16-byte aligned)
>>          and add to the lock table offset. */
>>       shlw    %r20, 4, %r20
>>       add    %r20, %r28, %r20
>>
>> -    /* COW breaks can cause contention on UP systems */
>> -    LDCW    0(%sr2,%r20), %r28        /* Try to acquire the lock */
>> -    cmpb,<>,n    %r0, %r28, cas2_action    /* Did we get it? */
>> -cas2_wouldblock:
>> -    ldo    2(%r0), %r28            /* 2nd case */
>> -    b    lws_exit            /* Contended... */
>> -    ldo    -EAGAIN(%r0), %r21        /* Spin in userspace */
>> +    /* Disable page faults to prevent sleeping in critical region */
>> +    lws_pagefault_disable    %r21,%r28
>> +    rsm    PSW_SM_I, %r0            /* Disable interrupts */
>> +
>> +    /* Try to acquire the lock */
>> +    LDCW    0(%sr2,%r20), %r28
>> +    comclr,<>    %r0, %r28, %r0
>> +    b,n    lws_wouldblock
>>
>>       /*
>>           prev = *addr;
>> @@ -775,112 +785,490 @@ cas2_wouldblock:
>>       */
>>
>>       /* NOTES:
>> -        This all works becuse intr_do_signal
>> +        This all works because intr_do_signal
>>           and schedule both check the return iasq
>>           and see that we are on the kernel page
>>           so this process is never scheduled off
>>           or is ever sent any signal of any sort,
>> -        thus it is wholly atomic from usrspaces
>> +        thus it is wholly atomic from usrspace's
>>           perspective
>>       */
>> -cas2_action:
>> +
>>       /* Jump to the correct function */
>>       blr    %r29, %r0
>>       /* Set %r28 as non-zero for now */
>>       ldo    1(%r0),%r28
>>
>> -    /* 8bit CAS */
>> -13:    ldb    0(%r26), %r29
>> +    /* 8-bit CAS */
>> +12:    ldb    0(%r26), %r29
>>       sub,=    %r29, %r25, %r0
>> -    b,n    cas2_end
>> -14:    stb    %r24, 0(%r26)
>> -    b    cas2_end
>> +    b,n    lws_exit_noerror
>> +13:    stb    %r24, 0(%r26)
>> +    b    lws_exit_noerror
>>       copy    %r0, %r28
>>       nop
>>       nop
>>
>> -    /* 16bit CAS */
>> -15:    ldh    0(%r26), %r29
>> +    /* 16-bit CAS */
>> +14:    ldh    0(%r26), %r29
>>       sub,=    %r29, %r25, %r0
>> -    b,n    cas2_end
>> -16:    sth    %r24, 0(%r26)
>> -    b    cas2_end
>> +    b,n    lws_exit_noerror
>> +15:    sth    %r24, 0(%r26)
>> +    b    lws_exit_noerror
>>       copy    %r0, %r28
>>       nop
>>       nop
>>
>> -    /* 32bit CAS */
>> -17:    ldw    0(%r26), %r29
>> +    /* 32-bit CAS */
>> +16:    ldw    0(%r26), %r29
>>       sub,=    %r29, %r25, %r0
>> -    b,n    cas2_end
>> -18:    stw    %r24, 0(%r26)
>> -    b    cas2_end
>> +    b,n    lws_exit_noerror
>> +17:    stw    %r24, 0(%r26)
>> +    b    lws_exit_noerror
>>       copy    %r0, %r28
>>       nop
>>       nop
>>
>> -    /* 64bit CAS */
>> +    /* 64-bit CAS */
>>   #ifdef CONFIG_64BIT
>> -19:    ldd    0(%r26), %r29
>> +18:    ldd    0(%r26), %r29
>>       sub,*=    %r29, %r25, %r0
>> -    b,n    cas2_end
>> -20:    std    %r24, 0(%r26)
>> +    b,n    lws_exit_noerror
>> +19:    std    %r24, 0(%r26)
>>       copy    %r0, %r28
>>   #else
>>       /* Compare first word */
>> -19:    ldw    0(%r26), %r29
>> +18:    ldw    0(%r26), %r29
>>       sub,=    %r29, %r22, %r0
>> -    b,n    cas2_end
>> +    b,n    lws_exit_noerror
>>       /* Compare second word */
>> -20:    ldw    4(%r26), %r29
>> +19:    ldw    4(%r26), %r29
>>       sub,=    %r29, %r23, %r0
>> -    b,n    cas2_end
>> +    b,n    lws_exit_noerror
>>       /* Perform the store */
>> -21:    fstdx    %fr4, 0(%r26)
>> +20:    fstdx    %fr4, 0(%r26)
>>       copy    %r0, %r28
>>   #endif
>> +    b    lws_exit_noerror
>> +    copy    %r0, %r28
>>
>> -cas2_end:
>> -    /* Free lock */
>> -    stw,ma    %r20, 0(%sr2,%r20)
>> -    /* Return to userspace, set no error */
>> -    b    lws_exit
>> -    copy    %r0, %r21
>> +    /* A fault occurred on load or stbys,e store */
>> +30:    b,n    lws_fault
>> +    ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(3b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(5b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(6b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(7b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(8b-linux_gateway_page, 30b-linux_gateway_page)
>> +#ifndef CONFIG_64BIT
>> +    ASM_EXCEPTIONTABLE_ENTRY(9b-linux_gateway_page, 30b-linux_gateway_page)
>> +#endif
>>
>> -22:
>> -    /* Error occurred on load or store */
>> -    /* Free lock */
>> -    stw,ma    %r20, 0(%sr2,%r20)
>> +    ASM_EXCEPTIONTABLE_ENTRY(10b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(11b-linux_gateway_page, 30b-linux_gateway_page)
>> +
>> +    /* A page fault occured in critical region */
>> +31:    b,n    lws_pagefault
>> +    ASM_EXCEPTIONTABLE_ENTRY(12b-linux_gateway_page, 31b-linux_gateway_page)    ASM_EXCEPTIONTABLE_ENTRY(13b-linux_gateway_page, 31b-linux_gateway_page)
> on two lines?
>
>> +    ASM_EXCEPTIONTABLE_ENTRY(14b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(15b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(16b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(17b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(18b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(19b-linux_gateway_page, 31b-linux_gateway_page)
>> +#ifndef CONFIG_64BIT
>> +    ASM_EXCEPTIONTABLE_ENTRY(20b-linux_gateway_page, 31b-linux_gateway_page)
>> +#endif
>> +
>> +
>> +    /***************************************************
>> +        LWS atomic exchange.
>> +
>> +        %r26 - Exchange address
>> +        %r25 - Size of the variable (0/1/2/3 for 8/16/32/64 bit)
>> +        %r24 - Address of new value
>> +        %r23 - Address of old value
>> +        %r28 - Return non-zero on failure
>> +        %r21 - Kernel error code
>> +
>> +        %r21 returns the following error codes:
>> +        EAGAIN - CAS is busy, ldcw failed, try again.
>> +        EFAULT - Read or write failed.
>> +
>> +        If EAGAIN is returned, %r28 indicates the busy reason:
>> +        r28 == 1 - CAS is busy. lock contended.
>> +        r28 == 2 - CAS is busy. ldcw failed.
>> +        r28 == 3 - CAS is busy. page fault.
>> +
>> +        Scratch: r20, r1
>> +
>> +    ****************************************************/
>> +
>> +lws_atomic_xchg:
>> +#ifdef CONFIG_64BIT
>> +    /* Wide mode user process? */
>> +    bb,<,n    %sp, 31, atomic_xchg_begin
>> +
>> +    /* Clip the input registers for 32-bit processes. We don't
>> +       need to clip %r23 as we only use it for word operations */
>> +    depdi    0, 31, 32, %r26
>> +    depdi    0, 31, 32, %r25
>> +    depdi    0, 31, 32, %r24
>> +    depdi    0, 31, 32, %r23
>> +#endif
>> +
>> +atomic_xchg_begin:
>> +    /* Check the validity of the size pointer */
>> +    subi,>>= 3, %r25, %r0
>> +    b,n    lws_exit_nosys
>> +
>> +    /* Jump to the functions which will load the old and new values into
>> +       registers depending on the their size */
>> +    shlw    %r25, 2, %r1
>> +    blr    %r1, %r0
>> +    nop
>> +
>> +    /* Perform exception checks */
>> +
>> +    /* 8-bit exchange */
>> +1:    ldb    0(%r24), %r20
>> +    copy    %r23, %r20
>> +    depi_safe    0, 31, 2, %r20
>> +    b    atomic_xchg_start
>> +2:    stbys,e    %r0, 0(%r20)
>> +    nop
>> +    nop
>> +    nop
>> +
>> +    /* 16-bit exchange */
>> +3:    ldh    0(%r24), %r20
>> +    copy    %r23, %r20
>> +    depi_safe    0, 31, 2, %r20
>> +    b    atomic_xchg_start
>> +4:    stbys,e    %r0, 0(%r20)
>> +    nop
>> +    nop
>> +    nop
>> +
>> +    /* 32-bit exchange */
>> +5:    ldw    0(%r24), %r20
>> +    b    atomic_xchg_start
>> +6:    stbys,e    %r0, 0(%r23)
>> +    nop
>> +    nop
>> +    nop
>> +    nop
>> +    nop
>> +
>> +    /* 64-bit exchange */
>> +#ifdef CONFIG_64BIT
>> +7:    ldd    0(%r24), %r20
>> +8:    stdby,e    %r0, 0(%r23)
>> +#else
>> +7:    ldw    0(%r24), %r20
>> +8:    ldw    4(%r24), %r20
>> +    copy    %r23, %r20
>> +    depi_safe    0, 31, 2, %r20
>> +9:    stbys,e    %r0, 0(%r20)
>> +10:    stbys,e    %r0, 4(%r20)
>> +#endif
>> +
>> +atomic_xchg_start:
>> +    /* Trigger memory reference interruptions without writing to memory */
>> +    copy    %r26, %r28
>> +    depi_safe    0, 31, 2, %r28
>> +11:    ldw    0(%r28), %r1
>> +12:    stbys,e    %r0, 0(%r28)
>> +
>> +    /* Calculate 8-bit hash index from virtual address */
>> +    extru_safe  %r26, 27, 8, %r20
>> +
>> +    /* Load start of lock table */
>> +    ldil    L%lws_lock_start, %r28
>> +    ldo    R%lws_lock_start(%r28), %r28
>> +
>> +    /* Find lock to use, the hash index is one of 0 to
>> +       255, multiplied by 16 (keep it 16-byte aligned)
>> +       and add to the lock table offset. */
>> +    shlw    %r20, 4, %r20
>> +    add    %r20, %r28, %r20
>> +
>> +    /* Disable page faults to prevent sleeping in critical region */
>> +    lws_pagefault_disable    %r21,%r28
>> +    rsm    PSW_SM_I, %r0            /* Disable interrupts */
>> +
>> +    /* Try to acquire the lock */
>> +    LDCW    0(%sr2,%r20), %r28
>> +    comclr,<>    %r0, %r28, %r0
>> +    b,n    lws_wouldblock
>> +
>> +    /* NOTES:
>> +        This all works because intr_do_signal
>> +        and schedule both check the return iasq
>> +        and see that we are on the kernel page
>> +        so this process is never scheduled off
>> +        or is ever sent any signal of any sort,
>> +        thus it is wholly atomic from userspace's
>> +        perspective
>> +    */
>> +
>> +    /* Jump to the correct function */
>> +    blr    %r1, %r0
>> +    /* Set %r28 as non-zero for now */
>>       ldo    1(%r0),%r28
>> -    b    lws_exit
>> -    ldo    -EFAULT(%r0),%r21    /* set errno */
>> -    nop
>> -    nop
>> -    nop
>> -
>> -    /* Exception table entries, for the load and store, return EFAULT.
>> -       Each of the entries must be relocated. */
>> -    ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(5b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(6b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(7b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(8b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(9b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(10b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(11b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(13b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(14b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(15b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(16b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(17b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(18b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(19b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(20b-linux_gateway_page, 22b-linux_gateway_page)
>> +
>> +    /* 8-bit exchange */
>> +14:    ldb    0(%r26), %r1
>> +15:    stb    %r1, 0(%r23)
>> +15:    ldb    0(%r24), %r1
>> +17:    stb    %r1, 0(%r26)
>> +    b    lws_exit_noerror
>> +    copy    %r0, %r28
>> +    nop
>> +    nop
>> +
>> +    /* 16-bit exchange */
>> +18:    ldh    0(%r26), %r1
>> +19:    sth    %r1, 0(%r23)
>> +20:    ldh    0(%r24), %r1
>> +21:    sth    %r1, 0(%r26)
>> +    b    lws_exit_noerror
>> +    copy    %r0, %r28
>> +    nop
>> +    nop
>> +
>> +    /* 32-bit exchange */
>> +22:    ldw    0(%r26), %r1
>> +23:    stw    %r1, 0(%r23)
>> +24:    ldw    0(%r24), %r1
>> +25:    stw    %r1, 0(%r26)
>> +    b    lws_exit_noerror
>> +    copy    %r0, %r28
>> +    nop
>> +    nop
>> +
>> +    /* 64-bit exchange */
>> +#ifdef CONFIG_64BIT
>> +26:    ldd    0(%r26), %r1
>> +27:    std    %r1, 0(%r23)
>> +28:    ldd    0(%r24), %r1
>> +29:    std    %r1, 0(%r26)
>> +#else
>> +26:    flddx    0(%r26), %fr4
>> +27:    fstdx    %fr4, 0(%r23)
>> +28:    flddx    0(%r24), %fr4
>> +29:    fstdx    %fr4, 0(%r26)
>> +#endif
>> +    b    lws_exit_noerror
>> +    copy    %r0, %r28
>> +
>> +    /* A fault occurred on load or stbys,e store */
>> +30:    b,n    lws_fault
>> +    ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(3b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(5b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(6b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(7b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(8b-linux_gateway_page, 30b-linux_gateway_page)
>> +#ifndef CONFIG_64BIT
>> +    ASM_EXCEPTIONTABLE_ENTRY(9b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(10b-linux_gateway_page, 30b-linux_gateway_page)
>> +#endif
>> +
>> +    ASM_EXCEPTIONTABLE_ENTRY(11b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(12b-linux_gateway_page, 30b-linux_gateway_page)
>> +
>> +    /* A page fault occured in critical region */
>> +31:    b,n    lws_pagefault
>> +    ASM_EXCEPTIONTABLE_ENTRY(14b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(15b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(16b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(17b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(18b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(19b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(20b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(21b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(22b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(23b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(24b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(25b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(26b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(27b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(28b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(29b-linux_gateway_page, 31b-linux_gateway_page)
>> +
>> +    /***************************************************
>> +        LWS atomic store.
>> +
>> +        %r26 - Address to store
>> +        %r25 - Size of the variable (0/1/2/3 for 8/16/32/64 bit)
>> +        %r24 - Address of value to store
>> +        %r28 - Return non-zero on failure
>> +        %r21 - Kernel error code
>> +
>> +        %r21 returns the following error codes:
>> +        EAGAIN - CAS is busy, ldcw failed, try again.
>> +        EFAULT - Read or write failed.
>> +
>> +        If EAGAIN is returned, %r28 indicates the busy reason:
>> +        r28 == 1 - CAS is busy. lock contended.
>> +        r28 == 2 - CAS is busy. ldcw failed.
>> +        r28 == 3 - CAS is busy. page fault.
>> +
>> +        Scratch: r20, r1
>> +
>> +    ****************************************************/
>> +
>> +lws_atomic_store:
>> +#ifdef CONFIG_64BIT
>> +    /* Wide mode user process? */
>> +    bb,<,n    %sp, 31, atomic_store_begin
>> +
>> +    /* Clip the input registers for 32-bit processes. We don't
>> +       need to clip %r23 as we only use it for word operations */
>> +    depdi    0, 31, 32, %r26
>> +    depdi    0, 31, 32, %r25
>> +    depdi    0, 31, 32, %r24
>> +#endif
>> +
>> +atomic_store_begin:
>> +    /* Check the validity of the size pointer */
>> +    subi,>>= 3, %r25, %r0
>> +    b,n    lws_exit_nosys
>> +
>> +    shlw    %r25, 1, %r1
>> +    blr    %r1, %r0
>> +    nop
>> +
>> +    /* Perform exception checks */
>> +
>> +    /* 8-bit store */
>> +1:    ldb    0(%r24), %r20
>> +    b,n    atomic_store_start
>> +    nop
>> +    nop
>> +
>> +    /* 16-bit store */
>> +2:    ldh    0(%r24), %r20
>> +    b,n    atomic_store_start
>> +    nop
>> +    nop
>> +
>> +    /* 32-bit store */
>> +3:    ldw    0(%r24), %r20
>> +    b,n    atomic_store_start
>> +    nop
>> +    nop
>> +
>> +    /* 64-bit store */
>> +#ifdef CONFIG_64BIT
>> +4:    ldd    0(%r24), %r20
>> +#else
>> +4:    ldw    0(%r24), %r20
>> +5:    ldw    4(%r24), %r20
>> +#endif
>> +
>> +atomic_store_start:
>> +    /* Trigger memory reference interruptions without writing to memory */
>> +    copy    %r26, %r28
>> +    depi_safe    0, 31, 2, %r28
>> +6:    ldw    0(%r28), %r1
>> +7:    stbys,e    %r0, 0(%r28)
>> +
>> +    /* Calculate 8-bit hash index from virtual address */
>> +    extru_safe  %r26, 27, 8, %r20
>> +
>> +    /* Load start of lock table */
>> +    ldil    L%lws_lock_start, %r28
>> +    ldo    R%lws_lock_start(%r28), %r28
>> +
>> +    /* Find lock to use, the hash index is one of 0 to
>> +       255, multiplied by 16 (keep it 16-byte aligned)
>> +       and add to the lock table offset. */
>> +    shlw    %r20, 4, %r20
>> +    add    %r20, %r28, %r20
>> +
>> +    /* Disable page faults to prevent sleeping in critical region */
>> +    lws_pagefault_disable    %r21,%r28
>> +    rsm    PSW_SM_I, %r0            /* Disable interrupts */
>> +
>> +    /* Try to acquire the lock */
>> +    LDCW    0(%sr2,%r20), %r28
>> +    comclr,<>    %r0, %r28, %r0
>> +    b,n    lws_wouldblock
>> +
>> +    /* NOTES:
>> +        This all works because intr_do_signal
>> +        and schedule both check the return iasq
>> +        and see that we are on the kernel page
>> +        so this process is never scheduled off
>> +        or is ever sent any signal of any sort,
>> +        thus it is wholly atomic from userspace's
>> +        perspective
>> +    */
>> +
>> +    /* Jump to the correct function */
>> +    blr    %r1, %r0
>> +    /* Set %r28 as non-zero for now */
>> +    ldo    1(%r0),%r28
>> +
>> +    /* 8-bit store */
>> +9:    ldb    0(%r24), %r1
>> +10:    stb    %r1, 0(%r26)
>> +    b    lws_exit_noerror
>> +    copy    %r0, %r28
>> +
>> +    /* 16-bit store */
>> +11:    ldh    0(%r24), %r1
>> +12:    sth    %r1, 0(%r26)
>> +    b    lws_exit_noerror
>> +    copy    %r0, %r28
>> +
>> +    /* 32-bit store */
>> +13:    ldw    0(%r24), %r1
>> +14:    stw    %r1, 0(%r26)
>> +    b    lws_exit_noerror
>> +    copy    %r0, %r28
>> +
>> +    /* 64-bit store */
>> +#ifdef CONFIG_64BIT
>> +15:    ldd    0(%r24), %r1
>> +16:    std    %r1, 0(%r26)
>> +#else
>> +15:    flddx    0(%r24), %fr4
>> +16:    fstdx    %fr4, 0(%r26)
>> +#endif
>> +    b    lws_exit_noerror
>> +    copy    %r0, %r28
>> +
>> +    /* A fault occurred on load or stbys,e store */
>> +30:    b,n    lws_fault
>> +    ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(3b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 30b-linux_gateway_page)
>>   #ifndef CONFIG_64BIT
>> -    ASM_EXCEPTIONTABLE_ENTRY(12b-linux_gateway_page, 22b-linux_gateway_page)
>> -    ASM_EXCEPTIONTABLE_ENTRY(21b-linux_gateway_page, 22b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(5b-linux_gateway_page, 30b-linux_gateway_page)
>>   #endif
>>
>> +    ASM_EXCEPTIONTABLE_ENTRY(6b-linux_gateway_page, 30b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(7b-linux_gateway_page, 30b-linux_gateway_page)
>> +
>> +    /* A page fault occured in critical region */
>> +31:    b,n    lws_pagefault
>> +    ASM_EXCEPTIONTABLE_ENTRY(9b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(10b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(11b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(12b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(13b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(14b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(15b-linux_gateway_page, 31b-linux_gateway_page)
>> +    ASM_EXCEPTIONTABLE_ENTRY(16b-linux_gateway_page, 31b-linux_gateway_page)
>> +
>>       /* Make sure nothing else is placed on this page */
>>       .align PAGE_SIZE
>>   END(linux_gateway_page)
>> @@ -899,7 +1287,9 @@ ENTRY(end_linux_gateway_page)
>>   ENTRY(lws_table)
>>       LWS_ENTRY(compare_and_swap32)        /* 0 - ELF32 Atomic 32bit CAS */
>>       LWS_ENTRY(compare_and_swap64)        /* 1 - ELF64 Atomic 32bit CAS */
>> -    LWS_ENTRY(compare_and_swap_2)        /* 2 - ELF32 Atomic 64bit CAS */
>> +    LWS_ENTRY(compare_and_swap_2)        /* 2 - Atomic 64bit CAS */
>> +    LWS_ENTRY(atomic_xchg)            /* 3 - Atomic Exchange */
>> +    LWS_ENTRY(atomic_store)            /* 4 - Atomic Store */
>>   END(lws_table)
>>       /* End of lws table */
>>
>> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
>> index b11fb26ce299..8ad184741d95 100644
>> --- a/arch/parisc/kernel/traps.c
>> +++ b/arch/parisc/kernel/traps.c
>> @@ -783,7 +783,7 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
>>            * unless pagefault_disable() was called before.
>>            */
>>
>> -        if (fault_space == 0 && !faulthandler_disabled())
>> +        if (faulthandler_disabled() || fault_space == 0)
>>           {
> this should be a patch on it's own.
>
> Helge


-- 
John David Anglin  dave.anglin@bell.net

