Return-Path: <linux-parisc+bounces-528-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 665608553E8
	for <lists+linux-parisc@lfdr.de>; Wed, 14 Feb 2024 21:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD0B7B21F57
	for <lists+linux-parisc@lfdr.de>; Wed, 14 Feb 2024 20:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC3C13DBAF;
	Wed, 14 Feb 2024 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CtTOlZBO"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18D1134729
	for <linux-parisc@vger.kernel.org>; Wed, 14 Feb 2024 20:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707942160; cv=none; b=sEVRfRl/v+0CC38Qy48pNTxdeClzfgtV6nc6vFxqoQK3uEo1HtMF9jAiCdCJOnoDYf91cX1zos22kySabnK9zREq3lNspQQlNQQEgtLp6/CJD8NMg5wRlHwGGI7WwBtA8SOb0rTj7xy6kjVdrxG6s7xv4yz5KXfP/w7NweqFMfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707942160; c=relaxed/simple;
	bh=ry2tgqvwlSOAxzyPLhaWdPdWTp/ePUjestwW5SGakY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Htldti2MmcPoz0MppRNgAtd/crVed5KdvDawe55/ePHIXrO/F2pAzP1khl0/FV+/FzQEyt+V/4euGt119feMPYuh2PpEfOXyOq1joI8bpj0IRMT0q2YbWjvaiMpL35xbNc9MtWE1UFzUXGvhO+NG/KlSBWemCDBflzT0iPCa2cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CtTOlZBO; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so65008276.1
        for <linux-parisc@vger.kernel.org>; Wed, 14 Feb 2024 12:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707942158; x=1708546958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xctn6aO0TrWVgdTrz/8AORGirN450n6xp5zhbwRxt7Y=;
        b=CtTOlZBOWevpHqeoyAbDG4Wn8/dxh7DU/EAppGDPFY8QDz8qnmI6d529L0QXs4LfoA
         bOPdRt1Mrbp2A6ovXubBH6Z+degIJaKFtH3HHDFipxszizjTKaFvWy0AGd5Nr+U8KKjy
         xTIG3bUYMvf0IBhtD2V4KxRr01gxO/jXMeCTFwiYqev0ISm5iyKOobixr1VGk/TYsmEI
         pPi+ZDhH6H/PSkFOunz3S3EGYKJq2B8QLANUWyGlVC3GraSnwoFfDtVGUIwcYCMM+lDK
         SB0VIyBvQ/ZBm2a3ROpmydkmX79mPoZYAliDjI76Qof03+Ym/MSngcnK9jphX0luhJiG
         N8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707942158; x=1708546958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xctn6aO0TrWVgdTrz/8AORGirN450n6xp5zhbwRxt7Y=;
        b=DC+6WngtG5ZQ8QDrGYM2hGhvmDIj5//7HfwolqEBf8XNdBMFp92HP3ylzEi7c+vN/S
         JmO3J/re5Ysw3BFKZA+zJ0MeLyB0T8UGuIYshkijBDlc12ml+f1YB494at9w7M70VQcN
         wgC6lT+/GS9FvhcLQOqleAplBRmM4ja4qUbouqFUCNEPgdvKQ6Sb8Pz91BVHcG/oLmiy
         WyfoPDJa3Vz38kggyY165VNqFZelqE2ITaR9rYeHsLchry+pvok1u3plonhVADGUMT7y
         JIqTynmB1IDa/I+vhRtLZiUSbSS6U1l9L2Pg6gHjlwvPIfPa25HjfzMqYPOrpxK5MzoB
         WdYw==
X-Forwarded-Encrypted: i=1; AJvYcCU4E0ZDALVCbapsz4A6cgYC+ME9rLkxcInuphqT5XJI2p+HZBnLlRsPI0hgx9ZM5KSmymxRV8PKu9k5tDApthKr1Yf3sI8GFmThGwXv
X-Gm-Message-State: AOJu0YwMX739xmEnbuTP6zu2chFIzS+Cazor3Gq9dvVXSwlTWYOpfH/E
	0k540HD2PA5AWloQwr/0sXPBEEJAtuWo28fEIoZWnGzACheSY7aDaiwZz5ZRrH0MeSkV068WZxo
	U
