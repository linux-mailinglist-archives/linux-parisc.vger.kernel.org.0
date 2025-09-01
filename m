Return-Path: <linux-parisc+bounces-3953-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F4DB3E822
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 17:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDCF4173121
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 15:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0576834165B;
	Mon,  1 Sep 2025 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Stosj4/A"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5302130E839
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756738975; cv=none; b=TxHLdSAOnZwubrTKOTlcMWmIseli8VAe2+tCdI1XIp2l8J/1YfpKI68WgoAylKSq20hyC8XRMujRzTHC7lKYGuPB9opdO0jqYKwRivQLpt1+6Revp1QSyKuMomYaAGKD4U+WzSgMObRoKVYuoaOdd5tEGhWSQW48reFKy6ioKFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756738975; c=relaxed/simple;
	bh=VGz5s3CgG5oZbwfB15yu/ysF7dSGyM9kka20nq6+kjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqH3inlJoFHgH+UELLcpwRjr8WrCChdjsuaJ82uy3PpNVHy++5EfcUxjfwi6qCjfkpGBnDb/Fr3d4T0AveL+OJ0MTR+/jjniHUf879UYxnVoTlSNiARfK4uzj8XumuZc4EzWfKYjFD0XF29P9OKjPN9RSMlTkbsnJ4nZkExCgf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Stosj4/A; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb78ead12so723436666b.1
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 08:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756738973; x=1757343773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGz5s3CgG5oZbwfB15yu/ysF7dSGyM9kka20nq6+kjg=;
        b=Stosj4/Aq8oxFTo/ihuTjbA+4h14ygVQT2Vf3seTTjcfK1EGSTxLiJycvkGy4ZyMoU
         UuJxeAYE9u8W27b33iGd/Bdg8cFCGz/B5skbr9E/lH5WCRebN+rF243H9EE7OUDgc56j
         0o0z/j9f/kqJVKgLaDDaDw9jlvsUczS6Ncjk9alHAju3nvtIU8LVmgCDxE8jjs6jD/2x
         zXolOkwsMN1k5Mb3l0poWo2hHZxLaVzVU8biozCFy9xcOIfHMwbbep6S5ZTEdxSlUELX
         xpE9+65K/5q3c/ZK8xnWhTROPQoG39E189LT9qFoCkqjF0INIDFTs2Ec/R4UEa0NXk15
         C/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756738973; x=1757343773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGz5s3CgG5oZbwfB15yu/ysF7dSGyM9kka20nq6+kjg=;
        b=ID1y9vkSzlWuXXCWEr/TUZz24YvDW8CRuB98U3N0r1/tiqO++kTSpUAE/wtkrbcDiW
         Ycd9f/HDdjJKtU9355uR/4nqzezRqvK1gOVzPOSv/E0WC/dXcd6FFNrm1R+1V2bf0oxB
         p/3tfs45J5a05seH57twkavYOARyCLs4QgIVhYwfLZLFxKoVnbVXlVfdDjGcC96AMREC
         ozQIKFXFmJiXK1UHpayVqRW5y1ntCJ0ekAy6JQrBwdSnAShRewUGZtq9Cgo+UGnfqh0r
         93ZjrJXRlaSVOtGgP6YDrOWggPEW2dhUr4tvls/fg6vc4R9vuNXG77Ax2qzyMqJBAlQJ
         AoKA==
X-Forwarded-Encrypted: i=1; AJvYcCWN+dgWhpLrqoffTwkxNNiT96+QgfpE2yYwykBXxLlReHbuy4uLuZ20AbLYxGrqhXABzuegnDwT5knJH1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57M/xmoYaE/v6dlZ8P/+E9l9Iz4GYhv+ug5bQR0RI7deaJOX7
	XRJH8qm38dhCSuQ7hV4mGzFeEWjJoEZ3qS4OVwarpk72lxjKpOWnbWnpnq/17Jxuk1A2xYzrcR1
	v1HOuqbRrXKxebQtfRgJtW54F2q1BW8jsRTWP+rReBg==
X-Gm-Gg: ASbGncs58VWAXxLDD/QhVfvE/ZLF05TSumRLfhYUbDFC/3jJEXfkLP4e26Jp8yCGjbA
	MHQvLa8RJhPFl0qjIhln+Uas9zG56j6KA68CpO3Gim09kgGvPPTT/y7sAeyLjyxNtaF6RC1Ypem
	dvKZc8/RKkwVBEJY9xGqtlv/qFAsMszk8KOJMz9HBloICjHHJJdAR+wO2wkDD0rVPcY+2CZEE8s
	/41EfvbZrS/BsqKHnSSYqY7QIHRtFxwgvs=
X-Google-Smtp-Source: AGHT+IFezK1h8zD4ulbO+LoYFx9UJvceg5e5MjfORD1cX6aK9EX6zhmOpTUVOQiq+Ui4qjbP7WefWWIq7O/4+eTMSZU=
X-Received: by 2002:a17:907:3d42:b0:aff:d39:e350 with SMTP id
 a640c23a62f3a-b01d8a25c91mr803197066b.3.1756738972529; Mon, 01 Sep 2025
 08:02:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901123028.3383461-1-max.kellermann@ionos.com>
 <20250901123028.3383461-7-max.kellermann@ionos.com> <ce720df8-cdf2-492a-9eeb-e7b643bffa91@redhat.com>
In-Reply-To: <ce720df8-cdf2-492a-9eeb-e7b643bffa91@redhat.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 1 Sep 2025 17:02:41 +0200
X-Gm-Features: Ac12FXwscizWLWhMN1KX5yHTr-lGd0ZaL5gCF07LzPcgk8nWDqkiCbWTaVe_QQY
Message-ID: <CAKPOu+-_E6qKmRo8UXg+5wy9fACX5JHwqjV6uou6aueA_Y7iRA@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] mm, s390: constify mapping related test
 functions for improved const-correctness
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

On Mon, Sep 1, 2025 at 3:54=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
> > -int vma_is_stack_for_current(struct vm_area_struct *vma);
> > +int vma_is_stack_for_current(const struct vm_area_struct *vma);
>
> Should this also be *const ?

No. These are function protoypes. A "const" on a parameter value
(pointer address, not pointed-to memory) makes no sense on a
prototype.

