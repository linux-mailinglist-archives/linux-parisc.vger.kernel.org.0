Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CB9440AD8
	for <lists+linux-parisc@lfdr.de>; Sat, 30 Oct 2021 20:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhJ3SDK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 30 Oct 2021 14:03:10 -0400
Received: from condef-10.nifty.com ([202.248.20.75]:28214 "EHLO
        condef-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229474AbhJ3SDJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 30 Oct 2021 14:03:09 -0400
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-10.nifty.com with ESMTP id 19UHwW8m025517
        for <linux-parisc@vger.kernel.org>; Sun, 31 Oct 2021 02:58:33 +0900
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 19UHvPwa014662;
        Sun, 31 Oct 2021 02:57:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 19UHvPwa014662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1635616648;
        bh=2a08r+QBj6yClHK2kfJy7guIZlg48mYzJekxt4je47k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T9DJeIJf6Hf4H+qFxQLMyb0EYtq8KHxCFaJLAoHDXvvBbRBQBv67rGTJJPasaUCzc
         w3J8MoA5LPPJ7JE5jddFaQuyOK1HzC+QnTVb49S+pFAc/t7j0xdDbJglBx6HCyl1P4
         dKn5kF1D1oWpdLEEg1ldaXRo7bKftWjpO2+9422jPzWapa1O0c39y+X+rbgm5SdhMc
         1mexHEnHnoqUpfW1EmfZqOud7F/ENq2c6EmJtxN8SUTmNLXDCl37uFCDbKU5lY9Xdj
         GUbeNfohIlIAZ5chw6ulW9VZ4/n+lT7tCd3kjXM9LwI0LYCdqa25c9jNZlCxbym6uu
         IbvqLmitBatFw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-parisc@vger.kernel.org, patches@arm.linux.org.uk
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] parisc: decompressor: clean up Makefile
Date:   Sun, 31 Oct 2021 02:57:21 +0900
Message-Id: <20211030175721.1716841-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211030175721.1716841-1-masahiroy@kernel.org>
References: <20211030175721.1716841-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Do not list the same objects in 'OBJECTS' and 'targets'.

Instead, add $(OBJECTS) to 'targets'.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/parisc/boot/compressed/Makefile | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compressed/Makefile
index f7ed79e23c2c..bf4f2891d0b7 100644
--- a/arch/parisc/boot/compressed/Makefile
+++ b/arch/parisc/boot/compressed/Makefile
@@ -9,9 +9,10 @@ KCOV_INSTRUMENT := n
 GCOV_PROFILE := n
 UBSAN_SANITIZE := n
 
+OBJECTS := head.o real2.o firmware.o misc.o piggy.o
 targets := vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2
 targets += vmlinux.bin.xz vmlinux.bin.lzma vmlinux.bin.lzo vmlinux.bin.lz4
-targets += misc.o piggy.o sizes.h head.o real2.o firmware.o
+targets += $(OBJECTS) sizes.h
 targets += real2.S firmware.c
 
 KBUILD_CFLAGS := -D__KERNEL__ -O2 -DBOOTLOADER
@@ -23,10 +24,8 @@ ifndef CONFIG_64BIT
 KBUILD_CFLAGS += -mfast-indirect-calls
 endif
 
-OBJECTS += $(obj)/head.o $(obj)/real2.o $(obj)/firmware.o $(obj)/misc.o $(obj)/piggy.o
-
 LDFLAGS_vmlinux := -X -e startup --as-needed -T
-$(obj)/vmlinux: $(obj)/vmlinux.lds $(OBJECTS) $(LIBGCC) FORCE
+$(obj)/vmlinux: $(obj)/vmlinux.lds $(addprefix $(obj)/, $(OBJECTS)) $(LIBGCC) FORCE
 	$(call if_changed,ld)
 
 sed-sizes := -e 's/^\([0-9a-fA-F]*\) . \(__bss_start\|_end\|parisc_kernel_start\)$$/\#define SZ\2 0x\1/p'
-- 
2.30.2

