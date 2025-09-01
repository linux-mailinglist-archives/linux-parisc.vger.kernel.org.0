Return-Path: <linux-parisc+bounces-3956-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCF9B3E9FB
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 17:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C75B7B020E
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 15:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C88334F480;
	Mon,  1 Sep 2025 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="cd/cMr3m"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFB4320A2B
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756739598; cv=none; b=QE5ZZIBf8C6mnNxJH1H9qbAiskKgV+Vkrz3p88QkdI/JEjhHMpIz+Andng/w+B7TAif785Uc7hjYW8uGXZJT/m5V1A/gdSo2i22718XdhDnhQqsiyB+4lx2bin6tQdIIOLm3WkzjdfJ6YE5lc7oEnfZglLBwxVy69CwmJBhVtpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756739598; c=relaxed/simple;
	bh=A08kBdKHaoJbHo5ouUdZLXPFTzEYHeueCSYh810eJqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XrzJyE9720x+Z+tBgh8KE0IYQNTWbNdsI95SZj2c0xCw8BPUomBYJT/DngTNJLMijLta0sveZe0ICfSJeAr4S10EPs3/421u/FubOYQt5avlO3rGLl11VJ/77Ww8d1a4fNLyqvZZovB3bt4/4j+tPqvT3fDb9kEm4SqhBBftfIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=cd/cMr3m; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afebb6d4093so742149466b.1
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 08:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756739594; x=1757344394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A08kBdKHaoJbHo5ouUdZLXPFTzEYHeueCSYh810eJqo=;
        b=cd/cMr3mBFUKj/l85MxxINGe2ZL/wWXCouUOLF2P7u7Sbb3G2TSO+T7MMjaT92i8ib
         xVVye2DysYNSVHq8tJ6lKA4Lfe2j0OP/3aSBx7XrTl+MRwh75YHhMdSJp9YYyfIHRO39
         Ac9SPC5f1PEpMwBCrIbTUQfFNA7/0Z1pB89UOn0AWo0ZV/a+e7jGsUznoZHpQ+8lCHN6
         celxCU/rqMtV7FgC/CvN4UVi2u3gRCZv6iXKZLyDlHC0rFJR2xSaHcZV3AVn34Oi4Har
         ypZu2Kxo7s7oPnvu1oreYhxXi7Igh14F5/Iifs9vIPSXDKTC+a/3Mqq+6OB11kxfPlUU
         R08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756739594; x=1757344394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A08kBdKHaoJbHo5ouUdZLXPFTzEYHeueCSYh810eJqo=;
        b=DCt5VV1HoAYJIzmz0YM2drfWGTfyWJpbUsYcMuJ1YN9h3TaIhM1daBmiegz5uLIepY
         WqrnCq9AIqmInh2NDTPhkP89AwHUk1hUW6l54AUeETtQ3oDP7/Wh0bdX4BT4LjhB4OdD
         hgMQ8E/xBbMAtyNQW7LTX9tG/ob8eWEe5pgX8qzVtmJaPpIO1R1i2t/bK89jHJ1wudfI
         7w1O5MDl0FTjh+iM2VZr8sB95W4HCJJPEW1x07p+/0KWU+6EhqYB/0UZwhRBxLqTvlPV
         XG1WNVN9zmZBfIKJBE/UDE7gKo/aJxJaorfGEAOmD0JK1s7sHA6O7IW3wx0GveTZS62h
         O/UA==
X-Forwarded-Encrypted: i=1; AJvYcCV41Ma0WArnF4RDD5qqSoPimIaJhXefYEFoowdVwN9SImd7lqdYGxqufQW4HZ755XDPu04SQsqS4FwiTiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjSLwK6z1cq0N4YqWZKNglsvkzdRm2akP18ppJiugKbRTZIPE3
	NPWXP1ZRvN31Mo7XoiDlZuYXFE5iJxhtIO5QfiDwCYU/T2ZsChBOW+7zwraW6F09wAYZAJzoVxY
	gOa3gGZJsYLcmVWWiSIhnC6T78MddEPzuZmzkb/nHfg==
X-Gm-Gg: ASbGncuz4pliDT/tTAGOnQEK+7TFqAc1VAwfEc1b6EpiR6pEMe1wcs1KDMoRuuR034V
	qpUCzdeavb8WiPOkQb7iNiwVukky6/lJK++ZsLgzztAuoyCATu9FPyx2mFFEViEpigT/8NANASV
	KEA1MDZIaGCJBMsZEPzN8/dujYPlQaS5nN6ovbSfuROVkiEetjWjpp5+ESFqBLi6HmZGJIlPdzk
	NvqvtaIAJgz0CzSzn2coRaGytlj+vPGQWkIwBU3fGErhg==
X-Google-Smtp-Source: AGHT+IEFPWeGuNqM2+QiOgw6fHvRg/b0a6N13KZkb/trfYqooePyXBS3syenI4NwqPjQnySBBQHmRMnR+cpdOfOLUuA=
X-Received: by 2002:a17:906:9f85:b0:afc:cbf4:ca7d with SMTP id
 a640c23a62f3a-b01d979fe6emr930093166b.54.1756739594447; Mon, 01 Sep 2025
 08:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901123028.3383461-1-max.kellermann@ionos.com>
 <20250901123028.3383461-11-max.kellermann@ionos.com> <5ff7c9bc-1722-4d8a-ad2e-8d567216a4e4@redhat.com>
In-Reply-To: <5ff7c9bc-1722-4d8a-ad2e-8d567216a4e4@redhat.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 1 Sep 2025 17:13:03 +0200
X-Gm-Features: Ac12FXzpx0s0QI5qZl1CeOcQ-w6EceVXiGl7R5sUJVErAX6WQ0b3KxehR5HEiuA
Message-ID: <CAKPOu+-zBstZVw4LjKz7ZQyTh_PKEJXaWYsgF0-E0+shAaTvwA@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] mm: constify various inline test functions for
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

On Mon, Sep 1, 2025 at 4:00=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
> Also some getters hiding (and functions that actually implement logic --
> folio_migrate_refs())

Indeed; I mentioned that one in the message body, and I thought this
was good enough, but I dropped the word "test" from the subject line
to avoid confusion.

> > -static inline int folio_lru_gen(struct folio *folio)
> > +static inline int folio_lru_gen(const struct folio *folio)
>
> *const ?

Right. Added for next revision.

