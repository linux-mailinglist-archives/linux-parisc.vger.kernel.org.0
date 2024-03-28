Return-Path: <linux-parisc+bounces-903-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2240687A3A7
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Mar 2024 08:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF53A2833A1
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Mar 2024 07:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF10168CC;
	Wed, 13 Mar 2024 07:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GdnaITHH"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A48171C1
	for <linux-parisc@vger.kernel.org>; Wed, 13 Mar 2024 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710315576; cv=none; b=pvFhk86H97u1i2DvvfwFYvPsac4ORa7qlmn9dvUYtKBgXzaKbluSu2IlvutC5OcugoInaw9Ee7DSCk714cZvKXoKWbJAbs3WmxPatMQvlBsIMFeMmT9Xc1+sT5g+QkgbaShtlcAkcawMPKwm48t7Zrfi5k3hJVMbeneaTAlO918=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710315576; c=relaxed/simple;
	bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kg1CT5xFYamhuNrGf+vdUpecgHEcgTiZ7K9NfxsoJKOgGaGWS5yK++mj9iZ98jERugx11QUc2A1h6UC3rhAR/8SzFxz7apvkHXd7utRYCgwYLXUNwSCcV4Z/4Qf6sNX+9LFfeLcVrApNLHcyFArIV65J+MeK/+wT8rZe1w9ym+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GdnaITHH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a44665605f3so876194066b.2
        for <linux-parisc@vger.kernel.org>; Wed, 13 Mar 2024 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710315572; x=1710920372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=GdnaITHHnDyTc59DrnY/aK1qBmW4s8v+1Wlo7OaXKXq57D0uGr0gsQX/ItX/BACBPM
         mCpMOjziUb+3Mn5COgkXtUpoeoLEcXZCGTpgGjzVyLc+VMKae2PiFkxwSu99rRhGu5PL
         h0DwhApPO9cJtQFK8IR03dSWBM+quu8+QvheMmkAeD9cyenRXDT5FzO/WA+ETkmUxyZa
         SN1VD6WkfLXCEc+IYf4zf/JHE0Wo1vDZsy4xcu7u+lDW5Wu0D+wy0+1TtlvzrncNvHlr
         tpridwRMpXbbySaNM/TBwn2tAXOaruwSht9ctgRneZZUslHQzUPXkKVV6MMDE1ceGHf3
         4nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710315572; x=1710920372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=R39r1KRfUR7NxHyBXpPoR3IpzzzoyCFbTAkhWJ/O4MfyrOK76QAtarDCTSmXtdecRT
         38LfO6gSzAitYsYdMQIRiKge6oc/yDNHO4bOEr/Ofopl0oEXgYE8kcBecwJp7Bdv9SnW
         fpz4KauNWb/QRmkPAgV8Hn7VysTSmkCYvXv3JsUDWa2xD1Qo1YRTbV9IO250dUCuU9uR
         /dV9vL091MUR3VjwG5EDksqn/EsLyII5F6Gbv1RQ7B/1LFxWPBZLraWFRtkvpLNjlLKv
         ADXdaEjF6yj8xFRgP4Ywf8B39VQfoT8aw8fJ3CVM+RfQ6XK3VxOYCLaZtA3Qtz9qnSZU
         PqNA==
X-Forwarded-Encrypted: i=1; AJvYcCXZtR3vODJDNzgNkV0gTgmfDPZ+Qm/WiXT83rEyWHj0g5G4dwDGy911QsJVZ8+p9W1mLQoVZYr+aKC6g55/2isDQ8ITCz/qi+Hwkdqo
X-Gm-Message-State: AOJu0Yz7KttqgctGTVsS1OgdKqjgNzhvgDNwCU0ZyO35meHfn64AdST4
	asrHZgHaJw8uGDrYzzkQpJddHJxvtsIqzknQ/BR5m4fJh3OxrHFZmwNEyxgT9eU=
X-Google-Smtp-Source: AGHT+IH38GneADkyKtRbEkb8+HLK5ZsZNpyhD22lE4uk6eUmiwmdHa00scLatPQEFNYx/T2Y2VkSUg==
X-Received: by 2002:a17:906:2ccb:b0:a41:3e39:b918 with SMTP id r11-20020a1709062ccb00b00a413e39b918mr7484516ejr.24.1710315572226;
        Wed, 13 Mar 2024 00:39:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qx26-20020a170906fcda00b00a45a687b52asm4578781ejb.213.2024.03.13.00.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 00:39:31 -0700 (PDT)
Date: Wed, 13 Mar 2024 10:39:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@lists.linux.dev
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
Message-ID: <43ef4ef4-303b-45c6-aa50-3e0982c93bd7@moroto.mountain>
References: <20240312170309.2546362-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>

Thanks!

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


