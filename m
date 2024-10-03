Return-Path: <linux-parisc+bounces-2452-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7E98FA46
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Oct 2024 01:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8080284C23
	for <lists+linux-parisc@lfdr.de>; Thu,  3 Oct 2024 23:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6C51CF5C4;
	Thu,  3 Oct 2024 23:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBkH3PAh"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B661CEAC4
	for <linux-parisc@vger.kernel.org>; Thu,  3 Oct 2024 23:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727996933; cv=none; b=aq8tIZj/1ctfbXYGLot14fEAoZb44cQrXjg1jCWQv/WZy8+xCcZ8ENO1DmRQkm+RCnjyY42V4JVLrE3okIWBANI9axtdZwgsP8iwHBOEjBT16AvqJ3aYh8X0WpCJNxunro+Kk/umXkVPmjBVHqpM8efY7iXZ7cMEiqIwhTDYoNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727996933; c=relaxed/simple;
	bh=A2816N26B8QiX3eOcBNnzUXEQEUFQdx4VYkkwVyLTi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvDsbAjhwccUQKyhmNZ1tT8L7jyZHyfV3Y424r5AiDeRqAfVz17jQPp1wu1K38ctqwIs7fGK/4kGl2Yn/E8/eZZTNfoqMJClS4f2iwgAK38DnthggFpzMITUWDqZDeiYLMh/olzmClufDjVhGwC7n0Tor7NoIQP769mLPCgS2/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBkH3PAh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b1335e4e4so14609625ad.0
        for <linux-parisc@vger.kernel.org>; Thu, 03 Oct 2024 16:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727996931; x=1728601731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fq49TKAL9KYj/9vFkhY/8M25ZrgzMs6TnCNYxCvIdD8=;
        b=DBkH3PAhWGYeqE7iH/uaNn6Wrt0ejq+dqjUZKF+OmaVoVJBLbNqs/WDIwTDxaNw75D
         TuROMN/K7o9KbD9xhyIbrc5Hh/0kNiD5MfF2YjjYpbIdvHPUxCdb96q9xkzKMw8AK4cN
         SA6OP78zfi8s8RpFziNEo6bp9kgxyvL8PIfJ+aiYKf5PACivQsvu8o2Kwj7fFaB8W2Ck
         8Qnesy0lMb3xPSiPwddPIdd3r2GllfhPRRrls4uvuCypJ6j+p+ISiDbfuTP1v3T1xpfJ
         VhIP9L/7y9r2/EugGCowIPd/U+q37Vm77p7F7ciGBYYJHCWNfsw3bdaRN5MfV7lTzuud
         vlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727996931; x=1728601731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fq49TKAL9KYj/9vFkhY/8M25ZrgzMs6TnCNYxCvIdD8=;
        b=PFsNpJBYndcj4fKdzYO0qGsef61k7jo8/JsQiWBkjnSTOaw+eqk7VYeicx+0pRuDmf
         VtDHPfCNIc92N3hhatmZSJIeUI9nXBy03od8z0gc1gxG5ziIkluHjuAPNF3m6NJs2nNd
         UCIxJf7Fdk1srwOk0S1c5eq8Nu08QI9ucr7+HezrkO9//B0W4qQIvM6meh5H0bXWPyJa
         PRg6mKJBSCNdu4BoCELh+wsc9bYo6kmtKGPGhB4rBPW6G5hfsVu5+wyBp8eFX8aWeOEt
         8bKVZ5by2/jiTLdWfGLHAhn/vJxVdDbC658cbDlP2U/5zk20nItMo9yE4Y8ovgxAFPES
         ArsA==
X-Forwarded-Encrypted: i=1; AJvYcCUXBiQT+1VZJ4GCDxdAarknOb+c8v7eyeKoj2mEpaFBvWswwl1tzeeOsxl2hk450xTXNL8XGD6/A2v2Y+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXTzKSD51hoFeVYoYMAOaO9pteRe5cFXQy/1p9x2FB9fV7FRyf
	PEJ+KpA1jPH9HVKJXNeJL8lWnISP7mdHD4eRFKPN+qX8zQ93sWf0bNBW+xMf6VM=
X-Google-Smtp-Source: AGHT+IH6OJ4/Uk3BY0xSOJOLFONofUTjInCargyH5ZqquWtNHXAf25T/7/V34A8Fz0nm7YlN0wT8gA==
X-Received: by 2002:a17:902:f688:b0:20b:6308:fd2f with SMTP id d9443c01a7336-20bfdf6bdc6mr10331065ad.11.1727996931083;
        Thu, 03 Oct 2024 16:08:51 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beef8ea48sm13719805ad.149.2024.10.03.16.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 16:08:50 -0700 (PDT)
Message-ID: <9635d3ed-b60f-4406-aa57-3d8764b4f5bb@linaro.org>
Date: Thu, 3 Oct 2024 16:08:48 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: {PATCH] accel/tcg: Fix CPU specific unaligned behaviour
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Helge Deller <deller@kernel.org>, qemu-devel@nongnu.org,
 linux-parisc@vger.kernel.org
References: <Zvyx1kM4JljbzxQW@p100> <87cykimsb9.fsf@draig.linaro.org>
 <CAFEAcA81YtAGO0iFZRWXGjJb91DhWEDTGr+cjWbNWEW4yJDksQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA81YtAGO0iFZRWXGjJb91DhWEDTGr+cjWbNWEW4yJDksQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/24 08:47, Peter Maydell wrote:
> There's also something curious going on here -- this patch
> says "we check alignment before permissions, and that's wrong
> on PARISC". But there's a comment in target/arm/ptw.c that
> says "we check permissions before alignment, and that's
> wrong on Arm":
> 
>       * Enable alignment checks on Device memory.
>       *
>       * Per R_XCHFJ, this check is mis-ordered. The correct ordering
>       * for alignment, permission, and stage 2 faults should be:
>       *    - Alignment fault caused by the memory type
>       *    - Permission fault
>       *    - A stage 2 fault on the memory access
>       * but due to the way the TCG softmmu TLB operates, we will have
>       * implicitly done the permission check and the stage2 lookup in
>       * finding the TLB entry, so the alignment check cannot be done sooner.
> 
> So do we check alignment first, or permissions first, or does
> the order vary depending on what we're doing?

There are two different alignment fault checks.  The one for 'alignment fault caused by 
memory type' is later, after we verify that the TLB entry is for the correct page, which 
implicitly tests r/w permissions.


r~

