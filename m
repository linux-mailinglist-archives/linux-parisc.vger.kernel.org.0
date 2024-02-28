Return-Path: <linux-parisc+bounces-745-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5B886BADF
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Feb 2024 23:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BCB21C20C3F
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Feb 2024 22:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15463FB98;
	Wed, 28 Feb 2024 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Az+rB4Qq"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F511361CE
	for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709160305; cv=none; b=Z7r4QE0cAHD/sGpyd+I0Z0uPrsm6CHcbr1UYxrNj2JqA3SAgfagQi3tx6mutLwQCQ2O4YACva/D25QtLsMCLCWe8wEVntHrHP7VmxujggvAvJHcZAlBk4jd37F4NRJHmJfFllXm0LL5kdOc1eVv33xg4oNgUr9xRXw/MfdrQZTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709160305; c=relaxed/simple;
	bh=Cbo16Kdpdj/Sou5J9lkN1s8YVlAEB7JmVmpKJ1D3TMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oo3avojsFIAxk6UdNn1pcJAW8Dogms7FxuapjrBelwctSBAf/uv4sGYXTlzPkap0gsubfJ06INMdtBdBtAEDvEK1kOPRbETU0FnNmWMG0Mo4TLra4SHMMeb2D6WqL8WvLtUevpjLHPgCaQ21o9hom0l/olTLruhZqpe+PbHYS9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Az+rB4Qq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-565a3910f86so439895a12.3
        for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 14:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709160302; x=1709765102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaIW3mETQDzZhGMK3PRFUOCtdSx2PTiCbd1xUJLaJyo=;
        b=Az+rB4QqOJcSbdh04nioxXjyjpYoQtz1UnRg0ZGmOM2XWugR0YwX+LFXTEzycCDwtD
         eLmx6y6M0gVRlgxb1hXSLJ/y2XdVkxw2snvH+qfUwl1XzXBnde8gqY7dFFogmTK95Qam
         1lqMhYWpIeBgPp8h0nM0eFlY4nI6s4ExmylLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709160302; x=1709765102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaIW3mETQDzZhGMK3PRFUOCtdSx2PTiCbd1xUJLaJyo=;
        b=RFq/13FUlwREcSjL1OYRiPxAVEjrUl1aishoiuvLvaQBci1+JW+seBrfBrfeJsfDE1
         Jf6Cf1Pdt+K6rxOMNK0Rs5Tj2R4Ls/egOJXNtUMaXKWRTXW3dw2kuIWP4sps0/y04E5U
         VHCqloBx3s9umYKtLnFwllMOBVGjZImtOyGfQbRE2+IXgBcazIgF5PlN+VutPpDGBUfG
         fk6BFpWsQxDfth2kkZ8OzJ/99osDPE+DJTFU0TdwdaL3kmZSLwlt0IUWHCPrHXMwIZc5
         +EGn/YCvSJY4ekWR9Oc1z8EwJuQtN7VU+TKvX3S79vJm7riiPeSu+vCgFGVOCpdTHqRR
         nF9w==
X-Forwarded-Encrypted: i=1; AJvYcCVaT3o1ByURCZvAav7g10V59IBZCbJPVx534IYNiiL/5sIy3teWKkIpf5jn62hMnHczFsYiLW6B0rSzGmMOFoE9Or7sGWuRv4O+CNSZ
X-Gm-Message-State: AOJu0YysG2JGW/I+GvI16FHdqS1WCKbUfNzo06BsmdY6moWrzwPLKZAK
	Q7+M17893Oi6wSwLUofMJcYS0Mc5V7ukTc9qoHTVhl9/IkalAypp5ljXOgtbRhfSMolcAFAmXz0
	ZtqwL
X-Google-Smtp-Source: AGHT+IFXp/lS9ujTL2VZzXe6Skn9BvHEklpShELv2jwNhxZD6sN/IglVMufnCziJXVAYeTTroRupTA==
X-Received: by 2002:a50:cc46:0:b0:565:1815:dfc5 with SMTP id n6-20020a50cc46000000b005651815dfc5mr203322edi.0.1709160301648;
        Wed, 28 Feb 2024 14:45:01 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id en18-20020a056402529200b0056691924615sm208238edb.2.2024.02.28.14.45.00
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 14:45:00 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4129a748420so29195e9.0
        for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 14:45:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzkuruZXG4cc0hm8pNTePD5llgDpIT6hiDMqfHc1YrjmKCzA4GuAzsOnYnX7SwPfMhPftZmSuweGbmuUEFeLfs51BhuEQ1zK3TXMXz
X-Received: by 2002:a05:600c:4e16:b0:412:b66f:3d0a with SMTP id
 b22-20020a05600c4e1600b00412b66f3d0amr20561wmq.6.1709160300349; Wed, 28 Feb
 2024 14:45:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228072216.95130-1-yaoma@linux.alibaba.com> <20240228072216.95130-3-yaoma@linux.alibaba.com>
In-Reply-To: <20240228072216.95130-3-yaoma@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 14:44:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
Message-ID: <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
Subject: Re: [PATCHv11 2/4] genirq: Provide a snapshot mechanism for interrupt statistics
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
> The soft lockup detector lacks a mechanism to identify interrupt storms
> as root cause of a lockup. To enable this the detector needs a
> mechanism to snapshot the interrupt count statistics on a CPU when the
> detector observes a potential lockup scenario and compare that against
> the interrupt count when it warns about the lockup later on. The number
> of interrupts in that period give a hint whether the lockup might be
> caused by an interrupt storm.
>
> Instead of having extra storage in the lockup detector and accessing
> the internals of the interrupt descriptor directly, convert the per CPU
> irq_desc::kstat_irq member to a data structure which contains the
> counter plus a snapshot member and provide interfaces to take a
> snapshot of all interrupts on the current CPU and to retrieve the delta
> of a specific interrupt later on.
>
> Originally-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> Reviewed-by: Liu Song <liusong@linux.alibaba.com>
> ---
>  arch/mips/dec/setup.c                |  2 +-
>  arch/parisc/kernel/smp.c             |  2 +-
>  arch/powerpc/kvm/book3s_hv_rm_xics.c |  2 +-
>  include/linux/irqdesc.h              | 14 ++++++++++--
>  include/linux/kernel_stat.h          |  3 +++
>  kernel/irq/internals.h               |  2 +-
>  kernel/irq/irqdesc.c                 | 34 ++++++++++++++++++++++------
>  kernel/irq/proc.c                    |  5 ++--
>  scripts/gdb/linux/interrupts.py      |  6 ++---
>  9 files changed, 51 insertions(+), 19 deletions(-)

I won't insist on it, but I continue to worry about memory
implications with large numbers of CPUs. With a 4-byte int, 8192 max
CPUs, and 100 IRQs the extra "ref" value takes up over 3MB of memory
(8192 * 4 bytes * 100).

Technically, you could add a new symbol like "config
NEED_IRQ_SNAPSHOTS". This wouldn't be a symbol selectable by the end
user but would automatically be selected by "config
SOFTLOCKUP_DETECTOR_INTR_STORM". If the config wasn't defined then the
struct wouldn't contain "ref" and the snapshot routines would just be
static inline stubs.

Maybe Thomas has an opinion about whether this is something to worry
about. Worst case it wouldn't be hard to do in a follow-up patch.

Everything else looks good to me. Given that I'm not insisting on
adding the extra CONFIG, I'm OK w/:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

