Return-Path: <linux-parisc+bounces-534-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6498558C6
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Feb 2024 02:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46ADB2866C2
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Feb 2024 01:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E8A1361;
	Thu, 15 Feb 2024 01:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dF6NASLk"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3F815A4
	for <linux-parisc@vger.kernel.org>; Thu, 15 Feb 2024 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707960656; cv=none; b=Apz2hZJCUt+WKHzSA/hblHj9T56sRXGjUVjdmWKjhr5zYoCaeDJHZ4Sa90kA4PGDZuta2WnUGgHfFU/uu23Z0GFNEU+zLsR8cUhOdVATcbF2VgxoIjoJMNFtE/t1EAA83NoPO8xWaNgaKFQhA2Q60YV2kaIgVBNvlpuOgaZs6tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707960656; c=relaxed/simple;
	bh=g4k4IJ7Gzfx0MWMigkwqyIJSZLl4nM8ukKx187W5ttM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVDb1KTJOaJkyixXUcm/q0asDW2T9d++d8884TgK9XqoltwxdkHXXTjGht6phVa9NjRJomGEXTlFE+cx8Ii+St4bUuH0Q9+Ii+Pfe9lepM3CkpieliPwPmZml97G0Y2JwHTIR9X27YTtozG3sJTCXNGGWzTeAytXZBnx4FfZYIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dF6NASLk; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so1281128276.0
        for <linux-parisc@vger.kernel.org>; Wed, 14 Feb 2024 17:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707960653; x=1708565453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yKzSnwYvUSjy2dxJBtIr2LR3lP8pKaeMV+B0sMYP9PU=;
        b=dF6NASLkJi/nG9IrjoK9oCaCRPnvT4Dw16iBAf0geAm6Xk7IkXCw7Lg1bS6A3zIIt8
         snvma0ZKy2Y6C8c5zhzW9P/2mtR2UacanXOJJj4j249q/OeO5lyMULOBhw+z5pyjA6SO
         4EgviHzFJbTiA35tBSpEZqjXWSDSoY5Jigtyl6tfPmhRriFrpaz36+K9kv2+Z6oBHnXw
         IPoZhY59UOIpR2SuG4isaIYZ5Skw/9Kf5vJdt2FG8Q43qrKfIrQaakNIhweaQHOgnbwu
         jHfdNGttLSKErONm9UIO4CqoS27XSm1dehMIF2drGhCDBg8VJhCVp5F2gFiNaCF1UZBw
         iKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707960653; x=1708565453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKzSnwYvUSjy2dxJBtIr2LR3lP8pKaeMV+B0sMYP9PU=;
        b=fyJHOuvpa2VuFFcpD/I7IpJGvkc63sMAwqEZnjJ162J5dBo1Vw7H7wVxMOxW47ZtSL
         lz3rBfqT8hOLcoa6/l3cEcySmJrrqK0PPH3NFmsJPwUHCotkiE3NOiro8TPODi52ZSiV
         +6sbZnQbEJ+hos9g+7GX3kba8T2qWySlLfabAsxHzZW6jDcHIhNUHdj4EULktpbP2Lwd
         4dwMGMwYta7ZsTmYwnPTZad0vdMSy3VaxNaN3HUNqeKxWJaf+1f5BaEIlEo0U4gs3wF1
         dE9vZGHdyZiq4DGd7W3Cmp5vbNNd6b+dCyz34ySFbdcUAkhqGM9z1rjFEBjZcZUXJ0AM
         sMrg==
X-Forwarded-Encrypted: i=1; AJvYcCW7NYWd1MW3pnKv9r4T7xCOisQ7PpLm430GMZNNXwva/ORfw1L2Sw6dg/57ks0FhmwmZE4kzCn5rn0ru7NtEq3IGGcVi3RS0x2P6vIz
X-Gm-Message-State: AOJu0Yx6QJhAKX6+FeeFdl3Y4x9JLVw5aTEIvItb9VoT3i6/RaoBJgzQ
	EX2NlOIBINZ/O/gTG+vD7UHXU/bWC1uIn915yE5oKN3YZyj3w2yYhlJaL3ijKQ0=
X-Google-Smtp-Source: AGHT+IGcklWL24x+/ATX/X79GzLIEgRegAVYWr7RIKs25D9CChSERgJxm7vPmejiencCFswv/2lvew==
X-Received: by 2002:a25:69cd:0:b0:dc2:a46:3d29 with SMTP id e196-20020a2569cd000000b00dc20a463d29mr240876ybc.9.1707960652773;
        Wed, 14 Feb 2024 17:30:52 -0800 (PST)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id z18-20020a25ad92000000b00dc25528fe9fsm25419ybi.9.2024.02.14.17.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 17:30:52 -0800 (PST)
