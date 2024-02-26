Return-Path: <linux-parisc+bounces-666-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E33867FE6
	for <lists+linux-parisc@lfdr.de>; Mon, 26 Feb 2024 19:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B4181F25CEF
	for <lists+linux-parisc@lfdr.de>; Mon, 26 Feb 2024 18:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908281E89C;
	Mon, 26 Feb 2024 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BWWVeq6L"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86171E868
	for <linux-parisc@vger.kernel.org>; Mon, 26 Feb 2024 18:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708972524; cv=none; b=rp1uOT7yrW63NXfTKc6t5KrNbqDKvfN6+TDIGvOne9J8f4uwilH9WSURqFv/x8SyUjdD6w+kXm9fZ4sC6l+mRxogMyeql8Cy3H0bBVO9XBkkhRhOBjkUpoV8mCZs83RJQKZ6y6OokV0dO1Wy9hkQE5px3nkT+vSOhMdgNrtIltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708972524; c=relaxed/simple;
	bh=WWopHdY8Md81FuR91ubhLw3CIB1F9V2oBwmk2nGBKec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TckctSZT5x82p02JGri8QCucOb2LFvhw3t6cXR6JMO0fr+5MWYLCq1mA5/ZiGoxuW/MdJXImNWZOXyVBpS1dbUz1Zu8mBe3J7cC8d8TNtSNwdX1Hv3cgl/HaZ4pv9+SFTfvqupdjbRoPAaBwc96k6xL1o73sy4jog38dLqU6/1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BWWVeq6L; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so29270585ad.1
        for <linux-parisc@vger.kernel.org>; Mon, 26 Feb 2024 10:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708972522; x=1709577322; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hw6lDBVvZVaoT5voqNH6HBuUGCB84uuT6JNYSXYgCm4=;
        b=BWWVeq6L0b5wwNs3uriQlatdZDzDHqfnE/JRnoHNg8po7ETmyEERjjDfJ8rDnmR8P4
         4yNBnlwDsgmWUYqRj6NF4qXIt/qxIxJvqCadgiq1TdQkThMVPfOjbFVfR/NJmcvsG1py
         eo6Eu7ol7ZHJEH/zQk9TxGJkdzEo44FtLiXobCbGIBEwXJyDNyh3x9rZm+s5/w153Oif
         ZjL9MoC51gHjilQWYMvOONaOWtXAY0hChsLqEJEKA1p3A/UiyhkzZV9585fm6qOaU51M
         AJcLZ4fp+Yq/agZWKO/LrMxKYUBLc3D0TMYBvs2DK3WyF8gNuGRhiq7qMy45SkT56aso
         pgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708972522; x=1709577322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hw6lDBVvZVaoT5voqNH6HBuUGCB84uuT6JNYSXYgCm4=;
        b=slOjxxCD3TnCwC9FmrU2o8tJrYnitZOfndVtGpn8o+HDTm0b/2uEzJOgLvMDAq0vLi
         38QHlinlgqjQpQe3fFOuoRa/ShlL2GMyO/rB89g0V7xASga9V4VUjVqEt4s9yp3KBwq+
         vSLD8YPXfgl7rRinDNt5LqNScIo3psXLq1qzyzxPdhg9SlvjugPgtEYl4+eNcrQlvA5j
         jnaMIL7SMEchglQ+M7Zj+ma+yDuOuQW840rrlDpDcpaJLk3VruiVFbiPzfHQC6lbdChI
         c+4hl3abXKnlVPVypWOecdKHxBsXm4l18qkVh5AweX5Bu7sv2GjkI/JIaIFlNjaW6Lu7
         2v/g==
X-Forwarded-Encrypted: i=1; AJvYcCWEu5kNRWmED7QM+1Pe7lk6r2liOPQZ8iYcKBhZIsLBXewvBJqdsx9HnPlUOyTpBoO+RSLBusrXUymZt6aFqk2dl7oKdiHIvENG7SjV
X-Gm-Message-State: AOJu0YwXaHa7SpKHvE0WauCeYEi1sdM6/wfsrqeE+RNa7MNo+xonoxsJ
	W12c5Pl67unn/Bu4ZwZEJL39O2x9G/Zq8CbUH8lWZ2yLo3i4Wea6RJaoWbnm+nU=