X-Google-Smtp-Source: AGHT+IEC0CDP0bDBfbMIjFEkMmYLMkd2f57m5y9kD8ICNopXNU3jIBLcFtokK52DuZ5+ZsbDfbsI2Q==
X-Received: by 2002:a25:107:0:b0:dc3:696f:167e with SMTP id 7-20020a250107000000b00dc3696f167emr2985450ybb.64.1707942157848;
        Wed, 14 Feb 2024 12:22:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWorKHcjmhcw5vyYWnFvwZw6VztVvoCLKGsyA1eoA9B+oi84jF8qnFLv7pyJUCZKEJRJK+MKOna4JG+sDxFDWq+PA66BNowlkVH86rMa/ayl+aao8DgR3o5PwED6zG8DnmgvGVsO8qawEOkFwykCxPhVez3xNOqDI6wd5unVyhGYIfRIH38I8XubcOjRv89Ynb4GBYa6C9o0GtlltWbyonzT4muKLaD
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id x188-20020a25e0c5000000b00db41482d349sm2298950ybg.57.2024.02.14.12.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 12:22:37 -0800 (PST)
Date: Wed, 14 Feb 2024 15:22:35 -0500
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Helge Deller <deller@gmx.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] parisc: Fix csum_ipv6_magic on 64-bit systems
Message-ID: <Zc0hC2SQuexTMjs4@ghost>
References: <20240213234631.940055-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213234631.940055-1-linux@roeck-us.net>

On Tue, Feb 13, 2024 at 03:46:31PM -0800, Guenter Roeck wrote:
> hppa 64-bit systems calculates the IPv6 checksum using 64-bit add
> operations. The last add folds protocol and length fields into the 64-bit
> result. While unlikely, this operation can overflow. The overflow can be
> triggered with a code sequence such as the following.
> 
> 	/* try to trigger massive overflows */
> 	memset(tmp_buf, 0xff, sizeof(struct in6_addr));
> 	csum_result = csum_ipv6_magic((struct in6_addr *)tmp_buf,
> 				      (struct in6_addr *)tmp_buf,
> 				      0xffff, 0xff, 0xffffffff);
> 
> Fix the problem by adding any overflows from the final add operation into
> the calculated checksum. Fortunately, we can do this without additional
> cost by replacing the add operation used to fold the checksum into 32 bit
> with "add,dc" to add in the missing carry.
> 
> Cc: Charlie Jenkins <charlie@rivosinc.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> This patch does not completely fix the problems with csum_ipv6_magic seen
> when running 64-bit parisc images with the C3700 emulation in qemu. That
> is due to unaligned 64-bit load operations which (presumably as part of
> unaligned trap handling) generate bad carry flags. It is unknown if that
> is a problem with the qemu emulation or with the Linux kernel, so it is not
> addressed here.
> 
>  arch/parisc/include/asm/checksum.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/parisc/include/asm/checksum.h b/arch/parisc/include/asm/checksum.h
> index e619e67440db..c949aa20fa16 100644
> --- a/arch/parisc/include/asm/checksum.h
> +++ b/arch/parisc/include/asm/checksum.h
> @@ -137,8 +137,8 @@ static __inline__ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
>  "	add,dc		%3, %0, %0\n"  /* fold in proto+len | carry bit */
>  "	extrd,u		%0, 31, 32, %4\n"/* copy upper half down */
>  "	depdi		0, 31, 32, %0\n"/* clear upper half */
> -"	add		%4, %0, %0\n"	/* fold into 32-bits */
> -"	addc		0, %0, %0\n"	/* add carry */
> +"	add,dc		%4, %0, %0\n"	/* fold into 32-bits, plus carry */
> +"	addc		0, %0, %0\n"	/* add final carry */
>  
>  #else
>  
> -- 
> 2.39.2
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


