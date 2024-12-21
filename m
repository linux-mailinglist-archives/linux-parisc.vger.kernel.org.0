Return-Path: <linux-parisc+bounces-3091-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B78F9F9EBE
	for <lists+linux-parisc@lfdr.de>; Sat, 21 Dec 2024 07:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54CBC7A1AFA
	for <lists+linux-parisc@lfdr.de>; Sat, 21 Dec 2024 06:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7121DED57;
	Sat, 21 Dec 2024 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NV9xzF/h"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A61C32FE;
	Sat, 21 Dec 2024 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734761799; cv=none; b=gY9Tj9max8N72Ez85iGPNmd4bohkRM+JuNF9mwDGIsKRrF7+lICAPUOTJm7Es+kgQaWfymNHbQPLwMURw8C5ewSb02sv+gnYBYm343T4bvxkAew+cV56rdG+Eb5RVbOUeE28rtMeciQLKNnWKKN1TnPIJuVc+JutJsdQOv4l+4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734761799; c=relaxed/simple;
	bh=1kxkdWJxgnRAvDO7bsJ206JEOaqz8NZsEvJzwGh9FPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N2lk/sP9kB6xB+KPyzQYYAqqtT79ojliygYyj7cYbYiaPXUrt9mp48+7Mq5dye4vbT4M5jUffsDU7GmGdkCsL8T3RfZtT/9A4xQ064gIWIxn72o1O52xnnJ2nDTGKkP1m2Fb/y0sVbKRUrfq3iOSKghVDnqKBJeI0oILLgkW0PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NV9xzF/h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D712FC4CECE;
	Sat, 21 Dec 2024 06:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734761799;
	bh=1kxkdWJxgnRAvDO7bsJ206JEOaqz8NZsEvJzwGh9FPM=;
	h=From:To:Cc:Subject:Date:From;
	b=NV9xzF/hrURYS+nYkE+p6jP7u20NrninSDuXcb8tdequ8uGBkXV93tPmS1ZE1yQd8
	 KpqvDH90kgF/Y47V1XiEVybjA/KxKKGr0Mg4EUXVcyIVuJy+bzisGn+tj6JzilxJei
	 +FTlIBtgk1AuGq6Xin0SbpFRpsaoTgrJODbiZRu/ANQ2I67MLYOhFXlmJjnG9+z9q4
	 gRkTJVrEFlesgfiEqUOnAQd4sFSpTxnOLGSND9GcM77jA6icxwdHRBDFHO5EI0C9Ko
	 p4HpfVCdnoAcY4auf63CV1hqmx8mzHcNQHnfXeCuFIArGu6JwBo7JrfnqhMXWQnXni
	 XZT/6TEAuKCCQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] parisc: add vdso linker script to 'targets' instead of extra-y
Date: Sat, 21 Dec 2024 15:16:18 +0900
Message-ID: <20241221061631.328327-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdso linker script is preprocessed on demand.
Adding it to 'targets' is enough to include the .cmd file.

This commit applies the previous change to parisc, which added the
vdso support after commit 887af6d7c99e ("arch: vdso: add vdso linker
script to 'targets' instead of extra-y").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/parisc/kernel/vdso32/Makefile | 2 +-
 arch/parisc/kernel/vdso64/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/vdso32/Makefile b/arch/parisc/kernel/vdso32/Makefile
index 2b36d25ada6e..288f8b85978f 100644
--- a/arch/parisc/kernel/vdso32/Makefile
+++ b/arch/parisc/kernel/vdso32/Makefile
@@ -33,7 +33,7 @@ KBUILD_CFLAGS += -DBUILD_VDSO -DDISABLE_BRANCH_PROFILING
 VDSO_LIBGCC := $(shell $(CROSS32CC) -print-libgcc-file-name)
 
 obj-y += vdso32_wrapper.o
-extra-y += vdso32.lds
+targets += vdso32.lds
 CPPFLAGS_vdso32.lds += -P -C  #  -U$(ARCH)
 
 $(obj)/vdso32_wrapper.o : $(obj)/vdso32.so FORCE
diff --git a/arch/parisc/kernel/vdso64/Makefile b/arch/parisc/kernel/vdso64/Makefile
index bd87bd6a6659..bc5d9553f311 100644
--- a/arch/parisc/kernel/vdso64/Makefile
+++ b/arch/parisc/kernel/vdso64/Makefile
@@ -32,7 +32,7 @@ KBUILD_CFLAGS += -DBUILD_VDSO -DDISABLE_BRANCH_PROFILING
 VDSO_LIBGCC := $(shell $(CC) -print-libgcc-file-name)
 
 obj-y += vdso64_wrapper.o
-extra-y += vdso64.lds
+targets += vdso64.lds
 CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
 
 $(obj)/vdso64_wrapper.o : $(obj)/vdso64.so FORCE
-- 
2.43.0


