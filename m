Return-Path: <linux-parisc+bounces-4358-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A7ECCDAF6
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 22:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 566F2300DB87
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 21:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB22B2FB612;
	Thu, 18 Dec 2025 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtcyNMHV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9239F2D8798;
	Thu, 18 Dec 2025 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766093337; cv=none; b=NUhCH7Qb9n73qLjY9Ow60O7+6vvTikxOa6BdOONWhqur4F3ghtkCTGpdGoY6cD5qASiworDgCAtzzJuf9PX74Q7JEE3mhYqQyz0HzFlpeFYfLIrVKGij2tJS+iXCZW8wPneqBrnmzJn/0IqwXSBUT/NFeVdiXbXaZsZ9lCDiNbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766093337; c=relaxed/simple;
	bh=XeXW8pCcjCKXpYpSoWU24d6G582azzpX2pAgE21eGiU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YdSvikyogSjIZJuYa42ibV1eyHZuMVDBU54uW2+w45O0Hn3IkLEGFjYYbW+ELtioZI30bouWEOE3K/QPyDL6svog8AdAAy7e7jZOgqQUi6ZavyBpwS2xdxQ6hHtTehhQyOM08ouvt9XGd+Xv0MMmljfRyoDlk+cZmNs2s3NPEAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtcyNMHV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24108C16AAE;
	Thu, 18 Dec 2025 21:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766093337;
	bh=XeXW8pCcjCKXpYpSoWU24d6G582azzpX2pAgE21eGiU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=MtcyNMHV5OTpkgig/eNVpLuBddSn5nJr6damEx3mFOPUMvdAqNjUjIjsHx7yCpBkD
	 u8O79CK3eJXywfMW6CgoTaZYVT4eZmAk74c+iDJIRtwIT+mGMWV7Beq2zTwsDngmKI
	 e56LP/q7evaUakAPnpex7yhHGYtgachziF3ZIW0rHttfaSlpMY/pA7gU2xsxLDfjZu
	 fFoNxgRdF7Ik39PO4pIbeB6UfG+p1XcXD7/YM3yicf8v9vl+tXDpX3+mcVbKLijARE
	 LFTd5/5P+SAKNft2ugH1IUVSWjFFAcQ6Jy0y71hP8+YFcAGY6RfeFoS1oXJGWBJ1SQ
	 1obcMxB4/3H0A==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2BD59F40077;
	Thu, 18 Dec 2025 16:28:56 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-04.internal (MEProxy); Thu, 18 Dec 2025 16:28:56 -0500
X-ME-Sender: <xms:GHJEaYnvpQX7d9sOkZa8aM7-tKzGispvptS4ZI5xqi2liyxk2UvoXg>
    <xme:GHJEaSrntvgWgrbFg8pRm4JjEgiCYSdGwZpgUYLd1hFUwWeMgYp_k3rBz_4g7V423
    uCxcdShLldnM6VfC6_ZGwD-Cqi94yywYp9AKkiQWnSsZCm-_ci9GBc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegieehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdfnvghonhcu
    tfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeetgedugfeuleeufefgffevgfelteetkeeghedtlefgffeivefgueetjefh
    teehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hlvghonhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvfedtheefleek
    gedqvdejjeeljeejvdekqdhlvghonheppehkvghrnhgvlhdrohhrgheslhgvohhnrdhnuh
    dpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggv
    lhhlvghrsehgmhigrdguvgdprhgtphhtthhopehjrghmvghsrdgsohhtthhomhhlvgihse
    hhrghnshgvnhhprghrthhnvghrshhhihhprdgtohhmpdhrtghpthhtoheplhhinhhugies
    rhhovggtkhdquhhsrdhnvghtpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrg
    hmshhunhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqphgrrhhishgtsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhgghesiihivghpvgdrtggr
X-ME-Proxy: <xmx:GHJEaaM-6_mvCOYHwV_NuaXN1tpwV4hADHx3MI_g9RvK-L2U-eQyag>
    <xmx:GHJEaTB9AS61jsXZDBL_F1SPN04UH0ZOTRHyAYpgfK3g6zkQWnFS8w>
    <xmx:GHJEaRLJNWlHg35DqsawfOcxn1dItOU4V19a8IpwFiz1ViJFcDhoHg>
    <xmx:GHJEacPDjaVLkCikuDrFAI21sIQVVyyL7Ng2oahDX4lZ12cVNc6lCw>
    <xmx:GHJEaf5JjgAMsRLgnuMbjiAt-LPJOXK4-WYMxDoopfVOs2qVPXGud5Bg>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0DB272CE0072; Thu, 18 Dec 2025 16:28:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A6h6BtAWq4Co
Date: Thu, 18 Dec 2025 23:28:36 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Helge Deller" <deller@gmx.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Jason Gunthorpe" <jgg@ziepe.ca>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Guenter Roeck" <linux@roeck-us.net>
Message-Id: <91700541-3c17-4c2f-aa6b-b4e1a36749f9@app.fastmail.com>
In-Reply-To: <23342800-92be-4288-a9cd-e9e436a2ef87@gmx.de>
References: <20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com>
 <23342800-92be-4288-a9cd-e9e436a2ef87@gmx.de>
Subject: =?UTF-8?Q?Re:_[PATCH]_parisc:_Set_valid_bit_in_high_byte_of_64=E2=80=91b?=
 =?UTF-8?Q?it_physical_address?=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Thu, Dec 18, 2025, at 20:27, Helge Deller wrote:
> Hi Leon,
>
> On 12/18/25 13:08, Leon Romanovsky wrote:
>> On 32=E2=80=91bit systems, phys_addr_t is defined as u32. However, pa=
risc
>> expects physical addresses to be 64=E2=80=91bit values so it can stor=
e a
>> validity bit in the upper byte.
>> ...
>> Also remove the now=E2=80=91obsolete macro.
>
> Your patch is OK, but could you please keep the lpa() macro?
> It's unrelated to your patch, and sometimes we need the lpa()
> e.g. when adding debug code, so I'd prefer to keep it.

The parch was already accepted and if Marek agrees, he can easily revert=
 the deleted hunk and rebase my parch.

However from upstream perspective, we don't keep code which is not used =
and if this macro would be function, we would get compilation warning fo=
r that.

Isn't lpa(x/) equal to virt_to_phys(x)?

Thanks=20

>
> Thanks,
> Helge
>
> ...
>> diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/in=
clude/asm/special_insns.h
>> index 1013eeba31e5..fbccd76180b6 100644
>> --- a/arch/parisc/include/asm/special_insns.h
>> +++ b/arch/parisc/include/asm/special_insns.h
>> @@ -2,21 +2,6 @@
>>   #ifndef __PARISC_SPECIAL_INSNS_H
>>   #define __PARISC_SPECIAL_INSNS_H
>>  =20
>> -#define lpa(va)	({					\
>> -	unsigned long pa;				\
>> -	__asm__ __volatile__(				\
>> -		"copy %%r0,%0\n"			\
>> -		"8:\tlpa %%r0(%1),%0\n"			\
>> -		"9:\n"					\
>> -		ASM_EXCEPTIONTABLE_ENTRY(8b, 9b,	\
>> -				"or %%r0,%%r0,%%r0")	\
>> -		: "=3D&r" (pa)				\
>> -		: "r" (va)				\
>> -		: "memory"				\
>> -	);						\
>> -	pa;						\
>> -})

