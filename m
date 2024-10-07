Return-Path: <linux-parisc+bounces-2542-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C576F99390C
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02DD61C22989
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025951DE4D8;
	Mon,  7 Oct 2024 21:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQI8TmjE"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A21DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336175; cv=none; b=ip0cjnarO5WDUb7TInerm9NjgDbA/F4WmTeJ0dXvLS+bC47bHjFUHGoPECC59BzzxtHler0GqNdM9fny+AL5q1W3xk3O1SoDVd8A9goD/Rkwe+WmVH2fsUAGolXP+mgxAj3AUbUxep+vt+kplhCwh6Hx3l2TgBVUXFl3SUBcwn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336175; c=relaxed/simple;
	bh=BRwM9P64b6O5Iuo36xMKQHyvBCtfGZzA/OqenD7Nn98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9LoNLPIztM48vnRfvLVW5nV0dTwtW8zwK3gaOiaBJradGoqFVDFg+0Q70sXmj6q2qmqkr1qtJQtjC+tdipKwN3DObv/zqKmKCArYC2GhTBtn4Xl/KF2Y4VZdZJhleahv84ABJ/io5Ali0J498gx32P6mDJg/fBIJGCST33YhdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQI8TmjE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b58f2e1f4so32932275ad.2
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336174; x=1728940974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQrX4FJYwBpWHhPKiJcQ2GuPdkcdNLrxWDBad3wr5hk=;
        b=uQI8TmjECQLly2laBajgMzgr5/9g6R9G4mJJpOj3xLxbdH8pyarnEHSGUmh0nHZTzu
         CKRl81mgMv8YxcNc6MGwCrnzPduRrbmwcU6gzmmf8afeft0ThdxRcq5CZ5DHM5L8RIOf
         ROM8StUpyldG39Vdt6ZvkuPEJaICVoVa63/DWKjZozSz07A4+noaDp4XfH36FErYHQak
         UT+3lk+rteR16CgPMWsoyrZhtRDuVdd8feK6Y0hvz4xEG8GnmXwLUXNnTyqOQ12z2wyC
         3OLhulsfJEXhBH9uGZ4XwG6jwJ8EHWZir2lQ+sHPtqbkPUePz8bBJF9P02NVpCKqf4R/
         F+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336174; x=1728940974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQrX4FJYwBpWHhPKiJcQ2GuPdkcdNLrxWDBad3wr5hk=;
        b=r9LRuJKYxWterWBnIovPw6HxUaGHRP446VAqFi2FGm0P3AjY2yWPPjkrgrc+pmy1uH
         VHq0bH+JqJ0asmTRoC8DUkm68e/NR4eyahw7WeKfbODK3VM1MjgNCR4fFDBuBLRgV+Ys
         0uKOTgVBfhc9RNXIRPN7a02ZRGDZkfqgpnVXsMD26PYUHFrmpBPVuit1KGsj/PFG+cPA
         XY3QYXe9sr5iMZOtKfJtBGEUU06A9bjaoG5xEXhqz6BiLmx74SxX/uK6gHdPIJhL/K07
         xH+Fk2cg1qyO6T1PaQlAKtK8rbavVsRBYTFbsWb5XtHfm7uOqi0cGiBdsr62d4KWAMMO
         D/bA==
X-Forwarded-Encrypted: i=1; AJvYcCVbKix4TYj/RH4cQxZoFBQxTBtKpb/6WO2eW3Sxjf6+ivKPL05wDTvbmKEtTJBN1oPjbcG77iYpHrORcJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoR8I95XDwJ54Fyeoh7tWJCj6EnX7KSC41xdXg7nM21j7HHmI9
	qt+22p2hjNXx7nGw62pqpOv62aX711AqxszPivWyvrq9OH08aNseLbxDwYF/ds4=
X-Google-Smtp-Source: AGHT+IGxE2UXWL4HXQi1bHHYsm1hmlS7OM5d6LOCRdyFm+k4HWWFBQAvPvMKtZKW0dsLxu5nZ9u7pA==
X-Received: by 2002:a17:902:ea0a:b0:20b:9062:7b00 with SMTP id d9443c01a7336-20bfd9b0194mr214054745ad.0.1728336174109;
        Mon, 07 Oct 2024 14:22:54 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13930e19sm43956615ad.166.2024.10.07.14.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:22:53 -0700 (PDT)
Message-ID: <16613db3-ac69-4999-8506-485416aab571@linaro.org>
Date: Mon, 7 Oct 2024 18:22:50 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] target/arm: Pass MemOp to get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-19-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> Pass the value through from get_phys_addr_nogpc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


