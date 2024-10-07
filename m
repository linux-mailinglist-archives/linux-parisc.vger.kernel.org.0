Return-Path: <linux-parisc+bounces-2528-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EB09938DC
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B19FB22AA4
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02025184551;
	Mon,  7 Oct 2024 21:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iV3mHJRx"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794F3175D44
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335795; cv=none; b=tUkF+ZNzlaQ1N78jECFTRD7FSnx4AP+qKfXBja6bGsxhUDxxXoTxbjJ8E3lmdM58cQG7x1WdBCcF0YoMOcPQtjDDyq4a39t41REqQbxHR/RzsUM4QmaAyfzmfeND6261W911gOV+ZzDQTOFTsUcSYftYmi+yvZ4JiOyyvUTnG2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335795; c=relaxed/simple;
	bh=AegJ0rUuapT36+EJngGh5Xi/hpkrVOF0+yS7jZjZNjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUs0AEd/hUc7H0gKDwKrPe/7yj1MiGX3iI6EV3QDNZajsfd9VxUNzwQ2XoMKGAY80zsMRsbOyen0FeLyM28s0xfVOlE+wjDUmurUa1udbDn42wU8SiA1YVLpZciB6Ta1J8kq0ujB4QDdvoobVC5V/dSq9A23vE6xUHMVwvLO9ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iV3mHJRx; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20b90984971so50731875ad.3
        for <linux-parisc@vger.kernel.org>; Mon, 07 Oct 2024 14:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728335794; x=1728940594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ln56M5/7Z1rmHy7R8GToxjq0I6NsCa+9Vyn2pPN8Shg=;
        b=iV3mHJRxQcCxy+GoZw7vIidWMJ11sj/ThUacBgfk/ggJ9F29Jp9dOAVY9uavXAz6PE
         Vm/uC/8cArVobZJk8F8AnTTmCS7ikg3twDf5BHz2zruYCTVyEa7mmLj25PxUfAKf7Y3B
         FNiujpB4tceqTErZwNyUJMRCgb0BnFb/j55sMoJJkNz9waSxl0Onzugr5KDWKZJt3Ksh
         6ztYnGeFbfAyhoCnw7dLxmdQXyOGZUK+Vcbhgi5OW1OW6AHskbPYPvf9HK9iZIFLEVMB
         kaU05OP3L0FpIMwvHdPIXObT80NeEZUiHt6xXSOOEH8t0eesX8EdxWIFTcy+8OsaTPlV
         CAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728335794; x=1728940594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ln56M5/7Z1rmHy7R8GToxjq0I6NsCa+9Vyn2pPN8Shg=;
        b=A8ClFyGafQglFVvTMoPUyZjCTenOgNvrLEyiqvrhswwXKG0lUqcr9UoJ183urUjXdS
         lTOtyyfAivgpqRBMBKYiaM0gz+FjG/ncfaEOkb4IqT0yeOucaA2kW8vgt7Sy5kBWhO6Q
         DmLrZ9oAEXOHBKI5SHbf5lt4M9/aoYeM1Dldp4c9FceN2qly2oNRZ107XLBXGT595OUf
         td2rsR6exvzF2Nt07kT6Skh+TfcHxAx+nvfo26HbUNXohmiFiJRMfcGSAjuzMG5VSlUH
         4KjShaBm8gGEzM23jobLOZlkdhARkpeXLKG2+fpfF8kpxWnH5BfnGDpLkEBUtzSsh6bz
         0cbw==
X-Forwarded-Encrypted: i=1; AJvYcCV0CMvVtbNYw6l2J8zM8mlDMgqZMWFTL7ZZg2py4LbrtfoU4quJ6qGO3OhHYREs93lE+QVqUUCl54P8E2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWARf/vBVsSGZZoqqxFI0toor83zHBi+Q2rMH5hp4ZHBx+Q3N
	KASs/30565Fr3Gd15yK4RxLXiubv6Y2dXctbqbXsmWZgv1E+9Z/cQ8BxVrmdij4=
X-Google-Smtp-Source: AGHT+IHPuRyqkW3x2ZbtoTRay8gCRNWuUIYkLU4KnH8VRU/arghyojj9cCqZi2hzJs01mmAwKrWTkA==
X-Received: by 2002:a17:902:e802:b0:205:810a:190a with SMTP id d9443c01a7336-20bfde65a66mr158141555ad.2.1728335793937;
        Mon, 07 Oct 2024 14:16:33 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c139391dasm43728525ad.124.2024.10.07.14.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:16:33 -0700 (PDT)
Message-ID: <77f6c925-651a-4b90-ba41-f5f1dbf583c6@linaro.org>
Date: Mon, 7 Oct 2024 18:16:30 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] accel/tcg: Expand tlb_fill for 3 callers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 12:25, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 33 ++++++++++-----------------------
>   1 file changed, 10 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


