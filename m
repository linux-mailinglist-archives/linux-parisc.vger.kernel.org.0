Return-Path: <linux-parisc+bounces-4352-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0322ECCB8C2
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 12:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F5D33003BD7
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 11:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB60315D35;
	Thu, 18 Dec 2025 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1g4Wd7B"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2B314B76
	for <linux-parisc@vger.kernel.org>; Thu, 18 Dec 2025 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766056128; cv=none; b=TS9F4gXu8CDeDzwXbEh0vihEKXiux3602jActavxqQTnkY6aT9M/F/7J5jP1tp66+h+c1wXUZrH1Bq2PpXanngTxinxI9vs26y99OSH00+S1/n7NSmAuFYpgYt0I6WBlJnvgAsUf001+5c3NgOL+VcCxLrYDyxVek3ai2fnsGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766056128; c=relaxed/simple;
	bh=5ae4jwThX22GsqQgWrYZpZKKD1C+wqRFa+cbCkUbJkM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Uf+wCV560g6u0BwDfHEI1F6w5T0oN/NwBoJp4PF0iRo/3ra/rFoEcPEgg/ayavCQQ4qn+OsTDVrMi6jq23NYuh4Z1WBje9ANVcSerNlnB27z2P6ww5f4NCQP3+WKcIvrDy4FKTBqkcoH+4GbkDfX9RICKUPCpvpKu+uoxykGA0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1g4Wd7B; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so456622b3a.3
        for <linux-parisc@vger.kernel.org>; Thu, 18 Dec 2025 03:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766056125; x=1766660925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvrOODWWF0yZN0kTruhNLT8tt7pIP8wMKuLRwhFsSME=;
        b=C1g4Wd7BARsbkRJe0oAR4w8atQbrErRn+cI/n8mMImNacVG4ZPCfyxJPTsz4kn263/
         1GawtQ9i7Ep7A4QL2mEHbXQYvpZwO1+aZqE32yVyd4TgAyOeTfQj+1yosn/82b41nlUs
         CJrLQUbFRDzGtZ6PIkWOa2ZaKg+rGfawDVWJf7uxvlK7Vdx3T2dVWwaJDnPYP/+suhoK
         3ZoZBOtrXZlEUdMiSAKITWD+K3+dCssxYYETxuA2+NY25oy4O1bB9g43qu9cY8sMMITN
         FM5r+DRZiEVg7GA1T4OVbbtbAJuKDszVemvarwAoWPEU4/fcxm63i/pgqe0ECqDVv0Zr
         bRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766056125; x=1766660925;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvrOODWWF0yZN0kTruhNLT8tt7pIP8wMKuLRwhFsSME=;
        b=VESAWmJtBA45dcq9OxDOwiZfuTK/lZjCQ4uKpt2OYVfUl/8iXz0lGmghHJG0b6odg1
         byI5GtizhHl8Nwe8LepEnEtONe3CZrfSzhLJJGdKHwmCWtbo9h4MOv/89Utb9aAPVgJY
         W8VxcynNnwS9GaEtL9TpuQrqVz1SNw4vX3/DG3M4Qc4kooP/9dNKT68w/78nhkcizxtl
         5IAzovFVhRqNEFduDIy8Y+vNef6FGiUQNSUh0VOV10bSt8cGEjYI90Zp1aC2KHmzHOq3
         IoSQGB0d4CX7LBMCkwgwmblIpH3jDjVEAK5LQzhd8WtRX8cU5J7n8zKvZVmzyUjnABLA
         GZtw==
X-Forwarded-Encrypted: i=1; AJvYcCXuB8tM8XBbOHe9pBu5XIC4roHI2GDZgAPhLZxVFsTCHkkEQIxa5WE8pTbnymvuLJJEwbN6/eeviEBZvzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxggtxJ5zz+AvAHI8LYVk7P3RWuNg1LjM98B245XWucAowwWlmr
	w3ZwPz8V6OThQRB1uGTCUlrtAvyotmPArj1xd4GjQACtgOc+BpBSP/jK
