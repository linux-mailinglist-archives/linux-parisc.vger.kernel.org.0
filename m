Return-Path: <linux-parisc+bounces-2215-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C196A64F
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 20:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFFBE1C21720
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 18:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6F118BB89;
	Tue,  3 Sep 2024 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVm2eThJ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69A118E043
	for <linux-parisc@vger.kernel.org>; Tue,  3 Sep 2024 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725387489; cv=none; b=OwZrnD1a/AkN29+LHIsck4S7yy6IfBtxkudr3w0qdofWFztCEsQanNoBCQs/MgbcNx+VOsHDSEupKuyTZ2F8mfToafge27MX3j7KPNQN8cLYtcrg/YtIxeftk9SrXYYx6VLLNoKBRc/82kIE40y4sJ7VAk+T/2CApr6yllbZ8wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725387489; c=relaxed/simple;
	bh=/RP5rkqGXINMa1YHVGJxXOYAitj/ucR1EscLnXiqobs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqGx6DEssQnUqAxGk4hUWp+mwapeTtuULKLFpHdoNotNnRQCAV/MXr+SflBRH9UrOtGBDHg+A8z2JK7fsqnEXxQeJWTVeyHontzmHUQqR0KcU1ibZWnkj3EXzlfgTMsSyTqdGiOeQn9tSZiJHZcMn0JksAEsYc0FO697hsJlspo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVm2eThJ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d87a0bfaa7so3069136a91.2
        for <linux-parisc@vger.kernel.org>; Tue, 03 Sep 2024 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725387487; x=1725992287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7OjYGljhmdm5zqLgU5viOKQnBhqt6G43Kg3e8DJKOzE=;
        b=eVm2eThJBeWBOENTNon/hvv3/mOfSqLUrCKGlP7w6ev9bSyEM9OR9L8TC1r/7dFUnn
         o9tx6Le53s5zo6MPg3Nekhy6PdxwxW1D77ayTUltM4PNnIUJNw64G9vzwMrF58ZqKpHd
         bu1H/U/kRVZGe2aga3HqgZtAXn+NgwIAwoAAgBbDWcREGsXXNIecbrl3ujLNI7Tu6udC
         9DI2b6pe89Tp8hSvuQS0QTGQLGsEReYfBeYGI5phhvKbFQP5gZ3yyXanScJTSrOxbiJg
         qZwzVDN7iC1vwvrjMt8PRfjMcr7L2ptZ3938mBSYaaIQvLevCDpQTFQPcueig0hPOXs9
         8Mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725387487; x=1725992287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OjYGljhmdm5zqLgU5viOKQnBhqt6G43Kg3e8DJKOzE=;
        b=ePDDlXX6yQq12pWKnJFNVSQRxDGpeyBQ7OXLjv+blztov60Eye27n97dvXd1XeVjD5
         SYBugOeWQ0SbrhN7VdSODiDnkex59ynasBAC3qXO1148FLp2hdqn1DrVmF7Dxm8+u70x
         ivGjkX4osKnQG8snqsORX0yNdZhki9BPljE1H2JHPP5vydjgd0Gmi3+ZFqO02LgOnMj5
         bQAigRknxrLYmhCV0fqUGjqUOXsgRhxxY+0g/jKtROnOIXzEkNb5TEKCRyOkqIMEej8S
         8rmh11k/f8aWskmCDnw1hI9as5g3sn0c/3AyLYq7cFVVfGqHGEYQ0m0e+PT/D5g1W3ud
         T6dQ==
X-Gm-Message-State: AOJu0Ywr82BjoFX2BR1U/EvCIeJ21UD3xs6OdUGSGOKFk8DKpGNcCCOC
	NYHg9+WsM3YuLXET+KwubMAKRjj16TNfE263mBDHs2S8zZ10EdFFO4Ox4gRlICI=
X-Google-Smtp-Source: AGHT+IE4dVwJJ7TspXl1F8qLtUhbOobgad9TpbJiXV+ZyZLlzKBLXHFut6Sok8jhDi8114TlyjhdVA==
X-Received: by 2002:a17:90a:fb48:b0:2cf:c9df:4cc8 with SMTP id 98e67ed59e1d1-2d88e6f3aa2mr12743376a91.38.1725387486632;
        Tue, 03 Sep 2024 11:18:06 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8a5324db0sm6946551a91.56.2024.09.03.11.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 11:18:06 -0700 (PDT)
Message-ID: <c5cc5902-dd23-46df-9c1f-b22d7625b926@linaro.org>
Date: Tue, 3 Sep 2024 11:18:04 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/hppa: Fix PSW V-bit packaging in cpu_hppa_get for
 hppa64
To: Helge Deller <deller@kernel.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: linux-parisc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
References: <Ztbk0Vk35dDGLoCd@p100>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Ztbk0Vk35dDGLoCd@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/24 03:28, Helge Deller wrote:
> While adding hppa64 support, the psw_v variable got extended from 32 to 64
> bits.  So, when packaging the PSW-V bit from the psw_v variable for interrupt
> processing, check bit 31 instead the 63th (sign) bit.
> 
> This fixes a hard to find Linux kernel boot issue where the loss of the PSW-V
> bit due to an ITLB interruption in the middle of a series of ds/addc
> instructions (from the divU milicode library) generated the wrong division
> result and thus triggered a Linux kernel crash.
> 
> Link: https://lore.kernel.org/lkml/718b8afe-222f-4b3a-96d3-93af0e4ceff1@roeck-us.net/
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Fixes: 931adff31478 ("target/hppa: Update cpu_hppa_get/put_psw for hppa64")
> 
> diff --git a/target/hppa/helper.c b/target/hppa/helper.c
> index b79ddd8184..d4b1a3cd5a 100644
> --- a/target/hppa/helper.c
> +++ b/target/hppa/helper.c
> @@ -53,7 +53,7 @@ target_ulong cpu_hppa_get_psw(CPUHPPAState *env)
>       }
>   
>       psw |= env->psw_n * PSW_N;
> -    psw |= (env->psw_v < 0) * PSW_V;
> +    psw |= ((env->psw_v >> 31) & 1) * PSW_V;
>       psw |= env->psw | env->psw_xb;
>   
>       return psw;

While this is correct, we should also update cpu.h:

-    target_long psw_v;       /* in most significant bit */
+    target_long psw_v;       /* in bit 31 */

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


