Return-Path: <linux-parisc+bounces-4004-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 390D8B44CC1
	for <lists+linux-parisc@lfdr.de>; Fri,  5 Sep 2025 06:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89EF17FB79
	for <lists+linux-parisc@lfdr.de>; Fri,  5 Sep 2025 04:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87B9258ED7;
	Fri,  5 Sep 2025 04:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K+7TWn6E"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2552A1EDA2B
	for <linux-parisc@vger.kernel.org>; Fri,  5 Sep 2025 04:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047228; cv=none; b=LDKvjWhUA6o01pFwzAymdCx/saO4/uuFq4RwgFZeHAggCk9R8B7GoK6hMTmXmyKLdyRvo65Qb4E6sjaU4aQYQD0xi7LR7fpFOf5A57fn2rAycugsmF75INInCq/PcwEx3t6XsjxfZhxJHc+rjCJFX4NaF48K/7ii57f20FXb5JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047228; c=relaxed/simple;
	bh=YcUlzkCjciQyQsyj+Ao9fuugAyHzxx8jpNjMWCaRaGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZKzeDZXMxuF0HbO4UC8HeKeIR5s2syVygZSE18DvjHtnVeUv4wRrmfrk0l3xSkzgvJzDLMABMGXnlKQ1nCEH+bSg5ea1MXr5Hgtc7Jssr+ZaSpfxftuZ482G0BDBvXI1ukAnOk6cnchFTEjYb0f2nhqPStHTjXVBgpSx9gnrqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K+7TWn6E; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24b2d018f92so81515ad.1
        for <linux-parisc@vger.kernel.org>; Thu, 04 Sep 2025 21:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757047226; x=1757652026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l72XkLM6JjDtnHZ/WxCVuCDCXtNUPwGl4oh1q9Ac3KM=;
        b=K+7TWn6EfyUYgs0/7GKRuUSU4C0h442BbLkiUp4MAXhDpRkB9oHq2EeaQdTKM3TR1M
         WmGPX6u1C9PEKNv5HGt0+MSnR37e++veABV59PXgptnye7XKdtIJCV06nhpBM7Et/QIn
         OsJQhB7pjdmBfhKijiKxLnZhVAGxyeRuy88QsRRgbbFTTKkcZ6ARUCx4nU3NLd8Rv59d
         tfqx+smNKKVWbly4xkeCKP2L3iWj43PdLU1W6KqBbz1/pmAZ28iA5cu5UoS8KKntazRS
         qj57v7tZijAOw00YKGMqJDwpXcem2UuTj9vF5AihdoPwK/0tsntOuUh8E1UqTP/l5bcv
         MWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047226; x=1757652026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l72XkLM6JjDtnHZ/WxCVuCDCXtNUPwGl4oh1q9Ac3KM=;
        b=WNVAAYR1eViUcBzD+9X3GaZjqX0r7GZmivi/koqLGslOx05ahOsIBg+YFFMMSnRvJD
         5NEgWhZ7hOk0AG5b4vX6zHjX8sqauOVrAAX+WG5qY/7ImgaZJjF8BeWyTTYcw0GaBE6G
         2q+fOAExPIN/F47tEorKzH/y2VXrzx4dHiyfEQVkg2YEF/z829owRy8A7HPQaNptuPuu
         KLG39f7oMrmdyxOAZYjNJQ3zkh/Hw8KariTb65MEBSofFU5EAkR/VFTPluXbx3pCmXnx
         lzBKdLLbwKIQtOHSlqEzlP9Zbps4CR8ZxBLTgis1EGsUKBxlHEGdd5YxX5/vtZF/LOjy
         YqEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUctqyrsogZQZpSqnxEPE2cp/NP2xpFUAPsQVCFWo27Cn1LrBEIBueXb74xqPBBC+dspKurlR7ESQ3N3b4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBJs4kYziWl9+E9fNiKvRH9jxJBQEP9W2PHHiltkvGb6kpOEAm
	Rgw784tZE49VvwxgWtjNSclZUyCxrXcZgXeBcglfX/5enCUupRX2NRNVYVLDJqRljvv0YPaiAwc
	7Ykn6CqgKZSx1sXPxLOuN0aUEWuZfPbCBNCr3cjqE
