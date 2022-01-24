Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D883498693
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Jan 2022 18:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244481AbiAXRYH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Jan 2022 12:24:07 -0500
Received: from mta-tor-003.bell.net ([209.71.212.30]:10920 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S244485AbiAXRYG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Jan 2022 12:24:06 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61E5E7EC00991DD7
X-CM-Envelope: MS4xfGmdxtWn+Tu7NI3jhcveAAEyVD5qZSnO2mLR/QY5/OgAIKSyqm0MH85n7yNhWGFCHvz2QbP0JqwlNXlUA9Z2ClCbQyZZI44KJRHhKjnHGzh/jf7hDOSW
 shn4gAhr7yPJYuskSI6FZEKw3BJLErTtFm1knKsO22yhZEwVtmNCQspQ7GUJQEG+57W9VHoM3KkLP8E/BBDx7f63yyYQxGIkHN13YEYHTQ04awCUuggFcwmS
 hzQ46rOHhBHhpZYHpvoZg+tUtOrsAMkLSziBSBRLQLI=
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61eee0b1
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=ASZr-cBRkk2WVaI-VDkA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61E5E7EC00991DD7; Mon, 24 Jan 2022 12:24:01 -0500
Message-ID: <f872b4fc-2d26-5b89-c985-261966c9f49d@bell.net>
Date:   Mon, 24 Jan 2022 12:24:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: pagefaults and hang with 5.15.11
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
 <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net>
 <4372681.LvFx2qVVIh@eto.sf-tec.de> <2615489.mvXUDI8C0e@eto.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <2615489.mvXUDI8C0e@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-01-24 1:41 a.m., Rolf Eike Beer wrote:
>> So much for the moment.
> That was yesterday. And now I just got this:
>
> [1274934.746891] Bad Address (null pointer deref?): Code=15 (Data TLB miss fault) at addr 0000004140000018
> [1274934.746891] CPU: 3 PID: 5549 Comm: cmake Not tainted 5.15.4-gentoo-parisc64 #4
> [1274934.746891] Hardware name: 9000/785/C8000
> [1274934.746891]
> [1274934.746891]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [1274934.746891] PSW: 00001000000001001111111000001110 Not tainted
> [1274934.746891] r00-03  000000ff0804fe0e 0000000040bc9bc0 00000000406760e4 0000004140000000
> [1274934.746891] r04-07  0000000040b693c0 0000004140000000 000000004a2b08b0 0000000000000001
> [1274934.746891] r08-11  0000000041f98810 0000000000000000 000000004a0a7000 0000000000000001
> [1274934.746891] r12-15  0000000040bddbc0 0000000040c0cbc0 0000000040bddbc0 0000000040bddbc0
> [1274934.746891] r16-19  0000000040bde3c0 0000000040bddbc0 0000000040bde3c0 0000000000000007
> [1274934.746891] r20-23  0000000000000006 000000004a368950 0000000000000000 0000000000000001
> [1274934.746891] r24-27  0000000000001fff 000000000800000e 000000004a1710f0 0000000040b693c0
> [1274934.746891] r28-31  0000000000000001 0000000041f988b0 0000000041f98840 000000004a171118
> [1274934.746891] sr00-03  00000000066e5800 0000000000000000 0000000000000000 00000000066e5800
> [1274934.746891] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [1274934.746891]
> [1274934.746891] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000406760e8 00000000406760ec
> [1274934.746891]  IIR: 48780030    ISR: 0000000000000000  IOR: 0000004140000018
> [1274934.746891]  CPU:        3   CR30: 00000040e3a9c000 CR31: ffffffffffffffff
> [1274934.746891]  ORIG_R28: 0000000040acdd58
> [1274934.746891]  IAOQ[0]: sba_unmap_sg+0xb0/0x118
> [1274934.746891]  IAOQ[1]: sba_unmap_sg+0xb4/0x118
> [1274934.746891]  RP(r2): sba_unmap_sg+0xac/0x118
> [1274934.746891] Backtrace:
> [1274934.746891]  [<00000000402740cc>] dma_unmap_sg_attrs+0x6c/0x70
> [1274934.746891]  [<000000004074d6bc>] scsi_dma_unmap+0x54/0x60
> [1274934.746891]  [<00000000407a3488>] mptscsih_io_done+0x150/0xd70
> [1274934.746891]  [<0000000040798600>] mpt_interrupt+0x168/0xa68
> [1274934.746891]  [<0000000040255a48>] __handle_irq_event_percpu+0xc8/0x278
> [1274934.746891]  [<0000000040255c34>] handle_irq_event_percpu+0x3c/0xd8
> [1274934.746891]  [<000000004025ecb4>] handle_percpu_irq+0xb4/0xf0
> [1274934.746891]  [<00000000402548e0>] generic_handle_irq+0x50/0x70
> [1274934.746891]  [<000000004019a254>] call_on_stack+0x18/0x24
Faulting instruction is "ldw 18(r3),r24".  Address in $r3 (and $r5) seems bad.  Think the sglist argument
to sba_unmap_sg() is bad.  Don't have a clue as to why this might be.

There are a number of debug flags in the code in drivers/parisc/sba_iommu.c:

/*
** The number of debug flags is a clue - this code is fragile.
** Don't even think about messing with it unless you have
** plenty of 710's to sacrifice to the computer gods. :^)
*/

Grant was expert in this code.

Dave

-- 
John David Anglin  dave.anglin@bell.net

