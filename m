Return-Path: <linux-parisc+bounces-1848-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF593C8A1
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 21:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2645B281B1D
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 19:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1DD2B9B5;
	Thu, 25 Jul 2024 19:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="ZjUkOzH6"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo001.bell.net (mta-mtl-003.bell.net [209.71.208.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F04C8E1
	for <linux-parisc@vger.kernel.org>; Thu, 25 Jul 2024 19:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721934928; cv=none; b=ls6qJVo1bzFbwCDvQ1qJetPDSAq7wcWEmsvy/czuqmWzlUOSbR7wTpi3gtKqnZLbW+dAnHnIxrv+T03jmA4qN3pgHVbJfmG7vI6lAXT67FJVMUHvet9RU8bFNqtEcD9Ri0OgJx2sYRkEo7KKxNwtRcpEzINegbrrnfLy7098h/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721934928; c=relaxed/simple;
	bh=myYvlsezRSixHZlxZh4M2qKHWedCa0WEw3XJ3ykty2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKr2t02qbQXSGHFJlIP5cxUrN8xazBmKxaMBVC33PwWSBNdFIZP9B1bvZaZHm62mFEcHfmt3ouqDtJCyaXRig7eIZjGX/4TCN5kcXP6F88CXqG3cHpXUHIbdBjy/NH0Auh3dI12qtO1uz73qbUaDzhwT2VKqbOoL2vlzfa7lOSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=ZjUkOzH6; arc=none smtp.client-ip=209.71.208.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1721934926; 
        bh=ENmCsk9NnTg8TPsAY85RaHxMSTZ86zpalMKt6WOZVzM=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=ZjUkOzH69wCiUF2pQoRduvfhF07l3J+2/IeQ33TX8FDYc6Bet6KTOuQXW4mxld4zUpM/FPWfOpLy6uHZFJA/unAvECi/llk1bcEzoUxbJ7odR7rasZZb+GDEMQCVPHykXZ1oMtg0O4G2TUiVKVUzwdyPwcddvUkymhNkrShTXnCvscHu4YvBERl3ZvFeM5RGf6Y20GBaudiNsoiIEV7hFSBIzu78cmX+UAPYbv/1Jq6/kToWCCs9xcAlw+9XlNDFNI0Rltb1uNUSI7KIaWX+3KQB3s7r/hN16OXdvWm1H7Qd4JdGnB0LVgBBD91Ree/QbBfZWgpXCfZE2jmr0oKGHw==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 66A27566000695F9
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeeftddrieefgddufeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepjeelffffjeehgffgueehleegfeegueeigedtkeffgeduueetffegffejudekgfeunecukfhppedujeegrdekkedrleekrddvvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddvrdeglegnpdhinhgvthepudejgedrkeekrdelkedrvddvtddpmhgrihhlfhhrohhmpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpnhgspghrtghpthhtohepiedprhgtphhtthhopeflrghmvghsrdeuohhtthhomhhlvgihsefjrghnshgvnhfrrghrthhnvghrshhhihhprdgtohhmpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggrvhgvsehprghrihhstgdqlhhinhhugidrohhrghdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhrtghpthhtoheplhhinhhugidqphgrrhhishgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
	thhtohepmhhprghtohgtkhgrsehrvgguhhgrthdrtghomhdprhgvvhfkrfepsghrrghsqdgsrghsvgdqohhtfigrohhntdeltdeifidqghhrtgdqgedvqddujeegqdekkedqleekqddvvddtrdgushhlrdgsvghllhdrtggrpdgruhhthhgpuhhsvghrpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvth
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (174.88.98.220) by cmx-mtlrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 66A27566000695F9; Thu, 25 Jul 2024 15:13:40 -0400
Message-ID: <f3f59d8a-3ea4-4a21-8b0d-ba0d63ef1ff6@bell.net>
Date: Thu, 25 Jul 2024 15:13:40 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 John David Anglin <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com>
 <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com>
 <54cb80b8-9c89-4b61-b1cd-1e626daf6719@bell.net>
 <fa37987e-568f-9716-719e-85e3da8db47@redhat.com>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <fa37987e-568f-9716-719e-85e3da8db47@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-07-25 1:27 p.m., Mikulas Patocka wrote:
>
> On Thu, 25 Jul 2024, John David Anglin wrote:
>
>> On 2024-07-24 3:25 p.m., James Bottomley wrote:
>>> On Wed, 2024-07-24 at 20:17 +0200, Mikulas Patocka wrote:
>>>> Hi
>>>>
>>>> Thanks for fixing the cache aliasing issues on PA-RISC in the commit
>>>> 72d95924ee35c8cd16ef52f912483ee938a34d49.
>>>>
>>>> I think there is still one problem left - and that is
>>>> ARCH_DMA_MINALIGN. Currently, it is 16, which is obviously wrong.
>>> I don't think that's obvious, why is it wrong?
>> I see this comment in arch/arm64/include/asm/cache.h:
>>
>> /*
>>   * Memory returned by kmalloc() may be used for DMA, so we must make
>>   * sure that all such allocations are cache aligned. Otherwise,
>>   * unrelated code may cause parts of the buffer to be read into the
>>   * cache before the transfer is done, causing old data to be seen by
>>   * the CPU.
>>   */
>> #define ARCH_DMA_MINALIGN       (128)
>> #define ARCH_KMALLOC_MINALIGN   (8)
>>
>> L1_CACHE_BYTES is 64 on arm64.
>>
>> Possibly, the same can occur on parisc.
>>
>> Dave
> L1_CACHE_BYTES is a performance hint that is used to avoid cache line
> ping-pong when multiple CPUs modify nearby data.
Our L1_CACHE_BYTES define is wrong.  PA7100 has a L1 length of 16 bytes.
PA7200 to PA7300LC have a length of 32 bytes.  PA8000 to PA8700 have a length of 64
bytes.  PA8800 and PA8900 have a L1 length of 128 bytes (this is from ERS D_Stride).

Thus, L1_CACHE_BYTES should be 128 for CONFIG_PA20 and 32 otherwise.
> ARCH_DMA_MINALIGN is the biggest possible cache line size to avoid DMA
> data corruption. As there are some arm64 machines with 128-byte cache
> line, arm64 has to define it to 128.
We can continue to define ARCH_DMA_MINALIGN to be L1_CACHE_BYTES.
>
> James said that the L2 cache on PA8800/8900 is coherent with PCI. So, I
> think that ARCH_DMA_MINALIGN should be 64 (is that the L1 cache line size
> on PA8800/8900?).
>
> L1_CACHE_BYTES could be 128 to avoid ping-pong between sockets.
>
> For ARCH_KMALLOC_MINALIGN, there is an arm64 commit
I believe we need to define ARCH_KMALLOC_MINALIGN.
> 9382bc44b5f58ccee375f08f518e53c0280051dc, it is an optimization, so that
> they can use cache line size probed at startup instead of 128. I think we
> don't have to do this optimization on PA-RISC, the PA-RISC machines with
> 16-byte or 32-byte cache line size are old and slow - so that there is no
> point in trying to optimize kmalloc pools for them.

Dave

-- 
John David Anglin  dave.anglin@bell.net


