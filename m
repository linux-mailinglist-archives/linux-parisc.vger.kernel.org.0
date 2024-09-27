Return-Path: <linux-parisc+bounces-2396-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F791987F38
	for <lists+linux-parisc@lfdr.de>; Fri, 27 Sep 2024 09:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 933901C20F62
	for <lists+linux-parisc@lfdr.de>; Fri, 27 Sep 2024 07:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BB6165EED;
	Fri, 27 Sep 2024 07:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="B/hGVXC5"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF3417E000
	for <linux-parisc@vger.kernel.org>; Fri, 27 Sep 2024 07:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727421400; cv=none; b=MXvBkhgfpFs9Q3hUq/WeAQ0geIHTDVBAbD7kr613SqnUX9rg+I7FCeTJCBin2MoIrWqB22IElD5D5eCTwTKGGxOSy9HUW5o39iHfFeYwukip8dUezxWnxHYfil8Ped5rROhYBFKL4BEIeWpIJrqLnYw7O5mW0UtN2vyv+5XXRK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727421400; c=relaxed/simple;
	bh=j99eE/g2AjJK2ghD6WgNQDbpx/tDdVksRCPMMooNZJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/VYJuE53Avo+LbPKe1qGVIYzL5yNtOhMhNapZAjhVYl+j8kiMAXlwmsfnu3DMcG5SaX5TkzWTO01DYLBJ/68RtMBhYIZ1vVO+xvUAziAyM3U/Y97ylEL7V0f3pC1J8wLJAVrmOJah75RuBPtgvdZugVdSbBnfLgUhRFBa3fvEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=B/hGVXC5; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727421376; x=1728026176; i=deller@gmx.de;
	bh=j99eE/g2AjJK2ghD6WgNQDbpx/tDdVksRCPMMooNZJY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=B/hGVXC5GabkUT1CbUob7zCPUGIqM1cCaEYpXifZgCPsyL9q3uDFXwBtDMx7UX2T
	 bWUaYI67RjYXSqXiGaSS/VJlGcZHqBe+86OIV0h3Y/89kTy2lt63CkY/xpndatUfo
	 zPe0Q8Dlpd4+zWXcyC2V4nacYvPX8RAE5c1s2+IXwGCcaXae/3hXRdIyyAVRTn19P
	 pr/vM5iaG1AuOlwFYVWjX0VDLtPT+m0JodwNOhTf5BToh1tSMCNraJyAiubIl7uWK
	 uXOWWIObwDJu1lKvQA/R4TbI+L2XtO/Cz31nEDYGs/wKzsWD5dwG75JqgYhwr71xq
	 /3t52P0HqZObB3NX8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSc1B-1sW7EM3sZl-00XlQB; Fri, 27
 Sep 2024 09:16:16 +0200
Message-ID: <0befd209-abbe-48ba-963f-06787ce2f816@gmx.de>
Date: Fri, 27 Sep 2024 09:16:14 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hppa: Wire up cacheflush syscall
To: Sam James <sam@gentoo.org>, John David Anglin <dave.anglin@bell.net>
Cc: "Andreas K. Huettel" <dilfridge@gentoo.org>,
 Florian Weimer <fweimer@redhat.com>, Helge Deller <deller@kernel.org>,
 libc-alpha@sourceware.org, linux-parisc@vger.kernel.org
