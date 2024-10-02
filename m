Return-Path: <linux-parisc+bounces-2437-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9543D98DF48
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 17:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 580B9281940
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 15:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720AC23CE;
	Wed,  2 Oct 2024 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lh4EdYkL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3AE1D014D
	for <linux-parisc@vger.kernel.org>; Wed,  2 Oct 2024 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727883312; cv=none; b=Fkdz+S5SX4gXM+vJO2/gb+ez5frrrDId1blVnZJYpo356ZrVEWBFwQpT3JgxOQrpQCuVjZA17sKMsNB4U2K1HZf/jGm0JerhRsNt5JpYWX+y6ldgMJkfqsF6Z4+YSyLiZ4CQdDCO9gtayxu/SCmHijfGsn1ecZROPtGodW7JG40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727883312; c=relaxed/simple;
	bh=ivTKKsrn0AK26hHtGM4V5NzYp5bqqL9XAIF3tTVavoo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ke0+wEpSw92ph/vV8aw1SGfAGPtzATAU+2/aNwP32E8ujW1x7vuAv6M5OInEFLk5wuLI2yURBz4UHwSl7IWP9mpv3S1e+DmQZJNMbFjfEIFpONkLUE0x7nrbphrF5rYT9eeuF6cklPKrHA14YViTUTOrmlTYJMbuVOzmS5cSd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lh4EdYkL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so64263065e9.1
        for <linux-parisc@vger.kernel.org>; Wed, 02 Oct 2024 08:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727883308; x=1728488108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv6D0fnNT3xGR1IIrR9rSYETvaIuEB74TGsumxGegAk=;
        b=Lh4EdYkLQtSJy9HG0dui9z8wh4nfBBowWanmzWztI3N2LHJ2qI0xXXVYu1NoRc7a63
         ql5yKz/bquOu/0akaf0eVxAuYiKTx5o9Bsnd7L3YGBNld1GUBzg3IOjRcazUTXIPzNCx
         uERfuA1v9M3cZJmALlCTbT1yuV31jFCClOxQmjiWhHpbTCpYD7p5mBKbT45hRCSPv98a
         hxdHEtU9Xkpgz5PReE8hkfQeIwEVD2LPiaT9HJaeYvTloxWDBXUqXwDbOlEFWNHG7Iuj
         aJ43Gj/lXqNcSEklF+/FV/y6xhyXfFO5QHobtbV5RqE2EcbErFGLo3iWzOMbKHFatDb5
         jZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727883308; x=1728488108;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kv6D0fnNT3xGR1IIrR9rSYETvaIuEB74TGsumxGegAk=;
        b=PioEp+MVs3vQjRg0mkHF9rqWTt6qwZ1jWosCJE6DPG7tm7AnT2t5V16jI7LC3dR112
         UUcp6QJPjOccXxbAcJKLAoTZIgY+XVwEeQwURF5pJA86N8j8auR1vF5bqYmx3dfhYEwx
         BedLFbATdZ9zhCypS058BftSLrVae8KUCz3j99eFtsPL+HchKLNMnDVzSROu+55uVmfD
         7Qvci9v3gElCXwUJ+pbifTYUJC75aBZ/6Pxbfd4/ZrUQBUJNFPkXjrTy97nUgk1Ld0j4
         GFoGl8zpT9HKsDPWn0HIGW8AzZ+VRsJ+xTiWvediG9kMAnaCSWhioXgTDXgFgtrtGENM
         YY+g==
X-Forwarded-Encrypted: i=1; AJvYcCVnsJf88sTneT7T6m2wU7ItHj+r2ddWJZ2PIam7OD7GHrHfIXDZn1EEPMfk/X2bEfLFyPdh3mJ9O9DU2xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFaBrLYYSqw2JbGbUSOl4+X8L5yl6mqnIegnM8DnaCf4LDqDoY
	B7uqupa6EsZlIhYF/4dw2hPxWBvzpBJG79D+qZU/ERcU8I3k9tU7SXyN5xIDqDY=
