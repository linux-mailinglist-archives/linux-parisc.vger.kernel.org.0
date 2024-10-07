Return-Path: <linux-parisc+bounces-2541-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BED75993908
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654761F24125
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D851DE4D8;
	Mon,  7 Oct 2024 21:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8+ukTpO"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43EB1DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336161; cv=none; b=OMntCzhveCO75EPdN38C5o5dPlYHNAKriFZ/m/+jONE8bfBaHbtS5N4KFsHiG0s6SE7HZ4OqdDwLz/kgwASx+Km6ygMOCXWgR2Ve9S38XNBorUhUrxq2npdeE3h8dkyu4HcsGNxR8AHbSBve6zRRvG7iJIB+VnvS3rIFOcY1qBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336161; c=relaxed/simple;
	bh=4d3c/gbzqMExs21SVumueUX6FFfVpELM5m67kLUFg2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETs8b9yfFUsu9tIGjnJ6VDRAXICfrGH6gw9syuTn0oDEribIab3+0txGhSvWHjuBY3YM6lmtEdpLtCrF60K3ox5Z6hrhRpkNzuXCjEWKIQZu8QVkSze28HEwAsHCD3H648N7aJNH0JzPZOKqmDntiPSeZiaoNri03NN9D+cRjAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8+ukTpO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20b5affde14so36573355ad.3
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336159; x=1728940959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s60O5wYAf6jx00TtsFTa4DP5HnU2LyNHVb304Id2ieA=;
        b=s8+ukTpO9Mty9YOua5YDLdTRZM1AD15jwS4PqUm58oufZxA1dpuPrePN4O5iMYXZMw
         WLDu4gHXOolQx1F7M4DGAdcD83VAt5g4u7JANXIIYVGxnjYMExRc04s9dVgc6rQj6NeX
         rIRuf4Z8oLbWjuHA72WB2Xrrb14r3I0CnSBFvolNUybiUbbzAmfZPWdB+tHM4LSflimw
         dJ7s4tsu7dnyTv7EWIVanFqfK99FVNZDzBmHRit5PPmpOYT3DHcV8xHWYajuFUbiuJxg
         jVE1gz/KqXnTD+1r+4x/FR3rg6fpMyoi4suCS+58GN++8YU7yZ/LqaAS6MyeBECyhx+g
         J1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336159; x=1728940959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s60O5wYAf6jx00TtsFTa4DP5HnU2LyNHVb304Id2ieA=;
        b=Fw3YOwnrLTzOHDbh8ZAjHDgeHUwWnKrT0aNBiOvCiROLaw9sj9mT2GtLGU6s6H8uu0
         P5K2rdUQFwoW5OK+x82Z/VdNAjw7cFuqhEroxqIYLPA7GxxLwBn6fgjLw+7LsXYiiGll
         HKhe6/DmkO3mqW69VuA3e+RtZ4vKYwon0heXNmgLOHw+NzPJb3OPSHXyJTney6rpsf6Z
         c+DssVK5Sq//k5FsrIw4ewKjSw8bZLVUzG4HCSjAl3k2MbxDrrFdXIHs13+Y4+YmTUnl
         U1ySQ7k1wgr91Ge9SpitLC9BwjrVxDINm3fSP8Z3gmn+i8PKTSK+1NXOS4rp5BJDzrqU
         LfAw==
X-Forwarded-Encrypted: i=1; AJvYcCWZf7C9p+MU2skZI1nkgNL/sbVYx8psUtlcv+Vlfvpa5vYObwmPvmVq2N45dq+Y0upoP1GvgmSsHWUZHHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1A31iRfBDLcpNEyhml9tk0gTenrE5+NGvyKVRrLOKudKoL985
	GauZ2zAkJHqYIU3mmM9A8yNz31TzKIknLTrHIa0dVw1Fe/zs7KvZcm7OYTZWrNo=
X-Google-Smtp-Source: AGHT+IEuq2X2j5M3Rc8qtgH0NBoziNfV19PVaUHfklTp3hTM6YD1W+hXeAgxThlOsil8iCd1VXi+Ww==
X-Received: by 2002:a17:902:db0e:b0:20b:a5b5:b89 with SMTP id d9443c01a7336-20bfe495d34mr188077105ad.35.1728336159124;
        Mon, 07 Oct 2024 14:22:39 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c528540a0sm693765ad.93.2024.10.07.14.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:22:38 -0700 (PDT)
Message-ID: <819fda22-2258-4d7d-9015-99ce43a7e7c1@linaro.org>
Date: Mon, 7 Oct 2024 18:22:33 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] target/arm: Pass MemOp through
 get_phys_addr_twostage
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-18-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> Pass memop through get_phys_addr_twostage with its
> recursion with get_phys_addr_nogpc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


