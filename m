Return-Path: <linux-parisc+bounces-4491-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7FAD17FA2
	for <lists+linux-parisc@lfdr.de>; Tue, 13 Jan 2026 11:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF5CE3009424
	for <lists+linux-parisc@lfdr.de>; Tue, 13 Jan 2026 10:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3D333F8C5;
	Tue, 13 Jan 2026 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPt8AST7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1C12FF646
	for <linux-parisc@vger.kernel.org>; Tue, 13 Jan 2026 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299771; cv=none; b=mQ46rKtXW+PG3Z42yyp65pk/FzTN8upWRXlB7mI0jVvuoZgEZkg5WbGhlakzxrLQGKiHeKJJm6uGVR9DLzyed9/XEoUnreBe4kuoi4i3NalKgsT2aAOErmN7BKgIjAxMuBH9XqfepvFXbFWMxgnXBTjRgFd6y//5yYaS27chfqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299771; c=relaxed/simple;
	bh=39NtxAeqpXvhawaLycQSgS8a7QXmm9U/xmb9EyW+PGc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VIAN6DQn6upMISjXS9gBRkAgI3xDV8CTw+2mD/DW8AveWCR18XdHaQCYkvhzGhvTjrb2wYSLN2m9FzLWBhYSCOPBUjsLqJFaWKpvWclokUX+zcw6CLQ2CWsTf8mVqlIVNSU4TGpjS1PRLgxaMow7yCd1tmx2BwbqC4X+bj3jK0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPt8AST7; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso53849471fa.1
        for <linux-parisc@vger.kernel.org>; Tue, 13 Jan 2026 02:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768299768; x=1768904568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=JPt8AST7KhzgDRzz5Pnqn56XFrAc4ImGCy1nkFPvySllAZVq0ZlcCidiIz+todRwKM
         r1XtkaYqRd9FcMaYD/lL2diT5Zn8xnVcIyXUGDpv77MBd0m5j5O/uXQ0+hq/vPhlqA/0
         AiCfmxZZTBRYeHxkuf0AxPIrQus1jVAX2v+fUAHH4R6ENArVSyjEa8RGuZkPUuouLumQ
         RpJHJMyrRVXFhRBsoWqGXvKvAlFKVNZJaJvDE/h0wQlMpV4e7DPHxuKqJWPLdVKTZuVx
         LtPfyIZNVRt3Lz2VIBYYT/AdzSIoaI0jOjC2MDddolwTVBYOrp6AvjTm1r5OZqJw14n5
         FTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299768; x=1768904568;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=bk/QdIVHNz00gaxQtQ/owFm7v4CNl83xEcqJJONX06R2ARgqOU9R6cr5Kc2/G8G1Rm
         nrQHpTiVGNisLiwB8fHGaNlTlAn+vaL5MiXaxtlfYe3FG6Fii9SgrYrOjOx9AKKVuNoV
         QWsccDY/qF+UXrouSiJ27g1UxTPzNd3ywSl5J7ZyBUS6IcLT+DZebPra/OqTDMirIrdT
         a2/VGJuQJBhI8dHNftQAqdZfzCg4JhjDs1A6PnlqwXWq8+3Rh8XuErqIr9bj9/XPN43t
         RSOK1vFzzHAJukBQiXeIqfncFrjduR+pTygHrafWuEjhewyGyZhdDtuTydSWW37qn7WA
         3Pig==
X-Forwarded-Encrypted: i=1; AJvYcCVLyVl4sRe5o+DdFUg9OzlKLK4s4diXU2Z0neH98qbbEZaDImv6LJjPWXVmdwRQ3M1OZaAqofAYsTlPtcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoxLfw2hrGZmAJDRhCjcX/6ZN3902Xcbm7wN745r0DctNja4rR
	gR12tpLd903wpe2oiu6fiOy4yf0IDeXyGH0RHtPUMKGSWfWEdaTy3e9T/qu68g==
X-Gm-Gg: AY/fxX4tKkQFgINtRKVfsD4hSBORCtsFgwO7WWHaoDXQdgS2uG8W75WQFy0NAWaF6hB
	N1k8HVvevxwKrt7CBJVas60IkspxzhxfvJdjGjtQvYqcDaXxCfe+IWmbE8n70Aig3NmcNWU1S1O
	8bvEoVQKjJQ7yt8nsQyTxSGVWHSGUNx22P8oYwtgsFK278SVjyzcGUB/5QqVY/KT0J4LkOXiulm
	YaHPaU9K3HEKi3awrftBU5MiONVEG0pjMUMVKDB3f1G/q0MZGDIEV7Y89jG1JaESKg0w1UxdYn2
	PpfIYHDtHwMjvpohfintsoBr9/SajI/06w9s91+2aeoxLdGy3BjmmE3M5U8q8047gNcTgSa6jYh
	PJDE9bm06Nos57tlLExpX5+w8AcBTbFciVhUGG+hpH5ocDpnkLGW8q+XXOAPD7PGiMoRVlOvr3f
	jeg6MIUgnNmVxUwyQSs9d2OcCsfoZvGlsBqRwPT3Xf0xuTdBnYigXujY7YhQ==
X-Google-Smtp-Source: AGHT+IEOoK2sWcGzQ5k4NJjsFR/RmdeWAB9vvZrFfNJ0u+S6dsEFK74/fdYnqiqEV2XmHMt6sJ390w==
X-Received: by 2002:a05:6512:138b:b0:598:e851:1db3 with SMTP id 2adb3069b0e04-59b6ef05760mr8236951e87.11.1768293628066;
        Tue, 13 Jan 2026 00:40:28 -0800 (PST)
Received: from [172.20.10.9] (mobile-access-c1d2ca-216.dhcp.inet.fi. [193.210.202.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72f3ae82sm4416299e87.71.2026.01.13.00.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:40:27 -0800 (PST)
Message-ID: <f861a1c6-7ec7-477c-bc42-f9aaf6724bed@gmail.com>
Date: Tue, 13 Jan 2026 10:40:22 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
From: Kalle Niemi <kaleposti@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
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
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
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
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
 <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Language: en-US
In-Reply-To: <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/26 08:50, Kalle Niemi wrote:
> On 1/13/26 00:23, Andrew Morton wrote:
>> On Sun, 11 Jan 2026 10:20:34 +0200 Mike Rapoport <rppt@kernel.org> wrote:
>>
>>> v3 changes:
>>> * fix empty_zero_page initialization on arm
>>> * fix ZONE_DMA limit calculation on powerpc
>>> * add Acks
>>
>> updated, thanks.  I'll suppress the ensuing email flood.
>>
>> Kalle, can you please retest sometime, see if the BeagleBone Black boot
>> failure was fixed?
>>
>> Seems we haven't heard back from rmk regarding
>> https://lkml.kernel.org/r/aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk.
> 
> Hello!
> 
> I will test this v3 patch ASAP and reply results here.
> Collective sorry for the delay; I have been busy!
> 
> BR
> Kalle

Hello!

I tried this patch by cloning 
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=hugetlb-init/v3

Boots succesfully on BeagleBone Black!

BR
Kalle

