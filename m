Return-Path: <linux-parisc+bounces-1854-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418793DEA4
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 12:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 550D41C2040D
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 10:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DCF8F6D;
	Sat, 27 Jul 2024 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e4qi0sHe"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8F440848
	for <linux-parisc@vger.kernel.org>; Sat, 27 Jul 2024 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722074808; cv=none; b=hPD4R1jBbqnLhIZeF4I4NZbkpOVNRw9xu1MOtgEKvV5CG/VdzeAxRYW2MREOCD7xIPZjzi8E1YyWc2a6MjofeLwjgNOG2VU6qtgxhql1onmw9e9j/i4HeRC1Sm6m44SGMnXw2J5E0GaylMS4LXOPrr6DlGDMFUdHNcP7z6LayBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722074808; c=relaxed/simple;
	bh=Jd3bSmkof5sMiikKifDUtoRsswa+iArKG5VC9LoBH9s=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=YtWSVBByRxaAtBDhqr7ivjoa4MCbpqOk6+wIk5vAqvgwWpH538P/FK/9SvAUHsv7rzSPyvuBgGmq7bxaFI1bu6HhdrDhRb/yAstyFtItfRRpLSxDMJ80508PH5bKtmxWTxP2ZhexGc8vBhX65OgB80PeMjjUiD2togfj3a0sMkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e4qi0sHe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722074805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Xy2rnxv7bXV57Hb9FmbrGZ22Me0/5cLLvHo9pDLn1zU=;
	b=e4qi0sHemc/m6ko9NcTV/wiPSKtMg0la5kffYUYE/hf/RP2MSB/i25OSQ49bdLE3vQl+/U
	qyzfaem//k1ZqN6ELGihA3u14ZGwK5/qhFlIG9wiqgUNrUR5lViFUYmNbD41X9keBJyo9+
	0rw1mf1tHRB15Jl/vANoQkj9p9el3AM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-367--n8mMLGJOF66KUfO09brbw-1; Sat,
 27 Jul 2024 06:06:41 -0400
X-MC-Unique: -n8mMLGJOF66KUfO09brbw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E1F0C1955D42;
	Sat, 27 Jul 2024 10:06:39 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CEAEB300018D;
	Sat, 27 Jul 2024 10:06:38 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 7DB4030C1C17; Sat, 27 Jul 2024 10:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 79ACB3FD04;
	Sat, 27 Jul 2024 12:06:37 +0200 (CEST)
Date: Sat, 27 Jul 2024 12:06:37 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: John David Anglin <dave.anglin@bell.net>, 
    John David Anglin <dave@parisc-linux.org>, 
    James Bottomley <James.Bottomley@HansenPartnership.com>, 
    Helge Deller <deller@gmx.de>
cc: linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: fix a possible DMA corruption
Message-ID: <76f39b33-4066-a891-94e5-671b1d82df27@redhat.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

ARCH_DMA_MINALIGN was defined as 16 - this is too small - it may be 
possible that two unrelated 16-byte allocations share a cache line. If one 
of these allocations is written using DMA and the other is written using 
cached write, the value that was written with DMA may be corrupted.

This commit changes ARCH_DMA_MINALIGN to be 128 - that's the largest 
possible cache line size on parisc.

As different parisc microarchitectures have different cache line size, we 
define arch_slab_minalign(), cache_line_size() and 
dma_get_cache_alignment() so that the kernel may tune slab cache 
parameters dynamically, based on the detected cache line size.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 arch/parisc/Kconfig             |    1 +
 arch/parisc/include/asm/cache.h |    7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

Index: linux-6.10/arch/parisc/include/asm/cache.h
===================================================================
--- linux-6.10.orig/arch/parisc/include/asm/cache.h	2023-09-18 11:33:40.000000000 +0200
+++ linux-6.10/arch/parisc/include/asm/cache.h	2024-07-26 20:27:06.000000000 +0200
@@ -20,7 +20,12 @@
 
 #define SMP_CACHE_BYTES L1_CACHE_BYTES
 
-#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
+#define ARCH_DMA_MINALIGN	128
+#define ARCH_KMALLOC_MINALIGN	8
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


