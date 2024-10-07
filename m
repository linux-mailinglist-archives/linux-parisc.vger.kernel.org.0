Return-Path: <linux-parisc+bounces-2530-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7399938ED
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38180B212C8
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC38320F;
	Mon,  7 Oct 2024 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D3oyWxIR"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D881DE4DD
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335895; cv=none; b=LB1NDfiUZab9oqLWfoAkGiEhm4DIWtTTW3YJ1oJPdKaN/42nYJr3nqNEbrl2ij1XEZ581ZHwDo8SKKzg4gVd+7P3Nvdr1I93bVkh3WDm4JFtik+2YwVZYntqRK9kwvVjWANlS72hthpoKMAGUVFV6rN9MImI7Cd57C4CE+ljRWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335895; c=relaxed/simple;
	bh=fqnIyh8I1L+ZA4vyW3NCxvQimZ+OaCgS+TCf0RgyKgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B29bazwpJLXNuiSgBsdpiARgPWxHu5TG1jM3H+QE7BCLq3T8F6x1MEzmfoZTKL9D+tB8aCxFbnClog2hVltozGI7rFc923JgVM1xZnGA0mMe4d9DNu9jm8zGGXlvYGKGtMQJixuQ+IhWqYwcH1c9EVDXjwngwUg6P6mjjLRCg48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D3oyWxIR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20ba9f3824fso36651775ad.0
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728335893; x=1728940693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUs1MzGBq8oTTzLkkmLgPiacHYjlN0lvec1dDM3ysJs=;
        b=D3oyWxIRQBFSE1+nMgltQTm6GnongKZ+s64e22yG+zhyl/PLSv1/3d5SWcpsoQBfYk
         v/YCi3tAt0c/u/QbT1olqhlMCNN9X7xqVG7n/YB95x3kA0dmrvhUAg5DsxBFugGCnnIJ
         wO3mo0VnjFTiBruIv9XDhXhiXDANnGezkf7Wb9rZbSg8LCB3K93JWdjN6B/KMflRuGYh
         seS0LGa2XaCFEjc3wVa+obW1WTdehRUQmHFAD3/vDrYIsmlv+2au55zxH1WKzFDTQwJt
         v10fG5xdXOeUUmvGP8HFwujSkQGsMKYswMwhMaNlUITYXlEKi0Hsr2v1wDxRuuA6Shzc
         uyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728335893; x=1728940693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUs1MzGBq8oTTzLkkmLgPiacHYjlN0lvec1dDM3ysJs=;
        b=Dg7LepBNZ9gRsaT2ElrckiWP/6NCZS3esavRoqVeecBnud7S243xgFyJYtSC0uI9Th
         J95WzGlOVOqinbYRCwHf6a3fv3bRgVAkhxxPJt8rCSgo+5OBxp3TmVZ5616sdtpOgsHj
         b31H/yGQkO0e1HKOJcrIX9fgN2OmlgGNmLw7MwZ3rb7rkaa1/ml9t29UFSv+/cdb6khb
         qW0wNmx8tRJyQgb3kxwAhBM3H1SEXmgBWusTjFlPD1ISxnRa7073aVDfseN4eNYS9hdh
         bQR68ronJdfWj+FRClb9PN3FC/OH1N2lNEkMNTyrJHe2HWpaCS7nXeTDHK40EFrsWDFk
         s80A==
X-Forwarded-Encrypted: i=1; AJvYcCWL5hjnzAtwMecMDpsiw94DykU6Sh8NFcWy46YCfFG9xiqfjGQgyvfjouUK9ErkTkzqZPkWLgWKNrS/MOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/wAF9ji/+0YfMbKEhjvLKECXa+vxnKgrrBWewsd8wLRWU49Wl
	v3VjjpLmQYXlInOvTjeOmodpxxOqBIeJmrud9S4ZxUdrz+5wKKcoKBx/rWrnKpA=
X-Google-Smtp-Source: AGHT+IHLjxdI73ZFA1uACTxTQR7LmFrpC2nLEP5ovsgcbR9VpKeVtrR3TIrUVb4iSlbnZFd2IgsyBQ==
X-Received: by 2002:a17:903:230f:b0:20b:bad4:5b6e with SMTP id d9443c01a7336-20bfe292621mr209530905ad.38.1728335893666;
        Mon, 07 Oct 2024 14:18:13 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1398ee06sm43758895ad.288.2024.10.07.14.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:18:13 -0700 (PDT)
Message-ID: <88485d15-b86a-430e-91e0-0225ddff5849@linaro.org>
Date: Mon, 7 Oct 2024 18:18:10 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] include/exec/memop: Rename get_alignment_bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-5-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> Rename to use "memop_" prefix, like other functions
> that operate on MemOp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memop.h           | 4 ++--
>   accel/tcg/cputlb.c             | 4 ++--
>   accel/tcg/user-exec.c          | 4 ++--
>   target/arm/tcg/translate-a64.c | 4 ++--
>   target/xtensa/translate.c      | 2 +-
>   tcg/tcg-op-ldst.c              | 6 +++---
>   tcg/tcg.c                      | 2 +-
>   tcg/arm/tcg-target.c.inc       | 4 ++--
>   tcg/sparc64/tcg-target.c.inc   | 2 +-
>   9 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


