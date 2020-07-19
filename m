Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723C1225389
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Jul 2020 20:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgGSSi3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 19 Jul 2020 14:38:29 -0400
Received: from simcoe209srvr.owm.bell.net ([184.150.200.209]:37734 "EHLO
        torfep04.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726051AbgGSSi3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 19 Jul 2020 14:38:29 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20200719175745.FGRE6697.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 19 Jul 2020 13:57:45 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20200719175745.BKEB29322.torspm01.bell.net@[192.168.2.49]>;
          Sun, 19 Jul 2020 13:57:45 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH v4] parisc: Fix spinlock barriers
Message-ID: <49779305-1b42-2d4c-a4cd-089b1833ef6a@bell.net>
Date:   Sun, 19 Jul 2020 13:57:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=XvWExmN9 c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=LGe_NOG-8BfmAAyQMF0A:9 a=ri8wvyg4RJlcqv8w:21 a=pPi4aC6ca_zDhSnK:21 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfCz0ZDVJY9qbwezCiG14qnordWIEjPNHo9RZlyXq+uQ6DG810w9UU3sXP6BnzzbcW8u2AQ/11F5KgBjc8/Ywn/ZM5b33pIjWat6MuGdLn/BD0QFJESEj aEtCCHx8ULosFCF6RsB6WSxk+IYDN0cJjJ7Tz/cmb35gDeNPNdL7MF4UP4Qx46OuQCJRbz7JkUhF/A==
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

After some more considerations, I realized that the previous patches were just affecting the timing
of the spin lock routines and not fixing the real problem.  The actual problem is not with the spin lock
barriers but with unlock code.

We enter the inner loop of bit_spin_lock() when the bit lock is held.  We stall when the lock is never
released.  This lead me to look at the locking in arch/parisc/include/asm/atomic.h.  It turns out we are
missing a define for atomic64_set_release().  The equivalent is present for 32-bit releases.

The release for 64-bit bit operations needs to use atomic64_set() to prevent the loss of release
operations when there is contention.

In reviewing the atomic operations in entry.S, I noticed that we use the space id (SID) value to reset
the spin lock used used for TLB operations.  On 64-bit machines, this could be problematic as we only
use the least significant 32 bits of the SID value.  However, SID values are limited to NR_SPACE_IDS
(262144), so this isn't a problem.  I added a comment regarding this to the code.

I removed the LDCW barriers from this code as I don't believe they are necessary.  When the page
is not present, nothing has been done other than to test the page present bit.  The release is done
after the TLB entry is updated.  I believe it is strongly ordered and forces prior writes to complete.

This fixes the stall in building libpreludedb.

Signed-off-by: Dave Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index 118953d41763..6dd4171c9530 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -212,6 +212,8 @@ atomic64_set(atomic64_t *v, s64 i)
 	_atomic_spin_unlock_irqrestore(v, flags);
 }

+#define atomic64_set_release(v, i)	atomic64_set((v), (i))
+
 static __inline__ s64
 atomic64_read(const atomic64_t *v)
 {
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 4b484ec7c7da..2094b02cb761 100644
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
@@ -464,12 +463,13 @@
 3:
 	.endm

-	/* Release pa_tlb_lock lock without reloading lock address. */
+	/* Release pa_tlb_lock lock without reloading lock address.
+	   Note that the values in the register spc are limited to
+	   NR_SPACE_IDS (262144). Thus, the stw instruction always
+	   stores a nonzero value even when register spc is 64 bits. */
 	.macro		tlb_unlock0	spc,tmp,tmp1
 #ifdef CONFIG_SMP
 98:	or,COND(=)	%r0,\spc,%r0
-	LDCW		0(\tmp),\tmp1
-	or,COND(=)	%r0,\spc,%r0
 	stw		\spc,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
