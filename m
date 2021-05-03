Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05743715B8
	for <lists+linux-parisc@lfdr.de>; Mon,  3 May 2021 15:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbhECNJh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 May 2021 09:09:37 -0400
Received: from mout.gmx.net ([212.227.17.21]:47165 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233317AbhECNJh (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 May 2021 09:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620047318;
        bh=Bo/V5v0/eMlXZpWWFpZFtwEsfYlfPmGXuhPepfVy8c0=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=DDG/HTe6ZhsBj2lT2kQDbz8fWdo7CPvVxInZOUcxpwDLnwPS3uzt6PBHJPXjvACnK
         DqOEvsdleCTua7jF2GfVIauA8bVQ8EIjU+4Ezt5E8fFPJVtxFpzRjGEe0jb77FVFGt
         YJ6pXZLZoyjK7LwxxXtgyXvz1F4lgjFbBK5tp0zE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.187.2]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1lPa5s0ANO-00vzTJ; Mon, 03
 May 2021 15:08:38 +0200
Date:   Mon, 3 May 2021 15:07:53 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: parisc: Add KFENCE support
Message-ID: <YI/1qWmpLGV0YDDa@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:ObDcrGz0oB4FvpkAxoE6LbdeMbxHUxHhX9/yOlA958X/vrzokoA
 mx/pSg9JAsoOMhthazSdJRt0Qai8CtFWyOQz4X0cLEQ/Nmu4dvzDPCeEzv2J1VOrFF6/Ao6
 gQegBqfbWoX6wwtX5AOZcEHElbs1QUsldclM5yBouOl7rRRiQXp5Y8y6/a07vubIHEU8RO/
 HADqRy6EWKRbxd3owBlSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OilOSeLEV+Y=:p4MZetrC+dGxk9tTbhjHFD
 cV8T2qF2A88bhXnrXQotJrX+dAWMLmxzerKra85sNQ0f3hKqEGd5ughIxZj4n/U2UpoXVeijE
 JYIEgVS1AuaZd8MpjqhfXI1DDk9cQrTk5fbdFq1QTFl8VyB66IiCfr6+YIyNFPcV0zBYT1u+R
 2KyQHveJan3Z64gzlms7pnU98stGVhmdPOD5epKGssMR2V9dpbMFt6H6TvtR5LZmYCdKgv0ZP
 eWTAiPQxEKKHBXKlceMCWt5NtybYJKpnsscxUWWmLZQhUHojdmjUY6ivvxv974zw8tmgpDov+
 irydRBAMGzJ58/Wn2WiRD4Kyg8F7sjS8Joh/bLpTWetd6K94SkijWqDVTXjblEUPAaWbW1Wfh
 OrN6DICmcCW2+j9nncwC4mMa5WNsncJO+XXfwqAULmVOzXlraIS50SnVT+ADFP/Zf1NiK18sR
 THC+dYBVfFpBCQx2JkpFzeqWKRIrAxD0LpFhcoj4Ge7cRVHA3ahgQsB0uL4/PMqiJZHOPGiwb
 5QkcozXaQng8OhvUDG/gcCEzexDUlRNglTUAvUmVa6Rmk2Ge18f7I/Fk6klD/Et4JmmDe1Q/0
 dPV/6p9BaPZ1H97b/yvRsotB8opF7aCbOg5D0IDWNxjmqdD54A0+o/XQ4LTiiynjLMGic1l9g
 Px/uG0DIl3UhjgkGaffcKVXWxkwPLc77178gQDkh6nsKTouL/qfkxCL3lNxq47M1Jmq4sLHvY
 V/Ta2WHH2VW1Ue7MQ0Nfzpf72JuC/FD9dATeyShsoshSIDEP3jJ6dwZBHOEJm6CdWHCfvs/C3
 QJPHrKWgxEdODsNLpwgEJi198xzVXiTDBneShsx//jrl2eOCjX6xUu+BX70aaImNBvDqjuioV
 oOQNa9fQ4dEKfObIp3waFZBEkN4T7Tvc+ZJm8Zr3T5HZPyEP9xvGBoPHabXWqkG1WZWzPeTnK
 sO86lApqa6iVma/yL8O/OV2gMKkG8PqMtOWe9f5lCsr8Iws9tCfiilgLDwU1KF8RNVj781gRr
 a/4xwdQm2OdQM6XU4V0WZhBIQGTkPfZO/f81PwwNnblaXy35w6P37AA0RpugxXsxQrOKR+4wt
 IN7i3Wpz/4+TI08imttDDdAK9l8HfehSpfqkFeb3fKh7ndZRDo2n60hMNsvV9jE32HFXgC6UU
 SMJCLjsgH96nvBxIAFA056Y5xgCc0ArLk0j+S+4vkdef3knhxSxrs8Dd+WoKp/YPqtPOs=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index afc3b8d03572..e4a6ae388eb3 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -47,6 +47,7 @@ config PARISC
 	select HAVE_ARCH_HASH
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
+	select HAVE_ARCH_KFENCE
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_REGS_AND_STACK_ACCESS_API
@@ -257,11 +258,11 @@ config PARISC_PAGE_SIZE_4KB

 config PARISC_PAGE_SIZE_16KB
 	bool "16KB"
-	depends on PA8X00 && BROKEN
+	depends on PA8X00 && BROKEN && !KFENCE

 config PARISC_PAGE_SIZE_64KB
 	bool "64KB"
-	depends on PA8X00 && BROKEN
+	depends on PA8X00 && BROKEN && !KFENCE

 endchoice

diff --git a/arch/parisc/include/asm/kfence.h b/arch/parisc/include/asm/kf=
ence.h
new file mode 100644
index 000000000000..41982ed5617b
=2D-- /dev/null
+++ b/arch/parisc/include/asm/kfence.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PA-RISC KFENCE support.
+ *
+ * Copyright (C) 2021, Helge Deller <deller@gmx.de>
+ */
+
+#ifndef _ASM_PARISC_KFENCE_H
+#define _ASM_PARISC_KFENCE_H
+
+#include <linux/kfence.h>
+
+#include <asm/pgtable.h>
+#include <asm/tlbflush.h>
+
+static inline bool arch_kfence_init_pool(void)
+{
+	return true;
+}
+
+/* Protect the given page and flush TLB. */
+static inline bool kfence_protect_page(unsigned long addr, bool protect)
+{
+	pte_t *pte =3D virt_to_kpte(addr);
+
+	if (WARN_ON(!pte))
+		return false;
+
+	/*
+	 * We need to avoid IPIs, as we may get KFENCE allocations or faults
+	 * with interrupts disabled.
+	 */
+
+	if (protect) {
+		set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
+		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+	}
+	else
+		set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
+
+
+	return true;
+}
+
+#endif /* _ASM_PARISC_KFENCE_H */
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 716960f5d92e..ae4398ba0b7d 100644
=2D-- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -19,6 +19,7 @@
 #include <linux/uaccess.h>
 #include <linux/hugetlb.h>
 #include <linux/perf_event.h>
+#include <linux/kfence.h>

 #include <asm/traps.h>

@@ -416,6 +417,10 @@ void do_page_fault(struct pt_regs *regs, unsigned lon=
g code,
 		return;
 	}

+	if (!user_mode(regs) &&
+	    kfence_handle_page_fault(address, flags & FAULT_FLAG_WRITE, regs))
+		return;
+
 	parisc_terminate("Bad Address (null pointer deref?)", regs, code, addres=
s);

   out_of_memory:
