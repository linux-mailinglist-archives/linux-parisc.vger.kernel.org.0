Return-Path: <linux-parisc+bounces-493-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C884C299
	for <lists+linux-parisc@lfdr.de>; Wed,  7 Feb 2024 03:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F4A52833DE
	for <lists+linux-parisc@lfdr.de>; Wed,  7 Feb 2024 02:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2898C1401C;
	Wed,  7 Feb 2024 02:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W40yGT0U"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0D134A5
	for <linux-parisc@vger.kernel.org>; Wed,  7 Feb 2024 02:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707273835; cv=none; b=jCQkVu+UIPimylNJnlvJFzRjTckV3r+KKk4ncOUWiuyEvzDRJwgpLbfp3wOdH/PFMDI6gysI6ywXmqEeuYL+YBa0W8xKyjCV1VMws0onAu/+A73td4Ogbaoz4fbws6m6D9qrrpvcwINRwBR8DadoyxMppjbw6ZuGiXZrrjpE2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707273835; c=relaxed/simple;
	bh=4B82qo8Sra5FqC3ZdeZ48eBeifUhmce8Y0r5LXEDVqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5rbZTm14nB0RjFNtYwcCoaljJHdXOMkvBDTeBpfypBvRCF+bol3P6S4n7r3GwGX6qZscNPew6Wevrs8HIeVHwffH1cUZn3d8GLsN+fXbQcsF1YqzHKEDBgcSQtyp5+3Vy3jdcSAy8R+ofo3BFk7L70UHK6MbBgScI/AhukpN9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W40yGT0U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707273832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q9uy8JfuiX9GAB1I6VKmhXzbFtCYc2bS0xm9r9QbDYg=;
	b=W40yGT0UxnN97bcDFHDd5jKXgDrpeDl3VSU+CtSRZyfiHGzHFcRHS7zORDcckdu581OUPZ
	RSFU0gcSxrXo9Os+VqIERXL4igaBoC402+IrPq/S/0+rj0ZI50A390JvCFn0p7ESVSfBPk
	2mLsBiLbvtbrnQ7333DDxToIpzrcUP4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-RleiTtKfM-K1OkCe_p_gRw-1; Tue, 06 Feb 2024 21:43:47 -0500
X-MC-Unique: RleiTtKfM-K1OkCe_p_gRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8362F83B86C;
	Wed,  7 Feb 2024 02:43:46 +0000 (UTC)
Received: from fedora (unknown [10.72.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44A062026D06;
	Wed,  7 Feb 2024 02:43:40 +0000 (UTC)
Date: Wed, 7 Feb 2024 10:43:37 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
	Mark Wunderlich <mark.wunderlich@intel.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	linux-block@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] block: use the __packed attribute only on architectures
 where it is efficient
Message-ID: <ZcLuWUNRZadJr0tQ@fedora>
References: <78172b8-74bc-1177-6ac7-7a7e7a44d18@redhat.com>
 <ZcI/o7Ky7dzSLK25@fedora>
 <9651b7f-2dc5-efd7-77ca-455b4925f17b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9651b7f-2dc5-efd7-77ca-455b4925f17b@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On Tue, Feb 06, 2024 at 07:31:26PM +0100, Mikulas Patocka wrote:
> 
> 
> On Tue, 6 Feb 2024, Ming Lei wrote:
> 
> > On Tue, Feb 06, 2024 at 12:14:14PM +0100, Mikulas Patocka wrote:
> > > The __packed macro (expanding to __attribute__((__packed__))) specifies
> > > that the structure has an alignment of 1. Therefore, it may be arbitrarily
> > > misaligned. On architectures that don't have hardware support for
> > > unaligned accesses, gcc generates very inefficient code that accesses the
> > > structure fields byte-by-byte and assembles the result using shifts and
> > > ors.
> > > 
> > > For example, on PA-RISC, this function is compiled to 23 instructions with
> > > the __packed attribute and only 2 instructions without the __packed
> > > attribute.
> > 
> > Can you share user visible effects in this way? such as IOPS or CPU
> > utilization effect when running typical workload on null_blk or NVMe.
> 
> The patch reduces total kernel size by 4096 bytes. The parisc machine 
> doesn't have PCIe, so I can't test it with NVMe :)

You can run test over null-blk, which is enough to cover this report or change,
given this patch is marked as "Fixes: ", we need to understand what it fixes.

> 
> > CPU is supposed to be super fast if the data is in single L1 cacheline,
> > but removing '__packed' may introduce one extra L1 cacheline load for
> > bio.
> 
> Saving the intruction cache is also important. Removing the __packed 
> keyword increases the bio structure size by 8 bytes - that is, L1 data 
> cache consumption will be increased with the probability 8/64. And it 
> reduces L1 instruction cache consumption by 84 bytes - that is one or two 
> cachelines.

Yes.

But the two kinds of caches have different properties, such as:

- instruction cache has lower miss rate
- instruction cache is read only

so I'd suggest to provide null-blk test result at least.


Thanks,
Ming


