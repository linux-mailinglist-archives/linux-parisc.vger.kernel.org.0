Return-Path: <linux-parisc+bounces-1859-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F2E93E07B
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 20:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6E801F217EC
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 18:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BDA17C66;
	Sat, 27 Jul 2024 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aliWhmvn"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67D538A
	for <linux-parisc@vger.kernel.org>; Sat, 27 Jul 2024 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104584; cv=none; b=ipo4vinuKL8yXogC92xATJfBuw/GaWTxDGzoPxVg3RNoCKBdW0eNo9r2szEXxlsU83ZbyNOW6PKts7gjkV4xnk0tcKJ3OTJruyftw85ftIeH9fl1XliUWb7EfnNVS6wj+h5iWEPokwe2XfcQFSziDHPR9A5m+x9/1+fwQuQH81I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104584; c=relaxed/simple;
	bh=qFMNM/o4TPLssx+9Ek6TTBhi6/iS2Avn9ZiU4aKOWQk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=syfbMGMpuah4PBf9E8dLUFPEbbvWJxUUTbhK00fWx3krAHCGHuUkRiC8LB/x1YQjmN3yHK4tCyRELldGmMA/Ldr3iZkw+pHKQsGROHB7vXA/82ovyagY/M6EFfSVk7oFLcdYRBVWD/OuvqdjNbKd4STz2Hy69v0Z2n1vz7b0X78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aliWhmvn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722104581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xFGdXQqt5S+r53tO4Ww/DebMy0XW9TASyY+NXyTMW4=;
	b=aliWhmvnI02LAgspTtWcFHuZ88tKOB4zP0HDNWICm61isHRmQrKPC31agwtaygrvuKy1K9
	ChBqHr6REQLCEuXqvS4rEJkhJUhvtTJA5uH61PV5ZyPYdP3wnyAX0bklop0MO0LKmv+7H5
	5W3MUxQAWJn+a7ZgOeLppGR5ABL2Y+w=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-chc7SlmeMXuLECFxbIlnBQ-1; Sat,
 27 Jul 2024 14:22:55 -0400
X-MC-Unique: chc7SlmeMXuLECFxbIlnBQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30AFB19560A2;
	Sat, 27 Jul 2024 18:22:54 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6DEDA19560AE;
	Sat, 27 Jul 2024 18:22:53 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 33C5530C1C17; Sat, 27 Jul 2024 18:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 3038F3FD4B;
	Sat, 27 Jul 2024 20:22:52 +0200 (CEST)
Date: Sat, 27 Jul 2024 20:22:52 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: John David Anglin <dave.anglin@bell.net>
cc: John David Anglin <dave@parisc-linux.org>, 
    James Bottomley <James.Bottomley@HansenPartnership.com>, 
    Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: [PATCH v2] parisc: fix a possible DMA corruption
In-Reply-To: <38510add-ed4d-4e99-beca-e29efaf94f4b@bell.net>
Message-ID: <a233f8cd-ec48-3d2c-cfca-d863bb9912f5@redhat.com>
References: <76f39b33-4066-a891-94e5-671b1d82df27@redhat.com> <38510add-ed4d-4e99-beca-e29efaf94f4b@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

ARCH_DMA_MINALIGN was defined as 16 - this is too small - it may be
possible that two unrelated 16-byte allocations share a cache line. If
one of these allocations is written using DMA and the other is written
using cached write, the value that was written with DMA may be
corrupted.

This commit changes ARCH_DMA_MINALIGN to be 128 on PA20 and 32 on PA1.1 -
that's the largest possible cache line size.

As different parisc microarchitectures have different cache line size, we
define arch_slab_minalign(), cache_line_size() and
dma_get_cache_alignment() so that the kernel may tune slab cache
parameters dynamically, based on the detected cache line size.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 arch/parisc/Kconfig             |    1 +
 arch/parisc/include/asm/cache.h |   11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

Index: linux-6.10/arch/parisc/include/asm/cache.h
===================================================================
--- linux-6.10.orig/arch/parisc/include/asm/cache.h	2023-09-18 11:33:40.000000000 +0200
+++ linux-6.10/arch/parisc/include/asm/cache.h	2024-07-27 19:28:18.000000000 +0200
@@ -20,7 +20,16 @@
 
 #define SMP_CACHE_BYTES L1_CACHE_BYTES
 
-#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
+#ifndef CONFIG_PA20
+#define ARCH_DMA_MINALIGN	32
+#else
+#define ARCH_DMA_MINALIGN	128
+#endif
+#define ARCH_KMALLOC_MINALIGN	16	/* ldcw requires 16-byte alignment */
+
+#define arch_slab_minalign()	((unsigned)dcache_stride)
+#define cache_line_size()	dcache_stride
+#define dma_get_cache_alignment cache_line_size
 
 #define __read_mostly __section(".data..read_mostly")
 
Index: linux-6.10/arch/parisc/Kconfig
===================================================================
--- linux-6.10.orig/arch/parisc/Kconfig	2024-07-23 20:35:34.000000000 +0200
+++ linux-6.10/arch/parisc/Kconfig	2024-07-26 19:41:15.000000000 +0200
@@ -20,6 +20,7 @@ config PARISC
 	select ARCH_SUPPORTS_HUGETLBFS if PA20
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_STACKWALK
+	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select HAVE_RELIABLE_STACKTRACE
 	select DMA_OPS


