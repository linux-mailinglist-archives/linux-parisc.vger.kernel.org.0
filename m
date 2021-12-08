Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027C746D5AA
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Dec 2021 15:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235115AbhLHOc1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Dec 2021 09:32:27 -0500
Received: from mta-tor-001.bell.net ([209.71.212.28]:57110 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234866AbhLHOc1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Dec 2021 09:32:27 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197A9B101BA3A3E
X-CM-Envelope: MS4xfDyodAcpUjV2Wj46mL5jDoPiITyiimXx0We/w3f8aJIzZG1HvNwnarjSvRIAi7/p/X49FXozueAFC7lp5B/vqIezXOcY2rD/LHQjQUFzPLNv3EGFxgmA
 mVmzfL5D63117Hwkm6tfwKkDfPVV59AIwA3s7xN/Oj6aqI156pkDZaoHbdAgzTwlXiR8m4SZr7QZdAhXQs0GFItMs0L/pUeeISmjHdQgyQMDN/hpyp6wT6Te
 TZX/xXCys0kky3lxLWKZlpFrTSRo0Jf3usdHcOPZR61RTjsyilMi1RFWXWuZ0SAq
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61b0c122
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=FBHGMhGWAAAA:8 a=JmnvwTp5A00T_3fX__0A:9
 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197A9B101BA3A3E; Wed, 8 Dec 2021 09:28:50 -0500
Message-ID: <fb3f869d-d9c8-5997-c641-f0d7dc1aa4e6@bell.net>
Date:   Wed, 8 Dec 2021 09:28:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: glibc tst-minsigstksz-5 failure
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     deller@kernel.org
References: <c58ea7e4-f0df-3840-478e-0c3459aa4318@bell.net>
 <3b28b1a5-2a49-af75-bcf2-52eb114be348@gmx.de>
 <24997ae3-a6e2-9207-8935-9b52369f4fbb@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <24997ae3-a6e2-9207-8935-9b52369f4fbb@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-08 8:05 a.m., Helge Deller wrote:
> On 12/8/21 13:51, Helge Deller wrote:
>> On 12/7/21 22:47, John David Anglin wrote:
>>> The glibc tst-minsigstksz-5 test fails with a protection id trap.
>>> tst-minsigstksz (pid 19958): Protection id trap (code 7) at 00000000f5b00497
>>>
>>> The problem seems to be that the signal return trampoline is placed
>>> on the alternate stack but the alternate is not executable.  It is
>>> allocated by malloc.> ...
>>> Stacks are normally executable on hppa so the trampoline works.  But
>>> user code wouldn't normally make an alternate stack executable.
>> True, I think most people just forget that such architectures exist.
>>
>> Anyway, the glibc testcase is interesting.
>> The pretty similar sigaltstack testcase from LTP does work:
>> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/sigaltstack/sigaltstack01.c
>>
>> Both use malloc() to allocate the memory, the only difference is the size allocated.
>> If you change the glibc testcase to:
>> -- size_t stack_buffer_size = 64 * 1024 * 1024;
>> ++ size_t stack_buffer_size = SIGSTKSZ;
>> it allocates only 8kB instead of 64MB.
>> It seems glibc uses brk() in both cases, but when allocating 64MB it additionally adds a mmap() with READ/WRITE permissions only:
>> brk(0x606000)                           = 0x606000
>> mmap2(NULL, 67112960, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf303f000
>>
>> This will then break - as you mentioned - the signal handling on parisc.
>>
>> I see those options to fix it:/usr/include/hppa-linux-gnu/asm/signal.h:#define MINSIGSTKSZ    2048
I wonder about defining MINSIGSTKSZ to 2048 as it is smaller than a page.

mprotect requires a page aligned address.  Alternate stack isn't going to be page aligned if it is allocated by
malloc.  Malloc alignment isn't sufficient for nominal 64-byte stack alignment specified in runtime.
>> /usr/include/hppa-linux-gnu/asm/signal.h:#define SIGSTKSZ       8192
>>
>> a) Fix the application to map the memory +x
Doesn't fix problem..
>> b) Add some code to glibc to map the memory +x when sigaltstack is called.
See mprotect comment.
>> c) Add some (parisc-only) code to kernel to set the permission.
Again, I think region needs to be page aligned.
> Option d):
> Enhance the kernel to create a per-process new page and map it +rx into the userspace
> at process start time. Kernel sets up the page to contain the signal trampoline code.
>
> Option e):
> Finally implement vDSO, which then includes option d)
>
> With options d) and e) we could get completely rid of executable stacks.
I like the later two options.

Dave

-- 
John David Anglin  dave.anglin@bell.net

