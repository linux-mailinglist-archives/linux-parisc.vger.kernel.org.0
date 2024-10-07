Return-Path: <linux-parisc+bounces-2545-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9D993919
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30FFF1F20F98
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06EE1DE4D8;
	Mon,  7 Oct 2024 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WdyPWs1M"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682C21DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336333; cv=none; b=DMnr1sLk9Y5ld72HqafglKfgOdpOoqjbNQ0dSBJN/UPMw2gCW1rrfQUTCA6NftqaA36ZF7ILEz0pr1qDsCBowiuJBHMZ2pves1cE+vsMN0KzhNd8HcLIwylN5xfVArNBYvErY0cklVKtiv89GC6SPUFbPz5boaDVLRcusZx2aEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336333; c=relaxed/simple;
	bh=vZaj+VfqZR1y502n4vR84W4hSDELbgSfUu3P3KNwGYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meUK/x2ZJwlwW+EGD0hjSWDjMU69NSSbW93en8hY4D48EF/w3paf5WGEdcF10wdS8SJEuP06DIiQvJHBCeXG0OOXeeZZ1rLpHW0Nnww9VWd2xDyeaHFHN7PHbCBddGYOkCVq6e1yn7TBHLzDINLCVGaoHD/3p7QMghofjRtHWe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WdyPWs1M; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so3748693b3a.1
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336332; x=1728941132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvhNWuTmiXbiPL4r4jbXllO3aWtcbM0XDS1GCHGzoYA=;
        b=WdyPWs1MB68ebu8XPkGKgxALkZgypTJEbvK+LcgXvWpRk9FaKiomvTjGEDkRGjTQMC
         8VuTeSPtFErBZgkrNTHhkymkQtP507KWtovXzn2MCm7PNQaKSgzlMNLhRPaalcT/mHrn
         T2bsz2Cl58C8r54kFRgAeaHJ8BnvpmTrcx5lKANQofHw4hNewq8+CO8ldUaOi/Jhn8wO
         s5DazvzZ8azAMaxtYoylhuSyeb5BJx17iosS3gTFH6wEN/h1R15wbFAYRYVwXjt44D0t
         uPBJ/g3dHqY1WXkhpA5LHExFo8n4MqnN0xdg1l/TsIOm2jGIhJhdM8DcRthJ8g6fGCjn
         Cz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336332; x=1728941132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvhNWuTmiXbiPL4r4jbXllO3aWtcbM0XDS1GCHGzoYA=;
        b=McCs9w6abLFEe1r3ZTAtL2aEdTdb439rppZQ3IKrslwcVS+6u5r3zhm00omq4xY+qH
         7gR7JfQ0j5Yn6sbXYO79oBBr2hIalU0Mb+m2XzPkRobC/UEqFnr4AgIJ0tJ9gef4iceG
         TtlEaS+lwhnVuHYYnweGMwPilSc74bQ7UnB4Fpn7IheuYQ7qTJVAz3VOn2/NGDGrcLN6
         RpDzTp+lmLOSDuy7K08Vg3+WePibn9Ql6TwZTgzOqC2AbKOajndxvaN2FhX0xqtUelU8
         vQBWOxKTdLhI7YNjEPpwryMDmnqv1rBOjHYprd3jvyVRHcewI7ErVc2+E/0Mh4YeZv+x
         7kXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxwNZCtSH87DgX2WppiaVziAYyl3zcJeiZgwTcT2cVj+r1bb7EFuqd0CuDq/+SYb7xJakRgsYwYr7pYQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKl9pa/htcmkFhN0oi/I7M64AgaLoYgHftAryBw67ej6JdJy3+
	/KraPsmmzeXE2kKA26NLrly2/if+NRjwFWrDs8NfMAjTILxj1pHSEonqW/r9jZk=
X-Google-Smtp-Source: AGHT+IHXPDbu9GiUdYV8Znqu/vftPYbbTENCnUoX5/c+cqoS+dsr+OnFvCnpTsrCSioOJE4B3/ulTw==
X-Received: by 2002:a05:6a00:9289:b0:71e:fd5:4efe with SMTP id d2e1a72fcca58-71e104cc6cfmr1595660b3a.6.1728336331634;
        Mon, 07 Oct 2024 14:25:31 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbbac6sm4842201b3a.39.2024.10.07.14.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:25:31 -0700 (PDT)
Message-ID: <96f27a23-fe87-4f83-ab6e-9e314addaf4c@linaro.org>
Date: Mon, 7 Oct 2024 18:25:28 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] target/hppa: Fix priority of T, D, and B page
 faults
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-11-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> Drop the 'else' so that ret is overridden with the
> highest priority fault.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hppa/mem_helper.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Fixes: d8bc1381250 ("target/hppa: Implement PSW_X")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


