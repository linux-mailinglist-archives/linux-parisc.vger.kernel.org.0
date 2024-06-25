Return-Path: <linux-parisc+bounces-1696-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BA4917254
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Jun 2024 22:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8529B234A9
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Jun 2024 20:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D87815746B;
	Tue, 25 Jun 2024 20:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DinPGHju"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2151448D9
	for <linux-parisc@vger.kernel.org>; Tue, 25 Jun 2024 20:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719346467; cv=none; b=WNt6E66efA17F9e7kp78mWY/7jCha/GHRoKQEYLWcOimhuUWpXxWi3tXKaPLZyuRIHAOHE2AE/psbeYxRxFThpIPzzw4MDQHYh6Pa6B2vjyGmblRGBRn+JPNNh7bIlZpiLfe8zcAI88SfEC06YoODqaDb3fEwqiKyWxzfP3pwto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719346467; c=relaxed/simple;
	bh=vq7QDba8YZ4n/QSw4tfUJ9x4MrNSePAevdMcnYty5vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IMzQlSDkELPJ9Q2kSe393ZwX9yxTi6bDA7x3vMy+yQVZ/VIGk9dQV8pQVSsIMIR+tJhYqb3P8ILTVQ9b6kv/XeXy7lQLlvwfY4EaNQVopF+tpCu+L0Qq9RfQSAtKUVhf1GbrqLoIFYz8mF7hz9MlXXbOQNja2xcIRorcOPxFPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DinPGHju; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70673c32118so2296014b3a.3
        for <linux-parisc@vger.kernel.org>; Tue, 25 Jun 2024 13:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719346465; x=1719951265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tHMJP+pw/aO0MToXU8TYqDflI3ERiaoNdiZqYwnMujY=;
        b=DinPGHjumPtYu2uWWzyeWgW36BQtqF6Y3Jj3I+QUky8D6tyWa5QxtrgCxl/Jg1NN4w
         OiarEOXNtUM5uN9OtA+RNlA/SbDxAT2ZHLG4kMGw97+/qkHuR4oYZM4lNlw5YWmPFQsd
         qh4//GAI1q+NACZpA4xTE3aqZxVKZ93WY++xGutemBYx+oHiIPhVCQfS0PVRB6JTDLaj
         HFy169QRMsHmfXtW8BSqdmf4zjmvXIH20krZE/Vd/i6Nezw2oxzga4bhTVXucB65PcHc
         Xl6mXYeOR5sUozKaNORt914aXKDK1qG/OZspxaHtp6gamPFGzF4jxfKIhPFrprXnb/XS
         YOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719346465; x=1719951265;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHMJP+pw/aO0MToXU8TYqDflI3ERiaoNdiZqYwnMujY=;
        b=U64T0xcG8LvDjLwabgy9gCvOa6vt3bZwrFLzsKWXFNIu1rpi1Q/aurpwpaL33e3no7
         MFc3PkB/asKmE8+R1cislLc84zCGM3u4fMXC5+R4EfRbK9KQ9jIqqHjrcfhfON2miJUt
         IanK7ku38IZPd9mfDT9fOKwKjsYuRuLspfOmFRSA43Uq5FMyFed17pk3dGjICZv4bQtq
         s3CDuO4/VcwBjvsMAf80nyhqVTJqUWI9eWrlCahNgcP/6VNwtxAxUdulUJ2rFORwNPo4
         ADjBtezhNuv5Qlt4jdw92dIe89IZ28JMgdiyqd7GScPkbScdDGGPZJufTbDXPcb+QMZC
         bCsA==
X-Forwarded-Encrypted: i=1; AJvYcCWUz6LWso/c26hUjo/WEZVn3HJCfWk0H6IjjqNaIjt2wNMrOOrwbjEsDdJ9Wpwfo1HcrQ/XLY5u3YoF78htLNVzMQpW5ou18FrHFtFe
X-Gm-Message-State: AOJu0YxkAlSmh8FDPcTJKCwqi+7tCzoMtY8rcJv0AgsFp4lReTDTnznS
	Bstj4DxABWgjxzygqe4a91Fbpic+cqhlHCMub6PauV9naYoR7BQ3n/MRwI+bg7I=
