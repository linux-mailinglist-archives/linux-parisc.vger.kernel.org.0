Return-Path: <linux-parisc+bounces-2673-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084499A76E
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2024 17:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D5671C22DAE
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2024 15:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977281946CD;
	Fri, 11 Oct 2024 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLx2E9ky"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058AB194158
	for <linux-parisc@vger.kernel.org>; Fri, 11 Oct 2024 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660176; cv=none; b=KjkQeTBl/Fj12o90+zafysGjNcvoQIO7LEnCF/vrijXHuvoqc1bMYZwkwRfes6mk6DyhxL16+PgjlzILR9+ma7Ywa6L+iIJl2qcH+z2+KhWrCmQhvg00yS91LEOm3AoZTEaZyN0NtqFMxG5PQi6saq9aKbZIYk48p3ByMx3ioB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660176; c=relaxed/simple;
	bh=OxLNaXcCfItYYmFYlHnGIyRsL5zeR42wL7DX1WKDX+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5je08pyxHjJ7uVaAs2jVPg/WdfMPL42h+QKhPHdX0O/INnPQG1mHOalI+qtw+wNlo+uvpAfOvOgfnXAUVC7DuR7wVc34jcOohg0+nHvN0zDnXL+JC8LwlvT5+uXf00UrVYqc0KN+A5HcG1CK8aokUzkYSo2IJcXhWUVGky5XEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLx2E9ky; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7c1324be8easo2288867a12.1
        for <linux-parisc@vger.kernel.org>; Fri, 11 Oct 2024 08:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728660174; x=1729264974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1CogMR7I7WuqqzE6cNx48xEoXofErOXlHnvljTI0ZmU=;
        b=iLx2E9kyOUh7p+DEhkfpl6SGsBttPwcfuOj8Du003rDsDwddl3Zx39uBzMbYVC56vH
         XAF/xm78W6NFRe6di53WNOeZ66MnUq5P6t92g1EFaqCkBe594Wwbw3LX4HKLJMPUx2jZ
         NVKoo/LDexCcCVFIXAUTzLJeFs+IMHjEnjqhLtomazJ2nv7VQoMP0T0h0LIZHTDVhteo
         4N4/SCVcdpSqVrOpIMdf4WGmHd4GvJbTFYdpJaXk7+DWjE8yRXIW7tfig7qUjc4fcbC3
         1G5ldZkUDcEyTXxIiGVvnYcICVi6GE12U0/aGNhyTfTvU1q/MmU1fkveLXY9eKacLH6p
         g+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660174; x=1729264974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1CogMR7I7WuqqzE6cNx48xEoXofErOXlHnvljTI0ZmU=;
        b=Tp9yDwmhHLSFxksUebgEgiLmTRllIhSXLwP+fkBTwS6K6YJrC4mO7iZ0i+6G/QLvLI
         F1hMUXi9tSoRcm1AZzl8VW6KuEWJwgGt/v9d5S4gplntzEARVnI4SqRFoh7yBNIpDG9w
         Mh2elcRYnXiPOWVT+WUftIYpQZlD0PgnmVE1gh6d2Mn5KPpLvnMz1zDFKf0IT+ReCoLl
         MDZuIE9A8T+yEGeQh8UOcTJ2G0M+iGkuM/FOjnJ7SV36CqLBsftdT7+asbVuSUabSSwI
         DYri8cyb9IYi1qGHXh+UHFiO6KDGXYbS/JC80LNJkOd/zLWpf/4uMBP69ysA35ATaW7a
         ucSg==
X-Forwarded-Encrypted: i=1; AJvYcCXcRXeXJkJjMYyG8Syx9YNyLuZRK3nxKtih3AoCbQ99gWzs4Z2ahu6glEHrQqU/ddxtwbnGAkPkIoIU9Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyT8XUSd7dIilmjxPHx6m3MolvjXVJGnp9LQRQh+EEGyDxZi5u
	AwR6bwEYfL9MxmX/Ux0NqxiykEjhbRpimybWEkoPD1hfAaN4zLDwCkDY3bN0opc=
X-Google-Smtp-Source: AGHT+IGtuBfJ5Y8/O99TVzmcr+ylQwPmRJHu4yyYUgnd8FAVtIUhSM+5WEIdXBhH7Jp50Bxnudz0dA==
X-Received: by 2002:a17:902:e88a:b0:20b:5e34:1842 with SMTP id d9443c01a7336-20ca03ff886mr53673925ad.25.1728660174181;
        Fri, 11 Oct 2024 08:22:54 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c348986sm24499055ad.258.2024.10.11.08.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:22:53 -0700 (PDT)
Message-ID: <b5bf5d17-2451-4d6e-9a4e-6fb4e94ad308@linaro.org>
Date: Fri, 11 Oct 2024 08:22:51 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] accel/tcg: Use the alignment test in
 tlb_fill_align
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-7-richard.henderson@linaro.org>
 <CAFEAcA-mSsFgjoBWi13dXqZUbys2N81YVXLD_ZfuuGo+Xfy-gQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-mSsFgjoBWi13dXqZUbys2N81YVXLD_ZfuuGo+Xfy-gQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/24 03:44, Peter Maydell wrote:
> On Wed, 9 Oct 2024 at 01:05, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> When we have a tlb miss, defer the alignment check to
>> the new tlb_fill_align hook.  Move the existing alignment
>> check so that we only perform it with a tlb hit.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> @@ -1754,8 +1767,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>>            * Lookup both pages, recognizing exceptions from either.  If the
>>            * second lookup potentially resized, refresh first CPUTLBEntryFull.
>>            */
>> -        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
>> -        if (mmu_lookup1(cpu, &l->page[1], l->mmu_idx, type, ra)) {
>> +        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
>> +        if (mmu_lookup1(cpu, &l->page[1], 0, l->mmu_idx, type, ra)) {
> 
> Is 0 the right thing here ? Given that alignment-requirements can
> differ per-page, what happens for the case of an unaligned access
> that crosses a page boundary where the first page is "memory that
> doesn't care about alignment" and the second page is "memory that
> does enforce alignment" ?

I can't think of anything else that makes sense.  The access to the second page is 
"aligned" in the sense that it begins at offset 0.

Anyway, alignment as a page property is unique to Arm and...


> For Arm this is moot, because an access that crosses a page
> boundary into something with different memory attributes is
> CONSTRAINED UNPREDICTABLE (per Arm ARM rev K.a B2.15.3), but
> maybe other architectures are less flexible.

... as you say.

> Also, the comment does say "recognizing exceptions from either",
> and we aren't going to do that for alignment issues in page 2,
> so if we're OK with ignoring this we should update the comment.

The second page can still raise page faults.  How would you re-word this?


r~

