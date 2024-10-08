Return-Path: <linux-parisc+bounces-2574-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B679950FA
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFFC5282044
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4181CF7A1;
	Tue,  8 Oct 2024 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zP3CsrS8"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C160C4C97
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396293; cv=none; b=MdVh5vcCZi2Yo0PmSUFWa4sFDHdaT99I7K3kgc0pqFG+CDat4wkRlFPm2XorPP8cZ1uoPqGPU0hPH4+mChxYhIcX3PM3ylJDD2VUIOgd47AGPo0HzHU/RwEPqqLJQn4BqJP1Zn6gVH9ABM3B9FqnGW7qlrNBm7ZfXXPi/G1Gzn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396293; c=relaxed/simple;
	bh=RQaE50LUrnpu8jfADduQ/ylKoRSy99OUAkhuVtBbLS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxJouDgtZTNIwONkg2Gc1HutrJJDbO6DQY26UrZRtmJfbXA3ldjlALGw4nvm0JNVyzRYwt5IHg1Pu8Q13O6qgUyr0vit6cH+mxfFpyXTX4ws3zoHX8q8Nz7hm0BzRpjk6g3/m87u5xUQ9yrhzfrj0hDsTygisCPuVyZ/ydzgdwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zP3CsrS8; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fabfc06de3so62304851fa.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396290; x=1729001090; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qlZ7kynNNkwRnX79N2/XULKM6T4JjrNnGdfb2QLSUeM=;
        b=zP3CsrS8A1LLHYPRUn/gfUdyZUC0CsiVfF4wPMRxAd9l5vH1SM9Lcc4OjK127QPKbu
         Md0X+QKnC2pgB6ms5FfK/CV5Fnfuj6wyrEWHZpDL5IQ9JbCktOlXsm30Bm709enPNrsR
         oSqkNvbtODn4N/YAwByIT8nzIpE7gSByZ1BNAR15/BVYFWI4qboixS1LgfF5GsL9TCty
         Iaz1PeWVlT/SyYW3ron79pVQCLIXXs+nXndgl49NdyvP1gNAw8i9vjAGi6BHOzlGDUh4
         axlZJlTUb7cbumgG0BEFLnNKWG7k4KqLLG1K11fKBivQ7VD7ZDoyHLB1scwxSrD1CejT
         rYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396290; x=1729001090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlZ7kynNNkwRnX79N2/XULKM6T4JjrNnGdfb2QLSUeM=;
        b=GVxmF6QJeH0e9jlCyAGMuPhOc9GkPpnXZDy52JD9RRa60yvOzUFYUD9ezdLTuGj2ZX
         RMLL+pGaHpvq2IbFSnJXQ3NmbEBgtaNqAWFPQVGyraxdAIjyerVkVRJT5NI5JHYlgTbW
         4alYB2jYrwz7UHr5IrXUGDHwTHwjzDzCFmmeMPJxTAa9jfzWxlw9xESUqgFsbxEH3IcA
         JOg3lZerXvkt8ATR3u/ztHiCxqYrFjK88J69Q5dh5JmIg/3EyisC6oH+RbblRqVGaas1
         FnjqHtJPkYQQZwKXMSJdIs1SoWaaNrFVqsS0E/nmcmSA2LU7N0RZmk3Zm0OJs+Ok8mTR
         FxUw==
X-Forwarded-Encrypted: i=1; AJvYcCVz0XziP6K8IpFRY1f7DVmnzqRxFSIo7f7LrKqc5OHnw1ReBX7hc8GHORXOTMpY0QQJTUrlj8Etcv0hdJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFRhdxn1V+cBtA58rwwHnJ99w23kxwgguurYwQSb6wbOLtFcr+
	572pu0/PYkeUey0rFY5PpPyUItWZdx0YzLqouIAU5pcq5G3i/Mqlx307RbNp2Uenb/U3WaJSvzD
	GI2rdQIFL5DgCWQTUTySobzg/mz8kKoeyXXry5w==
X-Google-Smtp-Source: AGHT+IG5RlYXNeodhVLGDi/7fTEdmhf55OOWgTnAe+5B6xjOHVP5BpVmse45R1Lu4UuYqVvHbs+dftA15Kb4+IdNUoo=
X-Received: by 2002:a2e:a584:0:b0:2fa:fc3f:d606 with SMTP id
 38308e7fff4ca-2fafc3fd7b4mr57722201fa.22.1728396289753; Tue, 08 Oct 2024
 07:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-3-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:04:38 +0100
Message-ID: <CAFEAcA-RP3ap-ofbxFZbLuy0CXeDJQPYSvv2SAkJ-1LvtAQEWw@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] accel/tcg: Expand tlb_fill for 3 callers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 33 ++++++++++-----------------------
>  1 file changed, 10 insertions(+), 23 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