X-Google-Smtp-Source: AGHT+IH3izUuOymMbKDvQWc4CHwf/VqgBrB2crdg/yQgyi1VI5FMFinFgUgdfucPqs+bc3H+dV/Ubw==
X-Received: by 2002:a05:6a00:c95:b0:705:9992:e7f2 with SMTP id d2e1a72fcca58-7067459a63cmr10704055b3a.12.1719346465113;
        Tue, 25 Jun 2024 13:14:25 -0700 (PDT)
Received: from ?IPV6:2804:1b3:a7c1:e1e5:1dfb:a750:9574:3865? ([2804:1b3:a7c1:e1e5:1dfb:a750:9574:3865])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70666de7bc0sm6783678b3a.74.2024.06.25.13.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 13:14:24 -0700 (PDT)
Message-ID: <433fdb50-85e6-4b2d-8bd5-371b8cac4921@linaro.org>
Date: Tue, 25 Jun 2024 17:14:20 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hppa/vdso: Add wrappers for vDSO functions
To: Helge Deller <deller@gmx.de>, Helge Deller <deller@kernel.org>,
 libc-alpha@sourceware.org, John David Anglin <dave.anglin@bell.net>,
 carlos@redhat.com, linux-parisc@vger.kernel.org
References: <ZnXT9hNtYWLg9MID@carbonx1>
 <fd19f26c-0ebf-42ef-bfc3-686a82104d07@linaro.org>
 <47136a43-058f-4258-bd1b-3475fd7ea14a@gmx.de>
Content-Language: en-US
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <47136a43-058f-4258-bd1b-3475fd7ea14a@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25/06/24 16:48, Helge Deller wrote:
> On 6/24/24 22:31, Adhemerval Zanella Netto wrote:
>>
>>
>> On 21/06/24 16:26, Helge Deller wrote:
>>> The upcoming parisc (hppa) v6.11 Linux kernel will include vDSO
>>> support for gettimeofday(), clock_gettime() and clock_gettime64()
>>> syscalls for 32- and 64-bit userspace.
>>> The patch below adds the necessary glue code for glibc.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>
>>> Changes in v2:
>>> - add vsyscalls for 64-bit too
>>>
>>> diff -up ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org ./sysdeps/unix/sysv/linux/hppa/sysdep.h
>>> --- ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org    2024-06-15 20:20:58.992000000 +0000
>>> +++ ./sysdeps/unix/sysv/linux/hppa/sysdep.h    2024-06-21 19:19:02.132000000 +0000
>>> @@ -468,6 +468,18 @@ L(pre_end):                    ASM_LINE_SEP    \
>>>   #define CLOB_ARGS_1 CLOB_ARGS_2, "%r25"
>>>   #define CLOB_ARGS_0 CLOB_ARGS_1, "%r26"
>>>
>>> +#define VDSO_NAME    "LINUX_6.11"
>>> +#define VDSO_HASH    182951793
>>> +
>>> +#ifdef __LP64__
>>> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>>> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>>> +#else
>>> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>>> +# define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
>>> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>>> +#endif /* __LP64__ */
>>> +
>>>   #endif    /* __ASSEMBLER__ */
>>
>> Not sure why you have added the gettimeofday support, currently 32 bits
>> it is already routed to to clock_gettime (which will use
>> __vdso_clock_gettime64 anyway).
> 
> Yep, you are right.
> I actually didn't checked if it's being used but just saw it's defined
> for other arches too, so I assumed it to be used.
> 
>> For hppa to actually use, it would require to add a way to call it
>> for !USE_IFUNC_GETTIMEOFDAY gettimeofday, which I am not it really be
>> an improvement here.
> 
> Yes, that doesn't make sense.
> 
> Looking at the code it seems riscv, sparc, arm, mips and s390 define it
> too, without being used. Do you suggest we should remove gettimeofday
> vsyscall from hppa again (or just keep like the others even if not being used)?

The riscv only added it for CONFIG_64BIT, while old ABIs like arm, sparc,
mips, and s390 added before 64 bit time_t landed on 5.1.  With current 
32 bits ABIs moving to 64 bit time_t userland, there is no much sense in 
providing a 32 bit gettimeofday, nor I think I adding a  gettimeoday64 would 
make much sense (maybe on really high sensitive workloads that require 
low-latency timestamping, but clock_gettime would work better anyway).

It is highly unlikely that the symbol will ever be used by userland,
and I think it only make sense to provide clock_gettime64.  The glibc 
32 bit time_t clock_gettime routes to clock_gettime64 and it will only 
fallback to 32 bit vDSO symbol if the 64 bit time_t one is not present.



