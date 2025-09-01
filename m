Return-Path: <linux-parisc+bounces-3944-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEECB3E767
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 16:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B47CD162C9C
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 14:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3E7340DBA;
	Mon,  1 Sep 2025 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="P7l8By8+"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A933A025
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756737585; cv=none; b=OZFb5Rb9wCtJz5ECgjDxo3LBDafhpaoSA/CPtFXky/BIJJil3wYGx8x5pGTm11zm13c/ilDTLOA0buLrUNoCE3c5u8HtueG8QZDdBAPQ6H8bPH/W4km/xcqBOj8KUlTMbfzOAoGNXJ3/MjW4F/X63wrOiw+why0VH0tsCM39GSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756737585; c=relaxed/simple;
	bh=htQYfrQvt/cTrdobxmgH73W4WPpszNwvgv/0+a/GiHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCVHX+NCDKv2ySat4jNU4H8ZgDtD859w8YctzRXO/AaVQLIIjBpajgr9U//G6izUNvU5V2svNokrWu/5anY4Ea2z/gcBt3VWwyjvdRXX1vUGHBZGxRj0kYscqaxr+aizyRrmYlDlK/3vq+dPi/EFa6DuqIBir9YidUlN75d2JmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=P7l8By8+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b043da5a55fso81616866b.0
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 07:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756737582; x=1757342382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htQYfrQvt/cTrdobxmgH73W4WPpszNwvgv/0+a/GiHg=;
        b=P7l8By8+4XE9YYtGkfhSvUvaLgl4Xj15mlqqx/eQuQkvJe2eXJG1bE8ecAK2W+KnI2
         5vGNhpoVYK3Tu82jRS3+jZF+w/u7KCSdqqPpvRL4KsNI9fhbk0eJdMvNqPFNeYbSsLpk
         ZmyeSRAeyxWFzcAlaTaCEClS+D3lA3tLCZUaLSK7vmduS7tkQinal12YAwjQGJ45sw9O
         YEUDKk/BsZZr5D4grqjRDauozq0hcS7dT7vVQX8zrkHujB/tg1DTt/EoqgrUybARY+0c
         EAWr3CSgV2fuyIUL1fqpg1RdPB9M3lqZKw4aMQzQKjcpV0EZ7fXbeDWH9lhoRHnJ6pw4
         qbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756737582; x=1757342382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htQYfrQvt/cTrdobxmgH73W4WPpszNwvgv/0+a/GiHg=;
        b=EGMmBwOU4lW7L0cAlbbyswbTUjMk40gaz6McwUeWvWNPRGSxOxBGsX5/Yr0IeqkloX
         vdO33wOGr8MZJdz0m6wMn7CDn3WG1HPYNd4rB8DieTByvWyUdenB4xJy7OSqAanIJDx0
         0fALccsBwOTJGLE0be0b/wrX/vOHXxrke/lcUV56WjT7o2bnUMlGsnM8RqZCiXxll/yp
         QnJ+gaQoJv/vvYXW2MItJcqluz3S8wiL9/73EpSuga0zCvRMdakg/oGvRuT/V4LK39Go
         IIuwcK5djq0NTnTRjUrlxwKLryhudngZrBkfhGRMrGrzEgyPOUXQ3r1E/DWs1ufgAkjd
         tbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJTNuegzmET5xRNhaUUTPXkU72EslQlfRSYvpolNxmE959WEgnyQU4ZbBBpJ0mmtQR4MSxvamPqoYpTHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8TfgYAJc7gKBqm80JdSty3Wiu5Rp+qSgqn3ZnSY3j9s599gQE
	Sn/E/a8mlDpjM34ZuB1NuqYqf+p4yxmS0U98W9AqHMSE1Cfzhl+IIn7qFfWVK3UNEeZ+r42B7cw
	BmWy5AZnhZCInx3MlDF4VOF2Ein/jOwwJ26Y7YwvNsA==
X-Gm-Gg: ASbGncvmFz9AMgWqaAuO+I2au3y1k5xbqIlLJ7GTF0cpJ1E8QFBRzUUa440NUVAj1LK
	OiT6KKp6trOjg9zKVQgwkq8KdkgfDflV/Vaz+8hWyiASqYF1iZktJDLFX6uDumz/jpRIZn7CJ42
	/E7VBUuLzjNgbBVaiZ8CQYo5DipJZNDWSUdDP3KI51OfGdni2dGRmNGy153VqEmuFN0RKoSva9x
	Hz7MarAVxxOmjJEHosa+nfp98JArMIrM41ZEfk5uSHAPA==
X-Google-Smtp-Source: AGHT+IHTqF1JAmNmg2OO5LltznXi0o7wJKri+X2655du84wb99ZGTC9056cINHWh8si0MefDcLENJcuak3msFoGR/no=
X-Received: by 2002:a17:907:1ca2:b0:b04:470b:64a5 with SMTP id
 a640c23a62f3a-b04470b665cmr30691666b.36.1756737581693; Mon, 01 Sep 2025
 07:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901123028.3383461-1-max.kellermann@ionos.com>
 <20250901123028.3383461-3-max.kellermann@ionos.com> <e509a5c4-f71b-4fcd-9776-6a3d39761b4b@redhat.com>
In-Reply-To: <e509a5c4-f71b-4fcd-9776-6a3d39761b4b@redhat.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 1 Sep 2025 16:39:30 +0200
X-Gm-Features: Ac12FXxHU5onUYdItrFe4rtUI2ez9M9oa4kNLp6RrsUlpVm1LJn2X4DtIQLritA
Message-ID: <CAKPOu+-ti5bL6YLfBGMt1=3c6gjLMeBqmHGPD1nQC2J9uU9mPA@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] mm: constify pagemap related test functions for
 improved const-correctness
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, yuanchu@google.com, 
	willy@infradead.org, hughd@google.com, mhocko@suse.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	vishal.moola@gmail.com, linux@armlinux.org.uk, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, agordeev@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net, 
	andreas@gaisler.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	x86@kernel.org, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, weixugc@google.com, 
	baolin.wang@linux.alibaba.com, rientjes@google.com, shakeel.butt@linux.dev, 
	thuth@redhat.com, broonie@kernel.org, osalvador@suse.de, jfalempe@redhat.com, 
	mpe@ellerman.id.au, nysal@linux.ibm.com, linux-arm-kernel@lists.infradead.org, 
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 3:49=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
> Not only test functions but also some other "getters" in there.

Oh, I thought getter/test function means the same for you. I'll amend the t=
ext.

