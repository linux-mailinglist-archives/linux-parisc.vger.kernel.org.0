Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 672B577A5A3
	for <lists+linux-parisc@lfdr.de>; Sun, 13 Aug 2023 10:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjHMIni (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 13 Aug 2023 04:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjHMInh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 13 Aug 2023 04:43:37 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41A3170C
        for <linux-parisc@vger.kernel.org>; Sun, 13 Aug 2023 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691916204; x=1692521004; i=deller@gmx.de;
 bh=WryvoJxVcC7uGyEv46ciB04y370UTaHjsnih5kWhlWM=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=cczcZpNhk0hkaCAD2Y0+lHRmqWEAmvR3AFgjprrNQMKNIztpMs+Oa+5loXjbYspvv2wLEFi
 OUoaRqj9+qPbqAM7bMTlkhFRwPV+2gXuhuJR5JOsAMkTFlgXZ9BeYqJ5tCLs1Mo56o4aQ378x
 15KwK7vt8KJEMCbhuRdFhjccxyQMvjJvPeLvyKrg/qBzmEY9NnnWdKtpkMvibNBmplFUQk+Wx
 B1keocASkc/uQkFWTjj1Ipuu2qsgYc17e/5bcovMwsnYRMQFmWJmvzR9TcCDz3UVroHMFOxDS
 d3CwZPCIfEaBJx2kgJFw2JET7F9x0OLnEMGp9+k0AVyeRafL+uNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.141]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5iZ-1qEwkj0pQj-00J4OM; Sun, 13
 Aug 2023 10:43:24 +0200
Message-ID: <711de21b-1b5a-c3a5-6a11-de44334c7003@gmx.de>
Date:   Sun, 13 Aug 2023 10:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: 6.4.10 failed boot
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     Sam James <sam@gentoo.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
References: <87msyvjr9o.fsf@gentoo.org>
 <93137dbc-4505-e5e8-b2fe-da256c347295@gmx.de>
In-Reply-To: <93137dbc-4505-e5e8-b2fe-da256c347295@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fvn/Jp45cCX2q9Qex8VPHIbgwBu2XWb1J39h+7gu5qaosKSfR3m
 4hOtO0CZV3NcT5WHcTJn5YUUSBIFalRBW2ntel2wdEGA4mo2oz697OSmxUGEFmARs2ta6OA
 7FnOXZDrMsIYiAZ8dBJLGzDFxKf0lIEoZvEN5eO2/MCCn3ys78HMTn2HonsWedxU8hMF0Fm
 1YadyOHuGzQo0S+z9+jiQ==
