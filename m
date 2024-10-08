Return-Path: <linux-parisc+bounces-2580-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD9D99520D
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C7B9B20EE2
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB4B1DE3AE;
	Tue,  8 Oct 2024 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yk/BpIyb"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CB21DF75F
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397343; cv=none; b=jIVjh91fr9qIn8X+7VJwSj2409kxsi9llDNjnLwLNXMsJLtVz2y66Yq5eDXNKOe82eDpB6w6ngsvMbae3HBFiKtWiYoXyybZWNe/9NRm/6VDsdcjQEltd1jc59KkbvXgsxtWla5R8qtlS/RAkM8hwlRDHmTIEmKm6I0HbeBkhvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397343; c=relaxed/simple;
	bh=fPPLdCmsgTlevaHEdztmQcEx4JuBznECKL7nmP3CT0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXw7PL7tBv+E8HhBiyljWee/8b6OaAe9AH7I7p4Wcs6xeUPJ3lwM9vWMRUaJR9oFkWMXpXo2I0jf28CYvJY5J+2dPPs02v+AGcYP4g0UwpQU7DW7pNa6CEPfXAyTvhSDEoiXAvNBr1tj6bHYL3g+S84Q7pRyIT8Dlnq9Nj92Gsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yk/BpIyb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso79455451fa.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397340; x=1729002140; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BvfchHhPQ7gPGGaaZHCBCIR40F9CMJ0dK6KyV3qWO4=;
        b=Yk/BpIybRnd4vvvCt3FLPt8DiEDV0krEwOpe3GoDIn92xfS64tJNT+78Lfp+bavdXC
         eN3s3PbV3jgn6oDKM1K5B0tnvVxDuPRzRZujsk9b25RUlorBS3KBO9M6DPMdMB9grepU
         bmpwtxF0/QcOJehiyT0AabSrxkmr7ntqXyZWCI0NPPwxuI84OtW2n2Cdcx/H7Lzke80L
         r5NPiZ3KLk5sv2rxTwzsWQ6ju4E2WZ+O3fs1lj71rUVmd9mhkJpmA5aOWDQEohyAO82a
         bREg7j7+qHC3Fhsa1OjsUD+BG+sJDU8eF1tmOEF92QRq1GMGh26aXOtmxYORrZmA61vx
         3RCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397340; x=1729002140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BvfchHhPQ7gPGGaaZHCBCIR40F9CMJ0dK6KyV3qWO4=;
        b=sdYjSe1DvZHegMW28fgzuoskB02fEp/57eqEf0XYyY4x6YzpYsxoe7UuiC5xiG0THK
         oGj47yFz/erNqyJc1rLhKWjAQv4S2pZCmrTSAVoxy6OWHjCxHGLl/rV771TSzRnk3vq4
         dpFwkEiuWx3o0nfXfxGDAB8gPj33I2ze+wsONO+CYhK4r8cLVfLn0yqDtqrEY0I4/mwt
         mB50VdE6z5mlH7w+u/QFgu1gImp3kk8wKfsC3uhbeosvhxCY3im/znRmy2KB0F//akrn
         HEXH+3pOQ3JikNH9sFqkSBWRLXEtbUqV5sY7bBYryy5uG1ILtoZ94voan0ZSkG7fiEZc
         ABOA==
X-Forwarded-Encrypted: i=1; AJvYcCVxLTgwpuby3YE7a2xiIeEmV7egivEt2qAWWZJSyM6da3mUrwsyGBonlhsTSRY28cv28WR9E+kPuWU98Ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVdphEKoXX4wmYKevmV//3sx8LwfaW/AhP1FWufAHOA+R7pCLJ
	U9Mze86ZZLqJ1JQeVDHeIZwyi+mnucUDNjWQtFA+/lGOs/q+V/KH54f0fE2u4B7IS/Bkzpsqozp
	dw4uZGPsHDGNU4Z+cxrWd7s7XEC7r1l2gCadC9ZBKxAqCVInP
X-Google-Smtp-Source: AGHT+IFmXQafHCHVn3GzWhEybdP/4UqbZi2jbsBme2sr67s7c+XRVtVA7FWeMDnget/zTThstcHM7ovYa1KlfEOyvNs=
X-Received: by 2002:a2e:bc0c:0:b0:2fa:d4ef:f234 with SMTP id
 38308e7fff4ca-2faf3c0c07amr109766201fa.1.1728397339598; Tue, 08 Oct 2024
 07:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-20-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:22:08 +0100
Message-ID: <CAFEAcA9ATUA5Y-Pz1tqaPoNrSbpqL_+Ag6YB=gN3xQzKhpH1TQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] target/arm: Move device detection earlier in get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Determine cache attributes, and thence Device vs Normal memory,
> earlier in the function.  We have an existing regime_is_stage2
> if block into which this can be slotted.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 49 ++++++++++++++++++++++++------------------------
>  1 file changed, 25 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

