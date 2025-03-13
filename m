Return-Path: <linux-parisc+bounces-3437-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 124F1A5FC4B
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 17:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6B953A98C6
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 16:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653AF13BAF1;
	Thu, 13 Mar 2025 16:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bUuYYmkE"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB01268FEB
	for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741884077; cv=none; b=uCZGOwWvMIW4N8l4X/FEgfRF4d6CkO+s0rHMt56cVjzTjWyCeEysgTU7bGLZZ8oKTNAit4FaQ/ms5cBY4ziSDLUqvM9FNeiFsUS6jjPQlrYzAsEJQ3RptJOFvLZhFCJOCHPYkJRaZTPQMQYOtPEy7qYbD9dOEvpSUIe+pp184Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741884077; c=relaxed/simple;
	bh=NBDdDxNGDvQP5bA9D+gvZA4DOkX78hxDa702jREZMkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0VC/+0+H5wTnyn2f7FzMHJjhaB9GmfLRxJYib7FYUmbGEr6yTdsqY3SjO4wL7qaAK0DmBG4cTkHC79P29X8L8prrzDS64IU62qydiT7ssaLQC1nv5s/GDrfH5plhcb24TBKDkKdOlgdsA4zoaWSqmvO4oOJNwKDEWkT9JDsBag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bUuYYmkE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741884074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AOuWXnGYR13C3EsQl2M3GLqAI/OrlKtR5FIj9y6Kyo=;
	b=bUuYYmkEnhynfcGaETgfVn+JbJ8QVPcucDFPgcjGa2/nDPQ4UlI409RsyIGyRLQcVXaZhE
	TS6gRQpHwPPGvJqixHXTGPGeZ9Bor2wt94wWcKxi2xSh8WAfWDYH8TEwZcEsRwcphka30u
	0H5QGhN5AoyCkJRfqM7E8PXEQ2UBNuY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-50eEkAh7MJS6WoYLMIkchQ-1; Thu, 13 Mar 2025 12:41:12 -0400
X-MC-Unique: 50eEkAh7MJS6WoYLMIkchQ-1
X-Mimecast-MFC-AGG-ID: 50eEkAh7MJS6WoYLMIkchQ_1741884072
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso2098700a91.2
        for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 09:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741884072; x=1742488872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AOuWXnGYR13C3EsQl2M3GLqAI/OrlKtR5FIj9y6Kyo=;
        b=EewqoJj4TyE5e1k8WlOpwe8oIVhceMXwz2rOKxPjgiDB1exq2Hdxwy7HypH6s02iUp
         sXAfypqhZy2u7ypwjXN6QWv/bqT2DatagFD0N8YT6d/xx7ix5AJwVSoYsXTEpVSkvF6H
         MaHUEApK07OY/0+qyH3JbhZineN47Dv4SgYHR1/85LIC8TlD7ov/ZNkjNKBsBfxjRuUR
         7Y6rpKPwmO21HNlfGdp+a1f7xK1HbXVi0dm8OA+ydQl9SjJnX56ftc83D0Hri74Z5/y7
         0QLUPyhJplqJswCVec1kGsnEHavJnpcfS9vn9/Yyq7wD4Vl83O1UIL75vRfZH8qSAvDa
         mr4g==
X-Forwarded-Encrypted: i=1; AJvYcCUww/+6oOyODuRzqBvLfWmdDTfET+ZgSu1OHIeEby4YlV3qzuduPetPCHMN9tIzE3d1WKQEhu9YAkD6HZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm8vKov5yJiBm52rigTRKeOsHsRM4WvYOAIN77IcGyV6iSTPvQ
	RhEhvjHaSw73fgdgVdB2nPBy7eDNicLUeYZFLWTPQR3JtSbXKzEZsc5/owlCWpCZgYezLI0D7ry
	G3ihnfIW2WJmT8K9qot8x/74XdaGW5goITuzBtvtMlZMfyH/KgezirxdGG0Yr+F3yqs+JK/2+dM
	TVXCUrOgQV6EmdbfeNx8qZBRw5QaK/eGPlcqY5
