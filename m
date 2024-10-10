Return-Path: <linux-parisc+bounces-2654-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7B998396
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Oct 2024 12:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18E771C23170
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Oct 2024 10:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B9D1BD003;
	Thu, 10 Oct 2024 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6PcOpLK"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B081BDA91
	for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2024 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728556317; cv=none; b=G2VvchigARcpOaztevNaFWxXxnMCW7MjWrs7lzDIoij+Ca70dynm9WqqliJY5rZi54LyPWc8nSXo9RgMO0KyMje3F8etBUlClz3HOv/lCqFauOllZA5VAkqdtQRuulTlr2ZrpMxnHzy8G2UySzbM/k6eC70QdiBK0DfjEan/ags=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728556317; c=relaxed/simple;
	bh=0LZOpfnPCcp68MIasYaiUGhBk3Dm791pvWTNi5xdUG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2q0yGLG7Ba2QVddPHw4FLFDKr859RkW5YYFk3y30uvT/nD1V/7EqyHJt6Wavg7QFFOLU3iqPcjaqt58Vuk6fxgjuH0AOlWrhnRD40osCwD4loc/E5PUCPZE68ridRkPAbslkRMtOmTIEX0CZ5NdzZ1n93EeAKS86Y0zZLojm/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i6PcOpLK; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so816687a12.2
        for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2024 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728556314; x=1729161114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H1G+pjpLn2GOdI+rwjFTLXfPNvFegxvIu0XfXLq6fzA=;
        b=i6PcOpLKejBodxgadS6nxqpSj2RSF8trgT5nY+f62IV1WdZjUhSy3djDU9UwnSUtJT
         MY8vu24taHySZh0OYi+F73MukAPRmzkDjmp5+kYYxF4yqQrWcZ+l1rf2DlzvwbzMaod6
         28tmPMTI+bgzKEcfCwlBxb2enl/hJcfEue/txrrL1MG559SRmazFF4Nzd0jeIQOP8k0T
         8ziDupkqXGgEW/DS+zd6WaK2YJJBmCQz1Cfrch7hTKjpDmGBR74PEn2vBMCD2e532hkI
         u+uqHdkCjt4f49XuIw4GAzS6+WFGYH2kP3ubxeUPcurM5b1v0UITfZpZ+KPD7SBNBxiq
         HuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728556314; x=1729161114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1G+pjpLn2GOdI+rwjFTLXfPNvFegxvIu0XfXLq6fzA=;
        b=YTMvi20gHhP1D83rMDDWM9hHT/SbAVuZCO0NdtcNViPvCg3pNs2FkCudiMkWWtsgyt
         Y77D7xKDIpUV+ZscvbM0u+Z41G316lOfL1pgHOZPpAKrCcagg2wUpyeQj/m8uZAoey2Z
         vuULMAZpcWoICkyLUtqawhmd6h6k14evucn1auOTappt+PpxCgrebEwG0kvANATKgYnF
         iQCOHFMhDx9isyLUqwReh+kOOAvg7o2Tn0+Rn5k/iCOH6iYpvLuh5a+tlMqHj5xrg4cv
         9Ogah6kdOV2L36uUhH0f3tWtG6aVpfOsWfEY3ZzzIUF/ig9Cb7YB3i0sK/0dxU68aRzH
         /kHg==
X-Forwarded-Encrypted: i=1; AJvYcCX3JnsvqS1ENazLUTFNoTj00BG4+JyuzIeqJVpoydXYHMQ6OBJnnEe4kZ7n07/4gr8PhNit3HJprXHiH2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwctvZR8ZsRMeGmiLlI0LhiG7VskXToVA22kcxRLEemY1vyKuc9
	PfFXmvjwE96Ownub2wCUhS+owi5BK7ZAUOPuadBYlPnHZq7oJDfawGqAc3z8JOj6PfIN22/8bqu
	jflRjZebycTTs23k3oViXDvJ8tyKvAgK7Ss7PuX9AGXR+Z/m9
X-Google-Smtp-Source: AGHT+IHXWCaOuM26uI4vYxRXMejs44Sq/vl9y9MIMUEOp9FtK2w6fzGYcpXyhYXcgFA771r/xnv8Frul05iB2+FclDE=
X-Received: by 2002:a05:6402:2712:b0:5c5:c447:e4c0 with SMTP id
 4fb4d7f45d1cf-5c93241dddcmr1744450a12.4.1728556313592; Thu, 10 Oct 2024
 03:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009000453.315652-1-richard.henderson@linaro.org> <20241009000453.315652-6-richard.henderson@linaro.org>
In-Reply-To: <20241009000453.315652-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Oct 2024 11:31:42 +0100
Message-ID: <CAFEAcA862FYbm-Mojww38m2n8SqWwKSHDr8irLbj9--TA-PJyQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/20] accel/tcg: Add TCGCPUOps.tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Oct 2024 at 01:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a new callback to handle softmmu paging.  Return the page
> details directly, instead of passing them indirectly to
> tlb_set_page.  Handle alignment simultaneously with paging so
> that faults are handled with target-specific priority.
>
> Route all calls the two hooks through a tlb_fill_align
> function local to cputlb.c.
>
> As yet no targets implement the new hook.
> As yet cputlb.c does not use the new alignment check.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Other than the typos Helge spotted

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

