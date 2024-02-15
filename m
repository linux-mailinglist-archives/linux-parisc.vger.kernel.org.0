Return-Path: <linux-parisc+bounces-542-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A828567F7
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Feb 2024 16:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97F541C23789
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Feb 2024 15:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7B3132C3D;
	Thu, 15 Feb 2024 15:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2oLpDIOZ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AFC133988
	for <linux-parisc@vger.kernel.org>; Thu, 15 Feb 2024 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708011391; cv=none; b=sEbBaB8m+GqSB4kWor3UfYE/xxX4hUHx/+LqpPbQAVqLw01pOPuqf++jY+Kolcj0St5mQXu0iviCQNCr1d0zQfrKGW9RJzrWY2W7vFjPGT2Bd5nwIutjgA+yYn0z6wa0ENVhLPlr1eWbs5wlMGkOwVL6aH078uNVxyt3zQ0HhZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708011391; c=relaxed/simple;
	bh=SHOsohQCVk8Mi+NNdj2jfOKDNAp69jy2VOPdCJJt+q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXId3dZFnWv8RGM4KNMtNuYJy88/GzulA8kY2uuiAR8Y7zcwo347CZoVd0arJkuqX58l757cO16Ziout08Wg7WczlN0NqpMbS4lJcxmqZTRW/B36n+bbu9FHcidLpzLqvr1RRQZE59tiyNYvfh7qtiWMfXchPnQS4zz/IFuKXzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2oLpDIOZ; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so1021145276.1
        for <linux-parisc@vger.kernel.org>; Thu, 15 Feb 2024 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708011388; x=1708616188; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3pd5Z9bCkRZAvWYNH8OwXvr8NmpG4s7j8kTUQAlhIF4=;
        b=2oLpDIOZey5aXGIFeJU/a8LsbfzBerJdeFKtvnkiI2NcCSfwLCvF6Go4QOctBC1Xhp
         C2i/KFFD2BsLDAuJLcVSntfVAiSinwyiBJBvqiljxbL5O5FB7Ew/HXd++dIyCBwqs5rW
         y/Zrwd3EBkrir7ZT8yAbbn1HNnlYRRifI4T6iqtoBAvYWVfGI452pOdpDyzEImABRzGm
         DTKDMJZgSHxU2Xb9r7A/+grrL+MMa8hyseazQjGNtozONBSx0f+Plme/M0iv42090UHm
         5b9Ltedlv8Ba54ABuuzIvG0eMWluPTtEgBTN+vMlqg0eEgHtPh4Y39JHdgSQH9/Fv0uV
         R+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708011388; x=1708616188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pd5Z9bCkRZAvWYNH8OwXvr8NmpG4s7j8kTUQAlhIF4=;
        b=iqdbbO5koMce6n54CiikqOHS0oPAOUeEnglXfwKzXRxM1Cg3Ph3nEP4/5pWiQIKSWg
         3bw6s+CBzuk++QKMGCJGuaK3xZyosu69+IkENiltBQQ72dxYTphjjB3kPMrwhiRvAGOr
         GK38jAzFtUGIVIaIuyEXXL+IPCFhML/CNiw7OhDYe8if4qECN9XMrgO0YGl1t+lU+x16
         jSYBJT17GrBoIgfwz4TXjDdlnWW8XXdfImTKXt61T9MTTuzfKzDzP/AmO8KJOS5bWobm
         wBcEUR+iEALYsCmTLipgCWRA1jRRwsg3FkNX2X303sFFC4mnseonO+CIoKrXgCx1+U5+
         WlYg==
X-Forwarded-Encrypted: i=1; AJvYcCXj+sfZs3G8LwpiR16ofmKjI7avvA7JX4RxXQcERGdSMYSziMupARjXxhnpaOCxjUsrIKCd9ktoqJGtCfMIpRpWsS4KAaoZdXeZhr0X
X-Gm-Message-State: AOJu0YyxeQnACXq07aq12t62l+GUqBE+OXJ1uTH6dtJKMsmdFdJTIEUy
	xNIRZPhA9V+HCoDbC1aSMvOsUaU5dXXkwJMAWk8njj+Ytfk7DUCUGhcLbkU2lT4=
