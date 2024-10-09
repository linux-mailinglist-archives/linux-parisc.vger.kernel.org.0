Return-Path: <linux-parisc+bounces-2639-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2185C99778E
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 23:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70553B2142F
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 21:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F4C1E1311;
	Wed,  9 Oct 2024 21:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="UZkFAHfy"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2761E2305
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 21:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728509598; cv=none; b=XubqFcwBjDtsl/a6gijAtOGypuhiqgrVCH/tNU8IUMjBNSnJJGzQ59dOoTZp3aAoxtg+jl9ULme/ExEA3OB+ujM+XrX+C5sljfwOfk866iFgMfHCaSz9wfKkxOitfFrn0tx0Qejac1FmFUDDTZSzGzV/wwz/0ZRDq0iI/faDM18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728509598; c=relaxed/simple;
	bh=FiNrHSyL+uyz4x2J8z6qhvW+38NqOKn5eu8zS+G7+cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0cW+1mPIxmW5+xRBRPOdWMN8eUzFIRzAxPB79mUkjWvd5llOM7eQx3bg2zfwf56wLPgAWIiFDEPNvGbPhYXuvm2lk2jxz8d4U8osvKgNkkSVqG6klWlXhxi0Hw94OU51Mcka5Klg+4lqfklYFBHXiKL3Q+KwrGTKugQOFnfTeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=UZkFAHfy; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728509583; x=1729114383; i=deller@gmx.de;
	bh=rkDvT9+2mExNwBaDhV8t5TZC64P4RCKtBdbeRNAEl30=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UZkFAHfyNpJvgmUVMhxwqzYt4RqNPwEuA34avq7QfZO8R09tIk8LCdntGT8xerWZ
	 YyPJRzLq/TH+rS22gm6+n7+I8fmqAMSR4STt2FK5K8hRWYlxSSdXx0X+4qU8b7gSF
	 X77I5KYL7BXZYylqsyAtrlSSKsuiaqNkpCAmXbZu6LKG+AT/KrF+ZYsGl6/Vf52qG
	 UaIROZZtLZWsJUuu6BTWcHrDj8fOtxZIteGLDAgVSCkv4x3LKy/Xh28LwbU7LdzHC
	 Nu7bVnNv8D+WVffYLxqunZQoCtwiVKiUA7r3PUNRTgQY4xY8jA9uBmd3x9Ot9KegQ
	 sAP0ykuOSwMTDq8yvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9yc-1tFcxJ2v5u-00NNAS; Wed, 09
 Oct 2024 23:33:03 +0200
Message-ID: <a361e907-596c-43c4-a4fe-575f88f40bea@gmx.de>
Date: Wed, 9 Oct 2024 23:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] target/hppa: Implement TCGCPUOps.tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-12-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241009000453.315652-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bD7oFH1vU3EXPpnn1BLwkmNvyJnjjoCpYJ+btSFH5G+EeEuk7Jt
 9HumUJeBMC5OaqfDW6zV8ZPxf5Ck6V1V6RQxE30mQhur5aC7+tPHI89zd7Jtdu0+r6APj+X
 264FrJFtouqvcm5wzY3i3R4nRA6HQdHQIuZDERtCQlTJtsx4QDZxm28DMphL4zaG5AMhcsL
 bcy68JcX7Mqob7+cRqvKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UGpnr7cjCNc=;2nOC3CXvrFvA8Esk+oFjJbdLhyH
 wzE8Z6RyJw0xtzKoqJLuDLvdqsgXQrCiSXjNO6r+7jKNufzH/hFhYh1nrBiFKXFSVv3F9Zf09
 w2q7BTmRXOIiDI7iyAxxm54iTGO00Vz4PErR5Jj1FDO+jlY7LdWttW+WF8sLl56WQ/b+g5x7l
 HRjJrXUShT0k42UEMj6K4wUZOZgbN2u+OqkxHu823vFtLjZffOa8tqIKCUfqfp7pqJTpQPMA+
 F3ODl4Z5Dxd8vZYGhrqIrJm7XyDPUOsieUFJ3HwQoE7nfiTzyjlla6GCfJmIICKf8LOPAGnEu
 /37gXag9S2F7DdWSKMMlge0g20BZTAY4/pt7Lrh5FDvKEL8/pdH4cjATqD6eAvbTBTJfTECmH
 jF1eRvztf/fev4YPnGNztvZDcStpoEaFqy8S/WN+4d63PmIxu6Job3n4mBMH+vmschxTn93YM
 LA2HaTWiKAEUHQoUR3pUHTQ/9MjNicltfwJiGyL8N5oB5+e3lWZ+REk1AYuO/BvKpKDgcYKhi
 UGKK2O/+YL1KdOmsKbVlbw8ruMMVZfdlxs8wSrxXJnox4/y/MWaAQIHdtcjNT/aiYuPWI7TQS
 L+47wCvTFLAdmiOgUE9MEtpHP3K/nidFwSeLT+VK726Ns2h3F1jZrg6O588i2wKClxlAyeKdc
 unSoBBlWSL/c4TH3+8LzAldSobWRGNZlLSyCKLXGcIl36hAkiWqcxqnOoQd377nWl2Vkb3N/n
 FlTKguBAi62pxDEMHs+Og+Q5Qss8iTQHtSlDMbARZeLRL3I3ki0Jvd8P0vprdZqwSz0YnopWC
 BMrxWZY4VYft7DLOxr7uYFdA==

On 10/9/24 02:04, Richard Henderson wrote:
> Convert hppa_cpu_tlb_fill to hppa_cpu_tlb_fill_align so that we
> can recognize alignment exceptions in the correct priority order.
>
> Resolves: https://bugzilla.kernel.org/show_bug.cgi?id=3D219339
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Helge Deller <deller@gmx.de>
Tested-by: Helge Deller <deller@gmx.de>

> ---
>   target/hppa/cpu.h        |  6 +++---
>   target/hppa/cpu.c        |  2 +-
>   target/hppa/mem_helper.c | 21 ++++++++++++---------
>   3 files changed, 16 insertions(+), 13 deletions(-)


