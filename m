Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADFF468D63
	for <lists+linux-parisc@lfdr.de>; Sun,  5 Dec 2021 22:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239108AbhLEVE0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Dec 2021 16:04:26 -0500
Received: from mta-mtl-002.bell.net ([209.71.208.12]:54770 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S239107AbhLEVE0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Dec 2021 16:04:26 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61977302018EBB9D
X-CM-Envelope: MS4xfEmiBaut0yDK06WWadNOLuZfMwYMgC+MFTxIHht/PAmFWG2AbX+P7LIN08nHdM6oMDLehOZpOSm8AKE0HL5auSDDILHUiEuDB7sksIHiVwUjqifP+SJ4
 PkDxacxCShsKkLbRGIZkgeq/3Bssgv6WJ3tMtjpCf4TF69uPP89qrHehspup+6FawTpA6PRBKL4037SW5J2fwuLyUEmpxbtKk+PrylvLN+cfK7cg+rM7azSJ
 69QWl76Zxo/Ac4dPEC6N17qxQgHvsKPSnO5SBIt8bkw=
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61ad2885
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=ZwG__ZSQdWtEkBWGsoIA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61977302018EBB9D; Sun, 5 Dec 2021 16:00:53 -0500
Message-ID: <8341244f-5db3-3dd0-5952-88e706eb9e81@bell.net>
Date:   Sun, 5 Dec 2021 16:00:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Your System ate a SPARC! Gah! in map_pages()
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <f3ba5c65-37d9-60a5-d2ae-19faa5dba384@bell.net>
 <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-05 3:46 p.m., Helge Deller wrote:
> On 12/5/21 20:33, John David Anglin wrote:
>> I'm seeing this on rp3440 fairly frequently.  Must have something to do with memory as it
>> doesn't seem to happen on my c8000.
>>
>> Freeing initrd memory: 20980K
>>        _______________________________
>>       < Your System ate a SPARC! Gah! >
>>        -------------------------------
>>               \   ^__^
>>                   (__)\       )\/\
>>                    U  ||----w |
>>                       ||     ||
>> swapper/0 (pid 1): Protection id trap (code 7)
>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.21+ #1
>> Hardware name: 9000/800/rp3440
>>
>>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>> PSW: 00001000000001101111111100001111 Not tainted
>> r00-03  000000ff0806ff0f 0000000040bf9180 0000000040ab40b8 000000004b618280
>> r04-07  0000000040b5c980 0000000000194000 0000000040f8c800 0000000040193000
>> r08-11  0000000040f90000 0000000000000800 0000000000200000 0000000000100000
>> r12-15  0000000000e00000 0000000000200000 0000000040b79180 0000000000000001
>> r16-19  0000000040bf9980 0000000040b79180 0000000000000001 0000000000000000
>> r20-23  0000000000000008 0000000000000323 0000000000193323 0000000000000323
>> r24-27  0000000000000001 0000000000000400 0000000040100000 0000000040b5c980
>> r28-31  0000000040f8fca0 000000004b618250 000000004b618390 0000000040f8e000
>> sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>
>> IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004010765c 0000000040107660
>>   IIR: 43ffff40    ISR: 0000000000000000  IOR: 0000000000000000
>>   CPU:        0   CR30: 000000004b618000 CR31: ffffffffffffffff
>>   ORIG_R28: 000000004b618570
>>   IAOQ[0]: map_pages+0x2fc/0x378
>>   IAOQ[1]: map_pages+0x300/0x378
>>   RP(r2): free_initmem+0xf8/0x210
>> Backtrace:
>>   [<0000000040ab40b8>] free_initmem+0xf8/0x210
>>   [<0000000040ab3d28>] kernel_init+0xa0/0x338
>>   [<0000000040202020>] ret_from_kernel_thread+0x20/0x28
>>
>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.21+ #1
>> Hardware name: 9000/800/rp3440
>> Backtrace:
>>   [<000000004020a3a0>] show_stack+0x70/0x90
>>   [<0000000040aadf98>] dump_stack_lvl+0xd8/0x128
>>   [<0000000040aae01c>] dump_stack+0x34/0x48
>>   [<000000004020a5e4>] die_if_kernel+0x204/0x430
>>   [<000000004020afd8>] handle_interruption+0x550/0xc78
>>   [<0000000040203080>] intr_check_sig+0x0/0x3c
>>
>>     10574:       43 ff ff 40     ldb 1fa0(sr3,r31),r31
> This IIR is strange. We most likely don't touch userspace at this stage
> when the kernel boots, and...
Yes.  I think mapping for map_pages() must be corrupt.  It's a bit strange that the code ran as
far as it did into map_pages().
>   
>>      4010765c:   bd 1c 3e 7d     cmpb,*<> ret0,r8,401075a0 <map_pages+0x240>
>>      40107660:   34 e7 20 00     ldo 1000(r7),r7
> it doesn't fit with this dump at IAOQ.
Yes.
>
>
> Does it boot if you remove the __init in front of map_pages?
I'll try.  I thought of trying it but wasn't sure if map_pages() had to be an init routine or not.

I should have said this fault occurs randomly.  Sometimes kernel boots and runs okay.

Dave

-- 
John David Anglin  dave.anglin@bell.net

