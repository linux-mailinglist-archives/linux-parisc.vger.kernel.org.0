Return-Path: <linux-parisc+bounces-3051-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 659559F57B9
	for <lists+linux-parisc@lfdr.de>; Tue, 17 Dec 2024 21:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0F09161DD6
	for <lists+linux-parisc@lfdr.de>; Tue, 17 Dec 2024 20:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E73242A9B;
	Tue, 17 Dec 2024 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="kejs1tiy"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D0C1F75AD
	for <linux-parisc@vger.kernel.org>; Tue, 17 Dec 2024 20:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734467296; cv=none; b=kFbgOisjVGsYcF6+REeMpYbTETDWLVV64K6pj0NFl+ujD5pI5+/SmFZmXUhOaLZmK9xvSE9FB3Ozo6ZII8uZlGIvv6x52mOeNbB8ZFLfJKGRHVQdqib4FxGGgCZ1/UBwFq/8BMLNPxw360c11nq41ZAHEhoLBRgm4/1+x6RiGuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734467296; c=relaxed/simple;
	bh=zcCA8xhODHOaWWXCP3gO7Q4+QEvmrLPUeZtX/ReLYFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=bkq85peqq074bBfFJeTstrB50ehV5zHkPKn9Ywsd7/QOx4c/qJuBfi9DOFn4Yt7GXiTifyiDlSBSkBnLj8VnLMN/L1gx2F0CpsPNmptltASHoOn471viuydd+WDO6V+GLM0UBGm/85prFAugRZxQmU2lXVqawFjA0nAgPG5ohxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=kejs1tiy; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734467288; x=1735072088; i=deller@gmx.de;
	bh=TyYi6OlShGwcoZZntpCkEIRe47jzEq7HDcwP+yaCCMQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kejs1tiyoYowPX/tFGXH3cCWb6cu0YugW3ZwKiV6ijfJqJezhkMEDJClNbVaVfxQ
	 RuxduFRTyG1ec8kTX5AQlmtk7xb1Bi8d0SHpl9AzTszhcb2O1L+7k0hXpCnD8Kwwg
	 5T7z+hmTyTSl6oozJDKidOmg+cpXeZDzlfMuYm9CvFGGIaxlH9Rh8LtTZETqBJs0O
	 nWVVo3pzO8p4QpjdBtvcDmCoxq5kjmuPHytrG8h+iQvSO8wytj0VGLcA4LKsOI44a
	 zWgvEExtwJgyM8hfpX1rI+lsN8WvJaqD0m4KW9NMlM1WRDjawKXU/wUiSf609Rn/H
	 Qtzordu4xEFRKfMf2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHs0-1thmHy2ksE-016H4G; Tue, 17
 Dec 2024 21:28:08 +0100
Message-ID: <10146364-f075-4fa1-9f45-1fa614042ea5@gmx.de>
Date: Tue, 17 Dec 2024 21:28:08 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Graphics support (HP VisEG/VisFX/HCRX...)
To: Michael <macallan1888@gmail.com>, linux-parisc@vger.kernel.org
References: <20241216064156.6bbe1330@bushmills>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
Cc: "svens@stackframe.org" <svens@stackframe.org>
In-Reply-To: <20241216064156.6bbe1330@bushmills>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:13QeXbi2VTMK3ur+ovD1Q/z4skvt6pyuatg9hvsgjT2Ss8wmBwE
 t6dRHF9vW1LMYQKf5BUkVWf//Sbz7Fitkd8uB/iRp2RPSanhR6tvSJJOAZ/fBmzjkI3D/9v
 Vo171Aofm2Jv0jfEuM9Pw3d9h34AdE7t2powIMsLZQxLljashlAlmV+y7bBLIEismt/7ngZ
 ix/TaNMVud7FrKuCLZZ2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:s5qJ2MCZVCU=;KRayp+DLoEH5SunMBzbB2gHY/Tx
 LQ9yXD5fTfpQvQGLjh5uqt/s/SN40Ps86KWvUjGRkYk+usVKaXTmuEO70/URVTkMtzkVh3GUi
 ZeGOU8IbwP8xGuT7x2hyRRa8guJwREFR2P6rNgcfsosnqdu0+1e0j2PvFX0lHkMupL5Z1Q6Kn
 befujJNXTnfQgXqCMdz795j1eARaIfM7/D1Kdhs7+iI7LTQbEp+4GAjOxNnxX5Up/SCXhAjvv
 rHutKhRqiROgnlox/3/vbjt6PyTIXa99WIivGsrC+X3LLxqRdfTV8xenK/Mmw6Q+/Ws2z2nZz
 z5ly08E9GBSZ6EFCuCRnFPcvamAmJqbWtfQlykay0o3DcbCk3xCfs0iX285GwbaNaCJg1tgXs
 1DMAQR2O81MkpgFt4loTu97f3VFTexEAOEYpA4w7dxhgCqLxtxA1f4cgqWUTen6AFnJ1awg6p
 iPQTHVQwzfiQtMtJNqFIEyGfzIz2EirJZnXfuIERrNaF2rLu5BSXku/plsZUY9sYDCQaaZhbs
 dqoebB695IKkQC2fRifgeTjwiB2MQIdZeF+BUNA45zX7dzJxcGY9z/wEIJoxfE009LO63Ivop
 GoQyn4up1ZmPJcyzWUsfntX9dOsznnYHack2VYYCi1U4UEZc7ripOY4m0XkP2NVf4RpX4+3L7
 MOnfty7OMimH2WzT2XI4+FwRwporzfvjEhaeYb9Lw31uOo3ljbOWRraqJZsLzo1DiQu5WxHwI
 7bW+wVUXjAz2CG/ke6fbU7sjRNJSjiKQU2I8lsYVe843uhzfzSdZdnXJZg21JlReoKsDhzgyr
 JZXE5m57AYRAnbIPjPMzGbhjKgGsEn98DFmgC46pBoXzcaM5isrIyehtvcGolIaMPQnAxTmRK
 PBjKtN9jcXHVBoQI1BehzpHJNTZEkoGqR6eqkDx730y4cdPu2J14OFq1l1tH3Tjsdnkk0qKLC
 hp060L8IHSkxn6pqxJYpTq0xjsmCzLkmDWDrLORiLQKztIO+8CMv9IHxjQfljMBT3BLmmfg8A
 gH/4UgF9dT7CNC4dOxOa3tiyM4XDogS33FctGRBrvCVkK/RNEAavRL+XSD0mqTn0Dr3xLX2X5
 bkJMOiTzFmD5f/ZsYdGpMw2vkQSY69BaXkJqN/dsgE6XSQD6TlscUSPYlIwsdetep1HcsjusE
 =