X-Gm-Gg: ASbGncvWl1DdbsM6/XyM/t1O/yq4ZuhrisKbhlTdICWagjofADleEQS4zy3Nob5o9FP
	+QBO3zdKLPv3p4jJjoFs/utVr3PIao9xguGhAvyOkjVQETE9spr4OewvAsNyOMJu2QpXYubk=
X-Received: by 2002:a17:90b:2812:b0:2fe:6942:370e with SMTP id 98e67ed59e1d1-3014e814787mr282601a91.7.1741884071602;
        Thu, 13 Mar 2025 09:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZSR0GKOgpT9qIwRRXIxVMEVNcO4hzEa3HpTc2cVefBnUNShY5U2qKEnTkHJXaXXzQjc2Wb29JilB9GlX1pNU=
X-Received: by 2002:a17:90b:2812:b0:2fe:6942:370e with SMTP id
 98e67ed59e1d1-3014e814787mr282561a91.7.1741884071208; Thu, 13 Mar 2025
 09:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313114329.284104-1-acarmina@redhat.com> <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
In-Reply-To: <20250313122503.GA7438@willie-the-truck>
From: Alessandro Carminati <acarmina@redhat.com>
Date: Thu, 13 Mar 2025 17:40:59 +0100
X-Gm-Features: AQ5f1JoRjBn0wYL3TNCgo2Be9gEw3kQ3UV-S3_DQ-XzPf4lVXAvFHPCcZEOjQyQ
Message-ID: <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning backtraces
To: Will Deacon <will@kernel.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Guenter Roeck <linux@roeck-us.net>, Alessandro Carminati <alessandro.carminati@gmail.com>, 
	Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, x86@kernel.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Will,

On Thu, Mar 13, 2025 at 1:25=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Thu, Mar 13, 2025 at 11:43:22AM +0000, Alessandro Carminati wrote:
> > diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.=
h
> > index 28be048db3f6..044c5e24a17d 100644
> > --- a/arch/arm64/include/asm/bug.h
> > +++ b/arch/arm64/include/asm/bug.h
> > @@ -11,8 +11,14 @@
> >
> >  #include <asm/asm-bug.h>
> >
> > +#ifdef HAVE_BUG_FUNCTION
> > +# define __BUG_FUNC  __func__
> > +#else
> > +# define __BUG_FUNC  NULL
> > +#endif
> > +
> >  #define __BUG_FLAGS(flags)                           \
> > -     asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
> > +     asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__B=
UG_FUNC));
>
> Why is 'i' the right asm constraint to use here? It seems a bit odd to
> use that for a pointer.

I received this code as legacy from a previous version.
In my review, I considered the case when HAVE_BUG_FUNCTION is defined:
Here, __BUG_FUNC is defined as __func__, which is the name of the
current function as a string literal.
Using the constraint "i" seems appropriate to me in this case.

However, when HAVE_BUG_FUNCTION is not defined:
__BUG_FUNC is defined as NULL. Initially, I considered it literal 0,
but after investigating your concern, I found:

```
$ echo -E "#include <stdio.h>\n#include <stddef.h>\nint main()
{\nreturn 0;\n}" | aarch64-linux-gnu-gcc -E -dM - | grep NULL
#define NULL ((void *)0)
```

I realized that NULL is actually a pointer that is not a link time
symbol, and using the "i" constraint with NULL may result in undefined
behavior.

Would the following alternative definition for __BUG_FUNC be more convincin=
g?

```
#ifdef HAVE_BUG_FUNCTION
    #define __BUG_FUNC __func__
#else
    #define __BUG_FUNC (uintptr_t)0
#endif
```
Let me know your thoughts.

>
> Will
>



--
---
172


