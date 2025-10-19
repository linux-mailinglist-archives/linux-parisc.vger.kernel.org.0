Return-Path: <linux-parisc+bounces-4237-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDACBEEACA
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Oct 2025 19:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B988B3E278D
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Oct 2025 17:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501C3212549;
	Sun, 19 Oct 2025 17:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao5sBXJl"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC54191F84
	for <linux-parisc@vger.kernel.org>; Sun, 19 Oct 2025 17:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760894663; cv=none; b=a02ti7k9fjB7grUWNXd4xYUBYUXffS5N+3pV/baoNlc9KiPq3uqGuQhkH5/ZwYmYD3boLrzpDCrk3XWH7z4tVsUL0zlv/RxhkQjPgI+a/j3yyvK3ut8vOceDtIQBld0Lk0e455Ks/6Wri2m3ymyd0dqRWTzjXoUvLUWGXAxlWAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760894663; c=relaxed/simple;
	bh=GyxzHIIXxUVg82kV2A6JxNIkaYJb83owSDvq3N9KC9s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gHvffHN1hamRySXez44o2IItooLYNYSnBbpsc2AHIP4qd8io9hR1ZBMWeXT96G8hQdr3H5mtxYxgp0sHYK5hNAfT1MH9/KxmrEAT0yvmrcVMmlPBCdzH10OgD7w9wcIBSxxxlsZVZ3lQE41SyFXv6bv2hSjpAwXAQbwlSV7qmYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao5sBXJl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47109187c32so17081995e9.2
        for <linux-parisc@vger.kernel.org>; Sun, 19 Oct 2025 10:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760894660; x=1761499460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evSatq99/j/IimCAo4hFusCnUZcKI8cGVVRGB4j0Cgg=;
        b=ao5sBXJl1AJ/mXM3XlTPfEwircDb2foE8jUngelpuMpinqJoILE6tp10pfpT+CbE+z
         lJJ6hsWM/ap96AM78jLRlDO3EkbF7EeHC8NY9rNP2+gOmKeyEIIGtZrQaTw/7NTWgmVZ
         JloSEZqAouuZrT0+wWuD8jueU/fg5JaTDywL36GWR4vCYNkLRm107FxAyinKZ3SINecR
         i49UoYcXdu9krPzjQAsw/MHZpIeMwfa+2shXMab2flzLU9V6mcwaPqUSiHy+wplpmhl0
         HEZR82fIquXNCwk2MHO4nMGAjVMteGYmJmYCf64W22//2ZtpAruDkVgQ1+BRbHK8ceUv
         CrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760894660; x=1761499460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evSatq99/j/IimCAo4hFusCnUZcKI8cGVVRGB4j0Cgg=;
        b=Il1Zb94uiGF0n8ktpIUKdGJf5uMh4zqjgBAg/CbPs1SXgjulRC9CT9Vxm5BbONvdbg
         VaK514w1bgOn0p4zaZbc4DRBe1NL4MRqpSc5/73r/eJPHkX6nI35u28+BVK4wM6nZ+LX
         Nyg6gwUwVq65sZQmusHb4WxkJ/pri1Yv7mi1Ix55R81IZ7z0dUmlCo27BWh0AT+Em/k0
         xI9mefANS47Lyi6k5C2zLH2AP9dW+yIrkWMM3bsLQePnra2hMiNLV8NziEBFigkZOWnk
         /ExK94Ja5TZbUyzdo105oeUSKvIdaiFFAV1lg/HroIYjnHMO3LjAMKum64+YpaTLsLi+
         usWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV21c+9xPQnbqNaBmL6Y6YcalzO4c9E2R0xoB2efhkuCi9rOJWI+wFIWTPpuSIMY1fmf4tQr/b1jtsZeHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyTNbB5ylXky/cZnSCqDrACzBMCyLbevPMqV9QHbrVgdCDWxm6
	7nI+ZC6pp4h5AnAlbk/VNVCHI01wbNiWkSf01lIdGbUtNF4qCxRak0DQ
X-Gm-Gg: ASbGncuOs3hTr1ic3hdeeA5q76AoxmGF2d5RYAnvWcnb1sAa9iIAVphOCMXuRqSBVpI
	fw9EzfUr+3FLVOBitnrHY3UTW+Q9lCG10Paw8tIPThBkuDS1s6+DhjVRFeC6fjCd1siF8xjBbWN
	qf9rvxsEJTJwVf2/GpRuoNTIwDP7UL0sXN7rDCrlZ+O5yoOjZowwQD569v0DW3yw4OUc6S0rZsU
	4YZpUu6aG6UUqk8wnOFDRFbKTtxIL65rvXj8MTDXlT3H3jzs0oRFMGqg+ZfJrqCoJ5/Wk4kgKDd
	qHJ0NCwr0+c2ptGWEjLy1td6PJ6dwNWftmGySf4uWwnLmvtbjJe52SFVoleYBYjgHqErpcFfw1f
	Zl7q5JdRKTP7NrFLPqSssRaovpuqkEP5QfJz00+q5UyNNMoRBzIiMCJh14NyIfJMPCUI2QQnHxa
	z9ET3YqAu1EoSuo8VBrAsZ5//bR1CsWLRKn7fIgLV3zazA7gTXFVBI
