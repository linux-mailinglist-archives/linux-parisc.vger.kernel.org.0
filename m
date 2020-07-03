Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48A8214067
	for <lists+linux-parisc@lfdr.de>; Fri,  3 Jul 2020 22:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgGCUch (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 3 Jul 2020 16:32:37 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:35367 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726147AbgGCUch (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 3 Jul 2020 16:32:37 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20200703203235.HCH6697.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Fri, 3 Jul 2020 16:32:35 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20200703203235.RKSA29322.torspm01.bell.net@[192.168.2.49]>;
          Fri, 3 Jul 2020 16:32:35 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix spinlock barriers
Message-ID: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
Date:   Fri, 3 Jul 2020 16:32:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=XvWExmN9 c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=2jShFcKWTlHltiYcPJ0A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfK6rqkHan0h2ZMFH5Yu07O0NqJZehSVOs/5FodmPuHS0KUNr3S4NqKcwh1wZStF4gVHAUT415/EF7yqakdHMOY5ZBp9ZKdo9RTTuDURHJ99QVXMGWz6c MEONhoqzc5+jrYIuTeO94zUJbfLu9Tn5LQeLHqy5Rz4tEZB9R6jwF8KuF11vpCrvl3YSWcoBofrxGg==
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

After much trial and error, I came to the conclusion that barriers in our spinlock code are broken on SMP
machines.  The ldcw,co is supposed to be strongly ordered.  However, it doesn't work properly as a barrier
both on acquisition and release of the spin lock.  Only the sync instreuction works properly.

We gain back a little bit of the extra barrier overhead by removing the barriers around TLB flushes.  I
believe these operations are strongly ordered.

I've tested the attached change with builds of the Debian libprelude and libpreludedb packages.  The latter
package triggered stalls nearly every time near the end of the build.  However, since the stalls are random,
it's hard to be certain that the change completely fixes the problem.

Signed-off-by: Dave Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 75cf84070fc9..996b1650c151 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -55,16 +55,14 @@ extern int pa_serialize_tlb_flushes;
 #endif

 #define purge_tlb_start(flags)  do { \
+	local_irq_save(flags);	\
 	if (pa_serialize_tlb_flushes)	\
-		spin_lock_irqsave(&pa_tlb_flush_lock, flags); \
-	else \
-		local_irq_save(flags);	\
+		arch_spin_lock_nb((arch_spinlock_t *)&pa_tlb_flush_lock); \
 	} while (0)
 #define purge_tlb_end(flags)	do { \
 	if (pa_serialize_tlb_flushes)	\
-		spin_unlock_irqrestore(&pa_tlb_flush_lock, flags); \
-	else \
-		local_irq_restore(flags); \
+		arch_spin_unlock_nb((arch_spinlock_t *)&pa_tlb_flush_lock); \
+	local_irq_restore(flags); \
 	} while (0)

 /* Purge data and instruction TLB entries. The TLB purge instructions
diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/spinlock.h
index 70fecb8dc4e2..890d899a8eae 100644
--- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -18,6 +18,17 @@ static inline void arch_spin_lock(arch_spinlock_t *x)
 {
 	volatile unsigned int *a;

+	a = __ldcw_align(x);
+	while (__ldcw(a) == 0)
+		while (*a == 0)
+			cpu_relax();
+	smp_mb();
+}
+
+static inline void arch_spin_lock_nb(arch_spinlock_t *x)
+{
+	volatile unsigned int *a;
+
 	a = __ldcw_align(x);
 	while (__ldcw(a) == 0)
 		while (*a == 0)
@@ -38,6 +49,7 @@ static inline void arch_spin_lock_flags(arch_spinlock_t *x,
 			cpu_relax();
 		local_irq_restore(flags_dis);
 	}
+	smp_mb();
 }
 #define arch_spin_lock_flags arch_spin_lock_flags

@@ -46,11 +58,15 @@ static inline void arch_spin_unlock(arch_spinlock_t *x)
 	volatile unsigned int *a;

 	a = __ldcw_align(x);
-#ifdef CONFIG_SMP
-	(void) __ldcw(a);
-#else
-	mb();
-#endif
+	smp_mb();
+	*a = 1;
+}
+
+static inline void arch_spin_unlock_nb(arch_spinlock_t *x)
+{
+	volatile unsigned int *a;
+
+	a = __ldcw_align(x);
 	*a = 1;
 }

@@ -61,6 +77,7 @@ static inline int arch_spin_trylock(arch_spinlock_t *x)

 	a = __ldcw_align(x);
         ret = __ldcw(a) != 0;
+	smp_mb();

 	return ret;
 }
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 4b484ec7c7da..cd7865b54393 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -454,7 +454,6 @@
 	nop
 	LDREG		0(\ptp),\pte
 	bb,<,n		\pte,_PAGE_PRESENT_BIT,3f
-	LDCW		0(\tmp),\tmp1
 	b		\fault
 	stw		\spc,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
@@ -468,8 +467,6 @@
 	.macro		tlb_unlock0	spc,tmp,tmp1
 #ifdef CONFIG_SMP
 98:	or,COND(=)	%r0,\spc,%r0
-	LDCW		0(\tmp),\tmp1
-	or,COND(=)	%r0,\spc,%r0
 	stw		\spc,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index f05c9d5b6b9e..b8b2a3364991 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -634,6 +634,10 @@ cas_action:
 	/* DEBUG */
 	mfctl	%cr27, %r1
 	stw	%r1, 4(%sr2,%r20)
+#endif
+#ifdef CONFIG_SMP
+98:	sync			/* Barrier */
+99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	/* The load and store could fail */
 1:	ldw	0(%r26), %r28
@@ -641,7 +645,7 @@ cas_action:
 2:	stw	%r24, 0(%r26)
 	/* Free lock */
 #ifdef CONFIG_SMP
-98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+98:	sync			/* Barrier */
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	stw	%r20, 0(%sr2,%r20)
@@ -659,7 +663,7 @@ cas_action:
 	/* Error occurred on load or store */
 	/* Free lock */
 #ifdef CONFIG_SMP
-98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+98:	sync			/* Barrier */
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	stw	%r20, 0(%sr2,%r20)
@@ -805,6 +809,10 @@ cas2_wouldblock:
 		perspective
 	*/
 cas2_action:
+#ifdef CONFIG_SMP
+98:	sync			/* Barrier */
+99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
+#endif
 	/* Jump to the correct function */
 	blr	%r29, %r0
 	/* Set %r28 as non-zero for now */
@@ -864,7 +872,7 @@ cas2_action:
 cas2_end:
 	/* Free lock */
 #ifdef CONFIG_SMP
-98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+98:	sync			/* Barrier */
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	stw	%r20, 0(%sr2,%r20)
@@ -878,7 +886,7 @@ cas2_end:
 	/* Error occurred on load or store */
 	/* Free lock */
 #ifdef CONFIG_SMP
-98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+98:	sync			/* Barrier */
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	stw	%r20, 0(%sr2,%r20)
