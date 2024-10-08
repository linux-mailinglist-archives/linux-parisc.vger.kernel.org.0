Return-Path: <linux-parisc+bounces-2581-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56941995165
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EBF51C2169B
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38181C2420;
	Tue,  8 Oct 2024 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VqafBGIA"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FDF14EC59
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397357; cv=none; b=fuxdHjJxLeevudtx3cOYhFasA4SORNhJ/7nx91+abd36Jwfv9fOgwlCcIHZka2uA5zOcYwQ+MUGBUThB3/9SBD65CfmufEO42lWsS8rifno3l0HPY1UA9Zaxqgxrh7hHKEJ0LYZYQYC9fZl41rqDbO8WTyeoqK9klTF/xZq5BZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397357; c=relaxed/simple;
	bh=+MYfQr2lTMmUw7ZpsvC5mP21rlaA9zcVVs6XAvmLKm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nH0RBYf6SWV8ryIK27SlowvTtwUr/6qIO5A1SKShCY8zRxwqQiLFZ7Emg9pxG0REC7zbe3IxLKL9uPUKwN0a6WxtoFkQR0QfQnuQZOd/P95QHccdJn/mUqiuGINfRxuHaUIB2297t0kSpG2w0Qwx82M8XuebTcnGYfgs3q0rSn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VqafBGIA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d3297b7deso452399f8f.2
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397354; x=1729002154; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mIOwIE4dnIoolyLpGLimDS0AFNW4u/gKwOEM/yPvXxA=;
        b=VqafBGIAeiPt4bkmqU7yPPdPTYEyOjJyl7AOZnuZXdAfq2H0zKaKRZMQ2hX5WWy9LL
         vBXnsrmqrrIBOMnAC8wh/3ZuxVYyJ0LOHl0Uvpe7BYwtMlrsFlFPRHDHMKLq2n5oG6GV
         Q/XaCd4EssGASNxlDwegEFC5z3+3/L15KTZSAog/mp9SMfdoWZPGcxSbxFLGUhIeMIu7
         T/2f1bplMYTOgWTFvt6CSkYVMQByDXP5VQWugct/5st6fWQVdjygvhc2gRvrb7jKYzjg
         ADTJOyfzMxj6e0lO2GOYL1+l6ArbO2zqM7qaJGhOyHFoE70eQumemTdLP8R1enk2KF16
         OTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397354; x=1729002154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIOwIE4dnIoolyLpGLimDS0AFNW4u/gKwOEM/yPvXxA=;
        b=EPWrUZy6aXVtayFVgb368Bmjv1NAbjkAOaYwXneTDO6DIz3QLH3QEsxXJLNp/QL/a5
         Op192iJ6frH9Im/Ebx3LrOgd3gUqLz9/rUSpOQSarBSoC3GG74ZJ14c+3Nt609Yhz5Qf
         BQ8/7yqNB4wv3I2sLnU8OEd+4Z2GmUs16TZTaeaPQ2tjVfjZC9B2rkZFrfszTic1y7Zh
         6g5AmVjnY/ySwo59MfyBMtcp6A+lscWC/5yDsDDpjwYJvgHqLMrOKcr3VRWazlHA3uvn
         fTEakVeZQZbGTgDV/jlNBnoRgqDFtsvOwYpxFkW58acI3FD7J2keWgLz5AyP9q8WnJ4w
         GRug==
X-Forwarded-Encrypted: i=1; AJvYcCUEAwM/fvJo/M6Hqv5VLHm+hWDodJN08I7uGTlttpZNvzLpcY9+bcdDr0tkqXYwkpAVdykJqcJ2c3jip/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhWoetWKRA41fb7KCeoMmAFjyzvr/DAtvu8HElcsmdOr1z4mst
	O/z6kRCACbJ2uumpA9xSH3G9QxbyHp08YF9Bfjcd9QxylXVWYde7zWa69ixEJG2J0QDIRYZhd6d
	7DGJJN772+dSQlMdZC/FNjTx0TnfXKAKX59HobRnJjTEPG6fI
X-Google-Smtp-Source: AGHT+IG4DScf133UOLJi0v/dH7Dlw/hjpi7mdUSEXGkfcorU2vYoBNYxL3zcPhTqtqhDp7hvPo1uf/cjZhw/yLcgu+8=
X-Received: by 2002:a5d:49c9:0:b0:37d:3759:bb8 with SMTP id
 ffacd0b85a97d-37d37591daamr704491f8f.53.1728397354228; Tue, 08 Oct 2024
 07:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-21-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:22:23 +0100
Message-ID: <CAFEAcA-vpg_Bun4r5=e7mghzWmh=rP+AHup9drQqzqjz4ON40A@mail.gmail.com>
Subject: Re: [PATCH v2 20/21] target/arm: Add arm_cpu_tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fill in the tlb_fill_align hook.  So far this is the same
> as tlb_fill_align_first, except that we can pass memop to
> get_phys_addr as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

