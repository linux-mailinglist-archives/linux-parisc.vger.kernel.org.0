Return-Path: <linux-parisc+bounces-1753-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CD4924953
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jul 2024 22:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 781C11C2109F
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jul 2024 20:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151B320124E;
	Tue,  2 Jul 2024 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="2iA573rV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo001.bell.net (mta-mtl-005.bell.net [209.71.208.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E592D1B5813
	for <linux-parisc@vger.kernel.org>; Tue,  2 Jul 2024 20:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719952375; cv=none; b=RPXHLjfNEcorZoD0r3PrV6zuRGf+NiSfZRHnFV+itWdRmpX7PsxbnHmzQhaoU/JNWYddtYkMAJ77ODq5hhNmB9uC53vQqaT6LIxF/n5vbIkDbU6MJ+wD0QST41uvdVTGqKpRW9TxYb3uj2/38BPPYfhCAT1NFSLdWtQHhCzisyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719952375; c=relaxed/simple;
	bh=Fl3RIJk1Br1Tn5hr232zF16XHdkxuk1Fy2j92gRfSXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwosjPgr6k7QV0Rqp6BFj9rGs/BriwH4F5GJJOxZeMW44AAb3ux3zqxSZc714MVL3iaAYYuMUE6upml0JMri7x4NAG2z7G39jcY/wWMTey3YBmsAhWOe79sOPgdxrro0dARgUb6PBdLp2yKY++3/OG5cpU/yxvy0fJvqmyo0Dp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=2iA573rV; arc=none smtp.client-ip=209.71.208.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1719952372; 
        bh=v7tw7d2tm3RtpIN0khWzQjKLVMP4AmXBlKnpPEIT86c=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=2iA573rVZHs0yavSQFRtFL5gDOjB4Vw+JYR15Fm4Lj0Q8SHlVL4hO+SrZtmhgrJkKc2XhnrKw1YKHHjWInW2LN1JdlR0MtbTH10TfTZT+zm0mbOlv5nUu/6yf/FQ/PF/34UM+rZ1DPqv21KBDLsNOJRzc4rEBrbj4W1KhNT8wxdFkEyu3BNjFJ2+JjE4uwu2l88EDX7CQRnXv3TB/P9Fc8EZDMfh6fTQgeJi+qejl0emnSivSmAemUMkh/Z1NKeJ3hD1q/sZKkhHytX6q4bewxbkK/yyIKG/yuvaVRQgbtVr+/j25CP2uHKitxRBPdv5Xdp4Bm6/EJ+HoFSJDt14RQ==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 66828B64003EDD6D
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeeftddrudehgddugeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepjeelffffjeehgffgueehleegfeegueeigedtkeffgeduueetffegffejudekgfeunecukfhppeejtddrhedvrdduiedvrdeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpeejtddrhedvrdduiedvrdeijedpmhgrihhlfhhrohhmpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpnhgspghrtghpthhtohephedprhgtphhtthhopegrughhvghmvghrvhgrlhdriigrnhgvlhhlrgeslhhinhgrrhhordhorhhgpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggvlhhlvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihgstgdqrghlphhhrgesshhouhhrtggvfigrrhgvrdhorhhgpdhrtghpthhtoheplhhinhhugidqphgrrhhishgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrvghvkffr
	pegsrhgrshdqsggrshgvqdhothifrghonhdtledtieifqdhgrhgtqddvjedqjedtqdehvddqudeivddqieejrdgushhlrdgsvghllhdrtggr
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received-SPF: softfail (cmx-mtlrgo001.bell.net: domain bell.net does not
 designate 70.52.162.67 as permitted sender) identity=mailfrom;
 receiver=cmx-mtlrgo001.bell.net; client-ip=70.52.162.67;
 envelope-from=dave.anglin@bell.net; helo=[192.168.2.49];
Received: from [192.168.2.49] (70.52.162.67) by cmx-mtlrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 66828B64003EDD6D; Tue, 2 Jul 2024 16:29:07 -0400
Message-ID: <0067a9ae-fc83-4ad8-9278-3febd9f9c43a@bell.net>
Date: Tue, 2 Jul 2024 16:29:07 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hppa/vdso: Add wrappers for vDSO functions
To: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
 Helge Deller <deller@kernel.org>
Cc: libc-alpha@sourceware.org, linux-parisc@vger.kernel.org
References: <ZnXT9hNtYWLg9MID@carbonx1>
 <fd19f26c-0ebf-42ef-bfc3-686a82104d07@linaro.org>
 <47136a43-058f-4258-bd1b-3475fd7ea14a@gmx.de>
 <433fdb50-85e6-4b2d-8bd5-371b8cac4921@linaro.org> <Zn006zh2vSqfgii6@carbonx1>
 <4d89c58d-e23a-4e3a-b7ce-b02687985d8f@linaro.org>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <4d89c58d-e23a-4e3a-b7ce-b02687985d8f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Committed to glibc master.

