Return-Path: <linux-parisc+bounces-3803-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0A7B0F7DD
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Jul 2025 18:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6CFD58488D
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Jul 2025 16:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F764A28;
	Wed, 23 Jul 2025 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BqOJyiNq"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623591F03D8
	for <linux-parisc@vger.kernel.org>; Wed, 23 Jul 2025 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753287117; cv=none; b=XvKawtvKntMVPonyyj6UvUOmXvaUky3iX7EbL28++eBdIJIDhSvZyzPIApdcIxXJVISUjBYsSdmU92HeN2X2hUyzCOve0HBF+yrLxs5P/lITrn9v2bhSIh54+JU6xV5ZBsagjN6rPMy0NfkzZfFl3eCp60gRLED1p8Z3Y7b0GXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753287117; c=relaxed/simple;
	bh=rtxGwpegLORvQBEbPYS0PTFtkd9ieN1vLVcF8F6f+q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LwxuNyAJuTnFJlwiKwdjVy3h2+UCSgBeUR3AiFR3z2j4TrpvAK3PfPt7QVXIcCLHWN9oZCZgdQ2wx1qma1vL5swNAi9Z6cxGdT+u2iHLDq9Yf79wo/cF8O8w0bKvxOgiig/JKtVuK5k14ZCxRA5z0UUegRTuFf6xqnpKXexCvF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BqOJyiNq; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3df371e1d29so124285ab.0
        for <linux-parisc@vger.kernel.org>; Wed, 23 Jul 2025 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753287113; x=1753891913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3C0WkHfBhCBetBl394jJtlyzYpWkePUkyD3d8tSiYk=;
        b=BqOJyiNqvftjtcgBD1YKXSwOAp5+AXqlToBn2jXpXSTY1s48aLKCQywZKlM1IhG/W7
         raRCkwbtxonfQ84r+Nn9uQUvImS1OLjVGeeZ8oyNHHi923jiBH8RMHP3lmix5M2SuMR8
         veQUyBjbGODX70YuTUFfk6wFfMhlajCkHNOD2KUpBvOWDVx0ahgKeOxX5S3BTkGz1XqE
         f4rpMnhHx+YUT9tNk4w7scHFMWhpH9QbnTNyhdTYapfj/uqzpxt1gPEoGVGfwrYQYn8L
         OT2ouEdSB9DSwgPtyfindSd9dVsGw+3aT3aymgIgJHlURPKNXQD+XZpig/13Pm4fqGAW
         ROUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753287113; x=1753891913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3C0WkHfBhCBetBl394jJtlyzYpWkePUkyD3d8tSiYk=;
        b=mMQRS0ynr5uJNnrLmHw7gsvaWlOvbxuDusFzfVlCE/SOeaUWsar1u3ASGMh1V0N3Br
         jtyVoHMxKbYAeJ8ptRX1wAtCBC7E/ybW71juDpdncNWAdH2scFhPOR7peeAS4Hpjh29q
         /QtdFiQpMzlJPNxXXq5ZCbLoLlmAKyQcjA8j5tRErNeeCOVgjv1mmh4e8FCtzWnWBABk
         9Az0tHyDegt89d09YsfDqIGS7R7n0nyrCBl30wqqP+o/WZhJ92z20Q5cqTkcZW7Dn5/m
         a6bs7KJ2i2U5A0PDkBbOU/xDvPmTp+yxuplRGU0ZQyHym5N74j93tsPx/O00hkoLBzRi
         QZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhNQ26L0DnCkZ0F8ekt4zvQmm39zhsukJNwOiFCON9LLGbGAorp5hgVmNM0O5BrUbCxxDfbWuKOgstoxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhD65lm26hfnbV2dqQMk9z85p3F4SNzAxpgLD1/Nq6WGp0jUl
	wZbJSF95pGVETjv0q1s6R5DiifsQnTAmRTYIY4OSArP3IghgDCFcOHvZWiQkjKd6LjyK87Un23R
	tM/+gV8mASpRihDuoc/2DX71+6zRZV17OCw0vKxcA
X-Gm-Gg: ASbGncuYhzDowXoc9MyrimATfUKH7Wp0DO77F8y3mJ1oOp40/ONYCLBFdNxzJwriOkg
	zMbove1b8QM3SqaIdk4bJG1ZLn9R/RG5s34FmG3OMgqKF1bRLE+5x/0yTW2CjEcB2AlzZYJzn3k
	XksviwPDhbeltl56q9c2eJluZMM9bFJXI+W9ZDpvtb0VjDGeOzjicpkBLAxw9ItzXDmTSqlol7i
	U1uDK5taNJz/GIPnp1uiHxAErRuGDyh3DJS
X-Google-Smtp-Source: AGHT+IG5RLz5nygO1p3fdFsYtaf1fvLM6+An1Ff5N0geLaG02ZtSSd9AZhrgRbAX3/mlm5RMlSRZNbCcUpUltCo47WE=
X-Received: by 2002:a05:6e02:b2e:b0:3dd:a562:ce54 with SMTP id
 e9e14a558f8ab-3e384388d3dmr3589385ab.15.1753287113143; Wed, 23 Jul 2025
 09:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202507231135.OtEGYfnQ-lkp@intel.com>
