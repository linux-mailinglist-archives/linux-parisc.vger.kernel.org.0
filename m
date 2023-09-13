Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F9479F3E2
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Sep 2023 23:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjIMVfL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 Sep 2023 17:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbjIMVfK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 Sep 2023 17:35:10 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-003.bell.net [209.71.208.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6E11E1739
        for <linux-parisc@vger.kernel.org>; Wed, 13 Sep 2023 14:35:06 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.126.114.79]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64C35282046ACA2F
X-CM-Envelope: MS4xfMi8wlgZwZR3ohxpFLxn7bD15LJp1wfK1BnTST7BqhJkPh/8AZkwx4vmWHOlndzveJhhzHht+YAHzye5O7ti9hH3+mEipnwsxCGuFw7ce6u8yso1vjsX
 5cVPWN0H7Uve+YpatPin+eWnhDoPspzpUmreFI5Jhoj2PEPxXB8Ss2VtUWSUkwAZujsjEj33QY50N7dIMADHHk+a/0H2tJQ01lKicI6hFtLGxlREXt78NAVy
 Fg3QTYKNUw+Irijr/aUH9SCQxlpRntoOXnSXpoFfOnM=
X-CM-Analysis: v=2.4 cv=W7Nb6Tak c=1 sm=1 tr=0 ts=65022b04
 a=qwLmA0wx3TwW38sY+xTbUA==:117 a=qwLmA0wx3TwW38sY+xTbUA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=_EQBYfeKaf7-L8WA0awA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (142.126.114.79) by cmx-mtlrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64C35282046ACA2F; Wed, 13 Sep 2023 17:35:00 -0400
Message-ID: <4e1660db-0cd7-bb14-8079-b188a17eb014@bell.net>
Date:   Wed, 13 Sep 2023 17:34:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
From:   John David Anglin <dave.anglin@bell.net>
Subject: _swap_info_get: Bad swap file entry 600000000029dc48
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

The issues go on with Linus' tree on my c8000.  After disabling CDL, boot is successful but see these error messages:

_swap_info_get: Bad swap file entry 600000000029dc48
BUG: Bad page map in process (sd-close)  pte:14ee2418 pmd:00289443
addr:0000000041206000 vm_flags:00100077 anon_vma:0000000053605c30 mapping:000006
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 3 PID: 1337 Comm: (sd-close) Not tainted 6.5.0+ #28
Hardware name: 9000/785/C8000
Backtrace:
  [<000000004020a658>] show_stack+0x70/0x90
  [<0000000040c7f094>] dump_stack_lvl+0xec/0x150
  [<0000000040c7f12c>] dump_stack+0x34/0x48
  [<000000004045d944>] print_bad_pte+0x24c/0x318
  [<00000000404624c4>] zap_pte_range+0x1dc/0x750
  [<0000000040462ccc>] unmap_page_range+0x234/0x450
  [<0000000040463088>] unmap_vmas+0xe0/0x180
  [<0000000040473608>] exit_mmap+0x1a8/0x590
  [<0000000040235574>] mmput+0x14c/0x350
  [<0000000040245acc>] do_exit+0x4d4/0xd08
  [<00000000402465d8>] sys_exit+0x30/0x38
  [<0000000040203e5c>] syscall_exit+0x0/0x10

Disabling lock debugging due to kernel taint
_swap_info_get: Bad swap offset entry 100000000000000
BUG: Bad page map in process (sd-close)  pte:8000000000000000 pmd:00289443
addr:0000000041207000 vm_flags:00100077 anon_vma:0000000053605c30 mapping:000007
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 3 PID: 1337 Comm: (sd-close) Tainted: G    B 6.5.0+ #28
Hardware name: 9000/785/C8000
Backtrace:
  [<000000004020a658>] show_stack+0x70/0x90
  [<0000000040c7f094>] dump_stack_lvl+0xec/0x150
  [<0000000040c7f12c>] dump_stack+0x34/0x48
  [<000000004045d944>] print_bad_pte+0x24c/0x318
  [<00000000404624c4>] zap_pte_range+0x1dc/0x750
  [<0000000040462ccc>] unmap_page_range+0x234/0x450
  [<0000000040463088>] unmap_vmas+0xe0/0x180
  [<0000000040473608>] exit_mmap+0x1a8/0x590
  [<0000000040235574>] mmput+0x14c/0x350
  [<0000000040245acc>] do_exit+0x4d4/0xd08
  [<00000000402465d8>] sys_exit+0x30/0x38
  [<0000000040203e5c>] syscall_exit+0x0/0x10

