Return-Path: <linux-parisc+bounces-1858-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A688993DFE0
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 17:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAF101C2100D
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 15:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886141E521;
	Sat, 27 Jul 2024 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="wYOQ69Hk"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo002.bell.net (mta-tor-003.bell.net [209.71.212.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB7A16F274
	for <linux-parisc@vger.kernel.org>; Sat, 27 Jul 2024 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722092814; cv=none; b=nPYsoOOPWy4kK8MDFLb0JKinqK3ms41qn06TLd6izQGI9NIRKMYJzXFZPVaqMsseSFONXpL3wcJfSvB8qNXj8rfx8vGecZLhK8tyg+6UryTBJCfSTI6Yg/+SFZ7BzYJFq71hfpBuFVe1z+cQvMGu+oIHsM2OZNATzEZsbxdzmBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722092814; c=relaxed/simple;
	bh=PUMDzSjv5zDGV5VC3jwAx/pe05wbU4MkZE9CKIw4Ow4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sVaVczx+8PEcI1o++r0Pg5V0iuAJnDdt9ziVv3IkMtvwbMFovA8UO+Tlhu2kvQ4J03QAsH9k1W3YKm9TeWAcqMoJhsEAvHdO3mXEm3MthOP9Cmmz/VMLnhf8NfRakuw05RB+t+p+U06QAYXcAPu4HOfIlG28nKp7fySLtX63cu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=wYOQ69Hk; arc=none smtp.client-ip=209.71.212.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1722092812; 
        bh=qiTo1xc4f/cYBfsFNfNI/GHrLM1404UfnM/va4pCET4=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=wYOQ69HkRSkP0ZuhgpRPqyY58jJfcsOWCBE44asEJT1EBJi79RHsXGP+PL3tN15gtjCj2QQh+8pmb8U2fNBilbiTqA34azm67qqGzkHtJhhLCupLVmjE5KvsuivpBYobZZo36NeAD+Lt8LEz3a9UukvbrWeTqWTmQ+Chk+x/xakmDUkloBXmw8FMwpF54atz1oWnv3ksNjfJFA1p6kflS6Y5HxaNi/IH3ZV8b8EKUu/M/gIzvgdg0xc5DSmRX69YAM+gzVsbjgpI8UE6q9ywjUzm5/31pVZcx1U0TXxQ3rXytgiBjmAeJVr7kGQFQpRivbMnVtwor4BgrPIFZWl9Mg==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 66A3BFFF001997CF
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeeftddrieejgdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceugffnnfdpqfgfvfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpeejleffffejhefggfeuheelgeefgeeuieegtdekffegudeuteffgeffjedukefgueenucfkphepudejgedrkeekrdelkedrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedujeegrdekkedrleekrddvvddtpdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheplfgrmhgvshdruehothhtohhmlhgvhiesjfgrnhhsvghnrfgrrhhtnhgvrhhshhhiphdrtghomhdprhgtphhtthhopegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdprhgtphhtthhopegurghvvgesphgrrhhishgtqdhlihhnuhigrdhorhhgpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
	thhopehmphgrthhotghkrgesrhgvughhrghtrdgtohhmpdhrvghvkffrpegsrhgrshdqsggrshgvqdhothifrghonhdtledtieifqdhgrhgtqdegvddqudejgedqkeekqdelkedqvddvtddrughslhdrsggvlhhlrdgtrgdprghuthhhpghushgvrhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvght
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (174.88.98.220) by cmx-torrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 66A3BFFF001997CF; Sat, 27 Jul 2024 11:06:37 -0400
Message-ID: <f5c8171e-65f1-4009-97f8-6a33fd1d3573@bell.net>
Date: Sat, 27 Jul 2024 11:06:38 -0400
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
 <b3254b3c-438a-473a-87a4-b627ec706d2f@bell.net>
 <5b706825-a022-85a-4fba-14975654dec0@redhat.com>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <5b706825-a022-85a-4fba-14975654dec0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-07-27 6:24 a.m., Mikulas Patocka wrote:
>>> L1_CACHE_SHIFT can be set to arbitrary value - setting it badly could
>>> degrade performance, but it shouldn't cause data corruption.
>> If we set to an arbitrary value, we need to document why we do it. The naming
>> suggests that L1_CACHE_BYTES should be the L1 cache length.
> It's hard to say what should we set it to, if we have different
> microarchitectures with different cache line size. ARM64 sets it to 64,
> despite the fact that there are some ARM64 machines with 128-byte cache
> line.
>
> L1_CACHE_BYTES is a matter of performance. Do you have some benchmarks, so
> that you could try to tune it?
>
> The commit a01fece2e4185ac173abd16d10304d73d47ebf00 says that setting
> L1_CACHE_BYTES == 16 improves performance.
I can't recall what tests were used at the time.  However, L1_CACHE_BYTES == 16 reduces
the kernel size and this probably helps performance.  16 bytes would be the minimum alignment
for ldcw locks.

The comment about the L1 line length being 16 bytes is wrong.  The notes we have from the
PA8800 ERS clearly state that the L1 stride is 128 bytes.  The notes show how to flush the L1
cache.  I think the L1 and L2 lengths have always been the same.

Dave

-- 
John David Anglin  dave.anglin@bell.net


