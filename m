Return-Path: <linux-parisc+bounces-4285-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A55C693B0
	for <lists+linux-parisc@lfdr.de>; Tue, 18 Nov 2025 13:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BCB2C352A3B
	for <lists+linux-parisc@lfdr.de>; Tue, 18 Nov 2025 11:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85077350A01;
	Tue, 18 Nov 2025 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6KXI7E3"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1C347BA3
	for <linux-parisc@vger.kernel.org>; Tue, 18 Nov 2025 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466919; cv=none; b=eNHVyx69m3tp0sSk2tldTy8YkZxQ7Jh+MYYjSMY2N/2qi49bT2pAx7JBE7TPJjpLbp6XD8FWdDu7kPm9/0NdX4XxvHZ493cUk2do+eJUmbCVOGf219O/Kzda56IZRPNdLVjbKjgyQn08oVOwSo/nzxIflRGTLtht6gCtlqRBlEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466919; c=relaxed/simple;
	bh=jneRGbDx8iaCsHjcSO3LMYs6xm0P9/PiTsbxJnh68lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvR5wvbfSezxRTgTVZbTVox/IECP9xRWvNgjvOKCSdY4EiZheMw3n2qPsJ28FLAW1fwBt81rwQsVaOebli6fJwCwn2lM6FrWq8BZOTwuf4CHYj115S0y2BAETiHgNc1aPSuXHe3BkkRnxX7BN217VCxVeyYbncFt/OBHTq6EFok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6KXI7E3; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2953ad5517dso59613215ad.0
        for <linux-parisc@vger.kernel.org>; Tue, 18 Nov 2025 03:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763466917; x=1764071717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v8UiKRyyvD16t4ENb8APUiQmIzVsGi/FebBj0lOkJ4=;
        b=I6KXI7E3s+zxub0ZQ8DsKJnuOVjMhxwRG1aNuLxcBoUfiTvnon5mLGucGki0piBkZy
         4x6EIJhKAVqNx5p0F3BA+RKBVamh+XetjdT128/kPHI5nxiC8p3Yb8kbniJnbmPlSL0n
         Yr5Tr/JcYUk/X1P5cL8hI8MEx761x9YPnBURS3SllkAFBC2RA6ughuNysbBCCnT94HNX
         UfGJ7XUBidSBM+rr6WFaK2omGalqaHA6VQFPSVWBwL0dLrMMdE00U0Y2IWb9CxBSw0lK
         nQYpXqKaeNJEOHMRtPwfUq23h9h3alGc3Vn/nADz5k7Fw4erwAEuKls0Cfq8UO0Du/BD
         TMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763466917; x=1764071717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9v8UiKRyyvD16t4ENb8APUiQmIzVsGi/FebBj0lOkJ4=;
        b=O4A0R7/CAM72Nr5NL1M2oe+V9ROt6fWZ1t6+K9hCm64CcHvNhIq5d470II3FgWjQXV
         eZ5NdPlAagC3o9sOXOB+15C9SEFdm0TNoQnbVhJ6j1EdKdujOxLIWmLFqsGqZzgg18mt
         +nOeA+97KSuQuBicOabqcEAolfpbXddSuQ4u4bsfA9BMcV8gnPwPzXAWZpDX6Smy6m5v
         +xegpfZ+BrG9M4eu1OyZrIxhz8qf7t9cPXdDYDEz7X0jqWAsqGI2+nJ94Zjw0avFhOWE
         LfWyoTzvvG6Lk4d9BF7hBqPRMnU4ctInrfQjdMvFXnA6J7utVua92mL+osEFDfsGR+gm
         wEMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrlGyp2+sCiT290Ves60umqYAy+OqVLiZMsljiQDMCpOCLY5jpcZDnEDFh3NrrANN1Jj9ZqL+EpglMZq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMmjsQPLmDSdRjiPpiAjPjj/G9IL468BHwItCbPM5ma9b7/cU
	hqdCrS/OZBBHebsOpKfsRngRqvF5rgabZoiyCKKrxAHXMShoi3XrUYEE
X-Gm-Gg: ASbGncshR3IAlobGDjScX+lVCVBXJOYWdOmwR0S8qbkm/oIX2HYcdUK5g1167IuWgts
	zuHei0u/GQPMiNezg5hoHC+CHqINX00jVGrYqKEui7SPxa6zdBttzsJ23WqQyFAKoqwJt5Nke7T
	3dmCwAspjJ5/mzn9oNoeqPWBN6XdAMh8yxGNuhExynDclXE+QC/K/SBZK66kz7IDxdHMiK7rM7v
	4MLaQ3v0iJm0FgKEBwKcZuf7MHEYniciMxjvLPwmPozFxa82DbaJurmNKQSA3L29Rg6FPe2SI5k
	TMOsDMWR0ogBx91baHYHEQQwPHA22/zYrwMT9PNH7vvADG291UFD/34AIL3z6qvCYXvDNUoxD8c
	3jCqyQVr44fSowK0KgzI50ggXQk7bhR2Ydz2Vo6qyQ5ICsZHjrWzjKApyqNeTCz1qFvuGTNRqiq
	6KcxSwh7mMCRz8rBbcdzDLeOpxQ9OOYL4M2ddzOlFimPVYQg==
X-Google-Smtp-Source: AGHT+IGaNSdLxRla9oY02zDdWZQ+dAcjdxohCbg81uqIYBMI/Z6QJtGDDVm6vwOhGnWyaCl6P1ztwQ==
X-Received: by 2002:a17:903:1b2f:b0:295:3f35:a312 with SMTP id d9443c01a7336-2986a6cfeefmr183341175ad.20.1763466916628;
        Tue, 18 Nov 2025 03:55:16 -0800 (PST)
Received: from [10.255.206.79] ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d17sm172235585ad.72.2025.11.18.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:55:16 -0800 (PST)
Message-ID: <f7f0ca8d-bca2-4a3e-8c45-85cba1b0ff18@gmail.com>
Date: Tue, 18 Nov 2025 19:53:50 +0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] enable PT_RECLAIM on all 64-bit architectures
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, peterz@infradead.org, dev.jain@arm.com,
 akpm@linux-foundation.org, ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
From: Qi Zheng <arch0.zheng@gmail.com>
In-Reply-To: <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/25 12:53 AM, David Hildenbrand (Red Hat) wrote:
> On 14.11.25 12:11, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Hi all,
>>
>> This series aims to enable PT_RECLAIM on all 64-bit architectures.
>>
>> On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of 
>> empty PTE
>> page table pages (such as 100GB+). To resolve this problem, we need to 
>> enable
>> PT_RECLAIM, which depends on MMU_GATHER_RCU_TABLE_FREE.
>>
> 
> Makes sense!
> 
>> Therefore, this series first enables MMU_GATHER_RCU_TABLE_FREE on all 
>> 64-bit
>> architectures, and finally makes PT_RECLAIM depend on 
>> MMU_GATHER_RCU_TABLE_FREE
>> && 64BIT. This way, PT_RECLAIM can be enabled by default on all 64-bit
>> architectures.
> 
> Could we then even go ahead and stop making PT_RECLAIM user-selectable?

OK, will change to:

config PT_RECLAIM
	def_bool y
	depends on MMU_GATHER_RCU_TABLE_FREE && MMU && SMP && 64BIT

> 


