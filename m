Return-Path: <linux-parisc+bounces-2529-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D879938EC
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E14B1F24D14
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153BB320F;
	Mon,  7 Oct 2024 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdBLmZfx"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EE0175D44
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335872; cv=none; b=MARUYg3gptri/0HoRNeb5D3/9EmePDJ+lJ9exLaYz/TYoyBOMc5MEijOz4v7KjGx8ETUOohmId7kLN3ByC3JS4OL/TvBar+tqYa4tu+bxNc1Ri6x6bKhwYsLSuSOPbkN2PlZ4tSYJ5Wk/sJZw1lbxG0dFoj1YFPLAQcInca8rDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335872; c=relaxed/simple;
	bh=6JdKJKMR/HFH6sglNjWj1Yz7SUH4wh7jHvAkC1lJ+eM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbqkKKvLx8B223n5Wv3FIzDEYD+sQI2ECF7V42zpCx0gKYDSGLmHpxz8jurTsVH6zTdHE8vbywpXGCyjfAIvIa7W6rHVLPzZBcbghHaDbsk2SxpMZ2gaM19RpyS95aP4d3B5B3cq998RqLxFEWgarQj9X5RGoperCn+fYygbbIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdBLmZfx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-207115e3056so45193945ad.2
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728335870; x=1728940670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEczIr49pHVDmhTYxLG19feKRvTV2OhUJFNmzSuMIOA=;
        b=pdBLmZfxLl1LX27dxD/CsY5tmQLIjKeKDhe+aG6Jbr6h7kSNAnIFk6bQhJdxMkR4ln
         Km0OhyhSIbWNlP/2cjbJ8AEQCANSSJphZMWuKA3IyiIj7JjwR33JMJmJUdqLFQcF0iRi
         A471hjUlAWFpZHXNpEXZQTmpL602edy6Ge3Qb0y3kf9zE+VCngniyYLXb8qadFEWrPzI
         +SSeO1IEOCokjoTesKdjuKw1goG8ABXfUWl/HGC5ocuMIBX53QBezUlDq0ChwRxQGzm1
         yu95TME/tGXrscCpgczXTETNTTaKpK2xSnjZsA/Rp0rTKxAPGE1quFgf5gzIFeakFO3v
         cC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728335870; x=1728940670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEczIr49pHVDmhTYxLG19feKRvTV2OhUJFNmzSuMIOA=;
        b=xJdwgiowq9QhXxj73ZbOBJ9PaF4JiP2fMBl3IgXoCeKy5w0GGSwOJo+SFyuHkVjE4L
         pgTIrLSxorgqT7Rz6HaRwliAuxfZEE0a1n2iRz1KTvJ+7vohzrXuoj5xf3uAjjFpm02e
         lFYsI/drF9XQTM4h5Op8mTNwLElcMFk1IKmhzHRdtcNz0CDAx5+pYW8437ZEskYKMeh0
         Z8GPFc9+FB3wE24QkUw19AL78QNf+0Olfs/bKsSHB5BeKu6lq8Ob1khRlBBxE68gGVe2
         pki9tTpIQzn+ecMPzFSEm6h6f2/+e6czT5CTxGvtEfpKM/PQzAmhGvytN1whuStRRPXh
         cUxA==
X-Forwarded-Encrypted: i=1; AJvYcCUeog92LjvtPan9FRr5G60i3gUaTaSZLFU2BhPnAJ+XNW9FVUfcrCSBUxPROENgERwYy6Dd1kGKRYfkk9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+vZpjLDVlQxwsImFom+mrPhRgNU1/4n705Sq0NplJb6g0E5T
	CSzSbgc1DQX9uJKhflppQWdpAr6JWnB5sXkxcZ62juJwpza82FhTPqKtcw6nBAU=
X-Google-Smtp-Source: AGHT+IF+iFo3nBQNt0M8YZHcNiHTBYDMbNha0m/y303BWu+LZ6fyagZobPptPmMv/9P7CxHL+SpzJA==
X-Received: by 2002:a17:902:f691:b0:20b:af36:eb3 with SMTP id d9443c01a7336-20bff047d4fmr190816015ad.40.1728335869923;
        Mon, 07 Oct 2024 14:17:49 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13989814sm43541095ad.269.2024.10.07.14.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:17:49 -0700 (PDT)
Message-ID: <5c98fb68-df29-43e4-a759-a4b8f9a6bf0e@linaro.org>
Date: Mon, 7 Oct 2024 18:17:46 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] include/exec/memop: Move get_alignment_bits from
 tcg.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-4-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> This function is specific to MemOp, not TCG in general.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memop.h | 23 +++++++++++++++++++++++
>   include/tcg/tcg.h    | 23 -----------------------
>   2 files changed, 23 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


