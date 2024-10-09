Return-Path: <linux-parisc+bounces-2635-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C15599752B
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 20:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A99E1C22141
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 18:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F631DF734;
	Wed,  9 Oct 2024 18:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpuKwW/x"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A5C198A0D
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728500145; cv=none; b=NIS65UqcBzRwxk8OolngALfiR+SXpA/KHvK3uh17eiRZwQw8q0Jx1Fxxzk3Me/BHM3I0tICxD+cUwT3G82RvKBeOvNkrlqWx5wPzo0/nH8BzWZkrdnGHfoOqKFpS4SXevlvu3/b2s7xOJijOrV7d/jSriz8lpZ2d8aIC7+jRDqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728500145; c=relaxed/simple;
	bh=bTxP2AXSZHawO829rh0OqSHmFqL2rFamZdljppq08OU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3QS4mWlZhOIwQLyDFxfr8Am0Pi1vod36Wm3AjJKfKd9ZfJiPnGkLulp2lXaqKbjN3tt2e01BbNaMeqrE6tiQHVtu1pJEBVeEMrIBMD/bpmBy+409/4PTMQ3V3IoUn9GkcWmef9pOBGmoKDmOFJwqXSfPoK5OMBmMSGzo9XokoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpuKwW/x; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7e9fdad5af8so61289a12.3
        for <linux-parisc@vger.kernel.org>; Wed, 09 Oct 2024 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728500143; x=1729104943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tc6VkZnx60BiTg2WXO4EChgnJa2XgmHv0c0PzLUQ2g8=;
        b=KpuKwW/xgmOvN0a77aN5VlFBNEXkRLi3mwen4S0wcF/yYkgSzKFpptKMfJF8DtBtdU
         z/uQkXQ2rORQWDKPr57Z4TrM9+MqM1R3Dvy0QlyaBGD3q055GSekVk49bDKWE3XNGaZx
         FTScXryAXQ5fkRdZ02/RK6aSjzfgSuVL6R+aIPd0UdyfR4WPaibaGeYJbfLuO8ptwMbp
         5lA/eVqtcwOjiCkLykASdkAch3bI9Ya7dlMbw8ipm/giqqFJmozWVqiPs8BcRTG7actJ
         9JbIAMSEBAmHijSyUAY6f5OQEIhV5ccCS+LLM1bZZkbs8eV1j0UW0EsGH6kxDPBanron
         KBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728500143; x=1729104943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc6VkZnx60BiTg2WXO4EChgnJa2XgmHv0c0PzLUQ2g8=;
        b=RZeqs941i8v6MTwNEnrbTaFeblMB4iVHjptTwE8ORr0TXB8pCH/gzLW/A9GeeClrAC
         6g+3bSXQX17NVASB3lY8X3pZSZRCjUpqbAyww/h+g8xr2FZYc94AKMEmt0vfHpjxMT63
         9/8cJsYk+MUDt7MWGcD5H+OfwFsZB553Z6IIHiWJ7ajWAMs9tjXWdrGqIGwmzeoULCMk
         ycjG95vwxYBgbAOIL2AAq33ttrEBj6YCq2ICCzYQ44goe7qOa07kX5RsXjkOtngTzDSO
         674zxMplFEXy+TzOoGFqwjA0bkvI7ey6x7TqFuHlSEfPbrGS8WYxL0uLDK+rIsVDwk4t
         EqDw==
X-Forwarded-Encrypted: i=1; AJvYcCXdZAQbN1M+arV2Izbp8LEHbCxuDvC6gnA14BQRTF+i0O2KbzOC5wLpLj24OcJWwXxohst//xHEKCZUtgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWIsNOSlmGDNfZmsDh6D6Yn8464Tl6wXglq1Koz5ARDu5HcunC
	2if9G/Rqvl/s0zIFbFhDi3pdLBGTHdmF2fVlIJIkNWRxVDVBh86KlBV9u5BRXIQ=
X-Google-Smtp-Source: AGHT+IHFh34X8FwppPdPD7NUkEI4OdCjpJWkeGjLIJ1+Gvz2oVK0sToQsbnPoVjVfsaH8OQ5e7yGTg==
X-Received: by 2002:a05:6a21:9d83:b0:1d7:fca:7b46 with SMTP id adf61e73a8af0-1d8a3c49baamr5989989637.31.1728500142944;
        Wed, 09 Oct 2024 11:55:42 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.89.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e03288a37sm5592380b3a.155.2024.10.09.11.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 11:55:42 -0700 (PDT)
Message-ID: <dcdb157d-c9ed-4786-a58b-b31357cc51f6@linaro.org>
Date: Wed, 9 Oct 2024 15:55:39 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/20] include/exec/memop: Introduce
 memop_atomicity_bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-5-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241009000453.315652-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/10/24 21:04, Richard Henderson wrote:
> Split out of mmu_lookup.
> 
> Reviewed-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memop.h | 24 ++++++++++++++++++++++++
>   accel/tcg/cputlb.c   | 16 ++--------------
>   2 files changed, 26 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


