Return-Path: <linux-parisc+bounces-1853-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF5E93CA44
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 23:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3BB280F36
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 21:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819161C6BE;
	Thu, 25 Jul 2024 21:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="gH8Yv3Di"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-001.bell.net [209.71.212.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F317208A5
	for <linux-parisc@vger.kernel.org>; Thu, 25 Jul 2024 21:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721943321; cv=none; b=Jbu+5S5rBvbby4l7t61YOMNjqpEsiasmzI1Yuxt3bVVeiAtvEfJ59I7S9oCjfqHVP9gkFoRPd51anD64b87NfAXmc89QoLeacuUcsmPBcWNMYaGT8ywd/KGKGzQvIOj8o9pPtnx+aiUjOpN/FkldTa6IMW8G7z4bAP9oTXYds4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721943321; c=relaxed/simple;
	bh=jSS42HO2Dp/OUWyqirzwBSKUX1zYpW7mgbDY+oQt+6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mW0eIz2ZUytlzgHCcosykaOTLQLL1GR6uUKqgtaGWDap315UpoHXCXwgCCj5UlEto4zOMikhnzSpikvLHCP++7bLcMsAHlyfk52JXx3BoF7lOoedK/QlqmQMfGFwHAYiMD7KyjXrkrk3/WyKMc5VyE5UQSr1mJ7QpSlyM87PtsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=gH8Yv3Di; arc=none smtp.client-ip=209.71.212.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1721943319; 
        bh=9bDORcJPE+hbMBK9vQl7Vhp57EVWB82rHTyS2YzVw0c=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=gH8Yv3Disa+stRrgOOSslZY9FN+t1PVdm+yNkI1A1U2Cic+e7tqkoOe1jBheb86ZJgFiTQtXpcrsFEgTmoHznKNzpf64fhSKqk7aFLRlIVyp8YGT+ny8yPqtsJ+VX8TQBFOkbhHXQuWyABg/OtEfVTnfedE8va111xby5IVzthKfw4OPi2lckxLmnBC3YQLl47BLf3Jrzb/g0BchkZNl6SWGtFtEvw0Edt3TGplgVEEd9JPtAK+PiQTDwlpCg/v/nywOdWDYzJcCQwlhlp9rLXrNQTZb5p9N3kO4tMoa60pKwfdWHptMaGg5XHdPg9RuYk1bzFEzO0aJZJT57tdNAA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 669E799D007A9248
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeeftddrieefgdduiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepjeelffffjeehgffgueehleegfeegueeigedtkeffgeduueetffegffejudekgfeunecukfhppedujeegrdekkedrleekrddvvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddvrdeglegnpdhinhgvthepudejgedrkeekrdelkedrvddvtddpmhgrihhlfhhrohhmpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpnhgspghrtghpthhtohepiedprhgtphhtthhopeflrghmvghsrdeuohhtthhomhhlvgihsefjrghnshgvnhfrrghrthhnvghrshhhihhprdgtohhmpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggrvhgvsehprghrihhstgdqlhhinhhugidrohhrghdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhrtghpthhtoheplhhinhhugidqphgrrhhishgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
	thhtohepmhhprghtohgtkhgrsehrvgguhhgrthdrtghomhdprhgvvhfkrfepsghrrghsqdgsrghsvgdqohhtfigrohhntdeltdeifidqghhrtgdqgedvqddujeegqdekkedqleekqddvvddtrdgushhlrdgsvghllhdrtggrpdgruhhthhgpuhhsvghrpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvth
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (174.88.98.220) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 669E799D007A9248; Thu, 25 Jul 2024 17:29:08 -0400
Message-ID: <b3254b3c-438a-473a-87a4-b627ec706d2f@bell.net>
Date: Thu, 25 Jul 2024 17:29:09 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: John David Anglin <dave@parisc-linux.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com>
 <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com>
 <54cb80b8-9c89-4b61-b1cd-1e626daf6719@bell.net>
 <fa37987e-568f-9716-719e-85e3da8db47@redhat.com>
 <f3f59d8a-3ea4-4a21-8b0d-ba0d63ef1ff6@bell.net>
 <ff54aa24-15be-4bca-8b9e-1b1166b0e0d9@bell.net>
 <436be3ae-a1b8-a14d-88f9-447355959064@redhat.com>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <436be3ae-a1b8-a14d-88f9-447355959064@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-07-25 4:36 p.m., Mikulas Patocka wrote:
>
> On Thu, 25 Jul 2024, John David Anglin wrote:
>
>> On 2024-07-25 3:13 p.m., John David Anglin wrote:
>>>> L1_CACHE_BYTES is a performance hint that is used to avoid cache line
>>>> ping-pong when multiple CPUs modify nearby data.
>>> Our L1_CACHE_BYTES define is wrong.  PA7100 has a L1 length of 16 bytes.
>>> PA7200 to PA7300LC have a length of 32 bytes.  PA8000 to PA8700 have a length of 64
>>> bytes.  PA8800 and PA8900 have a L1 length of 128 bytes (this is from ERS D_Stride).
>>>
>> The attached patch fixes the defines for L1_CACHE_SHIFT, L1_CACHE_BYTES and
>> ARCH_DMA_MINALIGN.  I left ARCH_DMA_MINALIGN at 16 as I believe this gives
>> 128-byte alignment.
>>
>> Testing.
>>
>> Dave
>>
>> -- 
>> John David Anglin  dave.anglin@bell.net
> How does ARCH_DMA_MINALIGN == 16 give 128-byte alignment? I think that
> ARCH_DMA_MINALIGN needs to be 128 to avoid the possibility of DMA transfer
> corruption.
You are right.  It should be 128.
>
> L1_CACHE_SHIFT can be set to arbitrary value - setting it badly could
> degrade performance, but it shouldn't cause data corruption.
If we set to an arbitrary value, we need to document why we do it. The naming
suggests that L1_CACHE_BYTES should be the L1 cache length.
>
> The commit d93277b9839b0bde06238a7a7f644114edb2ad4a says that setting
> L1_CACHE_SHIFT == 7 causes networking performance degradation on arm64. I
> don't know how much is this related to parisc.
Some other architectures have L1_CACHE_SHIFT == 7.

Dave

-- 
John David Anglin  dave.anglin@bell.net


