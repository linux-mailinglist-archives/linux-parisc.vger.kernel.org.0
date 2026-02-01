Return-Path: <linux-parisc+bounces-4533-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M7yIk3Nf2k1xwIAu9opvQ
	(envelope-from <linux-parisc+bounces-4533-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Sun, 01 Feb 2026 23:01:49 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B5C752B
	for <lists+linux-parisc@lfdr.de>; Sun, 01 Feb 2026 23:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18FA530038D4
	for <lists+linux-parisc@lfdr.de>; Sun,  1 Feb 2026 22:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEEB2E8B94;
	Sun,  1 Feb 2026 22:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUP16xwB"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881B82C15B0
	for <linux-parisc@vger.kernel.org>; Sun,  1 Feb 2026 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769983305; cv=pass; b=WUM9ZwGPZZ+xwAigskJE1e3F3QIMYaI3ToQI2uJLV14uNNieAb6QzczhDkKjNYQWY7AyWvY0ckjhLFCwObXtC1NDERsWQKPgtfdSJm0jBWg1WesakG3rDvZr5s8hDRGEpbLnWEF7dbAp0HPo0yOm1671Qbg5BKZY7VojccluIS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769983305; c=relaxed/simple;
	bh=wl7Jk6JsU5yKG4duQoEsXxxYC+OIwiJhzlKIg8HfxyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsMc6oZA8MqTkv/AdA8BOEGynhKoLzgs5jNt1dE//ORQajjBo2Jzd9QzZmn5hxBYWuQFy3ubTB8+XFyqQeUaxiWhK8FQJdjhzJs64Vv//3NFKUxW+9fhzo1UqDHwD4oMtOlCiocntf2wgMqoZoMt2x91EPrLD8HCBC+WyPL9vqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUP16xwB; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6580dbdb41eso5832185a12.0
        for <linux-parisc@vger.kernel.org>; Sun, 01 Feb 2026 14:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769983302; cv=none;
        d=google.com; s=arc-20240605;
        b=YnM3tyigrY1yIWoiqCUL7JnJ4HirqVkvPVyZ/4QSD6i4o8J5KJTSNvO2qJQk3yyPf5
         ewKfEf5Ny2dKbJE8DFnP09BQP5POfxz74eYZ1c620rUV6etrAVL7/dy/334FiiN59t5G
         mOIflGQ+ht0lF072ZWzFecVROSvM7g61cDd505/jYjqYeLUMOcSGIXExF598L5gAX8++
         gvhDrPW8YVYFltQhYhgdyU5EHmW1VO+j38T8qN0M3RZv6xoNd73pBTA8osmz/TpHAk1J
         6SAVfIesHiFT7wHzQuIsy+uletkKgJmVeis8JPvwrAIdDUOkXTXj+qWp0lwYZUJuzC11
         NK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        fh=orEK4is+hxBL9Mj1TgqTvWpGIWGaPUorxTluAyWFBXo=;
        b=anzkt51YJQDJo0RONXpUP2sE5Hu+y2CSF/ItxLG+5WHSpd1+1Zt6Y+9J4xyNB9/DPU
         +IjGL6n2cc+ha+A7AoC5cIK2nP4cUBizcA17Gn7QzNZll/jn08mNhETIa87LlXLq34Dk
         LtsJ+/0h3P8hN0z9aPOG6WIxAbpulKBn5gkfEfe/iuF1Mm9KLxTQ/AxZA/QnXPqAe0vu
         YZw6foDqKWdlNejLSGcGkdqgebGkzLeGYw9tdLkF777v/SHXY4rGcKn6+n8sNcwzTolV
         ci51RHtmfvIYto5C60JSXL8AJek4XMmZWKdHTnsb/0IeABMfzctTn0roYVUn2GJBtagk
         5K0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769983302; x=1770588102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        b=YUP16xwBByuCeANUpL+tqGPZtwW0ekBJQXjxvYHrQ+BVuJhzXlLPUbdngsjT9o0vf6
         uYUmzrEUKPWDyYwqImODBU03rkq/5q2r1ZRse77/5jbzZ2ZbdPfRWoEgDFXi7tvZQDib
         KKiwOMyTyPNTlE6DbDFUXbRkge9P5LbCelPWFufvSIQsld51sSM4Eb+aQDvPUDu+HqZ5
         c/EuzGYP26bua1tM6AhlMjxuishxSbB0C/tRmJtMEllP01kG1m4La3rFduj7FChnHhy9
         DMXci+K0JH5BarH9OsbnSb+egVIt1mbKSHqf6Rg3thvWSqfOWPIJWg6A+uJuZWSkOoYT
         3FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769983302; x=1770588102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        b=mMghLpiq+gRkj1pSwGbd/dK6fB3gzy5PzmnVSFeZcWcrm2dOUQCvIU9e/AAWX3oDsY
         Y7OiburBwX93NN6/PwECNaqgs4Ft5XLdA4nW1nVkS83ltUbFl2nWCVThlylyNGXYml5k
         3fQiJmyUgV7zadvXAV13n3P1KfovJmarWwS+Ym0bt5luGsEDsFXtp2ANydiqzwTEp4h3
         llxOKgtluYDFFIlaWoHhdbKFLpv/wLUlcgmTxsZk2NMB6NE1KBoE3O7Eoy28WRyH/Kcq
         9mGZx2nrB0iaEn8Zg490OVZ1BKRb6ZYDZD0QYFV1TKWxxPj1dTZqIw47sQ4ZUgDdcTWO
         Y8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfK2hk07tWDJFbQ0FJNFahJ5Un0SxyEuhpPMwqvlOhKOMwVSH78aAZlAEH2ekPDE1yBwlVWh0hDWevki8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyq/Fo6+tzqJAvtruhfipMNFwoH+zW1POQgztya7Q7mw6tMsmb
	tvwUC4A2Cm98N2Ef+AcunEWFgs3E1/us1dDQNit4Is/z9DQNGzddQnqceT1Wi8GqtPpTjMdg387
	UO5OMGxIOkMzWPkCrkO5+DC2p6EE3eIk=
X-Gm-Gg: AZuq6aKiBfG0/XYbI8Uo4oTZ78Y+5ae462Wu8+0TTfcxJitFeOAhbYoN/eZSfNx2a3W
	/SQ4Rr5/NK36gs8G5Tp/FskYotE9pdAJyPjgPrag8YGgxH4wOc1JBjeQbmQhorSCpbchDOx3+1U
	LStWDm8tbik7H3hP+Le0s+9lS0PlmfyfCSAV3VrV3W9pX4dZksfBEHgkfPlB2PCaUHCJgpSAswn
	ZqZsR1jQ7SNCPGdUFipuxMa5C8jQi6/54827esaWgU7NyYrcIuwkZyGRQ4d3vxSgyFdSbbN/m0a
	EmINnXWz+1DfdwH2fyCwJNLaYavF
X-Received: by 2002:a05:6402:90b:b0:64c:9e19:9858 with SMTP id
 4fb4d7f45d1cf-658de58d61fmr5598076a12.22.1769983301701; Sun, 01 Feb 2026
 14:01:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1769515122.git.zhengqi.arch@bytedance.com> <3380f40a89b73c488202c85f9a8abf99fb08543b.1769515122.git.zhengqi.arch@bytedance.com>
In-Reply-To: <3380f40a89b73c488202c85f9a8abf99fb08543b.1769515122.git.zhengqi.arch@bytedance.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 1 Feb 2026 23:01:30 +0100
X-Gm-Features: AZwV_Qj9VNkT5OuGD6ka3IvGbnZ780_iMCZkDjCZeudKZ-RrGhxplhYBmunMjcY
Message-ID: <CA+=Fv5RhxvyxKr2t+pHd1tbGrK57P-+b3pGe1nVaK_OLiFt2wg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: david@kernel.org, andreas@gaisler.com, richard.weiyang@gmail.com, 
	will@kernel.org, peterz@infradead.org, aneesh.kumar@kernel.org, 
	npiggin@gmail.com, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-um@lists.infradead.org, 
	sparclinux@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4533-lists,linux-parisc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,gaisler.com,gmail.com,infradead.org,arm.com,linux-foundation.org,vger.kernel.org,kvack.org,lists.linux.dev,lists.infradead.org,bytedance.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linux-parisc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-parisc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bytedance.com:email,linaro.org:email,linux.dev:email]
