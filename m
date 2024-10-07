Return-Path: <linux-parisc+bounces-2535-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF52D9938FF
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E189D1C23586
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898B31DE892;
	Mon,  7 Oct 2024 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MG0ebSTk"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC5F1DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336093; cv=none; b=AMPnCRFNT9E7htgZ/2fAVhacH/tmV7/71j46bASxOb7TbHu7uugbStv9htGBuvY/VFxmU+fwi+3rjZbY99NZLXkoelUDb0u2++wt++fOVwX6xVauHtmraB2aOh5IwSzzC+e2NC+YeqLEE46K83bLjjTYcQfEye8WPK0ielBqsA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336093; c=relaxed/simple;
	bh=Hx3MhibWietN92eeHR9IiQgTpLIbenaok91OsPHXPxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJ/JforTyfB+vA548y/ZssrfQxSe7IF6Jgvyz9dw3Rjk6Adr/3CvtpBQ1+UPsfzRx+6Hl9YAZei9qxHah8OjFvgICd10ZGvTtG1/uqcWy8SK70nksNJMJgFCD8PnhCo3+9rlT6oz/NfJCINrz84AiTMWe30/PiAN76zh0ZK7p/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MG0ebSTk; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71def715ebdso2126721b3a.2
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336091; x=1728940891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mYna9qMjZZUIpL4hRT22EiNVizp9raO2/erNUnGgW24=;
        b=MG0ebSTkrOBogGSY3B4gJIlzc+Wt/uuXns+2fNwq9Y1DZAPCUd4k4R+3cxYBJ3bBYW
         OsQn1BYOJt4DcpnJok0XnWcFw9PhB1UjPzfW4uyAaO8UyD7QAZRlWW/6BJB6UkbStmXR
         COCxtNDqXdsMl2AioPGVfKiPJuoUryuRP2q885TceVZMFJtAi6x6+S1SsZNLMAlIwDzm
         5XWIQWuVWu0SL0dEsNkLvFECnDQAgyxkilHE4ZIY2yzKRB6xdA8fwnZmlNmInt/BJRaZ
         wy9ENAtLJTQQWYR7QL8Cvjo77eMwufqKbJkVYapUXB9tqU4EX26lFkdrze6RJCSlzQp1
         aCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336091; x=1728940891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYna9qMjZZUIpL4hRT22EiNVizp9raO2/erNUnGgW24=;
        b=jziNPbLlNEyYzXxkUbO3rXIoc0TCZqDXpesC47crCXYjQQzzovn7yXcDaI6Ut4uC+e
         WJCBBbM1znbi/ffb2L3pb4BWooBBClpvG8Pn2tBqkkIr3kXme0ti2AMYUgwMaLBpw+Y2
         Zmv/DwXbLnc532Vbhd2y2vXLJXAbXaFo+iO4h9t1FcDs4TvxawFEcw3Qm4Sv+yUTLp6P
         /BCxiCaDv1t3b6cfo62ZLI2t/Q4wYvtANlkIff7c4tocHLLA3qjXw3DS1XREtLN0UAwn
         qdZ+nIupwkccJFb3okppDnggws212h9orcvnylUhdriAHuimZiE/hJJAU8sAYEUUoQa1
         AUJA==
X-Forwarded-Encrypted: i=1; AJvYcCXM1RhZ6jBmPJg+/OlRwt1Dzyvr4IcZDA8iH+GVj3eRjbsccXMEWT3SRo4fmifx+LQAKUCJcerqMi4Y9zI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq13Gtwm6uk9Ga7gDybzgr4qZm+lEyrvqOE4AhGqWdgpTn3mGn
	9p4+il7F75z7od15AcE5KY+TwzNws0Kh0KgKeD8exUD+D+SfoCuU63doGCG5jTY=
X-Google-Smtp-Source: AGHT+IHMAZclbZR3J38FTf/f+yeMXq7jyHdBIXJCDBtV48SAw1zPZiqJHLdVs7a1K0FMvQPjzbTW8w==
X-Received: by 2002:a05:6a20:6f07:b0:1d0:45c2:8140 with SMTP id adf61e73a8af0-1d6dfa33c28mr18563895637.18.1728336091415;
        Mon, 07 Oct 2024 14:21:31 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d6520dsm5008257b3a.171.2024.10.07.14.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:21:30 -0700 (PDT)
Message-ID: <68536a4f-090b-44ab-b072-210a9282c1bc@linaro.org>
Date: Mon, 7 Oct 2024 18:21:27 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] target/arm: Pass MemOp to
 get_phys_addr_with_space_nogpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-15-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 3 ++-
>   target/arm/helper.c    | 4 ++--
>   target/arm/ptw.c       | 2 +-
>   3 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


