Return-Path: <linux-parisc+bounces-3950-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C890B3E7D5
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 16:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF903188263E
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 14:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5401330DEBE;
	Mon,  1 Sep 2025 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="N6IgICCA"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913852F1FFE
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756738266; cv=none; b=eYoVMegFrauXjoiAR7BowItQJArTu6aIHk7KGTNpU9S6cJwmobkeqVGLlzrZGzIT6RuQ46QJKR92YLDBwRgG6xhNrr16nOkQlZDgI8frZ5+p0J2MqJyTfIECoIFJJxsWRp9MyjEakpmC7F1O/Ms5KRqBG7g1oLzirEL8DNB+UAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756738266; c=relaxed/simple;
	bh=JMFdiHPLwPv1+gLtBINWH78t6YBFk5g7hlH1uky4h3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbGn8lxlR6WBpevHw1EVpy59f8S9h+WOV+pIbAu1fxewSbDF7N5toerZR7DXj8ym2khsf4lBvBh6sIEBVXQjtqwXpB4UOeZzhE9DDa2YgOVyq/H4xvtR3AklgSeipy6gytIddTPYt74RR3SVhZmNMTYdIMLdJJHp30MFvyAU0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=N6IgICCA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afefc7be9d4so490788866b.1
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 07:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756738263; x=1757343063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou2wtlN8PDWTGj+LZ1aCRhABiZ7uTVFHZhzB51NR+RA=;
        b=N6IgICCAmvICqyz1QZVXwn9zdAPkQ3RxYExpHMX7aHn04rvBwoMvru7QwcAsqxf6tH
         h+egZ8BcufnW55evIN76YXIirKK1LGiLx5FPt/6vrAWk82Sc34Zlv51UgU9tGOiTpgsk
         +3M2IuLcSNH0UkFcyeg/BOTpMAojqqIkQ9LdZQ1FtUGgy4PhD0BdrS5Im87V/nA5eSYo
         DEjCCEG9GxEaQT/oMCVRufvirj044CI6tA9DlQTQlV0d48wIpI7S0Yaj7V7wo7BOT52d
         YL/cfpu4Jph4Pcr3Q2W7cbAeJLzna3z5IeX5/5YT1N8fSAM0ShN+4EZa/YtzoxoUY4A5
         0rIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756738263; x=1757343063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ou2wtlN8PDWTGj+LZ1aCRhABiZ7uTVFHZhzB51NR+RA=;
        b=eH6UqmMzMVRjAnLt+UUZXW21JtZrovMN0TXGiZwadEde8r4lZ3KioURACpRkorLNV9
         /nwX4EWmqe5WWmXU6zTkPFEC6zU1TSOWvl8hNNUwQLyxMU0/KyN3+w7pxoW5yX5fPG+2
         gFkdnurTnQGwtUK2UfG4IU27+gccvtWMLCKJ0uAoi04HeiBcwa8Ijmcf8ned3pG7zFIs
         pZQYr2oiUAr7+QDJfFO0XAH64UgTbJilI4qL0HkzVQkMwLz2fW9bgJBfVOpu+MdAx1CK
         C1+ELeSrkSNQKivcpOrxVkogeaMnr5OdH8nu4dFYUlJFXFtHT8jsGzbgtfFptsVW3CIO
         sKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVHjukePmTpwe3e2SAs/iWmnG8wYV+VEbxVqsThWBmvgrxCXrR8KBfSQ7TfzZZREe7V4dmsi8PCdf3s6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEFDjsCk3rUqj+KuQXcAnjIMsrLTN1gXrsIaMXJ+Qv0sEF21g1
	EU9SeZx8IKoYiAhO9VbxWsJU39cttVYg4+/OLkNXcr4gIMkdxquGRzzw2XjW475ZMyBEHGHEtcj
	Tge4nQQxb8wQyBuUIXEu8COHYs/3yOEE1SWgsqjwH7w==
X-Gm-Gg: ASbGncs3juREOpboQLke2OWl11POKw8NjTaigD7U4TotFOlQ/xRr/0uYToiwcX2rvoW
	Hu03jboMXhqaffaTsi2ue4x9Fi8eG7ayaAHvZgIPw0Ovk2iPm2PfwljnhvDFxHeO5LU+SXXLof1
	5bcriys90KREXg5suqtGz1xL4CAITs896qTTrzNOpiJgeh5ctcjLCDFaFUZ94BXo/hmiwcGFnp0
	r3lQAfOOhdqs7YC0c/nE99gPMPc61sDviTE/QSueaJfIQ==
X-Google-Smtp-Source: AGHT+IFqo0rWyO2Tzcdh9OXq9LZuz+iBrgY4hQc2106202QGZ76zZ9E9VZRcm0Gdr2Fju1hLpDpwI4qcelZS2+NEezM=
X-Received: by 2002:a17:907:60d3:b0:afe:8d25:770f with SMTP id
 a640c23a62f3a-b01d8a26de5mr847287566b.3.1756738262736; Mon, 01 Sep 2025
 07:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901123028.3383461-1-max.kellermann@ionos.com>
 <20250901123028.3383461-3-max.kellermann@ionos.com> <26cb47bb-df98-4bda-a101-3c27298e4452@lucifer.local>
In-Reply-To: <26cb47bb-df98-4bda-a101-3c27298e4452@lucifer.local>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 1 Sep 2025 16:50:50 +0200
X-Gm-Features: Ac12FXzHZvMcadklQ3Hi-QaCR2-dPItzNryZ7uqKCm4rMw8McLpdl959UlJ37Wg
Message-ID: <CAKPOu+_aj3wA14VaZo8_k+ukw0OafsSz_Bxa120SQbYi4SqR7g@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] mm: constify pagemap related test functions for
 improved const-correctness
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, axelrasmussen@google.com, 
	yuanchu@google.com, willy@infradead.org, hughd@google.com, mhocko@suse.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, vishal.moola@gmail.com, 
	linux@armlinux.org.uk, James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	davem@davemloft.net, andreas@gaisler.com, dave.hansen@linux.intel.com, 
	luto@kernel.org, peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, x86@kernel.org, hpa@zytor.com, chris@zankel.net, 
	jcmvbkbc@gmail.com, viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, 
	weixugc@google.com, baolin.wang@linux.alibaba.com, rientjes@google.com, 
	shakeel.butt@linux.dev, thuth@redhat.com, broonie@kernel.org, 
	osalvador@suse.de, jfalempe@redhat.com, mpe@ellerman.id.au, 
	nysal@linux.ibm.com, linux-arm-kernel@lists.infradead.org, 
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 4:25=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> 1. (most useful) Const pointer (const <type> *<param>) means that the der=
effed
>    value is const, so *<param> =3D <val> or <param>-><field> =3D <val> ar=
e prohibited.

Only this was what my initial patch was about.

> 2. (less useful) We can't modify the actual pointer value either, so
>    e.g. <param> =3D <new param> is prohibited.

This wasn't my idea, it was Andrew Morton's idea, supported by Yuanchu Xie:
 https://lore.kernel.org/lkml/CAJj2-QHVC0QW_4X95LLAnM=3D1g6apH=3D=3D-OXZu65=
SVeBj0tSUcBg@mail.gmail.com/
You know that because you participated in the discussion. In that
thread, nobody objected, so I took the time and adjusted all of my
patches.
There is some value, but of course it's very small.

Note that I added the value-level "const" only to the implementation,
never to prototypes, because it would have no effect there.