X-Google-Smtp-Source: AGHT+IFLhP5psYVyjx40hbzYLeS2d/I0I4J4aVqBaUBTza9Iak7Uinrj5RB0XUTFvA/Q90Nz44eSxQ==
X-Received: by 2002:a17:902:d548:b0:1dc:b008:f678 with SMTP id z8-20020a170902d54800b001dcb008f678mr2012067plf.18.1708972522069;
        Mon, 26 Feb 2024 10:35:22 -0800 (PST)
Received: from ghost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id d20-20020a170903209400b001db83d42322sm2437plc.185.2024.02.26.10.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 10:35:21 -0800 (PST)
Date: Mon, 26 Feb 2024 10:35:18 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v10] lib: checksum: Use aligned accesses for ip_fast_csum
 and csum_ipv6_magic tests
Message-ID: <ZdzZ5tk459bgUrgz@ghost>
References: <20240223-fix_sparse_errors_checksum_tests-v10-1-b6a45914b7d8@rivosinc.com>
 <7ae930a7-3b10-4470-94ee-89cb650b3349@csgroup.eu>
 <e11fea7a-e99e-4539-a489-0aa145ee65f0@roeck-us.net>
 <ZdzPgSCTntY7JD5i@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdzPgSCTntY7JD5i@shell.armlinux.org.uk>

On Mon, Feb 26, 2024 at 05:50:57PM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 26, 2024 at 08:44:29AM -0800, Guenter Roeck wrote:
> > On 2/26/24 03:34, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 23/02/2024 � 23:11, Charlie Jenkins a �crit�:
> > > > The test cases for ip_fast_csum and csum_ipv6_magic were not properly
> > > > aligning the IP header, which were causing failures on architectures
> > > > that do not support misaligned accesses like some ARM platforms. To
> > > > solve this, align the data along (14 + NET_IP_ALIGN) bytes which is the
> > > > standard alignment of an IP header and must be supported by the
> > > > architecture.
> > > 
> > > I'm still wondering what we are really trying to fix here.
> > > 
> > > All other tests are explicitely testing that it works with any alignment.
> > > 
> > > Shouldn't ip_fast_csum() and csum_ipv6_magic() work for any alignment as
> > > well ? I would expect it, I see no comment in arm code which explicits
> > > that assumption around those functions.
> > > 
> > > Isn't the problem only the following line, because csum_offset is
> > > unaligned ?
> > > 
> > > csum = *(__wsum *)(random_buf + i + csum_offset);
> > > 
> > > Otherwise, if there really is an alignment issue for the IPv6 source or
> > > destination address, isn't it enough to perform a 32 bits alignment ?
> > > 
> > 
> > It isn't just arm.
> > 
> > Question should be what alignments the functions are supposed to be able
> > to handle, not what they are optimized for. If byte and/or half word alignments
> > are expected to be supported, there is still architecture code which would
> > have to be fixed. Unaligned accesses are known to fail on hppa64/parisc64
> > and on sh4, for example. If unaligned accesses are expected to be handled,
> > it would probably make sense to add a separate test case, though, to clarify
> > that the test fails due to alignment issues, not due to input parameters.
> 
> It's network driver dependent. Most network drivers receive packets
> to the offset defined by NET_IP_ALIGN (which is normally 2) which
> has the effect of "mis-aligning" the ethernet header, but aligning
> the IP header.
> 
> Whether drivers do that is up to drivers (and their capabilities).
> Some network drivers can not do this kind of alignment, so there are
> cases where the received packets aren't offset by two bytes, leading
> to the IP header being aligned to an odd 16-bit word rather than an
> even 16-bit word (and thus 32-bit aligned.)
> 
> Then you have the possibility of other headers between the ethernet
> and IP header - not only things like VLANs, but also possibly DSA
> headers (for switches) and how big those are.

Those additional combinations can be supported by future test cases,
but the goal of this patch was simply to have basic testing for these
functions. The NET_IP_ALIGN offset is what the kernel defines to be
supported, so that is the test case I went for.

- Charlie

> 
> There's a lot to be researched here!
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

