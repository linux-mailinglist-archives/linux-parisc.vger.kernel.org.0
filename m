Return-Path: <linux-parisc+bounces-538-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CD8559A8
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Feb 2024 05:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5996528D31A
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Feb 2024 04:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106F98828;
	Thu, 15 Feb 2024 04:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Fu10XzBV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505056FB8
	for <linux-parisc@vger.kernel.org>; Thu, 15 Feb 2024 04:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707970270; cv=none; b=Dc5bZGMSkOF0QhqCAbKnK3x+MsHPiiDuRS09nqb0UTRGC3oBMldChpZ1xm8Kh9zOLddrp9LMvN/L1DjOrPsDj8cr9zqsPjmfa0qkTWgwHgAATypYudSGWQeFox4ESERyxNsVv8APdvZKu4XZHnstcPMNGPbtb6TfNb/2czbj1Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707970270; c=relaxed/simple;
	bh=2rRp0JACJhwbsq6J9JN2nlwYu0yt+O040xpXCjRjWTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9NeSC2dAFNrDoVfVIGU/BMSPa9svWwsueSf8JhrWE/iiW/B44mP0FY+GGq9qmP8SL0gxmUlAxpteYkzA9tj/L5lYFLFObMEXZhE7WOObZtOaZfBMsr2KB3qBwixrwKolPnkWD00uwCX6r6ygFxItTOenMKBAPPaqB9XpD+BSRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Fu10XzBV; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60777be1a1bso4815477b3.1
        for <linux-parisc@vger.kernel.org>; Wed, 14 Feb 2024 20:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707970267; x=1708575067; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vz7wtyjaBs6IT2RmP4ZaWJkhpuz2ao8tMgOcBDUAX0w=;
        b=Fu10XzBVBbI14NbomPrPtX4Md8oc+T4KtGzLsbjzjWzKftD1gWTr+Mp39I495/tSXk
         o7fzQrHBGVxdwsvwS+tGMdpeGL5QRMtfuPW+k+EAxDXlvpioztP9yccQZpgb38ytvyCn
         E/drJosCfKtFD8RT08LO0Z8SfIQcBYl36Tgr2TOpJRBgZP1An0G0su3EUv+9pyfEOttr
         P/JwQybOfQQ03uCjeIlI6FcCzJ9SmwIjJ3M/Wxth9qYNcXz/G7G9gSAOK+ojlVvAudpc
         nDaQazKYBXJ1M3d6cHq1p1FsyYfuKmH5Sv9sstkE6Xmt+7r0xGLCOxt46os0W4FLyvAP
         aUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707970267; x=1708575067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz7wtyjaBs6IT2RmP4ZaWJkhpuz2ao8tMgOcBDUAX0w=;
        b=UziUJe6fAgJstVnkUwm9PrJ0nR8pvwVz9ZvI1pI0Y38hB2nYjQoX31519vp9/zoFfP
         PBnILF6GX8xUsDKEOApMomL93BbbceFilGhsPVGDT97AkCxalwPgI/9AUfFTfX9FR5aO
         eieJcTen0IvclD8WmKmiAtup2Z1JKpUqYVu38eV7+ltKhmkzqSNw3LFe/FppghgVYhJX
         DpEAYIZQucnYjrrRkziXyliyG6/P8On/XKG3t0SU1FOSKxT5euwuUjWbTpwMXnzBZ3Up
         ywm1qKL8wydTP0ZkLYK50yB4JCL4IWrJbaim60nlCjSKhlxWiU9J9RER97N9qmtaDNGc
         Peew==
X-Forwarded-Encrypted: i=1; AJvYcCWnMP9QPRLIr0K526TF+UsjPVoOUlfc/U76fbIAUGWQhVP3+bgdmyFzQwrbPS21tC+dq7Zyjn9/+mRVlaGV8ABiJ2ntFojhVK0oRsD5
X-Gm-Message-State: AOJu0YytGlbVITiEjR8LUqtLmqzxAV/Uny8Dps41I+TOk71Onf5eow54
	qpgtLUN0Unc0dMVtYTKoinDJGxswRlQ6kGmVCUfMuUso8bakmYSJrt+zBaGjY4M=
X-Google-Smtp-Source: AGHT+IHKFCksUznhvXASVia00X9eoAhYoCoMMCG7V87ajBl03nCJY0V1a19b0wmW3KRP6cy4WSU6Sw==
X-Received: by 2002:a0d:cbd0:0:b0:607:a98c:81a1 with SMTP id n199-20020a0dcbd0000000b00607a98c81a1mr627323ywd.28.1707970267212;
        Wed, 14 Feb 2024 20:11:07 -0800 (PST)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id w70-20020a0dd449000000b00607835ad45csm97515ywd.54.2024.02.14.20.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 20:11:06 -0800 (PST)
Date: Wed, 14 Feb 2024 23:11:04 -0500
From: Charlie Jenkins <charlie@rivosinc.com>
To: John David Anglin <dave.anglin@bell.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Message-ID: <Zc2O2CwlQw2NN2MP@ghost>
References: <20240214-fix_sparse_errors_checksum_tests-v8-0-36b60e673593@rivosinc.com>
 <20240214-fix_sparse_errors_checksum_tests-v8-2-36b60e673593@rivosinc.com>
 <2ec91b11-23c7-4beb-8cef-c68367c8f029@roeck-us.net>
 <Zc1pSi59aDOnqz++@ghost>
 <cb4e358b-3fd0-4ca4-bf53-9cc379087304@roeck-us.net>
 <1d5e059e-5b31-415d-ae41-593415812e94@bell.net>
 <Zc2GfgiCpevtKTtS@ghost>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zc2GfgiCpevtKTtS@ghost>

On Wed, Feb 14, 2024 at 10:35:26PM -0500, Charlie Jenkins wrote:
> On Wed, Feb 14, 2024 at 10:00:37PM -0500, John David Anglin wrote:
> > On 2024-02-14 8:58 p.m., Guenter Roeck wrote:
> > > Specifically: Yes, the carry/borrow bits should be restored. Question is
> > > if the Linux kernel's interrupt handler doesn't restore the carry bits
> > > or if the problem is on the qemu side.
> > The carry/borrow bits in the PSW should be saved and restored by the save_specials
> > and rest_specials macros.  They are defined in arch/parisc/include/asm/assembly.h.

To clarify my previous point, even if rest_specials is restoring PSW,
the "restored" values are going to be overwritten during the rfi
instruction, since that instruction is defined to restore PSW. The
handshake here seems to be lost, with both the hardware and linux
messing with PSW and IPSW and both expecting the other to not mess with
the values.

> 
> Why would they be needed to be restored in linux? The manual says "The
> PSW is set to the contents of the IPSW by the RETURN FROM INTERRUPTION
> instruction". This means that the PSW must be restored by the hardware.
> 
> We can see the QEMU implementation in:
> 
> rfi:
> https://github.com/qemu/qemu/blob/v8.2.1/target/hppa/sys_helper.c#L93
> 
> handling interrupt:
> https://github.com/qemu/qemu/blob/v8.2.1/target/hppa/int_helper.c#L109
> 
> However the implementation appears to be faulty. During an RFI, the PSW
> is always set to 0x804000e (regardless of what the PSW was before the
> interrupt).
> 
> - Charlie
> 
> 
> > 
> > However, it appears the tophys macro might clobber the carry bits before they
> > are saved in intr_save.
> > 
> > Dave
> > 
> > -- 
> > John David Anglin  dave.anglin@bell.net
> > 

