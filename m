Return-Path: <linux-parisc+bounces-2573-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E49950F7
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701EC281062
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28E01DF733;
	Tue,  8 Oct 2024 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZu1dopL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAF31D9A43
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396282; cv=none; b=oXUKsPR7c42+fLrj8HqL9QinGvD8v1b8B0z3Fda6Gvqd8HqWYiAE1px3LnStlYoJlTcBh9X0373OhOpiyeuhtyikXK+9XIH8iKZLJkCiiTleszC9vdZ4edqfDz49r2Qy2YR+csekmtmn7zzqwh1Po5gmEIwx4hujSuNy8TKjBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396282; c=relaxed/simple;
	bh=w206OorLkWV606MR7F16L9PYElojKLjCOXbevx16EIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpABt9vAbyxtBIuRFhK1TxGKFuK0cGlxzlI+W4p0KjcWGn6cK1eA+kBM74vwG/NloecJjEe9V6OzLYpiv8J6YV/si7lgSyKrk4e7RS8zwMyi7JyMTerRHChpv/M+zN5I5XGoCAVg7c1+FZKeLVvJXZNbv1jTKlFNXmmdiVN47fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZu1dopL; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso58581561fa.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396279; x=1729001079; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o1qSDScTeeLaAzPcPpZKLPt/co+VeoQz2jK30EZXs6M=;
        b=gZu1dopLDAD5dGgZ+jWybRHm7YZOeJIyPbYWNl4Ogq8yb2MLPONoApgGSAKq27nCUf
         DjfLF089lirfS6/+vbSGQhJG8XzES/CgPB9WVc+DkWinCJCRcs1nBFoffu9e1VPqiYFs
         6L4q0hrf6QHZxXJzMXEL7imeriVgkdHnvrm0JZtNI2UkUfYO+jo/LiTAUdq8uaPB56qf
         ZLXJbZaQdgClWf1kUyLXjDdQ+ZoS+zp1nI79J9yVwDcxbuPXmC2vuenfzO8MsTplGUIo
         x5szQQsOdADhOMA0hCgc5pD56qVlAtGT2pGaNt2ap7gBj8U6KtkrIUEv/X4+bHrA0wje
         kZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396279; x=1729001079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1qSDScTeeLaAzPcPpZKLPt/co+VeoQz2jK30EZXs6M=;
        b=ry2VWfnledLa5XaUgz8mYWxahgV89+nFRknrrNGL/jnO0C7RAQKfzuV8WiXZ/6kxPG
         eTqLF48sfDsbkeqnXihhvN7HwjacFtWj5Xvh/2jMF9zjZjoWO/tU0Oi8ro3VU8ennuiN
         BGYvGE0XPf23hswt5zNb4rQX+Uui88VK7+iaKrZZJCkjHEi83/73Rspw0lfmN5ZfgClw
         fhswZWW2cdAYh2A5LiehwEDSW26rYZfiIaHR4Arw1PB8laJ7L1ipnr9xo5cETjkoGmXl
         0PAnCfiMZNHyRtmQg3c0l5wHKQnGSEjJQlHNMnFJY+DIReA9HYJMm7IiqjZyhb1CgVP0
         FJ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+PW85mMtXILpV70aOa/ewurJ7GpZlffNmbEHIeX88CaCXo+IxhOdHYW4EWUAePrkcibgsMm45KjWwcYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxfogz7NuRKGI9VzW0wYpYdk5AuuLRVpn3tAkc1gxgCHsNoEtI
	fxC4VfTl7TqM6je0LlSCC0dcZk6axO41fwltdAak51fqoixh7cJL7X4mrM45MYy+YrKXZQJATqM
	jgEM0GEJdJxiU5jLk97R5xMfc1X94yGHIPXSjlQ==
X-Google-Smtp-Source: AGHT+IEoUVUPWTcIHGH0LtYVq6h9WCiS/hR9j+IQy7BDdEdvR0uKHoGPapc5HDxL6pSCVaVZMo7DnZ+d7Y0OjB6uDXE=
X-Received: by 2002:a05:651c:b10:b0:2fa:d1f9:9fb8 with SMTP id
 38308e7fff4ca-2faf3c0c4cbmr80108671fa.8.1728396277172; Tue, 08 Oct 2024
 07:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-2-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:04:25 +0100
Message-ID: <CAFEAcA-++cf9jxuihQxkdPhXRVHs+HnngPdyXh=ibh1xv3Bvyg@mail.gmail.com>
Subject: Re: [PATCH v2 01/21] accel/tcg: Assert noreturn from write-only page
 for atomics
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There should be no "just in case"; the page is already
> in the tlb, and known to be not readable.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 117b516739..fd6459b695 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1852,10 +1852,9 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>          /*
>           * Since we don't support reads and writes to different
>           * addresses, and we do have the proper page loaded for
> -         * write, this shouldn't ever return.  But just in case,
> -         * handle via stop-the-world.
> +         * write, this shouldn't ever return.
>           */
> -        goto stop_the_world;
> +        g_assert_not_reached();
>      }
>      /* Collect tlb flags for read. */
>      tlb_addr |= tlbe->addr_read;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

