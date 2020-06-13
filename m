Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A381F83F8
	for <lists+linux-parisc@lfdr.de>; Sat, 13 Jun 2020 17:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgFMPjo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 Jun 2020 11:39:44 -0400
Received: from belmont94srvr.owm.bell.net ([184.150.200.94]:40397 "EHLO
        mtlfep06.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgFMPjn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 Jun 2020 11:39:43 -0400
X-Greylist: delayed 1146 seconds by postgrey-1.27 at vger.kernel.org; Sat, 13 Jun 2020 11:39:42 EDT
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20200613152035.UEKC3628.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 13 Jun 2020 11:20:35 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm02.bell.net
          with ESMTP
          id <20200613152035.VEAG16482.mtlspm02.bell.net@[192.168.2.49]>;
          Sat, 13 Jun 2020 11:20:35 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Rolf Eike Beer <eike@sf-mail.de>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Prevent optimization of loads and stores in atomic
 operations
Message-ID: <55841e49-cf36-e49a-5b33-7b60d3275e56@bell.net>
Date:   Sat, 13 Jun 2020 11:20:34 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=I5Mbu+og c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=nTHF0DUjJn0A:10 a=FBHGMhGWAAAA:8 a=2k55gv_HN59-FuLIEaUA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfMuqNc7dozwJlgYBjjUZ/9PlKj5gswmmRCq7pdCWG5kWcXiNRwk8WMhtd633D+CH2FIqh3Q/QVcPVq6Ax3ekFH++oJl96R1rRs26h73+xX7z8McoN8Pj cCMo+846zZPo7DzmsP72qT96/F6SAcPZTohXh4kkZlFPVoiQtKKfVV1MR0l6+JxJXMniapAhKdn2pw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Stalls are quite frequent with recent kernels.  When the stall is detected by rcu_sched, we
get a backtrace similar to the following:

rcu: INFO: rcu_sched self-detected stall on CPU
rcu:    0-...!: (5998 ticks this GP) idle=3a6/1/0x4000000000000002 softirq=8356938/8356939 fqs=2
        (t=6000 jiffies g=8985785 q=391)
rcu: rcu_sched kthread starved for 5992 jiffies! g8985785 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
rcu: RCU grace-period kthread stack dump:
rcu_sched       R  running task        0    10      2 0x00000000
Backtrace:

Task dump for CPU 0:
collect2        R  running task        0 16562  16561 0x00000014
Backtrace:
 [<000000004017913c>] show_stack+0x44/0x60
 [<00000000401df694>] sched_show_task.part.77+0xf4/0x180
 [<00000000401e70e8>] dump_cpu_task+0x68/0x80
 [<0000000040230a58>] rcu_sched_clock_irq+0x708/0xae0
 [<0000000040237670>] update_process_times+0x58/0xb8
 [<00000000407dc39c>] timer_interrupt+0xa4/0x110
 [<000000004021af30>] __handle_irq_event_percpu+0xb8/0x228
 [<000000004021b0d4>] handle_irq_event_percpu+0x34/0x98
 [<00000000402225b8>] handle_percpu_irq+0xa8/0xe8
 [<000000004021a05c>] generic_handle_irq+0x54/0x70
 [<0000000040180340>] call_on_stack+0x18/0x24
 [<000000004017a63c>] execute_on_irq_stack+0x5c/0xa8
 [<000000004017b76c>] do_cpu_irq_mask+0x2dc/0x410
 [<000000004017f074>] intr_return+0x0/0xc

However, this doesn't provide any information as to the cause.  I enabled CONFIG_SOFTLOCKUP_DETECTOR
and I caught the following stall:

watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [cc1:22803]
Modules linked in: dm_mod dax binfmt_misc ext4 crc16 jbd2 ext2 mbcache sg ipmi_watchdog ipmi_si ipmi_poweroff ipmi_devintf ipmi_msghandler nfsd
ip_tables x_tables ipv6 autofs4 xfs libcrc32c crc32c_generic raid10 raid1 raid0 multipath linear md_mod ses enclosure sd_mod scsi_transport_sas
t10_pi sr_mod cdrom ata_generic uas usb_storage pata_cmd64x libata ohci_pci ehci_pci ohci_hcd sym53c8xx ehci_hcd scsi_transport_spi tg3 usbcore
scsi_mod usb_common
CPU: 0 PID: 22803 Comm: cc1 Not tainted 5.6.17+ #3
Hardware name: 9000/800/rp3440

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  000000ff0804ff0f 0000000040891dc0 000000004037d1c4 000000006d5e8890
r04-07  000000004086fdc0 0000000040ab31ac 000000000004e99a 0000000000001f20
r08-11  0000000040b24710 000000006d5e8488 0000000040a1d280 000000006d5e89b0
r12-15  000000006d5e88c4 00000001802c2cb8 000000003c812825 0000004122eb4d18
r16-19  0000000040b26630 000000006d5e8898 000000000001d330 000000006d5e88c0
r20-23  000000000800000f 0000000a0ad24270 b6683633143fce3c 0000004122eb4d54
r24-27  000000006d5e88c4 000000006d5e8488 00000001802c2cb8 000000004086fdc0
r28-31  0000004122d57b69 000000006d5e89b0 000000006d5e89e0 000000006d5e8000
sr00-03  000000000c749000 0000000000000000 0000000000000000 000000000c749000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004037d414 000000004037d418
 IIR: 0e0010dc    ISR: 00000041042d63f0  IOR: 000000004086fdc0
 CPU:        0   CR30: 000000006d5e8000 CR31: ffffffffffffefff
 ORIG_R28: 000000004086fdc0
 IAOQ[0]: d_alloc_parallel+0x384/0x688
 IAOQ[1]: d_alloc_parallel+0x388/0x688
 RP(r2): d_alloc_parallel+0x134/0x688
Backtrace:
 [<000000004036974c>] __lookup_slow+0xa4/0x200
 [<0000000040369fc8>] walk_component+0x288/0x458
 [<000000004036a9a0>] path_lookupat+0x88/0x198
 [<000000004036e748>] filename_lookup+0xa0/0x168
 [<000000004036e95c>] user_path_at_empty+0x64/0x80
 [<000000004035d93c>] vfs_statx+0x104/0x158
 [<000000004035dfcc>] __do_sys_lstat64+0x44/0x80
 [<000000004035e5a0>] sys_lstat64+0x20/0x38
 [<0000000040180054>] syscall_exit+0x0/0x14

The code was stuck in this loop in d_alloc_parallel:

    4037d414:   0e 00 10 dc     ldd 0(r16),ret0
    4037d418:   c7 fc 5f ed     bb,< ret0,1f,4037d414 <d_alloc_parallel+0x384>
    4037d41c:   08 00 02 40     nop

This is the inner loop of bit_spin_lock which is called by hlist_bl_unlock in d_alloc_parallel:

static inline void bit_spin_lock(int bitnum, unsigned long *addr)
{
        /*
         * Assuming the lock is uncontended, this never enters
         * the body of the outer loop. If it is contended, then
         * within the inner loop a non-atomic test is used to
         * busywait with less bus contention for a good time to
         * attempt to acquire the lock bit.
         */
        preempt_disable();
#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
        while (unlikely(test_and_set_bit_lock(bitnum, addr))) {
                preempt_enable();
                do {
                        cpu_relax();
                } while (test_bit(bitnum, addr));
                preempt_disable();
        }
#endif
        __acquire(bitlock);
}

test_and_set_bit_lock() looks like this:

static inline int test_and_set_bit_lock(unsigned int nr,
                                        volatile unsigned long *p)
{
        long old;
        unsigned long mask = BIT_MASK(nr);

        p += BIT_WORD(nr);
        if (READ_ONCE(*p) & mask)
                return 1;

        old = atomic_long_fetch_or_acquire(mask, (atomic_long_t *)p);
        return !!(old & mask);
}

Note the volatile keyword is dropped in casting p to atomic_long_t *.

Our current implementation of atomic_fetch_##op is:

static __inline__ int atomic_fetch_##op(int i, atomic_t *v)             \
{                                                                       \
        unsigned long flags;                                            \
        int ret;                                                        \
                                                                        \
        _atomic_spin_lock_irqsave(v, flags);                            \
        ret = v->counter;                                               \
        v->counter c_op i;                                              \
        _atomic_spin_unlock_irqrestore(v, flags);                       \
                                                                        \
        return ret;                                                     \
}

Note the pointer v is not volatile.  Although _atomic_spin_lock_irqsave clobbers memory,
I realized that gcc had optimized the code in the spinlock.  Essentially, this occurs in
the following situation:

t1 = *p;
if (t1)
  do_something1;
_atomic_spin_lock_irqsave();
t2 = *p
if (t2)
  do_something2;

The fix is to use a volatile pointer for the accesses in spinlocks.  This prevents gcc from
optimizing the accesses.

I have now run 5.6.1[78] kernels for about 4 days without a stall or any other obvious kernel issue.

Signed-off-by: Dave Anglin <dave.anglin@bell.net>

diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index 118953d41763..0090c9606313 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -59,11 +59,11 @@ extern arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned;
 static __inline__ void atomic_set(atomic_t *v, int i)
 {
 	unsigned long flags;
-	_atomic_spin_lock_irqsave(v, flags);
+	volatile int *p = &v->counter;

-	v->counter = i;
-
-	_atomic_spin_unlock_irqrestore(v, flags);
+	_atomic_spin_lock_irqsave(p, flags);
+	*p = i;
+	_atomic_spin_unlock_irqrestore(p, flags);
 }

 #define atomic_set_release(v, i)	atomic_set((v), (i))
@@ -81,21 +81,23 @@ static __inline__ int atomic_read(const atomic_t *v)
 static __inline__ void atomic_##op(int i, atomic_t *v)			\
 {									\
 	unsigned long flags;						\
+	volatile int *p = &v->counter;					\
 									\
-	_atomic_spin_lock_irqsave(v, flags);				\
-	v->counter c_op i;						\
-	_atomic_spin_unlock_irqrestore(v, flags);			\
+	_atomic_spin_lock_irqsave(p, flags);				\
+	*p c_op i;							\
+	_atomic_spin_unlock_irqrestore(p, flags);			\
 }									\

 #define ATOMIC_OP_RETURN(op, c_op)					\
 static __inline__ int atomic_##op##_return(int i, atomic_t *v)		\
 {									\
 	unsigned long flags;						\
+	volatile int *p = &v->counter;					\
 	int ret;							\
 									\
-	_atomic_spin_lock_irqsave(v, flags);				\
-	ret = (v->counter c_op i);					\
-	_atomic_spin_unlock_irqrestore(v, flags);			\
+	_atomic_spin_lock_irqsave(p, flags);				\
+	ret = (*p c_op i);						\
+	_atomic_spin_unlock_irqrestore(p, flags);			\
 									\
 	return ret;							\
 }
@@ -104,12 +106,14 @@ static __inline__ int atomic_##op##_return(int i, atomic_t *v)		\
 static __inline__ int atomic_fetch_##op(int i, atomic_t *v)		\
 {									\
 	unsigned long flags;						\
-	int ret;							\
+	volatile int *p = &v->counter;					\
+	int ret, tmp;							\
 									\
-	_atomic_spin_lock_irqsave(v, flags);				\
-	ret = v->counter;						\
-	v->counter c_op i;						\
-	_atomic_spin_unlock_irqrestore(v, flags);			\
+	_atomic_spin_lock_irqsave(p, flags);				\
+	ret = *p;							\
+	tmp = ret;							\
+	*p = (tmp c_op i);						\
+	_atomic_spin_unlock_irqrestore(p, flags);			\
 									\
 	return ret;							\
 }
@@ -146,21 +150,23 @@ ATOMIC_OPS(xor, ^=)
 static __inline__ void atomic64_##op(s64 i, atomic64_t *v)		\
 {									\
 	unsigned long flags;						\
+	volatile s64 *p = &v->counter;					\
 									\
-	_atomic_spin_lock_irqsave(v, flags);				\
-	v->counter c_op i;						\
-	_atomic_spin_unlock_irqrestore(v, flags);			\
+	_atomic_spin_lock_irqsave(p, flags);				\
+	*p c_op i;							\
+	_atomic_spin_unlock_irqrestore(p, flags);			\
 }									\

 #define ATOMIC64_OP_RETURN(op, c_op)					\
 static __inline__ s64 atomic64_##op##_return(s64 i, atomic64_t *v)	\
 {									\
 	unsigned long flags;						\
+	volatile s64 *p = &v->counter;					\
 	s64 ret;							\
 									\
-	_atomic_spin_lock_irqsave(v, flags);				\
-	ret = (v->counter c_op i);					\
-	_atomic_spin_unlock_irqrestore(v, flags);			\
+	_atomic_spin_lock_irqsave(p, flags);				\
+	ret = (*p c_op i);						\
+	_atomic_spin_unlock_irqrestore(p, flags);			\
 									\
 	return ret;							\
 }
@@ -169,12 +175,14 @@ static __inline__ s64 atomic64_##op##_return(s64 i, atomic64_t *v)	\
 static __inline__ s64 atomic64_fetch_##op(s64 i, atomic64_t *v)		\
 {									\
 	unsigned long flags;						\
-	s64 ret;							\
+	volatile s64 *p = &v->counter;					\
+	s64 ret, tmp;							\
 									\
-	_atomic_spin_lock_irqsave(v, flags);				\
-	ret = v->counter;						\
-	v->counter c_op i;						\
-	_atomic_spin_unlock_irqrestore(v, flags);			\
+	_atomic_spin_lock_irqsave(p, flags);				\
+	ret = *p;							\
+	tmp = ret;							\
+	*p = (tmp c_op i);						\
+	_atomic_spin_unlock_irqrestore(p, flags);			\
 									\
 	return ret;							\
 }
@@ -205,11 +213,11 @@ static __inline__ void
 atomic64_set(atomic64_t *v, s64 i)
 {
 	unsigned long flags;
-	_atomic_spin_lock_irqsave(v, flags);
-
-	v->counter = i;
+	volatile s64 *p = &v->counter;

-	_atomic_spin_unlock_irqrestore(v, flags);
+	_atomic_spin_lock_irqsave(p, flags);
+	*p = i;
+	_atomic_spin_unlock_irqrestore(p, flags);
 }

 static __inline__ s64
diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index d2c3e4106851..a9e5366b5511 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -36,14 +36,15 @@ static inline int
 arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 {
 	unsigned long int flags;
+	volatile u32 __user *u = uaddr;
 	int oldval, ret;
 	u32 tmp;

-	_futex_spin_lock_irqsave(uaddr, &flags);
+	_futex_spin_lock_irqsave(u, &flags);
 	pagefault_disable();

 	ret = -EFAULT;
-	if (unlikely(get_user(oldval, uaddr) != 0))
+	if (unlikely(get_user(oldval, u) != 0))
 		goto out_pagefault_enable;

 	ret = 0;
@@ -69,12 +70,12 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 		ret = -ENOSYS;
 	}

-	if (ret == 0 && unlikely(put_user(tmp, uaddr) != 0))
+	if (ret == 0 && unlikely(put_user(tmp, u) != 0))
 		ret = -EFAULT;

 out_pagefault_enable:
 	pagefault_enable();
-	_futex_spin_unlock_irqrestore(uaddr, &flags);
+	_futex_spin_unlock_irqrestore(u, &flags);

 	if (!ret)
 		*oval = oldval;
@@ -88,14 +89,15 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 {
 	u32 val;
 	unsigned long flags;
+	volatile u32 __user *u = uaddr;

 	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
 	 * our gateway page, and causes no end of trouble...
 	 */
-	if (uaccess_kernel() && !uaddr)
+	if (uaccess_kernel() && !u)
 		return -EFAULT;

-	if (!access_ok(uaddr, sizeof(u32)))
+	if (!access_ok(u, sizeof(u32)))
 		return -EFAULT;

 	/* HPPA has no cmpxchg in hardware and therefore the
@@ -104,19 +106,19 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	 * address. This should scale to a couple of CPUs.
 	 */

-	_futex_spin_lock_irqsave(uaddr, &flags);
-	if (unlikely(get_user(val, uaddr) != 0)) {
-		_futex_spin_unlock_irqrestore(uaddr, &flags);
+	_futex_spin_lock_irqsave(u, &flags);
+	if (unlikely(get_user(val, u) != 0)) {
+		_futex_spin_unlock_irqrestore(u, &flags);
 		return -EFAULT;
 	}

-	if (val == oldval && unlikely(put_user(newval, uaddr) != 0)) {
-		_futex_spin_unlock_irqrestore(uaddr, &flags);
+	if (val == oldval && unlikely(put_user(newval, u) != 0)) {
+		_futex_spin_unlock_irqrestore(u, &flags);
 		return -EFAULT;
 	}

 	*uval = val;
-	_futex_spin_unlock_irqrestore(uaddr, &flags);
+	_futex_spin_unlock_irqrestore(u, &flags);

 	return 0;
 }
diff --git a/arch/parisc/lib/bitops.c b/arch/parisc/lib/bitops.c
index 70ffbcf889b8..5904966ca957 100644
--- a/arch/parisc/lib/bitops.c
+++ b/arch/parisc/lib/bitops.c
@@ -21,11 +21,12 @@ arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
 unsigned long __xchg64(unsigned long x, unsigned long *ptr)
 {
 	unsigned long temp, flags;
+	volatile unsigned long *p = ptr;

-	_atomic_spin_lock_irqsave(ptr, flags);
-	temp = *ptr;
-	*ptr = x;
-	_atomic_spin_unlock_irqrestore(ptr, flags);
+	_atomic_spin_lock_irqsave(p, flags);
+	temp = *p;
+	*p = x;
+	_atomic_spin_unlock_irqrestore(p, flags);
 	return temp;
 }
 #endif
@@ -33,12 +34,13 @@ unsigned long __xchg64(unsigned long x, unsigned long *ptr)
 unsigned long __xchg32(int x, int *ptr)
 {
 	unsigned long flags;
+	volatile int *p = ptr;
 	long temp;

-	_atomic_spin_lock_irqsave(ptr, flags);
-	temp = (long) *ptr;	/* XXX - sign extension wanted? */
-	*ptr = x;
-	_atomic_spin_unlock_irqrestore(ptr, flags);
+	_atomic_spin_lock_irqsave(p, flags);
+	temp = (long) *p;	/* XXX - sign extension wanted? */
+	*p = x;
+	_atomic_spin_unlock_irqrestore(p, flags);
 	return (unsigned long)temp;
 }

@@ -46,12 +48,13 @@ unsigned long __xchg32(int x, int *ptr)
 unsigned long __xchg8(char x, char *ptr)
 {
 	unsigned long flags;
+	volatile char *p = ptr;
 	long temp;

-	_atomic_spin_lock_irqsave(ptr, flags);
-	temp = (long) *ptr;	/* XXX - sign extension wanted? */
-	*ptr = x;
-	_atomic_spin_unlock_irqrestore(ptr, flags);
+	_atomic_spin_lock_irqsave(p, flags);
+	temp = (long) *p;	/* XXX - sign extension wanted? */
+	*p = x;
+	_atomic_spin_unlock_irqrestore(p, flags);
 	return (unsigned long)temp;
 }

