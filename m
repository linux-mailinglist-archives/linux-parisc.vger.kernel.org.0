Return-Path: <linux-parisc+bounces-2946-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 661339DEC88
	for <lists+linux-parisc@lfdr.de>; Fri, 29 Nov 2024 20:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B9C8282256
	for <lists+linux-parisc@lfdr.de>; Fri, 29 Nov 2024 19:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E6E1A0BFF;
	Fri, 29 Nov 2024 19:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="Phm5VRb0"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo002.bell.net (mta-tor-003.bell.net [209.71.212.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CAB14D430
	for <linux-parisc@vger.kernel.org>; Fri, 29 Nov 2024 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732909116; cv=none; b=CkodPrrzQHWrn3EFC3e8rFYomIKJoLVoQDTFDuJG5d8SDwiJn8EUkUDQnVDgXRNEdPKZWhcCBoS1/BCcV82G0oLOffLYvikQo/SiEM1UHT6GRqY8xd3BJrlQXCXaZM7A0Skmb+DfUJEuuXiCI91GRKIeVbmr0beUgu38ki9IBtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732909116; c=relaxed/simple;
	bh=9PeLuoPzzeE3hjtTp9VDMdRzQX9e2Alu389RB4GoXfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjFwI49RUfRuBzZI1JCbo7Zk04gH9OdNNfyiVwp9uRfRpR3LBCtJ4muPx1OkNGiUyIG7nVzKpeqH2rHAAofz8PctIsh+Ce6XxCUVIN8LaKhF6uX+And8RL4i2uNBjJ6Ny7q80cy4+KWPq2bH0ddAUzjySvOVFQFVQw1hEUJOoWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=Phm5VRb0; arc=none smtp.client-ip=209.71.212.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1732909114; 
        bh=t7Act4tcjbm/5oGFOPrHuf6PYkSTLyXwpJMwkPpJ+hE=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=Phm5VRb0EIG7E3XAlf+u++sPU99xNpCZrR8/7AecYU5/Rkmum/yNrryFRKpGS0vcClyhrkXUSMy7MvwKqo0dDfJmLHS4YDaG85tlPSvkMKvNHMqHPks7BtpCSZb1vSeRngGZYkRKwTAM4SKxDg+27SoDQFKyB9vZDz6/kBWxWvf6vmuVdzuZ4EFIUSi47mOoj1+xn35NMg06hewv4xy1baZufqi1iNV98wArapKg/9v1x6aQFK0vJm3zdkIx25z8bOHCZY1le1qhTRPKZBnjN0ZiDlQWE4bNnHnhGRYiNPWBI7KWaPQNx1+QCR82rOgf+RDOnhTlqUzn+nILWPYcmQ==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 673CED6E01B7C311
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeefuddrheefgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepuddvjedvffffheffgeekuedtueelledtueffffehffekhfefgeevffeuhfehkefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudegvddruddviedruddvledrieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedugedvrdduvdeirdduvdelrdeipdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgvvhfkrfepsghrrghsqdgsrghsvgdqohhtfigrohhntdeltdeifidqghhrtgdqtdegqddugedvqdduvdeiqdduvdelqdeirdgushhlrdgsvghllhdr
	tggrpdgruhhthhgpuhhsvghrpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpghgvohfkrfepveetpdfovfetjfhoshhtpegtmhigqdhtohhrrhhgohdttddv
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.129.6) by cmx-torrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 673CED6E01B7C311; Fri, 29 Nov 2024 14:37:05 -0500
Message-ID: <5468692c-df88-44ca-9f0c-f8d2e535bfa0@bell.net>
Date: Fri, 29 Nov 2024 14:37:05 -0500
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: stage1 compiler sometimes hangs
To: Helge Deller <deller@gmx.de>
Cc: linux-parisc <linux-parisc@vger.kernel.org>
References: <54fbebcc-d4f5-40f3-8711-bac14dcd5397@bell.net>
 <a5b5e745-30b8-4a1d-b406-fc1d991dc775@gmx.de>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <a5b5e745-30b8-4a1d-b406-fc1d991dc775@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-29 1:03 p.m., Helge Deller wrote:
> On 11/29/24 5:52 PM, John David Anglin wrote:
>> Hi Helge,
>
> Hi Dave,
>
>> I have done a lot of work on gcc in the past month or so trying to resolve issues with LRA.
>
> Thanks!
>
>> Sometimes cc1plus will hang during bootstrap.  This usually occurs fairly soon after the
>> stage1 compiler is built.  Sometimes it hangs doing conf tests or building libstdc++ for stage2.
>>
>> top shows hung process running at 100%.
>>
>> Once a hang occurs, it seems system is more likely to hang again (i.e., the gdb trick only
>> lasts for a few compiles before another hang occurs).  Maybe hang is more likely after
>> system has been running for sometime.
>>
>> There is no output from strace if it is attached to processor.
>>
>> If I attach gdb to hung process, I see cc1plus is usually in parser.  If I continue process or
>> just quit, process runs successfully to completion.
>>
>> I suspect this problem is somehow related to the size of cc1plus. If I build stage1 with -O1,
>> the problem is reduced or goes away.  I've never seen a hang building stage 1 or with the
>> stage2 compiler.
>>
>> Could this be a swap problem?  Or maybe trace bit gets turned on so process runs really slow?
>
> I doubt that's caused by swap/trace bits.
>
>> Any other thoughts?
>
> Which kernel is affected?
I've seen problem with 6.10.14 and every 6.11.x build that I've tried.  All my builds
have generic clockevent patch installed.

Problem could go back further than 6.10.14.  I wasn't doing as many gcc builds then.

Haven't tested 6.12 yet.

I've also seen problem with debian 6.11.9-parisc64.  I don't think it has clockevent
patch.
>
> I suspect some issue with kernel timer (and thus scheduler).
> You could try reverting this patch: "parisc: Convert to generic clockevents"
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=parisc-6.12-1&id=b5ff52be891347f8847872c49d7a5c2fa29400a7
That's an interesting thought.
>
> Do you still need to press enter so that systemd continues boot?
> Might be related.
Yes with 6.11.x.  6.10.14 boots normally.
>
> I see some 100% hangs with apt-cacher-ng (again) on one of the machines at SAP,
> although apt-cacher-ng has my latest patches applied.
apt-cacher-ng is not currently installed on mx3210.

Dave

-- 
John David Anglin  dave.anglin@bell.net


