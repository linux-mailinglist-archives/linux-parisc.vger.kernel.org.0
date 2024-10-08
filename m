Return-Path: <linux-parisc+bounces-2579-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 525D299518E
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89102B2CF8D
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CEC1DF987;
	Tue,  8 Oct 2024 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ba+K2ko2"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF31DF72E
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396791; cv=none; b=t6KYf8xSTJubQkYNfwa82jM5htmpcYLBdMlUFaSBxhnAroaNw6SlK5LVRBlqMtcXYyVnBcZ+5BniJMOuvp+dgsNWlCCLbxlKmKqbuVbmWtIuPy8FNhnwQVza/wQo9hefT4teXa7STdAT0Rx5GnOO4wARuNpQUHtUFa96yR8G3zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396791; c=relaxed/simple;
	bh=WTlr9wCfpXZKab/pyvAbZZu9N4F9HCwrtO3k4ZOPDrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCnT94oNRusrsGoEE/zdA3NAo8c6U1LeG6mEoInmMqGUHqvDEQsqOwudVMA0OO+dPV+QAhjgp5rgYjyH40oEZ0xLcNdUbgr+p2MhVjeSNOogiv3pOSnQBdFoK54qmlhegHqUTuuuy9rwDo4/BRpQawfajrJvaHX+l0B3/YU7kMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ba+K2ko2; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fad784e304so69288111fa.2
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396788; x=1729001588; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IilAgLFf9D3WPiImik68r3HP0LrP4VXSn1RvllVJUL0=;
        b=ba+K2ko2UuHn0REf9VFwzjInTVJEtsRJaHJhMKRUT2X7uEVTL8DeF3y2nRs06Ivd1O
         hCliiNUM9PRzvApkXhVYVV7+Dqhgm/fOMCDAVHa3o9BumwP0ouPbOZ3N6iy3TVTJMypW
         iA2Ozo8ZLFqMbMlp0mtLzBqrEYFSrClTAEMxCuaUj6LliLrVXs3pDn/uwHBK7167URGp
         GycsK6LUucEqUu3SUWuKmHvUepesBtTkrbP0G+1WwTD0vQZYhkR70NcEzx3TjFkoPIb0
         3wTuqUvE3hp2n3PtM/94p/vsN6rzoElp3nM1fU86jV/j4OJhgXBX5EQeohr7/aAouM1x
         fNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396788; x=1729001588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IilAgLFf9D3WPiImik68r3HP0LrP4VXSn1RvllVJUL0=;
        b=hiKti5r5DF79165HbmR7gykn+Vn5z1lVxyI0BE51PCdck5nRXQ0wQt6hp89daJ5YgY
         sGj5wYB41QGHvBZHg2nnm7hGFObinoFsKQF5MMpdgJvVbbwjcaNQdLgTv3q9X/nftpRy
         HUHIp6vYIRwJCbSta5BDy7p9S2VxO/f4xJZAJK4xCB4acICCO3O99oBMCamXcdHQh7iE
         uBVH2td1SGbF5N+n31R53AXo+mRxgNfjMeBS1ItmUfQExo8mdxYVKS1UJ/2X1+SHXA7N
         THWlSPnUiTdtwxoXQn21rMGTipLPTDx287Kt0NO6XDdNbMSpJFkIVDWJLrY1DbHbg77N
         Wlug==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/DvTdVTW8ZnPAGx+SwpYtVDongWtZejIYS2M2qSqDwm41njhYBMgeHJNCTYbGISEKw0FGqfXm9/uNAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7hNWtcv8gQrS+Bp6wWEPH6hOtdHbglQOBLR8g7vMrJ5VtFUzX
	sUEJJ6D0hhF0kYnR0Xq4ombYA+QcAm3hQOsv/Vr7RwxELTn6P8fTwmEfpmJE4Cb45K3MCeFReFh
	VPuGHAtpjbZfOVRwY+XEt40wDXqUG8ZsWqneb8w==
X-Google-Smtp-Source: AGHT+IHX8WDeU6G0DWTwtDykB80Fzl5sFUDON9fa7jmgPNRDLEDPb4CCr71S9cNPuXQATiVBxQVvICmfLTtgmJ0ORaM=
X-Received: by 2002:a05:651c:a0b:b0:2fa:c6b3:bf1c with SMTP id
 38308e7fff4ca-2faf3c01f43mr79822331fa.8.1728396788120; Tue, 08 Oct 2024
 07:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-8-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:12:56 +0100
Message-ID: <CAFEAcA_HQvZf0GT64vy3_KgXrGK2hq+Tu21y8w-WLbHsWGiBGw@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] accel/tcg: Use the tlb_fill_align hook
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When we have a tlb miss, defer the alignment check to
> the new tlb_fill_align hook.  Move the existing alignment
> check so that we only perform it with a tlb hit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

