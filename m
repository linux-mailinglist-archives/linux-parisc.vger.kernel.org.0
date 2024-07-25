Return-Path: <linux-parisc+bounces-1845-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62BC93C7B7
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 19:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BFFD281CA7
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 17:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D1F1C286;
	Thu, 25 Jul 2024 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EQDMGfxf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9BC19E7D8
	for <linux-parisc@vger.kernel.org>; Thu, 25 Jul 2024 17:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721929072; cv=none; b=HuEmq4Mo3nj6Z7T1s1S3SlhFOaZDahcAfmdlvWV8yJf62akhvL0WnykrD09agPD2wzoy62OCPtCoS8Bv3q33i2O/ZK4KBG4B9N8Scz8IiOChCYmm3WA+H4vRXVnV9J7qEs2LERU5Tr9bDQzd6vmGCmo19z5shnU7hUVomWnopYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721929072; c=relaxed/simple;
	bh=Vov7kntyBxdF56A6k27RplCUc33cdxyRCyagLbLXggo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tgTHu6SVKLOTou/16KTJNPweUJJ2xRP05eNV+HEYVPfVmUZZZSrs85sNFYtqtiXit+xQgCRzzaMJ+X4HiX+evNQ5rePDy4WLbkke8fbWZXxKbT5rl3mVBtQ+NRlAWhV2oBhj8E/5NEMuVp3f5HFlpi3flRi+5grEqkpwWj01lnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EQDMGfxf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721929069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0nFEclw+kucnIx+mGYCeop9Rte5/17vR9qIYrvs5w3A=;
	b=EQDMGfxfxyQ2dUsCA1hSg0smYGQQ2u4izFUVYxL837uKtW3NOiNcpXIPoHwubVEwQClTgs
	sP4/b1MqHTPRNSwPRa2MZBybHSCIEpd7oGAjW7aJlghUf0ZUMYf1j/t3ge/9bq/WFaLuRV
	FBwgbwckSLJR5h5+RXOjPlO6+IbaorM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-533-LtkVOEL8Ma6ybv8a5OHxzw-1; Thu,
 25 Jul 2024 13:37:45 -0400
X-MC-Unique: LtkVOEL8Ma6ybv8a5OHxzw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4DB651955D4B;
	Thu, 25 Jul 2024 17:37:43 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 774023000194;
	Thu, 25 Jul 2024 17:37:42 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 5273A30C1C17; Thu, 25 Jul 2024 17:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 4FA9E3FD4B;
	Thu, 25 Jul 2024 19:37:41 +0200 (CEST)
Date: Thu, 25 Jul 2024 19:37:41 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
cc: John David Anglin <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>, 
    linux-parisc@vger.kernel.org
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
In-Reply-To: <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com>
Message-ID: <8d37457f-cd84-571c-a121-c39ccb961220@redhat.com>
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com> <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4



On Wed, 24 Jul 2024, James Bottomley wrote:

> On Wed, 2024-07-24 at 20:17 +0200, Mikulas Patocka wrote:
> > Hi
> > 
> > Thanks for fixing the cache aliasing issues on PA-RISC in the commit 
> > 72d95924ee35c8cd16ef52f912483ee938a34d49.
> > 
> > I think there is still one problem left - and that is
> > ARCH_DMA_MINALIGN. Currently, it is 16, which is obviously wrong.
> 
> I don't think that's obvious, why is it wrong?

Suppose that two unrelated kernel subsystems allocate a 16-byte region and 
the regions happen to be placed next to each other - in the same 
cacheline.

The first subsystem does DMA into its 16-byte region and the second 
subsystem writes to its region using cacheable write.

Because the regions share a cache line, the cacheable write may corrupt 
the data that were loaded using DMA. For example
1. load a cache line into CPU cache
2. DMA writes to the region that was loaded
3. the cache line is modified
4. the cache line is written back and it overwrites the result of the DMA 
operation

ARCH_DMA_MINALIGN prevents this situation from hapenning. See the 
explanation of ARCH_DMA_MINALIGN in 
Documentation/core-api/dma-api-howto.rst

> > Some comments n the kernel say that PA8900 has L2 cache with 128-byte
> > line size, so I think that ARCH_DMA_MINALIGN should be 128 as well.
> 
> The L2+ caches on PA88 and 89 systems are PIPT and fully coherent with
> the PCI bus, so the L2+ line size doesn't matter that much (well,
> except we could possibly get better performance with more judicious DMA
> alignment).

I didn't know that.

> All the parisc coherency protocols rely on the CPU L1 cache, which is
> still VIPT.  Additionally, the CPU architects kept the minimum line
> size for the L1 at 16, so even in the later CPUs which have larger
> actual VIPT cache line sizes there's a splitting mechanism which means
> they can operate coherency protocols at a line size of 16.  This was
> done so the only spinlock primitive parisc has (LDCW) can still operate
> correctly with only 16 bytes of alignment.

But you still need to flush L1 cache when doing DMA.

> > The question is - can the CPU speculatively mark a cache line as
> > dirty and write it back?
> 
> No, the CPU may only mark a line as dirty if something actually wrote
> to it; it may not do it speculatively.  The L1 cache can speculatively
> move in clean lines if a TLB exists for them and once a line is marked
> dirty it's within the gift of the CPU to decide when to write it back
> absent a flush.

That's good.

> >  If yes, we have a big problem - Linux assumes that a part of the
> > page may be used for DMA transfer and another part of that page may
> > be used for normal cacheable structures. If the PA-RISC CPU
> > speculatively  prefetched and wrote back a cache line, it could
> > corrupt the DMA transfer.
> 
> The L2 PIPT PCI coherence protocol ensures that DMA can't corrupt
> memory adjacent objects on PA88 and 89.  Earlier CPUs, which were fully
> VIPT, do suffer from this problem because they have no PCI coherence,
> but they all operate at a line size of 16 anyway and so
> ARCH_DMA_MINALIGN works for them.

I read somewhere on internet that PA7300LC has 32-byte cache line size. 
So, ARCH_DMA_MINALIGN 16 is too small for it.

> > If the CPU doesn't speculatively mark cache lines as dirty, then 
> > increasing ARCH_DMA_MINALIGN would be sufficient solution.
> 
> Well, it's relatively safe to try without exploding all our hashed
> spinlocks because the LDCW alignment isn't tied to this (it's a
> separate #define in ldcw.h) if you want to benchmark it.
> 
> James

Mikulas


