Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1E96257E96
	for <lists+linux-parisc@lfdr.de>; Mon, 31 Aug 2020 18:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgHaQWV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 31 Aug 2020 12:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgHaQWU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 31 Aug 2020 12:22:20 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AD6C061573
        for <linux-parisc@vger.kernel.org>; Mon, 31 Aug 2020 09:21:46 -0700 (PDT)
Received: (qmail 7297 invoked from network); 31 Aug 2020 16:21:00 -0000
Received: from p548d4372.dip0.t-ipconnect.de ([::ffff:84.141.67.114]:57308 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Mon, 31 Aug 2020 18:21:00 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v5] parisc: Fix spinlock barriers
Date:   Mon, 31 Aug 2020 18:21:29 +0200
Message-ID: <11590248.O9o76ZdvQC@daneel.sf-tec.de>
In-Reply-To: <b38abd19-0a61-8968-b98d-9b8b2efb6747@bell.net>
References: <b38abd19-0a61-8968-b98d-9b8b2efb6747@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5387554.DvuYhMxLoT"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart5387554.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

These things are in 5.8.4 AFAICT, and the lockups are still there:

[320616.602705] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [hppa2.0-unknown:29093]
[320616.602705] Modules linked in: 8021q ipmi_poweroff ipmi_si ipmi_devintf sata_via ipmi_msghandler cbc dm_zero dm_snapshot dm_mirror dm_region_hash dm_log dm_crypt dm_bufio pata_sil680 libata
[320616.602705] CPU: 0 PID: 29093 Comm: hppa2.0-unknown Not tainted 5.8.4-gentoo-parisc64 #1
[320616.602705] Hardware name: 9000/785/C8000
[320616.602705]
[320616.602705]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[320616.602705] PSW: 00001000000001101111111100001111 Not tainted
[320616.602705] r00-03  000000ff0806ff0f 0000000040558f08 00000000402706a8 00000040838787e0
[320616.602705] r04-07  0000000040a303e0 00000000409eafa0 0000000040c5b690 0000000041fce0d0
[320616.602705] r08-11  00000040838787e0 0000000000000001 00000000409fbf80 0000000040c5b740
[320616.602705] r12-15  0000000041fce0d8 00000000409eafa0 0000000040187140 0000000040a56be0
[320616.602705] r16-19  0000000040a56be0 0000000000000004 0000000001e92000 0000000000000002
[320616.602705] r20-23  0000000000000001 0000000000000000 0000000000000000 0000000000000002
[320616.602705] r24-27  0000000000000004 0000000000000000 0000000000000002 0000000040a303e0
[320616.602705] r28-31  0000000000000011 00000040838788e0 0000004083878810 0000000042001140
[320616.602705] sr00-03  00000000072a0800 0000000007296800 0000000000000000 00000000072a0800
[320616.602705] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[320616.602705]
[320616.602705] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000402706d0 00000000402706d4
[320616.602705]  IIR: 0ff0109c    ISR: 000000005836f8a0  IOR: 0000000000000001
[320616.602705]  CPU:        0   CR30: 0000004083878000 CR31: ffffffffffffffff
[320616.602705]  ORIG_R28: 0000000000000801
[320616.602705]  IAOQ[0]: smp_call_function_many_cond+0x490/0x500
[320616.602705]  IAOQ[1]: smp_call_function_many_cond+0x494/0x500
[320616.602705]  RP(r2): smp_call_function_many_cond+0x468/0x500
[320616.602705] Backtrace:
[320616.602705]  [<0000000040270824>] on_each_cpu+0x5c/0x98
[320616.602705]  [<0000000040186a0c>] flush_tlb_all+0x204/0x228
[320616.602705]  [<00000000402ef1f8>] tlb_finish_mmu+0x1d8/0x210
[320616.602705]  [<00000000402eb820>] exit_mmap+0x1d8/0x370
[320616.602705]  [<00000000401b5ec0>] mmput+0xe8/0x260
[320616.602705]  [<00000000401c1690>] do_exit+0x558/0x12e8
[320616.602705]  [<00000000401c3f18>] do_group_exit+0x50/0x118
[320616.602705]  [<00000000401c4000>] sys_exit_group+0x20/0x28
[320616.602705]  [<0000000040192018>] syscall_exit+0x0/0x14
[320616.602705]
[320619.854705] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [sh:29109]
[320619.854705] Modules linked in: 8021q ipmi_poweroff ipmi_si ipmi_devintf sata_via ipmi_msghandler cbc dm_zero dm_snapshot dm_mirror dm_region_hash dm_log dm_crypt dm_bufio pata_sil680 libata
[320619.854705] CPU: 1 PID: 29109 Comm: sh Tainted: G             L    5.8.4-gentoo-parisc64 #1
[320619.854705] Hardware name: 9000/785/C8000
[320619.854705]
[320619.854705]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[320619.854705] PSW: 00001000000001001111111100001111 Tainted: G             L
[320619.854705] r00-03  000000ff0804ff0f 0000000040558f08 00000000402706a8 0000004083b089e0
[320619.854705] r04-07  0000000040a303e0 00000000409eafa0 0000000040c5b690 0000000041fe60d0
[320619.854705] r08-11  0000004083b089e0 0000000000000001 00000000409fbf80 0000000040c5b740
[320619.854705] r12-15  0000000041fe60d8 00000000409eafa0 0000000040187ce0 0000000040a56be0
[320619.854705] r16-19  0000000040a56be0 0000000000000004 0000000001e92000 0000000000000002
[320619.854705] r20-23  0000000000000001 0000000000000000 0000000000000000 0000000000000002
[320619.854705] r24-27  0000000000000004 0000000000000000 0000000000000002 0000000040a303e0
[320619.854705] r28-31  0000000000000011 0000004083b08ae0 0000004083b08a10 0000000042001ce0
[320619.854705] sr00-03  00000000072a4800 00000000072a4800 0000000000000000 00000000072a5800
[320619.854705] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[320619.854705]
[320619.854705] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000402706d0 00000000402706d4
[320619.854705]  IIR: 0ff0109c    ISR: 0000000000000000  IOR: 0000000000000001
[320619.854705]  CPU:        1   CR30: 0000004083b08000 CR31: ffffffffffffffff
[320619.854705]  ORIG_R28: 0000000000000801
[320619.854705]  IAOQ[0]: smp_call_function_many_cond+0x490/0x500
[320619.854705]  IAOQ[1]: smp_call_function_many_cond+0x494/0x500
[320619.854705]  RP(r2): smp_call_function_many_cond+0x468/0x500
[320619.854705] Backtrace:
[320619.854705]  [<0000000040270824>] on_each_cpu+0x5c/0x98
[320619.854705]  [<0000000040186a0c>] flush_tlb_all+0x204/0x228
[320619.854705]  [<00000000402ef1f8>] tlb_finish_mmu+0x1d8/0x210
[320619.854705]  [<00000000402eb820>] exit_mmap+0x1d8/0x370
[320619.854705]  [<00000000401b5ec0>] mmput+0xe8/0x260
[320619.854705]  [<0000000040343254>] begin_new_exec+0x684/0x1140
[320619.854705]  [<00000000403e5790>] load_elf_binary+0xc00/0x18e0
[320619.854705]  [<000000004034237c>] __do_execve_file.isra.0+0xaa4/0x10d0
[320619.854705]  [<0000000040343eb8>] compat_sys_execve+0x70/0x88
[320619.854705]  [<0000000040192018>] syscall_exit+0x0/0x14
[320619.854705]
[320656.138705] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[320656.138705]         (detected by 0, t=15002 jiffies, g=29568801, q=103)
[320656.138705] rcu: All QSes seen, last rcu_sched kthread activity 15000 (4375056330-4375041330), jiffies_till_next_fqs=1, root ->qsmask 0x0
[320656.138705] rcu: rcu_sched kthread starved for 15000 jiffies! g29568801 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=3
[320656.138705] rcu:    Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
[320656.138705] rcu: RCU grace-period kthread stack dump:
[320656.138705] rcu_sched       R    0    10      2 0x00000000
[320656.138705] Backtrace:
[320656.138705]
[320656.922716] BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 60s!
[320657.026717] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 60s!
[320657.130716] Showing busy workqueues and worker pools:
[320657.198716] workqueue events: flags=0x0
[320657.250717]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[320657.254705]     pending: vmstat_shepherd
[320657.394718] workqueue events_power_efficient: flags=0x80
[320657.466715]   pwq 2: cpus=1 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[320657.470705]     pending: fb_flashcursor
[320657.610716]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=2/256 refcnt=3
[320657.614705]     pending: neigh_periodic_work, neigh_periodic_work
[320657.782719] workqueue mm_percpu_wq: flags=0x8
[320657.842715]   pwq 2: cpus=1 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[320657.846705]     pending: vmstat_update
[320657.982713]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[320657.986705]     pending: vmstat_update
[320658.126726] workqueue mpt_poll_1: flags=0x8
[320658.182716]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[320658.186705]     pending: mpt_fault_reset_work
[320684.602705] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [hppa2.0-unknown:29093]
[320684.602705] Modules linked in: 8021q ipmi_poweroff ipmi_si ipmi_devintf sata_via ipmi_msghandler cbc dm_zero dm_snapshot dm_mirror dm_region_hash dm_log dm_crypt dm_bufio pata_sil680 libata
[320684.602705] CPU: 0 PID: 29093 Comm: hppa2.0-unknown Tainted: G             L    5.8.4-gentoo-parisc64 #1
[320684.602705] Hardware name: 9000/785/C8000
[320684.602705]
[320684.602705]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[320684.602705] PSW: 00001000000001101111111100001111 Tainted: G             L
[320684.602705] r00-03  000000ff0806ff0f 0000000040558f08 00000000402706a8 00000040838787e0
[320684.602705] r04-07  0000000040a303e0 00000000409eafa0 0000000040c5b690 0000000041fce0d0
[320684.602705] r08-11  00000040838787e0 0000000000000001 00000000409fbf80 0000000040c5b740
[320684.602705] r12-15  0000000041fce0d8 00000000409eafa0 0000000040187140 0000000040a56be0
[320684.602705] r16-19  0000000040a56be0 0000000000000004 0000000001e92000 0000000000000002
[320684.602705] r20-23  0000000000000001 0000000000000000 0000000000000000 0000000000000002
[320684.602705] r24-27  0000000000000004 0000000000000000 0000000000000002 0000000040a303e0
[320684.602705] r28-31  0000000000000011 00000040838788e0 0000004083878810 0000000042001140
[320684.602705] sr00-03  00000000072a0800 0000000007296800 0000000000000000 00000000072a0800
[320684.602705] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[320684.602705]
[320684.602705] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000402706d0 00000000402706d4
[320684.602705]  IIR: 0ff0109c    ISR: 000000005836f8a0  IOR: 0000000000000001
[320684.602705]  CPU:        0   CR30: 0000004083878000 CR31: ffffffffffffffff
[320684.602705]  ORIG_R28: 0000000000000801
[320684.602705]  IAOQ[0]: smp_call_function_many_cond+0x490/0x500
[320684.602705]  IAOQ[1]: smp_call_function_many_cond+0x494/0x500
[320684.602705]  RP(r2): smp_call_function_many_cond+0x468/0x500
[320684.602705] Backtrace:
[320684.602705]  [<0000000040270824>] on_each_cpu+0x5c/0x98
[320684.602705]  [<0000000040186a0c>] flush_tlb_all+0x204/0x228
[320684.602705]  [<00000000402ef1f8>] tlb_finish_mmu+0x1d8/0x210
[320684.602705]  [<00000000402eb820>] exit_mmap+0x1d8/0x370
[320684.602705]  [<00000000401b5ec0>] mmput+0xe8/0x260
[320684.602705]  [<00000000401c1690>] do_exit+0x558/0x12e8
[320684.602705]  [<00000000401c3f18>] do_group_exit+0x50/0x118
[320684.602705]  [<00000000401c4000>] sys_exit_group+0x20/0x28
[320684.602705]  [<0000000040192018>] syscall_exit+0x0/0x14
[320684.602705]
[320836.158705] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[320836.158705]         (detected by 0, t=60007 jiffies, g=29568801, q=103)
[320836.158705] rcu: All QSes seen, last rcu_sched kthread activity 60005 (4375101335-4375041330), jiffies_till_next_fqs=1, root ->qsmask 0x0
[320836.158705] rcu: rcu_sched kthread starved for 60005 jiffies! g29568801 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=3
[320836.158705] rcu:    Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
[320836.158705] rcu: RCU grace-period kthread stack dump:
[320836.158705] rcu_sched       R    0    10      2 0x00000000
[320836.158705] Backtrace:
[320836.158705]

And then the machine rebooted.

--nextPart5387554.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCX00jiQAKCRBcpIk+abn8
Tgy2AKCHfK4dn34rsdqX5JJtPpSnZ44lIACfanBQnbN1Ocuv6Lj2ATTZoIm/bG0=
=Q1NR
-----END PGP SIGNATURE-----

--nextPart5387554.DvuYhMxLoT--



