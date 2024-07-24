Return-Path: <linux-parisc+bounces-1841-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5E493B78B
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Jul 2024 21:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FD3F1C23302
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Jul 2024 19:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8BE15E5D1;
	Wed, 24 Jul 2024 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="xFytgi45";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="xFytgi45"
X-Original-To: linux-parisc@vger.kernel.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538B613D
	for <linux-parisc@vger.kernel.org>; Wed, 24 Jul 2024 19:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721849164; cv=none; b=n04oUNVcs/KFZWBzjyc9/LzzUDntkovdiHW+gms/Uix7aAtZRwFhSdA+H5TpAW+T4N3etid1THI3e9+1k327tJUEpgn662zS3fCUJMtTZN/RRm+NFduebQ7fqKDTlLBpSfcGTFhrhsPYmc3bxnB6lzLjg0aa71z3ggAecrMgbcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721849164; c=relaxed/simple;
	bh=byQQDF1KP3iYzp7+votR8mq129HTtpE3z4k+QkHYYe4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MoQ1KnhCDtyChXyY8jrgoreRJkeCpDni94da8y+9Lom2NY9zl+8OxDc/rbw44qNOYvyqIL0iPdtYVU8ngmUBPAvvEgAJulvI7WQAxYwAPWOy1KOesAXGQEO7vE74HhhT3EA2y+Z0VNWru3ypdKtjztzmtHVVMR8coMxwLx/VyPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=xFytgi45; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=xFytgi45; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721849160;
	bh=byQQDF1KP3iYzp7+votR8mq129HTtpE3z4k+QkHYYe4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=xFytgi4552Zpeu6Uh8uerzx+BxWGmTuSPP8vq1iI4tDcPTeGsnoNAZ3hNwwZXwFE1
	 OmiXCMaAToxgGacVYMr7TPZ7gKgsJQvkp1HeQB7twznHM4n8cSxeRiS7ty7eggB9zH
	 iZny2TAiOn1f/Ipbmz+kEMgMaudXL/af+Zn2ib/s=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 60EA312868A3;
	Wed, 24 Jul 2024 15:26:00 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 2dYztSq8QdlQ; Wed, 24 Jul 2024 15:26:00 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721849160;
	bh=byQQDF1KP3iYzp7+votR8mq129HTtpE3z4k+QkHYYe4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=xFytgi4552Zpeu6Uh8uerzx+BxWGmTuSPP8vq1iI4tDcPTeGsnoNAZ3hNwwZXwFE1
	 OmiXCMaAToxgGacVYMr7TPZ7gKgsJQvkp1HeQB7twznHM4n8cSxeRiS7ty7eggB9zH
	 iZny2TAiOn1f/Ipbmz+kEMgMaudXL/af+Zn2ib/s=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B9D941286899;
	Wed, 24 Jul 2024 15:25:59 -0400 (EDT)
Message-ID: <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com>
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mikulas Patocka <mpatocka@redhat.com>, John David Anglin
	 <dave@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Date: Wed, 24 Jul 2024 15:25:58 -0400
In-Reply-To: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com>
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2024-07-24 at 20:17 +0200, Mikulas Patocka wrote:
> Hi
> 
> Thanks for fixing the cache aliasing issues on PA-RISC in the commit 
> 72d95924ee35c8cd16ef52f912483ee938a34d49.
> 
> I think there is still one problem left - and that is
> ARCH_DMA_MINALIGN. Currently, it is 16, which is obviously wrong.

I don't think that's obvious, why is it wrong?

> 
> Some comments n the kernel say that PA8900 has L2 cache with 128-byte
> line size, so I think that ARCH_DMA_MINALIGN should be 128 as well.

The L2+ caches on PA88 and 89 systems are PIPT and fully coherent with
the PCI bus, so the L2+ line size doesn't matter that much (well,
except we could possibly get better performance with more judicious DMA
alignment).

All the parisc coherency protocols rely on the CPU L1 cache, which is
still VIPT.  Additionally, the CPU architects kept the minimum line
size for the L1 at 16, so even in the later CPUs which have larger
actual VIPT cache line sizes there's a splitting mechanism which means
they can operate coherency protocols at a line size of 16.  This was
done so the only spinlock primitive parisc has (LDCW) can still operate
correctly with only 16 bytes of alignment.

> The question is - can the CPU speculatively mark a cache line as
> dirty and write it back?

No, the CPU may only mark a line as dirty if something actually wrote
to it; it may not do it speculatively.  The L1 cache can speculatively
move in clean lines if a TLB exists for them and once a line is marked
dirty it's within the gift of the CPU to decide when to write it back
absent a flush.

>  If yes, we have a big problem - Linux assumes that a part of the
> page may be used for DMA transfer and another part of that page may
> be used for normal cacheable structures. If the PA-RISC CPU
> speculatively  prefetched and wrote back a cache line, it could
> corrupt the DMA transfer.

The L2 PIPT PCI coherence protocol ensures that DMA can't corrupt
memory adjacent objects on PA88 and 89.  Earlier CPUs, which were fully
VIPT, do suffer from this problem because they have no PCI coherence,
but they all operate at a line size of 16 anyway and so
ARCH_DMA_MINALIGN works for them.

> If the CPU doesn't speculatively mark cache lines as dirty, then 
> increasing ARCH_DMA_MINALIGN would be sufficient solution.

Well, it's relatively safe to try without exploding all our hashed
spinlocks because the LDCW alignment isn't tied to this (it's a
separate #define in ldcw.h) if you want to benchmark it.

James


