Return-Path: <linux-parisc+bounces-2584-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2BB99520B
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40E61B2F1BB
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41631E1A2D;
	Tue,  8 Oct 2024 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cLuEbccn"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81A1DFE11
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397502; cv=none; b=dMnmUQnvuZbPUS43k8B1kpPT4lzz/UUb5z2RF5wtbWQgSr70SKGGPN0aUsjcVm6bucNp0wRAy4rRDjsumrutwtXV8atgoSU5GaK8QvyDwZXUdsNe7aoA9wh0zkUslNak/zBra3hohxOWqGIfPQNWZRlm/E8PiYm+Qt9Zaolhtnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397502; c=relaxed/simple;
	bh=5YRc+xLkBL7rEj4z4bMMDdrYWfvach9L5dpn/9o3g/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTXbiIeNF1TT088V7VX+xvFtUtbnYNukWLjJF8oVBUy5uP2s1kN1EhK54Eh/zidaryXrCdZNg4KHSEqilIqFKD7RFE4FRKYsw0t/GyHh71RWvdLeQXjEKDa6LnA4vbZ8yF6uC07LTTY1j2O7T8Z9xMcX/hevATbw1/pa7p1sGKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cLuEbccn; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c8967dd2c7so7106040a12.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397499; x=1729002299; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5YRc+xLkBL7rEj4z4bMMDdrYWfvach9L5dpn/9o3g/Q=;
        b=cLuEbccnHL9WxgjCqBgIcAEwIUpF3f0i5gTu3HWeLMfOAl1nnzM4WTpBizlLyR4r7v
         gWH699acvHq8XD3WyE7Zx6EpUsLRUsiGr+iK511SWD1meqtRmGVEG1DflCX1ufn4EZ4A
         qR4p6Ub8IA3VjaIjytPxW8yixmdbu12VISHkgZs02VzLsP0gcTq1jDJJMWvO5yF+/LXd
         HfVBt542jd9GkrqZqNJABAeT02gLKP+4Fyf6Yd4ksvTWvLAT0csyay03NgqPAlZp+ScH
         YOQ+K0ImAzt2PE+HUbqaVUdfNojc3rb6Hae5CT6+1nlLazUy4CXh6vN79DJVqjKbMqCM
         PCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397499; x=1729002299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YRc+xLkBL7rEj4z4bMMDdrYWfvach9L5dpn/9o3g/Q=;
        b=JnqBA9o0YMCfKD6K4J11T3YibiH6ZzC3eyI/A4mBAMXhGSGZ29N5jVh3GNOS5LAf6f
         IWuwQRO+Z8tbgZC29O6OgTDh3E19ZuWHZ4S6SzBA+LDtbyYk7j66ib0ao8R+uDYMPJ3S
         5XPcUmfyz9P1McQU97CQWtSk3Q8pjGguJ5BhOn0cM9usLpyuIeljFAMZ5VIBBRjmIIFX
         Kij2qzRRjBrkx99efrCpPYNmPbnOJy4zS1k/QbpsSHAyg9alcg208LXsr/JbO9mzB6oL
         hcuIUx1V9pH8ShKF2mIH/brcN8gVH4w3XO4s1wLneFJiFJmxpr0epI1a40TX7xuTkbpR
         y27Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTrTMekTiaX7RduSG71nRkmbgEyREMuimaEZuiDJ+s3O67TRCoOCNobNPkzaDX5Ezol7RPGzoYPVAHgqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKkE5k9oHCK5TO2t5QYhRJNfxmlP3yOJl4+PjZcl4dx/SzhG2g
	wzDufX4x7nhEbupkKvhgfvtagQUAssI1qUGIyb3LCzml9438uB/Fy69kYeE2RqxmqJxiuVd0jbY
	PBIrTH6TRQlW89nj++qh47tapDkHb0IRZ1dcaKA==
X-Google-Smtp-Source: AGHT+IErA76QiWFcH7UPLGvZv64Oin3x3QAEdAW4jnjp4KbXcniSCMz1atP2hbElJp8KX19MhLFWdH+zy50EfDXYxhU=
X-Received: by 2002:a05:6402:401a:b0:5c8:861c:28c with SMTP id
 4fb4d7f45d1cf-5c8d2e736e2mr14027403a12.23.1728397499480; Tue, 08 Oct 2024
 07:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-18-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:24:47 +0100
Message-ID: <CAFEAcA-P-LWKKGr5iTJ+zLkRbY_jG674-tz8TLxagjmPYJjNqA@mail.gmail.com>
Subject: Re: [PATCH v2 17/21] target/arm: Pass MemOp through get_phys_addr_twostage
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass memop through get_phys_addr_twostage with its
> recursion with get_phys_addr_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

