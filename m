Return-Path: <linux-parisc+bounces-1851-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F0893C99C
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 22:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8090FB213A1
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 20:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0955313A418;
	Thu, 25 Jul 2024 20:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KR+KUweU"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BF4139CF6
	for <linux-parisc@vger.kernel.org>; Thu, 25 Jul 2024 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721939810; cv=none; b=iTUFVOPLS6MC4nEf+guiiKwETY7wday6SxUZDlyZppM/dzZgfE1e6ueAhl1krEvUt43W6PyG1s9bWncMB7/PK/Pl/usWjtdd+YCF7UmDc/LsJ2eGfJM+bP/V3//LCsbR6w7CTbWSCu/1k72S9SLDWa0Kaf+0yo3hYrbhXNVl21o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721939810; c=relaxed/simple;
	bh=L3atyF3ELelvfulBY3JSpmxXCCtF9ul+rtM1Exlo93U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q1NZ0m+79H0YIk8H5Keh5ssaER08BL/gQQvzME1FnEgbt5qv3MUuvmHAvXPrdLtotlvaGUX0oL0cufJ2Xt/+IEsUfMNd652Cum2SUq9mTtygHEFI+qGl+k5LSrG0uPyCdX4KDXFdZnFKvg4J4Wg/jad14N7Tdlsx7yC+2xiVSzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KR+KUweU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721939808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qUsajYDr5/Ny9Bo8j2nUW0nzjVFdiIAWwApDYJt6+qI=;
	b=KR+KUweUkta8ZpL8xZ3NbUAxaSoq2b29qyKYxCPyvWujra7y0xGNygqkj0CsADA6m+/cr3
	S0QdpL4mnXTm2nKN9Ch7CSwW8DK9PRRCP0L+hl5eONVnib8CnyUa6k+nzbhW3P4JTZBuSn
	jjIOCHv9iUmC0bpo3IQ/vIs3bhy2T00=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-427-pLU2BrrYOhCuTkomnawyZg-1; Thu,
 25 Jul 2024 16:36:44 -0400
X-MC-Unique: pLU2BrrYOhCuTkomnawyZg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5496B1977008;
	Thu, 25 Jul 2024 20:36:43 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 228191955D42;
	Thu, 25 Jul 2024 20:36:43 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 12DA430C1C17; Thu, 25 Jul 2024 20:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 0F9963FD4B;
	Thu, 25 Jul 2024 22:36:42 +0200 (CEST)
Date: Thu, 25 Jul 2024 22:36:42 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: John David Anglin <dave.anglin@bell.net>
cc: John David Anglin <dave@parisc-linux.org>, 
    James Bottomley <James.Bottomley@HansenPartnership.com>, 
    Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
In-Reply-To: <ff54aa24-15be-4bca-8b9e-1b1166b0e0d9@bell.net>
Message-ID: <436be3ae-a1b8-a14d-88f9-447355959064@redhat.com>
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com> <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com> <54cb80b8-9c89-4b61-b1cd-1e626daf6719@bell.net> <fa37987e-568f-9716-719e-85e3da8db47@redhat.com> <f3f59d8a-3ea4-4a21-8b0d-ba0d63ef1ff6@bell.net>
 <ff54aa24-15be-4bca-8b9e-1b1166b0e0d9@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="185210117-1932277826-1721939672=:510358"
Content-ID: <d269d6b-ac79-4f5a-1a7-fb678ff4ab2@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185210117-1932277826-1721939672=:510358
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <494192ad-a3ac-c87-ee13-a59e8fe04061@redhat.com>



On Thu, 25 Jul 2024, John David Anglin wrote:

> On 2024-07-25 3:13 p.m., John David Anglin wrote:
> >> L1_CACHE_BYTES is a performance hint that is used to avoid cache line
> >> ping-pong when multiple CPUs modify nearby data.
> > Our L1_CACHE_BYTES define is wrong.  PA7100 has a L1 length of 16 bytes.
> > PA7200 to PA7300LC have a length of 32 bytes.  PA8000 to PA8700 have a length of 64
> > bytes.  PA8800 and PA8900 have a L1 length of 128 bytes (this is from ERS D_Stride).
> >
> The attached patch fixes the defines for L1_CACHE_SHIFT, L1_CACHE_BYTES and
> ARCH_DMA_MINALIGN.  I left ARCH_DMA_MINALIGN at 16 as I believe this gives
> 128-byte alignment.
> 
> Testing.
> 
> Dave
> 
> -- 
> John David Anglin  dave.anglin@bell.net

How does ARCH_DMA_MINALIGN == 16 give 128-byte alignment? I think that 
ARCH_DMA_MINALIGN needs to be 128 to avoid the possibility of DMA transfer 
corruption.

L1_CACHE_SHIFT can be set to arbitrary value - setting it badly could 
degrade performance, but it shouldn't cause data corruption.

The commit d93277b9839b0bde06238a7a7f644114edb2ad4a says that setting 
L1_CACHE_SHIFT == 7 causes networking performance degradation on arm64. I 
don't know how much is this related to parisc.

Mikulas
--185210117-1932277826-1721939672=:510358--


