Return-Path: <linux-parisc+bounces-2534-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC32E9938FB
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE0C11C21868
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E68D1DE4D8;
	Mon,  7 Oct 2024 21:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vHvsQYVU"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5081DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336074; cv=none; b=tbVRmP/8UCB/OYur2a17g7hBtVSU3iFOTKVfLcukKtLY2I36LlvMa1Kz8Mi850K1wDjL/zLRSguyN+j8dQZEcRhycjhmhcgDPQiTTg8YvZOva9KgnTXY1sbFT7TRr/or+SiU2HB/X/H62eKdrhTIF8v0srLmwJF77/A0JVHDSnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336074; c=relaxed/simple;
	bh=spwYvuMo96LigMEYh+oYAMpijU2QxZT/uZiYrYEEf54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iojaxwox6clsNQTFR3wCnYw32eA/NELJ/5JDslAHSzQekdsPubkFoDqdfUpA/Ne+mHaJaa7x/NWb1a1DSLTWeyKgbPxllq1kYXuBqF38BVadCCdb4DLVuwC4i2lqrSkw5q3OaTSkMk0ll/mUV5sFEwD/WEcxkq8ZomSsAFQ7s0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vHvsQYVU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b90ab6c19so52678525ad.0
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336072; x=1728940872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbs7g7pKN0azl4wjF7esQMSxCGT5yGYvgL2s/yoMCts=;
        b=vHvsQYVU9ZF8CncJHVYx9twrhgU3xesx8FFmmU6+JoOVN5L5kOypp/V+l1gC04GiZ2
         uj7h40VuIe5ETF4HbRwWxj1aiKrw7ueHEVBJoYfTQiKCppJAtX2ha1JYG3kSJmws2ez+
         1JehspZdiiFkmFO6p0Yfe0O8cp8/lWBpYLOEO2sx+U9c2A0WLwFC5CEN96O29y/mYtCD
         J7u1G9GqZKk3pSTXrAgzpPQ7xPU/yTMTtgqiOKKTiNtcGPn4d4j5SG1Bdd+tInqgCynR
         q+eKh4zoXfkDsJ0je/4JVulSqzvt2ZJ8nep1/c34c01caDPLsyMGJN1ZWMEeb1lzJoQd
         GAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336072; x=1728940872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbs7g7pKN0azl4wjF7esQMSxCGT5yGYvgL2s/yoMCts=;
        b=OYS/SsHR+q5mb+ZNQJ8LwZ4lDQGpBMQerrGWFnQf28WAk8R+GyvzRas/89eyhewfWa
         uTvtAJ1RORmzXego8s98RCVYCqQsyjNySX+E6gHSFlYJuERVluZHBv4yK0uCaUtBFBrh
         nLrs86bJi7pSq8dkq7NHE+I/3ByCcy//7dnNhF23pyN8KPKV4LTTXXXBYEV20FEbO2Xn
         tcNZyJvSybChGISoaNOeMyqCcJlpjTVVGNd4qWwLYSdXxecrKEiASrXOXNOOUs/jkLL2
         6Uw/ObVjY40EpKBix3e4E6MTJnQovvHpJWdm65238jCQqXnniW50YQPog9xyrmJxqjNm
         B3EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHzGi3EVHyjsx5V4lBeV922CX7ArwtL6Io4zILbA2g10lxcPf/qVsq9hY2j+Ib0c4k7gv68V90VApolUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhwxwEBAnLr1BPm8TizH7+WAd+rT28Le4TZjUQFbp4UUgQGmNK
	o2bdJ/dCTWyxNVGQGcZiZU5hoY/kA/Qhdjr+b1NaOMNECXl7a6yvWmJGAEJOmmI=
X-Google-Smtp-Source: AGHT+IF4M96uWhBFmpYxzsV8/xioZOTo4p5LmH83ChcNBWKxusaQtdWL+kwvVRtzM6Fzm3Kql/qg3g==
X-Received: by 2002:a17:902:c941:b0:20b:937e:ca34 with SMTP id d9443c01a7336-20bfe05d555mr136152035ad.34.1728336072552;
        Mon, 07 Oct 2024 14:21:12 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cec9dsm43790165ad.103.2024.10.07.14.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:21:12 -0700 (PDT)
Message-ID: <19da4a11-1d0f-4c9e-932d-2dd150e33d7e@linaro.org>
Date: Mon, 7 Oct 2024 18:21:09 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] target/arm: Pass MemOp to get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-14-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h      | 3 ++-
>   target/arm/ptw.c            | 2 +-
>   target/arm/tcg/m_helper.c   | 8 ++++----
>   target/arm/tcg/tlb_helper.c | 2 +-
>   4 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


