Return-Path: <linux-parisc+bounces-4357-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B58CCD29E
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 19:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B572302A792
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 18:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FAA314D30;
	Thu, 18 Dec 2025 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="jfzaZLo3"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F8C257423;
	Thu, 18 Dec 2025 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766082460; cv=none; b=MX7T/La+Tatt0V19nRhv7j/XwYewKmJYOlouFC9n+wKi+bLqbm2A8DYTlkzSu5ZwvYmFb3hjD8lvSF/B5W/cOWyz31t4ByxfvQ+k6wuyznQxNWKzU7s1AzekyI+ivKCSNKtLxFhvYDMCdUeYeKZhbCUIxxAQxeRaoiNYSw5S8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766082460; c=relaxed/simple;
	bh=N3tOpOUoxsj0WFxC6jDHKO54Fd3ThB3gI9CCQtYBfx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/nYiO+lSfmPSO0yJFofgNgcwgC0+1jVkUt2jQGE/icoThEb2MT+8c1/Uxb4hWLLQpxxmhANHHSmeJ8cjd52JY0GpcckG08Nq4Um8LKob6qj2dOgyM8FD+7lu64Phh/+7wLbelNKHyk3zEDpqyoicY0XVs+QtZogBlhjjgZgd3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=jfzaZLo3; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766082451; x=1766687251; i=deller@gmx.de;
	bh=5c53MrplGiUmUv0z5ZUBkOoaAKoZA7nvDy2FAjdpwDM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jfzaZLo3hH6XLuDMJhisn+vzIgQTge0xmI5qsn8PYFlau5QC4iwOt9hR2Fdw1Vg6
	 zH42/TxWtNEwfQ83rvwhe14JalwuMWuWmpGx4COAi4+/CzyW+oGNqWCH64bmAjgmd
	 fwLG7VkAjQUa13ih+QcClbjpyMR7BjQPgUPxqjyAnDlQO50fPZtE9RDd5wb2YTk6Q
	 i5ZkRXmW215hhF5Vx4VpUftPaf83KH9UVRRob0gOVkWsTmAL9HOdxiQmhf5VDufBu
	 nyupRbj9b+kFnbFJCEQZ5OOdT+IWiJYFb2oScqNw5hKSDBBcxAQiigVDIAKte7Wc1
	 0GN7tqBr6W6At3Rqmw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.168]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s0j-1vW1Cu0ZMd-008TUa; Thu, 18
 Dec 2025 19:27:31 +0100
Message-ID: <23342800-92be-4288-a9cd-e9e436a2ef87@gmx.de>
Date: Thu, 18 Dec 2025 19:27:28 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_parisc=3A_Set_valid_bit_in_high_byte_of?=
 =?UTF-8?Q?_64=E2=80=91bit_physical_address?=
To: Leon Romanovsky <leon@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
References: <20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:35Wfr8dT3Sv7pdYhDHlQvnuTlaSj7CyYdfS1bvV8jXkFnfELYWH
 2zi+2v14kByupkRvlzfmVPGmuPCYkJn/11GoFDtSjN6Gxr8K1zNjyiDDZvWzJnc/lhgz9vi
 tNT1g/5GceX2LYmUP704DoiG3E62K3bo8fBCRMuXNkQGDgoefLoO5TqC+agbEl8xABIhzLa
 TTJ9QJbs7NkhFVonxaXhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4nW5C1tvgZg=;qw3XGUMRPLyfeeljZOGr0gqzqwz
 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

Hi Leon,

On 12/18/25 13:08, Leon Romanovsky wrote:
> On 32=E2=80=91bit systems, phys_addr_t is defined as u32. However, paris=
c
> expects physical addresses to be 64=E2=80=91bit values so it can store a
> validity bit in the upper byte.
> ...
> Also remove the now=E2=80=91obsolete macro.

Your patch is OK, but could you please keep the lpa() macro?
It's unrelated to your patch, and sometimes we need the lpa()
e.g. when adding debug code, so I'd prefer to keep it.

Thanks,
Helge

...
> diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/inclu=
de/asm/special_insns.h
> index 1013eeba31e5..fbccd76180b6 100644
> --- a/arch/parisc/include/asm/special_insns.h
> +++ b/arch/parisc/include/asm/special_insns.h
> @@ -2,21 +2,6 @@
>   #ifndef __PARISC_SPECIAL_INSNS_H
>   #define __PARISC_SPECIAL_INSNS_H
>  =20
> -#define lpa(va)	({					\
> -	unsigned long pa;				\
> -	__asm__ __volatile__(				\
> -		"copy %%r0,%0\n"			\
> -		"8:\tlpa %%r0(%1),%0\n"			\
> -		"9:\n"					\
> -		ASM_EXCEPTIONTABLE_ENTRY(8b, 9b,	\
> -				"or %%r0,%%r0,%%r0")	\
> -		: "=3D&r" (pa)				\
> -		: "r" (va)				\
> -		: "memory"				\
> -	);						\
> -	pa;						\
> -})




