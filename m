Return-Path: <linux-parisc+bounces-746-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D950E86BAE3
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Feb 2024 23:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17A351C237A9
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Feb 2024 22:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5FD72926;
	Wed, 28 Feb 2024 22:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NSevm7p0"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3731361CE
	for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 22:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709160313; cv=none; b=kI748olkA5hz2n74tqJxikVBuGDXnZO4SldDo9COQ9QLdk/jRL/AEbMKuaQGCQQPl1KLcnTWwsTo+zwRoe7wHIyHcbVTwp4GtasXWLPKMwLG9VdrTif08pZ/th9tIJyCjBnvCQPTaNPjJF95E8HIFq2iaXs/LXsqNer4w/U4LBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709160313; c=relaxed/simple;
	bh=g7xQFQu3lLzNX4Vd9so5KMCqq2700AsVTNNzgICe2Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdiaSeVEFOn5QZ4+lSkkedZx/9QwUMaTuC6JGxJiq0+wjE6MNW8jtx+fDdgMD6qelv8G+VJA+lBCA9vbLOu+EeTUF4Wvitwz/RY1SLUBAj8Qu941kyY1Zzb1dMN25YXSlIQqbU3yyk/rm38cCCisJxrJFEHimTtVG+c3OzE7zMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NSevm7p0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so475462a12.0
        for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 14:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709160309; x=1709765109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+Wb6NhI/vtCiU6t546gnwmXs9J3vtrwxtAXa2CAncw=;
        b=NSevm7p0/+Zk7em18Ck+0Rb2qnr0fRvK8F/4/Zzp3gBR9J5KtphxV/bGXICmIVgK6Z
         l8KoFd0Q5qiZDlL4GKgQw1P5FNkbY9S7jt17UNyAWZfSS/3b8PxvSh1zqM5Nk8eHUmC5
         y/rYs80mHciF2EPNOABuiiqeOA9LUDyUI3Vz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709160309; x=1709765109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+Wb6NhI/vtCiU6t546gnwmXs9J3vtrwxtAXa2CAncw=;
        b=IhFV5L7VA/+HDvKMWcgTsAa7mITyKIjxXR9ReZwwVLLhYM1/SlSzLaY779b5HvAfvs
         qzf4n9opUlyiokmoErphpKcyDSVFadFSLaMmKTGNwj5TuO6d2AyDL/XOgOk+FT0wwGbH
         NrFEvG5NcyE+iCG8WR+H+RzbAV2smUmU+BoQgAPXwDvrvYsHuVV/Jev052h7PhiGQiVu
         4VtLPI+ZE/k3bjhc/LbRNsfFHNWh7a2H2ohiFRF9B87SA0QcY/kPfAq4uRCobBPxAjEt
         xnwQDdvwnFScwlrAbS+W5mYW64TNnonK/cgIhCpdGL8FjQRWGcr3dFM91+/1glClMMsw
         fJgw==
X-Forwarded-Encrypted: i=1; AJvYcCVZMruSQ4UUO2NqyOszzjflx5DqUMsNcXNAowA8oGILbiB9EYcyNv6UkFl8vbbw9Mow576BrWL1TmA+hN6a7i+9P20Ti6aLFS+eaBT+
X-Gm-Message-State: AOJu0YyoKRv+IgUr8g3dN0B8wXmKD2czFvYSIx5QCT9MKzOpRxxXgLTr
	he1L8IE5O7BOPwvoZG6V6kI2EYOwBI1MdEdswy9Vve1RNaCCF5FRej4faf7xa5o2UHjNkdM0rho
	cj3on
X-Google-Smtp-Source: AGHT+IFR8DYLRlOonrZqotYrQPlbeQpLmKLEc8dPQea+5RiPpMTmGn0V5Ydo73EC+izAr5S+XFL91Q==
X-Received: by 2002:a50:cbc8:0:b0:564:3b2e:2a2e with SMTP id l8-20020a50cbc8000000b005643b2e2a2emr205638edi.9.1709160309239;
        Wed, 28 Feb 2024 14:45:09 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id p15-20020aa7cc8f000000b005667629f6e1sm818638edt.39.2024.02.28.14.45.06
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 14:45:06 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5654ef0c61fso4874a12.0
        for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 14:45:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcJw5OgLB3R2X9xOqta3gALMQBvjHmBcpgjVvpktz8+hIAo3YcJW/mjEVRd0vBTkXnkj2be+ZerOn5PKcRhQFCn+ZpOpKoosTtKiaz
X-Received: by 2002:a50:8aca:0:b0:561:a93:49af with SMTP id
 k10-20020a508aca000000b005610a9349afmr11944edk.7.1709160305919; Wed, 28 Feb
 2024 14:45:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228072216.95130-1-yaoma@linux.alibaba.com> <20240228072216.95130-4-yaoma@linux.alibaba.com>
In-Reply-To: <20240228072216.95130-4-yaoma@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 14:44:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W7gOpLw2VwRO7EwwNoqSJFM8iC0-R1GC4RHtz4=fwa5A@mail.gmail.com>
Message-ID: <CAD=FV=W7gOpLw2VwRO7EwwNoqSJFM8iC0-R1GC4RHtz4=fwa5A@mail.gmail.com>
Subject: Re: [PATCHv11 3/4] genirq: Avoid summation loops for /proc/interrupts
To: Bitao Hu <yaoma@linux.alibaba.com>
Cc: tglx@linutronix.de, liusong@linux.alibaba.com, akpm@linux-foundation.org, 
	pmladek@suse.com, kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	jan.kiszka@siemens.com, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 27, 2024 at 11:22=E2=80=AFPM Bitao Hu <yaoma@linux.alibaba.com>=
 wrote:
>
> show_interrupts() unconditionally accumulates the per CPU interrupt
> statistics to determine whether an interrupt was ever raised.
>
> This can be avoided for all interrupts which are not strictly per CPU
> and not of type NMI because those interrupts provide already an
> accumulated counter. The required logic is already implemented in
> kstat_irqs().
>
> Split the inner access logic out of kstat_irqs() and use it for
> kstat_irqs() and show_interrupts() to avoid the accumulation loop
> when possible.
>
> Originally-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> Reviewed-by: Liu Song <liusong@linux.alibaba.com>
> ---
>  kernel/irq/internals.h |  2 ++
>  kernel/irq/irqdesc.c   | 16 +++++++++++-----
>  kernel/irq/proc.c      |  6 ++----
>  3 files changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

