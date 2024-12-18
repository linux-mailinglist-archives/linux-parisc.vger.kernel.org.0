Return-Path: <linux-parisc+bounces-3053-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 263199F5DAC
	for <lists+linux-parisc@lfdr.de>; Wed, 18 Dec 2024 04:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7123B16A783
	for <lists+linux-parisc@lfdr.de>; Wed, 18 Dec 2024 03:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EED613F43B;
	Wed, 18 Dec 2024 03:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUqyYrqS"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A7413C83D
	for <linux-parisc@vger.kernel.org>; Wed, 18 Dec 2024 03:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734494361; cv=none; b=a+HtCrW9W3OFi+3LL0gRqDau/vIUIXZx8KX0sxLU29y5vT7BkuetPVyYJBhLsKIOPCQ3yDrww/B5pwQgJiJ+wQRKyxlx9HAcwF6bGIumVhThBRwOgi4AppCeE2mCbPwzGhGau9MWNqt7RmPGr0C4M1trgdEJ1DZEcZpyu+f8IoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734494361; c=relaxed/simple;
	bh=gxAhEmOHLIc8YyEn2yxpDNbtf/HV7NQTY1LKJT81NNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHNWqNMTW9I8R/TMVgkMVqhjP+LyJd33VR5yKGphZ5qST9Jy2wu/+qU0Nc4/8o12N4NLhhd8KsAHlKnF89zM2PzDYsSHAfMP5jM7nUNEgsqnWavNKsMRCVZhtCZG1SDEY8LIO9l6P3Dqt+TFWymiCkWXikRDqN9EsZi94W7Hy3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUqyYrqS; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d89dc50927so43124986d6.3
        for <linux-parisc@vger.kernel.org>; Tue, 17 Dec 2024 19:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734494357; x=1735099157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr5aNS0aXtaLd33/4WKTMskLVbu+e5IxUkG1PKQGxf4=;
        b=fUqyYrqSJwBQ1Yda6+uYhST0ZXoNHh82EmAp95aQiL85VTdJ/DVIpOw9IcRsyu8uTS
         43djeEBWAl/Fy6bwlxFpD7S2mBTuBnKf/oEaLM0wTljEQ0CHUZlg4aToHjBX8+2qacqE
         7oIT+d3Crn9kOVCtTpnGivGMPgPZLz+BZgiFdNjUUud+Oy5WKcRTYsS9xcLdKqqUyvmP
         d4GZNBBvoZRJKn/RmeNRUIUxZhGoZNZx0W0e52LAx8C9rlsm9IyMH6bO1IpbiX1BSuOl
         UYDXHa3H2DDBz20Q0IsVhkNuhGvpQG6Tg6xszi9+6fw49vB8TorQEK/a/G/JfosrQzeh
         RnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734494357; x=1735099157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yr5aNS0aXtaLd33/4WKTMskLVbu+e5IxUkG1PKQGxf4=;
        b=FkVIozYsPzc78WVsWLn292YMRvWCBd/eSCmiClQhPFQ5i6Y/00VsMGUjCRp5W/vHOu
         sJ7SUlnQ+YB6QePbI1FwEn2rKJyp3DjJf3ky4TxS25RsegXfuq8z+4jIFn3LwX90EzZJ
         BhdW7dLCdMJ8rc93mYVpQBZLEf31cVSc/SF7zzu3FaX3At1Qba2H10w4Fg85jLfr3TM8
         2mY9S1+1pUxO3lR3B/NyvlO3ZtiYEVulEREvLOYUYis3o0t+jqmfab8n9vJk+Nxa/BOD
         m/k8e3bO0LoWTvb7gFYiQyweBoZ3EQgrwGlN9u8c7Lo4H43Tb2/1mdwznxABhfyEFK1n
         d0ug==
X-Gm-Message-State: AOJu0YxPwLx/CDvh3iH8J+0hT+fRayWlVriO9m63819Lx4roR5PIx2Q2
	Cy9bQu34utxQTNoZ0njr4SoLfDqlP3obJ1fNJTUdIiPf+2ReRtcR
X-Gm-Gg: ASbGncs8KIF9prMyg4KXCyESmagxb9Z4fNQeSDFhe9p7TTCMV/7/ZSfMPVqOnWYeUjK
	wn8G7zXLHbbyU5ZxU/KtJD2JLHRI3zB56HaMWuVdYxcy6VeeLmuqU1QxnQKbLC9RUle0bKq2vDo
	VDfVn/bkx6WyqBP05snu3FiUU0n9CuigK9gpExWwTkKex7yML6hRsYbUBGCrBaYg4XhlGaAuQ9c
	2XLRDxjp2r/XOithprQ2665qRlrP8KdojmDzFzK4M6t7ZowdvHwQWGlEIjsu1tD/FBCnZM1bg==
X-Google-Smtp-Source: AGHT+IFiRRGn58ews1kQyoPDXql3I61ucuXpF8PBkMrTrpgfz8+Qva1+RBBo9C20WUH7TWc4ugl5tw==
X-Received: by 2002:a05:6214:2481:b0:6d8:a148:9ab4 with SMTP id 6a1803df08f44-6dd09263fd8mr19663556d6.49.1734494357358;
        Tue, 17 Dec 2024 19:59:17 -0800 (PST)
Received: from glenmorangie (dhcp-67-147-67-125.gobrightspeed.net. [67.147.67.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd363142sm45786816d6.81.2024.12.17.19.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 19:59:16 -0800 (PST)
Date: Tue, 17 Dec 2024 22:58:57 -0500
From: Michael <macallan1888@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org, "svens@stackframe.org"
 <svens@stackframe.org>
Subject: Re: Graphics support (HP VisEG/VisFX/HCRX...)
Message-ID: <20241217225857.2184eb76@glenmorangie>
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
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, 17 Dec 2024 21:28:08 +0100
Helge Deller <deller@gmx.de> wrote:

> Here are the Linux VisFX drivers:
> fbdev: https://github.com/hdeller/linux/commit/87e03df1af93e8236b3c1b44e6=
0c0fa2d6c995d5
> drm:   https://github.com/hdeller/linux/commit/3a5fc28d9e3d39e7e116b8acf0=
b028a3024d9c36

=46rom the register list:
#define UB_CF					0x40000c
#define UB_CB					0x400010

I'm willing to bet that these are Cursor Foreground and Cursor Background.
Going to check that in a little bit, I've been looking for that, but in
the wrong direction.

have fun
Michael

