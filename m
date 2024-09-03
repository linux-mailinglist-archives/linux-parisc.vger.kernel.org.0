Return-Path: <linux-parisc+bounces-2209-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6E96A01E
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 16:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 421EA1F28026
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 14:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1F745026;
	Tue,  3 Sep 2024 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqL3o/nf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD25E3CF58
	for <linux-parisc@vger.kernel.org>; Tue,  3 Sep 2024 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725372853; cv=none; b=XRE6/E/VRf2OFdTwTbVKSlrnBg2dB9W425EsUtToSXl6p82MfUnfWN+3GVRa8lEgJ8GQDs91B9ZsqeR61BGM93Kklb4QSpxuC1HY7L2x4KEM09gGwGTz9COv08sHo+LKSjFXKGxSfi/2Q5JADr7Dbr3etnznaXTMWguxxedTZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725372853; c=relaxed/simple;
	bh=85pnYzmYSqgGd1Scs61HUsE10aU1RtIQw0qBnZjmGBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgiNZgQGyTQqFMVisZyne4JPgHGE954a8Bd8II9jCn/DFUu4mbizkAztmDAjZSyIBukqbKdmO/EnnZFQ8F+P87KMfMuIhU3Xgz7a3ICEq5lex5bBlY9Jt5yM2JinR0fE2E+r7Dqdwsdz3Udb0cOcvO0tg0TYn2JEtm2+/axrHDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqL3o/nf; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6bce380eb96so2977092a12.0
        for <linux-parisc@vger.kernel.org>; Tue, 03 Sep 2024 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725372851; x=1725977651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7LimD1oBBblZ4j/SoWtnueHneYKrf+ci3puwCb7d9jg=;
        b=fqL3o/nftRayjqzFcNh9JjBLo+J2t0+gMwY5Z3Vw0skGKaZoB3FhMtbhfb/C+U/C5k
         esAjGtP6Nbmwc3afas+m2KLdsLjlvV3/z2hwq9+rdaQ8ptcjBvpH8/t4L2lpGwDYJ4qD
         Y67rBxjPjkMEtAfu9YV1wQ8PPzxEtz/7SFalfDiQh7LGGVjMqlzN3roYbBJ4OFU2Xn/C
         TKemml9aZUDm0//9TpKZXECqY2IIHE72FYxkZ/b40kP0glMSjrcbvbhYSidTxXlOYZgK
         6FgLtN/bsobKC08pcIWyLFMyfcl/AqgLAiyXbVifa+mRI8ZZc2QbU2qweH8jwDAT1xws
         YjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725372851; x=1725977651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LimD1oBBblZ4j/SoWtnueHneYKrf+ci3puwCb7d9jg=;
        b=il0IN7SmbIze9nIYegND7JT0yNJjXsAoggikQmHyMaMqMvqJ96qgKVa4n5wrgnfWZp
         uQ2eBaoj4sXlTm/x0IZacquTSNZQPp32WBNpoFkUryx+xGw2YNKHpJ34vlrRMj7Vk97w
         uFlV+LvPET/j4YM2Gl3SGvvRJKBUYLg0NawyfPof/l1o5I3c1KExRMwuIY7dkQ2QFH/w
         Txa8HeLaNL+R9dtuH8Z4qFwqW1lRbrV9Qm71vazcRre1OZg6Gn5o5OR2aaJ1siPvpfgU
         cX2myZnQxpfH/I9R+7wQZUOIUXtpie38OHTF0/USs2yJ2VLyRKFVmBYlXNu3IWKFddgs
         s4rw==
X-Gm-Message-State: AOJu0YyNVkcq73iCd3Hd1L9EJ54amHqwveksDMGsADsU1OvgqbJdEDG6
	aSIDjJOfb7vC9pM3FTD5BlDFR3Xq/IeiJLRdOApx0gMi4/AxV/Ye+mnKuA==
X-Google-Smtp-Source: AGHT+IG3mdeTSQkOJAFXZRk1VbxX+sv1V6yDP79LZ9gyZwzvHvoyTt1MReyK441jMm0QoDHNSXJMNQ==
X-Received: by 2002:a17:903:32cf:b0:206:ac11:f3fd with SMTP id d9443c01a7336-206ac11f571mr4253275ad.30.1725372850879;
        Tue, 03 Sep 2024 07:14:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205667dbe18sm37696015ad.261.2024.09.03.07.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 07:14:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <84a4e63c-4a68-4061-86f8-647c24a3f617@roeck-us.net>
Date: Tue, 3 Sep 2024 07:14:09 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/hppa: Fix PSW V-bit packaging in cpu_hppa_get for
 hppa64
To: Helge Deller <deller@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: linux-parisc@vger.kernel.org
References: <Ztbk0Vk35dDGLoCd@p100>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
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

Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks!
Guenter

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


