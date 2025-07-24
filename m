Return-Path: <linux-parisc+bounces-3805-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE5B11038
	for <lists+linux-parisc@lfdr.de>; Thu, 24 Jul 2025 19:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3528916B90E
	for <lists+linux-parisc@lfdr.de>; Thu, 24 Jul 2025 17:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5722EAB96;
	Thu, 24 Jul 2025 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iD4xK0nL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CEA2EA730
	for <linux-parisc@vger.kernel.org>; Thu, 24 Jul 2025 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753377029; cv=none; b=jcJ7MfJ+JizZ4WMYNHPSTLhrNZ8seL8ddSmsBrnXYCz/feecYKPiPg5+OueF4wltsZbW3bN0HBF+ul6Qq8WJR+VgwYGZ2siMMFclolPpPcqrPrxvKOLUxZ6CJfeC6+0BJqqVS7ztuA7/oHBTot2HqDaJ0NCVjUVllyJbKqiXTYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753377029; c=relaxed/simple;
	bh=BXxKQvzobe5wQ3xYmuCvC8UMynXnntS8L6QJrFyzNtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmVIqhhVkhrHaXPlAEyqjDn3tYzRTzuvV40CFgaqFztFoA+V/GH8d+MZ166TLIHM2aC3yVBWhQ3dpRpW3q5KVt19KFTq4VQEaBhaGVcQdpLwoLS6apsiGwPg7wcdv+6uw3HdZu+kUZ0oodlotD9q0EHtwyg5oKkq5c1sfaVNl+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iD4xK0nL; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e283b2d065so6095ab.1
        for <linux-parisc@vger.kernel.org>; Thu, 24 Jul 2025 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753377026; x=1753981826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLgUSpYw53cKLUDxe40QFSqFx9VHdgfTQvYmq7qO0B8=;
        b=iD4xK0nLzndJyLfxqXy2nvnYg+2HLRpZUYfO46D67Qu7CxF/fXtgwk7Ihmu6fkilOX
         gYgB0/4vg7R78HIQxclL0q88RU+5pABE6Qx3IqoEh4s9hy21fL0/nzzYiCuFgk2p5pgH
         FoCRMOYvk2e+zEhAvZ9tIke67mQVI9bZpCCHjQtKowgq8tReyW5K+gyt+1kyWtoAkQMU
         E33mIwDZev0WEdnUwbprgj/LRox+1p3gXM8pTlqPVdrCUJvnj39dUBdRmuPf5SXqlSeB
         mO843ccRHL2fq+Fvaq8LNs93TyNNP5AlO4SNISk4Ij+KzSpGVauuhgLa5t48lXdWIam5
         Y9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753377026; x=1753981826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLgUSpYw53cKLUDxe40QFSqFx9VHdgfTQvYmq7qO0B8=;
        b=XXFkVNoT2/ai22HfQbW9lW3j3cABp9jKg9O26duEBdPeCBLOj+4SRyE9KSRGxTVSCt
         6pZKCS3pFAm/5+U72fFkqF1VXuRKL2Hr7fQGu0iRtLNJmqYwIjaPO0ACXmAsEENvKiPY
         yarCyRz7ZHvqF3jTBsFCVIwZIiOR0gmtyRJUV0LXMuTUxQi2Uc0oe9ZadFkRY/aw5Doc
         fS/+s/tx9F21zTb6Ym1k9sGByPgnGgjc9/Q4Fzk9Z38D60weTuRG95KkhX7RnSJG7U47
         LZNVrf/Y/KpqaQ4g/CQWWD5Vc25gYIvZnrSp4jfizOvhw6J6WcBMk196zobGkD3I9LuS
         LY8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfQVV2O5CyOdnVka8bGNK8ix5e7DhgxeqEneAPXVhko3VBKzK1AmEee7X8mL1tAqbYcbVgv5NdgU3RjqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1KNHfUvI3rrP/t5hMqKViX7QGlQ34tAWnoF3D4r90wBFcEp8v
	UehChPgW16+fS2HfY2M0hFC63NQNjvxFBG9108OIo5GGN/I5iQCosGOgPKsMdx9/X7B3BZBdzmV
	gObn3U4yMuFj32YDvt8SKPDn0wcfZ50M0kuPY3Mtr
