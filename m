Return-Path: <linux-parisc+bounces-1839-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5C893B680
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Jul 2024 20:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5861C20BFC
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Jul 2024 18:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB5F15884B;
	Wed, 24 Jul 2024 18:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iP+8KSSA"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A85155735
	for <linux-parisc@vger.kernel.org>; Wed, 24 Jul 2024 18:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721845059; cv=none; b=l0PTQLUj4nDYFsF5qhc4Hq5TmtPoeSzNLJVXt7jNGDFQyJpL/67KkwmC/Oi7wkp7vwWOWoaIqAHevN3ck3Y7319J21oSuEiFkJ64ZOSVzErfZvuXRqlx7sWHVkxXI7anT7zHf5OLt1dOUAquG9HMpuDu9xsOHfAihyjN6RoO2o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721845059; c=relaxed/simple;
	bh=gZPzaBnqqXL2vYfLm4QMRTglvkYOa8zDhm5DoIBFXK8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=VjLEVWMFhoGOYpIyLxRkI1qH6VzFmCa0cAi9bewxueZYyhKHS6lol8IL8Rbmze1at4QPu77ljVpZIsFgt1dR8jSInIv6ditRQNeqQyPFgj5uWYieCD20aXLisjSHCeZ4fC4E8bu5e+6tsQHuJXFMQo0MtcsBKrjK0etH7Ule/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iP+8KSSA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721845057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LxM99Q+Zh9wAhjDZ7peJfl38f2GOnDTsrJnksS9B56Q=;
	b=iP+8KSSAyQSX25G9TzWeNEKMRbrc6uePH+Rkx2ynI1hajI/nXrRRWg7YZ5ll6ZSkz8tM7W
	Qiylow9mn4evLr3rhpbdyg5ZI4RmQw4vjY+p7h05YWdvl1nVrETsNvz/eL/6TfiLVSHp/6
	/dzq6pkMpsQNlXTKc4WKS4QJ7l7hI6k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-IdJ5Tk9uPYyPdHLHDmhH9g-1; Wed,
 24 Jul 2024 14:17:32 -0400
X-MC-Unique: IdJ5Tk9uPYyPdHLHDmhH9g-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B5D8C19560AB;
	Wed, 24 Jul 2024 18:17:30 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 730953000192;
	Wed, 24 Jul 2024 18:17:29 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 4EF6D30C1C17; Wed, 24 Jul 2024 18:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 4B6403FD4B;
	Wed, 24 Jul 2024 20:17:28 +0200 (CEST)
Date: Wed, 24 Jul 2024 20:17:28 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: John David Anglin <dave@parisc-linux.org>
cc: Helge Deller <deller@gmx.de>, 
    "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
    linux-parisc@vger.kernel.org
Subject: ARCH_DMA_MINALIGN on PA-RISC
Message-ID: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi

Thanks for fixing the cache aliasing issues on PA-RISC in the commit 
72d95924ee35c8cd16ef52f912483ee938a34d49.

I think there is still one problem left - and that is ARCH_DMA_MINALIGN. 
Currently, it is 16, which is obviously wrong.

Some comments in the kernel say that PA8900 has L2 cache with 128-byte 
line size, so I think that ARCH_DMA_MINALIGN should be 128 as well.


The question is - can the CPU speculatively mark a cache line as dirty and 
write it back? If yes, we have a big problem - Linux assumes that a part 
of the page may be used for DMA transfer and another part of that page may 
be used for normal cacheable structures. If the PA-RISC CPU speculatively 
prefetched and wrote back a cache line, it could corrupt the DMA transfer.

If the CPU doesn't speculatively mark cache lines as dirty, then 
increasing ARCH_DMA_MINALIGN would be sufficient solution.

Mikulas


