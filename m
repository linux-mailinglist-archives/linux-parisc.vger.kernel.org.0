Return-Path: <linux-parisc+bounces-2438-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D598DFBA
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 17:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C082E1F299AB
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 15:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5E51D1317;
	Wed,  2 Oct 2024 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fxpofaPU"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CAE1D0DE9
	for <linux-parisc@vger.kernel.org>; Wed,  2 Oct 2024 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727884049; cv=none; b=phU1IPwlTQEK0Y98t4YUbnmLO3PYU1AZHyLPp2Z9krYr4tvFENHAl7PnfD60xHWJyM32clRlhQZ98XP+jpN2NW+a0f+YvX0udVGpCRfVWZvTvMvyH2L1vRtRGCgsENPIKTE8Y+yLUi/yFRccfCSCPki5goI+EMpNYr/0Wv/+Esc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727884049; c=relaxed/simple;
	bh=n3Ey9niFK54o/9V1gApHVNEweA4/Tw2OyzANAG0bm7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CT6HblfXNolNaratm1y6EbHz1m0rLokv4bqhbl+g7M/+/V6FGXwUi9J+NlShLZ7Yl/MZG6kMR4zrIaKe5U11m2u5O8PxLcK2mvPPQHjacFKoW9KMesx95BYVI2QdeKgUpinygi62qUttXb5ULiigYobWGQc8suYRaUrqy9p2apM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fxpofaPU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c721803a89so8814076a12.1
        for <linux-parisc@vger.kernel.org>; Wed, 02 Oct 2024 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727884046; x=1728488846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FndwnK+YRtybulnrKyKrT+v1DDreWsc5/HLakf2WBzc=;
        b=fxpofaPUoIoLIiZrcJmIjvv2EJGNuhVbfP4JITUqyI3xlj1atFejzkHHnJQ9/aRjST
         E34bTXEaGoKUazS+PWnl0N8NSHtXebCwIZeyV69Kw7hQX9bEpJOnlFK+XQAotOx61f86
         UqEXfaMNhzWbkqdc1Ob8VRMJxuUlwJo4MF6id6l+nZkynnSIpkPB6dvN8zZcAo7BB7+V
         MsU8e+sh4epfup5WWyMZnW9iPpXUkV2PXFtuhMssK0NZ8UwPkOmFg6NShPa40EL2lw9l
         aAKeAbfb3LV7mBj3Pp0+EhM6KjUo9REjvGkQZsrlf9t7d/BkqCM6MZcroV7jyR3/7PFa
         xkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727884046; x=1728488846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FndwnK+YRtybulnrKyKrT+v1DDreWsc5/HLakf2WBzc=;
        b=mWaK1RuPQXch2l7KLavLI/3Lb9I0RaALcmgahX48xdSLlfUHS23FQe5JRT8j/9oVd4
         1qcaXrGbDtAgp/CyylcXrW6Np9pvexGiVUdDtF6ZYxvVlzEZ9ajiCLuyCO0niY5LG3MM
         asFc+pUzQIEemwMMIzjCJh3lpaTW3iPJrVbv3ylO2P5aVJMndB2alQowbpGCOKJT+dYf
         YStxez7fhzl/4+yWL9QILpwjF1Aqbl/j9cE3MzVqjVixqmPKuUVS/TBWfLWy9viWNW0y
         BEft0ZN9m4os+JQnKkWOMMaPm4JR+9wsmtNyXPxp+WWmuuD6RYCY5iTmDHDaPGjhak6n
         BaCg==
X-Forwarded-Encrypted: i=1; AJvYcCVlflxg5Ai4XY9H1iOnKLjsEuI0xOgVquDRnlNQrukMbiiB+XdIQxmTjn8wZW6hocI4B/cYNm9E/M2d9Zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8cfw79IPXMb2hULaaT4YaNZbWq6TOk0D7HIDfm0ObGm6lZPd
	WUoGlFQe/fXEJfv5X9AwHOzGY8vGqAsYsNmq1RtJld1wIEmO8o0fWjN/ap7Ay3NhpSpmRGwkR1x
	h0m9i9E91XAXXoQkvuvPV/kN8asLu9tvZicRI3w==
X-Google-Smtp-Source: AGHT+IHGLnW5VXHVqq8wQ+UStR34b5mymKOROemJl35HS+qAuyocWJCmOr1tTU+mZcqF43Zf1r9PBSNvlrcSr6/fP2g=
X-Received: by 2002:a05:6402:35cb:b0:5c4:2bd6:68df with SMTP id
 4fb4d7f45d1cf-5c8b18ad37dmr2947175a12.2.1727884045649; Wed, 02 Oct 2024
 08:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zvyx1kM4JljbzxQW@p100> <87cykimsb9.fsf@draig.linaro.org>
In-Reply-To: <87cykimsb9.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Oct 2024 16:47:14 +0100
Message-ID: <CAFEAcA81YtAGO0iFZRWXGjJb91DhWEDTGr+cjWbNWEW4yJDksQ@mail.gmail.com>
Subject: Re: {PATCH] accel/tcg: Fix CPU specific unaligned behaviour
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Helge Deller <deller@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	qemu-devel@nongnu.org, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Oct 2024 at 16:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Helge Deller <deller@kernel.org> writes:
>
> > When the emulated CPU reads or writes to a memory location
> > a) for which no read/write permissions exists, *and*
> > b) the access happens unaligned (non-natural alignment),
> > then the CPU should either
> > - trigger a permission fault, or
> > - trigger an unalign access fault.
> >
> > In the current code the alignment check happens before the memory
> > permission checks, so only unalignment faults will be triggered.
> >
> > This behaviour breaks the emulation of the PARISC architecture, where t=
he CPU
> > does a memory verification first. The behaviour can be tested with the =
testcase
> > from the bugzilla report.
> >
> > Add the necessary code to allow PARISC and possibly other architectures=
 to
> > trigger a memory fault instead.
> >
> > Signed-off-by: Helge Deller <deller@gmx.de>
> > Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219339
> >
> >
> > diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> > index 117b516739..dd1da358fb 100644
> > --- a/accel/tcg/cputlb.c
> > +++ b/accel/tcg/cputlb.c
> > @@ -1684,6 +1684,26 @@ static void mmu_watch_or_dirty(CPUState *cpu, MM=
ULookupPageData *data,
> >      data->flags =3D flags;
> >  }
> >
> > +/* when accessing unreadable memory unaligned, will the CPU issue
> > + * a alignment trap or a memory access trap ? */
> > +#ifdef TARGET_HPPA
> > +# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  1
> > +#else
> > +# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  0
> > +#endif
>
> I'm pretty certain we don't want to be introducing per-guest hacks into
> the core cputlb.c code when we are aiming to make it a compile once
> object.

There's also something curious going on here -- this patch
says "we check alignment before permissions, and that's wrong
on PARISC". But there's a comment in target/arm/ptw.c that
says "we check permissions before alignment, and that's
wrong on Arm":

     * Enable alignment checks on Device memory.
     *
     * Per R_XCHFJ, this check is mis-ordered. The correct ordering
     * for alignment, permission, and stage 2 faults should be:
     *    - Alignment fault caused by the memory type
     *    - Permission fault
     *    - A stage 2 fault on the memory access
     * but due to the way the TCG softmmu TLB operates, we will have
     * implicitly done the permission check and the stage2 lookup in
     * finding the TLB entry, so the alignment check cannot be done sooner.

So do we check alignment first, or permissions first, or does
the order vary depending on what we're doing?

-- PMM