X-Gm-Gg: ASbGncvYessOjEangjJSjM0uMXFN/7xQAfr3r9nOApicwPLICuKrHW1QaKLk0WcbPln
	sttYEs19czEG7LRmbllkx+Vqm42DOhyEFl7TpHEalID9hgySip5By/BFf5hix8uVZEmrJgr5KvD
	0M8pMoSqCI5dWyT72NiJdJDXKyCndeDCsejNXOigRguOfPTA4nVD/V9pOXknPvfiv2MOX7ejnw5
	ZG2juFvm6yGP0+YEYlJaPvfJagvP3J/F4ha
X-Google-Smtp-Source: AGHT+IE8b1+9raOGesHfGm8k94AzrKSvF5YlDcl6t0VjEks3fbr8R8bSxUctdy4iwWVOqk6bssyVAo2+k1XA8p4oSsk=
X-Received: by 2002:a05:6e02:9:b0:3e0:4f95:13e5 with SMTP id
 e9e14a558f8ab-3e3b64c0bfcmr5891225ab.24.1753377026297; Thu, 24 Jul 2025
 10:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202507231135.OtEGYfnQ-lkp@intel.com> <CAP-5=fWXcGiWXeb8=165tCVtEAYX7qkVUpanbpmg=Db=kwEP0g@mail.gmail.com>
 <2923e512-36f6-4cf3-9606-18031167a93a@gmx.de>
In-Reply-To: <2923e512-36f6-4cf3-9606-18031167a93a@gmx.de>
From: Ian Rogers <irogers@google.com>
Date: Thu, 24 Jul 2025 10:10:14 -0700
X-Gm-Features: Ac12FXyR-7lBitRsNkqVgrna1c0hkaAl18mvxhank8-IiRE-018c4PqLhz59BRM
Message-ID: <CAP-5=fUiF26Ay+W+fUTRe7EOjEJXk5k_eNe6Yh7SD=GSYAssVQ@mail.gmail.com>
Subject: Re: [thomas-weissschuh:vdso/unaligned 1/3] include/vdso/unaligned.h:21:9:
 warning: '__builtin_memcpy' reading 4 bytes from a region of size 1
To: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-parisc@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 9:15=E2=80=AFAM Helge Deller <deller@gmx.de> wrote:
>
> On 7/23/25 18:11, Ian Rogers wrote:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/arch/parisc/boot/compressed/misc.c#n28
> >    /* output_len is inserted by the linker possibly at an unaligned add=
ress */
> >    extern char output_len;
> > ...
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/arch/parisc/boot/compressed/misc.c#n312
> >    vmlinux_len =3D get_unaligned_le32(&output_len);
> >
> > is reading a char as an le32, so a 1 byte value as a 4-byte le32. It
> > appears the code didn't originally declare output_len this way but it
> > was changed in commit  c42813b71a06 ("parisc: Fix unaligned-access
> > crash in bootloader"):
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/arch/parisc/boot/compressed/misc.c?id=3Dc42813b71a06a2ff4a155aa87ac6=
09feeab76cf3
> > -extern __le32 output_len __aligned(1);
> > +extern char output_len;
> >
> > Using __builtin_memcpy for unaligned values is sound. I'm not clear
> > what the appropriate parisc fix would be nor how I could test it for
> > the "unalignment-exception" reported in commit c42813b71a06. I suspect
> > the fix is to revert that commit. I believe we're seeing this warning
> > now as the casts of the previous __get_unaligned_t would hide the
> > issue.
>
> I'm afraid that if you revert my patch, the compiler may again "optimize"
> __builtin_memcpy() to a single-memory-access assembler instruction, which
> then will fail again if the variable output_len was stored at an unaligne=
d address.
> So the same issue as described in commit c42813b71a06.
> Please note, that this is the boot loader, where an in-kernel
> unalignment handler isn't functional yet.
>
> My proposal to fix this is to avoid -Wstringop-overread when compiling
> this file. Maybe some Makefile logic as done with CFLAGS_REMOVE_fpudispat=
ch.o
> in arch/parisc/math-emu/Makefile can be added

It is probably easier to add #pragmas. Is there a concern that the
compiler may detect undefined behavior and just do something garbage?

Thanks,
Ian

>
> Helge

