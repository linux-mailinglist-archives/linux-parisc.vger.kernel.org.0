Return-Path: <linux-parisc+bounces-1752-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD99248A0
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jul 2024 21:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB12C1F21E0C
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jul 2024 19:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F436F06A;
	Tue,  2 Jul 2024 19:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="guB7eFCA"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1D84084E
	for <linux-parisc@vger.kernel.org>; Tue,  2 Jul 2024 19:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949936; cv=none; b=BJtJTaFIV8OvQZhloiDYst/PNIWF7xsOx6WUxL2U8tW6MV7NopkyOQjVZILTZFz99Z1wqO1Pvj4NKuZu5ZjoaDu8a3WGpegBaDsvQ4Jy8lkFCN7rbxdVXX59o1qs/d7clfyNiECfsgBvb/koMnZ0BmOwwVno22o2sHMpHekTHPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949936; c=relaxed/simple;
	bh=nseBvjfPn9zZ+YB4vQVOAWD2o2cbUtZBDRyf45jbyH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbCa34E/jXBRsgKIBsOCwZFW5TACihYFGx8XxzBzoAm6aiD6px+94dwz/1g8INgZV0fNHcUb4L8i9cbVsJxiY27wO9mTRp9geiNKcBp59o0vbDgLDYweeUg+yUzsYpyPFgOAEZAnF2sfbmv30ASUiG40E7ZCYUaZo2+Yutax6LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=guB7eFCA; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-713fa1aea36so1943770a12.1
        for <linux-parisc@vger.kernel.org>; Tue, 02 Jul 2024 12:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719949934; x=1720554734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WOx6ZQaB+ew4nIO0JZFFt3QsesterOkn2Yd9aM9pEno=;
        b=guB7eFCAUmDikha5TQVj11K2ohC7suOnE7IBBvt8Q9NNRR4zf13IzZ96AzLBy5BLCI
         Ww1fpvZ41Bej0EZvfIDg7dKP/Bs4sNEV3wlwUkrupFbMvnO9w+WJMCjA2asTAxHNFeQ8
         X1WSo54QhW0HufIOCjf6gDsbYh138o4k9LTGJRsZQt4U+yh/u35HLWqcmONYXpmef3y8
         KjVB9qUggU7pS2i+UdfdYdiSn8zTngC2vuRMeuogSCN/PLs8TTryCe2qj88yjMq9zb1v
         0mLtgzh6zZAGgN/oUng4FNq5V/p1hzaekf7zmVU7zS2YwMAkzt340LOh4E9sLFYxbpCo
         VMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719949934; x=1720554734;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOx6ZQaB+ew4nIO0JZFFt3QsesterOkn2Yd9aM9pEno=;
        b=kepasBlAKxUuEgC+1DQn//uQmchPMJtK7cymdjl1QSINuQultH6uMkzWZBC77SZmcF
         rYJJPnxWqnpFXCZnoD9QJHnPIN/EcBe80iVW5IpHHDdCnfusQ4GIHy3Wbn3t03xY9c40
         cEgGKuUv7NHWe4B0O4nNAgVr32HiJl3idOFwJs/JBTlKknn+wawmdDpIVZ6ay7NO2FxS
         ypBrUXURRrZ0VYF6KG2tGJkep/Pujg6Jx6ZSsQSS4QNY5+DfvXHKyazz698y07JHfRfP
         knqpsNx7rcJpTb5QcY1w9/hfFjTb+Y5aWUJxqVLBvV6tlKwFMDH5RGMFTKn+XRSpdB51
         Bbkg==
X-Forwarded-Encrypted: i=1; AJvYcCXqg28qhf5TVeEh6SmJUvBta7jIbuIU2CSn7ntjh6NlQR1CQ7/gbUTKWH1I7xbDTqBRvytN+g1HY6SxvPkyZAGfBisxOWLXAyolodta
X-Gm-Message-State: AOJu0YyAiMCaL0+GQvgL3i4YcdDWhawNpqBRWuiSDHVgcTUVMftBXrB8
	Igi5oubaXTfx8EKtOAGrmtoMsQk5Av9vjGkYcbcX9YCTQoavP9q4bV4d6T6h97A=
X-Google-Smtp-Source: AGHT+IFoMSNVH5UOEyyMYsm99bbIyBJZfwO/n3/M3oBvf8Ah93DI13XK6tSQS401LTvkjaYsYODqWg==
X-Received: by 2002:a05:6a20:3ca3:b0:1bf:594:ea91 with SMTP id adf61e73a8af0-1bf0594eef1mr7274492637.42.1719949933797;
        Tue, 02 Jul 2024 12:52:13 -0700 (PDT)
