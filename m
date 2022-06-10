Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77FD6546A19
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Jun 2022 18:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiFJQGz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 Jun 2022 12:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239010AbiFJQGy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Jun 2022 12:06:54 -0400
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD833DDC4
        for <linux-parisc@vger.kernel.org>; Fri, 10 Jun 2022 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1654877213; x=1686413213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VEjVyQaPUfAbceeIt4WxuFsTEDHTOWPhkd/+oqFXnHI=;
  b=TVpQWxw0MZm9ZAuosnZYB0yftMPsDriGXp36RCe/R+PZs+gmeJ2zlUQp
   CiUvB0rUmB8yLK4j4aXYHAjB3Bhzj1d46KqUJlTRTyUswt8kQTUlF0iJG
   s+vpKQ6KwCGQyVlXvnE4uDmUAU6Go9bz5tKK+fILUd0eX0yg7PNwHjkwi
   A=;
X-IronPort-AV: E=Sophos;i="5.91,290,1647302400"; 
   d="scan'208";a="227159877"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1d-f20e0c8b.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 10 Jun 2022 16:06:37 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1d-f20e0c8b.us-east-1.amazon.com (Postfix) with ESMTPS id 7E41F817D9;
        Fri, 10 Jun 2022 16:06:35 +0000 (UTC)
Received: from EX13D04ANC001.ant.amazon.com (10.43.157.89) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Fri, 10 Jun 2022 16:06:34 +0000
Received: from 88665a182662.ant.amazon.com.com (10.43.160.26) by
 EX13D04ANC001.ant.amazon.com (10.43.157.89) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Fri, 10 Jun 2022 16:06:33 +0000
From:   Kuniyuki Iwashima <kuniyu@amazon.com>
To:     <dave.anglin@bell.net>
CC:     <deller@gmx.de>, <kuniyu@amazon.co.jp>,
        <linux-parisc@vger.kernel.org>
Subject: Re: linux v5.18.3 fails to boot
Date:   Fri, 10 Jun 2022 09:06:24 -0700
Message-ID: <20220610160624.95035-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <07d91863-dacc-a503-aa2b-05c3b92a1e39@bell.net>
References: <07d91863-dacc-a503-aa2b-05c3b92a1e39@bell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.26]
X-ClientProxiedBy: EX13D35UWC003.ant.amazon.com (10.43.162.130) To
 EX13D04ANC001.ant.amazon.com (10.43.157.89)
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello,
Thanks for heads up!

