Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62E4C77A5A2
	for <lists+linux-parisc@lfdr.de>; Sun, 13 Aug 2023 10:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjHMIiw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 13 Aug 2023 04:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjHMIiw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 13 Aug 2023 04:38:52 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02D11701
        for <linux-parisc@vger.kernel.org>; Sun, 13 Aug 2023 01:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691915918; x=1692520718; i=deller@gmx.de;
 bh=tHVtPLe+kAxETs9J2ZpjYGqZuEQxWRjvOE2XPNCetzc=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=YcNPjKN7iKXOAzaWA+isbdw7KcvaW9HeLjE4pbDV3SpGQOJIKkX6JnjNc3jEJcVFoLluAvQ
 L8IrAbrmxAntYnUmPPCS47ZJAVMOt5udpy97YnTqYOrVY+blqr/HbbYqUHBmCETfcoC8325kd
 a3FVjBI1yNsVZA2vPs78/TMV+XR1D/6R0A29DoGMMfPCLy4TBv2fheR6J5HiyFBA0NTXx2ZEl
 kaqJWbuKbrVN10yBx1H6nwS5TUp0Vot8MW9DFd9LqSuqoOza+NcwQ5GYH81t1nFUoHpjatv4H
 3E/LxM66rAYBAfkCUGzEq0MyfUFIjt+xSEMcT6xkuWwtk5dkuN0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.141]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvK0R-1peW473Vgn-00rL3p; Sun, 13
 Aug 2023 10:38:38 +0200
Message-ID: <93137dbc-4505-e5e8-b2fe-da256c347295@gmx.de>
Date:   Sun, 13 Aug 2023 10:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: 6.4.10 failed boot
Content-Language: en-US
To:     Sam James <sam@gentoo.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
References: <87msyvjr9o.fsf@gentoo.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <87msyvjr9o.fsf@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pINH1pOVwuhfa2+GYu5e0ZevaWQZSI+C6RXppNNyi1B4vk1zXe+
 yQ1PSYAq9DD2uWtbmdaLNhxnD5Edgse5OJY+bI1RGmrT1A/SGmAm+FDixMgY1MY7KFTuHi9
 9lFzSq+8p/LHspZKxvM+CxpTkebkWM6sLFFM/b3E5pkeKDNSq2YrUQ8F11ZX0zcSEBxXryZ
 GVs02VKnICpCfNTMXRTLA==
