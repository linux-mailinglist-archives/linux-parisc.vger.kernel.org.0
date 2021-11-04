Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC715445B92
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 22:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbhKDVT1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 17:19:27 -0400
Received: from mta-tor-003.bell.net ([209.71.212.30]:31806 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230162AbhKDVT1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 17:19:27 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C886880A69FAD4
X-CM-Envelope: MS4xfCFzp1mNL0JPH9Pgi0SVF3nWbtTJvjEvfKSS7NwiBSGIw15uJtLMef+uGZ0ZkIEghPj4x6CmNhNc0hwwGXfwKHfNXLGt0tpxjw/6l3jDi6WQ1D6NX4Qu
 Qm0e4I8/k78/FrKCHSoz7liRq4KZlAQ4rcon1+awLr9tf9o51L7x4a8g0r6njaTHKUTQc2JSyA/rNjftvRmbs5byW6lNZykKJ72Sq4bS6Ty3hkvT4OH1z0Ap
 Ix0bBm1sQC/1h+lBDoHVlGWnFZgSPWkP96EG1mXsqANWdHD4OFi67pfZBZCplNMEaXwbUNYEw8YTLd3soAyCkX1qWs3IqIRVNCoXuSLYMQkYqUxHCFjJ8Pt/
 ID0FbX4X
X-CM-Analysis: v=2.4 cv=Udwy9IeN c=1 sm=1 tr=0 ts=61844dbd
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=aSzLNtF_W6RQWML9uT4A:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C886880A69FAD4; Thu, 4 Nov 2021 17:16:45 -0400
Message-ID: <be51b4df-35df-f0f0-1763-c4421d01bd1d@bell.net>
Date:   Thu, 4 Nov 2021 17:16:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] parisc: Fix code/instruction patching on PA1.x machines
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Sven Schnelle <svens@stackframe.org>
References: <YX8HK7ZZZhjRQzcr@ls3530>
 <91b3d125-18ae-e10f-3000-1b17a43a156f@bell.net>
 <cf2c5fa8-5b98-50b7-00ef-0e86df918e8e@gmx.de>
 <a3568fd4-79be-798e-3078-60b187ddaea7@bell.net>
 <f8a7f1fa-dc97-224b-8726-25bb66653aa3@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <f8a7f1fa-dc97-224b-8726-25bb66653aa3@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-04 4:48 p.m., Helge Deller wrote:
> Here is the syslog with your patch on the 715/64:
> ...
> Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
> mem auto-init: stack:off, heap alloc:off, heap free:off
> Memory: 148832K/163840K available (8452K kernel code, 1461K rwdata, 2379K rodata, 696K init, 444K bss, 15008K reserved, 0K cma-reserved)
> ftrace: allocating 26912 entries in 53 pages
> Backtrace:
>   [<1097d588>] __patch_text+0x20/0x30
>   [<101c5128>] ftrace_make_nop+0x3c/0x68
>   [<102c98a8>] ftrace_process_locs.isra.0+0x208/0x2b0
>   [<10113ba0>] ftrace_init+0xa8/0x154
>   [<10101284>] start_kernel+0x3d0/0x708
>   [<10105244>] start_parisc+0xb8/0xec
>
> Bad Address (null pointer deref?): Code=15 (Data TLB miss fault) at addr 0effe310
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0-32bit+ #1017
> Hardware name: 9000/715
>
>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000011000000001100001110 Not tainted
> r00-03  000c030e 10c7cda8 1097d474 10c67340
> r04-07  10100314 00000000 10c672dc 10c7d328
> r08-11  00000000 00000000 10cbe5a8 00000000
> r12-15  10c75da8 10b2f800 10d7d5a8 00000001
> r16-19  00000000 00000002 00000000 08000240
> r20-23  10c67000 00000200 10100500 00000020
> r24-27  0efff000 0efff000 0effe310 10b915a8
> r28-31  0effe310 00000000 10c673c0 10279a68
> sr00-03  00000000 00000000 00000000 00000000
> sr04-07  00000000 00000000 00000000 00000000
>
> IASQ: 00000000 00000000 IAOQ: 1097d4e4 1097d480
>   IIR: 0f9312a8    ISR: 00000000  IOR: 0effe310
>   CPU:        0   CR30: 10c67000 CR31: f00effff
>   ORIG_R28: 00000000
>   IAOQ[0]: __patch_text_multiple+0xdc/0x12c
>   IAOQ[1]: __patch_text_multiple+0x78/0x12c
>   RP(r2): __patch_text_multiple+0x6c/0x12c
> Backtrace:
>   [<1097d588>] __patch_text+0x20/0x30
>   [<101c5128>] ftrace_make_nop+0x3c/0x68
>   [<102c98a8>] ftrace_process_locs.isra.0+0x208/0x2b0
>   [<10113ba0>] ftrace_init+0xa8/0x154
>   [<10101284>] start_kernel+0x3d0/0x708
>   [<10105244>] start_parisc+0xb8/0xec
> Kernel panic - not syncing: Bad Address (null pointer deref?)
The faulting instruction is "stw,ma r19,4(ret0)".  r19 contains nop instruction.  r28
contains the address being patched.  Where does it (0x0effe310) point in kernel?

It seems likely to me that TLB handler is broken and that's the reason for the bad address fault.
But maybe there's a map problem.

Dave

-- 
John David Anglin  dave.anglin@bell.net

