Return-Path: <linux-parisc+bounces-2582-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2709951BB
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6AD3B2523D
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09D31DFDBD;
	Tue,  8 Oct 2024 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzHcIruW"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B21DF971
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397425; cv=none; b=qFz8k8Wj3eax2dMWVzRGp+N9Jn3M51KS74joaFiRYwjxiSScNqKXn7FSh2GrUqWDSegt305BM0fzBx5FOTCMXjpYvCH4IgtyBD4ClY+heNn9a8ZPib56CrCCVVH23lO1O+sY9e4gAbEeTH1h71UytI6IS5u8CZ3TfpqK178FbAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397425; c=relaxed/simple;
	bh=kOWE2cAoIjDm9f/FqGa6G6t3ssB5Lz0udY0SFSrSxWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgFdKWNWZ+BNSWOym2H9vC3M7oDLXYmxqHwMWT8tKD7YJTfwMv8GomlJab41IGHE/mHdwKIm9AZiqPNSNBuSlzjp6tObdbL7DRukRkweoToxLr41fZNguQVu+2yOG7aYr140aReLPyy9+CxfXc8v/1SxXDL1TtkDolIKTrWeMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EzHcIruW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c88e45f467so1963562a12.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397422; x=1729002222; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kOWE2cAoIjDm9f/FqGa6G6t3ssB5Lz0udY0SFSrSxWI=;
        b=EzHcIruWgddXPtUGo6OLVkxLCpBWiQWiJUGSE8xNOaQIWtzjipiVKbF1Ijxj3RXOej
         Utwe0quVfvz2vua66pGn4wqEoSIBFR0H72QoUw0GSYTuxYZrX21hQmRcwaJzJ3oEKU1L
         wKS4xu/hHMazLYl6rDIaHL5lPZ/MLG3GtVxE+GjQ7l08RmThoKYjiiJjz7w023sjw4XR
         0wswC3BdteBWTefNeNimTFpSwX1VWRY0eJJWhVTCHxQ3r5w2ez+4aVqwEhyXJaPlJRYo
         WGN2SDl7myZn5MpPPl+xP/B857GPugIVhu0jO+1Xd1BqGJMQMfFvdd58TX/jteE14jLH
         GdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397422; x=1729002222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOWE2cAoIjDm9f/FqGa6G6t3ssB5Lz0udY0SFSrSxWI=;
        b=AxllYiumJ5c9Clx6fS7YwlVuNs8D4n3DBGVMNL+anqIy1qSuKA3hafve3ECvitho39
         txGFmmJUet6atVEDcVnJ/MqVl21SsnOTbiJesmaIyEpR53w8802/W4aGyqqjW67rdoqr
         xvl32eHoZ1UcI0giRAqtiLHyUBEh7XUEzNbta/Rx8oH2tYy8NNh7HRQdhZ+dt2QJG8wk
         1Sl9NUqTJfaOFgppRV0bNnwLIyQ0waZKIM8jnXs5adDKfbYDoRMNQzp1823aHloyvKQh
         wtLeZOYesfIQ/fT0KhRTj8JlyvYnNCchFgggEAVkkQE3xPUnrXY7/vmE5JrvHg21Pgvx
         c3nw==
X-Forwarded-Encrypted: i=1; AJvYcCW7SbadIOZeY16spbX3GFafdfgTngv8+0RojbPlQsCJvf0kcaU8RE6CIzn2Vx4ekOs8UjmZoJpxKeoRT9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBs5IuHdCP/45QN364rMywnKqp3xlLKSzY3j9e08QQibqY4e4q
	urdOR/X+O4JdmDMbcZr41YtAqbRqm0SIW9mlHSYznukav9LNTsOUE8HfZbACmMb1snG7iBIr3EN
	RcYMJytLZf6bktlmupEY6vnuSUg6XUhlAWJNr5g==
X-Google-Smtp-Source: AGHT+IE63NtOVMmF0vUbrtvnDhrwqy+4rBGeEL1dE3L0XoRqeekOTPKAuBVShJkbWSmwl9/McI6rGCEphCweGhdISKU=
X-Received: by 2002:a05:6402:2713:b0:5c2:5f31:8888 with SMTP id
 4fb4d7f45d1cf-5c905d4f723mr3483800a12.15.1728397422269; Tue, 08 Oct 2024
 07:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-22-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:23:31 +0100
Message-ID: <CAFEAcA8dWB63M-x5KwuEH1xdoRdC367HOF2BOvUHrp0TSO38Ow@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] target/arm: Fix alignment fault priority in get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we have the MemOp for the access, we can order
> the alignment fault caused by memory type before the
> permission fault for the page.
>
> For subsequent page hits, permission and stage 2 checks
> are known to pass, and so the TLB_CHECK_ALIGNED fault
> raised in generic code is not mis-ordered.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

