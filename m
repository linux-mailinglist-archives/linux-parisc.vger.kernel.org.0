Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C549D7A0AC4
	for <lists+linux-parisc@lfdr.de>; Thu, 14 Sep 2023 18:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbjINQ2F (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 14 Sep 2023 12:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233860AbjINQ2E (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 14 Sep 2023 12:28:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B27DC1FC4
        for <linux-parisc@vger.kernel.org>; Thu, 14 Sep 2023 09:27:59 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5E4C433C8;
        Thu, 14 Sep 2023 16:27:58 +0000 (UTC)
Date:   Thu, 14 Sep 2023 18:27:55 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Enable HAVE_ARCH_PREL32_RELOCATIONS
Message-ID: <ZQM0i4lgvIRN/Ptd@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Enable HAVE_ARCH_PREL32_RELOCATIONS for 64-bit kernels, which
will save some bytes in the final binary.

Signed-off-by: Helge Deller <deller@gmx.de>

---

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index a15ab147af2e..4686f14e45ee 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -73,6 +73,7 @@ config PARISC
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select HAVE_ARCH_KGDB
+	select HAVE_ARCH_PREL32_RELOCATIONS if 64BIT
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_DYNAMIC_FTRACE if $(cc-option,-fpatchable-function-entry=1,1)
