Return-Path: <linux-parisc+bounces-3030-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7379F2FAC
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Dec 2024 12:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB9321881DE6
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Dec 2024 11:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CF5204592;
	Mon, 16 Dec 2024 11:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coH/Yhj3"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4142040BC
	for <linux-parisc@vger.kernel.org>; Mon, 16 Dec 2024 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734349324; cv=none; b=NQkgSHphCow5Spuq91vGmiw/lvO6eO+jR2VMYxELwNis6BxNSqgWMVGck2LPlXpRnLP7pEpaYIPIiNzTsSiNrNrsFGTMHsY2YHLjZQJRJOmzn0oYdf2F4GTeRW3+m0uSeyEP67nAD56FxtZIvyV0d0Tcf+dRnQ7Cnqom9vHeSvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734349324; c=relaxed/simple;
	bh=SPBCXkPHocuVl12rV/Ve84iy6p+4fQAtgLcHCsUiL24=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=QbN8k39pQBKWzoCW4ZwBx74Xnm6Usab9+u0fzEkzAX4/M874RaEKsYLl2ecTzTp7LjZrVL8pfx25vbSS4EEa/w4irlDnf2M1MA4lsCG+zq3aBQvsqfsdNC7ZNESpEXsxMsFbeH9VHqHX0izy9hPvT7YBaXu5znRwwI9WX6So0wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coH/Yhj3; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46769b34cbfso14064861cf.0
        for <linux-parisc@vger.kernel.org>; Mon, 16 Dec 2024 03:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734349321; x=1734954121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=utQw28XE9kSf0fbpScmSvudV1vv+4DPinRpGdXR7gd8=;
        b=coH/Yhj3uDMe7QxlKzMrbthSjo1L83lIV2aj8sRCRzHTN+SnjjkhoHREsAzPX/bAst
         6KGwc6hsaYS9d01Vh1/vF9L8G1WOqAchyVh7ASqJV9BR1sfclmDLFYlzhKllmE7Zq2v/
         2CPYmpR+G51344qwZLcLJkn0nunBQJjV9c/XYvv2E2hHujtu9vw4518FKz5JcFGklr/a
         OX5jnj71BQlosbu7xAVHKVE+P5u5/8tAVmqdWdoEGyQoQKOj5lMU3wkKdxeeq4fhQ/rS
         aT5m66FwhgPxRWPvog+KDsnWglKixyw8wfmQla89VQwmqcM1dN98DFJTPH+YBWuND0bw
         xxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734349321; x=1734954121;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utQw28XE9kSf0fbpScmSvudV1vv+4DPinRpGdXR7gd8=;
        b=A7UKh3oC4QxU3Bs0A9qIAXGi+SmH0Os2ex8ttc6jgXgBQDug92uiNgoht0sxcn8DQr
         E+HHLpHBWF+LiMo3qc1n1gjGrJ7LxDh+0yeVuGWlT0j48Sf1wdxte3AO+EKaNIHFqH4g
         vwWHD3/LrX7FukHj+xFc4bC557hIOsNa1f/OY/6XE0oXxXv4oJnSFGt/Hlf/yvsSM6EO
         XCy+z1SEPc4YVoQWR66BTX/NwSPKABt8lJDTO5jGxtf8ZyIYKHWGQVRr2P80vCGjkJcA
         I5Ajw13UiioRg8VI6yna8sVRF8eBE2OErp1W+fNB7wAr723458DBxrjZYqR1xnUjVIga
         0a3A==
X-Gm-Message-State: AOJu0YxLvQw3PvKSE2X2KMXLlxByaGYsxTqxQJJXIwKgcyO0M29MzLRt
	ZiLb3n8vnj34KZj0B39pwyuvWqvHLFZMPg3t6wUEdRIZof3f9dnlpa7sEg==
X-Gm-Gg: ASbGncvefLPJH5StQuJ2guQZ88apVTFtHab6bJB4B7T6pPaylXR1TKh/qmIr78h2Che
	0/5Ml+XxS+VhXkCdCObMwhmmz3eN9O+14CWJXIQAhhAPd5A5cTrW4EIZuncC38bU2UALZFD/5MS
	DzrzW+XpXUCkLIxea0KCMvj3+4i0ywRc3OOR/aksE1ZU9hIqZgSmiwjxNXsr6HYVORSnlytA5BR
	X1TnjsZDzasuVqL7rIaz7yA0aZ7v6IWblqn/6LVEXcgb8VkXbiSFFsj4ccqDaYofVb6tg==
X-Google-Smtp-Source: AGHT+IGnhBicr/T4i05Tfb7jQmTW4xS5GY/2R3urfQG2/Vm97/jcLJKMYjjHKIR962316NityVK1YA==
X-Received: by 2002:a05:622a:580f:b0:467:6fa1:9e2a with SMTP id d75a77b69052e-467a57fb30cmr246449931cf.40.1734349320747;
        Mon, 16 Dec 2024 03:42:00 -0800 (PST)
Received: from bushmills (dhcp-67-147-67-125.gobrightspeed.net. [67.147.67.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2c6a211sm26866721cf.15.2024.12.16.03.42.00
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 03:42:00 -0800 (PST)
Date: Mon, 16 Dec 2024 06:41:56 -0500
From: Michael <macallan1888@gmail.com>
To: <linux-parisc@vger.kernel.org>
Subject: Graphics support
Message-ID: <20241216064156.6bbe1330@bushmills>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; aarch64--netbsd)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

is anyone still interested in graphics support on HP hardware? If so, I
made some progress on Visualize EG, HCRX and Visualize FX.

Full disclosure - I'm a NetBSD developer, I used some docs found on
parisc.docs.kernel.org, this is my attempt at giving back / comparing notes.

Recently I wrote native drivers for Visualize EG, HCRX and Visualize FX
4, they all support framebuffer access, basic acceleration, cursor
sprite, and on the HCRX, 24bit colour. I also wrote an Xorg driver that
supports whatever acceleration I could figure out, which is copy, fill
and hardware cursor, on all of the above, except ROPs on Visualize FX.

EG, HCRX etc. register functions are here:
http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/ic/stireg.h
PCI Visualize EG / Graffiti driver:
http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/dev/gftfb.c
HCRX / hyperdrive:
http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/dev/hyperfb.c

Visualize FX stuff, mostly found by disassembling the STI ROM on my FX4,
comparing notes with docs and hints found on parisc.docs.kernel.org,
and a lot of experimentation:
http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/ic/summitreg.h
http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/dev/summitfb.c

The Xorg driver lives here:
http://cvsweb.netbsd.org/bsdweb.cgi/xsrc/external/mit/xf86-video-ngle/dist/src/

What I haven't been able to figure out so far:
- how to do ROPs on Visualize FX. I can do colour expansion, STI colour
  change and plain fills and copies
- access off-screen memory on HCRX. All we can mess with is 1280x1024
  in both 24bit and the 8bit overlay. I'm sure the thing has more
  memory than that, but blitter ops wrap at those boundaries and FB
  reads return garbage.
- off-screen memory on Visualize FX. STI reports 2048x2048 but what's
  actually accessible is screen width rounded up to the next multiple
  of 512 by screen height. There is a clipping register which STI sets
  to match the video mode but setting it to 2048x2048 does not allow
  access to anything else, blitter ops wrap like on HCRX. I *know* this
  thing has more memory than that. On the PCI EG we get full 2048x2048
  no matter what mode we're in.
- 24bit colour on the FX. I can switch the FB wndow to 32bit mode but
  that doesn't result in 24bit pixels being displayed.

hope this helps
Michael

