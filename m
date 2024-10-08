Return-Path: <linux-parisc+bounces-2578-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA0099512C
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 466141F27731
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED411DFDB0;
	Tue,  8 Oct 2024 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ts58UsNK"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA0C1DE2AE
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396776; cv=none; b=n8MYwmG1nfTKCtV4Yk4AjZRWaCda5i4UXv9yuwXKWs/0fmqVxiCcsfyY+tEb5yxeklbwOVEkWM4OPOUUChbZCwUFYkyc9q7y9XM/DC2C+uRMIbR9jkqgvLszrUxow51mZ6XjnoFL+npCc5Pf+zU9Yeuwj1bP5n50dj2Y7rJeATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396776; c=relaxed/simple;
	bh=9u4CSSAF1j/t3co7zL0vXNRQV6X0XqEaoTczvQ5jGXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWXYiNq5wgPgyfz7lF7IAX1Nz3jcHa4gCtn5KGc/Z2QviqqlMfVjTKEmmWV4VvvJypHOm802uSVXJIGqCfKApQF+7gP+/z+7PkNbahMt1ll4JjxXmNc5dau2ASqSc8QIlwFeqSQLK89ttR+w5e3yzEwPiV5ghy8zsR0/nntMDF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ts58UsNK; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c883459b19so6651917a12.2
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396773; x=1729001573; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1lXif4RUJBAa4Us8GfRhA66sgDxsm7TrrGS+Pr6tRns=;
        b=ts58UsNK0kZEvbtIyAkJvdiJiDOr3LOAvCHDYuyhRxFjeWcTqLqP3IpRF3hspDX+l7
         LUiHhWYnMeG1sYcHHWjD0rm6HuVh6HOPutRMJSYOuzpxNK9TXLnZF6MKhjLuV85wiAc/
         BdcijPQDbju48U/Eft9QQlyxxAyEFlR0ivo+tb88M2diLceoOSozp0efa5lBPSGa8/Z2
         Uguna8pDUwsXmoxiK/3qqCFl0AYSNLUkxXUkkNIyScInJOMQxl2o6Whj7p9mv8HFmr/m
         Sv/hbCzSb1kthhvGKN8zJcSsmhJFtE35QyW74U9jsZOtdcF2leJcEOPRIFVIEUCUXoKE
         4rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396773; x=1729001573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lXif4RUJBAa4Us8GfRhA66sgDxsm7TrrGS+Pr6tRns=;
        b=wcxDCgTYFHSCnEIWHcbY+KajeyTf1s8eXVapAcLWEzfRSoJKt/CD6g0yFTcHwJqXIo
         yGn7MsLSr4LLMbpeSLuOFNDkrLNFqtUD/vfhp8MrbTFDNa0veh//8+8xROycqc896d1G
         wzjXfQg4CCyALx82zStCpSpmWqBEPl+6O9in5mYt/sHUsXTw1nfiX6gUl1/9meL2LVuO
         JkNSzK4o6XbYfhxRazUgnyzc2zQHtpus+A0yoopffGMGTQM7GEkiiENMG/gyuVhn2QdB
         eDPfq4MedCfPaztsni80+RxcLz5DAGCoDWKc+2Uep0y6J1Cq3cT2YsYNlVxELaMOYp+j
         fITg==
X-Forwarded-Encrypted: i=1; AJvYcCUewi0FRXBgukxYLB9apLQJ4NDRbDgriQwaQvPRL3XoPl++w5a5HVx3mkthkvjAhaF1N6TrGS9e6y0nE44=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkA49R7Iw/oGeuTRqaUFnv6lpHiLB6dX7xFmcXoCnxSTqmJgq1
	1ZqE1Vs2QGJox88APSHtDJ4X5kzylTf/WBvo5PKz53EdautcQAkyeyw4xgx1oa5WVicgC6WfGj1
	U/Y79/j+1gsA1EP66j/XtgtXJ7ALk0wc3kmq6Dg==
X-Google-Smtp-Source: AGHT+IEcDc2sIhY+0z9mugT3adwi3ou7mwIvwU3589KDMI2IU3RWaTS2embnO91yYcHNIouo0MisPyWHIBEyQYrQlQs=
X-Received: by 2002:a05:6402:4028:b0:5c2:6343:8ddf with SMTP id
 4fb4d7f45d1cf-5c8d2ea0879mr11698041a12.33.1728396772504; Tue, 08 Oct 2024
 07:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-7-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:12:41 +0100
Message-ID: <CAFEAcA944zo89gOGhn8Axdi4P+vWqATo7qGGEEMDcwPyAD==7A@mail.gmail.com>
Subject: Re: [PATCH v2 06/21] hw/core/tcg-cpu-ops: Introduce tlb_fill_align hook
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the hook to struct TCGCPUOps.  Add a default implementation
> that recognizes alignment faults before page faults.  Populate
> all TCGCPUOps structures with the default implementation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