Date: Wed, 14 Feb 2024 20:30:50 -0500
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Message-ID: <Zc1pSi59aDOnqz++@ghost>
References: <20240214-fix_sparse_errors_checksum_tests-v8-0-36b60e673593@rivosinc.com>
 <20240214-fix_sparse_errors_checksum_tests-v8-2-36b60e673593@rivosinc.com>
 <2ec91b11-23c7-4beb-8cef-c68367c8f029@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ec91b11-23c7-4beb-8cef-c68367c8f029@roeck-us.net>

On Wed, Feb 14, 2024 at 03:03:07PM -0800, Guenter Roeck wrote:
> On 2/14/24 13:41, Charlie Jenkins wrote:
> > The test cases for ip_fast_csum and csum_ipv6_magic were failing on a
> > variety of architectures that are big endian or do not support
> > misalgined accesses. Both of these test cases are changed to support big
> > and little endian architectures.
> > 
> > The test for ip_fast_csum is changed to align the data along (14 +
> > NET_IP_ALIGN) bytes which is the alignment of an IP header. The test for
> > csum_ipv6_magic aligns the data using a struct. An extra padding field
> > is added to the struct to ensure that the size of the struct is the same
> > on all architectures (44 bytes).
> > 
> > The test for csum_ipv6_magic somewhat arbitrarily aligned saddr and
> > daddr. This would fail on parisc64 due to the following code snippet in
> > arch/parisc/include/asm/checksum.h:
> > 
> > add		%4, %0, %0\n"
> > ldd,ma		8(%1), %6\n"
> > ldd,ma		8(%2), %7\n"
> > add,dc		%5, %0, %0\n"
> > 
> > The second add is expecting carry flags from the first add. Normally,
> > a double word load (ldd) does not modify the carry flags. However,
> > because saddr and daddr may be misaligned, ldd triggers a misalignment
> > trap that gets handled in arch/parisc/kernel/unaligned.c. This causes
> > many additional instructions to be executed between the two adds. This
> > can be easily solved by adding the carry into %0 before executing the
> > ldd.
> > 
> 
> I really think this is a bug either in the trap handler or in the hppa64
> qemu emulation. Only unaligned ldd instructions affect (actually,
> unconditionally set) the carry flag. That doesn't happen with unaligned
> ldw instructions. It would be worthwhile tracking this down since there are
> lots of unaligned data accesses (8-byte accesses on 4-byte aligned addresses)
> when running the kernel in 64-bit mode. On the other side, I guess this
> is a different problem. Not sure though if that should even be mentioned
> here since that makes it sound as if it would be expected that such
> accesses impact the carry flag.

I wasn't confident it was a bug somewhere so that's why I sent this patch.

However, I have just found the section of the processor manual [1] I was
looking for (Section Privileged Software-Accessible Registers subsection
Processor Status Word (PSW)):

"Processor state is encoded in a 64-bit register called the Processor
Status Word (PSW). When an interruption occurs, the current value of the
PSW is saved in the Interruption Processor Status Word (IPSW) and
usually all defined PSW bits are set to 0.

"The PSW is set to the contents of the IPSW by the RETURN FROM
INTERRUPTION instruction. The interruption handler may restore the
original PSW, modify selected bits, or may change the PSW to an entirely
new value."

Stored in the PSW register are the "Carry/borrow bits". This confirms
that the carry/borrow bits should be restored. The save is supposed to
automatically happen upon an interrupt and restored by the RETURN FROM
INTERRUPTION, thus this is a QEMU bug and not a Linux bug (please
correct me if I am wrong).

This v8 was not needed after-all it seems. It would be best to stick
with the v7.

[1] https://parisc.wiki.kernel.org/images-parisc/7/73/Parisc2.0.pdf

> 
> > However, that is not necessary since ipv6 headers should always be
> > aligned on a 16-byte boundary on parisc since NET_IP_ALIGN is set to
> > 2 and the ethernet header size is 14.
> > 
> > Architectures that set NET_IP_ALIGN to 0 must support misaligned
> > saddr and daddr, but that is not tested here.
> > 
> > Fixes: 6f4c45cbcb00 ("kunit: Add tests for csum_ipv6_magic and
> > ip_fast_csum") Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> I'll run this through my test system and let you know how it goes.  It
> should be done in a couple of hours.
> 
> Thanks, Guenter
> 

