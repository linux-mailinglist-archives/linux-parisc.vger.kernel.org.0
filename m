Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15AC37CA2C
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 19:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbfGaRT3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 13:19:29 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:33646 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbfGaRT3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 13:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=RUHaAk4Bl24H50kcW5JDeVueM4MHccO1GbxWVreGqpg=; b=qE27eiBZ8iHCtn+D/wkD9Ue84q
        Q3NX4aX1wqXxjDY54DK4WSpu/UEEpF8TMhXBaqz90RZ5yOGxZSq28BgK+UKY9Psv2NSH7ywVOUtLw
        /zA6ntkgeJGjer9xywg4/WJYlVbKNuGG/Ye5qX/IzQZ68ncFfmuJ3UM9supVgPn82ztc=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hssG8-0006Qy-0L; Wed, 31 Jul 2019 19:19:28 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: strip debug information when building compressed images
Date:   Wed, 31 Jul 2019 19:19:23 +0200
Message-Id: <20190731171923.24155-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When compiling the kernel with debug information i got the following error:

hppa-linux-gnu-ld: section .text LMA [0000000000e78000,0000000000e7b41f] overlaps section .rodata.compressed LMA [00000000000e0078,00000000015ad43d]
make[3]: *** [/home/svens/parisc-linux/src/arch/parisc/boot/compressed/Makefile:28: arch/parisc/boot/compressed/vmlinux] Error 1
make[2]: *** [/home/svens/parisc-linux/src/arch/parisc/boot/Makefile:17: arch/parisc/boot/compressed/vmlinux] Error 2
make[2]: Target 'arch/parisc/boot/bzImage' not remade because of errors.

While this might also be fixed by adjusting the linker script, i think we
should strip the debug information when generating the compressed image. This
reduces the size of vmlinuz/lifimage from ~69MB to 6.6MB when full debug
information is enabled.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/boot/compressed/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compressed/Makefile
index 2da8624e5cf6..2a81997b1079 100644
--- a/arch/parisc/boot/compressed/Makefile
+++ b/arch/parisc/boot/compressed/Makefile
@@ -55,8 +55,11 @@ $(obj)/misc.o: $(obj)/sizes.h
 CPPFLAGS_vmlinux.lds += -I$(objtree)/$(obj) -DBOOTLOADER
 $(obj)/vmlinux.lds: $(obj)/sizes.h
 
+quiet_cmd_objcopy_strip_debug = OBJCOPY_STRIP_DEBUG $@
+      cmd_objcopy_strip_debug = $(OBJCOPY) --strip-debug $< $@
+
 $(obj)/vmlinux.bin: vmlinux
-	$(call if_changed,objcopy)
+	$(call if_changed,objcopy_strip_debug)
 
 vmlinux.bin.all-y := $(obj)/vmlinux.bin
 
-- 
2.20.1

