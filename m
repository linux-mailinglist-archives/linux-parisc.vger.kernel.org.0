Return-Path: <linux-parisc+bounces-1846-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2DA93C7C0
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 19:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0A561F212A0
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 17:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B1619D8AF;
	Thu, 25 Jul 2024 17:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="xWn3g0q1";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="xWn3g0q1"
X-Original-To: linux-parisc@vger.kernel.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D58E1C286
	for <linux-parisc@vger.kernel.org>; Thu, 25 Jul 2024 17:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721929411; cv=none; b=K9Rduuwa/Cgu+vvlENyECX4nu5AZOuI5W9Wx4PzgeCbEhqzjBAD3bIDnowtwvhUM0VUa4+RmckkVJil2IYtylTja3UoPEhd6xRZWZJtTPW2UKdN9ZvxxssrGC7FT/zj5x50XUUyN5bTmRfTJkWbF7M6D9LONuRBZayL7gHq8Oe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721929411; c=relaxed/simple;
	bh=oStT2XiZ92rL81IXAFF1f6sUMBBlgNjMeAnGRGRRg8M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pDqR4GPcC/NsrKasqCBRNFg7mAVv1GqUNNhaUjYi47+apRVyn7At3V+H6kHlZFTtkPnDCQsMroNse1lYfy3sz3UDRK7mGn8PgayvCxBiUlZixwfBlYP355jZwobVSKx01YyA+51ZCOnf12m9SGLYXXG4RRRTXgKx/JyhDLrx37g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=xWn3g0q1; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=xWn3g0q1; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721929409;
	bh=oStT2XiZ92rL81IXAFF1f6sUMBBlgNjMeAnGRGRRg8M=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=xWn3g0q1UQWzX1X9IPLTCURRfpIXBOw2OJ7Gs4UII024a4IB9WgC4LWyqXIuMWCMu
	 hGvBIZlE4Nspply6vsk9xrJPCnGKdd8CM2FNeUwAeiEbsfREtoZFSdyD4KLBadIe1j
	 67GUQDwkD5otLFJ4ReVrm2jNGBz/M6BVySYwPppc=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 582161280B26;
	Thu, 25 Jul 2024 13:43:29 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id BnJxBkSqNZMG; Thu, 25 Jul 2024 13:43:29 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721929409;
	bh=oStT2XiZ92rL81IXAFF1f6sUMBBlgNjMeAnGRGRRg8M=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=xWn3g0q1UQWzX1X9IPLTCURRfpIXBOw2OJ7Gs4UII024a4IB9WgC4LWyqXIuMWCMu
	 hGvBIZlE4Nspply6vsk9xrJPCnGKdd8CM2FNeUwAeiEbsfREtoZFSdyD4KLBadIe1j
	 67GUQDwkD5otLFJ4ReVrm2jNGBz/M6BVySYwPppc=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 886B0128021B;
	Thu, 25 Jul 2024 13:43:28 -0400 (EDT)
Message-ID: <3b09e01e90d144043934eafed8b9c70da3b754b4.camel@HansenPartnership.com>
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mikulas Patocka <mpatocka@redhat.com>, John David Anglin
	 <dave.anglin@bell.net>
Cc: John David Anglin <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>,
  linux-parisc@vger.kernel.org
Date: Thu, 25 Jul 2024 13:43:26 -0400
In-Reply-To: <fa37987e-568f-9716-719e-85e3da8db47@redhat.com>
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com>
	 <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com>
	 <54cb80b8-9c89-4b61-b1cd-1e626daf6719@bell.net>
	 <fa37987e-568f-9716-719e-85e3da8db47@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2024-07-25 at 19:27 +0200, Mikulas Patocka wrote:
> 
> 
> On Thu, 25 Jul 2024, John David Anglin wrote:
> 
> > On 2024-07-24 3:25 p.m., James Bottomley wrote:
> > > On Wed, 2024-07-24 at 20:17 +0200, Mikulas Patocka wrote:
> > > > Hi
> > > > 
> > > > Thanks for fixing the cache aliasing issues on PA-RISC in the
> > > > commit 72d95924ee35c8cd16ef52f912483ee938a34d49.
> > > > 
> > > > I think there is still one problem left - and that is
> > > > ARCH_DMA_MINALIGN. Currently, it is 16, which is obviously
> > > > wrong.
> > > I don't think that's obvious, why is it wrong?
> > I see this comment in arch/arm64/include/asm/cache.h:
> > 
> > /*
> >  * Memory returned by kmalloc() may be used for DMA, so we must
> > make
> >  * sure that all such allocations are cache aligned. Otherwise,
> >  * unrelated code may cause parts of the buffer to be read into the
> >  * cache before the transfer is done, causing old data to be seen
> > by
> >  * the CPU.
> >  */

This comment is copied from the same file in arch/arm.  arm is mostly
VIVT caching and has even worse problems than the PA VIPT cache. 
aarch64 has variable cache policy (CTR_EL0 register), but I think most
of them are actually PIPT or VIPT.

> > #define ARCH_DMA_MINALIGN       (128)
> > #define ARCH_KMALLOC_MINALIGN   (8)
> > 
> > L1_CACHE_BYTES is 64 on arm64.
> > 
> > Possibly, the same can occur on parisc.
> > 
> > Dave
> 
> L1_CACHE_BYTES is a performance hint that is used to avoid cache line
> ping-pong when multiple CPUs modify nearby data.
> 
> ARCH_DMA_MINALIGN is the biggest possible cache line size to avoid
> DMA data corruption. As there are some arm64 machines with 128-byte
> cache line, arm64 has to define it to 128.
> 
> James said that the L2 cache on PA8800/8900 is coherent with PCI. So,
> I  think that ARCH_DMA_MINALIGN should be 64 (is that the L1 cache
> line size  on PA8800/8900?).

By default, if unset, ARCH_DMA_MINALIGN defaults to alignof(long long),
so it is already 64 on parisc.

James

> L1_CACHE_BYTES could be 128 to avoid ping-pong between sockets.
> 
> For ARCH_KMALLOC_MINALIGN, there is an arm64 commit 
> 9382bc44b5f58ccee375f08f518e53c0280051dc, it is an optimization, so
> that they can use cache line size probed at startup instead of 128. I
> think we don't have to do this optimization on PA-RISC, the PA-RISC
> machines with 16-byte or 32-byte cache line size are old and slow -
> so that there is no point in trying to optimize kmalloc pools for
> them.
> 
> Mikulas


