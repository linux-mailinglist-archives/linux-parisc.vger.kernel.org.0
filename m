Return-Path: <linux-parisc+bounces-523-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B248853CAA
	for <lists+linux-parisc@lfdr.de>; Tue, 13 Feb 2024 22:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F5FD1C231F3
	for <lists+linux-parisc@lfdr.de>; Tue, 13 Feb 2024 21:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DD561678;
	Tue, 13 Feb 2024 21:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JMB6NJ4T"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F3864A8E
	for <linux-parisc@vger.kernel.org>; Tue, 13 Feb 2024 21:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707858266; cv=none; b=hr3lFioG5qjUtAVHnXeKpaLC61nzceeAnvzcLon8TpjlunVoRBfE8o2YZDFf72bHioDy7oynuXPoNi6UsG5y39OxuC5DFP3Wx4ZjFP/+eOIpGsotbZznR43sW/XeyO8G33BguL3ypp92dncFymv42RbywoLNXYQuzm/ToVLQgos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707858266; c=relaxed/simple;
	bh=unxZOrs9XDbzoXsCj96S95ndlfevfpGn8crX2VsMceo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjkZBMtNJ0Hog81uljKGTAhSoaomMt62lQieuGbv0cFDwjF9w83OLZRVw/g/8IdNHSWN35wLwYMJle4LMDHIbTTIr2aBPWdHk0cCDt+kLPd95h0itKZlIcSzFG+SNbKL4CYvv8DYMg/YKnUgYGAe0biL2Eijnr8tpriSjbgpxSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JMB6NJ4T; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6078f656914so8629607b3.3
        for <linux-parisc@vger.kernel.org>; Tue, 13 Feb 2024 13:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707858264; x=1708463064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6WpcrNvlFPgLJQNuLJ6h+eMksOi6n36MRReQFJjkwlI=;
        b=JMB6NJ4TwDe4C2jjPbeLOlRDA8BUi20jfZw72JnfXG1tGxGSw+Mpv6VYsqejKzy8c1
         cFTvAE4INDnReg68hGisEKVkURPi5SjvuJM4B40D3W2PXVjmWhR8tsRiP1JmMNxllYOI
         zF5xmBY9l6W3a4HZU9VE2xvhHm40qB3HHv5IHSgRi+/0wCPDxa66hRaXVLT1SJQ1gqir
         mwg5SzvGOjGDd6qNoO64EqO7JAhMI+yQxLsVsOuLcG57WXoOn3YQZxCxSfnM7nrP7urv
         mexT+gZut7zNLt3Ji9NK1e1y4X2Z54Cij2U8XkdxE22KYUKXIvA0GbQQ0MgZSFoPS5Dj
         /TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707858264; x=1708463064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WpcrNvlFPgLJQNuLJ6h+eMksOi6n36MRReQFJjkwlI=;
        b=P0peUdA+4acf4OA7Y4WQKz72pRQ6YA6feykLM64mMj0Pjdxy6fJu/8U8DEsg3B2u/G
         kAvevzMf2+C4X9mmI/dpmC/Hb5XaXqJlxgDdcNCsXFwqH4IHQR7dQIT23ZlU8nOPSOtL
         3wdMyWd1AyZVNSAbTMnRdPVhczSuEhypjy6IfYbPT++zOkhITTdpRn2+4bUh/vqqb9Mp
         KBaUk4KKVMgEjBnxlxamY9aUyUWQ0U/8NxWx2wj1d12A55gotGlVe+CYsLSqnExLZQXa
         WavCCMaj3Y0u5dBc1h+Htygs3pthe161juBKfROTeWhMK9uyxmaQYGzIC0JxwXbJvkqI
         ofhw==
X-Forwarded-Encrypted: i=1; AJvYcCUJNKMtlTzvl5M7Vh/wPVjv/E6scIiJisoofIrZ/dcbHoPFy63yMbgUWqA0DZmB5CXjcVqR6cgONgA7g04SSLmHJA9VkO3jaN6NV5ub
X-Gm-Message-State: AOJu0YwxIvJAtAi4m/KAEF41pmfamda+Mzjgb1pn/OWQMrrnd4KgtrGU
	W6B7RrQ7BdWP9odFKWyDHFCd6euhvW2bReAmI5gel/TtxGM/Iy+JG7vqe+CAOwi3fqaQwhUu1WO
	c