_swap_info_get: Bad swap file entry 5000000001ffff65
BUG: Bad page map in process (sd-close)  pte:ffffb0b4 pmd:00289443
addr:000000004120a000 vm_flags:00100077 anon_vma:0000000053605c30 mapping:00000a
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 3 PID: 1337 Comm: (sd-close) Tainted: G    B 6.5.0+ #28
Hardware name: 9000/785/C8000
Backtrace:
  [<000000004020a658>] show_stack+0x70/0x90
  [<0000000040c7f094>] dump_stack_lvl+0xec/0x150
  [<0000000040c7f12c>] dump_stack+0x34/0x48
  [<000000004045d944>] print_bad_pte+0x24c/0x318
  [<00000000404624c4>] zap_pte_range+0x1dc/0x750
  [<0000000040462ccc>] unmap_page_range+0x234/0x450
  [<0000000040463088>] unmap_vmas+0xe0/0x180
  [<0000000040473608>] exit_mmap+0x1a8/0x590
  [<0000000040235574>] mmput+0x14c/0x350
  [<0000000040245acc>] do_exit+0x4d4/0xd08
  [<00000000402465d8>] sys_exit+0x30/0x38
  [<0000000040203e5c>] syscall_exit+0x0/0x10

_swap_info_get: Unused swap offset entry 00001000
BUG: Bad page map in process (sd-close)  pte:00080000 pmd:00289443
addr:000000004120b000 vm_flags:00100077 anon_vma:0000000053605c30 mapping:00000b
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 3 PID: 1337 Comm: (sd-close) Tainted: G    B 6.5.0+ #28
Hardware name: 9000/785/C8000
Backtrace:
  [<000000004020a658>] show_stack+0x70/0x90
  [<0000000040c7f094>] dump_stack_lvl+0xec/0x150
  [<0000000040c7f12c>] dump_stack+0x34/0x48
  [<000000004045d944>] print_bad_pte+0x24c/0x318
  [<00000000404624c4>] zap_pte_range+0x1dc/0x750
  [<0000000040462ccc>] unmap_page_range+0x234/0x450
  [<0000000040463088>] unmap_vmas+0xe0/0x180
  [<0000000040473608>] exit_mmap+0x1a8/0x590
  [<0000000040235574>] mmput+0x14c/0x350
  [<0000000040245acc>] do_exit+0x4d4/0xd08
  [<00000000402465d8>] sys_exit+0x30/0x38
  [<0000000040203e5c>] syscall_exit+0x0/0x10

BUG: Bad rss-counter state mm:000000008461a162 type:MM_ANONPAGES val:16
BUG: Bad rss-counter state mm:000000008461a162 type:MM_SWAPENTS val:-4
[  OK  ] Started getty@tty1.service - Getty on tty1.
[  OK  ] Started serial-getty@ttyS0.service - Serial Getty on ttyS0.
[  OK  ] Reached target getty.target - Login Prompts.
[  OK  ] Started apt-cacher-ng.service - Apt-Cacher NG software download proxy.

Debian GNU/Linux trixie/sid atlas ttyS0

atlas login: systemd-journald[976]: Time jumped backwards, rotating.

These probably sre due to Willy's folio changes.  This is at e56b2b6057996c5f48da518c79d6590f8bfaabf3.

I'll see if 6.5.3 works...

Dave

-- 
John David Anglin  dave.anglin@bell.net

