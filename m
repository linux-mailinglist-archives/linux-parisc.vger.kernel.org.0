Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0494C44F3BD
	for <lists+linux-parisc@lfdr.de>; Sat, 13 Nov 2021 15:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbhKMOeh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 Nov 2021 09:34:37 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:40298 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230001AbhKMOeg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 Nov 2021 09:34:36 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C894590BB63A2B
X-CM-Envelope: MS4xfMAipfIWkSgasVn25+nAA+HirTNvKv4ZoimePRX11+t0A6BbUvRHx1Y2EhozpL3lUCe5xyJrDF2d+4kqLn47WO6epZwHzeDHnT2f2Cn8hOERQI/nkJ89
 Dcn65tehm2psYB0FBzm0wNDWJl3UylqkKfpKWOVV1DP+4YMuNK0/QESc2Ivfe5hbQ/HeCAjptmOK0Qh/Ji0iY487uHL2a39v3C/JRbP9WuVpnzXRmtTarlnb
 lwszmcvT1TsMer4nTNybXhKRyBsfLzYI9bEEKvI1W6LeFB7d3I59xTkMOz7HxserEY/gHfNJKBpJhY9o2GszhA==
X-CM-Analysis: v=2.4 cv=ENdlb3VC c=1 sm=1 tr=0 ts=618fcc47
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=ZysoHL1CAAAA:8 a=FBHGMhGWAAAA:8 a=lhdqfN3uo5NII3neZsYA:9
 a=QEXdDO2ut3YA:10 a=5AXFdVBGJ8Jq6-3WnMNo:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C894590BB63A2B; Sat, 13 Nov 2021 09:31:35 -0500
Message-ID: <4e646a27-e5ae-ad8b-a2d6-d3a849688da9@bell.net>
Date:   Sat, 13 Nov 2021 09:31:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] parisc/entry: fix trace test in syscall exit path
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
References: <20211111220429.797-1-svens@stackframe.org>
 <87tughalkk.fsf@x1.stackframe.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <87tughalkk.fsf@x1.stackframe.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-12 2:18 a.m., Sven Schnelle wrote:
> Sven Schnelle <svens@stackframe.org> writes:
>
>> commit 8779e05ba8aa ("parisc: Fix ptrace check on syscall return")
>> fixed testing of TI_FLAGS. This uncovered a bug in the test mask.
>> syscall_restore_rfi is only used when the kernel needs to exit to
>> usespace with single stepping via recovery counter enabled. The test
>> however used _TIF_SYSCALL_TRACE_MASK, which includes a lot of bits
>> that shouldn't be tested here.
>>
>> Fix this by using TIF_SINGLESTEP and TIF_BLOCKSTEP directly and
>> remove those bits from TIF_SYSCALL_TRACE_MASK.
> I think we need to have TIF_SINGLESTEP and TIF_BLOCKSTEP in
> TIF_SYSCALL_TRACE_MASK otherwise do_syscall_trace_exit() isn't
> called when leaving to userspace. I'll read the code a bit more
> during the weekend and prepare a v2.
Signal delivery is broken in 5.16.x.  This causes a number of glibc and ada test regressions.

-- 
John David Anglin  dave.anglin@bell.net

