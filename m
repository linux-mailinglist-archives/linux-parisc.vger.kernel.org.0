Return-Path: <linux-parisc+bounces-2677-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4B99AAD6
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2024 20:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 727941F24183
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2024 18:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521CB1C9B7C;
	Fri, 11 Oct 2024 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1EctFDLE"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26481C6895
	for <linux-parisc@vger.kernel.org>; Fri, 11 Oct 2024 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728670333; cv=none; b=UG57LCRQ4DUG/FFgeAoE70oF9nkbgxb+EYHvVtuA7YFV3BVxLVWRvKDy/6Gpx8XXUntXpr5Jnrmr/9+T4fSFwVkjVQ38Wa640iLxepTXdH76rqVzD5Lb/brCDjcLTV/SNJv/uxRNd3ippbUz8pBSDlQSsPIZys++Ha+zsAysbaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728670333; c=relaxed/simple;
	bh=k69lwKuCACaz+6F8xtdELsWZGwiwpi1uQea4z7vjXmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkrawB6Y2LyJj+5ucH1WPAH4ym5aaac240/O0+xshu/NA6a0P9Ko059czMkqhBBbLEQwdONBfKYmA2YIFNLM7mF/9GveY4RWMjjBwCUcOaATmZl2C67DcEeKXnOhI4R8fqa4PktlXUo7oHgxb2qtcoUJnIdLwW8sJ6Vk3b7Pg4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1EctFDLE; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5398c2e4118so2949e87.0
        for <linux-parisc@vger.kernel.org>; Fri, 11 Oct 2024 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728670329; x=1729275129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4QUEAvuItTJMy94+jKLWqoCIp0W+URFrqf/vG7UNuo=;
        b=1EctFDLEXi2J2yl4fanxv2/HbRaKrWifBk4GeGP0h2fV0R5sCrYW86OS7dimNmyF2E
         9K0kG2DcPpjWfVKqsr81VLeuGEj3jI0DOIkgLZvgfyugGKXX6Eg73EY8IIrKB39NsP4e
         XVe4vnoJBB21olAYGXI+YIxhfeRFih9YGbbYhFVS2VrFqevfebYMoyaX7qPO3/ikeZ7b
         a9IlNVelQT0z0W39uOl2/a+hu3k27Nqb2Nho4NEebkLP4WTpSzvxd1tOAl+ovYKGw/TE
         g/ZUB7xf4/nIrZmMgi7kHD89LBPJTV/fSeucab/aEkhUglNssBI9Lc6FKAn6cDkHdKB5
         6y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728670329; x=1729275129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4QUEAvuItTJMy94+jKLWqoCIp0W+URFrqf/vG7UNuo=;
        b=EqSeR6a68Z9fRm67bpeLSqv5ks288DzcvlcZw6kPwSLsMw+meutLH7qMnT6mYMQ9yQ
         43ZXDj8qtWCuseMwoff4KGFGZ9fQw0lvuY0PsollGCAMpUlFZDeetzJP0W2BXQyEutHE
         qXDoW6gpu2UPRCZuyQ/j8wkt+p0Z/m59wfJs1Fi/5O/8ICpc4QKRff1FZAtW92SiftpH
         lEG7ECodGCvM51mqzgKZjkT7wPoNNQubNG2uzL7h+Pq/ccw0LIydtmBqVgxPIJw0ajjD
         xcceEqAkF3iIxeUQ2d3rY8YdKpRS4OzXLvyKpXPKlBvMZNGDz2iFahZU/YeSgvAmnFlT
         uItg==
X-Forwarded-Encrypted: i=1; AJvYcCXHo2L9tC1Ir5OV98FyU05bQHxLVf5K+doDgVSX/cEiicGyYP+K4FpOL099sjP50lAco5OmPqg1IGIED1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvQLvBCdO4rB/Cd3jQkYYLJQTXaAwofirzZApZlqsGqY9nq/8y
	KO1RJJnS6hU39V0Tbd1ea0ptOFCrK3HyOzf/O1xqRik5MEDq0XCZKhmsLJZkX/h5OY+50t3c9CY
	Ik3nWAefNIXadLVkY0xjXDpGgck21xrnV9jae