X-Google-Smtp-Source: AGHT+IH1kXy/4tu8wtewLOUFrHEoFP/8lP+J1G+2LcEEnoqjITxckaRZVCvi+AMVzIy0KRPWogji6g==
X-Received: by 2002:a05:600c:4fc1:b0:42c:b950:680b with SMTP id 5b1f17b1804b1-42f777c3830mr25786205e9.20.1727883308476;
        Wed, 02 Oct 2024 08:35:08 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79d8d693sm21703755e9.2.2024.10.02.08.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:35:07 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C55FE5F780;
	Wed,  2 Oct 2024 16:35:06 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Helge Deller <deller@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
  qemu-devel@nongnu.org,  linux-parisc@vger.kernel.org
Subject: Re: {PATCH] accel/tcg: Fix CPU specific unaligned behaviour
In-Reply-To: <Zvyx1kM4JljbzxQW@p100> (Helge Deller's message of "Wed, 2 Oct
	2024 04:37:10 +0200")
References: <Zvyx1kM4JljbzxQW@p100>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Wed, 02 Oct 2024 16:35:06 +0100
Message-ID: <87cykimsb9.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Helge Deller <deller@kernel.org> writes:

> When the emulated CPU reads or writes to a memory location
> a) for which no read/write permissions exists, *and*
> b) the access happens unaligned (non-natural alignment),
> then the CPU should either
> - trigger a permission fault, or
> - trigger an unalign access fault.
>
> In the current code the alignment check happens before the memory
> permission checks, so only unalignment faults will be triggered.
>
> This behaviour breaks the emulation of the PARISC architecture, where the=
 CPU
> does a memory verification first. The behaviour can be tested with the te=
stcase
> from the bugzilla report.
>
> Add the necessary code to allow PARISC and possibly other architectures to
> trigger a memory fault instead.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219339
>
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 117b516739..dd1da358fb 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1684,6 +1684,26 @@ static void mmu_watch_or_dirty(CPUState *cpu, MMUL=
ookupPageData *data,
>      data->flags =3D flags;
>  }
>=20=20
> +/* when accessing unreadable memory unaligned, will the CPU issue
> + * a alignment trap or a memory access trap ? */
> +#ifdef TARGET_HPPA
> +# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  1
> +#else
> +# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  0
> +#endif

I'm pretty certain we don't want to be introducing per-guest hacks into
the core cputlb.c code when we are aiming to make it a compile once
object.

I guess the real question is where could we put this flag? My gut says
we should expand the MO_ALIGN bits in MemOp to express the precedence or
not of the alignment check in relation to permissions.

> +
> +static void mmu_check_alignment(CPUState *cpu, vaddr addr,
> +                       uintptr_t ra, MMUAccessType type, MMULookupLocals=
 *l)
> +{
> +    unsigned a_bits;
> +
> +    /* Handle CPU specific unaligned behaviour */
> +    a_bits =3D get_alignment_bits(l->memop);
> +    if (addr & ((1 << a_bits) - 1)) {
> +        cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
> +    }
> +}
> +
>  /**
>   * mmu_lookup: translate page(s)
>   * @cpu: generic cpu state
> @@ -1699,7 +1719,6 @@ static void mmu_watch_or_dirty(CPUState *cpu, MMULo=
okupPageData *data,
>  static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>                         uintptr_t ra, MMUAccessType type, MMULookupLocals=
 *l)
>  {
> -    unsigned a_bits;
>      bool crosspage;
>      int flags;
>=20=20
> @@ -1708,10 +1727,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, =
MemOpIdx oi,
>=20=20
>      tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
>=20=20
> -    /* Handle CPU specific unaligned behaviour */
> -    a_bits =3D get_alignment_bits(l->memop);
> -    if (addr & ((1 << a_bits) - 1)) {
> -        cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
> +    if (!CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK) {

Then this would be something like:

  if (!(memop & MO_ALIGN_PP)) or something

> +        mmu_check_alignment(cpu, addr, ra, type, l);
>      }
>=20=20
>      l->page[0].addr =3D addr;
> @@ -1760,6 +1777,10 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, =
MemOpIdx oi,
>          tcg_debug_assert((flags & TLB_BSWAP) =3D=3D 0);
>      }
>=20=20
> +    if (CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK) {
> +        mmu_check_alignment(cpu, addr, ra, type, l);
> +    }
> +
>      /*
>       * This alignment check differs from the one above, in that this is
>       * based on the atomicity of the operation. The intended use case is

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

