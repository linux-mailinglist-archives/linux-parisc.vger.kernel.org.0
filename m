Return-Path: <linux-parisc+bounces-217-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E7E8109B0
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Dec 2023 06:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30ACC1C209D1
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Dec 2023 05:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81435CA6D;
	Wed, 13 Dec 2023 05:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dCxjHeug"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A87BDB
	for <linux-parisc@vger.kernel.org>; Tue, 12 Dec 2023 21:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702447086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mO1KBSR/aHS3/goavwyErIvJSA5uOL+z59IlmO49PfM=;
	b=dCxjHeug7sXbs/0ZYvNfUOQADzV3NNCitAQxcCOUEd3PEvl/FEjgIMd3kt4AlQob2Af4re
	/7G+kPgW2e7GT7CvvGBCesmtQY5gBfaPDt3TaX7kcTE/JatCyyVweEw7ntO5DUZjjW3/bU
	ZnptbMBbtFgO8v2hepfp0MLmWQukyls=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-h16RJlpCNyOpEy5PoUnaNw-1; Wed,
 13 Dec 2023 00:58:02 -0500
X-MC-Unique: h16RJlpCNyOpEy5PoUnaNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D1273C40B56;
	Wed, 13 Dec 2023 05:58:01 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D608A1C060AF;
	Wed, 13 Dec 2023 05:57:56 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org,
	akpm@linux-foundation.org,
	joe@perches.com,
	nathan@kernel.org,
	conor@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v4 1/7] kexec_file: add kexec_file flag to control debug printing
Date: Wed, 13 Dec 2023 13:57:41 +0800
Message-ID: <20231213055747.61826-2-bhe@redhat.com>
In-Reply-To: <20231213055747.61826-1-bhe@redhat.com>
References: <20231213055747.61826-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

When specifying 'kexec -c -d', kexec_load interface will print loading
information, e.g the regions where kernel/initrd/purgatory/cmdline
are put, the memmap passed to 2nd kernel taken as system RAM ranges,
and printing all contents of struct kexec_segment, etc. These are
very helpful for analyzing or positioning what's happening when
kexec/kdump itself failed. The debugging printing for kexec_load
interface is made in user space utility kexec-tools.

Whereas, with kexec_file_load interface, 'kexec -s -d' print nothing.
Because kexec_file code is mostly implemented in kernel space, and the
debugging printing functionality is missed. It's not convenient when
debugging kexec/kdump loading and jumping with kexec_file_load
interface.

Now add KEXEC_FILE_DEBUG to kexec_file flag to control the debugging
message printing. And add global variable kexec_file_dbg_print and
macro kexec_dprintk() to facilitate the printing.

This is a preparation, later kexec_dprintk() will be used to replace the
existing pr_debug(). Once 'kexec -s -d' is specified, it will print out
kexec/kdump loading information. If '-d' is not specified, it regresses
to pr_debug().

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/linux/kexec.h      | 9 ++++++++-
 include/uapi/linux/kexec.h | 1 +
 kernel/kexec_core.c        | 2 ++
 kernel/kexec_file.c        | 3 +++
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 8227455192b7..400cb6c02176 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -403,7 +403,7 @@ bool kexec_load_permitted(int kexec_image_type);
 
 /* List of defined/legal kexec file flags */
 #define KEXEC_FILE_FLAGS	(KEXEC_FILE_UNLOAD | KEXEC_FILE_ON_CRASH | \
-				 KEXEC_FILE_NO_INITRAMFS)
+				 KEXEC_FILE_NO_INITRAMFS | KEXEC_FILE_DEBUG)
 
 /* flag to track if kexec reboot is in progress */
 extern bool kexec_in_progress;
@@ -500,6 +500,13 @@ static inline int crash_hotplug_memory_support(void) { return 0; }
 static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
 #endif
 
+extern bool kexec_file_dbg_print;
+
+#define kexec_dprintk(fmt, ...)					\
+	printk("%s" fmt,					\
+	       kexec_file_dbg_print ? KERN_INFO : KERN_DEBUG,	\
+	       ##__VA_ARGS__)
+
 #else /* !CONFIG_KEXEC_CORE */
 struct pt_regs;
 struct task_struct;
diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
index 01766dd839b0..c17bb096ea68 100644
--- a/include/uapi/linux/kexec.h
+++ b/include/uapi/linux/kexec.h
@@ -25,6 +25,7 @@
 #define KEXEC_FILE_UNLOAD	0x00000001
 #define KEXEC_FILE_ON_CRASH	0x00000002
 #define KEXEC_FILE_NO_INITRAMFS	0x00000004
+#define KEXEC_FILE_DEBUG	0x00000008
 
 /* These values match the ELF architecture values.
  * Unless there is a good reason that should continue to be the case.
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index be5642a4ec49..f70bf3a7885c 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -52,6 +52,8 @@ atomic_t __kexec_lock = ATOMIC_INIT(0);
 /* Flag to indicate we are going to kexec a new kernel */
 bool kexec_in_progress = false;
 
+bool kexec_file_dbg_print;
+
 int kexec_should_crash(struct task_struct *p)
 {
 	/*
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index f9a419cd22d4..aca5dac74044 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -123,6 +123,8 @@ void kimage_file_post_load_cleanup(struct kimage *image)
 	 */
 	kfree(image->image_loader_data);
 	image->image_loader_data = NULL;
+
+	kexec_file_dbg_print = false;
 }
 
 #ifdef CONFIG_KEXEC_SIG
@@ -278,6 +280,7 @@ kimage_file_alloc_init(struct kimage **rimage, int kernel_fd,
 	if (!image)
 		return -ENOMEM;
 
+	kexec_file_dbg_print = !!(flags & KEXEC_FILE_DEBUG);
 	image->file_mode = 1;
 
 	if (kexec_on_panic) {
-- 
2.41.0


