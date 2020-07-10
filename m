Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205D121C01B
	for <lists+linux-parisc@lfdr.de>; Sat, 11 Jul 2020 00:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgGJWud (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 Jul 2020 18:50:33 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:40181 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726262AbgGJWuc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Jul 2020 18:50:32 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud9.xs4all.net with ESMTPSA
        id u1qWjwq4e5flqu1qXjpltp; Sat, 11 Jul 2020 00:50:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594421424; bh=lB5CkUD3IEUd5BIbeV90EDkhaimQwO2lb1DD68nJxKM=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=a+47NMz0KLpeUws99lrjdpc+/Jheu0ZHVGpnPeamDBfOkr8Z01f7sSxNVq3S0QKzu
         qObXkhJEk+qBicPSXvBnQ4YGKPZv/V+3zbc9/DtSb4OznrLxEgt5mEE/PWKS9H7soT
         xKxUhgsE22axW+hXRg50aEPf3ecMTdah/hwvlrveGLrT+S+26wDeflVOLhkHvcceix
         WEXzsIR4SHysEa9Lu69grTfqMO0tuZx0YGsfZgO/mCYPsjecNiiwW/+TdZ0gbS0U6K
         dHJwLalwhMEoAXUJaozj3qUDE+IigVKJ4i1VvIWKCutwG4OSmvs0NUT0cTkHkXWSTT
         Eskps0msFwR+Q==
Date:   Sat, 11 Jul 2020 00:50:18 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Fix spinlock barriers
Message-ID: <20200711005018.05540239@wim.jer>
In-Reply-To: <595e592a-36a5-e90f-e661-c5e52ec7753d@bell.net>
References: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
        <35432085.F4uqhuS8rR@daneel.sf-tec.de>
        <595e592a-36a5-e90f-e661-c5e52ec7753d@bell.net>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/N41L.0PvKDRD_zJ3Pm8=AFc"
X-CMAE-Envelope: MS4wfI8Krqu1Nt0GFYI7OSgh6ov5shLHckvZ35Yk2H64qf6uRICl0onaMdyiVOhws6x/627xFWtSCuUmOLAPre/FPywfYQVYCwhkA2AD9l1IdvgyGoxX2LRU
 FX3SyM31b7usd1oRohsg/HtiBvQf8T3HVLkLLQSQ7mP/zT1E+hcLgsXJ/49v7/6huwJ/2Ww7HJRGXQUCULfDsdU37X6fRpj8VQ1d/ccfsQec59zMQ44k+mFG
 puIgjIwqOlHrYM4cxDAZf6Ng8wqatmgsAzi7Vkjx3zKlN1wQ/8/ETIUP5wpq/Fzzb4oFWtCzb2pILoIPZCcPFQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--MP_/N41L.0PvKDRD_zJ3Pm8=AFc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, 9 Jul 2020 09:39:33 -0400
John David Anglin <dave.anglin@bell.net> wrote:

> On 2020-07-09 9:26 a.m., Rolf Eike Beer wrote:
> > Am Freitag, 3. Juli 2020, 22:32:35 CEST schrieb John David Anglin:  
> >> Stalls are quite frequent with recent kernels.  When the stall is
> >> detected by rcu_sched, we get a backtrace similar to the
> >> following:  
> > With this patch on top of 5.7.7 I still get:  
> Suggest enabling CONFIG_LOCKUP_DETECTOR=y and
> CONFIG_SOFTLOCKUP_DETECTOR=y so we can see where the stall occurs.
> 
> Dave
> 

Attached is kernel output while running the futex_requeue_pi test from
the kernel selftests. It failed this way on the second try while it
passed on the first try. The output it gave is with the kernel
configuration options as set out above.


Kind regards,
      jer

--MP_/N41L.0PvKDRD_zJ3Pm8=AFc
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=hung.txt

[32627.869720][    C0] sched: RT throttling activated
[32627.869720][    C0] sched: RT throttling activated
[32758.890722][  T184] INFO: task futex_requeue_p:11776 blocked for more than
120 seconds.
[32758.890722][  T184] INFO: task futex_requeue_p:11776 blocked for more than
120 seconds.
[32759.092374][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[32759.092374][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[32759.283055][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[32759.283055][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[32759.497698][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[32759.497698][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[32759.653327][  T184] Backtrace:
[32759.653327][  T184] Backtrace:
[32759.730236][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[32759.730236][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[32759.894604][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[32759.894604][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[32760.041479][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[32760.041479][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[32760.197084][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[32760.197084][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[32760.346148][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[32760.346148][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[32760.499589][  T184]
[32760.499589][  T184]
[32783.829356][    C0] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[32783.829356][    C0] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[32783.942594][    C0] rcu:     0-...!: (1 GPs behind)
idle=00e/1/0x4000000000000002 softirq=479791/479792 fqs=0
[32783.942594][    C0] rcu:     0-...!: (1 GPs behind)
idle=00e/1/0x4000000000000002 softirq=479791/479792 fqs=0
[32783.942594][    C0]  (detected by 0, t=5252 jiffies, g=628645, q=403)
[32783.942594][    C0]  (detected by 0, t=5252 jiffies, g=628645, q=403)
[32783.942594][    C0] Task dump for CPU 0:
[32783.942594][    C0] Task dump for CPU 0:
[32783.942594][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000010
[32783.942594][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000010
[32783.942594][    C0] Backtrace:
[32783.942594][    C0] Backtrace:
[32783.942594][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[32783.942594][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[32783.942594][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[32783.942594][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[32783.942594][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[32783.942594][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[32783.942594][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[32783.942594][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[32783.942594][    C0]  [<00000000403052b4>] rcu_sched_clock_irq+0xa14/0xb58
[32783.942594][    C0]  [<00000000403052b4>] rcu_sched_clock_irq+0xa14/0xb58
[32783.942594][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[32783.942594][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[32783.942594][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[32783.942594][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[32783.942594][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[32783.942594][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[32783.942594][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[32783.942594][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[32783.942594][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[32783.942594][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[32783.942594][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[32783.942594][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[32783.942594][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[32783.942594][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[32783.942594][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[32783.942594][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[32783.942594][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[32783.942594][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[32783.942594][    C0]
[32783.942594][    C0]
[32885.902861][  T184] INFO: task futex_requeue_p:11776 blocked for more than
248 seconds.
[32885.902861][  T184] INFO: task futex_requeue_p:11776 blocked for more than
248 seconds.
[32886.104469][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[32886.104469][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[32886.295068][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[32886.295068][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[32886.509754][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[32886.509754][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[32886.665385][  T184] Backtrace:
[32886.665385][  T184] Backtrace:
[32886.742274][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[32886.742274][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[32886.906682][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[32886.906682][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[32887.053516][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[32887.053516][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[32887.209140][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[32887.209140][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[32887.358204][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[32887.358204][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[32887.511637][  T184]
[32887.511637][  T184]
[33020.862709][  T184] INFO: task futex_requeue_p:11776 blocked for more than
382 seconds.
[33020.862709][  T184] INFO: task futex_requeue_p:11776 blocked for more than
382 seconds.
[33021.064414][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[33021.064414][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[33021.255143][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[33021.255143][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[33021.469860][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[33021.469860][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[33021.625579][  T184] Backtrace:
[33021.625579][  T184] Backtrace:
[33021.702420][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[33021.702420][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[33021.866875][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[33021.866875][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[33022.013832][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[33022.013832][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[33022.169549][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[33022.169549][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[33022.318656][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[33022.318656][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[33022.472089][  T184]
[33022.472089][  T184]
[33031.888801][    C0] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[33031.888801][    C0] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[33031.898353][    C0]  (detected by 0, t=5252 jiffies, g=628793, q=10)
[33031.898353][    C0]  (detected by 0, t=5252 jiffies, g=628793, q=10)
[33031.898353][    C0] rcu: All QSes seen, last rcu_sched kthread activity
5252 (4303150277-4303145025), jiffies_till_next_fqs=1, root ->qsmask 0x0
[33031.898353][    C0] rcu: All QSes seen, last rcu_sched kthread activity
5252 (4303150277-4303145025), jiffies_till_next_fqs=1, root ->qsmask 0x0
[33031.898353][    C0] rcu: rcu_sched kthread starved for 5252 jiffies!
g628793 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
[33031.898353][    C0] rcu: rcu_sched kthread starved for 5252 jiffies!
g628793 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
[33031.898353][    C0] rcu:     Unless rcu_sched kthread gets sufficient CPU
time, OOM is now expected behavior.
[33031.898353][    C0] rcu:     Unless rcu_sched kthread gets sufficient CPU
time, OOM is now expected behavior.
[33031.898353][    C0] rcu: RCU grace-period kthread stack dump:
[33031.898353][    C0] rcu: RCU grace-period kthread stack dump:
[33031.898353][    C0] rcu_sched       R  running task        0    10      2
0x00000000
[33031.898353][    C0] rcu_sched       R  running task        0    10      2
0x00000000
[33031.898353][    C0] Backtrace:
[33031.898353][    C0] Backtrace:
[33031.898353][    C0]
[33031.898353][    C0]
[33067.872720][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33067.872720][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33067.872720][    C0] rcu:     0-....: (1 GPs behind)
idle=00e/1/0x4000000000000002 softirq=479896/479897 fqs=13
[33067.872720][    C0] rcu:     0-....: (1 GPs behind)
idle=00e/1/0x4000000000000002 softirq=479896/479897 fqs=13
[33067.872720][    C0]  (t=5250 jiffies g=628797 q=7)
[33067.872720][    C0]  (t=5250 jiffies g=628797 q=7)
[33067.872720][    C0] Task dump for CPU 0:
[33067.872720][    C0] Task dump for CPU 0:
[33067.872720][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33067.872720][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33067.872720][    C0] Backtrace:
[33067.872720][    C0] Backtrace:
[33067.872720][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33067.872720][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33067.872720][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33067.872720][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33067.872720][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33067.872720][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33067.872720][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33067.872720][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33067.872720][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33067.872720][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33067.872720][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33067.872720][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33067.872720][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33067.872720][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33067.872720][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33067.872720][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33067.872720][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33067.872720][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33067.872720][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33067.872720][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33067.872720][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33067.872720][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33067.872720][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33067.872720][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33067.872720][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33067.872720][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33067.872720][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33067.872720][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33067.872720][    C0]
[33067.872720][    C0]
[33130.884579][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33130.884579][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33130.884579][    C0] rcu:     0-....: (1 GPs behind)
idle=00e/1/0x4000000000000002 softirq=479896/479897 fqs=39
[33130.884579][    C0] rcu:     0-....: (1 GPs behind)
idle=00e/1/0x4000000000000002 softirq=479896/479897 fqs=39
[33130.884579][    C0]  (t=21003 jiffies g=628797 q=13)
[33130.884579][    C0]  (t=21003 jiffies g=628797 q=13)
[33130.884579][    C0] Task dump for CPU 0:
[33130.884579][    C0] Task dump for CPU 0:
[33130.884579][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000010
[33130.884579][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000010
[33130.884579][    C0] Backtrace:
[33130.884579][    C0] Backtrace:
[33130.884579][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33130.884579][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33130.884579][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33130.884579][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33130.884579][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33130.884579][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33130.884579][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33130.884579][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33130.884579][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33130.884579][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33130.884579][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33130.884579][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33130.884579][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33130.884579][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33130.884579][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33130.884579][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33130.884579][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33130.884579][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33130.884579][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33130.884579][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33130.884579][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33130.884579][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33130.884579][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33130.884579][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33130.884579][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33130.884579][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33130.884579][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33130.884579][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33130.884579][    C0]
[33130.884579][    C0]
[33153.913692][  T184] INFO: task futex_requeue_p:11776 blocked for more than
516 seconds.
[33153.913692][  T184] INFO: task futex_requeue_p:11776 blocked for more than
516 seconds.
[33154.115244][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[33154.115244][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[33154.305853][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[33154.305853][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[33154.520542][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[33154.520542][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[33154.676172][  T184] Backtrace:
[33154.676172][  T184] Backtrace:
[33154.753060][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[33154.753060][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[33154.917428][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[33154.917428][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[33155.064301][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[33155.064301][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[33155.219926][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[33155.219926][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[33155.368990][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[33155.368990][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[33155.522424][  T184]
[33155.522424][  T184]
[33193.896438][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33193.896438][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33193.896438][    C0] rcu:     0-....: (1 GPs behind)
idle=00e/1/0x4000000000000002 softirq=479896/479897 fqs=65
[33193.896438][    C0] rcu:     0-....: (1 GPs behind)
idle=00e/1/0x4000000000000002 softirq=479896/479897 fqs=65
[33193.896438][    C0]  (t=36756 jiffies g=628797 q=18)
[33193.896438][    C0]  (t=36756 jiffies g=628797 q=18)
[33193.896438][    C0] Task dump for CPU 0:
[33193.896438][    C0] Task dump for CPU 0:
[33193.896438][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33193.896438][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33193.896438][    C0] Backtrace:
[33193.896438][    C0] Backtrace:
[33193.896438][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33193.896438][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33193.896438][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33193.896438][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33193.896438][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33193.896438][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33193.896438][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33193.896438][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33193.896438][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33193.896438][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33193.896438][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33193.896438][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33193.896438][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33193.896438][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33193.896438][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33193.896438][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33193.896438][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33193.896438][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33193.896438][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33193.896438][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33193.896438][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33193.896438][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33193.896438][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33193.896438][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33193.896438][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33193.896438][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33193.896438][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33193.896438][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33193.896438][    C0]
[33193.896438][    C0]
[33251.868309][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33251.868309][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33251.868309][    C0] rcu:     0-....: (2 GPs behind)
idle=012/1/0x4000000000000002 softirq=479896/479897 fqs=15
[33251.868309][    C0] rcu:     0-....: (2 GPs behind)
idle=012/1/0x4000000000000002 softirq=479896/479897 fqs=15
[33251.868309][    C0]  (t=5250 jiffies g=628801 q=38)
[33251.868309][    C0]  (t=5250 jiffies g=628801 q=38)
[33251.868309][    C0] Task dump for CPU 0:
[33251.868309][    C0] Task dump for CPU 0:
[33251.868309][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33251.868309][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33251.868309][    C0] Backtrace:
[33251.868309][    C0] Backtrace:
[33251.868309][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33251.868309][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33251.868309][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33251.868309][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33251.868309][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33251.868309][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33251.868309][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33251.868309][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33251.868309][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33251.868309][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33251.868309][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33251.868309][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33251.868309][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33251.868309][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33251.868309][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33251.868309][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33251.868309][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33251.868309][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33251.868309][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33251.868309][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33251.868309][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33251.868309][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33251.868309][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33251.868309][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33251.868309][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33251.868309][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33251.868309][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33251.868309][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33251.868309][    C0]
[33251.868309][    C0]
[33314.880168][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33314.880168][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33314.880168][    C0] rcu:     0-....: (2 GPs behind)
idle=012/1/0x4000000000000002 softirq=479896/479897 fqs=39
[33314.880168][    C0] rcu:     0-....: (2 GPs behind)
idle=012/1/0x4000000000000002 softirq=479896/479897 fqs=39
[33314.880168][    C0]  (t=21003 jiffies g=628801 q=43)
[33314.880168][    C0]  (t=21003 jiffies g=628801 q=43)
[33315.285850][    C0] Task dump for CPU 0:
[33315.285850][    C0] Task dump for CPU 0:
[33315.285850][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33315.285850][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33315.285850][    C0] Backtrace:
[33315.285850][    C0] Backtrace:
[33315.285850][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33315.285850][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33315.285850][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33315.285850][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33315.285850][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33315.285850][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33315.285850][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33315.285850][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33315.285850][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33315.285850][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33315.285850][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33315.285850][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33315.285850][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33315.285850][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33315.285850][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33315.285850][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33315.285850][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33315.285850][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33315.285850][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33315.285850][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33315.285850][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33315.285850][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33315.285850][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33315.285850][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33315.285850][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33315.285850][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33315.285850][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33315.285850][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33315.285850][    C0]
[33315.285850][    C0]
[33373.917674][  T184] INFO: task futex_requeue_p:11776 blocked for more than
736 seconds.
[33373.917674][  T184] INFO: task futex_requeue_p:11776 blocked for more than
736 seconds.
[33374.119359][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[33374.119359][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[33374.310076][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[33374.310076][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[33374.524852][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[33374.524852][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[33374.680482][  T184] Backtrace:
[33374.680482][  T184] Backtrace:
[33374.757334][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[33374.757334][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[33374.921784][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[33374.921784][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[33375.068731][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[33375.068731][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[33375.224462][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[33375.224462][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[33375.373621][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[33375.373621][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[33375.527000][  T184]
[33375.527000][  T184]
[33377.892027][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33377.892027][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33377.892027][    C0] rcu:     0-....: (2 GPs behind)
idle=012/1/0x4000000000000002 softirq=479896/479897 fqs=60
[33377.892027][    C0] rcu:     0-....: (2 GPs behind)
idle=012/1/0x4000000000000002 softirq=479896/479897 fqs=60
[33377.892027][    C0]  (t=36756 jiffies g=628801 q=49)
[33377.892027][    C0]  (t=36756 jiffies g=628801 q=49)
[33377.892027][    C0] Task dump for CPU 0:
[33377.892027][    C0] Task dump for CPU 0:
[33377.892027][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33377.892027][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33377.892027][    C0] Backtrace:
[33377.892027][    C0] Backtrace:
[33377.892027][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33377.892027][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33377.892027][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33377.892027][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33377.892027][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33377.892027][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33377.892027][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33377.892027][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33377.892027][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33377.892027][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33377.892027][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33377.892027][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33377.892027][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33377.892027][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33377.892027][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33377.892027][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33377.892027][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33377.892027][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33377.892027][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33377.892027][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33377.892027][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33377.892027][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33377.892027][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33377.892027][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33377.892027][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33377.892027][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33377.892027][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33377.892027][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33377.892027][    C0]
[33377.892027][    C0]
[33440.871886][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33440.871886][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33440.871886][    C0] rcu:     0-....: (3 GPs behind)
idle=016/1/0x4000000000000002 softirq=479896/479897 fqs=11
[33440.871886][    C0] rcu:     0-....: (3 GPs behind)
idle=016/1/0x4000000000000002 softirq=479896/479897 fqs=11
[33440.871886][    C0]  (t=5250 jiffies g=628805 q=23)
[33440.871886][    C0]  (t=5250 jiffies g=628805 q=23)
[33440.871886][    C0] Task dump for CPU 0:
[33440.871886][    C0] Task dump for CPU 0:
[33440.871886][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33440.871886][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33440.871886][    C0] Backtrace:
[33440.871886][    C0] Backtrace:
[33440.871886][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33440.871886][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33440.871886][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33440.871886][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33440.871886][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33440.871886][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33440.871886][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33440.871886][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33440.871886][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33440.871886][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33440.871886][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33440.871886][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33440.871886][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33440.871886][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33440.871886][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33440.871886][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33440.871886][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33440.871886][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33440.871886][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33440.871886][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33440.871886][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33440.871886][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33440.871886][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33440.871886][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33440.871886][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33440.871886][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33440.871886][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33440.871886][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33440.871886][    C0]
[33440.871886][    C0]
[33477.879803][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33477.879803][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33477.879803][    C0] rcu:     0-....: (4 GPs behind)
idle=01a/1/0x4000000000000002 softirq=479896/479897 fqs=13
[33477.879803][    C0] rcu:     0-....: (4 GPs behind)
idle=01a/1/0x4000000000000002 softirq=479896/479897 fqs=13
[33477.879803][    C0]  (t=5250 jiffies g=628809 q=10)
[33477.879803][    C0]  (t=5250 jiffies g=628809 q=10)
[33477.879803][    C0] Task dump for CPU 0:
[33477.879803][    C0] Task dump for CPU 0:
[33477.879803][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33477.879803][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33477.879803][    C0] Backtrace:
[33477.879803][    C0] Backtrace:
[33477.879803][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33477.879803][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33477.879803][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33477.879803][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33477.879803][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33477.879803][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33477.879803][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33477.879803][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33477.879803][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33477.879803][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33477.879803][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33477.879803][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33477.879803][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33477.879803][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33477.879803][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33477.879803][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33477.879803][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33477.879803][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33477.879803][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33477.879803][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33477.879803][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33477.879803][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33477.879803][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33477.879803][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33477.879803][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33477.879803][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33477.879803][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33477.879803][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33477.879803][    C0]
[33477.879803][    C0]
[33524.859698][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33524.859698][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33524.859698][    C0] rcu:     0-....: (5 GPs behind)
idle=01e/1/0x4000000000000002 softirq=479896/479897 fqs=10
[33524.859698][    C0] rcu:     0-....: (5 GPs behind)
idle=01e/1/0x4000000000000002 softirq=479896/479897 fqs=10
[33524.859698][    C0]  (t=5250 jiffies g=628813 q=10)
[33524.859698][    C0]  (t=5250 jiffies g=628813 q=10)
[33524.859698][    C0] Task dump for CPU 0:
[33524.859698][    C0] Task dump for CPU 0:
[33524.859698][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33524.859698][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33524.859698][    C0] Backtrace:
[33524.859698][    C0] Backtrace:
[33524.859698][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33524.859698][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33524.859698][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33524.859698][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33524.859698][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33524.859698][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33524.859698][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33524.859698][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33524.859698][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33524.859698][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33524.859698][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33524.859698][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33524.859698][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33524.859698][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33524.859698][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33524.859698][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33524.859698][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33524.859698][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33524.859698][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33524.859698][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33524.859698][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33524.859698][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33524.859698][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33524.859698][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33524.859698][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33524.859698][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33524.859698][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33524.859698][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33524.859698][    C0]
[33524.859698][    C0]
[33578.896996][  T184] INFO: task futex_requeue_p:11776 blocked for more than
941 seconds.
[33578.896996][  T184] INFO: task futex_requeue_p:11776 blocked for more than
941 seconds.
[33579.098653][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[33579.098653][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[33579.289329][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[33579.289329][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[33579.504112][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[33579.504112][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[33579.659740][  T184] Backtrace:
[33579.659740][  T184] Backtrace:
[33579.736581][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[33579.736581][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[33579.901052][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[33579.901052][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[33580.047996][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[33580.047996][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[33580.203655][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[33580.203655][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[33580.352718][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[33580.352718][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[33580.506158][  T184]
[33580.506158][  T184]
[33587.871557][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33587.871557][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33587.871557][    C0] rcu:     0-....: (5 GPs behind)
idle=01e/1/0x4000000000000002 softirq=479896/479897 fqs=36
[33587.871557][    C0] rcu:     0-....: (5 GPs behind)
idle=01e/1/0x4000000000000002 softirq=479896/479897 fqs=36
[33587.871557][    C0]  (t=21003 jiffies g=628813 q=15)
[33587.871557][    C0]  (t=21003 jiffies g=628813 q=15)
[33587.871557][    C0] Task dump for CPU 0:
[33587.871557][    C0] Task dump for CPU 0:
[33587.871557][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33587.871557][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33587.871557][    C0] Backtrace:
[33587.871557][    C0] Backtrace:
[33587.871557][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33587.871557][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33587.871557][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33587.871557][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33587.871557][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33587.871557][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33587.871557][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33587.871557][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33587.871557][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33587.871557][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33587.871557][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33587.871557][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33587.871557][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33587.871557][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33587.871557][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33587.871557][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33587.871557][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33587.871557][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33587.871557][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33587.871557][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33587.871557][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33587.871557][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33587.871557][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33587.871557][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33587.871557][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33587.871557][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33587.871557][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33587.871557][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33587.871557][    C0]
[33587.871557][    C0]
[33623.895477][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33623.895477][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33623.895477][    C0] rcu:     0-....: (6 GPs behind)
idle=022/1/0x4000000000000002 softirq=479896/479897 fqs=13
[33623.895477][    C0] rcu:     0-....: (6 GPs behind)
idle=022/1/0x4000000000000002 softirq=479896/479897 fqs=13
[33623.895477][    C0]  (t=5250 jiffies g=628817 q=11)
[33623.895477][    C0]  (t=5250 jiffies g=628817 q=11)
[33623.895477][    C0] Task dump for CPU 0:
[33623.895477][    C0] Task dump for CPU 0:
[33623.895477][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33623.895477][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33623.895477][    C0] Backtrace:
[33623.895477][    C0] Backtrace:
[33623.895477][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33623.895477][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33623.895477][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33623.895477][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33623.895477][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33623.895477][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33623.895477][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33623.895477][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33623.895477][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33623.895477][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33623.895477][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33623.895477][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33623.895477][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33623.895477][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33623.895477][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33623.895477][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33623.895477][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33623.895477][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33623.895477][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33623.895477][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33623.895477][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33623.895477][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33623.895477][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33623.895477][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33623.895477][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33623.895477][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33623.895477][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33623.895477][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33623.895477][    C0]
[33623.895477][    C0]
[33686.907335][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33686.907335][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33686.908471][    C0] rcu:     0-....: (6 GPs behind)
idle=022/1/0x4000000000000002 softirq=479896/479897 fqs=38
[33686.908471][    C0] rcu:     0-....: (6 GPs behind)
idle=022/1/0x4000000000000002 softirq=479896/479897 fqs=38
[33686.908471][    C0]  (t=21003 jiffies g=628817 q=29)
[33686.908471][    C0]  (t=21003 jiffies g=628817 q=29)
[33686.908471][    C0] Task dump for CPU 0:
[33686.908471][    C0] Task dump for CPU 0:
[33686.908471][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33686.908471][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33686.908471][    C0] Backtrace:
[33686.908471][    C0] Backtrace:
[33686.908471][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33686.908471][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33686.908471][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33686.908471][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33686.908471][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33686.908471][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33686.908471][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33686.908471][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33686.908471][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33686.908471][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33686.908471][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33686.908471][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33686.908471][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33686.908471][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33686.908471][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33686.908471][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33686.908471][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33686.908471][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33686.908471][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33686.908471][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33686.908471][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33686.908471][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33686.908471][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33686.908471][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33686.908471][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33686.908471][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33686.908471][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33686.908471][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33686.908471][    C0]
[33686.908471][    C0]
[33749.919195][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33749.919195][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[33749.919195][    C0] rcu:     0-....: (6 GPs behind)
idle=022/1/0x4000000000000002 softirq=479896/479897 fqs=68
[33749.919195][    C0] rcu:     0-....: (6 GPs behind)
idle=022/1/0x4000000000000002 softirq=479896/479897 fqs=68
[33749.919195][    C0]  (t=36756 jiffies g=628817 q=35)
[33749.919195][    C0]  (t=36756 jiffies g=628817 q=35)
[33749.919195][    C0] Task dump for CPU 0:
[33749.919195][    C0] Task dump for CPU 0:
[33749.919195][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33749.919195][    C0] futex_requeue_p R  running task        0 11780  11689
0x00000014
[33749.919195][    C0] Backtrace:
[33749.919195][    C0] Backtrace:
[33749.919195][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33749.919195][    C0]  [<0000000040247130>] show_stack+0x50/0x70
[33749.919195][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33749.919195][    C0]  [<00000000402b8ed8>]
sched_show_task.part.0+0x150/0x170
[33749.919195][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33749.919195][    C0]  [<00000000402b90f8>] dump_cpu_task+0x68/0x80
[33749.919195][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33749.919195][    C0]  [<0000000040306568>] rcu_dump_cpu_stacks+0x110/0x178
[33749.919195][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33749.919195][    C0]  [<0000000040305088>] rcu_sched_clock_irq+0x7e8/0xb58
[33749.919195][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33749.919195][    C0]  [<000000004030c8b8>] update_process_times+0x58/0xb8
[33749.919195][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33749.919195][    C0]  [<00000000409e8160>] timer_interrupt+0xb0/0x120
[33749.919195][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33749.919195][    C0]  [<00000000402ec738>]
__handle_irq_event_percpu+0xb8/0x238
[33749.919195][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33749.919195][    C0]  [<00000000402ec8ec>] handle_irq_event_percpu+0x34/0xb8
[33749.919195][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33749.919195][    C0]  [<00000000402f4630>] handle_percpu_irq+0xa8/0xe8
[33749.919195][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33749.919195][    C0]  [<00000000402eb7d0>] generic_handle_irq+0x60/0x78
[33749.919195][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33749.919195][    C0]  [<000000004024e340>] call_on_stack+0x18/0x24
[33749.919195][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33749.919195][    C0]  [<0000000040249d60>] do_cpu_irq_mask+0x320/0x450
[33749.919195][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33749.919195][    C0]  [<000000004024d074>] intr_return+0x0/0xc
[33749.919195][    C0]
[33749.919195][    C0]
[33801.861080][  T184] INFO: task futex_requeue_p:11776 blocked for more than
1163 seconds.
[33801.861080][  T184] INFO: task futex_requeue_p:11776 blocked for more than
1163 seconds.
[33802.064917][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[33802.064917][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[33802.255538][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[33802.255538][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[33802.470219][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[33802.470219][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[33802.625849][  T184] Backtrace:
[33802.625849][  T184] Backtrace:
[33802.702739][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[33802.702739][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[33802.867146][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[33802.867146][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[33803.013980][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[33803.013980][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[33803.169603][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[33803.169603][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[33803.318668][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[33803.318668][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[33803.472107][  T184]
[33803.472107][  T184]
[33812.939054][    C0] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[33812.939054][    C0] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[33812.939054][    C0]  (detected by 0, t=52511 jiffies, g=628817, q=48)
[33812.939054][    C0]  (detected by 0, t=52511 jiffies, g=628817, q=48)
[33812.939054][    C0] rcu: All QSes seen, last rcu_sched kthread activity 19
(4303345540-4303345521), jiffies_till_next_fqs=1, root ->qsmask 0x0
[33812.939054][    C0] rcu: All QSes seen, last rcu_sched kthread activity 19
(4303345540-4303345521), jiffies_till_next_fqs=1, root ->qsmask 0x0
[34034.888097][  T184] INFO: task futex_requeue_p:11776 blocked for more than
1396 seconds.
[34034.888097][  T184] INFO: task futex_requeue_p:11776 blocked for more than
1396 seconds.
[34035.091906][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[34035.091906][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[34035.282516][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[34035.282516][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[34035.497205][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[34035.497205][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[34035.652834][  T184] Backtrace:
[34035.652834][  T184] Backtrace:
[34035.729724][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[34035.729724][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[34035.894141][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[34035.894141][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[34036.040965][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[34036.040965][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[34036.196589][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[34036.196589][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[34036.345655][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[34036.345655][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[34036.499095][  T184]
[34036.499095][  T184]
[34384.869774][    C0] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[34384.869774][    C0] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[34384.963346][  T184] INFO: task futex_requeue_p:11776 blocked for more than
1746 seconds.
[34384.963346][  T184] INFO: task futex_requeue_p:11776 blocked for more than
1746 seconds.
[34384.963054][    C0]  (detected by 0, t=5252 jiffies, g=628973, q=3)
[34384.963054][    C0]  (detected by 0, t=5252 jiffies, g=628973, q=3)
[34384.963054][    C0] rcu: All QSes seen, last rcu_sched kthread activity
5252 (4303488523-4303483271), jiffies_till_next_fqs=1, root ->qsmask 0x0
[34384.963054][    C0] rcu: All QSes seen, last rcu_sched kthread activity
5252 (4303488523-4303483271), jiffies_till_next_fqs=1, root ->qsmask 0x0
[34384.963054][    C0] rcu: rcu_sched kthread starved for 5252 jiffies!
g628973 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=1
[34384.963054][    C0] rcu: rcu_sched kthread starved for 5252 jiffies!
g628973 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=1
[34384.963054][    C0] rcu:     Unless rcu_sched kthread gets sufficient CPU
time, OOM is now expected behavior.
[34384.963054][    C0] rcu:     Unless rcu_sched kthread gets sufficient CPU
time, OOM is now expected behavior.
[34385.240135][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[34385.240135][  T184]       Not tainted
5.8.0-rc4-JeR-00128-g42f82040ee66-dirty #195
[34384.963054][    C0] rcu: RCU grace-period kthread stack dump:
[34384.963054][    C0] rcu: RCU grace-period kthread stack dump:
[34384.963054][    C0] rcu_sched       R  running task        0    10      2
0x00000000
[34384.963054][    C0] rcu_sched       R  running task        0    10      2
0x00000000
[34384.963054][    C0] Backtrace:
[34384.963054][    C0] Backtrace:
[34385.724199][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[34385.724199][  T184] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[34384.963054][    C0]
[34384.963054][    C0]
[34387.118373][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[34387.118373][  T184] futex_requeue_p D    0 11776  11689 0x00000010
[34387.274009][  T184] Backtrace:
[34387.274009][  T184] Backtrace:
[34387.350896][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[34387.350896][  T184]  [<00000000402b2b50>] check_preempt_curr+0xb8/0xd8
[34387.515262][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[34387.515262][  T184]  [<00000000402e1f9c>] up_write+0x17c/0x188
[34387.662135][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[34387.662135][  T184]  [<000000004040f914>] sys_mprotect+0x1f4/0x278
[34387.817760][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[34387.817760][  T184]  [<000000004024e054>] syscall_exit+0x0/0x14
[34387.966825][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[34387.966825][  T184]  [<000000004024d080>] intr_check_sig+0x0/0x3c
[34388.120258][  T184]
[34388.120258][  T184]


--MP_/N41L.0PvKDRD_zJ3Pm8=AFc--
