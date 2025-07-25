Return-Path: <linux-parisc+bounces-3810-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8BB12423
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 20:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 195B1174282
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 18:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAC02494D8;
	Fri, 25 Jul 2025 18:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="ibZE1es2"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD452550CA
	for <linux-parisc@vger.kernel.org>; Fri, 25 Jul 2025 18:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753468645; cv=none; b=ly2j+63+s1KvtJCHgZ9u9feSkLgEXZftlohoYb36teXY99SdpX4exJvOsYf1K92GXQPipwDjR72jhTy1XcmWn8UWN17aOuHOMqKyz66gJgFFQZtrEeQ/pjkIKyHr3KvKurI+FpPfX4YhuAxDKIX440dTZSUp8YAz7RsKCkH2K08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753468645; c=relaxed/simple;
	bh=PneRTN73jnEZfwInPeHIs1XCi+dZUTYA+Ur4xvuL4WE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EwpSRPdxuC2HlHmNkudnSR7kvZ+0vcbUf4MeEmKtDkHBjjWUkDZ5/gCtyx7FRjFrprBoiYWPTtysQZ8/QAHnVqOASuzSeOLAxxudeVaxS3P7k3U2Sjea3KeFzMRT2/jyDEbJfNZ1QPMbst7EjoJ6Yh37Tu/7nPWb1ZrRT4CuwXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=ibZE1es2; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753468633; x=1754073433; i=deller@gmx.de;
	bh=c6KDfVAcwjJDy6yNG11VHoxt0uIcwcewFUGQa7Ackb8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ibZE1es2JhzYfwglyqw2IHe+zwqKvvzY/V97ICcQA7MkKAtE8HmAWkogjn+/9Hiw
	 hCUSjR+3+uSoS8H9g9ITEwx9CtrE0v6brGyIbSMOmjdTjCZn0UOROt0Mv1CIchQXo
	 elOYX566YCCSOpZU7M2YnhLaBBtPF0lZ6yrgvMu9bgemtnOrUkKYMeMssgb31l0no
	 uld/9tzexnAuL5HDz/+uP5A/Tam5WWAPfL3zIFYKPDQFzVyzTUMYMOqtHCqUXM0oB
	 rDnc89wvtfK113fEK7TAxOKieq7p9uIEwt68GhbAE9hHnII/f0unlKpLvXXOqgqJ2
	 RRGWQHaQwyd2m9A0IA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mi2Nv-1uABKq2L5N-00iY8Q; Fri, 25
 Jul 2025 20:37:13 +0200
Message-ID: <8524edb6-f011-4e0c-8647-c03dfb720c09@gmx.de>
Date: Fri, 25 Jul 2025 20:37:11 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] parisc: Revise __get_user() to probe user read access
To: John David Anglin <dave.anglin@bell.net>, linux-parisc@vger.kernel.org
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
References: <aIPEJOOMJQtuW49u@mx3210.local>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <aIPEJOOMJQtuW49u@mx3210.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:huXYXYnIhONJ/3T7Kscqt2l6JrH1iHj6giAXGXqOpgKjrQeg9aq
 TuCQuNA+ohje129EmJ7eZnfgxnF3CcbTDComl0n5NA2MMYO1mTf6DQ8IeEIn7/s9NHSMOn5
 15VNqbVQPRQxFBQjS7SRQKrciLkegXPts7KCfqxPdwOLg/blma7kA5lO/HD8Rn3fyBbFbTN
 1LYhdFNEswR3YKsecgymg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nbgn2pRmBp0=;rbA3PRGkJorHpuguaaZZ1Br43JT
 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

On 7/25/25 19:51, John David Anglin wrote:
> parisc: Revise __get_user() to probe user read access
>=20
> Because of the way read access support is implemented, read access
> interruptions are only triggered at privilege levels 2 and 3. The
> kernel executes at privilege level 0, so __get_user() never triggers
> a read access interruption (code 26). Thus, it is currently possible
> for user code to access a read protected address via a system call.
>=20
> Fix this by probing read access rights at privilege level 3 and
> setting __gu_err to -EFAULT (-14) if access isn't allowed.
>=20
> Signed-off-by: John David Anglin <dave.anglin@bell.net>

Thanks a lot, Dave!

I've applied that patch, but modified it to utilize PRIV_USER and
EFAULT constants instead of the hardcoded values in the proberi instructio=
n.
Compiler does not seem to complain.
Maybe you want to check:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/lo=
g/?h=3Dfor-next

Helge



> ---
>=20
> diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm=
/uaccess.h
> index 88d0ae5769dd..f610bda1466a 100644
> --- a/arch/parisc/include/asm/uaccess.h
> +++ b/arch/parisc/include/asm/uaccess.h
> @@ -42,9 +42,23 @@
>   	__gu_err;					\
>   })
>  =20
> -#define __get_user(val, ptr)				\
> -({							\
> -	__get_user_internal(SR_USER, val, ptr);	\
> +#define __probe_user_internal(sr, error, ptr)			\
> +({								\
> +	__asm__("\tproberi (%%sr%1,%2),3,%0\n"			\
> +		"\tcmpiclr,=3D 1,%0,%0\n"				\
> +		"\tldi -14,%0\n"				\
> +		: "=3Dr"(error)					\
> +		: "i"(sr), "r"(ptr));				\
> +})
> +
> +#define __get_user(val, ptr)					\
> +({								\
> +	register long __gu_err;					\
> +								\
> +	__gu_err =3D __get_user_internal(SR_USER, val, ptr);	\
> +	if (likely(!__gu_err))					\
> +		__probe_user_internal(SR_USER, __gu_err, ptr);	\
> +	__gu_err;						\
>   })
>  =20
>   #define __get_user_asm(sr, val, ldx, ptr)		\


