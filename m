Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD94CACBD1
	for <lists+linux-parisc@lfdr.de>; Sun,  8 Sep 2019 11:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbfIHJdT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 8 Sep 2019 05:33:19 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:48707 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbfIHJdT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 8 Sep 2019 05:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=RmGnBD/xFgblP3IBlizaSuEbJK2/meHPkt5rIk7HqYU=; b=Op/JhfO/z4IEhp+JEHnDZhpqit
        gJap+n2gGctiSvnPS0OBdumK8zScZxQCTgXxIwvAcyQgHBElq5G3l0ZpkO1ZPIUUN13kuew237MTi
        fGkAMb8SvR31Z+5kGodzW+D3lorlB96vgcP/c8LR+NGbYgVcf19T4jLikyj51B4N6NSQ=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de ([46.5.233.221] helo=x280.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1i6tZN-0005Ro-CR; Sun, 08 Sep 2019 11:33:17 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 4/4] parisc: add support for kexec_file_load() syscall
Date:   Sun,  8 Sep 2019 11:33:06 +0200
Message-Id: <20190908093306.31455-5-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190908093306.31455-1-svens@stackframe.org>
References: <20190908093306.31455-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/Kconfig             | 10 ++++
 arch/parisc/kernel/Makefile     |  1 +
 arch/parisc/kernel/kexec.c      |  7 +++
 arch/parisc/kernel/kexec_file.c | 86 +++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 arch/parisc/kernel/kexec_file.c

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 548c767f4358..2e757c785239 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -359,6 +359,16 @@ config KEXEC
 	  shutdown, so do not be surprised if this code does not
 	  initially work for you.
 
+config KEXEC_FILE
+	bool "kexec file based system call"
+	select KEXEC_CORE
+	select KEXEC_ELF
+	help
+	  This enables the kexec_file_load() System call. This is
+	  file based and takes file descriptors as system call argument
+	  for kernel and initramfs as opposed to list of segments as
+	  accepted by previous system call.
+
 endmenu
 
 
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 487cf88866a8..2663c8f8be11 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
 obj-$(CONFIG_KGDB)			+= kgdb.o
 obj-$(CONFIG_KPROBES)			+= kprobes.o
 obj-$(CONFIG_KEXEC)			+= kexec.o relocate_kernel.o
+obj-$(CONFIG_KEXEC_FILE)		+= kexec_file.o
diff --git a/arch/parisc/kernel/kexec.c b/arch/parisc/kernel/kexec.c
index deeb0466d359..3d0716ded552 100644
--- a/arch/parisc/kernel/kexec.c
+++ b/arch/parisc/kernel/kexec.c
@@ -37,6 +37,13 @@ static void kexec_image_info(const struct kimage *kimage)
 
 	for (i = 0; i < kimage->nr_segments; i++)
 		kexec_show_segment_info(kimage, i);
+
+#ifdef CONFIG_KEXEC_FILE
+	if (kimage->file_mode) {
+		pr_debug("cmdline: %.*s\n", (int)kimage->cmdline_buf_len,
+			 kimage->cmdline_buf);
+	}
+#endif
 }
 
 void machine_kexec_cleanup(struct kimage *kimage)
diff --git a/arch/parisc/kernel/kexec_file.c b/arch/parisc/kernel/kexec_file.c
new file mode 100644
index 000000000000..f87c26e5e735
--- /dev/null
+++ b/arch/parisc/kernel/kexec_file.c
@@ -0,0 +1,86 @@
+/*
+ * Load ELF vmlinux file for the kexec_file_load syscall.
+ *
+ * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ *
+ */
+#include <linux/elf.h>
+#include <linux/kexec.h>
+#include <linux/libfdt.h>
+#include <linux/module.h>
+#include <linux/of_fdt.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+static void *elf_load(struct kimage *image, char *kernel_buf,
+			unsigned long kernel_len, char *initrd,
+			unsigned long initrd_len, char *cmdline,
+			unsigned long cmdline_len)
+{
+	int ret, i;
+	unsigned long kernel_load_addr;
+	struct elfhdr ehdr;
+	struct kexec_elf_info elf_info;
+	struct kexec_buf kbuf = { .image = image, .buf_min = 0,
+				  .buf_max = -1UL, };
+
+	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
+	if (ret)
+		goto out;
+
+	ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
+	if (ret)
+		goto out;
+
+	image->start = __pa(elf_info.ehdr->e_entry);
+
+	for(i = 0; i < image->nr_segments; i++)
+		image->segment[i].mem = __pa(image->segment[i].mem);
+
+	pr_debug("Loaded the kernel at 0x%lx, entry at 0x%lx\n",
+		 kernel_load_addr, image->start);
+
+	if (initrd != NULL) {
+		kbuf.buffer = initrd;
+		kbuf.bufsz = kbuf.memsz = initrd_len;
+		kbuf.buf_align = PAGE_SIZE;
+		kbuf.top_down = false;
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+		ret = kexec_add_buffer(&kbuf);
+		if (ret)
+			goto out;
+
+		pr_debug("Loaded initrd at 0x%lx\n", kbuf.mem);
+		image->arch.initrd_start = kbuf.mem;
+		image->arch.initrd_end = kbuf.mem + initrd_len;
+	}
+
+	if (cmdline != NULL) {
+		kbuf.buffer = cmdline;
+		kbuf.bufsz = kbuf.memsz = ALIGN(cmdline_len, 8);
+		kbuf.buf_align = PAGE_SIZE;
+		kbuf.top_down = false;
+		kbuf.buf_min = PAGE0->mem_free + PAGE_SIZE;
+		kbuf.buf_max = kernel_load_addr;
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+		ret = kexec_add_buffer(&kbuf);
+		if (ret)
+			goto out;
+
+		pr_debug("Loaded cmdline at 0x%lx\n", kbuf.mem);
+		image->arch.cmdline = kbuf.mem;
+	}
+out:
+	return NULL;
+}
+
+const struct kexec_file_ops kexec_elf_ops = {
+	.probe = kexec_elf_probe,
+	.load = elf_load,
+};
+
+const struct kexec_file_ops * const kexec_file_loaders[] = {
+	&kexec_elf_ops,
+	NULL
+};
+
-- 
2.23.0.rc1

