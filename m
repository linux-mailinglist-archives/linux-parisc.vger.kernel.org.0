Return-Path: <linux-parisc+bounces-545-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE14F8569FB
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Feb 2024 17:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3117DB2296D
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Feb 2024 16:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BFC136663;
	Thu, 15 Feb 2024 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JUdfLTuP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233D9135A52
	for <linux-parisc@vger.kernel.org>; Thu, 15 Feb 2024 16:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015870; cv=none; b=oFuUPNCTEoidZ7RBn3HU1g6DdBvawGvoN5x3QDQ42z2vWsdAXPBBj1LML2T7CWXaNxhO3jjNyw4yrnRqpOIDZQwva3rifVVAUVywiYhJUa849FQxRyLMEJrtstwTfDzmTcJ12XdymHwvOxsPz+CqhrdGAsTmLNyGPeD67FVQOcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015870; c=relaxed/simple;
	bh=k3IunI3QdP19FssKwKtKX8zK06UfvUUr1e9oMDmTQ/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQlGxO1CUUfkIpSQuAsBcTfFkLe7PwBYQmKm6s3B9b8PLJCvPeKRzBx5JcXlN8FYU9e427SrJjVUf8qVfzkxE+qLus1zsi1VutZWoxxKsQITjBn/cZW/MhwfzUPnyZo6BnwCxuoFOaa/w2lg63hzyqDIi8YNm+g0B5WnvnBpJEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JUdfLTuP; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-607e37cd180so4687337b3.0
        for <linux-parisc@vger.kernel.org>; Thu, 15 Feb 2024 08:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708015867; x=1708620667; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GafFwUWQ5RT68PQ7+bJq6hZ/YFA02lSq/4McrUwaS1o=;
        b=JUdfLTuP8+wKvcbkqYW5ywl1XyX1AQ/YZNBrOuz8+zmbhGLnoQ5OnFWH8CKjcaW9rk
         annKq3a343usEHNGXwjGdJ1hCxjzq+cR9Y4R7Xsy8VrmZlz1uGlx6KmPXC+5YORBfNs6
         EA3UD7nvWJbM1Wz5+XV4K9ZvjX+eN1VaiPmxBRZwrBiAU2o3jKBPgME9r37+n1YVLcEQ
         JpxeFwP93cjlnWKogm83q9Xl19A2qfQPofU6Vyg5c17kanpPD0BDCuBI2qsgxTBb6qVY
         JesXOj+NALU5woIS9w37XJ/lRvKKC5iiIXv/+d3mHfgSP3TQcqgIz3xi0O2mRp7N6cKF
         P8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708015867; x=1708620667;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GafFwUWQ5RT68PQ7+bJq6hZ/YFA02lSq/4McrUwaS1o=;
        b=CiZ7g46Xa4L3XxDHGgT11vbyjvnuhNNKxPsy6+GIoUw4nWJCREFqibus5E8i9SpNpp
         XA/JF9ZyExbDt37jzGMl8iYO5jjC5E/jHrpOTNptw7R4aBLrocMjBId3ioPNU0QBn1nx
         0n8s+GItlSj9O5aosJGRI0GrTwcfIyIS0S2sKYURJZqpolfWl2YV99C+A6xXgVTpD7KY
         +XKsl8eq6ov9ruO5jPBaq4UrhXffHL1kxW0Mn1LJz2JPR1Vy5giYQyDl8w0HbxVFlwbz
         lLXHjw1GtcN2hrBCmzbG0m5cxCnBvCmElZZMHNmPoyiTMweTnV8hV1WhXT8RZMkhsByv
         lloQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK0OuKUclB1tsV/k+MUvB2xy/BhYn8BQH6UulmBpiry3IGrowmGpROqFy5tUV2q+D1jLifmWLL/MxGP9oYI31SuBxvPmApJ9Dhit6o
X-Gm-Message-State: AOJu0Yw3ME9sQ8SlqD/xOvSVMboVfF3lPwGTKAjTBo/BPMHWFL9T8+Q1
	uLumCM1IdRZPnnrMwRnFTYpdydhJnxprAENXWQk1HYjkqZ4+MR8APIGa0o4YbhY=
X-Google-Smtp-Source: AGHT+IHHVJKgZe6odd52Cm+vTQZ9r5ZcabHDlvdTYbz6VhdI+bE3ZFo6ASgaSOOQW+Vp+Uty9H4lrQ==
X-Received: by 2002:a81:ac43:0:b0:607:8efe:979c with SMTP id z3-20020a81ac43000000b006078efe979cmr2086167ywj.41.1708015866852;
        Thu, 15 Feb 2024 08:51:06 -0800 (PST)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id a189-20020a0dd8c6000000b006078ad0243csm315629ywe.59.2024.02.15.08.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:51:06 -0800 (PST)
