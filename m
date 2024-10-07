Return-Path: <linux-parisc+bounces-2539-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF15993904
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5FCE283F3E
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01531DE4D8;
	Mon,  7 Oct 2024 21:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZFqmxQ6I"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473611DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336130; cv=none; b=PHUWDFuzcCEAhQV+MyNkNQpLKNPk7blc/m9Q5rJUuYh77d5qZJFOOKbwSCXjH4CIXa2SK9BlFfb0CjZs5l+OHXcOzIfYWxoJ2XlCOytwabrGqFEDSJokSlL8cokBSAE/1OlwFBlmJX+jQUOo64ZBlXO9nHt7X3zLumHIadjbroU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336130; c=relaxed/simple;
	bh=ispJJu0v0bar2i/uvt5yzFPYmdltHI2cRkCXryeJIFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spZS+359/lpox01Djm7ptBZ9APU0DGc7+HCyqQrfLznsTvi90o9JwejwfNgRSVoXep5o5OscD9utxrVORhYR5i89PYtT6tg8faz4e2KERKRCBl3pVh3b5Ici/hDRKqNJAhbLkmaOp7ckmUJTV2fEMvNztDn0rK72dKdE3yUvFLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZFqmxQ6I; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71df2b0a2f7so2015259b3a.3
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336128; x=1728940928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbC6iSFiT+vyi7lenYJBdeaISTUeTzDuIpwS6XLTde0=;
        b=ZFqmxQ6ICmbAP0tmI7e5kk4+G6Du9stC8HKtHDwB2X0D7gAEL8/EqGb9kOH4cwy9B/
         Gms0oniIzZdt+Cjv+9YhQEAUYB0HSGPaDo314vAaTm859ESQQzvIETDK4JXkHvAdszjq
         g/s+dhgx4Z88ifHYcyMeLWgBxc8/cVg8QUJkqelWKOX2qIrDcmtf39vAz4ZXI6UDoQWi
         qNr19JvVrXcTn3AR9Z1pl9MWX52gKn9FLwCE52ya/Grcg9s2KxYzmBst3vnfqM+DxkQI
         9wU+7xKUF/abl8I92LEenmFS61vXeZ0z0KBDObiVrAGerOjWbfURMkTGvUlTochRsyh6
         0w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336128; x=1728940928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbC6iSFiT+vyi7lenYJBdeaISTUeTzDuIpwS6XLTde0=;
        b=OPygguRux/9mEoOIk1bTudWdDCcabQVju69G1rEe43CRaOX2L4nh8hL9FiPuviTEhY
         BrMJ7swNfoMhaJN60zArv0d+Ytacf/VHkdCYYe4MtlOqhXB6ChVJuak9Ae/htXqXtCuX
         CVm+zwHDKF+KGnra2vzffPjrpNXpxqbF7ZJjBGjSXWNJ1BtO/dVEtveDioZW6OUjZO3O
         5jEUBfScKcyQZPQmQEuAXhTlua52XuNSwYJLSFLOm/3tFwxAKi+ctn1AznA5/faklkmp
         AuZepL09f0GAAuqjtSWj6na5Y8kQTWWcC0ATxoUnEA3IR30c31Go64imO14L/bCtxj5z
         dZXg==
X-Forwarded-Encrypted: i=1; AJvYcCVy3I4sJj5rFZJwpkRB3A5oLw73tuLC9UuZgheHBppVxG9hzWpbiCPDZSrBQ+GL/K/9oZlxEFSJb9fqp0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfFQomGVfxvAEo0mHetM3Xmm5MNVSgHxERjEzE7vphM4CRuupn
	BOXmtVlZfdEeUdRlXCxbFkg6mNqMI1K15UTf0JlM11H661oNaCx/Evb/E8zXsUk=
X-Google-Smtp-Source: AGHT+IHcMgpcblQ88BmMDtyLEo+3l2e90THqkCBjAA7AYZv3VuMXhqSdmGZ+MOg9Fynw2K+IOkN6/g==
X-Received: by 2002:a05:6a00:2d98:b0:71e:cb:e7bc with SMTP id d2e1a72fcca58-71e00cbe88bmr8548269b3a.22.1728336128601;
        Mon, 07 Oct 2024 14:22:08 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd0610sm4883622b3a.69.2024.10.07.14.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:22:08 -0700 (PDT)
Message-ID: <3d52273d-d97c-4aa0-99fa-fa672330b8c5@linaro.org>
Date: Mon, 7 Oct 2024 18:22:04 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] target/arm: Pass MemOp to get_phys_addr_nogpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-17-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr_gpc and
> get_phys_addr_with_space_nogpc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