X-Gm-Gg: ASbGnctfG0428gxSX0O5RQ70ybvpnD+844Ya5tkbmDEX0wYYy7qdWdKF5UwpL+SPL4r
	jey9uxM+sGJ6s1sCPsDVyRCdMdpx06HA4r5WTLt0FkOG0l5HPHAFcovdEAc0EYzYGz0NR6RsgEO
	M6CvoDC+nceTybRo+dE8vCNN1S7/jTwQ1T6tyXxtHVwyqgfdcBJLN8WEmA4Gy4R4rui5wCH0npK
	9oenShZ93dI+k0=
X-Google-Smtp-Source: AGHT+IG4GpbmzoqZpV66rFDyfEIRKIwucqS2np5/dBU7tvVqgCnlPsA17XwuBma80HwvQ2Ar+OUdjj2g/6IDb/qcSTI=
X-Received: by 2002:a17:902:e887:b0:24c:1a94:e603 with SMTP id
 d9443c01a7336-24d387714c3mr1797165ad.1.1757047226055; Thu, 04 Sep 2025
 21:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202509051042.7KOze0fZ-lkp@intel.com>
In-Reply-To: <202509051042.7KOze0fZ-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 4 Sep 2025 21:40:14 -0700
X-Gm-Features: Ac12FXxpq9vJBkVYQSEtNNhW4_CQv-jyodFDS2PeHj7bxexZ3zp36-cRo8FwKNY
Message-ID: <CAP-5=fVEp8UPS-B3X=66AwYbbbs8559AHEObpQZSVnSnVYSxhA@mail.gmail.com>
Subject: Re: [tip:timers/vdso 12/15] include/vdso/unaligned.h:23:9: warning:
 '__builtin_memcpy' reading 4 bytes from a region of size 1
To: kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 7:44=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timer=
s/vdso
> head:   e994a4197086cd5df809277b3b96c88f75e1e860
> commit: 34a1cbf21227f1327ead30dcf2a52aac79bf4f15 [12/15] vdso: Switch get=
/put_unaligned() from packed struct to memcpy()
> config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20250=
905/202509051042.7KOze0fZ-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250905/202509051042.7KOze0fZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509051042.7KOze0fZ-lkp=
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
> >> include/vdso/unaligned.h:23:9: warning: '__builtin_memcpy' reading 4 b=
ytes from a region of size 1 [-Wstringop-overread]
>       23 |         __builtin_memcpy(&__get_unaligned_val, (void *)(ptr), =
          \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>       24 |                          sizeof(__get_unaligned_val));        =
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
>
>
> vim +/__builtin_memcpy +23 include/vdso/unaligned.h
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
>     15   * non-const type - you can't memcpy into a const type. The
>     16   * __get_unaligned_ctrl_type gives __unqual_scalar_typeof its req=
uired
>     17   * expression rather than type, a pointer is used to avoid warnin=
gs about mixing
>     18   * the use of 0 and NULL. The void* cast silences ubsan warnings.
>     19   */
>     20  #define __get_unaligned_t(type, ptr) ({                          =
       \
>     21          type *__get_unaligned_ctrl_type __always_unused =3D NULL;=
         \
>     22          __unqual_scalar_typeof(*__get_unaligned_ctrl_type) __get_=
unaligned_val; \
>   > 23          __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),    =
       \
>     24                           sizeof(__get_unaligned_val));           =
       \
>     25          __get_unaligned_val;                                     =
       \
>     26  })
>     27

Ugh. This is the same issue as discussed here:
https://lore.kernel.org/linux-parisc/CAP-5=3DfWXcGiWXeb8=3D165tCVtEAYX7qkVU=
panbpmg=3DDb=3DkwEP0g@mail.gmail.com/

I was failing to find the e-mail thread and thought maybe the issue
had been resolved. Anyway, I also came across commit  f6b5f1a56987
("compiler.h: Introduce absolute_pointer macro")
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/f6b5f1a56987de837f8e25cd560847106b8632a8?id=3Df6b5f1a56987de837f8e25cd56=
0847106b8632a8
which solves a similar -Werror=3Dstringop-overread. Could somebody on
the parisc side take a look?

Thanks,
Ian


> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

