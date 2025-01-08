Return-Path: <linux-parisc+bounces-3140-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9C5A06387
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Jan 2025 18:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 585A03A702B
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Jan 2025 17:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF6E1FF7D5;
	Wed,  8 Jan 2025 17:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IRhIFb4x"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D656919F41C
	for <linux-parisc@vger.kernel.org>; Wed,  8 Jan 2025 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736357633; cv=none; b=jfW3Fliw1ZHA7sOLc9xhaOnSbCciIv42FoiPdKpVr2MOK5lStwDqyEmoIkr5XBODyQlM5D0fgHjv0xZ/llRajSuyy8M10bYcPBSqsH+CFfLZbXbCMM2akO77feI03MlCto3y+Jr2mjXaqwsgrm/PaFXSEfm3nr67bpV6zp+9T9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736357633; c=relaxed/simple;
	bh=uFSUfP1qtRuzGaG+XFGpp6Zt99NNZ4zrYvsYvHahhsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqo2NyJTV0ebQAhDemVgslSyD2lD8xNdjHjWAamNioDut0ufpech84idXi+BWjyZM1zIA36bT8JoU7pmXDO9CA8uHb7mc3Tlfd32ZyTOtZEo3cMtbals0WCYag/JYwVaTKnC1fyJ3n2GymuCCzIrMOyX1FVofg9fxpAk7yhd06Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IRhIFb4x; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa67333f7d2so15985066b.0
        for <linux-parisc@vger.kernel.org>; Wed, 08 Jan 2025 09:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736357630; x=1736962430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFSUfP1qtRuzGaG+XFGpp6Zt99NNZ4zrYvsYvHahhsA=;
        b=IRhIFb4xBIugA+grUTjaDX7MVjUnaSmG8AvZLziDRmFlJaqLIifhVdjAJMJwC3hANX
         Lqvjw+Yl+sq3LEZFBcDEWHczL7/31IFXOeACj1EbEeuGK/RQ323+lZI1M+VisRq6X1A7
         mY4AKyecdje860r97F5Zp6iRvlJfrzrXebZJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736357630; x=1736962430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFSUfP1qtRuzGaG+XFGpp6Zt99NNZ4zrYvsYvHahhsA=;
        b=reVZVw40Q5KFmnD6vY6scT9MBNtLa6o+K+dvuBVB1jkoO/QzOrIVKME2w7MqTCQsy/
         OWH9LfX+D8d0CDjXg2aHD1ss4aTVwX3X2HG3wpiPi3Jcqb/A7p09rDOyoOWzkfa1VyLp
         xgpg2OukrvJ11rmf092L7WsFY1lgaRd5/ou649mkupmu+rsDzBA3EMMtJ876ytvBE9l1
         Fq5/Ecf5ex8sb6vYYO4BYd6OPM+PIzZ8gDPADFKJab3jW2+U4qgDe+bMayG8xLkdUxnw
         Z8ncKGpRpOy8wgjNvwNrlW3kvNl5UA1sgsIphU67tVm3lSTXx4z9uaEf3fKaryakx2Ju
         R3zg==
X-Forwarded-Encrypted: i=1; AJvYcCXaTRN0x+FaOA5fh6l8c814hzvW11r8djrP56fXgl3FX+Bz9gJas5eDnZBO0OH/XnILs4OcNog+979xNx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo6gyj7m5w4cYu0UfRowQuedev3ZVlbg3wy2+bCOIsYS4y8k34
	Hxkk0A2aINoMM6h7lQ5SKl67X15UNy13Wf2SfZruXlkDrHYbACrC8HxIy8qtUwfAEX7a2FfRBEn
	w3VlY
X-Gm-Gg: ASbGncvDEpIEvX8/iHy6BeHkvWE/z/ENDJ5zE5fF6E/cL/WQOkzIFqRO/3EWZwK+eps
	obyOYD1P2E/hB0eQatI5KtdKvc2FDCUyoWfH4dMYFMEmecvKdHeEQlCa65PZVebOmqxI5WoVHxg
	Di5G1chtu2xgivQfHHTcYe4zFHmdMKB2zdBCejA8KP3ryoY5dKFqFBvivzqxfTixRp+ayeV9ZZe
	3mcKsRz8+RnSBwgrjrJH8Pv9zoa6bkEmrDXszw4GYff78QGYG5poXjb8IAOKOGHkPL+TblgXg7D
	QP1t8GZ/gPQdMT04yfAX
