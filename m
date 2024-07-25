Return-Path: <linux-parisc+bounces-1847-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE67493C7C8
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 19:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 996F21F228C0
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 17:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D9F381C8;
	Thu, 25 Jul 2024 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BEh76sq7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9750E19E7DB
	for <linux-parisc@vger.kernel.org>; Thu, 25 Jul 2024 17:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721929580; cv=none; b=hdvRtUqZMnD3LY7MtdCIiH9U2VeBPgP48znTl4x8+jiZKQ83wfe3nOayAmXc53B2KAiDQScWgyUIKKhhBy2SCMOaGxQib/qvNSTo4MafPtxlSRPPU8DAALhMVpyZdU9JOK1iaNctALYaYSnpo0m4H3LD6x2iLXDuq/uxxIXSNL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721929580; c=relaxed/simple;
	bh=GMwDt/ChBOUZDWsSheWZPzKHXlsm6eS7M3CCDHwPsdk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O06wA8vYn/QG/R/UTfuRNQU0fo8NL6ug9IXYyNbqFuMZFZD84jaNgNQ9QsEMHNqtrv4K+4P4rDx/KHeHTeq/nUdkMLpu02zn22MvkR43xkcoP2e3p/0Hj8zq1Y0zMZgW4//m6AcSsBa2hGMv4q2X1vOQA+rhKT91yOT6dkSeXls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BEh76sq7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721929577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tL9pmqSf/aNDfhH/ueAeonuzBcQhvBuggsfkfiNu6zI=;
	b=BEh76sq7NVpG+7V5DiBanEWEB/+QJ3xk+ZDkoxGxme7EbrVoDp910RP2B0+AbFzxKDE2xu
	f0LrnMXegqznFKZDGZ11XxV2XN2ASzG4K4YxnG5izx+97hx/TLui8K3lsrls9HAaj3SMue
	zv2zRNn8O6oKh4IPtWjpbAZosP4fxgY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-s8YB37UjO-KU1XHKZ3vbuw-1; Thu,
 25 Jul 2024 13:46:15 -0400
X-MC-Unique: s8YB37UjO-KU1XHKZ3vbuw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92BF31955D45;
	Thu, 25 Jul 2024 17:46:13 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 909461955D48;
	Thu, 25 Jul 2024 17:46:12 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 8283430C1C17; Thu, 25 Jul 2024 17:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 7EF523FD4B;
	Thu, 25 Jul 2024 19:46:11 +0200 (CEST)
Date: Thu, 25 Jul 2024 19:46:11 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
cc: John David Anglin <dave.anglin@bell.net>, 
    John David Anglin <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>, 
    linux-parisc@vger.kernel.org
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
In-Reply-To: <3b09e01e90d144043934eafed8b9c70da3b754b4.camel@HansenPartnership.com>
Message-ID: <ba2ff9e3-257c-43d7-e74b-e3bede258e8@redhat.com>
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com> <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com> <54cb80b8-9c89-4b61-b1cd-1e626daf6719@bell.net> <fa37987e-568f-9716-719e-85e3da8db47@redhat.com>
 <3b09e01e90d144043934eafed8b9c70da3b754b4.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="185210117-88892401-1721929571=:461109"
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185210117-88892401-1721929571=:461109
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 25 Jul 2024, James Bottomley wrote:

> > > #define ARCH_DMA_MINALIGN       (128)
> > > #define ARCH_KMALLOC_MINALIGN   (8)
> > > 
> > > L1_CACHE_BYTES is 64 on arm64.
> > > 
> > > Possibly, the same can occur on parisc.
> > > 
> > > Dave
> > 
> > L1_CACHE_BYTES is a performance hint that is used to avoid cache line
> > ping-pong when multiple CPUs modify nearby data.
> > 
> > ARCH_DMA_MINALIGN is the biggest possible cache line size to avoid
> > DMA data corruption. As there are some arm64 machines with 128-byte
> > cache line, arm64 has to define it to 128.
> > 
> > James said that the L2 cache on PA8800/8900 is coherent with PCI. So,
> > I  think that ARCH_DMA_MINALIGN should be 64 (is that the L1 cache
> > line size  on PA8800/8900?).
> 
> By default, if unset, ARCH_DMA_MINALIGN defaults to alignof(long long),
> so it is already 64 on parisc.
> 
> James

No, alignof(long long) is 8 :-)

Mikulas
--185210117-88892401-1721929571=:461109--


