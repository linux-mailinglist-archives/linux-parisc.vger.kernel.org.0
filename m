Return-Path: <linux-parisc+bounces-2453-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 063139905F4
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Oct 2024 16:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A51491F2275A
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Oct 2024 14:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F352215F6A;
	Fri,  4 Oct 2024 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rI7gH3P1"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9E212EEA
	for <linux-parisc@vger.kernel.org>; Fri,  4 Oct 2024 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051896; cv=none; b=hutFmb+Q653IFZsYfkfPl2gSnzOKt0g9M6Je3jhkGiQPEx1IcNRPLw1Mkct4YEIVuLgXBX7wjQ0+8C85UWz39I4vxaKy86/bfqunrb/+YnQN2hCvbnx0MvjoGQVdRH9SUPgKwqs7t5MBXP6BCH+K0sZRS1wJRIvX9JeUCtOFFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051896; c=relaxed/simple;
	bh=I4iF/8qtNwYKC3lcnOezjRXCAhxZhSHrz8iAQgcJaN4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sG1e9UPYq8csA4+OjE3dgx3KKn/rouhofj2TAc2G7RayD28pvzX0JMvXI93aJ3t9o0Mtsb/kNOn1rNMchJRL6RU/W2luDNBcIrxBPwF6d981vkZtMEMfJBI+R0OcR47y+mp5pfQHG0SuVOjK1J62hYH+Gy90V6ZJx4cts+aax4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rI7gH3P1; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e09ff2d890so1903965a91.0
        for <linux-parisc@vger.kernel.org>; Fri, 04 Oct 2024 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728051894; x=1728656694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DsmHLym1d32y6Bluz2G4DVn2l53NvdPQ/1+3YEoFmOk=;
        b=rI7gH3P1I+I4G3ldW3YMu019Loz9EwO0jne8kP43ViwWSC2OJyDMsy2DEtmyRTxcGF
         lw1yFuy/sdiGRxzGJAQTrHpFt7yAOIL1ddya4ksimmQ8TycfJs6kXAM4BHpUur7msDLl
         Rfu9pOjHrlX81yUR73j3U8rxKuHhUdOiR8fz3k9EQjICEsFO2D0WhvHOlX9FfWkTjjKu
         1IO9l0UI6lSKRnrwAi7Y6lJ6HxalUEdN7UcVX44DtqZ/kUPVjJlyCmmNc3ORLe+SBBd7
         DqRnZB5MbGrjuyu/AYqj9MkuFxx39BZIbfn2UXEzEMLBcW44CgZodHNghEAr5X3mQb8w
         4iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051894; x=1728656694;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsmHLym1d32y6Bluz2G4DVn2l53NvdPQ/1+3YEoFmOk=;
        b=c3EIvgCZzvjBHHIhyKUyCKy0WhgS2DjUR5oNx/Y5YBLQDaWoBGMkFAAJrj9SYp3g0n
         +I+s5NW4XYqFns57dkYtJL8jLjeArzQ9CxMgHVQWrkmkKRCF2fGH24sTkDnP5rTisbdR
         jSN3gmUZmbRZIKUDeUqzsBgV0zewVy1s9PluQ48p+BUUYA14YfU/9MiJKccuRGwf2BHI
         93KuH6/+lkjxfHn2KiSVzGH9O/0pq/UJQtXl1ii7Xrb2yLDgvil2tdE59ZTBQ0Tiivq0
         UCy8xAb8gekzchwzUPlGo5NFygFKqigfLUJ3+cRYinyttioMv9Nekc4HB8V3EEtBY0oc
         ZrAw==
X-Forwarded-Encrypted: i=1; AJvYcCVvOgCOwZ2YXzLHV62QBTNeG/JkVME8tob39hVifVj9oICN9dlMwzD4PM92+1q7cjrYf8k0apBpd4FI/nE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmoQYxUx29uQ/c1Py8XVE5EArtgSrVROd8PoR0H0OKQOdfIyPT
	0kyxj2Nd5eZKplsF1Ki6cDLODRLiFuo/WewVUQ+gEIVyIFXV+vXYP0fitSNpI3E=
X-Google-Smtp-Source: AGHT+IEmdwP5lRe7W6JADtq6JvljlZ8pFVbjzKfOdvVyWhmp1/RoXe+2hTSPkS1iDDUyl7+AD3ZXRQ==
X-Received: by 2002:a17:90b:4a4c:b0:2da:61e1:1597 with SMTP id 98e67ed59e1d1-2e1e636f476mr3872402a91.36.1728051893979;
        Fri, 04 Oct 2024 07:24:53 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e85d9ac9sm1652563a91.28.2024.10.04.07.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 07:24:52 -0700 (PDT)
Message-ID: <c05823ff-47dd-40b1-a363-0c4b9cb47713@linaro.org>
Date: Fri, 4 Oct 2024 07:24:51 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: {PATCH] accel/tcg: Fix CPU specific unaligned behaviour
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@kernel.org>
Cc: qemu-devel@nongnu.org, linux-parisc@vger.kernel.org
References: <Zvyx1kM4JljbzxQW@p100> <87cykimsb9.fsf@draig.linaro.org>
Content-Language: en-US
In-Reply-To: <87cykimsb9.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/24 08:35, Alex Bennée wrote:
> Helge Deller <deller@kernel.org> writes:
> 
>> When the emulated CPU reads or writes to a memory location
>> a) for which no read/write permissions exists, *and*
>> b) the access happens unaligned (non-natural alignment),
>> then the CPU should either
>> - trigger a permission fault, or
>> - trigger an unalign access fault.
>>
>> In the current code the alignment check happens before the memory
>> permission checks, so only unalignment faults will be triggered.
>>
>> This behaviour breaks the emulation of the PARISC architecture, where the CPU
>> does a memory verification first. The behaviour can be tested with the testcase
>> from the bugzilla report.
>>
>> Add the necessary code to allow PARISC and possibly other architectures to
>> trigger a memory fault instead.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=219339
>>
>>
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index 117b516739..dd1da358fb 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -1684,6 +1684,26 @@ static void mmu_watch_or_dirty(CPUState *cpu, MMULookupPageData *data,
>>       data->flags = flags;
>>   }
>>   
>> +/* when accessing unreadable memory unaligned, will the CPU issue
>> + * a alignment trap or a memory access trap ? */
>> +#ifdef TARGET_HPPA
>> +# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  1
>> +#else
>> +# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  0
>> +#endif
> 
> I'm pretty certain we don't want to be introducing per-guest hacks into
> the core cputlb.c code when we are aiming to make it a compile once
> object.

Correct.

> I guess the real question is where could we put this flag? My gut says
> we should expand the MO_ALIGN bits in MemOp to express the precedence or
> not of the alignment check in relation to permissions.

I suppose that could work.

I was hoping for a reorg of the target hooks that could allow the target to see 
misalignment and permission check simultaneously, then the target chooses the order in 
which the two faults are presented.  Given how complicated tlb_fill is though, I don't see 
that being an easy job.

I'll play around with something and report back.


r~

