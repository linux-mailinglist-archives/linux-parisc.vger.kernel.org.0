Return-Path: <linux-parisc+bounces-2583-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8D9995191
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8CA1F25762
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6291E0DC6;
	Tue,  8 Oct 2024 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jL9LYgfH"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60761E0DB6
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397470; cv=none; b=Zsul6DCe1p/mr/2UuHZK35TL8f1Ld0gcbR+7fUCok+EpaZWqBtzuEpJV5Wricex9YObwhqcc4gPCLLUNkvHh3uL6LWs5QE1ty8uThTKvGxuaHy0g+PXZKjk4YBVEVRqa1qX4ebXQ2BAMNhPKQ4emnG5Y6qKNCQZJKZg2Oy2VjlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397470; c=relaxed/simple;
	bh=OYqhcY15CDsjXW+h02zV3jeH5s02/5VL9kMzZDVxRCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5PJTwmbqtfK86XeergnSm4f5u73HZirMRa761doOyM89a/jTFabeZ+Bn0eTHrOEY3YkSjWEeDwv52oVFx2L0fRWvFpBL1FS5tfKF4VgyNDFiZpveYlpSypUtA+Sl5O0p40/JrPdifRfloz1AA/NAJgT2oSy7DVzzmQGj7u5B2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jL9LYgfH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c721803a89so7696640a12.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397467; x=1729002267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4aiC/7up85pu8OiJPObcHH8gZqfcYf+jIO69S39Gcc=;
        b=jL9LYgfHNfZzNFquBdtyXOxxl5d5u9gAijH1LvWSpMysWs2BiQpbwBJ2MPOta9764N
         51e9xBPBKRHFpqriyAJmi3EQf2TMclIy+hv1cmCDcQ87JNd5xpKn/nbaeKkF/42/aZoh
         2Z2ICzYJcZEtdsmxTBGCwQsEeXzJuuwgF+ctUwxPCUKeLeT68ZM2xO+z9LbgGh295YER
         ISsjezjH0qCoXI0OvD7Ui05Hnw6YWNkv2JRpGhoPbgnjTBYpOYWzxVcddBGUvi/AfiI3
         AVv2ZNflpq/Lg+eVIzHoPuSLjJCd9DxwUHcZWjIIOyMLcocyKPHAvMjPAEyiZItgt69x
         Bo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397467; x=1729002267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4aiC/7up85pu8OiJPObcHH8gZqfcYf+jIO69S39Gcc=;
        b=B/69cIBohfPU3Z+hKYBWN7ZiFBFyy6JNEhBfEnGb42eZfwQAblqNW5jRqIdRUsCoGX
         opDNT6xKQPGghnuwjMvojYiwjeXYSRQvgq0y5gRwf5Bv5ClHtX/kJtODImuElex9atG7
         o2PjtngLYTDKVCJyMp7x2VG8YqG4LhbOvXjB11Z9q5kxifBwvI+N6d6Z9BCoDi5hOLX6
         Z8d+r8E+vtrfYYVqoYvRQU2y7u5EAt4nzHShbxztXNvu1d+vky6y3pl4BD3YdB9w6J/a
         0uAKAW8Cxz7s4RRJNmNG6VMPHc64aKFTR3S23yv9SgeozCa8x1SyoBYAYfJExhzpYvA1
         cjog==
X-Forwarded-Encrypted: i=1; AJvYcCWZftntYlrfKLzaCfivELM8AuWT2ok7eN7N7W4fCWwYlXIibRRGEfdv/4610V5luSeV+/InjgQtH59e4ig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+Ik02c9royCx8Vlqlw0qwGyOXhGXZzMBNEMtQn9p5MANqVep
	OfU950MvFkmHn5ZTAcYvl/fDeHUp/K7j9eG2xtFbqbLM46kTdvcTHMHd8j5o44H7sDwTIw2NW6g
	VsPAdsjsdbGhyfzFsZbx3oq/wvreAKCvFeDf+dA==
X-Google-Smtp-Source: AGHT+IFjmaXftKW+6p8dHDnPmSfWnXvCGIMLOzreTCd39rQv0liiKgCkuBl94L1p1zuof0Lcc7z7N+hK0iYL5rshMJc=
X-Received: by 2002:a05:6402:4286:b0:5c0:c10c:7c1d with SMTP id
 4fb4d7f45d1cf-5c8d2e71be8mr13160085a12.23.1728397466890; Tue, 08 Oct 2024
 07:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-19-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:24:15 +0100
Message-ID: <CAFEAcA_F5V43XofxAOUCdnHfU5_xArJucqvWczJqi8eqgKREoQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] target/arm: Pass MemOp to get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass the value through from get_phys_addr_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

