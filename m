Return-Path: <linux-parisc+bounces-905-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF287B865
	for <lists+linux-parisc@lfdr.de>; Thu, 14 Mar 2024 08:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9863F2856D4
	for <lists+linux-parisc@lfdr.de>; Thu, 14 Mar 2024 07:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F645C8E1;
	Thu, 14 Mar 2024 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dHIMVnJN"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F35C617
	for <linux-parisc@vger.kernel.org>; Thu, 14 Mar 2024 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710400785; cv=none; b=uY0BZCpDer2c6/c+D09G22VS75Ul1dhrgvLoubowHqZcLMwgIfTBdHptaYFqA1oDMRGnMth2Z3yy7DOMo+QzSrSeUqtD/Nv206ptKkjJOkddG+Yxzd9Sapl5AXPZe6z+eQXCqaS9ZQUekKPEwMb1NTqEIg5zX3GxXiyw0ox4pjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710400785; c=relaxed/simple;
	bh=ojH9YgZdQsTdhM/5DOp0sR2SpKlzVwEvHTXac3BNoo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MprnRJu+t3BYSxy8gBJrvIk62fnMjPIVHSIHpyeJRrgpYgBQRM5JDS9CaD2MpwoR6pssRBg1XW4+kJjW5rNt83m6fqcgSaQpu7Yo8bgNdFlTzn0WjEtTwjMZ6iFrie25BsXL0+W+BnBG0qnFNlsgeRQiq2AQ3biVBFIEFeut1tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dHIMVnJN; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4d37e76a3dfso900448e0c.1
        for <linux-parisc@vger.kernel.org>; Thu, 14 Mar 2024 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710400782; x=1711005582; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ojH9YgZdQsTdhM/5DOp0sR2SpKlzVwEvHTXac3BNoo4=;
        b=dHIMVnJNZyu9wR5geyJVPDj4comCj9wjcuOeFrKBDzqLgGw+CQBPZ1Rmihoo5GCkQk
         gydtmwqK3bAyUQ83K7aML4v1hC9BZsKaZY0525UWagjZ8fsfJjDvJCfTzPWBJIkRmnUw
         aqsxskaVNMTLF/3Z9nA5isBPT4u3Yq4jYupi2OgSKlS9m8HMCQRgUMFlHHuDSHNq1156
         fe20i6sKg0KFcplI/SjlxLz5IVdQUpSXorjm5CgzoGPqRpdOLawFaN1HF8KKz8kq7kL1
         bQm1n65uWSarY1LTrouE2yAnbqFw/ncMm7t62skCvSwOMTp5rQvjdSJYjYug/MnRNZrc
         YT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710400782; x=1711005582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojH9YgZdQsTdhM/5DOp0sR2SpKlzVwEvHTXac3BNoo4=;
        b=GupdkFRiHOUg5cOFvUuu1pj/KPdb//+xl5ktgSkzdW1KZXf3jO2rclVCB0zWplDfcw
         jxESU4ZGdx3H58ByWfAR7nmlV8bCp9yDa4vmjHfKkAlVf6zWeFDP5TZYK3XIUv27xzA/
         cyVOVl3yUTzwluPmqqxVzZ+t4qIKxNt4Ci+hO4NMIkBKlb189nGm4C5GpFe9ueFil317
         HyVnRMCInCNG90pERTuqWSnrh2BbpW0p7qRPwCgzrGw4uxHYHh5h3t9kRGk5is+swyzS
         7nKjSZxt1RTlqGJPxd4R4r1IBdMPAbdgBsFpXQHrMY6uJ/1ImtGXHGjsYYgic8l8J2vB
         49rw==
X-Forwarded-Encrypted: i=1; AJvYcCUjLmcCG62OilyIz0hPHhl9pwzr6Hj3V5DnJpe7bDIoKCYQqDybqq3thfoNZZZ9WuK371qOR/QjNRoi57HJmMZIeKd3G3nj+uFHm81l
X-Gm-Message-State: AOJu0YxL9G+DGO0tr9JnmqDO9EP3EEcVklS+ESNYWyKqsQdg/Pu6dB4R
	dGLtLsLJ9/XjAoAgtL1I0zBhz+u3AUUMCRLjwQaJWGkqqhoaMvJcTTR/ZnA6XBUfVEp+qb9TH+q
	nxOhnDaCDRVvCOAluAym8SjPvzmn2Bc2q7PalcA==
X-Google-Smtp-Source: AGHT+IEu7MNUInwIY97dleYnWeWXfcA+5F5T/ApvKi6n0MwxHEqr/RR8abTAy2/zINbSlyHB23weCyfflgDg+RLDw2Y=
X-Received: by 2002:a05:6122:1296:b0:4b9:e8bd:3b2 with SMTP id
 i22-20020a056122129600b004b9e8bd03b2mr431224vkp.2.1710400782181; Thu, 14 Mar
 2024 00:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 14 Mar 2024 12:49:30 +0530
Message-ID: <CA+G9fYsHhTLw3c1Eg-L6G3H2g7-mPf9zdR+hKDCV10RhHk5vhg@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, netdev@lists.linux.dev, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Mar 2024 at 22:33, Guenter Roeck <linux@roeck-us.net> wrote:

<trim>

> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.

Thanks for the patchset.
This patch series applied on top of Linux next and tested.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


--
Linaro LKFT
https://lkft.linaro.org

