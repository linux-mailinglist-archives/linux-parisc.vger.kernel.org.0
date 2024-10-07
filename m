Return-Path: <linux-parisc+bounces-2537-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30AE993902
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41BB0B21450
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904701DE4D8;
	Mon,  7 Oct 2024 21:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UoW5fKiv"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2441C1DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336113; cv=none; b=vASqZQKvC9/s90lqOxCqWDA42SmTHvjqzkN0IT0OPE/XbtTrlyt5O92h9hK/1a5m7ifaV3Oi9IUyjjbOhT5iqXtcyqGeQP/DAqdqJB3uZQQe2Y3fUn6iupAN8+otnwcsQ50zsnBJ1efJjZ5wcsG2R3l0OrHtBQw/fW6J1gClZQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336113; c=relaxed/simple;
	bh=F7VlpOQXVbGm+Rs4JqU3QTBQDEi+8w7NaH5yQh6exmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ap5m7t/d7ScaPxfD1nidok1br4GWzAGZob6hIN+pYGz80EumX1REzU+R2WwedMiRPbRbUYKOjjVpk693EW1J4DC9Lf8csvN7X1eIj08ZUaJllRNl8YoJuQU244EZWAeLSp6xwMJBRIHQiiBmDBFbEJDfJneoQb7TXR8e17AmIX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UoW5fKiv; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7e9f8d67df9so1653301a12.1
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336111; x=1728940911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8JAjpO8eNde/9AgguZ7yeqp77mIn8hCurGc5RPLjCw=;
        b=UoW5fKivN4O9Eqz4Z1B2KMDty4dZ8DqkUb2MgAhgqS62454jRpMxm/kBAl3V5LyvbX
         qCdC4AqAzEjyXCtAUL2CBiUHOWlI5UwrOnzJWFQvNFalMN3B3YjpDecrLNfXMmlmaxA+
         rj/x4jIZh0J2QG12Qf6x2Rgr3Paa1g13Jr3rCSV50Mjv6kNFfVezn5ZUFA7SnIiHeWHT
         YHpaYHWfCZaMNW7BehXJ5xMA+eMklZJfM2F5pQkmtsOwuW7ltzZkY6MVpsNR+GVksCac
         xwUgOkJuv7xOJq5pFBdpUMn99+hOpta0osKrLfEYV42eyLERQZYobgY5EBzo3gHLxDHM
         WZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336111; x=1728940911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8JAjpO8eNde/9AgguZ7yeqp77mIn8hCurGc5RPLjCw=;
        b=t3L/pvbmiONzV88rKOUVtLEEvYZJg4WTdOpGLQoOyTSaEXv//sjDI0CbsrDHnCgtJ/
         TheSL3+6pcLVJqczQONIDXJX5cRR/XLMlMYGDkLcnsyx0xjcTjmnlJfxy/q5489z6Hkg
         NnUFO7kQPmLRMY5I0Bhry733tMuin3yoLqK+/ShGWQsFkxD5i3XgJz6EGsxt8Uf92Q7G
         igPwlzTOPoxllw6lBCrYkgYGLVxd4iZ1ZPvjWAicUs0NOEXUr/slrufF+Z3efuxyU3Jb
         xszKq+TYRr2Usa4KwhTwzJBXr/s7nrMWgbbwSGHeQMWh2kedTBUJ9dRVMhRweooUXddj
         OOvg==
X-Forwarded-Encrypted: i=1; AJvYcCXcpDVbkiaNssQ4SaorV/OfjodoT2XZdC27O9/KZmpxCJiwwLI+QrrEGIvjrSWwcTFbl2S3ZBUaAvOsIhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk1tbIwrGqU7x9PhTiqmhcQ4ld0d/ODqfYZXIUTLyRSxNPv4qK
	BYjUaYNyrdQUQSoaZZixsmCfmpLv97NWBY2jBMjccR/lME9AR/eWNjbIGuYzHbw=
X-Google-Smtp-Source: AGHT+IE7UmUIJiV7Ff/gmSwqOwx7Ayu2TtlDU9/HAF8l9GK45IXC9sM/RYIEv2bsEy1ykPT3Tx8ZkQ==
X-Received: by 2002:a05:6a20:b58b:b0:1cf:6533:5c86 with SMTP id adf61e73a8af0-1d6dfa40a0fmr17450432637.21.1728336111574;
        Mon, 07 Oct 2024 14:21:51 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d4538bsm4857433b3a.104.2024.10.07.14.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:21:51 -0700 (PDT)
Message-ID: <5b98abbc-8d87-4e99-90d8-9600bd5107cb@linaro.org>
Date: Mon, 7 Oct 2024 18:21:47 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] target/arm: Pass MemOp to get_phys_addr_gpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-16-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


