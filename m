Return-Path: <linux-parisc+bounces-1663-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0859157FD
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Jun 2024 22:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A20228772A
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Jun 2024 20:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A82383B1;
	Mon, 24 Jun 2024 20:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="keEVTVT+"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC2B2233B
	for <linux-parisc@vger.kernel.org>; Mon, 24 Jun 2024 20:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719261120; cv=none; b=GI0xGNobfP1PI9Pwkw9ACPQ7nPuawkEWOgZKzan0Nr212K4CHZK3WwQIBurGPgOH0iH2/zoMCOsKJC+B5VLfZ1iAe8E2y0ytVfiHLYEptxvTJoR7nNukCuVBvmGWj/YnGeu0aie/7LsufiqeBz/VnPaxGvW8Ox+w88Un7Tu4icw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719261120; c=relaxed/simple;
	bh=0rnOQ19AryhurMEysYkGMiCDNJEYThhn2HKbg8xQhjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mNfhvo4wyltIW+Awe0rPVfJEQ6rn4pcTLIfMJqQl04ATWuPpJ7I7XKqJPzeOKc2aHqZ1De4I2UqQkvacsjtXzUIUvbQ+FvvueRdnx9s6UtVKyzW3RJLoKTdKvpd7rd7hk8GlFWwKHMhF6foQDtdQTm7Y9UEVlYlALtRZXeWWTNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=keEVTVT+; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-440f035214eso20518881cf.2
        for <linux-parisc@vger.kernel.org>; Mon, 24 Jun 2024 13:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719261115; x=1719865915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FVnyDWT3JbKsDqbdmtpQH9OZmELabgmImESGWBGI5t0=;
        b=keEVTVT+JOAVkVw2k9IsjqRnYC7av+CMxOXSsVVLc1HNRT4p3B8kDLFkBSGs2yifhN
         39YtrWzaBQMz1cC/TqtIWMtjgpKnydNwKRVElaaSpOR9darh+zDn+yNKdnX//TCVfuzU
         YRY7ZzoPPLCbLxiCQO1Jkjw/IQJeQDnM7PkqIBc1YhpaSZFDOaJSJYm9SC9zXRWIxFvU
         RtmdcMfmngK2wYq5MeFWeHIUtKCl3yrb3tVxIoWOZBX+c7W8WzCO6zQmX4H+oUufdyGc
         BFot6/078AP4lzVe/2nic8L41es1qR73M61n9JTkzh1IBsXEh2suTlXJBx+m1Ws/cXIx
         ml/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719261115; x=1719865915;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVnyDWT3JbKsDqbdmtpQH9OZmELabgmImESGWBGI5t0=;
        b=suTSKuuwzsWfgAUsXibCoMXohcrDb/oF5kM8XlIx7vOMBnBOfr5okBEx0KUcHOE7Zd
         /l90FSVhviqCI024wyy/0d76Xc/gcHaffqUoIvE3qalHHWLYbeWDfhVQs1VMIOwvr+Vw
         REM+3SrIosE2d4JaaEDVR4+reXrLsxgk9G+qKm670/lPQhrQ29xMPHsAra3Ru3bNbIJP
         gHh5nSIo7xhMvDaNHKvsgfGbugpDGceiu68KbA5diiIBqjEFC4En8yVeWndBsxVOvJ/G
         DI8uQaezwdIB6gQiFm3LjbkWZfF+onNTAExDVoU+J67lXFgxyKj7jxRQpCWPL8NQpkjH
         nYhg==
X-Forwarded-Encrypted: i=1; AJvYcCUikThoGeGHVW1ytIzJoHs0egowJsjQo6G+h1YjRloK9Ac7xEfkItTkML3s5HI4A68oU2Mma72vXQELKqIJLh28gNoax+fwCKYJc1j7
X-Gm-Message-State: AOJu0YxDOj5b+z1tEVGu48cFHILfc7WV19qjZ19PxgxMA+Xlr8h9LCEh
	HuIYJ8XpKJ/XCKVl2TqOrAL4suzQ+fZbZkG4CQt3Euil6D+QNYDUyDaDpRAE0HJyLP0aINXAe+7
	K
X-Google-Smtp-Source: AGHT+IGnLFA+NpWZ45X3c7ZLJwUpLirYI4uwUHTrcJnOLyw+Z0xMv2NemRVHLbMou3cTaZ1SK+bV6g==
X-Received: by 2002:a05:6a00:3e2a:b0:705:a32c:8b35 with SMTP id d2e1a72fcca58-70670eeb107mr7338263b3a.19.1719261094884;
        Mon, 24 Jun 2024 13:31:34 -0700 (PDT)
Received: from ?IPV6:2804:1b3:a7c1:e1e5:c9c:830f:c9ec:d9b8? ([2804:1b3:a7c1:e1e5:c9c:830f:c9ec:d9b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7068922cd19sm1928307b3a.107.2024.06.24.13.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 13:31:34 -0700 (PDT)
Message-ID: <fd19f26c-0ebf-42ef-bfc3-686a82104d07@linaro.org>
Date: Mon, 24 Jun 2024 17:31:30 -0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hppa/vdso: Add wrappers for vDSO functions
To: Helge Deller <deller@kernel.org>, libc-alpha@sourceware.org,
 John David Anglin <dave.anglin@bell.net>, carlos@redhat.com,
 linux-parisc@vger.kernel.org
References: <ZnXT9hNtYWLg9MID@carbonx1>
Content-Language: en-US
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <ZnXT9hNtYWLg9MID@carbonx1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21/06/24 16:26, Helge Deller wrote:
> The upcoming parisc (hppa) v6.11 Linux kernel will include vDSO
> support for gettimeofday(), clock_gettime() and clock_gettime64()
> syscalls for 32- and 64-bit userspace.
> The patch below adds the necessary glue code for glibc.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> Changes in v2:
> - add vsyscalls for 64-bit too
>  
> diff -up ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org ./sysdeps/unix/sysv/linux/hppa/sysdep.h
> --- ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org	2024-06-15 20:20:58.992000000 +0000
> +++ ./sysdeps/unix/sysv/linux/hppa/sysdep.h	2024-06-21 19:19:02.132000000 +0000
> @@ -468,6 +468,18 @@ L(pre_end):					ASM_LINE_SEP	\
>  #define CLOB_ARGS_1 CLOB_ARGS_2, "%r25"
>  #define CLOB_ARGS_0 CLOB_ARGS_1, "%r26"
>  
> +#define VDSO_NAME	"LINUX_6.11"
> +#define VDSO_HASH	182951793
> +
> +#ifdef __LP64__
> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
> +#else
> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
> +# define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
> +#endif /* __LP64__ */
> +
>  #endif	/* __ASSEMBLER__ */

Not sure why you have added the gettimeofday support, currently 32 bits
it is already routed to to clock_gettime (which will use 
__vdso_clock_gettime64 anyway).  For hppa to actually use, it would
require to add a way to call it for !USE_IFUNC_GETTIMEOFDAY gettimeofday,
which I am not it really be an improvement here.

