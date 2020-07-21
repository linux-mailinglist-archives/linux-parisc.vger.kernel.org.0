Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFA9227F0A
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Jul 2020 13:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729046AbgGULhA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Jul 2020 07:37:00 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:54852 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727106AbgGULg7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Jul 2020 07:36:59 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20200721113658.CBIT3628.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 21 Jul 2020 07:36:58 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm02.bell.net
          with ESMTP
          id <20200721113658.VCMA16482.mtlspm02.bell.net@[192.168.2.49]>;
          Tue, 21 Jul 2020 07:36:58 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH v5] parisc: Fix spinlock barriers
Message-ID: <b38abd19-0a61-8968-b98d-9b8b2efb6747@bell.net>
Date:   Tue, 21 Jul 2020 07:36:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=I5Mbu+og c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=P5jTsRfogGOwyuHnAcQA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfM2XAXB5r1gMKcwKPORlGC5ENdhbMR/EGQ+YbiF0RxxqTS655KZiXV3HrJCnwF0AejGK5E9p8czojqtXwtfNH4O2ETwIAeY+Cd2kle/ttFow1+Xna51E TnxOGmXqRix5RnUA7R96NjOGJ9rwrvBbTojS1CGRv6jaq0LSdZ5ubaX7mrKG165S+mtWhOnCaYNSwA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Stalls are quite frequent with recent kernels.  I enabled CONFIG_SOFTLOCKUP_DETECTOR and I caught the following stall:

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

After consideration, I realized that we must be losing bit unlocks.  Then, I noticed that we missed
defining atomic64_set_release().  Adding this define fixes the stalls in bit operations.

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