UI-OutboundReport: notjunk:1;M01:P0:DiVkQlpnPWc=;B98HUVyobAyrtyQx8uU7mfCCvRb
 Us5q4aTFeaecf3mNM/+vWz8VNcRYvF+FFVqQsoV246tdJjvfv8cXE/9KKww9RjyO7RW3xyJRM
 c3HMyv96wHGYGpifGSLggdJYSfGHPekdPgXdZEmgsjevpoCq3Zbzy0hPnvvsg1jaKIDM/Gpg5
 yAWpgmAy8TmOfVe7U0wqSrapQ3JDcLTPoYbBAeP4jXPbT8zwR8+lx0O2Fd9Vxhqsi9FD6B1nO
 floBxxmt+078wWeSn20np76ScHTM4+KriFJ0RfNIQ79ZeDgVbs6+ab0bx4dOLbmyrOjgpJpGK
 TtUU2Ys5yV4N2sDg85zFsxRF1Yeg3xlVxEHCsojzGYIepLkBalcptoqYGnBLfxy2xM4Pz+yhp
 S50rALKb+tUzAQC81NyL8rjWGRRyKsrH5Son5TCOO0apsZkGy0zacV7nZVieDv5rmuyhWyABt
 JO/2RZunodnAonqX+52Zcwf0Bvqaw6z54FjCsCzoPOLL2C3cczNh152vRMyHi53+LUZvRhCVz
 LsyrZ0Lbr53osFZX6orpKZ0FTgY/zUeTCzJqggEVB8tH3Bl3ikGEiEUucob5n1nVKs4hyNNU3
 XQ7Sgb9xn0AMytY3mXHmRbBUUMTxrASMVgh4NW/cZmFlnosNzg0CO7lqjPw8GvH35AXxjZdoy
 k4MGaGJ90aLB0hyjbd+sRAU2C0zgLKjvBewfwOHF57IA9g3JSJ4CH03e8NFFDZrv8Ra0PUKHr
 8Rt2CGBfyLAcIEYBb+64BcxCGzu1DXig4csWBK9nNBYjZpzrQQQNiEV1ArVxM3FDjIqh5c2TM
 VdlJLTMahIOnZ5GWwx+ms+vgyb8IlAmLhNgO1oScXXaAqXAZNccRcoDFGX3VVE7tLqW7p0Q19
 OV5zFhyvAPePtQzXckoSQCEMlOukt6SuX8ELJTKjThrymcpnBKWsTmAegQaNid9bZSaTA3k/u
 qK1sCQ==
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/13/23 10:38, Helge Deller wrote:
> On 8/13/23 10:09, Sam James wrote:
>> Upgrading from 6.1.37 or so to 6.4.10, I get:
>> ```
>> [...]
>> devtmpfs: mounted
>> Freeing unused kernel image (initmem) memory: 656K
>> Write protected read-only-after-init data: 41k
>> Run /sbin/init as init process
>> process 'usr/lib/systemd/systemd' started with executable stack
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _______________________________
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 < Your System ate a SPARC! Gah! >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -------------------------------
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \=C2=A0=C2=A0 ^__^
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (__)\=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 )\/\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U=C2=A0 ||----w |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ||=C2=A0=C2=A0=
=C2=A0=C2=A0 ||
>> init (pid 1): Spinlock was trashed (code 1)
>> CPU: 1 PID: 1 Comm: init Not tainted 6.4.10 #1
>> Hardware name: 9000/800/rp3440
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>> PSW: 00001000000001001111111100001111 Not tainted
>> r00-03=C2=A0 000000ff0804ff0f 000000004b4e8de0 00000000404021d8 0000000=
04b4e8e80
>> r04-07=C2=A0 0000000040f4bda0 000000004b64c000 000000004b699800 0000000=
04d1ad000
>> r08-11=C2=A0 000000004b699864 000000000c574000 0000000000000000 0000000=
040001e1c
>> r12-15=C2=A0 0000000000001000 0000000040ed5900 0000000000000001 0000000=
000000000
>> r16-19=C2=A0 000003fff0fff000 000000004101d5a0 0000000040f8d5a0 0000000=
000001a46
>> r20-23=C2=A0 0000000000000000 0000000000000000 0000000000000000 0000000=
000000080
>> r24-27=C2=A0 0000000000000000 0000000000000000 000000004b699864 0000000=
040f4bda0
>> r28-31=C2=A0 00000000000ce800 000000004b4e8e50 000000004b4e8ec0 0000000=
0000ce800
>> sr00-03=C2=A0 0000000000000000 0000000000000000 0000000000000000 000000=
00000ce800
>> sr04-07=C2=A0 0000000000000000 0000000000000000 0000000000000000 000000=
0000000000
>>
>> IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040e8466c 00000000=
40e84670
>> =C2=A0 IIR: 0000c006=C2=A0=C2=A0=C2=A0 ISR: 0000000010240000=C2=A0 IOR:=
 0000002da6699864
>> =C2=A0 CPU:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0 CR3=
0: 000000004b46a010 CR31: ffffffffffffffff
>> =C2=A0 ORIG_R28: 0000000000000000
>> =C2=A0 IAOQ[0]: _raw_spin_lock+0x1c/0x58
>> =C2=A0 IAOQ[1]: _raw_spin_lock+0x20/0x58
>> =C2=A0 RP(r2): __pmd_alloc+0xb8/0x1b8
>> Backtrace:
>> =C2=A0 [<00000000404021d8>] __pmd_alloc+0xb8/0x1b8
>> =C2=A0 [<00000000404165c8>] move_page_tables.part.0+0x788/0x7a0
>> =C2=A0 [<0000000040417630>] move_page_tables+0x38/0x50
>> =C2=A0 [<000000004047f82c>] shift_arg_pages+0x12c/0x2f0
>> =C2=A0 [<000000004047fc28>] setup_arg_pages+0x238/0x390
>> =C2=A0 [<000000004051b538>] load_elf_binary+0x660/0x1b38
>> =C2=A0 [<0000000040480f54>] bprm_execve+0x41c/0x8c8
>> =C2=A0 [<000000004048323c>] kernel_execve+0x20c/0x2b8
>> =C2=A0 [<0000000040e63924>] run_init_process+0x164/0x198
>> =C2=A0 [<0000000040e63990>] try_to_run_init_process+0x38/0xa0
>> =C2=A0 [<0000000040e81dd0>] kernel_init+0x290/0x340
>> =C2=A0 [<00000000401a6020>] ret_from_kernel_thread+0x20/0x28
>>
>> CPU: 1 PID: 1 Comm: init Not tainted 6.4.10 #1
>> Hardware name: 9000/800/rp3440
>> Backtrace:
>> =C2=A0 [<00000000401ae4a8>] show_stack+0x70/0x90
>> =C2=A0 [<0000000040e80d88>] dump_stack_lvl+0xd8/0x128
>> =C2=A0 [<0000000040e80e0c>] dump_stack+0x34/0x48
>> =C2=A0 [<00000000401ae6b8>] die_if_kernel+0x1d0/0x388
>> =C2=A0 [<00000000401af6c8>] handle_interruption+0xbe0/0xcd8
>> =C2=A0 [<00000000401a707c>] intr_check_sig+0x0/0x3c
>>
>> Kernel panic - not syncing: Fatal exception
>> ```
>>
>> Note that I did apply
>> 1. https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.=
git/tree/queue-6.4/io_uring-parisc-adjust-pgoff-in-io_uring-mmap-for-paris=
c.patch
>> 2. https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.=
git/tree/queue-6.4/parisc-fix-lightweight-spinlock-checks-to-not-break-fut=
exes.patch
>> on top of 6.4.10, which I thought would solve any spinlock problems.
>
> Hmm.. I thought patch 2 should have fixed it.
> Do you have TLB_PTLOCK enabled? If so, maybe I missed fixing that in pat=
ch (2)? I'll check..

I was right.
TLB_PTLOCK and LIGHTWEIGHT_SPINLOCK_CHECK currently can't be enabled at th=
e same
time, as it will then crash as shown above.

Please disable TLB_PTLOCK for now until I can come up with a patch.

Helge


> "Spinlock was trashed" is coming from CONFIG_LIGHTWEIGHT_SPINLOCK_CHECK.
> Disabling that config option should at least bring your kernel up.
>
> You might want to add this too:
> https://patchwork.kernel.org/project/linux-parisc/patch/ZNep5EcYskP9HtGD=
@p100/
> (lockdep: Fix static memory detection even more)
> But I don't think it's related.
>
> Helge

