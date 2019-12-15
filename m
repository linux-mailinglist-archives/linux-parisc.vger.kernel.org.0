Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4013011FAE7
	for <lists+linux-parisc@lfdr.de>; Sun, 15 Dec 2019 20:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfLOT7A (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 15 Dec 2019 14:59:00 -0500
Received: from shroom.duncanthrax.net ([178.63.180.169]:47323 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfLOT67 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 15 Dec 2019 14:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=v4hu6NjzL09wTqw0ln6/9sBC7B1teagKBAXFuXPJtjk=; b=f5JfaPuyBkvus8GFdBffq1wr1L
        ihCltxh4Encevduk58i/UqmKFwPD8JXQ4rP2c4/TSvjQA2IxYW3K86HPuhHmZePxWONzv12OOwlAh
        9st7/3myY52fAqx8lpQiYYBV1pMwH40WZSJPz08aoG89MpoWH50O/nXbWh+fST++1ZV0=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de ([46.5.233.221] helo=x280.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.90_1)
        (envelope-from <svens@stackframe.org>)
        id 1igZGo-0001J2-TM; Sun, 15 Dec 2019 20:09:35 +0100
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: add missing __init annotation
Date:   Sun, 15 Dec 2019 20:09:27 +0100
Message-Id: <20191215190927.29689-1-svens@stackframe.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

compilation failed with:

MODPOST vmlinux.o
WARNING: vmlinux.o(.text.unlikely+0xa0c): Section mismatch in reference from the function walk_lower_bus() to the function .init.text:walk_native_bus()
The function walk_lower_bus() references
the function __init walk_native_bus().
This is often because walk_lower_bus lacks a __init
annotation or the annotation of walk_native_bus is wrong.

FATAL: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
make[2]: *** [/home/svens/linux/parisc-linux/src/scripts/Makefile.modpost:64: __modpost] Error 1
make[1]: *** [/home/svens/linux/parisc-linux/src/Makefile:1077: vmlinux] Error 2
make[1]: Leaving directory '/home/svens/linux/parisc-linux/build'
make: *** [Makefile:179: sub-make] Error 2

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/drivers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index 3b330e58a4f0..a6c9f49c6612 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -810,7 +810,7 @@ EXPORT_SYMBOL(device_to_hwpath);
 static void walk_native_bus(unsigned long io_io_low, unsigned long io_io_high,
                             struct device *parent);
 
-static void walk_lower_bus(struct parisc_device *dev)
+static void __init walk_lower_bus(struct parisc_device *dev)
 {
 	unsigned long io_io_low, io_io_high;
 
-- 
2.24.0