Received: from [192.168.15.31] ([187.56.129.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080246f656sm8915609b3a.65.2024.07.02.12.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 12:52:13 -0700 (PDT)
Message-ID: <4d89c58d-e23a-4e3a-b7ce-b02687985d8f@linaro.org>
Date: Tue, 2 Jul 2024 16:52:08 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hppa/vdso: Add wrappers for vDSO functions
To: Helge Deller <deller@kernel.org>
Cc: libc-alpha@sourceware.org, John David Anglin <dave.anglin@bell.net>,
 linux-parisc@vger.kernel.org
References: <ZnXT9hNtYWLg9MID@carbonx1>
 <fd19f26c-0ebf-42ef-bfc3-686a82104d07@linaro.org>
 <47136a43-058f-4258-bd1b-3475fd7ea14a@gmx.de>
 <433fdb50-85e6-4b2d-8bd5-371b8cac4921@linaro.org> <Zn006zh2vSqfgii6@carbonx1>
Content-Language: en-US
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <Zn006zh2vSqfgii6@carbonx1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/06/24 06:46, Helge Deller wrote:
> * Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>:
>>
>> On 25/06/24 16:48, Helge Deller wrote:
>>> On 6/24/24 22:31, Adhemerval Zanella Netto wrote:
>>>>
>>>>
>>>> On 21/06/24 16:26, Helge Deller wrote:
>>>>> The upcoming parisc (hppa) v6.11 Linux kernel will include vDSO
>>>>> support for gettimeofday(), clock_gettime() and clock_gettime64()
>>>>> syscalls for 32- and 64-bit userspace.
>>>>> The patch below adds the necessary glue code for glibc.
>>>>>
>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>>
>>>>> Changes in v2:
>>>>> - add vsyscalls for 64-bit too
>>>>>
>>>>> diff -up ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org ./sysdeps/unix/sysv/linux/hppa/sysdep.h
>>>>> --- ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org    2024-06-15 20:20:58.992000000 +0000
>>>>> +++ ./sysdeps/unix/sysv/linux/hppa/sysdep.h    2024-06-21 19:19:02.132000000 +0000
>>>>> @@ -468,6 +468,18 @@ L(pre_end):                    ASM_LINE_SEP    \
>>>>>   #define CLOB_ARGS_1 CLOB_ARGS_2, "%r25"
>>>>>   #define CLOB_ARGS_0 CLOB_ARGS_1, "%r26"
>>>>>
>>>>> +#define VDSO_NAME    "LINUX_6.11"
>>>>> +#define VDSO_HASH    182951793
>>>>> +
>>>>> +#ifdef __LP64__
>>>>> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>>>>> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>>>>> +#else
>>>>> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>>>>> +# define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
>>>>> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>>>>> +#endif /* __LP64__ */
>>>>> +
>>>>>   #endif    /* __ASSEMBLER__ */
>>>>
>>>> Not sure why you have added the gettimeofday support, currently 32 bits
>>>> it is already routed to to clock_gettime (which will use
>>>> __vdso_clock_gettime64 anyway).
>>>
>>> Yep, you are right.
>>> I actually didn't checked if it's being used but just saw it's defined
>>> for other arches too, so I assumed it to be used.
>>>
>>>> For hppa to actually use, it would require to add a way to call it
>>>> for !USE_IFUNC_GETTIMEOFDAY gettimeofday, which I am not it really be
>>>> an improvement here.
>>>
>>> Yes, that doesn't make sense.
>>>
>>> Looking at the code it seems riscv, sparc, arm, mips and s390 define it
>>> too, without being used. Do you suggest we should remove gettimeofday
>>> vsyscall from hppa again (or just keep like the others even if not being used)?
>>
>> The riscv only added it for CONFIG_64BIT, while old ABIs like arm, sparc,
>> mips, and s390 added before 64 bit time_t landed on 5.1.  With current 
>> 32 bits ABIs moving to 64 bit time_t userland, there is no much sense in 
>> providing a 32 bit gettimeofday, nor I think I adding a  gettimeoday64 would 
>> make much sense (maybe on really high sensitive workloads that require 
>> low-latency timestamping, but clock_gettime would work better anyway).
>>
>> It is highly unlikely that the symbol will ever be used by userland,
>> and I think it only make sense to provide clock_gettime64.  The glibc 
>> 32 bit time_t clock_gettime routes to clock_gettime64 and it will only 
>> fallback to 32 bit vDSO symbol if the 64 bit time_t one is not present.
> 
> Like patch below?
> Helge
> 
> 
> [PATCH] hppa/vdso: Provide 64-bit clock_gettime() vDSO only
> 
> Adhemerval noticed that the gettimeofday() and 32-bit clock_gettime()
> vDSO calls won't be used by glibc on hppa, so there is no need to
> declare them.  Both syscalls will be emulated by utilizing return values
> of the 64-bit clock_gettime() vDSO instead..
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Suggested-by: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
> 
> diff --git a/sysdeps/unix/sysv/linux/hppa/sysdep.h b/sysdeps/unix/sysv/linux/hppa/sysdep.h
> index af62f7501e..e47975e5cf 100644
> --- a/sysdeps/unix/sysv/linux/hppa/sysdep.h
> +++ b/sysdeps/unix/sysv/linux/hppa/sysdep.h
> @@ -473,11 +473,8 @@ L(pre_end):					ASM_LINE_SEP	\
>  
>  #ifdef __LP64__
>  # define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
> -# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>  #else
> -# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>  # define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
> -# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>  #endif /* __LP64__ */
>  
>  #endif	/* __ASSEMBLER__ */

Yeah, it seems ok thanks.

