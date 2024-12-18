Return-Path: <linux-parisc+bounces-3052-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7499F5D23
	for <lists+linux-parisc@lfdr.de>; Wed, 18 Dec 2024 03:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A3BD1604E9
	for <lists+linux-parisc@lfdr.de>; Wed, 18 Dec 2024 02:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4903B130E58;
	Wed, 18 Dec 2024 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJfoI38S"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DB9487A5
	for <linux-parisc@vger.kernel.org>; Wed, 18 Dec 2024 02:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734490577; cv=none; b=O6YOHCDsUlRl85joeSZpJT6RPeXL7aQ1Luq2/KtteHtwzz8lYB5buYIAhqiYIgS2XW/3PX7FvJJ5loEaVcb8zZprbsV5f/xTKEwlUiotOMjdWq1nug2tDjxFBSsZ0HuSJKkV4Tndqf6vNbGLzUpRvfWzewIHEIKL+kfyxBl2mso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734490577; c=relaxed/simple;
	bh=4XdwyUZWIbJe0/Vm0vzXa0kqzxaoZuSy6rgF6CdXiME=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mpa3aAJCJImUg6ogLRyacWSypgFQvwxoTdg+q1oO/f/YtlkHY6Gksdl3WKYzzuVlBbC10KHLLatrFillJs2K+TmXuTe0SKQow7E0lzR9PlI6jTOV2fTNhaRp0IcMF5z+cW0QdFEINiE6wLRiPjlpoatdgd4WYK03pAPM3wEP0EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJfoI38S; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-46785fbb949so66638061cf.3
        for <linux-parisc@vger.kernel.org>; Tue, 17 Dec 2024 18:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734490574; x=1735095374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JncqOk2qNa3H5zAFl31ARl2RbVq5lc1t87grpadjYUs=;
        b=VJfoI38S19nWUvt6YBWmQaAWxS0nU8tSZXv2tihJnFSQpcEpC1CbjskXTXV7VAUBEJ
         YkhNNX0JKWctNM7xR9F75uNUW101U8ig4kozrAfy4l+AnDSUNKxMSsNJ2R1BbFU2vm2Y
         VX3cMvQ+//awQRPIspcPBIN7y0iniLMiPnuOjDNiOZ0jRbUR2jS/YyX5RBmnEwnlY0T9
         ineBbm+vAPfUAH7Wk8M7RKYmx1KMsiDVgrvIyZZDkul/9s/PnPqopClfBqqizj4f+KTI
         SWPTd7YVqNknOyWFpiYYwkVfM30OBFEbhUFzE1Al0L8mf8TNTavmZb8hfukHb1/gPap/
         cT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734490574; x=1735095374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JncqOk2qNa3H5zAFl31ARl2RbVq5lc1t87grpadjYUs=;
        b=GmFGI4Ei5AA2dWgQaCeU21s5KJRswwzFgFPXlohjia+hUl3ZnmFOqByaknJ+6bTrfS
         o8i0F7M4idEN5Zeqq905ZMrVObFSqJSFVPn6KE5wrTxz86Rmk839zrKTyCeRxID1LGp/
         cScK3jCqmxVMpDzx+HIpQ4pDXtJm2zH+RQUAjcvm504USCx+kpsDTWoIVsQQzG97xgQu
         cRa5xrSqCDkZP8Rf0XmMKzbP3ek4CWVV5QDLKIvn9ulaz5N1xCgAo84S23uJ7i/su6oN
         RgVrz/PgRlqU1pq7njSwhcaJAo+38zubbJl0gwhxu78Jx+wz7qWoYodVswlXgUBkThVp
         0pBA==
X-Gm-Message-State: AOJu0YxPCrheGAd6NTr73TJvE8HDNpUaLObfCLGI3FZF9hPP+jW6RK9W
	gFIa06o69yRZwfgYpQQqBbHnKlXujbkBPTbW6HgiqYG7i39w84mu
X-Gm-Gg: ASbGncv8Ty9SnTbBuB2J/X7X9cZv5RXnGIyX50Sf855UfwMalVEek+Gw5J4Zm/T08ng
	W/JvlVvxUNlFSdORfOCVFvF1wTmNM8FI1ZpIXxlcrwwdvmcShiuqZqJkWPiQ5JngVDvmMRWGhO1
	EQLQPLIgLp15twV0Y+OkrQ1NtvJkJBmSub9jlwAqFNyHWdZHofWXg/BiL9eHIwQzJ8SoblaAWpq
	xqAFONuP0qiNjgORi9P3WOpBM5U+blqDWR4jX3ePxKsk0occKaLZh/WOsJg5r1WH2jrDJw3Vw==
X-Google-Smtp-Source: AGHT+IHhxqaEDWBdQFKheGvfeLqlzqQ0RfrmxhbDIewo4eT8kPQEM8EfLPhUhLpANSo2K0mt+ld7BQ==
X-Received: by 2002:ac8:59d4:0:b0:467:75c3:89a8 with SMTP id d75a77b69052e-46908df7725mr22588421cf.14.1734490574113;
        Tue, 17 Dec 2024 18:56:14 -0800 (PST)
