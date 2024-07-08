Return-Path: <linux-parisc+bounces-1781-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A33792A8EC
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Jul 2024 20:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EC31B2062D
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Jul 2024 18:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34ED01482E0;
	Mon,  8 Jul 2024 18:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="MCThVRWq"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF2B79FD
	for <linux-parisc@vger.kernel.org>; Mon,  8 Jul 2024 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720463210; cv=none; b=RWEHVtXPHSU/fAqxZ+DtkxFtvCIJsX7uLUHdMglxuC3eJ/WHHGPSKO4jbTmj3k60TdfC6JcfGMlRIlXbbBVGavRBHf5uy15Kh3crWGMZltuAKNDtrYxvFi1fERaDkY5HUj8TnXeQrFWyQ0yBJWPYACVVYFQA0pKfZmcO9e0t1Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720463210; c=relaxed/simple;
	bh=H5GaMb3JWiBvUSL/akNm1A/hmQ07huW5RaCHGbfIZC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LW9Vy22HJKAws/D9snNnaXP9Wl0BPmzQfp41G6ZB9sMTmrhs+GeR7YrAsBlRFZsKLx8q9ib/gLONvPrT6iOSClLxA0y6Lu2TEL8Z6xengY84plFcfb0+4Q7TDpftZKNrJkaRaBAxqJOS+0Wp7uIhD/M+Q9BLRKXeHpcCWH2FYzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=MCThVRWq; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1720463183; x=1721067983; i=deller@gmx.de;
	bh=CCwbOZ49vFwDzrDkGpksH6rM80ivXf0VKuEAssRtQhQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MCThVRWqRboAqcicEsrTZ9+u6z/gxRiRQ0axpYeceyeJyy9FYeUOYycbJcEqsMhb
	 yqzvM7sF0vD15sFaAUYsC3k9ro6U2uKYPCfgauAtTMd6l6b5dBtw6i/t252Qqaq1p
	 GssD9uidWp/EyOjgy/S2dU4lEcjsKDSwfH3nAJoYvQRGDRFUQP2y68Bz3DzAQVcH+
	 Sr/nMCU6F3JH8Fm2QxTG9Hm+YcOeXBIkhWlbP2FUcMoNHhGTY3QfcE6hEheZ2uZMI
	 e67EjIEOtMHCZMa4JFx9+XadjAT7SwnCYtz/F+KLJi25LAOFnkNeaIWZsGSqctgkW
	 0TcdJSDIO2Dg+NhL3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.33]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mn2WF-1s0JI02rzT-00g7SM; Mon, 08
 Jul 2024 20:26:23 +0200
Message-ID: <b494d5e4-123e-4625-b947-644ac4283838@gmx.de>
Date: Mon, 8 Jul 2024 20:26:21 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hppa: Wire up cacheflush syscall
To: "Andreas K. Huettel" <dilfridge@gentoo.org>,
 Florian Weimer <fweimer@redhat.com>, Helge Deller <deller@kernel.org>,
 John David Anglin <dave.anglin@bell.net>, libc-alpha@sourceware.org,
 linux-parisc@vger.kernel.org
References: <Zos8gVaGUcuaaNaI@carbonx1>
 <877cdwfgi9.fsf@oldenburg.str.redhat.com>
 <a6a933be-9795-4614-a925-25049736d3c1@gmx.de> <2572286.PYKUYFuaPT@kona>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <2572286.PYKUYFuaPT@kona>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3LaQERy2Dxm80jSRgVsRBVcUWuq801U2t4DKUrZWmxWxse6Od9O
 huDeyjjN1NmTiXfopMkns718NeGpp/bu8yfaZ/P6MtlnYLjD+6RJXwRTqqLrqoHijR3JFxp
 gf7W46hXcAK3P5oTm12fPrLnOlyciapV+pryev8DF/zBNEnPwH2Nt9d1OCt0XTsWKKGbWBZ
 vQ6V40A72B9WWHa6xBidA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GwLS14nV1TY=;68L6zUMrLBSFnewNWdgFgq67cjN
 AaQVsQbHGjxg+cE3cKvc9pMViHYYtOYsSNyNKAOaNhjK16JOChIgaX3cmnVKHfhPdvstjO1cR
 0n6nLPSqYstMX7rCcHri4w7v9DFV3oIfL19907hPytFNjpX/WP5TFYOfY+2OWMnEM+fAmuVlE
 CzbgFCqnG2MSdIH/eo+TVjm5Ug/MUOL/EjWfgB8YAbByiaU0H2z75khcMHi+KFDhoqqQWotn3
 1xebOenREJg/PLGilTxfxKFxdt/76dy/hLQER0ELd8T5vGM98KGvx/jjzEl5RAjIpgI0KXQt6
 6MebKA9y7o92itTcbEmQrAXnDcGXLQ34k56Gh6BdMWqknTw0OMfgkVLqqJYqmo6WmC9MCb//7
 cAiimb+suu0S4wGgOtqFHfcA+Q6hd/Rx9KFpzucsc0OOOkJOCHgR1R+XTF26l1NZNPwsJRSa9
 KceE+0+vAb83C0yOh1eq1tKr29dBLJEwCc+yWaP8vNRU2zGdqyA8JH9jjzNtn7WWFE4/ZUI8F
 qYk5hHqNfOYz06pzH93XpDvXVVMGmTvUdt+6atjgxheY9xK23FOtuywmDl8GSUFD3JPPdiMMZ
 /Lh+U3QiwdcAuvo9V8I7x/eki17UrVEqnhEE4sKJ8f+LPxzQUEySi9tYbOi8C1gVAVmwLO9U8
 1a1JFsb8HoRq32zJzHU2NxA63/Sl+Qjoq2mv4hFFcVlIlNUTyyHTxHlNWVrpemtXqdtlKTC39
 2LYrX0a9EQwqUyphskPPH3hnRb6qRNcyGGxGZIsUWLdYIMW51b0j3vLvupGEFq8i7BLnoPQ2M
 QFjRPIvgAkSHW8hUf6qcPh0CF6uG8ALetUr24tMZ+ky08=

On 7/8/24 18:00, Andreas K. Huettel wrote:
> Am Montag, 8. Juli 2024, 10:58:35 CEST schrieb Helge Deller:
>> On 7/8/24 10:13, Florian Weimer wrote:
>>> * Helge Deller:
>>>
>>>> diff --git a/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h b/sysdeps/un=
ix/sysv/linux/hppa/sys/cachectl.h
>>>> new file mode 100644
>>>> index 0000000000..16e47d1329
>>>> --- /dev/null
>>>> +++ b/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h
>>>> @@ -0,0 +1,36 @@
>>>
>>>> +#ifndef _SYS_CACHECTL_H
>>>> +#define _SYS_CACHECTL_H 1
>>>> +
>>>> +#include <features.h>
>>>> +
>>>> +/* Get the kernel definition for the op bits.  */
>>>> +#include <asm/cachectl.h>
>>>
>>> This makes this header (<sys/cachectl.h>) unusable with older kernel
>>> headers.  I think it also results in a test failure with older headers=
.
>>> Is this a problem?
>>
>> hppa lives in debian unstable, so basically you should always use
>> the latest kernel & kernel headers when upgrading glibc.
>
> Ahem.
> https://www.gentoo.org/downloads/#hppa

Sure. But I didn't mentioned it, because Gentoo usually uses a
more recent kernel than Debian, right?

Helge

