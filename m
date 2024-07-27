Return-Path: <linux-parisc+bounces-1856-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45993DEB7
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 12:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79EA2B20E96
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 10:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D55A57CAC;
	Sat, 27 Jul 2024 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VpLTkeKy"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073E928DA0
	for <linux-parisc@vger.kernel.org>; Sat, 27 Jul 2024 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722075880; cv=none; b=AK9Z1WCXvBOzDASprzV+7mKiAET3EsM+8iuav/Xm1fCYTUO2G463d69eJNK1ZgBVwD4fyoq1Qwo5tZkSonZUvUv9GIBm03n19/IgDyDWEGr8JR89L1KTN9erfEfYu6g9fW8a38prPldVecSlC08xz0ItiYJey5KzSVbYcech1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722075880; c=relaxed/simple;
	bh=+QCZBfGEDDiIBLQ1IgudAi880QkaHfv/b1HGCg0dgpM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SUv0FP9fqk9VNyj99Znyw8PNzURNeJPoA4kcyccJPlGEI98N1aCFh5ahNT3dsYGDOdtWD40oGDfqNa24awqn0Njx6xYR9qL8kV49Vgb1EXy+Qp+FW2vFPbnD0Nyd4g2wg0EsIvKUTEw/JNLzOceaUtGxNYzG9272udtzycUHkpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VpLTkeKy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722075876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e9zGjuTVPbDRUcvQjc0vXtvdfRZfEXV1oU7jczlrWdE=;
	b=VpLTkeKyoybOUlzvU0hv+P9FO3lCCpyjBkJc9k/YJK1pFpZt5Z/LxCbCyQ3uw9ZZAVVbAW
	v1G1nCZd/pK+IWZvWokgA93jS8AUYwKdflHTkyI7Jj9yqANLmDlnftPPIigBw3jp/IPgIU
	hB2g8hj4E/sgz+y0KY1Hfh3MaS8/ElI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-351-6DK2I4-GOVmiJSlnC_sICQ-1; Sat,
 27 Jul 2024 06:24:35 -0400
X-MC-Unique: 6DK2I4-GOVmiJSlnC_sICQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0135E1955F43;
	Sat, 27 Jul 2024 10:24:34 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B2A919560AE;
	Sat, 27 Jul 2024 10:24:33 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id E5E1230C1C17; Sat, 27 Jul 2024 10:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id E27B43FD04;
	Sat, 27 Jul 2024 12:24:31 +0200 (CEST)
Date: Sat, 27 Jul 2024 12:24:31 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: John David Anglin <dave.anglin@bell.net>
cc: John David Anglin <dave@parisc-linux.org>, 
    James Bottomley <James.Bottomley@HansenPartnership.com>, 
    Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
In-Reply-To: <b3254b3c-438a-473a-87a4-b627ec706d2f@bell.net>
Message-ID: <5b706825-a022-85a-4fba-14975654dec0@redhat.com>
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com> <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com> <54cb80b8-9c89-4b61-b1cd-1e626daf6719@bell.net> <fa37987e-568f-9716-719e-85e3da8db47@redhat.com> <f3f59d8a-3ea4-4a21-8b0d-ba0d63ef1ff6@bell.net>
 <ff54aa24-15be-4bca-8b9e-1b1166b0e0d9@bell.net> <436be3ae-a1b8-a14d-88f9-447355959064@redhat.com> <b3254b3c-438a-473a-87a4-b627ec706d2f@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="185210117-1888183715-1722075871=:816076"
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185210117-1888183715-1722075871=:816076
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 25 Jul 2024, John David Anglin wrote:

> On 2024-07-25 4:36 p.m., Mikulas Patocka wrote:
> >
> > On Thu, 25 Jul 2024, John David Anglin wrote:
> >
> >> On 2024-07-25 3:13 p.m., John David Anglin wrote:
> >>>> L1_CACHE_BYTES is a performance hint that is used to avoid cache line
> >>>> ping-pong when multiple CPUs modify nearby data.
> >>> Our L1_CACHE_BYTES define is wrong.  PA7100 has a L1 length of 16 bytes.
> >>> PA7200 to PA7300LC have a length of 32 bytes.  PA8000 to PA8700 have a length of 64
> >>> bytes.  PA8800 and PA8900 have a L1 length of 128 bytes (this is from ERS D_Stride).
> >>>
> >> The attached patch fixes the defines for L1_CACHE_SHIFT, L1_CACHE_BYTES and
> >> ARCH_DMA_MINALIGN.  I left ARCH_DMA_MINALIGN at 16 as I believe this gives
> >> 128-byte alignment.
> >>
> >> Testing.
> >>
> >> Dave
> >>
> >> -- 
> >> John David Anglin  dave.anglin@bell.net
> > How does ARCH_DMA_MINALIGN == 16 give 128-byte alignment? I think that
> > ARCH_DMA_MINALIGN needs to be 128 to avoid the possibility of DMA transfer
> > corruption.
> You are right.  It should be 128.

I've sent a patch that fixes it - and it also uses dcache_stride to 
advertise the probed cache line size to the kernel, so that on machines 
older than PA8800 we can use slab caches smaller than 128 bytes.

> > L1_CACHE_SHIFT can be set to arbitrary value - setting it badly could
> > degrade performance, but it shouldn't cause data corruption.
> If we set to an arbitrary value, we need to document why we do it. The naming
> suggests that L1_CACHE_BYTES should be the L1 cache length.

It's hard to say what should we set it to, if we have different 
microarchitectures with different cache line size. ARM64 sets it to 64, 
despite the fact that there are some ARM64 machines with 128-byte cache 
line.

L1_CACHE_BYTES is a matter of performance. Do you have some benchmarks, so 
that you could try to tune it?

The commit a01fece2e4185ac173abd16d10304d73d47ebf00 says that setting 
L1_CACHE_BYTES == 16 improves performance.

> > The commit d93277b9839b0bde06238a7a7f644114edb2ad4a says that setting
> > L1_CACHE_SHIFT == 7 causes networking performance degradation on arm64. I
> > don't know how much is this related to parisc.
> Some other architectures have L1_CACHE_SHIFT == 7.
> 
> Dave

Mikulas
--185210117-1888183715-1722075871=:816076--


