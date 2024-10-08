Return-Path: <linux-parisc+bounces-2586-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FEB9951B2
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC6B31C2564F
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C3B1DF997;
	Tue,  8 Oct 2024 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NHzmLKl/"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670E21E04A4
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397617; cv=none; b=eYl28OFv0FXNj03+85tU1rlUsUl8IpOWT0d/iwiHRm81yjsl2fHO93W9x7rOcOsz6RpFySVr4+hoG/eMv676F4HSZv0xiK7Dq6sRvmKkZTv0/PbNx2ebLVKI0HeVQS1hAy1Mo4Hb8vxGXihMSLa8POyeeoe2ZhO1jokMK0bnPnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397617; c=relaxed/simple;
	bh=RQozRerSiRfKC4vBeczSbk4ogjlVq89iod84xYTjpH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnlEFEiLa31JRSDTBnNw6QbtrOc4L6z/YkyLYc2Gt+Q1+WBsYTc1b649pcxVfSGCorHYUFchIwmtG3DKxtdAezY2MS5Og/ikddOpFba8tI5OxR1Lsa0SwEQKIYSWDJXf3fH+avsY+9ghpS0q1SLS96KqRuvkUzImYLP4z/h2xNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NHzmLKl/; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2facf40737eso62906201fa.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397613; x=1729002413; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RQozRerSiRfKC4vBeczSbk4ogjlVq89iod84xYTjpH8=;
        b=NHzmLKl/TwP7PW2pJXtuGHIzNi7tnbLnrhaq1Kr1VRNAFdhNj8FP6jPEIBlW73pu0a
         tcTsUznUmLleAS/I+sLNhtPkVb6ddCWNxjnZZnxNVc/T5yk4u6TFgJ8tQbNZIXLPWsqh
         8w3oNiGwBhzpXIU0HMoQwcyI1y3vr49xduwrubGvWNw8Wz04cWQa1zSoVQaZCBYiXpk8
         SHyPzCoyd1FeOCf7w5ZdthfxDf4VFfSqVJeFsh3tyVK912DnMeQQ0fdSXdOWrzPY6chM
         5xZpLCk7hcjbiuuCJ1QlBFWcQOxu+4LA5I8LISXPacEPCZq6s4L3iSE133q6ix88TuRN
         E4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397613; x=1729002413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQozRerSiRfKC4vBeczSbk4ogjlVq89iod84xYTjpH8=;
        b=Nvkuw1I7LEK2V8l+vpfjqg0pppGHDmMlF4fJrrP4r5I03XVJJ8jGEh3hw1TB2FWtzy
         Rl/1LXdoR6NSwTyVvnFGgDuFwAozFjCJyTne08jAL9MxBBWloevD9xZucS9Fr33+Afuu
         WQmfIrF7LSU0BFRCIBxvP1rESscpTggcq/E1/RL+ik7d06YjN6v0Nhy5XV6WEZobSg8H
         L4+Ml68mLcD3jyaGXNa6UwFgWFmQXUO2o/sFSEHYsSkWKhehpoF5ZrBJw3IGjiD/uBAl
         XuI/+EM7Z72lKYBaZlaziWqQQ7ef0plUTl7axefEjs7tBcCRATvbjwaO/M2sZkRMMgIk
         ObOw==
X-Forwarded-Encrypted: i=1; AJvYcCW/OyPEUDuX45eWwD/mSUDSLrCwPD9BvIw4IcnD0mEPONSZzLmLv15S7Rl+nJEZ5sQgck2RPhxt8CV+47g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS8hgY/+cb7mNzgJnao/4KdJP4ZweSnF7/SD1fqKP1xxy/Eesu
	Cu79W8cq+lPVI+IaDecWqUIwYyLh83Ptt0pmosyeesqwbRKtUc+DmvdYh1okDmI3fJu+ZieNVCP
	FAhdAck0+mLTQjDyWT67eaUhhPjdmEP4PHqjOig==
X-Google-Smtp-Source: AGHT+IEK40RZGPZt5Ym42R8l1+Af5CABSgiP3N8qQETkX12gAxA9awW14sA1GNRaKGIg0p+kd3F0YmluVLQN8uT/C+o=
X-Received: by 2002:a2e:be90:0:b0:2f7:9d20:3882 with SMTP id
 38308e7fff4ca-2faf3c63ec9mr87028611fa.22.1728397613383; Tue, 08 Oct 2024
 07:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-16-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:26:42 +0100
Message-ID: <CAFEAcA-d3MHj=_Ma6MHLGLT-nW0iKA9fV7C7gmK9pnG-9NXZcA@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] target/arm: Pass MemOp to get_phys_addr_gpc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