References: <Zos8gVaGUcuaaNaI@carbonx1>
 <877cdwfgi9.fsf@oldenburg.str.redhat.com>
 <a6a933be-9795-4614-a925-25049736d3c1@gmx.de> <2572286.PYKUYFuaPT@kona>
 <b494d5e4-123e-4625-b947-644ac4283838@gmx.de> <87a5iq7kdh.fsf@gentoo.org>
 <e959c48b-8584-440a-a46e-a7442043076f@bell.net> <87ikuiutbc.fsf@gentoo.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <87ikuiutbc.fsf@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZE5JQVM4vbwW0bhat2tlaAvPjVDEWH0cWLib9sTfn0ovXnCOaKJ
 V1pgFjJ1py7NUuz2DT5vCm0DqoVcs34qz/Mnbu1TqHwSJ2PMEWYm20IllXzNQJ92YXv/6+g
 KJdOX9gs7tqhZbFt1VM9m952a3uOJ//BhCo/5Zx/IcBnffQ+7dMwG7p8Fjuz+l21FMUujEN
 /n9GPU1Gwibfhkh8DCn8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:V5EQldJHVqw=;wUEfopScXbhRPpdWKenMXNSZ1IV
 FADGHabOZw7YHoOEgQ/XNOZ8O1sKi1FE7wKneCFDwv8JtH96jI2rLQKECW+14z7xBv4NXwBqo
 5YgQjCDMU18f7YHM8Wh53PyySPNRiB54hO7FdeGrn+WjUZZHOL9Vs0sNjIXXNhihhmky70ZBb
 6MaPbJd+kW4xzvuw/H5EisZf7t4LBhbZC3lIBgRu1J1H6IFATj7UH9nlgtVc9OBfV4zMX2D6Z
 WmsVv8BYc0e81wesiBv0X8MO2qxIh3eSnd+W2I1YMaIFfEU3c9JvB3j7+iKg2BmKbR+VqzwQ1
 Odytx2r4IpMSlePDw68GndRsJVuWawbh+ZbTPM7/PLryfatS+r5Xpi02HZu1x/sW+t8h4GN2S
 BgslX+Csj8EJi35MYGdMw0CYk8er/DcvjqScoDb76oEPveSSUNZ3nMnJ6+w9CbUK6q3xMROUd
 zkPgkTDwlcfYypGLP9Nl881DFzYYY2ba5MB4Ifvx5HNv4PDM52wf/8IsRpagVY6CJHQdpR+FE
 DiGJyPpI+pc26NCoCWUNAYOYrK5xiiGsVV6Iipdqi8Ok97QXfoAjfX4qQ761Nvf/2X1OK4lSV
 /5LcHfZo4+898jGA3v4Uj1gjhDM/hLitAl58WYk7dEKLIt0EnXLHCRNYBFTmbhFJ5ev3sfSrr
 ZbDb+DcvmbG2NVVrC6WL7naM3AKc3OmbMqSPHzTuFaD2YatfR/PZ5B9uHAelPubt8/JH9Vfgx
 cfH6smRUedPOD8IdbFSIaPcRAoRn7MaknWf0ocYMfBqtscb3Dk7gBmJOuMdIr6xUZt4p/uagJ
 OA6RY2eJfPiZswoIvNG3Qn0A==

On 9/26/24 21:08, Sam James wrote:
> John David Anglin <dave.anglin@bell.net> writes:
>
>> On 2024-07-09 9:41 a.m., Sam James wrote:
>>> In this instance, I wonder if we should do the extra checks. The kerne=
l
>>> instability because of the cache / TLB issues means at least one of ou=
r
>>> machines runs an older kernel for now. (Dave's latest patches seem to
>>> help a lot there, but you get the point.)
>> Can you be more specific?=C2=A0 Do you still experience instability due=
 to cache / TLB issues
>> on this machine?
>
> Sorry for the delay. Our main machine, 'muta', has been suffering
> instability for a while. It ended up also having bad RAM and failing
> disks. We've now replaced them last night.
>
> We had a lot of kernel crashes since then but after upgrading to
> 6.10.11, everything seems okay so far.

FYI, Dave's commit 72d95924ee35 ("parisc: Try to fix random segmentation f=
aults in package builds") [1]
was a game-changer for the parisc kernel. It went into kernel 6.10 and sin=
ce then
our 64-bit debian builds run absolutely stable.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D72d95924ee35c8cd16ef52f912483ee938a34d49


