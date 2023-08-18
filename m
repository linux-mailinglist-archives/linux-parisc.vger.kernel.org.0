Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292B6781599
	for <lists+linux-parisc@lfdr.de>; Sat, 19 Aug 2023 01:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241862AbjHRXCY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 18 Aug 2023 19:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241917AbjHRXCB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 18 Aug 2023 19:02:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED4D12B
        for <linux-parisc@vger.kernel.org>; Fri, 18 Aug 2023 16:01:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 44B3262A19
        for <linux-parisc@vger.kernel.org>; Fri, 18 Aug 2023 23:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F153AC433C8;
        Fri, 18 Aug 2023 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692399718;
        bh=ELSN2fnTlevxdRcWDZPxUBcM+0DVUnUs55t+4ftpJhs=;
        h=From:To:Cc:Subject:Date:From;
        b=mSdSVUgYWXCgAH9ueZUkk+mNkY1+BWwCep4ue2aBD0VvVUTQHppTXaYVECIYnv15l
         00+MAU9rvp477dTdC/Sl/NFPPX/YfCbD79XMdAA1/K41l+v4KPitHo9FsWF8+NG6ns
         PM9+YSbuDTnZq0v8kLuefiWfb40pB1stme0NXoSJl8oC6m8s1mJdoUHrFN0rXO7Tzj
         jMFW896jwjNV0stI6pmN1Ui6IUoLCWwnwPyJpf3X9UF9IHL/iNwAX8KWD6zz4hcjdK
         YAdTAkFIydWKceK4oi2623SHN7e0YKWKAbM2XkWU+wR5vQqhFfIskkqF/Kzrjwzqji
         ri17LjFqMNCLA==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Use generic mmap top-down layout and brk randomization
Date:   Sat, 19 Aug 2023 01:01:40 +0200
Message-ID: <20230818230140.68414-1-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

parisc uses a top-down layout by default that exactly fits the generic
functions, so get rid of arch specific code and use the generic version
by selecting ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT.

Note that on parisc the stack always grows up and a "unlimited stack"
simply means that the value as defined in CONFIG_STACK_MAX_DEFAULT_SIZE_MB
should be used. So RLIM_INFINITY is not an indicator to use the legacy
memory layout.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/Kconfig             | 17 +++++++++++
 arch/parisc/kernel/process.c    | 14 ---------
 arch/parisc/kernel/sys_parisc.c | 54 +--------------------------------
 mm/util.c                       |  5 ++-
 4 files changed, 22 insertions(+), 68 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 4cb46d5c64a2..3a257bca0878 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -49,6 +49,9 @@ config PARISC
 	select TTY # Needed for pdc_cons.c
 	select HAS_IOPORT if PCI || EISA
 	select HAVE_DEBUG_STACKOVERFLOW
+	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
+	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
+	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HASH
 	select HAVE_ARCH_JUMP_LABEL
@@ -124,6 +127,20 @@ config TIME_LOW_RES
 	depends on SMP
 	default y
 
+config ARCH_MMAP_RND_BITS_MIN
+	default 18 if 64BIT
+	default 8
+
+config ARCH_MMAP_RND_COMPAT_BITS_MIN
+	default 8
+
+config ARCH_MMAP_RND_BITS_MAX
+	default 24 if 64BIT
+	default 17
+
+config ARCH_MMAP_RND_COMPAT_BITS_MAX
+	default 17
+
 # unless you want to implement ACPI on PA-RISC ... ;-)
 config PM
 	bool
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 62f9b14c6406..ed93bd8c1545 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -278,17 +278,3 @@ __get_wchan(struct task_struct *p)
 	} while (count++ < MAX_UNWIND_ENTRIES);
 	return 0;
 }
-
-static inline unsigned long brk_rnd(void)
-{
-	return (get_random_u32() & BRK_RND_MASK) << PAGE_SHIFT;
-}
-
-unsigned long arch_randomize_brk(struct mm_struct *mm)
-{
-	unsigned long ret = PAGE_ALIGN(mm->brk + brk_rnd());
-
-	if (ret < mm->brk)
-		return mm->brk;
-	return ret;
-}
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index 9915062d5243..ab896eff7a1d 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -161,7 +161,7 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	}
 
 	info.flags = 0;
-	info.low_limit = mm->mmap_legacy_base;
+	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_upper_limit(NULL);
 	return vm_unmapped_area(&info);
 }
@@ -181,58 +181,6 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 			addr, len, pgoff, flags, DOWN);
 }
 
-static int mmap_is_legacy(void)
-{
-	if (current->personality & ADDR_COMPAT_LAYOUT)
-		return 1;
-
-	/* parisc stack always grows up - so a unlimited stack should
-	 * not be an indicator to use the legacy memory layout.
-	 * if (rlimit(RLIMIT_STACK) == RLIM_INFINITY)
-	 *	return 1;
-	 */
-
-	return sysctl_legacy_va_layout;
-}
-
-static unsigned long mmap_rnd(void)
-{
-	unsigned long rnd = 0;
-
-	if (current->flags & PF_RANDOMIZE)
-		rnd = get_random_u32() & MMAP_RND_MASK;
-
-	return rnd << PAGE_SHIFT;
-}
-
-unsigned long arch_mmap_rnd(void)
-{
-	return (get_random_u32() & MMAP_RND_MASK) << PAGE_SHIFT;
-}
-
-static unsigned long mmap_legacy_base(void)
-{
-	return TASK_UNMAPPED_BASE + mmap_rnd();
-}
-
-/*
- * This function, called very early during the creation of a new
- * process VM image, sets up which VM layout function to use:
- */
-void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
-{
-	mm->mmap_legacy_base = mmap_legacy_base();
-	mm->mmap_base = mmap_upper_limit(rlim_stack);
-
-	if (mmap_is_legacy()) {
-		mm->mmap_base = mm->mmap_legacy_base;
-		mm->get_unmapped_area = arch_get_unmapped_area;
-	} else {
-		mm->get_unmapped_area = arch_get_unmapped_area_topdown;
-	}
-}
-
-
 asmlinkage unsigned long sys_mmap2(unsigned long addr, unsigned long len,
 	unsigned long prot, unsigned long flags, unsigned long fd,
 	unsigned long pgoff)
diff --git a/mm/util.c b/mm/util.c
index dd12b9531ac4..881020644497 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -396,7 +396,10 @@ static int mmap_is_legacy(struct rlimit *rlim_stack)
 	if (current->personality & ADDR_COMPAT_LAYOUT)
 		return 1;
 
-	if (rlim_stack->rlim_cur == RLIM_INFINITY)
+	/* On parisc the stack always grows up - so a unlimited stack should
+	 * not be an indicator to use the legacy memory layout. */
+	if (rlim_stack->rlim_cur == RLIM_INFINITY &&
+		!IS_ENABLED(CONFIG_STACK_GROWSUP))
 		return 1;
 
 	return sysctl_legacy_va_layout;
-- 
2.41.0

