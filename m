Return-Path: <linux-parisc+bounces-303-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E93AF819219
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Dec 2023 22:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E9351F2446D
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Dec 2023 21:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B868B3D0A5;
	Tue, 19 Dec 2023 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRCNuJB0"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA4E3D0A7
	for <linux-parisc@vger.kernel.org>; Tue, 19 Dec 2023 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-67f6729a57fso807536d6.1
        for <linux-parisc@vger.kernel.org>; Tue, 19 Dec 2023 13:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703020446; x=1703625246; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=efdDlqQgem1GV68sY9Evu8RPx7CsBPJfCZoB2vl3zCQ=;
        b=jRCNuJB0SYoYkW8ydNQZNMYxJr9dIvR1ZMXYY34MiMiRmL+qcgYXdRppIiI9Gx8LAv
         jIqENS4g0JDA+7kRUQt916rhUzBYLDVVIzJqQvoD9h400R20j0sR5ITEu0mJux8oCvRJ
         JL8o3AoXEqcYLGvaEhJVAQ8BSKXUQ25RIDVTGXWsP1J0jqGo8PyaCNOPOCIBz3SWLB9S
         GYU807iUNJwL0s1cbpQ7d1DLC0pdO1t728nB/gcB1/eAC2AQA36jINQHya+eBwrFFfdN
         7Lwx3lS5XQkdKz436+rOzfLfLmqX11SB4rSRMgSh38xeUlQYl3VzZ/LkHcj9HwMVSvon
         xXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703020446; x=1703625246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efdDlqQgem1GV68sY9Evu8RPx7CsBPJfCZoB2vl3zCQ=;
        b=OVJTLCxnOmiupf/q7fql50PMJfh1Rp9DkEEPICOsaDjtWcm+6S3aZcOEdk6QGSlAog
         p5SwfCK8P72L1rQrGCoSWxS8RuY29ize6R1M5rtduk6ltCUP0Im57J+cRF1EDBFfTax0
         YEcuuOgYZsigm65A5DtlIJhi7xlKIsxcDp+Z51crAg36sE9vYGvK76QHWN5bLyHX/jND
         8oNZ077QfvVK33OL9DZtcOsp5NoHAHoYxb8qGM0bHDuoWwJwjoQ+Na4+KF+eCMNHCKBy
         853+f+0Ewu/x9z2IDZh4GeHRiBgHAQBgOZQ2jelUSG7qkH7HGSLr2GmZHDmD1xIKXb1n
         Qaww==
X-Gm-Message-State: AOJu0YyXI/tC3NV1WlVCkWhClo4I3Jghs19vnpEJy+f6kVZHUfXtgMPH
	mrB+95ByQ7/wlsGgQgiiEG0yJ6eqCINxmvuZbUCDYmMzL/jSvCSTUcC9b6Ck
X-Google-Smtp-Source: AGHT+IFobik1ylGwXr3iv3I5WAIKPqAnQhbfTy4ui2FkXLbr3sE8gKMG08pMKsxnMbUs2hiaAA4Q9JwpDHtcFlEsqrw=
X-Received: by 2002:ad4:5ae9:0:b0:67a:a72d:fbc1 with SMTP id
 c9-20020ad45ae9000000b0067aa72dfbc1mr2384711qvh.63.1703020446393; Tue, 19 Dec
 2023 13:14:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYvq+wdDhTjR2YkULF-_-nQNPGzCeOON-08EbVyidj-J6w@mail.gmail.com>
 <CADYN=9+0stxkNLkqcbodZD879r8DACT1M-3QyZrt4JsrAi0E1Q@mail.gmail.com> <20231219204821.vok7nch6knn2bhgo@moria.home.lan>
In-Reply-To: <20231219204821.vok7nch6knn2bhgo@moria.home.lan>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 19 Dec 2023 22:13:55 +0100
Message-ID: <CADYN=9+9xi8k5PxuHKaux-=-zRGei5xUfr+gJYTQWD13HD34sA@mail.gmail.com>
Subject: Re: arch/parisc/mm/init.c:534:29: error: invalid application of
 'sizeof' to incomplete type 'struct shmid64_ds'
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-parisc <linux-parisc@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 21:48, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>

[...]

> > Revering this patch made it build.
>
> Thanks, I've applied the following fixup:

That fixed it.

> commit ab6400d24d17e5248cbb0db37a56745554e6b6a5
> Author: Kent Overstreet <kent.overstreet@linux.dev>
> Date:   Tue Dec 19 15:47:45 2023 -0500
>
>     fixup! shm: Slim down dependencies
>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index a2a3e89f2d9a..f876af56e13f 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -33,6 +33,7 @@
>  #include <asm/msgbuf.h>
>  #include <asm/sparsemem.h>
>  #include <asm/asm-offsets.h>
> +#include <asm/shmbuf.h>
>
>  extern int  data_start;
>  extern void parisc_kernel_start(void); /* Kernel entry point in head.S */

