Return-Path: <linux-parisc+bounces-565-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9C38575DC
	for <lists+linux-parisc@lfdr.de>; Fri, 16 Feb 2024 07:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16B6F1F2338A
	for <lists+linux-parisc@lfdr.de>; Fri, 16 Feb 2024 06:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C5C14A89;
	Fri, 16 Feb 2024 06:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="h/kOCDES"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CBC14A82
	for <linux-parisc@vger.kernel.org>; Fri, 16 Feb 2024 06:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708064040; cv=none; b=oGHZtuQAN1klHJMP1T+Fz2OzuLbKxwFXdSsgfGPMjxYxXfE0/tKKofJqoVV7jSoxTApusDk2hZS4gBjO9tlzF1c9q0LE6j68JGrY8FROZKJMvc95b5c/1uxExP1UTXYNWombIEwdhUg1zPdDXVuXjg6CkwzO/74rObS69wQmC5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708064040; c=relaxed/simple;
	bh=cUfM/WfnLkFu33YbZxoDPHb1rewvKGnAt9h5xC0MTPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gL+aa26WIQ0gb4LzqwFsqU3LD57ZTez2T14RszIua1xjoXTykLG+U21KwIM9w1D65TmxJBxoTw17eB26vWImarFB+2qGLjsqw2ZdcGMdl+mefpcMIX0T5orOWf8L2p0OK76qiQsx343VwHc5xlb9JrBXt5jIDfQ82v4O9/K6KKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=h/kOCDES; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-607cb7c44a7so15668297b3.3
        for <linux-parisc@vger.kernel.org>; Thu, 15 Feb 2024 22:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708064037; x=1708668837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4aCtGfyNdlqfsMUTpSTCwgN7iAaWwbzmkUw3QrrjOWU=;
        b=h/kOCDESWyJVOmnRbAa+SJC+s0RNXx9eI4Vic/PVX0I2fAi2VY3O9wpdTdi+sQ50TU
         qYTGIdLj5S3LLJq8V7BGSn8xzwKG+5Si7yRjBEXKhCnTvU4kEX3a9kAR4tHz1dz2rcEi
         HES9k+ayTiAQIBKScUhea+CUTPT8/o7ZzNBh0Xrhcn9aN7UWskvF+oKifcvMGoZp0m33
         CpRsLOaomP2U+b2kM+qCWWVynggQZ0W0viq9igDD3JjD3mN64DmDywEs+UoAT3Zw64NH
         GVaWSt5uV8ivN3l+CEwlj+aeVImDyxZWHUPzuvLgK700xR2G0oDuIflDp6oco7leIVOQ
         xiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708064037; x=1708668837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aCtGfyNdlqfsMUTpSTCwgN7iAaWwbzmkUw3QrrjOWU=;
        b=D1+TytNFc94/T8Rqp8MGBVtFlFJYOY6GZT3mk3i6OuvcV9cuyCu8Aq2wxgmEJEguYa
         PMRlRjqTClKUY8Bbj/NzsWfhaHiwMAdoX7JNjJpJ+suehbAcVsWoKrj8G+jI+ItNVIgk
         pwtRWXOzlsiOEIhxVUbjbH5spHJwgO4B4+k8AQjAXavCQnwf29oTMf/GDFF4PUbV+qZ7
         V5cl2XPaOTkMmr2D5wcmb1UqqxnVteIRN0mLV9ahsd3mR0VwG5T4zSiOHTAvyyNdhooU
         /2OXcceOEKKdaR2qnqY2N7VMtzwEYiE63kEBYigDz4FyKbr2EYCP2rFe8V0ET3K16G3m
         TN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXfJPpAox8p7FRL1VJTngzdIJH5w2CxAftEoWwQSIwIpaTExk7Ftsjzwkt73pH7/e46A6N38QLXKwh2Ln89OI2KtUde1Z/Wv8rm8R7
