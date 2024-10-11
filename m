Return-Path: <linux-parisc+bounces-2675-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D05399A7E8
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2024 17:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B222A283A80
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2024 15:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400B95381E;
	Fri, 11 Oct 2024 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zmBV5uED"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA46C194C69
	for <linux-parisc@vger.kernel.org>; Fri, 11 Oct 2024 15:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660992; cv=none; b=bf52vwbKFktdrPDeez6JphKgIHO7HqtIT1KZAssSkipd3nRaD8OOuRkpkWrsbCN49LvpSD9qgNVE1zqhrJ0LsZkQiCtrGNH+tzEFgsNuIj8bJPEobUYeMjJbdZeXMyzVzq+SGn10y0K43ya1Ii2vqI9lgm3fn6Eh1TGq1OTbD70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660992; c=relaxed/simple;
	bh=knpWUuMpnKtJFXqHlS4rZ8Sy20b2ERBRAcm2eAsnCZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C19A/hEViygzCB0/2xV89DrBVylR8+b7HjA2OgRU3/O/Fe0UAEmwxXUNnC9UrDclhLLKwqbs0CEcpXcYU+eymGRwBUWGz+ecXOCcPaNqMfJs8t0gfA8MTt2FsGp7wJMc9HHgMqsQ6L7CGyjpRS52kldBJA4q4Vam3qop/r9Zdfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zmBV5uED; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so913450a12.2
        for <linux-parisc@vger.kernel.org>; Fri, 11 Oct 2024 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728660988; x=1729265788; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ooVvsEyGOT7aTjiUJiE2ewcH9FMS1o9c1z/caxuq/gc=;
        b=zmBV5uEDKbfQBn2JQfLTUqPfXDJbuLFcXdTqeKr7rCbdJqroJPYloKl1uF98i61nBE
         AsA0GbSPWyidUYzKj6PzI7DTkg/HK/y8CS0TdhFCUg+Hsv1eSHiXBNrO7kE8puws0Vbq
         wNR/TBPw2TPaLCaU2gXIZuXd43WxOPGczPb78l7GJFJeEfuSpg57ksj39+/FqT2jsVKK
         gATJ5zkxAyhhUtjcGepYBJnkWrY7/w1WCWKk1uk6p6YJepjSjDZs6aUlGHBktfaB877A
         pdEHzIuF/kxxewezOSxD+p+c1iFce3bOVB+NTIO1JEBQuBgYGg0dv2ngPhWUuDaVSJls
         EDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660988; x=1729265788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooVvsEyGOT7aTjiUJiE2ewcH9FMS1o9c1z/caxuq/gc=;
        b=sPhaqVg8+jmggx/Q1fZtP7sgOIWBK+tKdRa28mdqXulbznZ2DxtDtXVDXKt5h29KGX
         0emaiaNNyPdMXv/LXugFj42WeWZvBFwqVMbx6dph3sqgNaMGzYqzbFoit9h+WhfQSbO7
         /58BoqJgZu/dVGD8ynFr4msih2gzCq2u00DTPIUV1lFiOkTxMqXZofHujjKAM6s64h6E
         txJKvB8IWt8mOZx5AoFsEBczdmfwlwZtD37DQSxrPRM0QNndcZkC0XMY7qm2zAO+XcAK
         8O5k998np7bsG50aWwTsbJ0ukpZ9KAc3pbi7wAHaSOLa7O6Ale3kIhYs1ZL4RwbeuZJJ
         n5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWbdQdkiPzis2AUWCzxQCXydL4plA35YHBDYujsXfTHYZGy0bRHSDHFz7+lhpdJ26RFFCM1og+ZkaAj2cE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRgTPPSg24nt1jt3GTX6+XrcB+Oq/zOmKu9AXMvjiZwMPgaJlA
	hkvnybmvbm7404oYafc9cTWsFLSOyLAUa0mxDK32/c4f+kSI52CA8oRE6b01yhscavfrd5inRcY
	KTHVV3Dqj4mdkivFxC3Jx7ce04Z1J5Uh6rkikHg==
X-Google-Smtp-Source: AGHT+IEjAHVyDzsxyfA+hUYjmXreiKyNYIRlBTXDRhSDjaO8yGQi8i2TD7NUA9+tfGUqyCOuYQb/F3LOjlf9b49Eimc=
X-Received: by 2002:a05:6402:2786:b0:5be:ee30:9948 with SMTP id
 4fb4d7f45d1cf-5c948ca2342mr2251965a12.8.1728660988058; Fri, 11 Oct 2024
 08:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-7-richard.henderson@linaro.org> <CAFEAcA-mSsFgjoBWi13dXqZUbys2N81YVXLD_ZfuuGo+Xfy-gQ@mail.gmail.com>
 <b5bf5d17-2451-4d6e-9a4e-6fb4e94ad308@linaro.org>
In-Reply-To: <b5bf5d17-2451-4d6e-9a4e-6fb4e94ad308@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Oct 2024 16:36:16 +0100
Message-ID: <CAFEAcA9brYu2trekf3=ztRkHOc2Lw24_L+eSpTJzaf=orVFv8g@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] accel/tcg: Use the alignment test in tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Oct 2024 at 16:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/10/24 03:44, Peter Maydell wrote:
> > On Wed, 9 Oct 2024 at 01:05, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> When we have a tlb miss, defer the alignment check to
> >> the new tlb_fill_align hook.  Move the existing alignment
> >> check so that we only perform it with a tlb hit.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> >
> >> @@ -1754,8 +1767,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
> >>            * Lookup both pages, recognizing exceptions from either.  If the
> >>            * second lookup potentially resized, refresh first CPUTLBEntryFull.
> >>            */
> >> -        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
> >> -        if (mmu_lookup1(cpu, &l->page[1], l->mmu_idx, type, ra)) {
> >> +        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
> >> +        if (mmu_lookup1(cpu, &l->page[1], 0, l->mmu_idx, type, ra)) {
> >
> > Is 0 the right thing here ? Given that alignment-requirements can
> > differ per-page, what happens for the case of an unaligned access
> > that crosses a page boundary where the first page is "memory that
> > doesn't care about alignment" and the second page is "memory that
> > does enforce alignment" ?
>
> I can't think of anything else that makes sense.  The access to the second page is
> "aligned" in the sense that it begins at offset 0.

Ah, yes, you don't get to see how unaligned the access
is in the second mmu lookup.

> Anyway, alignment as a page property is unique to Arm and...
>
>
> > For Arm this is moot, because an access that crosses a page
> > boundary into something with different memory attributes is
> > CONSTRAINED UNPREDICTABLE (per Arm ARM rev K.a B2.15.3), but
> > maybe other architectures are less flexible.
>
> ... as you say.
>
> > Also, the comment does say "recognizing exceptions from either",
> > and we aren't going to do that for alignment issues in page 2,
> > so if we're OK with ignoring this we should update the comment.
>
> The second page can still raise page faults.  How would you re-word this?

Mmm, so there's also the case of an unaligned access across the
page boundary where page 1 is present and page 2 is not -- do
we prioritize the alignment fault or the page fault? This
patch will always prioritize the alignment fault. For Arm
that's fine, as we architecturally should do the checks in
that order.

-- PMM