X-Rspamd-Queue-Id: E24B5C752B
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 1:16=E2=80=AFPM Qi Zheng <qi.zheng@linux.dev> wrote=
:
>
> From: Qi Zheng <zhengqi.arch@bytedance.com>
>
> On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of
> empty PTE page table pages (such as 100GB+). To resolve this problem,
> first enable MMU_GATHER_RCU_TABLE_FREE to prepare for enabling the
> PT_RECLAIM feature, which resolves this problem.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig           | 1 +
>  arch/alpha/include/asm/tlb.h | 6 +++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 80367f2cf821c..6c7dbf0adad62 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -38,6 +38,7 @@ config ALPHA
>         select OLD_SIGSUSPEND
>         select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
>         select MMU_GATHER_NO_RANGE
> +       select MMU_GATHER_RCU_TABLE_FREE
>         select SPARSEMEM_EXTREME if SPARSEMEM
>         select ZONE_DMA
>         help
> diff --git a/arch/alpha/include/asm/tlb.h b/arch/alpha/include/asm/tlb.h
> index 4f79e331af5ea..ad586b898fd6b 100644
> --- a/arch/alpha/include/asm/tlb.h
> +++ b/arch/alpha/include/asm/tlb.h
> @@ -4,7 +4,7 @@
>
>  #include <asm-generic/tlb.h>
>
> -#define __pte_free_tlb(tlb, pte, address)              pte_free((tlb)->m=
m, pte)
> -#define __pmd_free_tlb(tlb, pmd, address)              pmd_free((tlb)->m=
m, pmd)
> -
> +#define __pte_free_tlb(tlb, pte, address)      tlb_remove_ptdesc((tlb), =
page_ptdesc(pte))
> +#define __pmd_free_tlb(tlb, pmd, address)      tlb_remove_ptdesc((tlb), =
virt_to_ptdesc(pmd))
> +
>  #endif
> --
> 2.20.1
>

Looks good from an Alpha perspective.

Acked-by: Magnus Lindholm <linmag7@gmail.com>

