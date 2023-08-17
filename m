Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88BB678001C
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Aug 2023 23:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355406AbjHQVpc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Aug 2023 17:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355431AbjHQVpP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Aug 2023 17:45:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22FFDE4F
        for <linux-parisc@vger.kernel.org>; Thu, 17 Aug 2023 14:45:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B53AC6441B
        for <linux-parisc@vger.kernel.org>; Thu, 17 Aug 2023 21:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72408C433C7;
        Thu, 17 Aug 2023 21:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692308713;
        bh=UQGbIwFzgYixJPgdfmufpeK2ES1cy5Py6XrJ+9HLaB4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jrpcrd8FHjlXK3P8PquymaNijcmjl1mzzI5aJWeRdopLNddWGHZ6P4hE08WsB/Y/E
         16c4NQZu53CyaffAnXmSnlirjiRCXlG+H7wRDd5RpgK+oGC8nabuwi4uga8PlgBOA+
         c6tMmpruEJpF4czxAmYk5YSLACmkSw7VOAuBIiYsEVo67xTdvJa+v73V9+90yQI9o4
         4JJUobgWaCN+RCCjgGZXz5uRMM2jLswrsPU16UkBF6RZwOSNpCnKfUokMCN8hHGs2k
         Ty+OS8Cxoz5TKTAF5CKf3xfszqNLr8SeMl1JPcH/kX52kGFhej+CuD+soN0Eru8vvR
         OPb/Cd4YoB0AQ==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH 5/5] parisc: Wire up eBPF code
Date:   Thu, 17 Aug 2023 23:45:02 +0200
Message-ID: <20230817214503.108660-6-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817214503.108660-1-deller@kernel.org>
References: <20230817214503.108660-1-deller@kernel.org>
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

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/Kbuild  | 2 +-
 arch/parisc/Kconfig | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/Kbuild b/arch/parisc/Kbuild
index a6d3b280ba0c..749b195f2894 100644
--- a/arch/parisc/Kbuild
+++ b/arch/parisc/Kbuild
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y	+= mm/ kernel/ math-emu/
+obj-y	+= mm/ kernel/ math-emu/ net/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 4cb46d5c64a2..f79ea09b94ab 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -56,6 +56,8 @@ config PARISC
 	select HAVE_ARCH_KFENCE
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_EBPF_JIT
+	select ARCH_WANT_DEFAULT_BPF_JIT
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select GENERIC_SCHED_CLOCK
-- 
2.41.0

