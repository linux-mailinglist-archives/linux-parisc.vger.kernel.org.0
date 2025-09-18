Return-Path: <linux-parisc+bounces-4061-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B69B564C4
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Sep 2025 05:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 554237A7139
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Sep 2025 03:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F402701CE;
	Sun, 14 Sep 2025 03:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8exd0Or"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54DC25B2FA
	for <linux-parisc@vger.kernel.org>; Sun, 14 Sep 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821874; cv=none; b=SnJX8EGclSUn6P6wE6DMHq2vxSoBm0lgcoWaIPGDJlKdTDk/xM+D+8vpdhJDcfWnAP5E+MGUtYup3xflWtgoN4rW8iC4Q4AIMz4zOEMN26yO4apcGxjKpXX2Z1cmc435ZGNYa0T3ea/+5w7hNOB1dxyMJ3b62CepYzcVv4rNC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821874; c=relaxed/simple;
	bh=0pa06GJsqjKCCDz/UM3o5nwPqkgP4CqvzP324rR3v40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JkDS61WvoHSorhkTMj9UDRM4XUsyIrh5P34v3hfMOSSGulQ6s0OsZOnNcADOgzFDxXA/mhaP1k9ZU1nyQMBiC13ZLZf6b99YydGqCB/shi40xOpsCL7W4/Ise0mPYXyQ5zaVeQu7tCyf1Hu1Xt8Lg5tE2WrPdHBlWW2binjowko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8exd0Or; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b07d4d24d09so262355866b.2
        for <linux-parisc@vger.kernel.org>; Sat, 13 Sep 2025 20:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821868; x=1758426668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=Q8exd0Or+KP3IfpJ/F6cr04Z8ZzprXAK/vvOy0fDtx94X4VdoDeaLl53x+Re5XVu87
         nMyvaYDn8vFmTcEvvBxemBcs/KQak0F949JM4uH33s339OQt5URkPKDSAY3+ZGKOdjL5
         pUJ94likUMs0rBMqjlpvJwgZdJbK3S9flcLQ8zD5bq7g6BoxDcTYuO+f8U85RhZRiEFd
         NWgbXH/2vbui42YTjC9kWIfsAixItMc1GfQiwH5d3DjDt9wpiScun1VkZoezAqvc6RKI
         73MhrVf1ZHdX6nrAEPt0Dk6q5BbIrsUiJClkzy8cJCjt926MOo3foy+tV7x7JwQDnt3k
         Kq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821868; x=1758426668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=EhR1D924+/knEJz5OV0QPr6Uj4ZCNn3CcYyg2qhcLUVX9MgWl/PApzyuwv8f8CUN9U
         GGcnxbcVH4K2M0WPkm/b1C0zdLyUM72lhsyPdizrIOjsmNPkogFSasCJTUAU3mwxU9Ce
         mNafyXM25X2WIbKdh2VhSwu8hQMTwZFt+S2oWsgeozMmIm38bJjAvmVBRMPdWvLkdUbu
         ekZqc1erEXR7aiqXnRJ2PE2V1G0FIKc99taMcut0jRpWAIDRhW57LuxCFqHR1UoGe5Pa
         N3eGRZzoG8D+2ECWG5nXXCIpLbZX+tOza/R05x2/wDDZDGxnb5jhHNIb8zWhYtjSKo2x
         iTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfzqg78wqZB0X2TXFfxtCsLtXszzv+JCdMkTWecUAy9XEhQsJFt/Cp4Zi4xBfsFeJBCoT/goUknWxcCbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbzyWJH0wQaP3lMT4D1vTAhqjdrl5fk3GqlK60xnMVjXGES2k7
	o0SdYkw/to1cvD84PFR6bws+3+PrdMWddO9uSDkt+ZSn+1xpKSPrP84D
X-Gm-Gg: ASbGnctDBPDnCDsv1VUxEpe33G4iJn+TiqzQ28AJM55J9GDR1RK6Obk7i5/8JGsWrpe
	PiCAi/NUel9H9nBEvoqFkyZJ2Rx6DjT0MHrffwXl64IYowRaQXPaBLULdJvH+s/qlTOlE7TJiaG
	cDxFJNDTss/z3EhWhs8wYZUjO7kh16WJYIYee2OjnPiAPJhY/M5mCsoCUU5bYEhmQUq2dkyensA
	ZTE3aaroQvwtXgPd5d+2bPPj5IHRJKcd2gdeYGftVfSbeuC6V4SZ7EOJcGFkDiLNQmPEMNP4ewY
	bULw04NXr0pSXNHruQ89B653tNzhff/EWQ/RCsoyOwFumEuu8Cdqf2a1OeAJCMMzq5Fy5HCE/U1
	/OIi4hRExu4J1D3fzEeU=
X-Google-Smtp-Source: AGHT+IGYiK6likOM/TjE1BLl/jI3UX22nGT0EQIxF87CUWohx3tkGnMcAa8PzC4lwu+rbC2577QTfw==
X-Received: by 2002:a17:906:46c7:b0:b07:da17:79fd with SMTP id a640c23a62f3a-b07da178367mr507229866b.17.1757821868321;
        Sat, 13 Sep 2025 20:51:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3347b6fsm679031866b.111.2025.09.13.20.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:51:07 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 39/62] init: make console_on_rootfs static
Date: Sun, 14 Sep 2025 06:51:03 +0300
Message-ID: <20250914035103.3619203-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 include/linux/initrd.h | 2 --
 init/main.c            | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 364b603215ac..55239701c4e0 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -23,6 +23,4 @@ extern unsigned long phys_external_initramfs_size;
 extern char __builtin_initramfs_start[];
 extern unsigned long __builtin_initramfs_size;
 
-void console_on_rootfs(void);
-
 #endif /* __LINUX_INITRD_H */
diff --git a/init/main.c b/init/main.c
index 58a7199c81f7..f119460bf8e1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1533,7 +1533,7 @@ static int __ref kernel_init(void *unused)
 }
 
 /* Open /dev/console, for stdin/stdout/stderr, this should never fail */
-void __init console_on_rootfs(void)
+static void __init console_on_rootfs(void)
 {
 	struct file *file = filp_open("/dev/console", O_RDWR, 0);
 
-- 
2.47.2


