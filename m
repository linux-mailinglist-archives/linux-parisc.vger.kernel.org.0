Return-Path: <linux-parisc+bounces-1480-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342978FBA05
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2024 19:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C638CB2282C
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2024 17:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C8A149018;
	Tue,  4 Jun 2024 17:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="D+iWzLRV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo002.bell.net (mta-tor-001.bell.net [209.71.212.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB4146A7A
	for <linux-parisc@vger.kernel.org>; Tue,  4 Jun 2024 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520962; cv=none; b=nZMjodsLTAD1bawOAoPHYIXTUDPl9PpnUqHvv5dlPfDzps5yA4hlftDPSXTQtOAi+In/tyB/RzP78GQ31kQ3QdYG2hcnVqD/E2XHjgm8c4p85lqlqH9olXxnKZWzBcUj5cjVDHpQFsJwdo6vu2NyCoqJLZZGNZwYL4Q9+hzjnX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520962; c=relaxed/simple;
	bh=XupeyAVV/UVfjMV52ZefGLwPCbCU3n/FBjLkdd6LYb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TF+PPTwRoXQueqfi+mHGASWp9451nFYjmGbc2Oh0NCkhsQbLJ0Nq0BmN2SBtPvpV236Y+LMckAdeMB66mPchem19dF4SSKWme6vv/7vx8hQo4vcTjTEI8Y1lG/+RBkj2U9SinTH302rVytASDC0s5yrztG4nBH5uqB2T/ocp1lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=D+iWzLRV; arc=none smtp.client-ip=209.71.212.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1717520960; 
        bh=MP8SXj6U51KSDIIrfM2XFN5n+U1lXln7qw6j0fnJnV0=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=D+iWzLRVaH+UfIGZtKA49fHdwTF8UtT00aSzPHXhil7/Vi4zXB/LAqW1IBe0Bls5Ptb1993NvEHa3VW6Y6DfYKmMrEz8kRSjfhzKy3b2V/Hui66El1T/0fxnMMINhXpFSOQmqZhr3/jY2/pr9pQYtVOaAeB+HZ9bdGK8yzRGtQyFBjYW1ZjBzKzU8kUH5CpQB40f4yviwb2yWsRN8kmY5cZeQE2fDvqUC2Zzffp9OXlxJi0yUZT6DuCod7MWD/nPsnNPHktLEVhP7+BLSWNNyFMAQBruO0lqkFE8zQqCPzmYFVZZkm3Mr2FAjlB+zOJGJGKO44DdQnESTQ9BgeGn8g==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 665F1F5400055163
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvledrvdelgedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceugffnnfdpqfgfvfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpeejleffffejhefggfeuheelgeefgeeuieegtdekffegudeuteffgeffjedukefgueenucfkphepudegvddruddviedrudekkedrvdehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedugedvrdduvdeirddukeekrddvhedupdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepgghiughrrgdrlfhonhgrshesshgviihnrghmrdgtiidprhgtphhtthhopegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdprhgtphhtthhopegurghvvgesphgrrhhishgtqdhlihhnuhigrdhorhhgpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghtohhrohgp
	mhgrihhlihhnghhlihhsthgpkhgvrhhnvghlsehmrghtohhrohdrthhk
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.188.251) by cmx-torrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 665F1F5400055163; Tue, 4 Jun 2024 13:08:27 -0400
Message-ID: <213f7afe-5bc8-40ff-835c-1fadaae0a96d@bell.net>
Date: Tue, 4 Jun 2024 13:08:28 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: Try to fix random segmentation faults in package
 builds
To: matoro <matoro_mailinglist_kernel@matoro.tk>
Cc: Vidra.Jonas@seznam.cz, linux-parisc@vger.kernel.org,
 John David Anglin <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>
References: <Zje6ywzNAltbG3R2@mx3210.localdomain>
 <C4u.NueN.39ikIzqu}iW.1cEpt7@seznam.cz>
 <91563ff7-349b-4815-bcfe-99f8f34b0b16@bell.net>
 <34fdf2250fe166372a15d74d28adc8d2@matoro.tk>
 <e88cebf4-bec6-4247-93ae-39eff59cfc8e@bell.net>
 <88756923-4c3c-41bf-97a8-aab25bc93644@bell.net>
 <28cea8aa7cce7c56bbb8f88067c3f3ba@matoro.tk>
 <16d8c07c-9fbe-4e81-b1f1-3127ab05410a@bell.net>
 <7345472b8bfa050ec2b86df5f69f99a4@matoro.tk>
 <52c0dfa7e2054d883bd66da7ab2e68b8@matoro.tk>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <52c0dfa7e2054d883bd66da7ab2e68b8@matoro.tk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-06-04 11:07 a.m., matoro wrote:
>> Thanks a ton Dave, I've applied this on top of 6.9.2 and also think I'm seeing improvement!  No panics yet, I have a couple week's worth of 
>> package testing to catch up on so I'll report if I see anything!
>
> I've seen a few warnings in my dmesg while testing, although I didn't see any immediately corresponding failures.  Any danger?
We have determined most of the warnings arise from pages that have been swapped out.  Mostly, it seems these
pages have been flushed to memory before the pte is changed to a swap pte.  There might be issues for pages that
have been cleared.  It is possible the random faults aren't related to the warning I added for pages with an invalid pfn
in flush_cache_page_if_present.  The only thing I know for certain is there is no way to flush these pages on parisc
other than flushing the whole cache.

My c8000 has run almost two weeks without any random faults.  On the other hand, Helge has two machines that
frequently fault and generate these warnings.

Flushing the whole cache in flush_cache_mm and flush_cache_range might eliminate the random faults but
there will be a significant performance hit.

Dave

-- 
John David Anglin  dave.anglin@bell.net