X-Google-Smtp-Source: AGHT+IEMYq9Owct2BHp/98WlxAGFJ9PRwBP2O1vFHwnGtyoziyNbmqjUi5ZdlAhpSdQboOqE7t7KRw==
X-Received: by 2002:a05:6402:5188:b0:5d2:7396:b0ca with SMTP id 4fb4d7f45d1cf-5d972e08141mr3073909a12.12.1736357629819;
        Wed, 08 Jan 2025 09:33:49 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbd0sm26254327a12.55.2025.01.08.09.33.49
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 09:33:49 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so767585e9.3
        for <linux-parisc@vger.kernel.org>; Wed, 08 Jan 2025 09:33:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWs3aTngkXvs9jcWxQKfZb5XNA6FeYo3e0vt4DTi5LGH1xe/eRdnkdBg5q+Um41p2rGeNDbVOphZzm2TrE=@vger.kernel.org
X-Received: by 2002:a05:6512:2354:b0:540:21f1:e9e7 with SMTP id
 2adb3069b0e04-542845b9b94mr1068026e87.16.1736357249082; Wed, 08 Jan 2025
 09:27:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
In-Reply-To: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Jan 2025 09:27:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VOjzdBvyx9-g=Mvv6SJvur5ogtUbRfR3oCFpQoQ4VK3w@mail.gmail.com>
X-Gm-Features: AbW1kvZ7WHp39ciL3QA7T0aXBTFHS6WcSbmLSDiGkRPVgTELV5ossj5Zmm_Z_6A
Message-ID: <CAD=FV=VOjzdBvyx9-g=Mvv6SJvur5ogtUbRfR3oCFpQoQ4VK3w@mail.gmail.com>
Subject: Re: watchdog: BUG: soft lockup
To: wzs <wangzhengshu39@gmail.com>
Cc: tglx@linutronix.de, liusong@linux.alibaba.com, akpm@linux-foundation.org, 
	pmladek@suse.com, kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	jan.kiszka@siemens.com, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, yaoma@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Dec 22, 2024 at 10:32=E2=80=AFPM wzs <wangzhengshu39@gmail.com> wro=
te:
>
> Hello,
> when fuzzing the Linux kernel,
> I triggered many "watch: BUG: soft lockup" warnings.
> I am not sure whether this is an issue with the kernel or with the
> fuzzing program I ran.
> (The same fuzzing program, when tested on kernel versions from
> Linux-6.7.0 to 6.12.0, triggers the 'watchdog: BUG: soft lockup'
> warning on some versions, while others do not. Linux 6.12.0 is the
> latest stable release where this error occurs.)
>
> The bug information I provided below is from the Linux-6.12.0 kernel.
> If you need bug information from other versions, I would be happy to prov=
ide it.
>
> kernel config :https://pastebin.com/i4LPXNAN
> console output :https://pastebin.com/uKVpvJ78

IMO it's nearly always a bug if userspace can cause the kernel to soft
lockup. I'd expect this isn't a bug in the soft lockup detector but a
problem in whatever part of the kernel you're fuzzing. For some
details of the soft lockup detector, see
`Documentation/admin-guide/lockup-watchdogs.rst`.

Presumably you're fuzzing the kernel in a way that causes it to enter
a big loop while preemption is disabled, or something like that.
Presumably the kernel should be detecting something invalid that
userspace did and that would keep it from looping so long.

I tried looking at your pastebin and probably what's going on is
somewhere hidden in there, but unfortunately the beginning of the logs
are a bit jumbled since it looks like the RCU warning and the soft
lockup warning happened at about the same time and their stuff is
jumbled. There's also a lot of tasks to go through. Honestly, it's
probably less work just to look at whatever you were trying to fuzz to
help you pinpoint the problem.

I'll also note that you seem to be using KASAN and are running in a
virtual machine. It's not inconceivable that's contributing to your
problems. KASAN makes things _a lot_ slower and a VM may be getting
its time stolen by the host.

-Doug

