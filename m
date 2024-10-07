Return-Path: <linux-parisc+bounces-2548-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2122B99392B
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4895C1C211D0
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF32C1DE4D8;
	Mon,  7 Oct 2024 21:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNp9LZp2"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0AF1DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336446; cv=none; b=eW5siH+Gzg0fX9YedHwMNv68OM7O+Uj2hZRZ7RcTAxEQHNp6FJRriuZ1OO7r84e0I7tzWEaqEjajQpyCqiRpVJ+1H+y8/nnpxDxVlHIBl1pZetd3j7ABpsom3DoLG7PAba4MErjeUjxQ9b0Zjxjyw0FVcABfZwzMDLynSBjAR4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336446; c=relaxed/simple;
	bh=Lr+95IIsAjnOzW3D5BnZsR5NQWbvw2Dc3gTt7Hpo+dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9j9wQYfYMpRw4u4wQ2wvwcDs4Cqg6aR5SdqjuxHop90Ev0QinHsyw+pM8pX1WlV9EZfnz1x0Y9xddqOi9wwgE6faqVq051iI+opYahjUQkCOCMPa8eo8BQ2jFiVmUVd973S2r/7821prs8ynkoBA4L7ces3JZnoTkyIAY5P0Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BNp9LZp2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71dfe58d85fso1253859b3a.1
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336444; x=1728941244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqgDnhxYcJfnpmb7/gzzhepYKSy48HDyjJmQSXhkl3Q=;
        b=BNp9LZp2QF7WFSy2b++yvxBPV5AyoWlTQXwN/EzF610Egq3whILmp5GMx6Fo02/Dhb
         ILcPhxESZymP4QoHpnyV9+E0YR/cgYPn+pjivZOWgvImHtauIwJTm7wfDbkxWDJQI6T0
         C5gwL5w/djGmEzs6EIvuvIeCXuTdutXgUYhYyi95gCaxrReKDwHTXLEWZFN5tbTJQLVc
         /5kUznkChaVloQyP6DnUcjQX/VdEX2CNN1TXXNXa5I7Jc4sT+DSt0dUdmtn1vS9c+njZ
         E1AUIYCulisXhvdIDhG9vKGoSpsOU+cHgrNNgeo0cjJ+/1nIHsD0sdewcThw/2zZ//zt
         07xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336444; x=1728941244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CqgDnhxYcJfnpmb7/gzzhepYKSy48HDyjJmQSXhkl3Q=;
        b=fetRiqp5CcFuZGWdAwoRR67Rab7EGoZNTnWUUFDyRjj34VqaQ1pq3ltpdW81nzxRzy
         qjE3ql/QcX58BqIiCpJX8rO8CL9xQcU7r5RloodkMWyyBTliQG4qJV1ZFStOe6ZC5k0J
         WngwFip3SEGDcrxv/ZcbyWNZHTDOACzSZUJHzJPVMGkiTAWNBDOly2oRWzQjGVFoTSdU
         NRsCIYBJdRwffYxFjX53mC3U7kSWf377uH7HC3tDi1PAmItYZg2maegFsWABczARZJlh
         zRzNCRpJoYwjIZ17VE8ynHid4GY0tw5FtxZfXMZoKL5qNHs3LWH7cPPYNNQaxJOp36N8
         /aHw==
X-Forwarded-Encrypted: i=1; AJvYcCXnmn2/KFeWyXsIXhiGkcn03se4lXEIc6lHDPgXm3kWol4c+tQOnErKDtC9zmeTl4lfWMAS1O99G3USYoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDQheRfHxZ0EZiruqdGkiy4CB9vwOp5eezopQ/XkEbPWrELLsF
	ZfRNrSXXxgYA//xnZrAK10kRYfKxxjYLmFuvSSnAg32Fpyycy3kv3ADj/whQSmo=
X-Google-Smtp-Source: AGHT+IFUSSiKDp/IPG9C3v8HSFzU/o5Dij/QuIbYEIpT+b52zosK/b8fiUgzmvLLH64t7gKuN+CCOA==
X-Received: by 2002:a05:6a00:391b:b0:718:e062:bd7e with SMTP id d2e1a72fcca58-71de24600e1mr20318300b3a.24.1728336444536;
        Mon, 07 Oct 2024 14:27:24 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccea54sm4890081b3a.68.2024.10.07.14.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:27:24 -0700 (PDT)
Message-ID: <a3f85304-e14e-42d0-b913-f551702ea6db@linaro.org>
Date: Mon, 7 Oct 2024 18:27:20 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/20] target/hppa: Add MemOp argument to
 hppa_get_physical_address
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-9-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> Just add the argument, unused at this point.
> Zero is the safe do-nothing value for all callers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hppa/cpu.h        | 2 +-
>   target/hppa/int_helper.c | 2 +-
>   target/hppa/mem_helper.c | 9 +++++----
>   target/hppa/op_helper.c  | 2 +-
>   4 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