X-Google-Smtp-Source: AGHT+IHszcTOAJDo9suMTQpE1T+TwsQ+ZbV6e4c4tPFut+YhcBxxSfRiq/t0zWe2x2NaGNCWK9O+TN7sCAdr7VBETHA=
X-Received: by 2002:a05:6512:2821:b0:535:3d14:1313 with SMTP id
 2adb3069b0e04-539e5e762e7mr28704e87.0.1728670328709; Fri, 11 Oct 2024
 11:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727440966.git.lorenzo.stoakes@oracle.com> <03570f8a0ad2a9c0a92cc0c594e375c4185eccdc.1727440966.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <03570f8a0ad2a9c0a92cc0c594e375c4185eccdc.1727440966.git.lorenzo.stoakes@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Oct 2024 20:11:32 +0200
Message-ID: <CAG48ez0rLrTrNiT93T2fG86w_n+ARRqNxOS6OXGS-Q_V54GjoQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] mm: add PTE_MARKER_GUARD PTE marker
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Paul E . McKenney" <paulmck@kernel.org>, 
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Muchun Song <muchun.song@linux.dev>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-arch@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 2:51=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> Add a new PTE marker that results in any access causing the accessing
> process to segfault.
[...]
>  static inline int is_poisoned_swp_entry(swp_entry_t entry)
> +{
> +       /*
> +        * We treat guard pages as poisoned too as these have the same se=
mantics
> +        * as poisoned ranges, only with different fault handling.
> +        */
> +       return is_pte_marker_entry(entry) &&
> +               (pte_marker_get(entry) &
> +                (PTE_MARKER_POISONED | PTE_MARKER_GUARD));
> +}

This means MADV_FREE will also clear guard PTEs, right?

> diff --git a/mm/memory.c b/mm/memory.c
> index 5c6486e33e63..6c413c3d72fd 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1457,7 +1457,7 @@ static inline bool should_zap_folio(struct zap_deta=
ils *details,
>         return !folio_test_anon(folio);
>  }
>
> -static inline bool zap_drop_file_uffd_wp(struct zap_details *details)
> +static inline bool zap_drop_markers(struct zap_details *details)
>  {
>         if (!details)
>                 return false;
> @@ -1478,7 +1478,7 @@ zap_install_uffd_wp_if_needed(struct vm_area_struct=
 *vma,
>         if (vma_is_anonymous(vma))
>                 return;
>
> -       if (zap_drop_file_uffd_wp(details))
> +       if (zap_drop_markers(details))
>                 return;
>
>         for (;;) {
> @@ -1673,7 +1673,15 @@ static unsigned long zap_pte_range(struct mmu_gath=
er *tlb,
>                          * drop the marker if explicitly requested.
>                          */
>                         if (!vma_is_anonymous(vma) &&
> -                           !zap_drop_file_uffd_wp(details))
> +                           !zap_drop_markers(details))
> +                               continue;
> +               } else if (is_guard_swp_entry(entry)) {
> +                       /*
> +                        * Ordinary zapping should not remove guard PTE
> +                        * markers. Only do so if we should remove PTE ma=
rkers
> +                        * in general.
> +                        */
> +                       if (!zap_drop_markers(details))
>                                 continue;

Just a comment: It's nice that the feature is restricted to anonymous
VMAs, otherwise we'd have to figure out here what to do about
unmap_mapping_folio() (which sets ZAP_FLAG_DROP_MARKER together with
details.single_folio)...


>                 } else if (is_hwpoison_entry(entry) ||
>                            is_poisoned_swp_entry(entry)) {
> @@ -4005,6 +4013,10 @@ static vm_fault_t handle_pte_marker(struct vm_faul=
t *vmf)
>         if (marker & PTE_MARKER_POISONED)
>                 return VM_FAULT_HWPOISON;
>
> +       /* Hitting a guard page is always a fatal condition. */
> +       if (marker & PTE_MARKER_GUARD)
> +               return VM_FAULT_SIGSEGV;
> +
>         if (pte_marker_entry_uffd_wp(entry))
>                 return pte_marker_handle_uffd_wp(vmf);
>
> --
> 2.46.2
>

