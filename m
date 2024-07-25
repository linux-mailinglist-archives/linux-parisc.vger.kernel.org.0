Return-Path: <linux-parisc+bounces-1844-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B7293C7A4
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 19:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5981F2260A
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 17:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265E919D088;
	Thu, 25 Jul 2024 17:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N78SXljw"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CCC199E9F
	for <linux-parisc@vger.kernel.org>; Thu, 25 Jul 2024 17:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721928440; cv=none; b=K4l8n3D0WjxmmaRkir/txauobb17Sm5ey7CBlRZdDx7pDzrxmPTiIn3G7hYwIkkn9HapNcIdAtCu1iD2q/uWkIKTiyK266tx0Vns58S4cwgaaD3n8pjLtmAuwmmIoUIyg1KAUZUuodpa1oR2pMHH2JDL6kKFEYMoA74pHuVbZ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721928440; c=relaxed/simple;
	bh=aAqNQZyvQV6FMkBLQdSYI3dLV8npZ6LjBgiIl2o+b4I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=k+exlLogHb0IpFi2VA0X/hFa/pjgpngo9lsieupB/fRtbsclqOiDYgWx0/6F4815QtxoPgq4wSdvg+l9ZI2v7P6VEqgxZfejDhqZg3gqEKFEgODD5Pabzjt0ihXqAujFkwGvkeFqnG+FoNLX4mjk5KbRRME56bvbIOoP8h0VpUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N78SXljw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721928436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g5MhQxoNFEhwkFFeTvkuIdN31CuXJuD+mgUdc9hCCco=;
	b=N78SXljwcv89ZapPvm8UAGst6TQ6bS8Rjbm88UbUW6gIQz6A5XpHzZtjZdhSdOtrB9rnX6
	GdOENh0cbr9C88Tt7grEilP9+KiNuvmw6tSbhCgqO8YjycqIFxCfC1N9lDnI0h0wHwx+ke
	/CCt52iLFuFETSQ+OeakvB14F9coCVw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-dc8w57JYPSa4S0hAXcpj5g-1; Thu,
 25 Jul 2024 13:27:14 -0400
X-MC-Unique: dc8w57JYPSa4S0hAXcpj5g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AFA561955D42;
	Thu, 25 Jul 2024 17:27:11 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98A2419560AE;
	Thu, 25 Jul 2024 17:27:10 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 7EA7C30C1C17; Thu, 25 Jul 2024 17:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 79C673FD4B;
	Thu, 25 Jul 2024 19:27:09 +0200 (CEST)
Date: Thu, 25 Jul 2024 19:27:09 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: John David Anglin <dave.anglin@bell.net>
cc: James Bottomley <James.Bottomley@HansenPartnership.com>, 
    John David Anglin <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>, 
    linux-parisc@vger.kernel.org
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
In-Reply-To: <54cb80b8-9c89-4b61-b1cd-1e626daf6719@bell.net>
Message-ID: <fa37987e-568f-9716-719e-85e3da8db47@redhat.com>
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com> <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com> <54cb80b8-9c89-4b61-b1cd-1e626daf6719@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="185210117-791320928-1721926508=:461109"
Content-ID: <e384d7ac-44f-a67b-a724-d136bce7a85a@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185210117-791320928-1721926508=:461109
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <6c8b35f9-967c-7380-50d3-71c9c6e9b7f@redhat.com>



On Thu, 25 Jul 2024, John David Anglin wrote:

> On 2024-07-24 3:25 p.m., James Bottomley wrote:
> > On Wed, 2024-07-24 at 20:17 +0200, Mikulas Patocka wrote:
> >> Hi
> >>
> >> Thanks for fixing the cache aliasing issues on PA-RISC in the commit
> >> 72d95924ee35c8cd16ef52f912483ee938a34d49.
> >>
> >> I think there is still one problem left - and that is
> >> ARCH_DMA_MINALIGN. Currently, it is 16, which is obviously wrong.
> > I don't think that's obvious, why is it wrong?
> I see this comment in arch/arm64/include/asm/cache.h:
> 
> /*
>  * Memory returned by kmalloc() may be used for DMA, so we must make
>  * sure that all such allocations are cache aligned. Otherwise,
>  * unrelated code may cause parts of the buffer to be read into the
>  * cache before the transfer is done, causing old data to be seen by
>  * the CPU.
>  */
> #define ARCH_DMA_MINALIGN       (128)
> #define ARCH_KMALLOC_MINALIGN   (8)
> 
> L1_CACHE_BYTES is 64 on arm64.
> 
> Possibly, the same can occur on parisc.
> 
> Dave

L1_CACHE_BYTES is a performance hint that is used to avoid cache line 
ping-pong when multiple CPUs modify nearby data.

ARCH_DMA_MINALIGN is the biggest possible cache line size to avoid DMA 
data corruption. As there are some arm64 machines with 128-byte cache 
line, arm64 has to define it to 128.

James said that the L2 cache on PA8800/8900 is coherent with PCI. So, I 
think that ARCH_DMA_MINALIGN should be 64 (is that the L1 cache line size 
on PA8800/8900?).

L1_CACHE_BYTES could be 128 to avoid ping-pong between sockets.

For ARCH_KMALLOC_MINALIGN, there is an arm64 commit 
9382bc44b5f58ccee375f08f518e53c0280051dc, it is an optimization, so that 
they can use cache line size probed at startup instead of 128. I think we 
don't have to do this optimization on PA-RISC, the PA-RISC machines with 
16-byte or 32-byte cache line size are old and slow - so that there is no 
point in trying to optimize kmalloc pools for them.

Mikulas
--185210117-791320928-1721926508=:461109--