UI-OutboundReport: notjunk:1;M01:P0:V/UHyurzBsc=;jjs8B2W5WdE9k/z0HvFBmUkro00
 K2l5dGccDB8k9j+AhbQbI3lN3xc8vODzWBq2y6eKUYB217u78lSOY8UTGcpoV9tIayNdSyVOo
 xC6hx6QPa4en2JMO3u/TlV7HLqDCguxLbEkimYkuF1BivFd9PokTNca1yQWNn/QsmHH5pTboC
 8BxCBdRY/u6Ds0b4s5WnJ30cLWKYJw2qTWrCdrljjrKrAG9nRO0FG4wYS8MVV34i7FdIijneW
 QlBIydrn/sgkXBjEROOsl6u+O8GQB+JzpyeNCF5zUerS2TPt0zsZRSxqXPYLbGtz6hvb9awIB
 VQ+YB4/RDVhHZ8z5eAololwwdhVua8by/w2lxfVrhbQjKmN7BR+Rpwbz73qSgGRKX/aevO6yq
 4SvQrbJ+YBYYsAo/rAtJw9yYHDPZXMpIn1QrBmc0gUFMMWNW8T1tVWCTcqW9vAMBjvYkLatjW
 mlmiUl2zzV1RfEdgqRensIPNc7ncJQV1SWOctjEk8EurV58DyOKNRZF1IQ552aKkLVbm5zlBz
 3jvJXXP132Lj36Zjw0BZrXyuRKrRKNaA/Vlv/ytgKw61wZW3n/vNuBMt3Hlc0yR8eeQt/dALp
 MdEZghLVY4VfhE17NPAM2LmjYeO3USN7yVAavGp9087nwRPJneNDvusbaZ13hKOlO+GPCD8Ct
 sif7D6qJ4V1tCniDI67Jl0VpZXFqyH8Si4vs+rnKbHppg+0valCsjHq4onIoAh2nML3XcLDfV
 od/1rGZkw0EulhM7owaXNyGe+7cDrp7aktNPyaHl45cXwpOpHTfAigosm3qi7lQQtcXQw6/c6
 YWiMypkum3oJa3B2Z9QiEY1eQMwiw3KgYQD75X+JVHkh1XB0iGtRDB9WFXa3ZJx2e4HTXzKob
 vI3LeZC7eiRjBCK60a5emKfh8GtCipGbMXjqkKRCw6F3hkhHaHzK/dgtm/FsSKwpSEpapOysx
 4hjhfQ==
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/13/23 10:09, Sam James wrote:
> Upgrading from 6.1.37 or so to 6.4.10, I get:
> ```
> [...]
> devtmpfs: mounted
> Freeing unused kernel image (initmem) memory: 656K
> Write protected read-only-after-init data: 41k
> Run /sbin/init as init process
> process 'usr/lib/systemd/systemd' started with executable stack
>        _______________________________
>       < Your System ate a SPARC! Gah! >
>        -------------------------------
>               \   ^__^
>                   (__)\       )\/\
>                    U  ||----w |
>                       ||     ||
> init (pid 1): Spinlock was trashed (code 1)
> CPU: 1 PID: 1 Comm: init Not tainted 6.4.10 #1
> Hardware name: 9000/800/rp3440
>
>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001001111111100001111 Not tainted
> r00-03  000000ff0804ff0f 000000004b4e8de0 00000000404021d8 000000004b4e8=
e80
> r04-07  0000000040f4bda0 000000004b64c000 000000004b699800 000000004d1ad=
000
> r08-11  000000004b699864 000000000c574000 0000000000000000 0000000040001=
e1c
> r12-15  0000000000001000 0000000040ed5900 0000000000000001 0000000000000=
000
> r16-19  000003fff0fff000 000000004101d5a0 0000000040f8d5a0 0000000000001=
a46
> r20-23  0000000000000000 0000000000000000 0000000000000000 0000000000000=
080
> r24-27  0000000000000000 0000000000000000 000000004b699864 0000000040f4b=
da0
> r28-31  00000000000ce800 000000004b4e8e50 000000004b4e8ec0 00000000000ce=
800
> sr00-03  0000000000000000 0000000000000000 0000000000000000 00000000000c=
e800
> sr04-07  0000000000000000 0000000000000000 0000000000000000 000000000000=
0000
>
> IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040e8466c 000000004=
0e84670
>   IIR: 0000c006    ISR: 0000000010240000  IOR: 0000002da6699864
>   CPU:        1   CR30: 000000004b46a010 CR31: ffffffffffffffff
>   ORIG_R28: 0000000000000000
>   IAOQ[0]: _raw_spin_lock+0x1c/0x58
>   IAOQ[1]: _raw_spin_lock+0x20/0x58
>   RP(r2): __pmd_alloc+0xb8/0x1b8
> Backtrace:
>   [<00000000404021d8>] __pmd_alloc+0xb8/0x1b8
>   [<00000000404165c8>] move_page_tables.part.0+0x788/0x7a0
>   [<0000000040417630>] move_page_tables+0x38/0x50
>   [<000000004047f82c>] shift_arg_pages+0x12c/0x2f0
>   [<000000004047fc28>] setup_arg_pages+0x238/0x390
>   [<000000004051b538>] load_elf_binary+0x660/0x1b38
>   [<0000000040480f54>] bprm_execve+0x41c/0x8c8
>   [<000000004048323c>] kernel_execve+0x20c/0x2b8
>   [<0000000040e63924>] run_init_process+0x164/0x198
>   [<0000000040e63990>] try_to_run_init_process+0x38/0xa0
>   [<0000000040e81dd0>] kernel_init+0x290/0x340
>   [<00000000401a6020>] ret_from_kernel_thread+0x20/0x28
>
> CPU: 1 PID: 1 Comm: init Not tainted 6.4.10 #1
> Hardware name: 9000/800/rp3440
> Backtrace:
>   [<00000000401ae4a8>] show_stack+0x70/0x90
>   [<0000000040e80d88>] dump_stack_lvl+0xd8/0x128
>   [<0000000040e80e0c>] dump_stack+0x34/0x48
>   [<00000000401ae6b8>] die_if_kernel+0x1d0/0x388
>   [<00000000401af6c8>] handle_interruption+0xbe0/0xcd8
>   [<00000000401a707c>] intr_check_sig+0x0/0x3c
>
> Kernel panic - not syncing: Fatal exception
> ```
>
> Note that I did apply
> 1. https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.g=
it/tree/queue-6.4/io_uring-parisc-adjust-pgoff-in-io_uring-mmap-for-parisc=
.patch
> 2. https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.g=
it/tree/queue-6.4/parisc-fix-lightweight-spinlock-checks-to-not-break-fute=
xes.patch
> on top of 6.4.10, which I thought would solve any spinlock problems.

Hmm.. I thought patch 2 should have fixed it.
Do you have TLB_PTLOCK enabled? If so, maybe I missed fixing that in patch=
 (2)? I'll check..
"Spinlock was trashed" is coming from CONFIG_LIGHTWEIGHT_SPINLOCK_CHECK.
Disabling that config option should at least bring your kernel up.

You might want to add this too:
https://patchwork.kernel.org/project/linux-parisc/patch/ZNep5EcYskP9HtGD@p=
100/
(lockdep: Fix static memory detection even more)
But I don't think it's related.

Helge