X-Gm-Message-State: AOJu0YxFk0MBNUGneyq96ib1xj93j0xZN0KLxms0ItqjXFIhWGvuh1sP
	CJ+jT3I3MFRRSDm4+2JniJeNe80is0iiprtYByn+xHU6upEGbd8iIfjFJFwO+Yo=
X-Google-Smtp-Source: AGHT+IHR95joioUs84j18kFTCoqu1m3ae/coyokCeXMsss6aN76J8J9/Pr2jIi8VPTKkIj71s4jKYw==
X-Received: by 2002:a81:7bc5:0:b0:604:9c2e:923f with SMTP id w188-20020a817bc5000000b006049c2e923fmr4213037ywc.32.1708064037277;
        Thu, 15 Feb 2024 22:13:57 -0800 (PST)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id t8-20020a0dea08000000b00607a1d2300bsm222941ywe.14.2024.02.15.22.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 22:13:56 -0800 (PST)
Date: Fri, 16 Feb 2024 01:13:55 -0500
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Helge Deller <deller@gmx.de>, David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Message-ID: <Zc79I5VDSaFnb4xj@ghost>
References: <20240214-fix_sparse_errors_checksum_tests-v8-0-36b60e673593@rivosinc.com>
 <20240214-fix_sparse_errors_checksum_tests-v8-2-36b60e673593@rivosinc.com>
 <2ec91b11-23c7-4beb-8cef-c68367c8f029@roeck-us.net>
 <Zc1pSi59aDOnqz++@ghost>
 <cb4e358b-3fd0-4ca4-bf53-9cc379087304@roeck-us.net>
 <25f108d1-827f-4a18-bee4-4105fbd45974@gmx.de>
 <6aaa4b89-a967-4b19-b4bf-a1ad5c8e9faa@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aaa4b89-a967-4b19-b4bf-a1ad5c8e9faa@roeck-us.net>

On Thu, Feb 15, 2024 at 10:09:42PM -0800, Guenter Roeck wrote:
> On 2/15/24 21:54, Helge Deller wrote:
> [ ... ]
> > 
> > Can you please give a pointer to this test code?
> > I'm happy to try it on real hardware.
> > 
> You should also see the problem if you use v7 of Charlie's checksum
> unit test fixes.
> 
> I submitted the qemu fix (or at least what I think the fix should be)
> a couple of minutes ago.
> 
> https://patchwork.kernel.org/project/qemu-devel/patch/20240216053415.2163286-1-linux@roeck-us.net/
> 
> > > It is quite easy to show that carry is always set after executing ldd
> > > on an unaligned address. That is also why I know for sure that the
> > > problem is not seen with ldw on unaligned addresses.
> > Interesting.
> 
> Ultimately it wasn't surprising, with the unusual carry bit
> implementation on hppa. The upper 8 carry bits were not masked
> correctly when returning from a trap or interrupt.

Tangential question, but why does Linux need to save and restore the PSW
if that is already handled by the hardware? I am missing something.

- Charlie

> 
> > In general I think it's quite important to differentiate between
> > running on qemu or running on physical hardware.
> 
> I know, that makes testing always tricky (not just with this
> architecture) because it is often not obvious if the problem
> is a problem in the tested code or a problem in the emulation.
> 
> > Qemu just recently got 64-bit support, and it's not yet behaving
> > like real hardware. One thing I noticed is, that read hardware
> > does not seem to jump into the exception handler twice, while
> > qemu does. So, if you run into an exception (e.g. unaligned ldd)
> > then if a second exception happens in the fault handler (e.g. second
> > unaligned ldd to resolve wrongly-coded code lookup), you will
> > get different behaviour between hardware and emulation.
> 
> Hmm, interesting. Makes me wonder how the real hardware handles such
> double traps.
> 
> > This is also the reason why qemu still fails to emulate newer
> > 64-bit Linux kernels which uses kernel modules.
> > 
> I don't use modules in my testing, so I'll leave that alone for
> anther day.
> 
> Cheers,
> Guenter
> 