X-Google-Smtp-Source: AGHT+IF+arsaQthKXRMuvg/hSWu3RAUPVcPTbK+bjkFJ6eNJ3JroXtudCR7D5D0v0mDKTLBg9wio0A==
X-Received: by 2002:a05:600c:4743:b0:471:ff3:a877 with SMTP id 5b1f17b1804b1-47117907a30mr69597355e9.20.1760894659621;
        Sun, 19 Oct 2025 10:24:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715e4e268asm44333425e9.14.2025.10.19.10.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:24:19 -0700 (PDT)
Date: Sun, 19 Oct 2025 18:24:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v5 2/4] vdso: Switch get/put unaligned from packed
 struct to memcpy
Message-ID: <20251019182418.6434b416@pumpkin>
In-Reply-To: <20251016205126.2882625-3-irogers@google.com>
References: <20251016205126.2882625-1-irogers@google.com>
	<20251016205126.2882625-3-irogers@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Oct 2025 13:51:24 -0700
Ian Rogers <irogers@google.com> wrote:

> Type punning is necessary for get/put unaligned but the use of a
> packed struct violates strict aliasing rules, requiring
> -fno-strict-aliasing to be passed to the C compiler. Switch to using
> memcpy so that -fno-strict-aliasing isn't necessary.

Does the compiler always manage to optimise everything away?
You really do need it to generate the code for a misaligned
memory access.

You might be better off removing the 'strict-aliasing' warning
by 'laundering' the pointer through an integer type (probably long).

	David

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  include/vdso/unaligned.h | 41 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/include/vdso/unaligned.h b/include/vdso/unaligned.h
> index ff0c06b6513e..9076483c9fbb 100644
> --- a/include/vdso/unaligned.h
> +++ b/include/vdso/unaligned.h
> @@ -2,14 +2,43 @@
>  #ifndef __VDSO_UNALIGNED_H
>  #define __VDSO_UNALIGNED_H
>  
> -#define __get_unaligned_t(type, ptr) ({							\
> -	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
> -	__get_pptr->x;									\
> +#include <linux/compiler_types.h>
> +
> +/**
> + * __get_unaligned_t - read an unaligned value from memory.
> + * @type:	the type to load from the pointer.
> + * @ptr:	the pointer to load from.
> + *
> + * Use memcpy to affect an unaligned type sized load avoiding undefined behavior
> + * from approaches like type punning that require -fno-strict-aliasing in order
> + * to be correct. As type may be const, use __unqual_scalar_typeof to map to a
> + * non-const type - you can't memcpy into a const type. The
> + * __get_unaligned_ctrl_type gives __unqual_scalar_typeof its required
> + * expression rather than type, a pointer is used to avoid warnings about mixing
> + * the use of 0 and NULL. The void* cast silences ubsan warnings.
> + */
> +#define __get_unaligned_t(type, ptr) ({					\
> +	type *__get_unaligned_ctrl_type __always_unused = NULL;		\
> +	__unqual_scalar_typeof(*__get_unaligned_ctrl_type) __get_unaligned_val; \
> +	__builtin_memcpy(&__get_unaligned_val, (void *)(ptr),		\
> +			 sizeof(__get_unaligned_val));			\
> +	__get_unaligned_val;						\
>  })
>  
> -#define __put_unaligned_t(type, val, ptr) do {						\
> -	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
> -	__put_pptr->x = (val);								\
> +/**
> + * __put_unaligned_t - write an unaligned value to memory.
> + * @type:	the type of the value to store.
> + * @val:	the value to store.
> + * @ptr:	the pointer to store to.
> + *
> + * Use memcpy to affect an unaligned type sized store avoiding undefined
> + * behavior from approaches like type punning that require -fno-strict-aliasing
> + * in order to be correct. The void* cast silences ubsan warnings.
> + */
> +#define __put_unaligned_t(type, val, ptr) do {				\
> +	type __put_unaligned_val = (val);				\
> +	__builtin_memcpy((void *)(ptr), &__put_unaligned_val,		\
> +			 sizeof(__put_unaligned_val));			\
>  } while (0)
>  
>  #endif /* __VDSO_UNALIGNED_H */