X-Google-Smtp-Source: AGHT+IG6vRmSD1zRYeD4ymw86uKgfET3PGueEePIwXpcqRD4LLeLf4tbUBRqs/U4ycSYhu5gSVFJTw==
X-Received: by 2002:a25:84cd:0:b0:dbd:5bfa:9681 with SMTP id x13-20020a2584cd000000b00dbd5bfa9681mr1648224ybm.37.1708011387748;
        Thu, 15 Feb 2024 07:36:27 -0800 (PST)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id i15-20020a056902068f00b00dc73705ec59sm218316ybt.0.2024.02.15.07.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 07:36:27 -0800 (PST)
Date: Thu, 15 Feb 2024 10:36:25 -0500
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
Message-ID: <Zc4veRSmxHHqu/bB@ghost>
References: <20240214-fix_sparse_errors_checksum_tests-v8-0-36b60e673593@rivosinc.com>
 <20240214-fix_sparse_errors_checksum_tests-v8-2-36b60e673593@rivosinc.com>
 <2ec91b11-23c7-4beb-8cef-c68367c8f029@roeck-us.net>
 <Zc1pSi59aDOnqz++@ghost>
 <cb4e358b-3fd0-4ca4-bf53-9cc379087304@roeck-us.net>
 <1d5e059e-5b31-415d-ae41-593415812e94@bell.net>
 <Zc2GfgiCpevtKTtS@ghost>
 <11fff7fe-ec4c-4340-a67f-d1d54d0712d8@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11fff7fe-ec4c-4340-a67f-d1d54d0712d8@roeck-us.net>

On Thu, Feb 15, 2024 at 12:56:13AM -0800, Guenter Roeck wrote:
> On 2/14/24 19:35, Charlie Jenkins wrote:
> > On Wed, Feb 14, 2024 at 10:00:37PM -0500, John David Anglin wrote:
> > > On 2024-02-14 8:58 p.m., Guenter Roeck wrote:
> > > > Specifically: Yes, the carry/borrow bits should be restored. Question is
> > > > if the Linux kernel's interrupt handler doesn't restore the carry bits
> > > > or if the problem is on the qemu side.
> > > The carry/borrow bits in the PSW should be saved and restored by the save_specials
> > > and rest_specials macros.  They are defined in arch/parisc/include/asm/assembly.h.
> > 
> > Why would they be needed to be restored in linux? The manual says "The
> > PSW is set to the contents of the IPSW by the RETURN FROM INTERRUPTION
> > instruction". This means that the PSW must be restored by the hardware.
> > 
> > We can see the QEMU implementation in:
> > 
> > rfi:
> > https://github.com/qemu/qemu/blob/v8.2.1/target/hppa/sys_helper.c#L93
> > 
> > handling interrupt:
> > https://github.com/qemu/qemu/blob/v8.2.1/target/hppa/int_helper.c#L109
> > 
> > However the implementation appears to be faulty. During an RFI, the PSW
> > is always set to 0x804000e (regardless of what the PSW was before the
> > interrupt).
> > 
> 
> Not sure if I agree. The interrupt handler in Linux is the one which needs to set
> IPSW. Looking into the code, I agree with Dave that the tophys macro seems to
> clobber the carry bits before psw is saved, so they can not really be restored.
> The only issue with that idea is that I can only reproduce the problem with
> an interrupted ldd instruction but not, for example, with ldw. This is why it
> would be really important to have someone with real hardware test this.
> 
> Thanks,
> Guenter

Yes, we definitely feedback from somebody with access to hardware, but I
do not understand how "The PSW is set to the contents of the IPSW by the
RETURN FROM INTERRUPTION" could be interpreted as anything except that
the hardware is expected to over-write the contents of the PSW during
the rfi.

- Charlie

> 

