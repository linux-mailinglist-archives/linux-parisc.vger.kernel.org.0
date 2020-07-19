Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABB5225002
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Jul 2020 09:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgGSHDx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 19 Jul 2020 03:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgGSHDw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 19 Jul 2020 03:03:52 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A495CC0619D2
        for <linux-parisc@vger.kernel.org>; Sun, 19 Jul 2020 00:03:51 -0700 (PDT)
Received: (qmail 10866 invoked from network); 19 Jul 2020 07:01:19 -0000
Received: from p548c6bb1.dip0.t-ipconnect.de ([::ffff:84.140.107.177]:44206 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <dave.anglin@bell.net>; Sun, 19 Jul 2020 09:01:19 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: [PATCH] parisc: Fix spinlock barriers
Date:   Sun, 19 Jul 2020 09:03:41 +0200
Message-ID: <6677672.SoggAjMoo5@daneel.sf-tec.de>
In-Reply-To: <31b55b8c-2db7-c26e-f0a5-7e1ac1e520af@bell.net>
References: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net> <20200711005018.05540239@wim.jer> <31b55b8c-2db7-c26e-f0a5-7e1ac1e520af@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1849666.Tup5xg4kjk"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart1849666.Tup5xg4kjk
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 11. Juli 2020, 03:46:05 CEST schrieb John David Anglin:
> Hi Jeroen,
> 
> On 2020-07-10 6:50 p.m., Jeroen Roovers wrote:
> > On Thu, 9 Jul 2020 09:39:33 -0400
> > 
> > John David Anglin <dave.anglin@bell.net> wrote:
> >> On 2020-07-09 9:26 a.m., Rolf Eike Beer wrote:
> >>> Am Freitag, 3. Juli 2020, 22:32:35 CEST schrieb John David Anglin:
> >>>> Stalls are quite frequent with recent kernels.  When the stall is
> >>>> detected by rcu_sched, we get a backtrace similar to the
> >>> 
> >>>> following:
> >>> With this patch on top of 5.7.7 I still get:
> >> Suggest enabling CONFIG_LOCKUP_DETECTOR=y and
> >> CONFIG_SOFTLOCKUP_DETECTOR=y so we can see where the stall occurs.
> >> 
> >> Dave
> > 
> > Attached is kernel output while running the futex_requeue_pi test from
> > the kernel selftests. It failed this way on the second try while it
> > passed on the first try. The output it gave is with the kernel
> > configuration options as set out above.
> 
> Unfortunately, the soft lockup detector didn't trigger in the output you
> attached.  So, it's not clear where futex_requeue_p is stuck.  There are no
> spinlocks  in check_preempt_curr() that I can see.

Here is some info. Will use v2 patch soon.

[835212.602791] watchdog: BUG: soft lockup - CPU#0 stuck for 21s! [cc1:4062]
[835212.602791] Modules linked in: 8021q ipmi_poweroff ipmi_si ipmi_devintf 
sata_via ipmi_msghandler cbc dm_zero dm_snapshot dm_mirror dm_region_hash 
dm_log dm_crypt dm_bufio pata_sil680 libata
[835212.602791] CPU: 0 PID: 4062 Comm: cc1 Tainted: G             L    5.7.7-
gentoo-parisc64 #2
[835212.602791] Hardware name: 9000/785/C8000
[835212.602791]
[835212.602791]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[835212.602791] PSW: 00001000000001101111111100001111 Tainted: G             L
[835212.602791] r00-03  000000ff0806ff0f 0000000040a6a440 000000004035fcac 
000000000096cf9a
[835212.602791] r04-07  0000000040a36440 000000019ad27180 0000000230bc4488 
0000000040c61250
[835212.602791] r08-11  0000000040dd29b0 0000000000000001 0000000000000030 
0000000230bc48b0
[835212.602791] r12-15  0000000040dd3508 0000000000000000 0000000040a69c40 
000000002ee74a64
[835212.602791] r16-19  00000001a64ec240 0000000040d42810 0000000002ae2b20 
00000001a2feda71
[835212.602791] r20-23  00000002332bb090 0000000041fd1388 0000000001915c5f 
000000019ad271c0
[835212.602791] r24-27  0000000230bc48b0 0000000230bc4488 00000001a64ec240 
0000000040a36440
[835212.602791] r28-31  00000001a2feda71 0000000230bc49c0 0000000230bc49f0 
000000000800000f
[835212.602791] sr00-03  0000000003c7b800 0000000000000000 0000000000000000 
0000000003c7b800
[835212.602791] sr04-07  0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[835212.602791]
[835212.602791] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004035ff64 
000000004035ff68
[835212.602791]  IIR: 0d8010dc    ISR: fffffffffffff000  IOR: 0000000040c619c8
[835212.602791]  CPU:        0   CR30: 0000000230bc4000 CR31: ffffffffffffffff
[835212.602791]  ORIG_R28: 0000000040a69c40
[835212.602791]  IAOQ[0]: d_alloc_parallel+0x424/0x668
[835212.602791]  IAOQ[1]: d_alloc_parallel+0x428/0x668
[835212.602791]  RP(r2): d_alloc_parallel+0x16c/0x668
[835212.602791] Backtrace:
[835212.602791]  [<000000004034a5f0>] __lookup_slow+0xb0/0x280
[835212.602791]  [<000000004034c6a0>] walk_component+0x1d8/0x300
[835212.602791]  [<000000004034cd88>] path_lookupat+0xd0/0x228
[835212.602791]  [<000000004034fa64>] filename_lookup+0xac/0x1a8
[835212.602791]  [<000000004034fccc>] user_path_at_empty+0x74/0x90
[835212.602791]  [<000000004033c774>] vfs_statx+0xd4/0x1a0
[835212.602791]  [<000000004033cdb8>] __do_sys_stat64+0x48/0xa0
[835212.602791]  [<000000004033d5f0>] sys_stat64+0x20/0x30
[835212.602791]  [<0000000040191018>] syscall_exit+0x0/0x14
[835212.602791]
[835370.370791] rcu: INFO: rcu_sched self-detected stall on CPU
[835370.370791] rcu:    0-....: (4817472 ticks this GP) 
idle=0c2/1/0x4000000000000002 softirq=71611784/71611784 fqs=56671
[835370.370791]         (t=4965330 jiffies g=142820329 q=40783)
[835370.370791] rcu: rcu_sched kthread starved for 4842124 jiffies! g142820329 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=2
[835370.370791] rcu: RCU grace-period kthread stack dump:
[835370.370791] rcu_sched       R  running task        0    10      2 
0x00000000
[835370.370791] Backtrace:
[835370.370791]
[835370.370791] Task dump for CPU 0:
[835370.370791] cc1             R  running task        0  4062   4058 
0x00000014
[835370.370791] Backtrace:
[835370.370791]  [<0000000040189a1c>] show_stack+0x5c/0x70
[835370.370791]  [<0000000040201254>] sched_show_task.part.0+0x1a4/0x1c8
[835370.370791]  [<00000000402014ac>] dump_cpu_task+0x8c/0xa8
[835370.370791]  [<000000004024c858>] rcu_dump_cpu_stacks+0x168/0x210
[835370.370791]  [<000000004024ad2c>] rcu_sched_clock_irq+0x984/0xd70
[835370.370791]  [<0000000040251eb0>] update_process_times+0x80/0x110
[835370.370791]  [<00000000409abdbc>] timer_interrupt+0xb4/0x130
[835370.370791]  [<00000000402320c4>] __handle_irq_event_percpu+0xc4/0x270
[835370.370791]  [<00000000402322a8>] handle_irq_event_percpu+0x38/0xd8
[835370.370791]  [<000000004023a778>] handle_percpu_irq+0xb0/0xe8
[835370.370791]  [<0000000040231140>] generic_handle_irq+0x50/0x60
[835370.370791]  [<0000000040191304>] call_on_stack+0x18/0x24
[835370.370791]  [<000000004018b728>] execute_on_irq_stack+0x80/0x98
[835370.370791]  [<000000004018c928>] do_cpu_irq_mask+0x2a0/0x340
[835370.370791]  [<0000000040190074>] intr_return+0x0/0xc
[835370.370791]
[835370.370791] Task dump for CPU 1:
[835370.370791] cc1             R  running task        0  4059   4055 
0x00000014
[835370.370791] Backtrace:
[835370.370791]
[835370.370791] Task dump for CPU 3:
[835370.370791] cc1             R  running task        0  4061   4056 
0x00000014
[835370.370791] Backtrace:

--nextPart1849666.Tup5xg4kjk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXxPwTQAKCRBcpIk+abn8
Tlr1AKCnm5POSDY7foMI3n2yNFGVFm83rACaApSfRR+WD4DA0uOa45McLUrwlas=
=tfQa
-----END PGP SIGNATURE-----

--nextPart1849666.Tup5xg4kjk--