Hello Michael !

On 12/16/24 12:41, Michael wrote:
> is anyone still interested in graphics support on HP hardware?

Of course !!!

> If so, I made some progress on Visualize EG, HCRX and Visualize FX.

Great!

> Full disclosure - I'm a NetBSD developer, I used some docs found on
> parisc.docs.kernel.org, this is my attempt at giving back / comparing no=
tes.
>
> Recently I wrote native drivers for Visualize EG, HCRX and Visualize FX
> 4, they all support framebuffer access, basic acceleration, cursor
> sprite, and on the HCRX, 24bit colour.

I assume you mean native drivers for NetBSD ?
On Linux VisEG and HCRX are supported in graphics mode, and VisFX in
text mode only.
We do have drivers for VisFX in graphics mode too, one for fbdev
and the other for drm. Both are not upstreamed yet and have various
reasons why I haven't upstreamed them yet.
See branches at
https://github.com/hdeller/linux/tree/hp-visualize-fx-fbdev-2

> I also wrote an Xorg driver that
> supports whatever acceleration I could figure out, which is copy, fill
> and hardware cursor, on all of the above, except ROPs on Visualize FX.

Maybe the VisFX driver sources from Sven Schnelle can give you some
idea. See github repo above.

> EG, HCRX etc. register functions are here:
> http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/ic/stireg.h
> PCI Visualize EG / Graffiti driver:
> http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/dev/gftfb.c

> HCRX / hyperdrive:
> http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/dev/hyperfb.c
>
> Visualize FX stuff, mostly found by disassembling the STI ROM on my FX4,
> comparing notes with docs and hints found on parisc.docs.kernel.org,
> and a lot of experimentation:
> http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/ic/summitreg.h
> http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/dev/summitfb.c
>
> The Xorg driver lives here:
> http://cvsweb.netbsd.org/bsdweb.cgi/xsrc/external/mit/xf86-video-ngle/di=
st/src/

Any chance this can get upstreamed?
I'm happy to test it on Linux.

> What I haven't been able to figure out so far:
> - how to do ROPs on Visualize FX. I can do colour expansion, STI colour
>    change and plain fills and copies

Here are the Linux VisFX drivers:
fbdev: https://github.com/hdeller/linux/commit/87e03df1af93e8236b3c1b44e60=
c0fa2d6c995d5
drm:   https://github.com/hdeller/linux/commit/3a5fc28d9e3d39e7e116b8acf0b=
028a3024d9c36

> - access off-screen memory on HCRX. All we can mess with is 1280x1024
>    in both 24bit and the 8bit overlay. I'm sure the thing has more
>    memory than that, but blitter ops wrap at those boundaries and FB
>    reads return garbage.
> - off-screen memory on Visualize FX. STI reports 2048x2048 but what's
>    actually accessible is screen width rounded up to the next multiple
>    of 512 by screen height. There is a clipping register which STI sets
>    to match the video mode but setting it to 2048x2048 does not allow
>    access to anything else, blitter ops wrap like on HCRX. I *know* this
>    thing has more memory than that. On the PCI EG we get full 2048x2048
>    no matter what mode we're in.
> - 24bit colour on the FX. I can switch the FB wndow to 32bit mode but
>    that doesn't result in 24bit pixels being displayed.

I have not hacked on it since quite some time ... :-(

Helge

