Return-Path: <linux-parisc+bounces-4393-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F04FCE5093
	for <lists+linux-parisc@lfdr.de>; Sun, 28 Dec 2025 14:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73D3A30079F0
	for <lists+linux-parisc@lfdr.de>; Sun, 28 Dec 2025 13:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B802C08BF;
	Sun, 28 Dec 2025 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBbJP4Wd"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D001B2550D4
	for <linux-parisc@vger.kernel.org>; Sun, 28 Dec 2025 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766928602; cv=none; b=lO4o+gJkpnYlukMTq7HYmzQXYhO+NKxUqvsET1bpP+TZsMdbnAzQCDcy7FAeMCBAssb+slp4b+VcpFkdtkBu5O0Ea28j7LUYpY5eqooEHj4w674S6O5pnvE5wlgNna2dye85hqVWuiuPp4DClqAFqptqea/75B/0tanAEYVKfCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766928602; c=relaxed/simple;
	bh=wzDS29pPv16SN5nJL5o+rnuk9lYuas+/v91h2NRmxn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seofU4ofHrf70EsLeDZuByr1mJ12xvSlnLJBFMkASsJvGLHy3OJM4bxBNfiC4NuG78gV0dZxJc+w8CGq89JC2Jqy3AckvHkfabeW5berH4GyIntvLjmwR6Rb40UG2bJfE2b7wyAp9+xbUyDGepKP6R/NQn1JI95a6dto1Q6OucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBbJP4Wd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-598f8136a24so9403981e87.3
        for <linux-parisc@vger.kernel.org>; Sun, 28 Dec 2025 05:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766928597; x=1767533397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=CBbJP4Wdvc5B3CtNBGl5G6PisnIwIVLPNh8y4Kkq93W609O9ot7XWQibM0OLU65I/J
         fZSkQapbMmJM9qylzG59pNAQQCoFbf7eLiNYx/sdrlqO75lpbsXWsTL8/8GFqamEzxFY
         WA8ACeyUJYEi9eeF+y7nq3g+RuqCjgjKrJwuxJWVEXUajudGQCXirn0V8LI53fholcUn
         f97854AWZmSeBdJGIM5wG+a+i2oIfMXPbNrMsFtJ8pvQFKK2eeahgADjCIlZM73yW9Bg
         j4Mn2JayNUGtPg8x6F5e6VX+R08Q7VldGFH44K83MM0RuS7lm/zMLjNaijINZR5KbalO
         uEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766928597; x=1767533397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=LHkjjuN+h0Dxb1GnTg9HnyNb2lJiATO5bSvdPznIa733fi7RXmjivSKUb66ml6Jp81
         1YQK9Hu2uoVXU4+2/ZlZOazcAH0XYp712jFHlfmK1i7+hCqLOMz1K2m/DmpL1j8E8B90
         1ogkz35MIzxl37OlfV53Q79P8jzvFT9BzqCF5pexxUldmTkftzV/ZWiHUk+E7nqPzfO5
         S5lWO6UMq0lYMOm/hRuOfqbd+qMoMloiSkOwTA0mWfyo7PgOvBzJe7Qo7KctrRQv1OVY
         LxtaMT19x5MuAwyNmF7C1e+oB1/WWGvbeEJcmmyZk+CceNSLQuDpxye9ZB+EI09tvmE/
         lDzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUGHqIL28DAxbxw4lxgL71jMq8B86lXhVfu5adhMEDSHpVGYeEmEMwWYP/WirGXwnYppVVcqjYT4/RUT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKN/xp1VUitb4O54tRLNI+vLJv3JmNI5ShrGohUuPduH7W34y7
	4gyHtYZ34OREZvNpuvzTC/NYuLdgyC8G7iceUHlo8dDk5biSpREw/+q7
X-Gm-Gg: AY/fxX50pndVpI/fXJW7jl+1/9eVoBWLzV4Ak2vORmxRa0aH8II5PfqjlxLWk20X0dF
	YOpZ88xYTR4SacD+jr+N/HWJCI1j2T13soYTksRZtPtC2JbB7JVymrVZ7MRZXLy0eE9f7L9qpGR
	qIZ2tIGuU3giS6h9ZJWXomKdDtj9B37SpqsqjHWikP8KAzyzg0SsCCSG7AoEOX75T70umS020DZ
	PWvNfM4qn9Zt5FFRZMWfdfIrwXVHU2Cr5xd4iZJcmKkrrpEyl2TzjnC4n7y1e/1+oYwxvLOQ0N8
	hUyObXgqTiJL/L2lRKE5ugE8CP3Yqfa2xJxFoWtv5Lblw+YRJW/HCUlzjZ+GpYPWmIcPCiMBJn+
	snrJDjMYYH5buwsQ3OYk6233oXTEvJj8hnwoWeDt/toBcgGB94ymZOnFqq99G+Idgb+ZfsH0o8w
	DRWYp04ShWThWxAHUbuGlQCD0BGctlvfS4JoVOtQNG8s+eVScgWRJrUgwRpAqw6pm6cGzKroDJq
	Tz312ci
X-Google-Smtp-Source: AGHT+IGo/pr+AQ2VNaaG2TyhewLh2BG0nsRAoXdF/d33J1EZZvYOr8FxE2Re2WZCgj4kGCoIAYrr8g==
X-Received: by 2002:a05:6512:3b0c:b0:59a:11b2:2c08 with SMTP id 2adb3069b0e04-59a17dd5fb7mr9312428e87.43.1766928596662;
        Sun, 28 Dec 2025 05:29:56 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:425c:b771:d34f:d055:3147:bcd9? ([2a00:1fa0:425c:b771:d34f:d055:3147:bcd9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d602fsm8238417e87.11.2025.12.28.05.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 05:29:55 -0800 (PST)
Message-ID: <d58d6cfa-d9d1-47fd-91e4-533756f3b3bd@gmail.com>
Date: Sun, 28 Dec 2025 16:29:49 +0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/28] x86: don't reserve hugetlb memory in setup_arch()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251228124001.3624742-26-rppt@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20251228124001.3624742-26-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/28/25 3:39 PM, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Commit 665eaf313314 ("x86/setup: call hugetlb_bootmem_alloc early")
> added an early call to hugetlb_bootmem_alloc() to setup_arch() to allow
> HVO style pre-initialization of vmemmap on x86.
> 
> With the ordering of hugetlb reservation vs memory map initiaization
> sorted out in core MM this no longer needs to be an architecture specific
> quirk.
> 
> Drop the call to hugetlb_bootmem_alloc() from x86::setup_arch().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/kernel/setup.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 1b2edd07a3e1..e2318fa9b1bb 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1191,7 +1191,6 @@ void __init setup_arch(char **cmdline_p)
>  
>  	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
>  		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
> -		hugetlb_bootmem_alloc();
>  	}

   You need to drop {} now, no? But seeing that this *if* gets dropped
altogether in the next patch, you may as well ignore me... :-)

[...]

MBR, Sergey


