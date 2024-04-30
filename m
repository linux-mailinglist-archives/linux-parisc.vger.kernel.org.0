Return-Path: <linux-parisc+bounces-1271-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8368B75EB
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Apr 2024 14:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596E928324E
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Apr 2024 12:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D79171088;
	Tue, 30 Apr 2024 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCUkLJkh"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111BD17107A
	for <linux-parisc@vger.kernel.org>; Tue, 30 Apr 2024 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714480890; cv=none; b=sl1WJS6HTb//HS15hI7mLpXfBS9z1gpdtRfQyJi/v9Qo2z50sVH7XHHhSWvRNUIa6KmAbPR9eb3gZoh2SGQxGMyW1n5Gz8vwW2gwtWEW5G7cfXzWdSuvGjK9LQs8fyL2+TS1qKl39235v9nelRaINZU6/uPujWECHRMWI6ZqC1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714480890; c=relaxed/simple;
	bh=EAkzlUPf87vK95pHRAftB3pj+wg3xtsMqv6zZ2xItvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZHL0sdplzLQYC08ELClKxFjy1h36IoAiTy6og3UNa2yxs+0yuF27QxQf0Hi+i4K8AvGLozQpt/a6BSNI/SkqG0w8SEaDdeYGDAhNaDpc/XvSJMqV/1N5FT6vLPGCG/YIwuqgvknnPkREWoyPDdoSbnyZkBJiNE031afwIjrxzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rCUkLJkh; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5176f217b7bso9887273e87.0
        for <linux-parisc@vger.kernel.org>; Tue, 30 Apr 2024 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714480887; x=1715085687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1zoRl9JNX91wxTFZ95WC2aOVdcvQqQ9ebO1YgbX9Wg=;
        b=rCUkLJkhLTkgj0vZihEKMMlayMlyQ0cFd5TjQa4r0Jddy9PM8aCO1E3l7kk3Jz+SUF
         GTxeTJy6Av4km5bpOTg+yOSdPvXLSxOOjQOnHQ2TvI4NWTmDRXUzyCtCI6w4n7BCRqGX
         v4+oj/UExjkdmINHO5kKztJkDTG3sBR9dELu5NYmlYuEYKnM0rCgpyyvYeDrL9ZYplzq
         iS3G0yI2yJVRGCkMXuuwWC4nn+VzEi5zzi8/pE6CeziV9EPrz4BvedgrUJ9mrXQ5Csgr
         13a2BhyUlVwR/HKh44guz0Y+9aQRhc91cb/h1t+FvIAqWHgb/xjcLN8z5V0kus9g72LW
         4QRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480887; x=1715085687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1zoRl9JNX91wxTFZ95WC2aOVdcvQqQ9ebO1YgbX9Wg=;
        b=cUQLXdjFlJOFkpiwJKVU1G2f+8yBiHWamg4hjzjOeOvbjpCARyB2KKea0pwBBrJ1Cz
         8+1WT44qhh611rAfoEKzWofQ/FEP8CgBCzY1QxmAXmWaS1LZIfq8ZKol0zo0KyYkDOV2
         Pt3H24/oPLbinZDeYql4k2D992hGpah4MX7uATkcv7lOZQHb9OreVitodcXEW0I1Rvwo
         1DU55iWqDPIrubpoWUO+N6jQC4TU3ZVWJAGhtUCH/qNPXC9fvA8hIWLZyn8i5b1uK2DZ
         Voq/2CnXCz3VlofKDZR/e9KGVrJpEPwP+SoXNTTDz5SPLcjkFo+ALat5AbsF11jWUxK0
         Ix2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5vzagSIL9dqOrL40S+R46G/ribIBGt1SWhNAscEb36kqz6v23xN5xkQlNhHToaDf1ygo0ecMQ0Zx3MFD9XxI7SJhsPJgzT/MJ/S3O
X-Gm-Message-State: AOJu0YxZf1NUYADPLEwDrrx/iM4h2QPyWHA+0ixDgYXRddElYfzRFSwC
	BpEn1k58TTIsk+TH/D/5I4Tgl3EiBh53iPEBKxtu0Doq7r3K6+fOkaXfK9Fq4m0=
X-Google-Smtp-Source: AGHT+IE/W9/dkxBso0irV5VrVX3LkNO5o5h+kLfYM+38G90SJ9h02blz/dj31DJFXSXcVMXms6NQew==
X-Received: by 2002:a05:6512:45c:b0:51c:2c7e:ac92 with SMTP id y28-20020a056512045c00b0051c2c7eac92mr11527071lfk.23.1714480887229;
        Tue, 30 Apr 2024 05:41:27 -0700 (PDT)
Received: from [192.168.69.100] (mab78-h01-176-184-55-179.dsl.sta.abo.bbox.fr. [176.184.55.179])
        by smtp.gmail.com with ESMTPSA id i27-20020a17090639db00b00a58eab2bf0fsm3928326eje.179.2024.04.30.05.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 05:41:26 -0700 (PDT)
Message-ID: <c5248d22-672d-4acc-9b12-86815d6e22dc@linaro.org>
Date: Tue, 30 Apr 2024 14:41:22 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/16] module: make module_memory_{alloc,free} more
 self-contained
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
References: <20240429121620.1186447-1-rppt@kernel.org>
 <20240429121620.1186447-6-rppt@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240429121620.1186447-6-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/4/24 14:16, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Move the logic related to the memory allocation and freeing into
> module_memory_alloc() and module_memory_free().
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>   kernel/module/main.c | 64 +++++++++++++++++++++++++++-----------------
>   1 file changed, 39 insertions(+), 25 deletions(-)

Nice code simplification.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


