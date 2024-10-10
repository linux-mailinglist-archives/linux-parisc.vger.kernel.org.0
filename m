Return-Path: <linux-parisc+bounces-2657-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A6399855F
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Oct 2024 13:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 314E41F21794
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Oct 2024 11:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEF61C245C;
	Thu, 10 Oct 2024 11:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWqPkI8I"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C861BE23D
	for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2024 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728561281; cv=none; b=slkJLMxqaHMRAdAAjmm9yku/ttzwV7wB3VQLIqlxxR0UcR4qx0oKMDXZ0oJrCIHSmiN7tWLwHuKGwTz2gg2hjibLNoG5GdbuLZ/Y41DHG4gmfdsWhCfTv84WaWFoqLd3BIM1k+/2lNs6aUmgcVpNWKRk/luLlBEziLmBsfsAC9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728561281; c=relaxed/simple;
	bh=AWSNiWMTsEs1ptZq/ehphP9FugqDgLn15xp2ZJmE22Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJImdU69feVtNcnQdsvgK5aA22YGV6p3YAHzbOmiWSl1fzAXls7/7XQPHUm+WaaCZavMNG6wjSbT3Q/JXWjGiCkJfIPURnCspq2tzvKjwnJluUyLwFvIai8+d7ES9e4A+cOKj1hYIBgR8lK1pOW/2OOpIAXsm0EcO3eKuVjcrWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWqPkI8I; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c89f3f28b6so1076308a12.2
        for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2024 04:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728561278; x=1729166078; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Sns7xsmeqPOQZ2N1m+ivw76fAsG/Ttx25YK//ondvE=;
        b=EWqPkI8InjJuhC0h2qWlSXxJ0bn2IdMofIPQDKGaNZhACbI4q7MYx64eLjQLpD1ktv
         u7Wca2hVMPqW5YZ0UGpoKwoZK+In9s1r5P7u4Cesbx5R7VgOlBZBOc9Im3u/5zpxy0EI
         /WWweH49zc7TdiA+LIaytpFwtPe7783FtUNP7fLyTQYy2CiFKoLb18SvE8Wi0H7vrmHi
         yW4qa+X4PbOth08v7Vo/w+auiMahA8ZmVqhf53SOhk2+iGz0AvrjOhp7QTeJNsjyvkA/
         M3p9cKNxeFTKsMIC/+GjaD9sdjrpF5QZgbJ47VZc2LIvpC2X9PZAv8zbvQJiGJo56E1I
         WBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728561278; x=1729166078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Sns7xsmeqPOQZ2N1m+ivw76fAsG/Ttx25YK//ondvE=;
        b=LczvUx3QFvw+KcSu6rumPECtow4RgnNmYrjiV7GmEfkRLlM786WJ1naBXCx+HsOvhk
         BmA7wlo7vrcCLndMvbRFok7wG5JfciRJWTU4BggW/Nh+sfLVPVuckS57OMAxzD/dtf0u
         DzFoCwxQY0pa+BjcQFlNRpNagVLfyhhD0mI6nBjTBfwDCKtwbRJgDi5lXoGV0gugB3/z
         wONS/Ka/AvkNaXZ6AQ7W7I8jIt1YiAM11qAbMkIy6nFeYTB4ot42XgIADAwY0wtbkw/5
         sJGbqZpazrSZEl71rsb7XNZLN5GtYrH3q87sfAPfsgAX1/4BxCVDUTGL82K3vzsU3Ww8
         t2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUppIzlkm3VOT0eGYc+bISI+zBwIOCeEN/TxAA8HNqNeEzSQzBVwsYPHFXCsjxeNGFDwbSZINADvVWCH/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNQEo4BPbSINPhoDDiXDmxaaWRdUNGWXgYzQzCKiIEAHUpahgZ
	9tL8uxt0eb43haLURl09BFP+aiX8OfQ66p6izrkXyL8G/TkIrnGWFYZhsqfgXEBm48bcyvz1NYu
	35cAd4awxw5BzksY3h1wqg+l8vomf6AOqp1d4nQ==
X-Google-Smtp-Source: AGHT+IHlzPdpIM+xZafDveyx5hFZBh1GFLt91YGTshVGwJuewegfJ0kE6/lX8niCegw6R1ub6TjBDm7VFgL5A3dgYr4=
X-Received: by 2002:a05:6402:3513:b0:5c8:79fa:2e3e with SMTP id
 4fb4d7f45d1cf-5c91d6fc258mr5034904a12.28.1728561278443; Thu, 10 Oct 2024
 04:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009000453.315652-1-richard.henderson@linaro.org> <20241009000453.315652-20-richard.henderson@linaro.org>
In-Reply-To: <20241009000453.315652-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Oct 2024 12:54:27 +0100
Message-ID: <CAFEAcA-azLR3SdjR6_+aJ0EkWW97mQukacHABHxWj+b7mQ0OxQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/20] target/arm: Implement TCGCPUOps.tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Oct 2024 at 01:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fill in the tlb_fill_align hook.  Handle alignment not due to
> memory type, since that's no longer handled by generic code.
> Pass memop to get_phys_addr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h      |  6 ++---
>  target/arm/cpu.c            |  2 +-
>  target/arm/tcg/cpu-v7m.c    |  2 +-
>  target/arm/tcg/tlb_helper.c | 49 ++++++++++++++-----------------------
>  4 files changed, 24 insertions(+), 35 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

