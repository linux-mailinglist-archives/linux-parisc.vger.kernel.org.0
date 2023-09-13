Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D59F79F592
	for <lists+linux-parisc@lfdr.de>; Thu, 14 Sep 2023 01:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbjIMXgb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 Sep 2023 19:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjIMXga (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 Sep 2023 19:36:30 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3BCBCE4
        for <linux-parisc@vger.kernel.org>; Wed, 13 Sep 2023 16:36:25 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.126.114.79]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64C35282046CA8DC
X-CM-Envelope: MS4xfMIF59h6dyyrkhOwz4jetclbdWfsVAv1T3r/AqX9UbVr7+AYp31YMS59tJNRewNW4uxo5inn5iGXKG0wuEnKmT7fgSdc5E1FEecRirn6yPws2xwZvXnG
 2eweZiR0YdQ7XPWe/YAnTtw2/kCcQlaJyu6rTiV9H7JfmhCKJJzc2tx06PSlACJShoGMjB10nF52P4LJ9XlrSHIgh3qx+C3ecuxG2U1U37cfEtt/NWXRi+yu
 1GGdd54YRXen9LbGuFt6y8OLuIuRbGp8fSmnp5ttZRQ=
X-CM-Analysis: v=2.4 cv=W7Nb6Tak c=1 sm=1 tr=0 ts=65024775
 a=qwLmA0wx3TwW38sY+xTbUA==:117 a=qwLmA0wx3TwW38sY+xTbUA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=_EQBYfeKaf7-L8WA0awA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (142.126.114.79) by cmx-mtlrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64C35282046CA8DC; Wed, 13 Sep 2023 19:36:21 -0400
