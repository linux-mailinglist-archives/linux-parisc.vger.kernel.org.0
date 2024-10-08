Return-Path: <linux-parisc+bounces-2576-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BABE6995101
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 814F8282609
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744BD1DF25D;
	Tue,  8 Oct 2024 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LxmwolDD"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61ED1DFDA4
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396320; cv=none; b=YHKzkL/lmD40sg0ao9MMTZh+OHyCF0NCobaKC2en0RYLlh1P0lCYX4mMQY16bj9c8DhVP8plWEgPrUnoD4cSnQE+ASO0KSq5rihpW/kYiQzojIqMmWZYDVti3qOGTntpOK2+OHqHcQ7fhgBGKvAOuHhB8KlMy/aM28ch+yhsIt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396320; c=relaxed/simple;
	bh=k3zM5SZzFFXff1PcUoOOg2pzr9xc0jKIhsNlrWCEwrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmOtNJR6th41CN5C3nqlduIWM0U5Gq1+eSYWx3k7jTsfUDQKMR5Jxyzd7FcjQQobxZibEeV/DJlhrZDp3JLs6b8i6a/1jwTyHpJoiNd6nX1pYOqk1h98dRonB99057wjIbiTr5fQKKPIdNkVitABByZtpV6yMRPtXuiDbAOwoOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LxmwolDD; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c89e66012aso7482194a12.2
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396317; x=1729001117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k3zM5SZzFFXff1PcUoOOg2pzr9xc0jKIhsNlrWCEwrQ=;
        b=LxmwolDDeYQ3cxXo/kC6T50wO3qumKTYZqfI2JDMX+TO84kP+EiLkBHbu+9L+3yFLq
         ogqIl9xqRhXW29a2uLQ4uE4K1XBdHquEVVHwhhOSnBsn7L7tDOxG8/xFmp2lcyM3u5MK
         UViv9ZBN2YKTy1nncRgZ4KsFIv7hWc3I15K2qKC6o7wL5WGabiog0N24pXUeEUypwxIe
         8Zb6D5gXN2qFQVzcNDSwM2QLB2f6gNiZokxFnSMyrsbCXe24U7N9kLQVCiBAqeNweTNQ
         UmEuk/MfoKxRYOhP5vxRZaERPCykaVANIub/gea/WPciYIOp5WPKiiMPS55K6F1FXNos
         CThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396317; x=1729001117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3zM5SZzFFXff1PcUoOOg2pzr9xc0jKIhsNlrWCEwrQ=;
        b=jTWPth1ZvZkiN/7S8YZk+tvvfT5Ss8z9cxjIlvtF7ah8B+r1VTqobIXKS3SLSkXPpF
         tDZdoNlCrbzOkPBuXd1eSyULsObnFBaHusqIKtMOsODGQeG22M9gw1gMj9DLWbd+5vTM
         tJ3oz2OPlLxColwBLtVhmTPCwLFgABiFbgcOV8Tz6zRxxEJXvyeZsUaWeTAZ6y0/Rwzp
         EJ84wk7uldPKTYlL9uSxZvC1/lnUvoicRl9P2sCPdJeZ08ASEnsVZ2CXe/2cSnO/w9zF
         C6TnS0yGRQctNuIihY5iB+OHz5u9JVelfaHaZhGCPxEglmpzcafq8bVz4o/pDtK7eA87
         raGA==
X-Forwarded-Encrypted: i=1; AJvYcCVIUHpHDWrtRbZo3X/hSieU7GeghihWvrR869X5oD7OE+sCgxLjC2f512RWpJAP1RLcRD+kMxN33kfRPCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCiS7j16pZ4en2R8sFjhe5zIejXw2DjokrC4rZ/KsRHXMxeJs8
	IDJlszWBViuBqoCWrt6UGsjmO2nEZQ1BazLQuQfWWwCG94amccPGi9eMx9W6jOccvEx53V23u4d
	AEgsTZEHqCDVCXY9xM/axu10Ad9lvZfZYmxGuQw==
X-Google-Smtp-Source: AGHT+IHNjcrGqvYeAx+CtcWJD/2XeNoJIOWs0WM7Cu599a18mWnVOQWoNyZ2UU1PgsioPILapS7mhcrrDQaS9ndYOJ4=
X-Received: by 2002:a05:6402:2350:b0:5c5:b679:cf29 with SMTP id
 4fb4d7f45d1cf-5c8d2d00fc6mr12862570a12.1.1728396316888; Tue, 08 Oct 2024
 07:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-5-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:05:06 +0100
Message-ID: <CAFEAcA-dvX_4evZJ98WwB=Wkkf3N5BDER9aoV2WA7pzn=kmXqw@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] include/exec/memop: Rename get_alignment_bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename to use "memop_" prefix, like other functions
> that operate on MemOp.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

