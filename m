Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF7DE7CCB7C
	for <lists+linux-parisc@lfdr.de>; Tue, 17 Oct 2023 21:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234968AbjJQTAW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 Oct 2023 15:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234966AbjJQTAV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 Oct 2023 15:00:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCEB6F5
        for <linux-parisc@vger.kernel.org>; Tue, 17 Oct 2023 12:00:19 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DEFC433CA;
        Tue, 17 Oct 2023 19:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697569219;
        bh=NtGnceuVrMq8JgJPAEquWZpc1KeAAucUlBCvDI9b3X4=;
        h=From:To:Cc:Subject:Date:From;
        b=NwWJI+IaEBk9swB2yWP1J5pQutuWdvDx//yb9Kkky55NiaMQzecOgrBU6fB6WU50D
         5R1kfIjab9OuD1LmcgXCPznh5WQYj28gFgpunMuHmjs8xoyHYA6t2f2E34AtgsbhiP
         bPcMAboVh6fjnnINZvd0kExITEasqY6A9KpKDIeZKZaZwzRYwD9Xiqn/1bi0Km1nty
         L+YUfFYu+gX10hxqNtCNa1Vcqmw/Ucqb9GQ+Fo7p+oP5PTsqMfabI3nYQ/c4LYA93P
         M/eUA23cMiKtjHPLgknA4z7CdKjM8vPkGhOHSlVIo7Ia8ruK9be2COKPpEBr9au6jI
         Xgo4uExo5TgAA==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Allow building uncompressed Linux kernel
Date:   Tue, 17 Oct 2023 21:00:11 +0200
Message-ID: <20231017190011.132801-1-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

Add HAVE_KERNEL_UNCOMPRESSED flag and fix build in boot
directory.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/Kconfig       | 1 +
 arch/parisc/boot/Makefile | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index a15ab147af2e..9288c39dbf39 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -25,6 +25,7 @@ config PARISC
 	select INIT_ALL_POSSIBLE
 	select BUG
 	select BUILDTIME_TABLE_SORT
+	select HAVE_KERNEL_UNCOMPRESSED
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
 	select HAVE_KERNEL_BZIP2
diff --git a/arch/parisc/boot/Makefile b/arch/parisc/boot/Makefile
index b873ee4720ca..657f967240ee 100644
--- a/arch/parisc/boot/Makefile
+++ b/arch/parisc/boot/Makefile
@@ -10,7 +10,7 @@ subdir- := compressed
 $(obj)/image: vmlinux FORCE
 	$(call if_changed,objcopy)
 
-$(obj)/bzImage: $(obj)/compressed/vmlinux FORCE
+$(obj)/bzImage: $(if $(CONFIG_KERNEL_UNCOMPRESSED),$(objtree)/vmlinux,$(obj)/compressed/vmlinux) FORCE
 	$(call if_changed,objcopy)
 
 $(obj)/compressed/vmlinux: FORCE
-- 
2.41.0