Received: from glenmorangie (dhcp-67-147-67-125.gobrightspeed.net. [67.147.67.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2c6e312sm46031771cf.8.2024.12.17.18.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 18:56:12 -0800 (PST)
Date: Tue, 17 Dec 2024 21:54:52 -0500
From: Michael <macallan1888@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org, "svens@stackframe.org"
 <svens@stackframe.org>
Subject: Re: Graphics support (HP VisEG/VisFX/HCRX...)
Message-ID: <20241217215452.03148eaa@glenmorangie>
In-Reply-To: <10146364-f075-4fa1-9f45-1fa614042ea5@gmx.de>
References: <20241216064156.6bbe1330@bushmills>
	<10146364-f075-4fa1-9f45-1fa614042ea5@gmx.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.43; powerpc--netbsd)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 17 Dec 2024 21:28:08 +0100
Helge Deller <deller@gmx.de> wrote:

> > Full disclosure - I'm a NetBSD developer, I used some docs found on
> > parisc.docs.kernel.org, this is my attempt at giving back / comparing notes.
> >
> > Recently I wrote native drivers for Visualize EG, HCRX and Visualize FX
> > 4, they all support framebuffer access, basic acceleration, cursor
> > sprite, and on the HCRX, 24bit colour.  
> 
> I assume you mean native drivers for NetBSD ?

Yes. The hardware is quite weird so just posting the sources seemed the
easiest way to document it. I'm well aware that our respective console
subsystems are too different to port anything directly.

> On Linux VisEG and HCRX are supported in graphics mode, and VisFX in
> text mode only.
> We do have drivers for VisFX in graphics mode too, one for fbdev
> and the other for drm. Both are not upstreamed yet and have various
> reasons why I haven't upstreamed them yet.
> See branches at
> https://github.com/hdeller/linux/tree/hp-visualize-fx-fbdev-2

We were the same way - there's a generic console driver that just uses
STI calls for everything, with a little extra to put known hardware
into fb mode, then run X on a dumb framebuffer.
 
> > I also wrote an Xorg driver that
> > supports whatever acceleration I could figure out, which is copy,
> > fill and hardware cursor, on all of the above, except ROPs on
> > Visualize FX.  
> 
> Maybe the VisFX driver sources from Sven Schnelle can give you some
> idea. See github repo above.

I looked at a proposed console driver, compared notes and made a bunch
of additions, tried to keep my own code more or less compatible. Looks
like an older version of the above.
Also found some differences between my FX4 and his FX5 along the way.

> > EG, HCRX etc. register functions are here:
> > http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/ic/stireg.h
> > PCI Visualize EG / Graffiti driver:
> > http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/dev/gftfb.c  
> 
> > HCRX / hyperdrive:
> > http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/dev/hyperfb.c
> >
> > Visualize FX stuff, mostly found by disassembling the STI ROM on my
> > FX4, comparing notes with docs and hints found on
> > parisc.docs.kernel.org, and a lot of experimentation:
> > http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/ic/summitreg.h
> > http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/dev/summitfb.c
> >
> > The Xorg driver lives here:
> > http://cvsweb.netbsd.org/bsdweb.cgi/xsrc/external/mit/xf86-video-ngle/dist/src/
> >  
> 
> Any chance this can get upstreamed?
> I'm happy to test it on Linux.

For now the driver is quite NetBSD-specific in the way it maps graphics
devices. In order to support both PCI and GSC cards through the same
driver with minimal hassle it just goes through NetBSD's console
devices, maps fb and registers at fixed offsets and things like cursor
sprite and colour maps are handled using ioctl()s because of the weird
way the NGLE hardware wants them ( you basically write stuff into a
buffer, then use the blitter(!) to move data to the actual registers,
so we have to make sure nothing tries to use the blitter or access the
fb while we do colour map updates... )

> > What I haven't been able to figure out so far:
> > - how to do ROPs on Visualize FX. I can do colour expansion, STI
> > colour change and plain fills and copies  
> 
> Here are the Linux VisFX drivers:
> fbdev:
> https://github.com/hdeller/linux/commit/87e03df1af93e8236b3c1b44e60c0fa2d6c995d5
> drm:
> https://github.com/hdeller/linux/commit/3a5fc28d9e3d39e7e116b8acf0b028a3024d9c36

Nice, I wasn't aware of those!
So, still no fb access. Well, I can help with that:
#define VISFX_VRAM_READ_MODE	0xa0080c	// this is a guess
or, in HP speak, B2_SBA controls what you read in the fb aperture, in
much the same way as B2_DBA controls what you write. Just like on HCRX,
what we see and what the blitter sees is controlled by the same
registers.
B2_EN2D controls the fb aperture depth, 0xb0 gives you 8bit, 0xd0
32bit, at least on my FX4.

Also, that's a *lot* of register definitions. Did someone get a hold of
official headers?

> > - access off-screen memory on HCRX. All we can mess with is
> > 1280x1024 in both 24bit and the 8bit overlay. I'm sure the thing
> > has more memory than that, but blitter ops wrap at those boundaries
> > and FB reads return garbage.
> > - off-screen memory on Visualize FX. STI reports 2048x2048 but
> > what's actually accessible is screen width rounded up to the next
> > multiple of 512 by screen height. There is a clipping register
> > which STI sets to match the video mode but setting it to 2048x2048
> > does not allow access to anything else, blitter ops wrap like on
> > HCRX. I *know* this thing has more memory than that. On the PCI EG
> > we get full 2048x2048 no matter what mode we're in.
> > - 24bit colour on the FX. I can switch the FB wndow to 32bit mode
> > but that doesn't result in 24bit pixels being displayed.  
> 
> I have not hacked on it since quite some time ... :-(

I only got started on hppa a year ago or so when I was able to get a
C200 and then a C360 system board for relatively cheap - I've been
writing drivers for weird and unusual graphics hardware for a long
time, just not in hppa.

have fun
Michael

