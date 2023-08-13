Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E23377A5AF
	for <lists+linux-parisc@lfdr.de>; Sun, 13 Aug 2023 10:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjHMI6v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Sun, 13 Aug 2023 04:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjHMI6u (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 13 Aug 2023 04:58:50 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF96D10E5
        for <linux-parisc@vger.kernel.org>; Sun, 13 Aug 2023 01:58:52 -0700 (PDT)
References: <87msyvjr9o.fsf@gentoo.org>
 <93137dbc-4505-e5e8-b2fe-da256c347295@gmx.de>
 <711de21b-1b5a-c3a5-6a11-de44334c7003@gmx.de>
User-agent: mu4e 1.10.6; emacs 30.0.50
From:   Sam James <sam@gentoo.org>
To:     Helge Deller <deller@gmx.de>
Cc:     Sam James <sam@gentoo.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Subject: Re: 6.4.10 failed boot
Date:   Sun, 13 Aug 2023 09:58:03 +0100
Organization: Gentoo
In-reply-to: <711de21b-1b5a-c3a5-6a11-de44334c7003@gmx.de>
Message-ID: <87fs4njp2u.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


Helge Deller <deller@gmx.de> writes:

> On 8/13/23 10:38, Helge Deller wrote:
>> On 8/13/23 10:09, Sam James wrote:
>>> Upgrading from 6.1.37 or so to 6.4.10, I get:
>>> ```
>>> [...]
>>> devtmpfs: mounted
>>> Freeing unused kernel image (initmem) memory: 656K
>>> Write protected read-only-after-init data: 41k
>>> Run /sbin/init as init process
>>> process 'usr/lib/systemd/systemd' started with executable stack
>>>        _______________________________
>>>       < Your System ate a SPARC! Gah! >
>>>        -------------------------------
>>>               \   ^__^
>>>                   (__)\       )\/\
>>>                    U  ||----w |
>>>                       ||     ||
>>> init (pid 1): Spinlock was trashed (code 1)
>>> CPU: 1 PID: 1 Comm: init Not tainted 6.4.10 #1
>>> Hardware name: 9000/800/rp3440
>>>
>>>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>>> PSW: 00001000000001001111111100001111 Not tainted
>>> r00-03  000000ff0804ff0f 000000004b4e8de0 00000000404021d8 000000004b4e8e80
>>> r04-07  0000000040f4bda0 000000004b64c000 000000004b699800 000000004d1ad000
>>> r08-11  000000004b699864 000000000c574000 0000000000000000 0000000040001e1c
>>> r12-15  0000000000001000 0000000040ed5900 0000000000000001 0000000000000000
>>> r16-19  000003fff0fff000 000000004101d5a0 0000000040f8d5a0 0000000000001a46
>>> r20-23  0000000000000000 0000000000000000 0000000000000000 0000000000000080
>>> r24-27  0000000000000000 0000000000000000 000000004b699864 0000000040f4bda0
>>> r28-31  00000000000ce800 000000004b4e8e50 000000004b4e8ec0 00000000000ce800
>>> sr00-03  0000000000000000 0000000000000000 0000000000000000 00000000000ce800
>>> sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>
>>> IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040e8466c 0000000040e84670
>>>   IIR: 0000c006    ISR: 0000000010240000  IOR: 0000002da6699864
>>>   CPU:        1   CR30: 000000004b46a010 CR31: ffffffffffffffff
>>>   ORIG_R28: 0000000000000000
>>>   IAOQ[0]: _raw_spin_lock+0x1c/0x58
>>>   IAOQ[1]: _raw_spin_lock+0x20/0x58
>>>   RP(r2): __pmd_alloc+0xb8/0x1b8
>>> Backtrace:
>>>   [<00000000404021d8>] __pmd_alloc+0xb8/0x1b8
>>>   [<00000000404165c8>] move_page_tables.part.0+0x788/0x7a0
>>>   [<0000000040417630>] move_page_tables+0x38/0x50
>>>   [<000000004047f82c>] shift_arg_pages+0x12c/0x2f0
>>>   [<000000004047fc28>] setup_arg_pages+0x238/0x390
>>>   [<000000004051b538>] load_elf_binary+0x660/0x1b38
>>>   [<0000000040480f54>] bprm_execve+0x41c/0x8c8
>>>   [<000000004048323c>] kernel_execve+0x20c/0x2b8
>>>   [<0000000040e63924>] run_init_process+0x164/0x198
>>>   [<0000000040e63990>] try_to_run_init_process+0x38/0xa0
>>>   [<0000000040e81dd0>] kernel_init+0x290/0x340
>>>   [<00000000401a6020>] ret_from_kernel_thread+0x20/0x28
>>>
>>> CPU: 1 PID: 1 Comm: init Not tainted 6.4.10 #1
>>> Hardware name: 9000/800/rp3440
>>> Backtrace:
>>>   [<00000000401ae4a8>] show_stack+0x70/0x90
>>>   [<0000000040e80d88>] dump_stack_lvl+0xd8/0x128
>>>   [<0000000040e80e0c>] dump_stack+0x34/0x48
>>>   [<00000000401ae6b8>] die_if_kernel+0x1d0/0x388
>>>   [<00000000401af6c8>] handle_interruption+0xbe0/0xcd8
>>>   [<00000000401a707c>] intr_check_sig+0x0/0x3c
>>>
>>> Kernel panic - not syncing: Fatal exception
>>> ```
>>>
>>> Note that I did apply
>>> 1. https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/queue-6.4/io_uring-parisc-adjust-pgoff-in-io_uring-mmap-for-parisc.patch
>>> 2. https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/queue-6.4/parisc-fix-lightweight-spinlock-checks-to-not-break-futexes.patch
>>> on top of 6.4.10, which I thought would solve any spinlock problems.
>>
>> Hmm.. I thought patch 2 should have fixed it.
>> Do you have TLB_PTLOCK enabled? If so, maybe I missed fixing that in patch (2)? I'll check..
>
> I was right.
> TLB_PTLOCK and LIGHTWEIGHT_SPINLOCK_CHECK currently can't be enabled at the same
> time, as it will then crash as shown above.
>

You answered before I could even set up the new config, let alone build
it! :)

Speedy!

> Please disable TLB_PTLOCK for now until I can come up with a patch.

Ack, will do. Thank you for the fast response Helge!
>
> Helge
>
>
>> "Spinlock was trashed" is coming from CONFIG_LIGHTWEIGHT_SPINLOCK_CHECK.
>> Disabling that config option should at least bring your kernel up.
>>
>> You might want to add this too:
>> https://patchwork.kernel.org/project/linux-parisc/patch/ZNep5EcYskP9HtGD@p100/
>> (lockdep: Fix static memory detection even more)
>> But I don't think it's related.

Will do, given I'm building anyway. Thanks for the heads up.

>>
>> Helge

I'll test any patch when it is ready too.

best,
sam

