Return-Path: <linux-parisc+bounces-2951-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A8B9DF643
	for <lists+linux-parisc@lfdr.de>; Sun,  1 Dec 2024 16:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BB15162FBE
	for <lists+linux-parisc@lfdr.de>; Sun,  1 Dec 2024 15:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84FB1D63CD;
	Sun,  1 Dec 2024 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5g1P1mm"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CBE1D61A2
	for <linux-parisc@vger.kernel.org>; Sun,  1 Dec 2024 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733067550; cv=none; b=l35K7wPPIjFJmULfNf84vxceclfuZV0MmEsEDJQrs3n1jpm/5MT8NnGpkQxoz8FfYDhR4GFHu742sXT79/o4wLcxqSgJBTWF2p3KGnh7fuGqrDYKTKNQhL9k7i7CAS6oQLw7W5bD6pJ35zSSXbURKJuvO4OYKOt/tl8Dgh3NRHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733067550; c=relaxed/simple;
	bh=A3WxOhLIm0YVoROHLBEyFtxjrFbIXtHNFyQ4IiH2M6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/1/yGK7DPYQldgVNDuj5T4pBTYbZ3OcpbP26SYL4hlw53RPtiopggGehlL96oaZm1qFKAqrc/rg9EYts4AjqOz2RNwAyNvK96Krr87SM131G4qRc2InNQPWMR012VDmdRlJTrMgmWNVE5Zk++g48wwrhe67elcU9kBRzEfCGUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5g1P1mm; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so4034339a12.2
        for <linux-parisc@vger.kernel.org>; Sun, 01 Dec 2024 07:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733067547; x=1733672347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm1x/dpdWPhlQxKptGTV5ps8pUHtS/UYx+HZURwjWms=;
        b=M5g1P1mmna4CtC1j3jElBhyVckqfrJaU0Pd0FK8qxil++cdy4/bkcXwtAuQdofB7wP
         gxEUf7kl4F+k1VrTQGYA5hukYDR5oLxj1YNLJ4aqFBAy1GHoA4gXoGLGkVvqLCWP2lvN
         6BXPTMEFj0VjP74tJ0jaiMm2/lQVcGx4hJ7vBsf11Gdn1KOPql0lUaNFM69Uy6lKG9h8
         xWT1IVMoL513h+334lq0gproeIiwvY1LlkrMEBpwh6nhJKrsuIWOPUVd0jrD4l0MnpQH
         qq8XO7zUPtSsS2wlwXXjV9wNQj4Jbc+bJCFCgxYZCm5A0pHMkBtfpgIgRtoki94ghXyQ
         HDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733067547; x=1733672347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm1x/dpdWPhlQxKptGTV5ps8pUHtS/UYx+HZURwjWms=;
        b=NBfrp44fTzCCBDNlc1DVADhIW0HkiVSxMPfLy08Di/krSho26JQeSDJ9YRlU4FE0QA
         DKmABSnOTSiUhlrDcvlIwL+GdVufN6SRZ85+5/BjKhLn9JbYdxZRozIHLAxI95OWmI5b
         VQ0tZS8ENF8NhKmjJgCJUEDaqSIBnmT7JmTCMlN2cpleMUhezp6ZVg1HvfsMtyH5PrwE
         ViQrkmDf+42C5YOOTE3kXwH5PKTdRa3s/RlRkome0uBm9Zf+De+Aqww9D0EWZeynJmvQ
         FW+4ZOIfX7gVE24M2zU5tnZC47iSc9iMpi4lOsuQn+qD+plscs61oycDcxhCc1oiQmro
         wNmg==
X-Gm-Message-State: AOJu0YzDi7Al0hDRVfdKgLJvWoRI6zVSVlGyj1bW/ECKRKZ7h/BpLoM2
	ytF7CBWC+XOPolVoD7rVweNICc0wGogQcLs2ZCrKrPeYhTgtPc44eRJUsNtE2HeRfu5YCcIsVlv
	66S1hdDLtxopl/006X++bImcHRaI=
X-Gm-Gg: ASbGnctmsWfQmxnoHmZ+82C4L5uxSFjIUQctlw2HVaqn6OfBrNE4x+NQl+HBqTQP1cW
	11/UcbdgHduyyYXLCMfpBRHkqVXUjECR7AblL0QyqVsZZNMfgrbL07yO1va8Wp7a3
X-Google-Smtp-Source: AGHT+IH0EPYuKDwtWcg9lsVnxtTIprquIVwGEcj/VTJHOFf0lRyp5j/pUj+5ISNJqskNLiCF7PU6PBSlWHTfqZqYRP0=
X-Received: by 2002:a05:6402:1eca:b0:5cf:d1b5:1bd5 with SMTP id
 4fb4d7f45d1cf-5d080c533c8mr17093823a12.16.1733067546851; Sun, 01 Dec 2024
 07:39:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54fbebcc-d4f5-40f3-8711-bac14dcd5397@bell.net>
 <a5b5e745-30b8-4a1d-b406-fc1d991dc775@gmx.de> <5468692c-df88-44ca-9f0c-f8d2e535bfa0@bell.net>
 <6d49b2eb-986e-4489-8f4e-878a4a24db2c@bell.net> <CAAZ8i81QnEYyEvWBNWeE0E=5xK9LDZD0FVkSuOGfQv9NFAwNbA@mail.gmail.com>
 <8c39a00d-a978-4a1e-a864-bc3a409aeb90@bell.net>
