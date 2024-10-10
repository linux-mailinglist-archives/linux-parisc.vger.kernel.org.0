Return-Path: <linux-parisc+bounces-2655-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B5998412
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Oct 2024 12:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D25D1F214EA
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Oct 2024 10:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC8F1BD50C;
	Thu, 10 Oct 2024 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="REeFy/up"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310311BBBE5
	for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2024 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557087; cv=none; b=FlGrE/zf6xtXoLQDic3znYeG3hvknlu/Rw2/E4OEXGCUK2L0ysNeh01hRBpesDT6wJQJDxc19370UiGapYRN710RuHjjGUeRW+iBk9g7JBS+UuRKTknH9IaxzmRqqBaYVAb2DxrS8cS2s8z7/HvStUn+aFhGp1B/ph1Kf0w0rZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557087; c=relaxed/simple;
	bh=Bv0li5y2WElmVJKJH5LE6AUQB2S0/LB6WczVN24vfkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS1wFR/SkDgC4ddqKfMyrFLlnfQp/xFr5e8ZbqkeOgsWjjx+ovg9ML2OcWA+edGGSVNupKgIfFQzOW222IhaORMitElP+F1L+oLLYUiX6bbhca3++Th7w9uWAcIaSZVdiKALSQe1f6ip6Z2YqJj6+OhkwqflbgotNP7t9XsuHlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=REeFy/up; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b3e1so978158a12.2
        for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2024 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728557083; x=1729161883; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BX/60HY1SQilc1djhjB/a1kYJ5/dGdDi3/gVE9ZXjRA=;
        b=REeFy/upJ9zkycNa+/CN86KaeO7viOQJYbsfQn/zZ1TFSP9D4G6box9s+XsXu1PWFA
         4DrPBFBJXbPQ1nbBHaoXis/pIzWv4COxoqSDZSLzosDE/Ya47OUeqqcbly9yusToiNlI
         cQUe30eLKSdkO8qxDS3qPU2LcLq6kh4+2vIysEkYJ6MHbgDFu11yLTAGjmF7RdibdeDh
         IejjgBqdSo2efxQoiH/lk8ZavulgalwxmpNqoXa+BjxSxKR89O8wPUHbMZ4/cMoG+hmK
         aHmUj5RI29tHhSezAwsUXI+orQBdIpmh+UAk52jeuXYkxKXlXQT/WyvliOG8rEd/4Uht
         W/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557083; x=1729161883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BX/60HY1SQilc1djhjB/a1kYJ5/dGdDi3/gVE9ZXjRA=;
        b=wEWwETakfM/BMj2Y7pKcgX8ypiPv6KmWEP0Fo1TIA87O4dIvPDAXEP13C7DwZGO0kF
         GIhtw5iqcKKAcj6+IwtK6OoRJp2cJAbL8vKHo7FKlkjXrhzJZNbXXHom6+D4/9+fNFLV
         GMWLPDb9CGFDQE6w3Qo8d2VA7eOgjpI0SpleHLO+WRKyfKdPK3JrItEZvBNnLo/NGM8O
         se/FyljMZo7/B1OcUHMNZw8JfWcKqTZtvYjwXQwqSt+mAbx783GbGHwiR5pim1X0cgOg
         9ZKk7blMw2xbHKCU60TUH2DcHfsVJBEP10pgBqCTgEt6xSfxm5/csbrys7Fk8F8Pd1XH
         Vxew==
X-Forwarded-Encrypted: i=1; AJvYcCXwMA3n4F5oQVV/wS9GwJmM4HUTp+3uvDCHpLZS+sjU/wQxOehlWUZmGmnabR36AKfc7hNwqVUZ5RSqkEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfBk9yr7TNxOtyHrAyUlbJg7ebeSQ5SJUV2ZiqiElx0kGrrAK
	fzW/jxovlJ93qsh0FKKJpTKkSrr0rXLi7rX5EGEsTpd6diLgbEFLM7RnYmmGQzCV0jI1RhCKzMX
	a4toc6wounTTWRKGC6LHFBs/yerOtmP1QKW0okA==
X-Google-Smtp-Source: AGHT+IHZMWiUZgylwth4eNH4y3+UYvrysEu+bCAnCgwYWQMyWAJs0RSCwqbbOpDohzoAn4H+jeuGr31Qt7J4TGKbEx4=
X-Received: by 2002:a05:6402:3512:b0:5c5:c5c0:74ec with SMTP id
 4fb4d7f45d1cf-5c91d675a01mr4875352a12.24.1728557083380; Thu, 10 Oct 2024
 03:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009000453.315652-1-richard.henderson@linaro.org> <20241009000453.315652-7-richard.henderson@linaro.org>
In-Reply-To: <20241009000453.315652-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Oct 2024 11:44:31 +0100
Message-ID: <CAFEAcA-mSsFgjoBWi13dXqZUbys2N81YVXLD_ZfuuGo+Xfy-gQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] accel/tcg: Use the alignment test in tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Oct 2024 at 01:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When we have a tlb miss, defer the alignment check to
> the new tlb_fill_align hook.  Move the existing alignment
> check so that we only perform it with a tlb hit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -1754,8 +1767,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>           * Lookup both pages, recognizing exceptions from either.  If the
>           * second lookup potentially resized, refresh first CPUTLBEntryFull.
>           */
> -        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
> -        if (mmu_lookup1(cpu, &l->page[1], l->mmu_idx, type, ra)) {
> +        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
> +        if (mmu_lookup1(cpu, &l->page[1], 0, l->mmu_idx, type, ra)) {

Is 0 the right thing here ? Given that alignment-requirements can
differ per-page, what happens for the case of an unaligned access
that crosses a page boundary where the first page is "memory that
doesn't care about alignment" and the second page is "memory that
does enforce alignment" ?

For Arm this is moot, because an access that crosses a page
boundary into something with different memory attributes is
CONSTRAINED UNPREDICTABLE (per Arm ARM rev K.a B2.15.3), but
maybe other architectures are less flexible.

Also, the comment does say "recognizing exceptions from either",
and we aren't going to do that for alignment issues in page 2,
so if we're OK with ignoring this we should update the comment.

thanks
-- PMM

