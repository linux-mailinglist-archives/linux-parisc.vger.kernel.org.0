Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D595928A779
	for <lists+linux-parisc@lfdr.de>; Sun, 11 Oct 2020 15:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387867AbgJKNVj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 11 Oct 2020 09:21:39 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:47094 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387864AbgJKNVi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 11 Oct 2020 09:21:38 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20201011132136.PSNT120733.mtlfep01.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 11 Oct 2020 09:21:36 -0400
Received: from [192.168.2.49] (really [70.53.61.197]) by mtlspm01.bell.net
          with ESMTP
          id <20201011132136.GXQU130487.mtlspm01.bell.net@[192.168.2.49]>;
          Sun, 11 Oct 2020 09:21:36 -0400
Subject: Re: [PATCH] parisc: Add MAP_UNINITIALIZED define
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20201010215431.GA30936@ls3530.fritz.box>
 <5ac6cd13-de63-c625-88a6-ba736480f79e@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <77faa98f-8e5e-0411-566b-2250aa27e507@bell.net>
Date:   Sun, 11 Oct 2020 09:21:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <5ac6cd13-de63-c625-88a6-ba736480f79e@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=6x1y2OhCX1CAR/Lk3lU3cg==:117 a=6x1y2OhCX1CAR/Lk3lU3cg==:17 a=IkcTkHD0fZMA:10 a=afefHYAZSVUA:10 a=FBHGMhGWAAAA:8 a=kDPQ3qjozer-WAaxiPsA:9 a=DUjG6-FN2uFsYy6C:21 a=_-bH8QjYIpnqeZjg:21 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfEac8D7uYiB5nsPH6SdLRXlZ95zcZTssc26r0efdwsgzaxLLHuUNMdKZVGlQY3xPGYTfD0zSFsujXD1IeNBku+pJR9oPG/voBh3woVDCa0qZM0DvK06T m2rTZDVEg3qVSHtnDTSXX3boFF3E0uy542BHjtmuMJ9SMI1aPC7cUnYcptRhY5s+lYMK7/0Z2MNWWQ==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Yes, I believe it only should be nonzero in nommu case.

Dave

On 2020-10-11 7:56 a.m., Helge Deller wrote:
> On 10/10/20 11:54 PM, Helge Deller wrote:
>> Define MAP_UNINITIALIZED and use same value as other architectures.
>> Fixes build of debian foot package.
> I'm tempted to #define MAP_UNINITIALIZED to zero.
> That flag was invented for embedded usage, and becaue of security reasons
> we probably will never deliver uninitialized pages to userspace on parisc.
> So, defining it as 0 should be fine, as this fixes build errors and won't
> have any other (negative) effect.
> Thoughts?
>
> Helge
>
>
>> Suggested-by: John David Anglin <dave.anglin@bell.net>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
>> index 6fd8871e4081..d828b293b6de 100644
>> --- a/arch/parisc/include/uapi/asm/mman.h
>> +++ b/arch/parisc/include/uapi/asm/mman.h
>> @@ -25,6 +25,8 @@
>>  #define MAP_STACK	0x40000		/* give out an address that is best suited for process/thread stacks */
>>  #define MAP_HUGETLB	0x80000		/* create a huge page mapping */
>>  #define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
>> +#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
>> +					 * uninitialized */
>>
>>  #define MS_SYNC		1		/* synchronous memory sync */
>>  #define MS_ASYNC	2		/* sync memory asynchronously */
>> diff --git a/tools/arch/parisc/include/uapi/asm/mman.h b/tools/arch/parisc/include/uapi/asm/mman.h
>> index f9fd1325f5bd..c7af0f2292fc 100644
>> --- a/tools/arch/parisc/include/uapi/asm/mman.h
>> +++ b/tools/arch/parisc/include/uapi/asm/mman.h
>> @@ -39,6 +39,5 @@
>>  #define MADV_SOFT_OFFLINE 101
>>  /* MAP_32BIT is undefined on parisc, fix it for perf */
>>  #define MAP_32BIT	0
>> -/* MAP_UNINITIALIZED is undefined on parisc, fix it for perf */
>> -#define MAP_UNINITIALIZED	0
>> +#define MAP_UNINITIALIZED 0x4000000
>>  #endif
>>


-- 
John David Anglin  dave.anglin@bell.net

