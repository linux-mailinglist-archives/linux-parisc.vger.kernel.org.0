Return-Path: <linux-parisc+bounces-2702-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADAA99D782
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Oct 2024 21:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C1C01C203BD
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Oct 2024 19:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510CB1A7273;
	Mon, 14 Oct 2024 19:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwEq1wSW"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DEC1C302E
	for <linux-parisc@vger.kernel.org>; Mon, 14 Oct 2024 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728934269; cv=none; b=kuYADZBe9MWqHsRJHHMHukVhyvEqkYNTZhVpptWlInhON7JrVURMDoCC+WcLpqpUrgRS02HPiQrVS7gTOkoos1KPS5HzidyyI+yk6K/NXYMv/T1NdVA3s4/w+g57NndFx/BFJ5moDJsy2FaGKYkANjlyd650grqjQA+i1mWwW7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728934269; c=relaxed/simple;
	bh=KmkycMGlsm1T5zLGyK24wA/uT5AVmEogT2O7mtiIj7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlT29HvVdh0VIxXdgCjfCh3OcsRP/fxG0+29MPbrR0TmMVqspXliTo6JNM1BJIcHnrbn7ASoHBQZvKN8RqHbmugqJDeeBuOVPfDW6BVoDnZm4V0e3+zu9vCpftGYJfKbkUUZcDYXJEDDFaUaxFzBKPxWtoxiPUI9bgQ604mm3ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwEq1wSW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20ca388d242so22087725ad.2
        for <linux-parisc@vger.kernel.org>; Mon, 14 Oct 2024 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728934267; x=1729539067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1AEL1iCDF9gEmhg3gccpp0WV6U4G1Xodmz32GJKaMw=;
        b=ZwEq1wSWXJ5WWsU4BsY8IQ+XErsNM7aNAqweKD3SinD4AVmR//2zJ83os6TFfR8RJK
         fFesd6yfJvjFHrbr9KqyiaVGkp/T6eoc1zpoCj3g3Q1jQXFx4SkNRo0pxkZILeIg/cF9
         MVhhui5bzA7dlQ4Rf90W1FUZoWPHBByrbIfthfsY2Qe3QddZQzcKTaxQ445FJPCKyXN8
         c/LAdy0NrqzQN7t/b81J3F5fC9qBChuNRbeeiHVbKraYK8Py0z2XsSFNY3E3niFGPWdY
         EHqSrQIc8Sq027sNhCxXjnHbcYIJWbtMsCjygXSjIqasgDQy+AqhPTZNETGbY6uaVL6y
         1mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728934267; x=1729539067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1AEL1iCDF9gEmhg3gccpp0WV6U4G1Xodmz32GJKaMw=;
        b=vLVQ3ZxvJBtJe756VKocs1gLthPwI224x3GvSkWtuE0ertx24eyHbOLLSrk/GGtAFv
         mYginm2JpnEVNMMFfgJKdn/QyQ1LWBGO5L2LwEGmXk80wRya1UlLnNzT1ZelKQz9vKw3
         VdaKadBMtA1hiQsQIm8+RU4utxTVi91dqo4PdFplKnfkcaad/Myqaie+z3rnwjr5HuIE
         Yy0U7Eua0HS+LpZSyQmq+78ZmXWVYROsYF1EBLJk6xE6ekqrhQ+WNwQwW5AEf2qC3pxx
         giijyya2iIqoqooHTKy9EHcv1Lw4vJ5fInrSJGUn5AM4UQCYV7dj7ovTLqkeS/HYCnxb
         b5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+wl2aJzA/hK+JjKQJgVoTqx5HPqhMO0QDWz/p4MW9ouZRuiiVWqtjju5YA9TsLj+3P+gNKmee1b3+Kbs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt4t1xuXNG1HAiw0ch1x98NMzUvTVpsEd4UnLSFTPwdkpVFmU8
	e6ZlyxRm1ncy63wQZ2V5M43mu5L7RW1RJMxgajF94ry7GWkeCWrz18prhVKWy7o=
X-Google-Smtp-Source: AGHT+IGNwfPrqX/p12MjjHkL5fhFAF3sIeaw3O1of+XU0hk007UxnEm4B47z8tir6AN7cjGiuEiBDA==
X-Received: by 2002:a17:902:fc50:b0:20c:8c0f:f986 with SMTP id d9443c01a7336-20cbb1a91camr125106145ad.24.1728934266970;
        Mon, 14 Oct 2024 12:31:06 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c3561e0sm69129535ad.291.2024.10.14.12.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 12:31:06 -0700 (PDT)
Message-ID: <b8e76800-e5ea-4060-9e3c-35e8a9f8812b@linaro.org>
Date: Mon, 14 Oct 2024 12:31:04 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/20] target/hppa: Fix priority of T, D, and B page
 faults
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-10-richard.henderson@linaro.org>
 <4810ac6d-cbdc-4f04-a2fa-895e78cf2fcb@tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4810ac6d-cbdc-4f04-a2fa-895e78cf2fcb@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/24 11:02, Michael Tokarev wrote:
> On 09.10.2024 03:04, Richard Henderson wrote:
>> Drop the 'else' so that ret is overridden with the
>> highest priority fault.
>>
>> Fixes: d8bc1381250 ("target/hppa: Implement PSW_X")
>> Reviewed-by: Helge Deller <deller@gmx.de>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Is this a qemu-stable material?  For now I assume yes, please
> let me know if it is not.

The kernel fault thing is pretty nasty.
Fixing that probably requires all of patches 2-11.

I don't think the arm fix is serious enough to backport.


r~

