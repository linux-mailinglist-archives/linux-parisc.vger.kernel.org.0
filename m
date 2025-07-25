Return-Path: <linux-parisc+bounces-3812-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06774B124B5
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 21:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9B424E41D1
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 19:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FFC254854;
	Fri, 25 Jul 2025 19:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="OH082obJ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2300199EAD
	for <linux-parisc@vger.kernel.org>; Fri, 25 Jul 2025 19:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753471375; cv=none; b=PDye2pK0DmeyX+4aFOoHM8GmIa1+KufbLHzOjQiLhbqtwMxzleHl+vkpSlgS8sWckf4nvjOLK6UnsqH87pwxRn+zqKgca7gZwjBq3ZdhiZL9EOq1guog6o+i7eU+5Y58GwuW6v8uApXIf5vPXhyVTM7vVP4xUWo7bZcbl8Q7mB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753471375; c=relaxed/simple;
	bh=A1x9GuSnw4YCaf5L144y3BnOgsKj+lgdzwJu0z/mLNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+XpiVE1YuO4dFOmAeyMZZ01a72ugeqRDFULKhyg2XODR17C/1pOHn938qkmjs+sQig3orgCnLQymKiNRIg/47Lgc1Du001iclGrRFaQoGDzwFhjNRO+QE3EHX90zSPQhqowpC8FQWU2jnyjiZCKEf0hoVU1hfrDmrNBygCBYTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=OH082obJ; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753471370; x=1754076170; i=deller@gmx.de;
	bh=VKC1hGCmUQZOOrfm6snpqkxs6rdJr0w/CXAfo+qB9Z0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OH082obJIUhNVAYl9Q5ghJVjcZVk/2FNOqVwVO1LDqP1rm7lay7zk8bx7heYboUq
	 BDJKrPS52hYyYFKemMEsegjPXjvDhd5BJX+UbPu3v4YdjUAT3wFMZx48r2yawYCJu
	 xWMymj8xf6J37VzvX/9H8rDrQqEEojZRF2uW7VTBnSgIoFDdMVQLLqqWWL0bWnZ42
	 CiUqHijpaffhhHTCmPTOT5crIIC4NKFJqvtAMWh5BoL2njnWycfaW+qCTH/nUylqk
	 4gGarGKXme7C2XDNFK+v0VNvDrsfDT5ZiEXjEsdYpJNg6+A+wbD+Bg6l6WrNX3U0g
	 p76sl/tUl2M1bRVkiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6qM-1uIBD41gfU-00epdp; Fri, 25
 Jul 2025 21:22:50 +0200
Message-ID: <b0ad6535-c3f7-42e5-87ff-bc1b2f3b83ad@gmx.de>
Date: Fri, 25 Jul 2025 21:22:49 +0200
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
 <8524edb6-f011-4e0c-8647-c03dfb720c09@gmx.de>
 <52946f87-5a1f-41ff-8cf5-2637f89f9350@bell.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <52946f87-5a1f-41ff-8cf5-2637f89f9350@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:00K4V7H6zFbvxUa7Yoo2mK9iuCKweQs0+Qo8BAhv/QBu8qHcDtX
 9lEpixK7Qg5sSquFkT9IhO4DqSwxa3dLWE7pHVeyNyW+JuMaxRe82CI+BPUr7sfCa0Madm0
 Df0/01dFI6u0lN3d2M7BxO105R2sPfObsePEcloqJkLh+/zGOg4r7xf/WzLGSkUWEqRJS6h
 8ZkNTqS0iFYzg+7myNbcw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sYD1CQTF6Ec=;YBUA60e1ByJlfmtJ1yTtE7cRMGu
 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
 Ug==

On 7/25/25 21:07, John David Anglin wrote:
> On 2025-07-25 2:37 p.m., Helge Deller wrote:
>> On=C2=A07/25/25=C2=A019:51,=C2=A0John=C2=A0David=C2=A0Anglin=C2=A0wrote=
:
>>> parisc:=C2=A0Revise=C2=A0__get_user()=C2=A0to=C2=A0probe=C2=A0user=C2=
=A0read=C2=A0access
>>>
>>> Because=C2=A0of=C2=A0the=C2=A0way=C2=A0read=C2=A0access=C2=A0support=
=C2=A0is=C2=A0implemented,=C2=A0read=C2=A0access
>>> interruptions=C2=A0are=C2=A0only=C2=A0triggered=C2=A0at=C2=A0privilege=
=C2=A0levels=C2=A02=C2=A0and=C2=A03.=C2=A0The
>>> kernel=C2=A0executes=C2=A0at=C2=A0privilege=C2=A0level=C2=A00,=C2=A0so=
=C2=A0__get_user()=C2=A0never=C2=A0triggers
>>> a=C2=A0read=C2=A0access=C2=A0interruption=C2=A0(code=C2=A026).=C2=A0Th=
us,=C2=A0it=C2=A0is=C2=A0currently=C2=A0possible
>>> for=C2=A0user=C2=A0code=C2=A0to=C2=A0access=C2=A0a=C2=A0read=C2=A0prot=
ected=C2=A0address=C2=A0via=C2=A0a=C2=A0system=C2=A0call.
>>>
>>> Fix=C2=A0this=C2=A0by=C2=A0probing=C2=A0read=C2=A0access=C2=A0rights=
=C2=A0at=C2=A0privilege=C2=A0level=C2=A03=C2=A0and
>>> setting=C2=A0__gu_err=C2=A0to=C2=A0-EFAULT=C2=A0(-14)=C2=A0if=C2=A0acc=
ess=C2=A0isn't=C2=A0allowed.
>>>
>>> Signed-off-by:=C2=A0John=C2=A0David=C2=A0Anglin=C2=A0<dave.anglin@bell=
.net>
>>
>> Thanks=C2=A0a=C2=A0lot,=C2=A0Dave!
>>
>> I've=C2=A0applied=C2=A0that=C2=A0patch,=C2=A0but=C2=A0modified=C2=A0it=
=C2=A0to=C2=A0utilize=C2=A0PRIV_USER=C2=A0and
>> EFAULT=C2=A0constants=C2=A0instead=C2=A0of=C2=A0the=C2=A0hardcoded=C2=
=A0values=C2=A0in=C2=A0the=C2=A0proberi=C2=A0instruction.
>> Compiler=C2=A0does=C2=A0not=C2=A0seem=C2=A0to=C2=A0complain.
>> Maybe=C2=A0you=C2=A0want=C2=A0to=C2=A0check:
>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git=
/log/?h=3Dfor-next
>=20
> Maybe that works since you added extra arguments to asm.  It didn't work=
 with EFAULT
> directly in asm.

Yes.
 =20
> Another minor issue to note is the cmpiclr instruction does a 32-bit com=
pare because
> COND macro doesn't work inside asm.

Good point. I'll add this info.

Helge