X-Google-Smtp-Source: AGHT+IGuhB7i7Can7GRRRP7ZoLvLMIK+FNyBhgPsmOzQYSQiDEPs9JYTpO+KUBpE+u8T7iLWINCm6Q==
X-Received: by 2002:a81:838b:0:b0:604:69ee:5b4c with SMTP id t133-20020a81838b000000b0060469ee5b4cmr674166ywf.18.1707858262387;
        Tue, 13 Feb 2024 13:04:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmvajECjHBVC7eK1T3+mN2RBiopPph9GnxGfJw2yyyl11dZUu5JKrWODyKI0eKUdKqynzV/pJZKL83VThrGokefoaqgeZs8bYX4XDEBme3v8GaoFszV2jwuwn0P3ithjtKKsP6uLb1YIAR3UalNS6rO4TUwNIlKFxbIRGlzvBqetmEgFq2ZoONoGI6woxU/UKbWo3pU7c6Wk87alI/E60DJpVAHHh7
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id v137-20020a81488f000000b0060792690431sm299939ywa.105.2024.02.13.13.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:04:21 -0800 (PST)
Date: Tue, 13 Feb 2024 16:04:20 -0500
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Helge Deller <deller@gmx.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] parisc: Fix ip_fast_csum
Message-ID: <ZcvZVGCNd0qMkMbY@ghost>
References: <20240210175526.3710522-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240210175526.3710522-1-linux@roeck-us.net>

On Sat, Feb 10, 2024 at 09:55:26AM -0800, Guenter Roeck wrote:
> IP checksum unit tests report the following error when run on hppa/hppa64.
> 
>     # test_ip_fast_csum: ASSERTION FAILED at lib/checksum_kunit.c:463
>     Expected ( u64)csum_result == ( u64)expected, but
>         ( u64)csum_result == 33754 (0x83da)
>         ( u64)expected == 10946 (0x2ac2)
>     not ok 4 test_ip_fast_csum
> 
> 0x83da is the expected result if the IP header length is 20 bytes. 0x2ac2
> is the expected result if the IP header length is 24 bytes. The test fails
> with an IP header length of 24 bytes. It appears that ip_fast_csum()
> always returns the checksum for a 20-byte header, no matter how long
> the header actually is.
> 
> Code analysis shows a suspicious assembler sequence in ip_fast_csum().
> 
>  "      addc            %0, %3, %0\n"
>  "1:    ldws,ma         4(%1), %3\n"
>  "      addib,<         0, %2, 1b\n"	<---
> 
> While my understanding of HPPA assembler is limited, it does not seem
> to make much sense to subtract 0 from a register and to expect the result
> to ever be negative. Subtracting 1 from the length parameter makes more
> sense. On top of that, the operation should be repeated if and only if
> the result is still > 0, so change the suspicious instruction to
>  "      addib,>         -1, %2, 1b\n"
> 
> The IP checksum unit test passes after this change.
> 
> Cc: Charlie Jenkins <charlie@rivosinc.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Prerequisite for this patch is
> https://lore.kernel.org/lkml/20240207-fix_sparse_errors_checksum_tests-v6-0-4caa9629705b@rivosinc.com/
> 
> No idea how that was not detected before. Maybe I am missing something.
> 
> Note that test_csum_ipv6_magic still fails on 32-bit parisc systems
> after this patch has been applied. That is a different problem.
> 
>  arch/parisc/include/asm/checksum.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/parisc/include/asm/checksum.h b/arch/parisc/include/asm/checksum.h
> index 3c43baca7b39..f705e5dd1074 100644
> --- a/arch/parisc/include/asm/checksum.h
> +++ b/arch/parisc/include/asm/checksum.h
> @@ -40,7 +40,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
>  "	addc		%0, %5, %0\n"
>  "	addc		%0, %3, %0\n"
>  "1:	ldws,ma		4(%1), %3\n"
> -"	addib,<		0, %2, 1b\n"
> +"	addib,>		-1, %2, 1b\n"
>  "	addc		%0, %3, %0\n"
>  "\n"
>  "	extru		%0, 31, 16, %4\n"
> -- 
> 2.39.2
> 

I got my parisc setup working and this does indeed fix the issue.

Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


