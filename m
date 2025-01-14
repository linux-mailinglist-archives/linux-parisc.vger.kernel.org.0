Return-Path: <linux-parisc+bounces-3213-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7AAA1143F
	for <lists+linux-parisc@lfdr.de>; Tue, 14 Jan 2025 23:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 433E3188AA00
	for <lists+linux-parisc@lfdr.de>; Tue, 14 Jan 2025 22:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363791FCD0B;
	Tue, 14 Jan 2025 22:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mRsQj5Ng"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB892135B7
	for <linux-parisc@vger.kernel.org>; Tue, 14 Jan 2025 22:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736894277; cv=none; b=UdI+4wjZDE4225colZev1bYtadjYNvBw3xSV4s4a0IJgzYoBxg+BsgeQCpvo9kO8WKUU0hkpQxzUVUKAJhaRkQr3GFZPrtkOCLffWU1D5yT5aKUJDAw5kDB6uyRiMYRoBxqe3nJlezF/mp4NJnsJkOVCL52wzPLiQZxboelxvFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736894277; c=relaxed/simple;
	bh=yJYtsZDkIkwsYPIHs8wMil9Sit/8GnVWTYwatLbEb5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjyMUBM+3mZ2H5V7GtOHQgOUeR93mfVTzNyDCszJUi+csJgRx7GMWz/ga0BFp651m94s0+GRJ6ozCaEJseZveuudoyCku0mc2GDDyH7Pk037IeVNEWgbD0hHITj9da3Rtcft17TL+VHzlbRVwautT2P+F0gV5lEnGqXSo+5qQ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mRsQj5Ng; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d9f0ab2313so13618a12.0
        for <linux-parisc@vger.kernel.org>; Tue, 14 Jan 2025 14:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736894274; x=1737499074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhewvc0rlvRCgGYWjSq7dUWNB25MtiRnI42ivjzLA6o=;
        b=mRsQj5NgOVs7k7xZitA5Ai18Bhs0YKeguUO1Ad6lJp4dlZFsoVeJUbrs7ouWnYA1cC
         +IVH9n18/wnpqfiTNs7CYm5KFmKDEFg/fNJvrDVsS3JuTIw1ZyhItQUqmVV0UV6bpqjN
         CelCbrzcnVv9SP+Wse2T7QZhL2wjLq2FqjIxahsNXow+Fk1atVeWUjQQCIRrQA8vptTM
         I6vhtSw2Uw+p3bSbqhMwGhDeT19LRxc/rLYJS1A7MIKOfk8TEWyeevhpuYi4fl200g0h
         4BI1GdmD21keA9ihby63veY7MNZnztobI597Gs4DhQuSef7Myrowhtll/AQSJb2JOlmh
         NhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736894274; x=1737499074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhewvc0rlvRCgGYWjSq7dUWNB25MtiRnI42ivjzLA6o=;
        b=Y9lBMssfABcb2Qu8+ND8GUuVs0DRQJgVsHbl6LOxNWfSybjZ1px0i+n1cor1P5+Nn5
         ZzZm3QyaeC1WK1zI1oDCPmcip03Jp5GJxu5Qv43uEDmpRyJubv4Xfj/+vLvQ5yMmJyY2
         1ruiwtuLvK+NVp5UcrMhYYbF1WCHQ7Q8qAmVgQkL/rSTGM0gRr2h+aUtzzEx3d4PZn9v
         Slww9/0WM2ViZukDN3RsGXIDtwwG+5ehwaSz9b2a52vkmN/6zSXv3l00wmdpwb3Rdjlr
         72AcFNjqkYjE/WQcTabxAAqFWhJlM10+Knf+9oicc1Pt4Grj+Z2XGem6ME9ThrbJPh9D
         zp6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdsrfQ1Kwcaovdss1gkpu1GQsS+1sOyj7cTFx7Hw4eeVZQ4mSaU6/85gNQzhCPeNFcQoJp8ZONRWqQ3Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnqp4f4duDkS1WIkjw0sZJuHRdvNi3VFtoOZDqQ0sEmcQkOEu3
	PU9t0pMjCEcQGYI1DRJIu5/erWjCOFLAKE3F64h5giRlQtmtykiSFa3Iab2D6+o1qCCfyUlmjUL
	pqcJ4wqQO1QIqtL2s6SzqZd9x4YKaCfX92dHI
X-Gm-Gg: ASbGncswIrctXL2gbyPBYoEMeRfqt9jwcHN8pBSkrCock4CRSsOtGyA/xqORSYDdy4T
	akEAFDKS3k28uM25NcGZBgZteeHo3AT69Cqa268SoBdPiOLMG5nfaEfAQC3dFeAvsMQ==
X-Google-Smtp-Source: AGHT+IFxV/+LWb7rZqzzpeNq94QSi0/wj2KBwRrfewb1dYDrG51yGVlC8KmFWvSCHqR6B4QImpgficY4mvPq1IsCOjk=
X-Received: by 2002:aa7:cd63:0:b0:5d1:10a4:de9 with SMTP id
 4fb4d7f45d1cf-5da0dd8ba26mr6111a12.7.1736894273479; Tue, 14 Jan 2025 14:37:53
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1665d54c-178f-ff72-e627-776e7c76798b@redhat.com>
In-Reply-To: <1665d54c-178f-ff72-e627-776e7c76798b@redhat.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 14 Jan 2025 22:37:16 +0000
X-Gm-Features: AbW1kvb7q22e-ZCZw2yHynCIbJxCi4YQ7liI9mcSIxSVecdFlHMafWLNe0q15gw
Message-ID: <CABCJKud9RCJzVZ2VuTRoaBavOC9bnyTv_W_-AC3mGOy9AY7dWA@mail.gmail.com>
Subject: Re: Unaligned accesses when loading modules
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikulas,

On Tue, Jan 14, 2025 at 6:07=E2=80=AFPM Mikulas Patocka <mpatocka@redhat.co=
m> wrote:
>
> Hi
>
> On PA-RISC, with the kernel 6.12.9, I get unaligned pointer warnings when
> a module is loaded. The warnings are caused by the fact that the
> .gnu.linkonce.this_module section is not aligned to the appropriate
> boundary. If I dump the module content with "objdump -h configs.ko", I ge=
t
> this. Note that the .gnu.linkonce.this_module has "File off 000042d2" and
> "Algn 2**4".
>
> On x86-64, the same misalignment can be seen, but it doesn't cause
> warnings because unaligned pointers are handled in hardware.
>
> This seems to be a bug in the linker, because when I compile an old kerne=
l
> with a new linker, I also get the misalignment. Do you have an idea how t=
o
> work around this bug?

Does explicitly specifying section alignment in the module linker
script fix this by any chance?

> kernel-6.12.9, binutils from Debian ports:
> [...]
> kernel 6.10, older binutils:

Which exact versions of binutils were used here? I don't see the
alignment issue with binutils 2.42 on either x86_64 or parisc64, so I
assume you're testing with something newer?

$ hppa64-linux-gnu-ld.bfd --version
GNU ld (GNU Binutils for Debian) 2.42.50.20240625

$ hppa64-linux-gnu-objdump -h configs.ko | grep -E '(format|this_module)'
configs.ko:     file format elf64-hppa-linux
 17 .gnu.linkonce.this_module 00000300  0000000000000000
0000000000000000  00005c50  2**4

Sami