In-Reply-To: <202507231135.OtEGYfnQ-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Jul 2025 09:11:41 -0700
X-Gm-Features: Ac12FXy743Yjo7FkOF29oxvWtaE0FOvh6k33rH02UOuJhGYuJGQvop7Rnk3F9UA
Message-ID: <CAP-5=fWXcGiWXeb8=165tCVtEAYX7qkVUpanbpmg=Db=kwEP0g@mail.gmail.com>
Subject: Re: [thomas-weissschuh:vdso/unaligned 1/3] include/vdso/unaligned.h:21:9:
 warning: '__builtin_memcpy' reading 4 bytes from a region of size 1
To: Helge Deller <deller@gmx.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-parisc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 8:49=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh=
/linux.git vdso/unaligned
> head:   d826530fc107faa320a7a88b939b72fa5f6734b5
> commit: 3e7bf09e7bd5dce36df14f6770211fd1bc98a538 [1/3] vdso: Switch get/p=
ut unaligned from packed struct to memcpy
> config: parisc-randconfig-002-20250723 (https://download.01.org/0day-ci/a=
rchive/20250723/202507231135.OtEGYfnQ-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250723/202507231135.OtEGYfnQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507231135.OtEGYfnQ-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/swab.h:5,
>                     from include/uapi/linux/byteorder/big_endian.h:14,
>                     from include/linux/byteorder/big_endian.h:5,
>                     from arch/parisc/include/uapi/asm/byteorder.h:5,
>                     from arch/parisc/include/asm/bitops.h:11,
>                     from include/linux/bitops.h:67,
>                     from include/linux/kernel.h:23,
>                     from arch/parisc/include/asm/bug.h:5,
>                     from include/linux/bug.h:5,
>                     from include/linux/thread_info.h:13,
>                     from include/linux/sched.h:14,
>                     from include/linux/uaccess.h:9,
>                     from arch/parisc/boot/compressed/misc.c:7:
>    In function 'get_unaligned_le32',
>        inlined from 'decompress_kernel' at arch/parisc/boot/compressed/mi=
sc.c:312:16:
> >> include/vdso/unaligned.h:21:9: warning: '__builtin_memcpy' reading 4 b=
ytes from a region of size 1 [-Wstringop-overread]
>       21 |         __builtin_memcpy(&__get_unaligned_val, (void *)(ptr), =
          \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>       22 |                          sizeof(__get_unaligned_val));        =
          \
>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/uapi/linux/swab.h:120:19: note: in definition of macro '__swab=
32'
>      120 |         __fswab32(x))
>          |                   ^
>    include/linux/byteorder/generic.h:89:21: note: in expansion of macro '=
__le32_to_cpu'
>       89 | #define le32_to_cpu __le32_to_cpu
>          |                     ^~~~~~~~~~~~~
>    include/linux/unaligned.h:23:28: note: in expansion of macro '__get_un=
aligned_t'
>       23 |         return le32_to_cpu(__get_unaligned_t(__le32, p));
>          |                            ^~~~~~~~~~~~~~~~~
>    arch/parisc/boot/compressed/misc.c: In function 'decompress_kernel':
>    arch/parisc/boot/compressed/misc.c:29:13: note: source object 'output_=
len' of size 1
>       29 | extern char output_len;
>          |             ^~~~~~~~~~

I agree with the bug report but not that the patch series introduces
the issue. The code:

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/parisc/boot/compressed/misc.c#n28
  /* output_len is inserted by the linker possibly at an unaligned address =
*/
  extern char output_len;
...
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/parisc/boot/compressed/misc.c#n312
  vmlinux_len =3D get_unaligned_le32(&output_len);

is reading a char as an le32, so a 1 byte value as a 4-byte le32. It
appears the code didn't originally declare output_len this way but it
was changed in commit  c42813b71a06 ("parisc: Fix unaligned-access
crash in bootloader"):
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/arch/parisc/boot/compressed/misc.c?id=3Dc42813b71a06a2ff4a155aa87ac609fe=
eab76cf3
-extern __le32 output_len __aligned(1);
+extern char output_len;

Using __builtin_memcpy for unaligned values is sound. I'm not clear
what the appropriate parisc fix would be nor how I could test it for
the "unalignment-exception" reported in commit c42813b71a06. I suspect
the fix is to revert that commit. I believe we're seeing this warning
now as the casts of the previous __get_unaligned_t would hide the
issue. If Helge Deller <deller@gmx.de> or someone maintaining
linux-parisc could help it would be greatly appreciated.

Thanks!
Ian

> vim +/__builtin_memcpy +21 include/vdso/unaligned.h
>
>      6
>      7  /**
>      8   * __get_unaligned_t - read an unaligned value from memory.
>      9   * @type:       the type to load from the pointer.
>     10   * @ptr:        the pointer to load from.
>     11   *
>     12   * Use memcpy to affect an unaligned type sized load avoiding und=
efined behavior
>     13   * from approaches like type punning that require -fno-strict-ali=
asing in order
>     14   * to be correct. As type may be const, use __unqual_scalar_typeo=
f to map to a
>     15   * non-const type - you can't memcpy into a const type. The void*=
 cast silences
>     16   * ubsan warnings.
>     17   */
>     18  #define __get_unaligned_t(type, ptr) ({                          =
       \
>     19          type __get_unaligned_ctrl_type __always_unused =3D { 0 };=
                 \
>     20          __unqual_scalar_typeof(__get_unaligned_ctrl_type) __get_u=
naligned_val; \
>   > 21          __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),    =
       \
>     22                           sizeof(__get_unaligned_val));           =
       \
>     23          __get_unaligned_val;                                     =
       \
>     24  })
>     25
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