Date: Thu, 15 Feb 2024 11:51:05 -0500
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: John David Anglin <dave.anglin@bell.net>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Message-ID: <Zc5A+c0gmxtygNIa@ghost>
References: <20240214-fix_sparse_errors_checksum_tests-v8-0-36b60e673593@rivosinc.com>
 <20240214-fix_sparse_errors_checksum_tests-v8-2-36b60e673593@rivosinc.com>
 <2ec91b11-23c7-4beb-8cef-c68367c8f029@roeck-us.net>
 <Zc1pSi59aDOnqz++@ghost>
 <cb4e358b-3fd0-4ca4-bf53-9cc379087304@roeck-us.net>
 <1d5e059e-5b31-415d-ae41-593415812e94@bell.net>
 <Zc2GfgiCpevtKTtS@ghost>
 <11fff7fe-ec4c-4340-a67f-d1d54d0712d8@roeck-us.net>
 <Zc4veRSmxHHqu/bB@ghost>
 <0fa4d53a-6ce7-4f44-81b2-86282f0b9451@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fa4d53a-6ce7-4f44-81b2-86282f0b9451@roeck-us.net>

On Thu, Feb 15, 2024 at 08:30:22AM -0800, Guenter Roeck wrote:
> On 2/15/24 07:36, Charlie Jenkins wrote:
> > On Thu, Feb 15, 2024 at 12:56:13AM -0800, Guenter Roeck wrote:
> > > On 2/14/24 19:35, Charlie Jenkins wrote:
> > > > On Wed, Feb 14, 2024 at 10:00:37PM -0500, John David Anglin wrote:
> > > > > On 2024-02-14 8:58 p.m., Guenter Roeck wrote:
> > > > > > Specifically: Yes, the carry/borrow bits should be restored. Question is
> > > > > > if the Linux kernel's interrupt handler doesn't restore the carry bits
> > > > > > or if the problem is on the qemu side.
> > > > > The carry/borrow bits in the PSW should be saved and restored by the save_specials
> > > > > and rest_specials macros.  They are defined in arch/parisc/include/asm/assembly.h.
> > > > 
> > > > Why would they be needed to be restored in linux? The manual says "The
> > > > PSW is set to the contents of the IPSW by the RETURN FROM INTERRUPTION
> > > > instruction". This means that the PSW must be restored by the hardware.
> > > > 
> > > > We can see the QEMU implementation in:
> > > > 
> > > > rfi:
> > > > https://github.com/qemu/qemu/blob/v8.2.1/target/hppa/sys_helper.c#L93
> > > > 
> > > > handling interrupt:
> > > > https://github.com/qemu/qemu/blob/v8.2.1/target/hppa/int_helper.c#L109
> > > > 
> > > > However the implementation appears to be faulty. During an RFI, the PSW
> > > > is always set to 0x804000e (regardless of what the PSW was before the
> > > > interrupt).
> > > > 
> > > 
> > > Not sure if I agree. The interrupt handler in Linux is the one which needs to set
> > > IPSW. Looking into the code, I agree with Dave that the tophys macro seems to
> > > clobber the carry bits before psw is saved, so they can not really be restored.
> > > The only issue with that idea is that I can only reproduce the problem with
> > > an interrupted ldd instruction but not, for example, with ldw. This is why it
> > > would be really important to have someone with real hardware test this.
> > > 
> > > Thanks,
> > > Guenter
> > 
> > Yes, we definitely feedback from somebody with access to hardware, but I
> > do not understand how "The PSW is set to the contents of the IPSW by the
> > RETURN FROM INTERRUPTION" could be interpreted as anything except that
> > the hardware is expected to over-write the contents of the PSW during
> > the rfi.
> > 
> 
> Sure, I absolutely agree. But that assumes that IPSW is set correctly
> in the Linux interrupt handler. We do know that something odd happens

The manual defines the saving of PSW as the responsibility of the
hardware as well: "When an interruption occurs, the current value of the
PSW is saved in the Interruption Processor Status Word (IPSW)". I don't
think this should be interpreted to mean that a software interrupt
handler is required to save the IPSW.

- Charlie

> when an unaligned ldd is encountered. At least for my part I don't know
> if the problem is in emulate_ldd() in the Linux kernel or in the ldd
> implementation and trap handling in qemu. I do know (from my logs)
> that qemu does see the correct PSW/IPSW values, because they do
> show up correctly in the Linux kernel when running the qemu emulation.
> Only it somehow gets lost when the Linux interrupt handler returns.
> 
> Thanks.
> Guenter
> 

