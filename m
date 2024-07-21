Return-Path: <linux-parisc+bounces-1836-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95CB938630
	for <lists+linux-parisc@lfdr.de>; Sun, 21 Jul 2024 23:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 850E3280DCB
	for <lists+linux-parisc@lfdr.de>; Sun, 21 Jul 2024 21:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF45322E;
	Sun, 21 Jul 2024 21:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyacpAI1"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00E48F5B
	for <linux-parisc@vger.kernel.org>; Sun, 21 Jul 2024 21:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721598040; cv=none; b=G35qu7Ykt9RYRfxjX48/2S5QR/pMmlefK2BL6JTbAptD6lBLf9Z1+N14TSVER08qUFfMuqzWcx0rwLNbH17vHULynIHBKiIEdJgsHlVFkhjKoz+mljsrkazXFh6Q11Hn+i2dlfn8g4dhpmIdnwhmhPQtHqzbZPWO7N3jzzR1oXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721598040; c=relaxed/simple;
	bh=+WvKUXTHzHRpIIK04rDPTtGFsCz+fpdIaij6HP/9x6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wootqcnf/xrOMICnD+9GDhTAqALPQ3U4uMF2EvSBEhojDAE0k6md/x8Gq/tf2dHPtoo4gCFHEjzDqiVnoFmlZgYrkymqgeROuYlDbjG5koran0bmzOgEhZrgV91U02M/W2j8rLLDGnAPdp9IPgXBI2Z8jZcynvApICiQzO8W/Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyacpAI1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7231AC116B1;
	Sun, 21 Jul 2024 21:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721598040;
	bh=+WvKUXTHzHRpIIK04rDPTtGFsCz+fpdIaij6HP/9x6s=;
	h=From:To:Cc:Subject:Date:From;
	b=KyacpAI1na5axdU4vEi5iYhXuykqyjkjXbzTTfabkfkL5IEw0wONR/x+7g7IgGUk/
	 tSVuRuYiiZxHkhYbPudk93ghB8iWGgfyVCkaX6xWRPHmdIewIVAgDm9UJh8AZlDdkc
	 C3clZx4YmQDp5ucVYoA5fT+skKQYDTe5b89+0sCncfrccY4NkzZ31Fs3t0X5eulsMI
	 CsDobQdg4cHtlm3AKGW7qzcf5+Yyx7VH7CGAByMZ4svBC1a3VJqIynhUgHnWBbQnas
	 cnBeELy2qRaF/nXmv3R7spH+bMEa+T3BhdWCgrQt/UOzEho/RgreuqV+hMlRCPigKn
	 yy/iTWMunpBKw==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add support for CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN
Date: Sun, 21 Jul 2024 23:40:28 +0200
Message-ID: <20240721214028.22180-1-deller@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Allow users to disable kernel warnings for unaligned memory
accesses from kernel via the /proc/sys/kernel/ignore-unaligned-usertrap
procfs entry.
That way users can disable those warnings in case they happen too
often.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 Documentation/admin-guide/sysctl/kernel.rst | 2 +-
 arch/parisc/Kconfig                         | 1 +
 arch/parisc/kernel/unaligned.c              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 7fd43947832f..f8bc1630eba0 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -454,7 +454,7 @@ ignore-unaligned-usertrap
 
 On architectures where unaligned accesses cause traps, and where this
 feature is supported (``CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN``;
-currently, ``arc`` and ``loongarch``), controls whether all
+currently, ``arc``, ``parisc`` and ``loongarch``), controls whether all
 unaligned traps are logged.
 
 = =============================================================
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 50735f3a772c..d815af5f1aeb 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -45,6 +45,7 @@ config PARISC
 	select GENERIC_CPU_DEVICES if !SMP
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select SYSCTL_ARCH_UNALIGN_ALLOW
+	select SYSCTL_ARCH_UNALIGN_NO_WARN
 	select SYSCTL_EXCEPTION_TRACE
 	select HAVE_MOD_ARCH_SPECIFIC
 	select MODULES_USE_ELF_RELA
diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned.c
index 71e596ca5a86..3e79e40e361d 100644
--- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -104,6 +104,7 @@
 #define ERR_NOTHANDLED	-1
 
 int unaligned_enabled __read_mostly = 1;
+int no_unaligned_warning __read_mostly;
 
 static int emulate_ldh(struct pt_regs *regs, int toreg)
 {
@@ -399,6 +400,7 @@ void handle_unaligned(struct pt_regs *regs)
 	} else {
 		static DEFINE_RATELIMIT_STATE(kernel_ratelimit, 5 * HZ, 5);
 		if (!(current->thread.flags & PARISC_UAC_NOPRINT) &&
+			!no_unaligned_warning &&
 			__ratelimit(&kernel_ratelimit))
 			pr_warn("Kernel: unaligned access to " RFMT " in %pS "
 					"(iir " RFMT ")\n",
-- 
2.45.2


