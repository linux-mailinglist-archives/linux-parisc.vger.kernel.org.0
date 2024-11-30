Return-Path: <linux-parisc+bounces-2949-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0DF9DF3D4
	for <lists+linux-parisc@lfdr.de>; Sun,  1 Dec 2024 00:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 750FEB216AB
	for <lists+linux-parisc@lfdr.de>; Sat, 30 Nov 2024 23:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BA616C6A1;
	Sat, 30 Nov 2024 23:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="FIwLPn/G"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-002.bell.net [209.71.212.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3604158D92
	for <linux-parisc@vger.kernel.org>; Sat, 30 Nov 2024 23:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733009804; cv=none; b=GTSQrxUU1TBjEE339GjcqoXe6VrHyxZNnDb6Vv5cijd3s88FhV8a1kTOXVjiCFZxWIN053kh/RPuqZLSAMa3FMKQ87UkXzhHC0Xo5wsT9GJA4e1xvFVUSQHu7JNIdAK3Dxtbjk+kYJNNfDIrbrqBsX9wGrjGkt8AzVgz8xwEUDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733009804; c=relaxed/simple;
	bh=FLp0eR15DCYZAYVEbfmtS9Qb2CLQK5cgSFzgkVZ9yy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FXw548Bp1X4YkcbjfzvSwsIHFQqA/cExNlIKJNbwVavA2OOHcA9YDlw8uMnIjmCC5wrFTS5pGNzGzJDLb6roaE97x9fnmeDqkZ3a+G8mM3bcZdlFZmIZI8UGz2SLG8HxWwZ/1MWy1X98eUD1+SpRWcNbJU1/AaCUJ8r9cw4BL5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=FIwLPn/G; arc=none smtp.client-ip=209.71.212.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1733009802; 
        bh=y6JhwlRhWXwbDOSd6qGQxYutJGMH696ZKijhy5B8eCM=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=FIwLPn/GDKnKXWnMnnj7UMjjg6l2/XXCTJf4Ju9dsiOJOCPV2WDW9U7ojiLbBNCxTh3T6HG4PHiPOxfEtuoMklEH7OgiYNXsST3DEF9W1Fe3O1AxtIlk7GYfPxIKsWKugwwcXIoOhuar6epRqMbfsNzjVowNbshRwfK0alf+GyElBCmwz4KHZ65j7xO0WqSKHzlpqmeVbWIcL+UNbQSNj3QBFY+3n+RyVfskwmsAUDXAXEyjnWPeiJ6oEqId7eFqa7yeClRRw+YNOwF3sLp15Z8ZBH7UnKSN5X8VvnBRiregjQoYKqChWIIx0P+Vawt4JAEoqgbwCf/jc3JIRnKEjA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 674075B8015FB8D2
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeefuddrheeigddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceugffnnfdpqfgfvfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepvdffffduieetteeiiedvveehheefkeeugeeigeelteeuffdvgfdtveeuleeftedunecukfhppedugedvrdduvdeirdduvdelrdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddvrdeglegnpdhinhgvthepudegvddruddviedruddvledriedpmhgrihhlfhhrohhmpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpnhgspghrtghpthhtohepfedprhgtphhtthhopegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdprhgtphhtthhopeguohifnhhinhhthhgvsghunhhnhihhohhlvgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgvvhfkrfepsghrrghsqdgsrghsvgdqohhtfigrohhntdeltdeifidqghhrtgdqtdegqddugedvqdduvdeiqdduvdelqdeirdgushhlrdgsvghllhdrtggrpdgruhht
	hhgpuhhsvghrpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpghgvohfkrfepveetpdfovfetjfhoshhtpegtmhigqdhtohhrrhhgohdttddu
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.129.6) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 674075B8015FB8D2; Sat, 30 Nov 2024 18:36:38 -0500
Message-ID: <8c39a00d-a978-4a1e-a864-bc3a409aeb90@bell.net>
Date: Sat, 30 Nov 2024 18:36:39 -0500
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm/slab.h "unknown type name 'u128'"
To: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>,
 linux-parisc <linux-parisc@vger.kernel.org>
References: <54fbebcc-d4f5-40f3-8711-bac14dcd5397@bell.net>
 <a5b5e745-30b8-4a1d-b406-fc1d991dc775@gmx.de>
 <5468692c-df88-44ca-9f0c-f8d2e535bfa0@bell.net>
 <6d49b2eb-986e-4489-8f4e-878a4a24db2c@bell.net>
 <CAAZ8i81QnEYyEvWBNWeE0E=5xK9LDZD0FVkSuOGfQv9NFAwNbA@mail.gmail.com>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <CAAZ8i81QnEYyEvWBNWeE0E=5xK9LDZD0FVkSuOGfQv9NFAwNbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-30 5:54 p.m., DiTBho Down in The Bunny hole wrote:
> hi
> I am trying to compile recent >= kernel-6.12.*
> with the toolchain hppa64-unknown-linux-gnu
> + binutils-v2.34.0
> + gcc-v9.3.0
>
> The process stops with an error
>
> In file included from mm/mempool.c:21:
> mm/slab.h:25:9: error: unknown type name 'u128'
>     25 | typedef u128 freelist_full_t;
>        |         ^~~~
>
> where "u128" should be defined?
> Is my cc too old?
Yes.  TImode is a relatively recent addition to hppa64 compiler.  I know it's in gcc-12.  Your
binutils version is also very old.

Dave
---

John David Anglin  dave.anglin@bell.net