Message-ID: <dbd1d326-b863-b0fd-0956-060e23b4c5f8@bell.net>
Date:   Wed, 13 Sep 2023 19:36:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: _swap_info_get: Bad swap file entry 600000000029dc48
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <4e1660db-0cd7-bb14-8079-b188a17eb014@bell.net>
In-Reply-To: <4e1660db-0cd7-bb14-8079-b188a17eb014@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-09-13 5:34 p.m., John David Anglin wrote:
> Hi Helge,
>
> The issues go on with Linus' tree on my c8000.  After disabling CDL, boot is successful but see these error messages:
>
> _swap_info_get: Bad swap file entry 600000000029dc48
> BUG: Bad page map in process (sd-close)  pte:14ee2418 pmd:00289443
> addr:0000000041206000 vm_flags:00100077 anon_vma:0000000053605c30 mapping:000006
> file:(null) fault:0x0 mmap:0x0 read_folio:0x0
> CPU: 3 PID: 1337 Comm: (sd-close) Not tainted 6.5.0+ #28
> Hardware name: 9000/785/C8000
> Backtrace:
>  [<000000004020a658>] show_stack+0x70/0x90
>  [<0000000040c7f094>] dump_stack_lvl+0xec/0x150
>  [<0000000040c7f12c>] dump_stack+0x34/0x48
>  [<000000004045d944>] print_bad_pte+0x24c/0x318
>  [<00000000404624c4>] zap_pte_range+0x1dc/0x750
>  [<0000000040462ccc>] unmap_page_range+0x234/0x450
>  [<0000000040463088>] unmap_vmas+0xe0/0x180
>  [<0000000040473608>] exit_mmap+0x1a8/0x590
>  [<0000000040235574>] mmput+0x14c/0x350
>  [<0000000040245acc>] do_exit+0x4d4/0xd08
>  [<00000000402465d8>] sys_exit+0x30/0x38
>  [<0000000040203e5c>] syscall_exit+0x0/0x10
>
> Disabling lock debugging due to kernel taint
> _swap_info_get: Bad swap offset entry 100000000000000
> BUG: Bad page map in process (sd-close)  pte:8000000000000000 pmd:00289443
> addr:0000000041207000 vm_flags:00100077 anon_vma:0000000053605c30 mapping:000007
> file:(null) fault:0x0 mmap:0x0 read_folio:0x0
> CPU: 3 PID: 1337 Comm: (sd-close) Tainted: G    B 6.5.0+ #28
> Hardware name: 9000/785/C8000
> Backtrace:
>  [<000000004020a658>] show_stack+0x70/0x90
>  [<0000000040c7f094>] dump_stack_lvl+0xec/0x150
>  [<0000000040c7f12c>] dump_stack+0x34/0x48
>  [<000000004045d944>] print_bad_pte+0x24c/0x318
>  [<00000000404624c4>] zap_pte_range+0x1dc/0x750
>  [<0000000040462ccc>] unmap_page_range+0x234/0x450
>  [<0000000040463088>] unmap_vmas+0xe0/0x180
>  [<0000000040473608>] exit_mmap+0x1a8/0x590
>  [<0000000040235574>] mmput+0x14c/0x350
>  [<0000000040245acc>] do_exit+0x4d4/0xd08
>  [<00000000402465d8>] sys_exit+0x30/0x38
>  [<0000000040203e5c>] syscall_exit+0x0/0x10
>
> _swap_info_get: Bad swap file entry 5000000001ffff65
> BUG: Bad page map in process (sd-close)  pte:ffffb0b4 pmd:00289443
> addr:000000004120a000 vm_flags:00100077 anon_vma:0000000053605c30 mapping:00000a
> file:(null) fault:0x0 mmap:0x0 read_folio:0x0
> CPU: 3 PID: 1337 Comm: (sd-close) Tainted: G    B 6.5.0+ #28
> Hardware name: 9000/785/C8000
> Backtrace:
>  [<000000004020a658>] show_stack+0x70/0x90
>  [<0000000040c7f094>] dump_stack_lvl+0xec/0x150
>  [<0000000040c7f12c>] dump_stack+0x34/0x48
>  [<000000004045d944>] print_bad_pte+0x24c/0x318
>  [<00000000404624c4>] zap_pte_range+0x1dc/0x750
>  [<0000000040462ccc>] unmap_page_range+0x234/0x450
>  [<0000000040463088>] unmap_vmas+0xe0/0x180
>  [<0000000040473608>] exit_mmap+0x1a8/0x590
>  [<0000000040235574>] mmput+0x14c/0x350
>  [<0000000040245acc>] do_exit+0x4d4/0xd08
>  [<00000000402465d8>] sys_exit+0x30/0x38
>  [<0000000040203e5c>] syscall_exit+0x0/0x10
>
> _swap_info_get: Unused swap offset entry 00001000
> BUG: Bad page map in process (sd-close)  pte:00080000 pmd:00289443
> addr:000000004120b000 vm_flags:00100077 anon_vma:0000000053605c30 mapping:00000b
> file:(null) fault:0x0 mmap:0x0 read_folio:0x0
> CPU: 3 PID: 1337 Comm: (sd-close) Tainted: G    B 6.5.0+ #28
> Hardware name: 9000/785/C8000
> Backtrace:
>  [<000000004020a658>] show_stack+0x70/0x90
>  [<0000000040c7f094>] dump_stack_lvl+0xec/0x150
>  [<0000000040c7f12c>] dump_stack+0x34/0x48
>  [<000000004045d944>] print_bad_pte+0x24c/0x318
>  [<00000000404624c4>] zap_pte_range+0x1dc/0x750
>  [<0000000040462ccc>] unmap_page_range+0x234/0x450
>  [<0000000040463088>] unmap_vmas+0xe0/0x180
>  [<0000000040473608>] exit_mmap+0x1a8/0x590
>  [<0000000040235574>] mmput+0x14c/0x350
>  [<0000000040245acc>] do_exit+0x4d4/0xd08
>  [<00000000402465d8>] sys_exit+0x30/0x38
>  [<0000000040203e5c>] syscall_exit+0x0/0x10
>
> BUG: Bad rss-counter state mm:000000008461a162 type:MM_ANONPAGES val:16
> BUG: Bad rss-counter state mm:000000008461a162 type:MM_SWAPENTS val:-4
> [  OK  ] Started getty@tty1.service - Getty on tty1.
> [  OK  ] Started serial-getty@ttyS0.service - Serial Getty on ttyS0.
> [  OK  ] Reached target getty.target - Login Prompts.
> [  OK  ] Started apt-cacher-ng.service - Apt-Cacher NG software download proxy.
>
> Debian GNU/Linux trixie/sid atlas ttyS0
>
> atlas login: systemd-journald[976]: Time jumped backwards, rotating.
>
> These probably sre due to Willy's folio changes.  This is at e56b2b6057996c5f48da518c79d6590f8bfaabf3.
>
> I'll see if 6.5.3 works...
v6.5.3 boats fine with the fix from Masahiro Yamada and CDL disabled.  I wasn't able to reproduce the above
bugs in a couple more reboots with 6.5.0+.

Dave

-- 
John David Anglin  dave.anglin@bell.net

