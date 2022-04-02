Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921604F0326
	for <lists+linux-parisc@lfdr.de>; Sat,  2 Apr 2022 15:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355912AbiDBNzh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 2 Apr 2022 09:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355891AbiDBNzd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 2 Apr 2022 09:55:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2ADBA7;
        Sat,  2 Apr 2022 06:53:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 06DB5B808C0;
        Sat,  2 Apr 2022 13:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8C5C34113;
        Sat,  2 Apr 2022 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648907613;
        bh=tnIBlbMSR1q6oqpRl/YAQ4ihjUMlqVK0g5yo1FXnzGg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A9iK05bMw2eWhaN4T6g2NWBJRoqROe9ENanSEAFYLMApjzId2bpa7gkmTEGlcGSbg
         Gj1qtKXYJtwFvG+IMfxSeb1oXBJpPIzZ5s58FituOFfmRgYn3KUsrtoqFXOQ6JT5xe
         SgfOCo6XDXGZCnOgBQqQFf2Rn1tV6iXVS+Y/WAlClR2Gu2V8yv0ukpz3c9uK2MCe7h
         10RsKYDwoaT6Z7jtA4M3sLxaUbW5VcFNcIPEs8UZhERSz3hZqsfVaAe3Mp7xzYww2J
         rp7ZLXjMEYqHtwyT5r1f1phUAPlGvBglAMkM5im8r+axFK99Z7uQdIEIw9rB6chFmn
         KLFxHLYUnlujg==
From:   guoren@kernel.org
To:     guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, hch@lst.de
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org, heiko@sntech.de, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V11 04/20] arch: Add SYSVIPC_COMPAT for all architectures
Date:   Sat,  2 Apr 2022 21:52:40 +0800
Message-Id: <20220402135256.2691868-5-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402135256.2691868-1-guoren@kernel.org>
References: <20220402135256.2691868-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Guo Ren <guoren@linux.alibaba.com>

The existing per-arch definitions are pretty much historic cruft.
Move SYSVIPC_COMPAT into init/Kconfig.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/arm64/Kconfig   | 4 ----
 arch/mips/Kconfig    | 5 -----
 arch/parisc/Kconfig  | 4 ----
 arch/powerpc/Kconfig | 5 -----
 arch/s390/Kconfig    | 3 ---
 arch/sparc/Kconfig   | 5 -----
 arch/x86/Kconfig     | 4 ----
 init/Kconfig         | 4 ++++
 8 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c842878f8133..03b14ac18214 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2114,10 +2114,6 @@ config DMI
 
 endmenu
 
-config SYSVIPC_COMPAT
-	def_bool y
-	depends on COMPAT && SYSVIPC
-
 menu "Power management options"
 
 source "kernel/power/Kconfig"
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 058446f01487..91a17ad380c9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3170,16 +3170,12 @@ config MIPS32_COMPAT
 config COMPAT
 	bool
 
-config SYSVIPC_COMPAT
-	bool
-
 config MIPS32_O32
 	bool "Kernel support for o32 binaries"
 	depends on 64BIT
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT
 	select MIPS32_COMPAT
-	select SYSVIPC_COMPAT if SYSVIPC
 	help
 	  Select this option if you want to run o32 binaries.  These are pure
 	  32-bit binaries as used by the 32-bit Linux/MIPS port.  Most of
@@ -3193,7 +3189,6 @@ config MIPS32_N32
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION
 	select COMPAT
 	select MIPS32_COMPAT
-	select SYSVIPC_COMPAT if SYSVIPC
 	help
 	  Select this option if you want to run n32 binaries.  These are
 	  64-bit binaries using 32-bit quantities for addressing and certain
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 43c1c880def6..bc56759d44a2 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -345,10 +345,6 @@ config COMPAT
 	def_bool y
 	depends on 64BIT
 
-config SYSVIPC_COMPAT
-	def_bool y
-	depends on COMPAT && SYSVIPC
-
 config AUDIT_ARCH
 	def_bool y
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b779603978e1..5a32b7f21af2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -291,11 +291,6 @@ config COMPAT
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION
 
-config SYSVIPC_COMPAT
-	bool
-	depends on COMPAT && SYSVIPC
-	default y
-
 config SCHED_OMIT_FRAME_POINTER
 	bool
 	default y
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index be9f39fd06df..80f69cafbb87 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -459,9 +459,6 @@ config COMPAT
 	  (and some other stuff like libraries and such) is needed for
 	  executing 31 bit applications.  It is safe to say "Y".
 
-config SYSVIPC_COMPAT
-	def_bool y if COMPAT && SYSVIPC
-
 config SMP
 	def_bool y
 
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 1cab1b284f1a..15d5725bd623 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -488,9 +488,4 @@ config COMPAT
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION
 
-config SYSVIPC_COMPAT
-	bool
-	depends on COMPAT && SYSVIPC
-	default y
-
 source "drivers/sbus/char/Kconfig"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 9f5bd41bf660..7d0487189f6e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2860,10 +2860,6 @@ config COMPAT
 if COMPAT
 config COMPAT_FOR_U64_ALIGNMENT
 	def_bool y
-
-config SYSVIPC_COMPAT
-	def_bool y
-	depends on SYSVIPC
 endif
 
 endmenu
diff --git a/init/Kconfig b/init/Kconfig
index e9119bf54b1f..589ccec56571 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -386,6 +386,10 @@ config SYSVIPC_SYSCTL
 	depends on SYSCTL
 	default y
 
+config SYSVIPC_COMPAT
+	def_bool y
+	depends on COMPAT && SYSVIPC
+
 config POSIX_MQUEUE
 	bool "POSIX Message Queues"
 	depends on NET
-- 
2.25.1