Dave

On 2024-07-02 3:52 p.m., Adhemerval Zanella Netto wrote:
>
> On 27/06/24 06:46, Helge Deller wrote:
>> * Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>:
>>> On 25/06/24 16:48, Helge Deller wrote:
>>>> On 6/24/24 22:31, Adhemerval Zanella Netto wrote:
>>>>>
>>>>> On 21/06/24 16:26, Helge Deller wrote:
>>>>>> The upcoming parisc (hppa) v6.11 Linux kernel will include vDSO
>>>>>> support for gettimeofday(), clock_gettime() and clock_gettime64()
>>>>>> syscalls for 32- and 64-bit userspace.
>>>>>> The patch below adds the necessary glue code for glibc.
>>>>>>
>>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>>>
>>>>>> Changes in v2:
>>>>>> - add vsyscalls for 64-bit too
>>>>>>
>>>>>> diff -up ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org ./sysdeps/unix/sysv/linux/hppa/sysdep.h
>>>>>> --- ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org    2024-06-15 20:20:58.992000000 +0000
>>>>>> +++ ./sysdeps/unix/sysv/linux/hppa/sysdep.h    2024-06-21 19:19:02.132000000 +0000
>>>>>> @@ -468,6 +468,18 @@ L(pre_end):                    ASM_LINE_SEP    \
>>>>>>    #define CLOB_ARGS_1 CLOB_ARGS_2, "%r25"
>>>>>>    #define CLOB_ARGS_0 CLOB_ARGS_1, "%r26"
>>>>>>
>>>>>> +#define VDSO_NAME    "LINUX_6.11"
>>>>>> +#define VDSO_HASH    182951793
>>>>>> +
>>>>>> +#ifdef __LP64__
>>>>>> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>>>>>> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>>>>>> +#else
>>>>>> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>>>>>> +# define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
>>>>>> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>>>>>> +#endif /* __LP64__ */
>>>>>> +
>>>>>>    #endif    /* __ASSEMBLER__ */
>>>>> Not sure why you have added the gettimeofday support, currently 32 bits
>>>>> it is already routed to to clock_gettime (which will use
>>>>> __vdso_clock_gettime64 anyway).
>>>> Yep, you are right.
>>>> I actually didn't checked if it's being used but just saw it's defined
>>>> for other arches too, so I assumed it to be used.
>>>>
>>>>> For hppa to actually use, it would require to add a way to call it
>>>>> for !USE_IFUNC_GETTIMEOFDAY gettimeofday, which I am not it really be
>>>>> an improvement here.
>>>> Yes, that doesn't make sense.
>>>>
>>>> Looking at the code it seems riscv, sparc, arm, mips and s390 define it
>>>> too, without being used. Do you suggest we should remove gettimeofday
>>>> vsyscall from hppa again (or just keep like the others even if not being used)?
>>> The riscv only added it for CONFIG_64BIT, while old ABIs like arm, sparc,
>>> mips, and s390 added before 64 bit time_t landed on 5.1.  With current
>>> 32 bits ABIs moving to 64 bit time_t userland, there is no much sense in
>>> providing a 32 bit gettimeofday, nor I think I adding a  gettimeoday64 would
>>> make much sense (maybe on really high sensitive workloads that require
>>> low-latency timestamping, but clock_gettime would work better anyway).
>>>
>>> It is highly unlikely that the symbol will ever be used by userland,
>>> and I think it only make sense to provide clock_gettime64.  The glibc
>>> 32 bit time_t clock_gettime routes to clock_gettime64 and it will only
>>> fallback to 32 bit vDSO symbol if the 64 bit time_t one is not present.
>> Like patch below?
>> Helge
>>
>>
>> [PATCH] hppa/vdso: Provide 64-bit clock_gettime() vDSO only
>>
>> Adhemerval noticed that the gettimeofday() and 32-bit clock_gettime()
>> vDSO calls won't be used by glibc on hppa, so there is no need to
>> declare them.  Both syscalls will be emulated by utilizing return values
>> of the 64-bit clock_gettime() vDSO instead..
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Suggested-by: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
>>
>> diff --git a/sysdeps/unix/sysv/linux/hppa/sysdep.h b/sysdeps/unix/sysv/linux/hppa/sysdep.h
>> index af62f7501e..e47975e5cf 100644
>> --- a/sysdeps/unix/sysv/linux/hppa/sysdep.h
>> +++ b/sysdeps/unix/sysv/linux/hppa/sysdep.h
>> @@ -473,11 +473,8 @@ L(pre_end):					ASM_LINE_SEP	\
>>   
>>   #ifdef __LP64__
>>   # define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>> -# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>>   #else
>> -# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>>   # define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
>> -# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>>   #endif /* __LP64__ */
>>   
>>   #endif	/* __ASSEMBLER__ */
> Yeah, it seems ok thanks.


-- 
John David Anglin  dave.anglin@bell.net


