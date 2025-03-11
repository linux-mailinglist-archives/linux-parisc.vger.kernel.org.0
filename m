Return-Path: <linux-parisc+bounces-3386-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D9A5B976
	for <lists+linux-parisc@lfdr.de>; Tue, 11 Mar 2025 07:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CD3216F73D
	for <lists+linux-parisc@lfdr.de>; Tue, 11 Mar 2025 06:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879211E832A;
	Tue, 11 Mar 2025 06:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnOu8X0Z"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E52156861
	for <linux-parisc@vger.kernel.org>; Tue, 11 Mar 2025 06:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741676287; cv=none; b=LxbzG92PbXjORHoqybAAOLsHSXuvOAN59PMWuV+pDxRdcf4+QIreOOkaG4JAxQcn9XHLRD6Ku+ny/LZV3tWzjmSfp9WRU7yR28DHC6q0S2u+fKj9ykUZsIqnQNAaGZ66+0PKdl+Juemx1XXGH1sD3Dio62yEXXtjITJ6v4dKj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741676287; c=relaxed/simple;
	bh=ozIvrP/nAr/qNr/2rsgR0ZUb8hRuiv9haNtlMK/ADRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qJMYVIE+PVBSBvA9ioWsJhPViblm6Ihd8IhQ+LXz+kqVjOh8OLXrcSE8JiQ9KNdo9TYmMNi5iplcNzSwaT5TulpSWm/KTYFjGBCBKtkf3odWUEpaPon1wqAdKMmrhvWh+q0ziKqlEjf/SXGmz/DfAcT8j0kR+LUuNJibgyi+/NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnOu8X0Z; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ef9b8b4f13so46364237b3.2
        for <linux-parisc@vger.kernel.org>; Mon, 10 Mar 2025 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741676284; x=1742281084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKBb9N4aaohRiZ+MwOL6g0tdGL33tRg5fQ5BIw8UKjc=;
        b=cnOu8X0Z+2uk2us3Z0+z3+/JLDaWfbOIGpkR8meZBb+Brl9cqu5vRdri/L2dIFP4WD
         4LsXi9biq6POdy1plAxurGx8xLxZfNb7JJzEJIN8G+0yKu+EUBLc73xMmXNCA2S9VgJp
         8LSrawlKRRJVJyVOdXMHzkN5BetVo9H+8tM+7K7WzBX8SPXzdkbkN35RC4erkPrDKjhT
         vVcJQKHAcMIZV9W0nZPmaqX2elZhaS1ZmqV9k9+IuBCRBOxhuNrs5aNmjAezuevqozwM
         niSuUtk1eyxiDslxHUN3blUuEHQ8SQ3EuKQ5KzwFOzGOoYa0Er6SIhdRmVZRF7AOLtZe
         i2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741676284; x=1742281084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKBb9N4aaohRiZ+MwOL6g0tdGL33tRg5fQ5BIw8UKjc=;
        b=CXgCSSr5MbOj/gJ9KKKORhzTsGGMykd8ImCcUwhvH3gRbxCmWFGoDWLbfALcsKXy2Q
         8UcK9qjqe+GDwIH6Vb28tfDp6NVegoDuwklHYfJZWPMc9QpIASoNf/chef0XJ819f+qK
         ISwtVOxo/LAunzYf35QlAEF584nOJgZxIRv/Xaiyvx+BVAjOEPCjyrW9s/Ti+qzG2B6G
         5rEfYJI1WHvx4IjeW4aoHZyqoBu+6nY9jHiK+bFo1zogiE9Aj0we1ThtamQ0+CehRk2q
         q1IcEthGxQ0jEJ6vHYVwuTQkCVaNlLGS/1MhUPeGI3eH1tc09Sk+jo5b5JMm8DrpChQ0
         muyg==