X-Gm-Gg: AY/fxX5LMQvPNfQeszMSJ+wWk5XEpHgR+FHhnbjcuez9XQiQSSh02ffSa/6dZ9vKGzk
	kljYtUT73zucMvqVyEkZveAagkCFNtey77MgwZm+jQvVBC/2hqhHfNjpnqe28xZEB1jho9Mv3zM
	zWt3DSyAwE6/YFQcJzisOsMiSECco+B0UHAEXuYc6N+22/xrY+FMrBZ4lBzoRQSNrW0cZK8L0BC
	AfG5gQ9SpE+RcjO3SfAT+nhbbLtPiFNeo2S++i88mLI6nydnxKCAIkzqYE/0N9ZVEdFLAoPTKbi
	zaZxLH0b8uj4vVenqJzuvLvM0xp7QCCtMyMQ8wZxg96TmyN0FTw4/cYGXbHZjxhgaAvOsMqY+Fn
	3z3x1UxdDfFu9eNv6Ob1Tey4PRS++abpoS0JL2jk2+NS047mqmSZThVtz4N/qgP0QJ7b4qzO1Uv
	WPmgAkMxV/z963V1/5Xx2gwQIEE9i7XSYxP47UCz1N5zCobL8qKMrw5w3h2lEEhgBxvxQ=
X-Google-Smtp-Source: AGHT+IGAV2/r1YTG/myMJw8Xx7HTeJ86vOJi7XK0y5urcjohswz9dbr215J8uix2rwoqrzjY/V5ZRA==
X-Received: by 2002:a05:6a20:7343:b0:366:5332:466 with SMTP id adf61e73a8af0-369affec42fmr22254047637.53.1766056124849;
        Thu, 18 Dec 2025 03:08:44 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1d2dc9dec9sm2029744a12.10.2025.12.18.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 03:08:44 -0800 (PST)
Date: Thu, 18 Dec 2025 20:08:24 +0900 (JST)
Message-Id: <20251218.200824.2202311883856399078.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, peterz@infradead.org,
 will@kernel.org, acourbot@nvidia.com, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, deller@gmx.de,
 linux-parisc@vger.kernel.org, davem@davemloft.net, andreas@gaisler.com,
 sparclinux@vger.kernel.org, vgupta@kernel.org,
 linux-snps-arc@lists.infradead.org, bcain@kernel.org,
 linux-hexagon@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 0/4] rust: Add i8/i16 atomic xchg helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aUPG2Q_sSPDnlQ0G@tardis-2.local>
References: <20251217213742.639812-1-fujita.tomonori@gmail.com>
	<aUPG2Q_sSPDnlQ0G@tardis-2.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 18 Dec 2025 18:18:17 +0900
Boqun Feng <boqun.feng@gmail.com> wrote:

> [Cc parisc, sparc32, arc and hexagon]
> 
> On Thu, Dec 18, 2025 at 06:37:38AM +0900, FUJITA Tomonori wrote:
>> This adds atomic xchg helpers with full, acquire, release, and relaxed
>> orderings in preparation for i8/i16 atomic xchg support.
>> 
>> The architectures supporting Rust, implement atomic xchg families
>> using architecture-specific instructions. So the helpers just call
>> them.
>> 
>> Note that the architectures that support Rust handle xchg differently:
>> 
>> - arm64 and riscv support xchg with all the orderings.
>> 
>> - x86_64 and loongarch support only full-ordering xchg. They calls the
>>   full-ordering xchg for any orderings.
>> 
>> - arm v7 supports only relaxed-odering xchg. It uses __atomic_op_
>>  macros to add barriers properly.
>> 
> 
> Thanks for the work! And please do Cc linux-arch next time when doing
> architecture-related changes. We would get more experts to take a look.

Will do, thanks.

> I think the current implementation expects that xchg() work with normal
> store/load, and that requires ARCH_SUPPORTS_ATOMIC_RMW. So could you add
> a comment saying the current implementation only support
> ARCH_SUPPORTS_ATOMIC_RMW architectures? And when you wire up the rust
> helpers, I think using #[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)] is a good
> idea. This will at least let the !ARCH_SUPPORTS_ATOMIC_RMW archs know
> that something is missing here.

I will add a comment.

ARCH_SUPPORTS_ATOMIC_RMW is required, but we also rely on xchg
supporting i8/i16, which is not currently required on the C side, I
suppose.

As I wrote, at the moment, the architectures that support Rust
(x86_64, armv7, arm64, riscv, and loongarch) satisfy these
requirements, so my plan was to use cfgs in internal.rs to restrict
xchg support to those architectures.