Date:   Fri, 10 Jun 2022 11:06:24 -0400
From:   John David Anglin <dave.anglin@bell.net>
> I did a regression search. e039c0b5985999b150594126225e1ee51df7b4c9 is the first bad commit
> 
> commit e039c0b5985999b150594126225e1ee51df7b4c9
> Author: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
> Date:   Fri Apr 29 14:38:01 2022 -0700
> 
>      list: fix a data-race around ep->rdllist
> 
>      [ Upstream commit d679ae94fdd5d3ab00c35078f5af5f37e068b03d ]
> 
>      ep_poll() first calls ep_events_available() with no lock held and checks
>      if ep->rdllist is empty by list_empty_careful(), which reads
>      rdllist->prev.  Thus all accesses to it need some protection to avoid
>      store/load-tearing.
> 
>      Note INIT_LIST_HEAD_RCU() already has the annotation for both prev
>      and next.
> 
>      Commit bf3b9f6372c4 ("epoll: Add busy poll support to epoll with socket
>      fds.") added the first lockless ep_events_available(), and commit
>      c5a282e9635e ("fs/epoll: reduce the scope of wq lock in epoll_wait()")
>      made some ep_events_available() calls lockless and added single call under
>      a lock, finally commit e59d3c64cba6 ("epoll: eliminate unnecessary lock
>      for zero timeout") made the last ep_events_available() lockless.
> 
>      BUG: KCSAN: data-race in do_epoll_wait / do_epoll_wait
> 
>      write to 0xffff88810480c7d8 of 8 bytes by task 1802 on cpu 0:
>       INIT_LIST_HEAD include/linux/list.h:38 [inline]
>       list_splice_init include/linux/list.h:492 [inline]
>       ep_start_scan fs/eventpoll.c:622 [inline]
>       ep_send_events fs/eventpoll.c:1656 [inline]
>       ep_poll fs/eventpoll.c:1806 [inline]
>       do_epoll_wait+0x4eb/0xf40 fs/eventpoll.c:2234
>       do_epoll_pwait fs/eventpoll.c:2268 [inline]
>       __do_sys_epoll_pwait fs/eventpoll.c:2281 [inline]
>       __se_sys_epoll_pwait+0x12b/0x240 fs/eventpoll.c:2275
>       __x64_sys_epoll_pwait+0x74/0x80 fs/eventpoll.c:2275
>       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>       do_syscall_64+0x44/0xd0 arch/x86/entry/common.c:80
>       entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
>      read to 0xffff88810480c7d8 of 8 bytes by task 1799 on cpu 1:
>       list_empty_careful include/linux/list.h:329 [inline]
>       ep_events_available fs/eventpoll.c:381 [inline]
>       ep_poll fs/eventpoll.c:1797 [inline]
>       do_epoll_wait+0x279/0xf40 fs/eventpoll.c:2234
>       do_epoll_pwait fs/eventpoll.c:2268 [inline]
>       __do_sys_epoll_pwait fs/eventpoll.c:2281 [inline]
>       __se_sys_epoll_pwait+0x12b/0x240 fs/eventpoll.c:2275
>       __x64_sys_epoll_pwait+0x74/0x80 fs/eventpoll.c:2275
>       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>       do_syscall_64+0x44/0xd0 arch/x86/entry/common.c:80
>       entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
>      value changed: 0xffff88810480c7d0 -> 0xffff888103c15098
> 
>      Reported by Kernel Concurrency Sanitizer on:
>      CPU: 1 PID: 1799 Comm: syz-fuzzer Tainted: G        W 5.17.0-rc7-syzkaller-dirty #0
>      Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> 
>      Link: https://lkml.kernel.org/r/20220322002653.33865-3-kuniyu@amazon.co.jp
>      Fixes: e59d3c64cba6 ("epoll: eliminate unnecessary lock for zero timeout")
>      Fixes: c5a282e9635e ("fs/epoll: reduce the scope of wq lock in epoll_wait()")
>      Fixes: bf3b9f6372c4 ("epoll: Add busy poll support to epoll with socket fds.")
>      Signed-off-by: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
>      Reported-by: syzbot+bdd6e38a1ed5ee58d8bd@syzkaller.appspotmail.com
>      Cc: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>
>      Cc: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
>      Cc: Kuniyuki Iwashima <kuni1840@gmail.com>
>      Cc: "Soheil Hassas Yeganeh" <soheil@google.com>
>      Cc: Davidlohr Bueso <dave@stgolabs.net>
>      Cc: "Sridhar Samudrala" <sridhar.samudrala@intel.com>
>      Cc: Alexander Duyck <alexander.h.duyck@intel.com>
>      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>      Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
>   include/linux/list.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Reverting above change fixes v5.18.3 boot.
> 
> It seems the most significant byte of the "ldd -10(r3),rp" instruction in mpt_reply has been
> set to 0:
> 
>      4084:       bf 80 21 18     cmpb,*<> r0,ret0,4118 <mpt_reply+0x1b8>
>      4088:       08 04 02 5b     copy r4,dp
>      408c:       00 00 04 00     sync
>      4090:       0c 61 10 c2     ldd -10(r3),rp
> 
> See IIR value in crash output.

The commit was added to prevent compiler optimisation from splitting
read/write operations.  I think it can lead in a change in opcodes but
must be safe.  So I'm not sure why the commit causes boot failure for now.

I'm not familiar with PARISC and this may be a stupid question though,
what does `ldd` exactly do? and which line is it executed in the func/file?


> On 2022-06-09 2:13 p.m., John David Anglin wrote:
> > [...]
> > ata3: SATA link down (SStatus 0 SControl 0)
> >       _______________________________
> >      < Your System ate a SPARC! Gah! >
> >       -------------------------------
> >              \   ^__^
> >                  (__)\       )\/\
> >                   U  ||----w |
> >                      ||     ||
> > swapper/0 (pid 0): Illegal instruction (code 8)
> > CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.18.3+ #1
> > Hardware name: 9000/785/C8000
> >
> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00001000000001000001101100001110 Not tainted
> > r00-03  0000000008041b0e 000000004e8045b0 0000000010bbda78 000000004e804470
> > r04-07  0000000010bb5000 0000000000001440 0000000054355000 0000000000001400
> > r08-11  0000000055000000 000000000000000e 000000000000000f 0000000055002800
> > r12-15  0000000000000000 0000000055002800 0000000040b668c0 0000000040b668c0
> > r16-19  0000000000000001 0000000000000001 0000000051b799f0 0000000000000000
> > r20-23  0000000000000001 fffffffffffff5b9 0000000000000000 0000000000200000
> > r24-27  000000000000000c 000000000800000e 0000000054355144 0000000040b3e0c0
> > r28-31  0000000000010001 000000004e804620 000000004e8045b0 0000000040edd040
> > sr00-03  00000000000a5c00 0000000000000000 0000000000000000 00000000000a5c00
> > sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> >
> > IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000010bbd9e0 0000000010bbd9e4
> >  IIR: 006110c2    ISR: 0000000010240000  IOR: 00000003b76dd048
> >  CPU:        0   CR30: 0000000040edd040 CR31: ffffffffffffffff
> >  ORIG_R28: 0000000000000000
> >  IAOQ[0]: mpt_reply+0x130/0x4f0 [mptbase]
> >  IAOQ[1]: mpt_reply+0x134/0x4f0 [mptbase]
> >  RP(r2): mpt_reply+0x1c8/0x4f0 [mptbase]
> > Backtrace:
> >  [<0000000010bbde24>] mpt_interrupt+0x84/0xe8 [mptbase]
> >  [<000000004026dd64>] __handle_irq_event_percpu+0xc4/0x250
> >  [<000000004026df28>] handle_irq_event_percpu+0x38/0xd8
> >  [<00000000402776c4>] handle_percpu_irq+0xb4/0xf0
> >  [<000000004026c90c>] generic_handle_irq+0x5c/0x90
> >  [<00000000401a20e4>] call_on_stack+0x18/0x24
> >
> > CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.18.3+ #1
> > Hardware name: 9000/785/C8000
> > Backtrace:
> >  [<00000000401a8cd8>] show_stack+0x70/0x90
> >  [<0000000040a8e238>] dump_stack_lvl+0xd8/0x128
> >  [<0000000040a8e2bc>] dump_stack+0x34/0x48
> >  [<00000000401a8efc>] die_if_kernel+0x1e4/0x3f8
> >  [<00000000401a9af4>] handle_interruption+0x59c/0xb58
> >  [<00000000401a107c>] intr_check_sig+0x0/0x3c

Can you decode these stacktraces with ./scripts/decode_stacktrace.sh ?


> > Kernel panic - not syncing: Fatal exception in interrupt
> >
> > v5.18.2 with similar config is okay.  The fault seems consistent. IIR contains illegal instruction.
> >
> > Attached config.

Also, can you forward this config to me?

Best regards,
Kuniyuki