In-Reply-To: <8c39a00d-a978-4a1e-a864-bc3a409aeb90@bell.net>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Sun, 1 Dec 2024 16:38:55 +0100
Message-ID: <CAAZ8i80MoCG0bhwCOznBCJGt3KCL5havJYY0voadf+ODVyz2RA@mail.gmail.com>
Subject: Re: mm/slab.h "unknown type name 'u128'"
To: John David Anglin <dave.anglin@bell.net>
Cc: linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi
thanks, firmware, kernel, and userland files are on a distributed pool
of disks, mounted time to time to chrooted gentoo stage4 rootfs on
different machines (Apple MacMini intel, but also PowerMacG5, and XEON
servers). I needed a way to identify the environment provided by the
chrooted rootfs, and a way to manage to check the tools versions in
the ecosystem

(
with gentoo, you also have multiple gcc, both native and
cross-compiler, you need to check which version is currently selected
gcc-config -l
 [1] aarch64-unknown-linux-gnu-6.5.0
 [2] aarch64-unknown-linux-gnu-9.3.0 *

 [3] armv5tel-softfloat-linux-gnueabi-6.5.0 *
 [4] armv5tel-softfloat-linux-gnueabi-9.3.0

 [5] armv7a-unknown-linux-gnueabihf-6.5.0
 [6] armv7a-unknown-linux-gnueabihf-8.4.0
 [7] armv7a-unknown-linux-gnueabihf-9.3.0 *

 [8] hppa-unknown-linux-gnu-6.5.0
 [9] hppa-unknown-linux-gnu-9.3.0 *

 [10] hppa64-unknown-linux-gnu-6.5.0
 [11] hppa64-unknown-linux-gnu-9.3.0 *

 [12] i686-pc-linux-gnu-4.9.4-gnat2016
 [13] i686-pc-linux-gnu-6.5.0
 [14] i686-pc-linux-gnu-7.3.1-gnat2018
 [15] i686-pc-linux-gnu-7.5.0
 [16] i686-pc-linux-gnu-8.3.1-gnat2019
 [17] i686-pc-linux-gnu-8.4.0
 [18] i686-pc-linux-gnu-9.3.0
 [19] i686-pc-linux-gnu-10.2.0 *

 [20] mips-unknown-linux-gnu-4.1.2-legacy
 [21] mips-unknown-linux-gnu-4.5.3-legacy
 [22] mips-unknown-linux-gnu-6.5.0
 [23] mips-unknown-linux-gnu-9.3.0 *

 [24] mips64-unknown-linux-gnu-6.5.0 *
 [25] mips64-unknown-linux-gnu-9.3.0

 [26] mipsel-unknown-linux-gnu-6.5.0
 [27] mipsel-unknown-linux-gnu-9.3.0 *

 [28] mipsle-unknown-linux-gnu-4.5.3-legacy *

 [29] powerpc-unknown-linux-gnu-6.5.0
 [30] powerpc-unknown-linux-gnu-9.3.0 *

 [31] powerpc64-unknown-linux-gnu-9.3.0 *

 [32] sparc64-unknown-linux-gnu-6.5.0 *
 [33] sparc64-unknown-linux-gnu-9.3.0

 [34] x86_64-pc-linux-gnu-10.2.0 *
)

So, I created a "building script" that manages these checks before
starting compiling stuff.

It's still beta stuff, but it's very handy, especially after months
when you don't remember what you were using, on which chroot, etc, and
which are the minimal requisites.

macmini2-intel kernel-6.0.2-parisc-c3750 # ./mybuild-2024 2
[step2] compiling
kernel-6.0.2(parisc/c3750)
| note: experimental, not yet booted
toolchain(hppa64-unknown-linux-gnu:2.34.0/9.3.0)
-----------------------------------------------
checking myhost as qualified_host ... success
checking .config ... success
checking blobs ... success
-----------------------------------------------
gadget_to_do(build) ... kernel/build
cleaning ............. done
gadget_to_do(clean) ... kernel/clean
building kernel ... success
-----------------------------------------------
gadget_to_do(binary) ... overlay/binary
gadget_to_do(sweep) ... kernel/sweep
app_body    =3Dkernel.elf
app_size    =3D7833152 byte
app_size_max=3D8000000 byte
checking size ... passed
gadget_to_do(binary_report) ... kernel/binary_report

At the moment, I'm compiling a new Gentoo-stage4/x86-64bit with
cross-gcc-v12 and v13 for hppa64 in the list of things to be emerged.

For kernel >=3D6.12.* It will easy to add the "the kernel requires this
gcc minimal version" constrain

echo "12.0" > profile/gcc_ver_min

and "qualified host", as this new "2024/12 rootfs" containing gcc-hppa64-v1=
2

echo "macmini2-intel/v19.0-2024-12" > profile/qualified_host

"macmini2-intel" is a unique name within the network, associated with
a static ip.
So, it's a label that identifies only a computer.
The other entry "v18.0-2024-12" identifies the rootfs.
The version comes from "gentoo portage version", the date is my build-date.

Thanks for your quick reply =3D)

D.

On Sun, Dec 1, 2024 at 12:36=E2=80=AFAM John David Anglin <dave.anglin@bell=
.net> wrote:
>
> On 2024-11-30 5:54 p.m., DiTBho Down in The Bunny hole wrote:
> > hi
> > I am trying to compile recent >=3D kernel-6.12.*
> > with the toolchain hppa64-unknown-linux-gnu
> > + binutils-v2.34.0
> > + gcc-v9.3.0
> >
> > The process stops with an error
> >
> > In file included from mm/mempool.c:21:
> > mm/slab.h:25:9: error: unknown type name 'u128'
> >     25 | typedef u128 freelist_full_t;
> >        |         ^~~~
> >
> > where "u128" should be defined?
> > Is my cc too old?
> Yes.  TImode is a relatively recent addition to hppa64 compiler.  I know =
it's in gcc-12.  Your
> binutils version is also very old.
>
> Dave
> ---
>
> John David Anglin  dave.anglin@bell.net
>