X-Gm-Message-State: AOJu0YwgdjY8nZ91svRVZ6Q1gQcUMQOML9Rf7og9Ybo0vq0+6RkQDQ0q
	Mqw4t4PWNrj+6wAMKmMEwvYj5+UsQTgbEq04/B1P3/E2vqs/vNsBjk4a6w==
X-Gm-Gg: ASbGncvX97aojova5XgV4GfTektBe6ziw0gc9M9GzDxbwXSFLZFishLlYytWJr88Ypt
	bxinZxkIjvPCi09DQX6czFJ/TZ7PB3G3cUotK7Blv6VUF6eDMwB/2FUsGgQW/yR0+CMwBCmZgz8
	Qc31Hn1eSw+CPNsEawR/XyvEfAZAHUWNpbz3Q6adb9Q9ErVrKWmqCf+jxsZk4HrDrU6IvYeviCL
	lx+gx+6+0kCrfSptwqpn6SkepLBSs3lR2uq/WgO2hSwEUwInasOULiB/eFFWdJhxLZLfTeeggYZ
	spHr14FavnTcl5WoLQ==
X-Google-Smtp-Source: AGHT+IHISs4M+qFCGybjIL5938MgOSCG+V5yGlVMwvkx9uzougLGN5lG63jyZmVcXrZhAdyA/iAFyg==
X-Received: by 2002:a05:690c:7106:b0:6fb:968b:d8f5 with SMTP id 00721157ae682-6febf38c500mr226526687b3.36.1741676284106;
        Mon, 10 Mar 2025 23:58:04 -0700 (PDT)
Received: from bushmills ([67.147.93.135])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6feea9fb4fasm10305977b3.56.2025.03.10.23.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 23:58:02 -0700 (PDT)
Date: Tue, 11 Mar 2025 02:57:56 -0400
From: Michael <macallan1888@gmail.com>
To: linux-parisc@vger.kernel.org
Cc: "svens@stackframe.org" <svens@stackframe.org>
Subject: Re: Graphics support (HP VisEG/VisFX/HCRX...)
Message-ID: <20250311025752.35169870@bushmills>
In-Reply-To: <10146364-f075-4fa1-9f45-1fa614042ea5@gmx.de>
References: <20241216064156.6bbe1330@bushmills>
	<10146364-f075-4fa1-9f45-1fa614042ea5@gmx.de>
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

made some progress.
Mostly detail optimizations on HCRX and EG, and a bit more substance on
the FX4:
- ROPs, cursor sprite colours, 24bit etc. work now
- both the kernel driver and xorg now abuse the back buffer as
  off-screen storage, since unlike HCRX we can set source and
  destination buffers separately on FX
- kernel and Xorg both use the hardware to draw anti-aliased characters
  ( the FX4 supports *some* alpha blending, more on that further down )
- image up- and downloads now use hardware assistance - framebuffer
  reads are *much* faster when you tell the memory controller in which
  direction you're going to read
Still a work in progress, EXA makes a lot of assumptions that aren't
true on these cards.

Now for alpha blending. By the look of it HP implemented just what they
need to draw anti-aliased lines and edges. There is:
- no framebuffer storage - alpha in 32bit colour always reads zero
- only a few blend modes are implemented, all using only source alpha (
  destination would read zero anyway )
What we can do with that is:
- vram-to-vram blits with constant alpha
- rectangle fills with constant alpha ( not too useful... )
- host-to-vram blits with per pixel alpha
The latter lets us do PictOpOver and maybe a few others as long as the
source is in main memory and the destination in video memory. Certainly
enough to draw anti-aliased characters, which is what my drivers are
doing so far.
I strongly suspect that HCRX can do this too, unfortunately I don't even
have a hint of a clue on how to do that.

As for FX5 and 10 - attribute handling on those seems to be
substantially different from FX2/4/6 :/

This is still NetBSD only, but may be useful as hardware documentation
in case anyone wants to update the linux drivers, and I'd happily
assist with that.

have fun
Michael

