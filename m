Return-Path: <linux-parisc+bounces-3891-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE0B3E0B2
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 12:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1B9D189D28B
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 10:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA523043A6;
	Mon,  1 Sep 2025 10:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="fNcld9ts"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2C2580DE
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724095; cv=none; b=dvAwF8v1XvIvyfECCSKZDoPf8ih/a/PJ67lbRCs79D1uqiIwMUFwucDsE71w8s3bXAOQESOwOlkeieIcDpBXvUJIkPPNwwnyXvsth+w76TnFS8XK1TSXYg/WosxlBGs/YF/S2N3Xzdm4Y7buprpq9Hv5PfzWMKxAlvK6sJ2YQPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724095; c=relaxed/simple;
	bh=Y0cJUednc/5M4WDwpNxVBOifAr3cOm70FaB8K31QTbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVar61wdel4XfOzP7484Jt9i++IFdhMIq817BTkauCc0cPV4UTrcaZwmcRuvuvqou6VJu9YAWuxGUaBhmZsBgDZ2Xf/9yWOmDMR0llz2GFJ3exmeEkcXDB/oFcF/3YwVLrEnAnjmHAIkhDBptCNaLzp0Iath9rfEqZfNtFWcRYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=fNcld9ts; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b04163fe08dso217186566b.3
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 03:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756724092; x=1757328892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0cJUednc/5M4WDwpNxVBOifAr3cOm70FaB8K31QTbM=;
        b=fNcld9tsrQfkLBARj/8aLwZfvILorXEiwVW9i7winHSNA0uL0Q88gBn6KptClTh/hk
         deRtm44UyHeKHzJ2EPW0rzdWZ+GpXMyMl0FiYV42iNI4QPr1AAb9fki2Xpt6PeGYnoEx
         GhXcXTnABFhSxolBd8GZ7vvhnvY+140d3889X98VNtc8HX1Vl3Gslk+wOYZxwmzPybN/
         5i6ZRe/Yh/98jtIxHENQcea/tYXbcnYQAWxlqMRZlRwMmOHS4NCIqFfOz6tnagIe4V3V
         E8i+qymJ5N4CFoI9FrCkNWC7L3nmCIRswL+vvZjYImcH0uf4VWbjFZgsVw13PAOVUgfx
         VhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724092; x=1757328892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0cJUednc/5M4WDwpNxVBOifAr3cOm70FaB8K31QTbM=;
        b=Fe+h41SXAoUTTEtfXaZzKroOY+wqVqmhHIdcI4nHaGWq8MUV5ledObH/C/kKt9zHzJ
         B2ExpQx/vfe5Nq1ti/GfYvg0EK1mZYhuDL8vbPsUrbsZwZTEAAnnw57IDZ7DQ/Vatkxw
         xWaO6mksFvWlfaXk6VxbMuz7xNlZTMNxp9dtVFleVpBjoayvts0uJ29bPioVuvRU5udX
         Href0HL7xJPXwnaxaoewoXPhU6uuz88Lxucvo85cCU5BdEuCOUwMPf0I18V6Y6x0jQBE
         9DD5X0SMOTgXIeXy80Bx2RAYVlPX4xCllUX1CEP8etdxDue+a3najbhhzHtdHFIf2gap
         RoYw==
X-Forwarded-Encrypted: i=1; AJvYcCVHJNbimq/ymeB3v3X8JfmleBp+gcE6cWRYD2aGFIUQvWAYISJCzaoZJbJUkGkEjQMHbac89itaRRUXzrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6oe4vazsW4vDhUbAuVykpfAN6biK5K2ZWzh1D1GxJJeCXcJg
	6JA3FZ3xy9IDnDsND9ur3ReK5CtqkYT9EEEcGOj00CNCtAL3yl/Wvj0DsI/vFch+KF/28zGrYow
	g/xEe0fYHGsqDIXvM+Ud5h8rMGWMMdwgerQnD3dnu3w==
X-Gm-Gg: ASbGncvFcmSC6HCAjtKoUxDXkagK45GJsFDZXlK06QBqcCO7afD4JpLjH2Rnwq3OM4B
	wLNoUQlsdoMsVzVk5z00kt7zlrAk5h40qgftGYgyWeEyQ9uAAz24GDUO5Kbjo4OoEwK7osTGKEx
	KQvpVunfutFNm07FHrqVJBlLhGsoPJnQdwSo066mZtmB2DwA8CBDbUoripFC0rnRK5dP6ZP6B0h
	E2tWa7EN+sakINfvyg5ibrIEHbY8DuPEB2xVEkoARnHrA==
X-Google-Smtp-Source: AGHT+IErujEHTbrp8kr8EXUBMZI1Sefo257M2ZPpsFs+QhTHhEsC5J8bRxn273glh6y2fAFm2YbZZ83e+kTpefkb8iw=
X-Received: by 2002:a17:907:3e08:b0:afe:a4a7:df95 with SMTP id
 a640c23a62f3a-b01d8a26e5amr703688566b.3.1756724091540; Mon, 01 Sep 2025
 03:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901091916.3002082-1-max.kellermann@ionos.com>
 <f065d6ae-c7a7-4b43-9a7d-47b35adf944e@lucifer.local> <CAKPOu+9smVnEyiRo=gibtpq7opF80s5XiX=B8+fxEBV7v3-Gyw@mail.gmail.com>
 <76348dd5-3edf-46fc-a531-b577aad1c850@lucifer.local> <CAKPOu+-cWED5_KF0BecqxVGKJFWZciJFENxxBSOA+-Ki_4i9zQ@mail.gmail.com>
 <bfe1ae86-981a-4bd5-a96d-2879ef1b3af2@redhat.com>
In-Reply-To: <bfe1ae86-981a-4bd5-a96d-2879ef1b3af2@redhat.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 1 Sep 2025 12:54:40 +0200
X-Gm-Features: Ac12FXxbsfem92CYCNntd3O-eNuFX0uYoorx93G08GlL_Qka4oUWgjKqGl2mAAE
Message-ID: <CAKPOu+_jpCE3MuRwKQ7bOhvtNW8XBgV-ZZVd3Qv6J+ULg4GJkw@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] mm: establish const-correctness for pointer parameters
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org, 
	axelrasmussen@google.com, yuanchu@google.com, willy@infradead.org, 
	hughd@google.com, mhocko@suse.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, 
	surenb@google.com, vishal.moola@gmail.com, linux@armlinux.org.uk, 
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
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, conduct@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 12:43=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
> Max, I think this series here is valuable, and you can see that from the
> engagement from reviewers (this is a *good* thing, I sometimes wish I
> would get feedback that would help me improve my submissions).
>
> So if you don't want to follow-up on this series to polish the patch
> descriptions etc,, let me now and I (or someone else around here) can
> drag it over the finishing line.

Thanks David - I do want to finish this, if there is a constructive
path ahead. I know what you want, but I'm not so sure about the
others.

I can swap all verbose patch messages with the one you suggested.
Would everybody agree that David's suggestion was enough text?

