Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963D0306981
	for <lists+linux-parisc@lfdr.de>; Thu, 28 Jan 2021 02:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbhA1BIR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 27 Jan 2021 20:08:17 -0500
Received: from condef-10.nifty.com ([202.248.20.75]:47201 "EHLO
        condef-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhA1BFr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 27 Jan 2021 20:05:47 -0500
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-10.nifty.com with ESMTP id 10S0xfHu017835;
        Thu, 28 Jan 2021 09:59:41 +0900
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 10S0pjIq024172;
        Thu, 28 Jan 2021 09:52:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIq024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611795133;
        bh=TL0Lxb9L6uqgAXQZTpsgGcALdDAyn1jCaueREMxl1Kg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SKqf4laQkEgG2A9Aw5UsQqXZinwC9J9Gm3WRBgfmjOWQz0/OPrcQTzerEIRWXb900
         crV0MR/MYC0tozgk1iQJicaBB8lVHTnGxHapxTjxfQGqHYUO+QmQvr/sKvWSPitYg3
         JIwyUCkstFhIsvnWgwrhk8zMqdGsRKClkxBaLjn0y7pSNycRuNwkg3O/35faBmdnst
         EOvBJkx2YG1dkYKC/ThKJtFH23A+QAH5LzgKjkm0GD5irTaFM4l5YAdZKBkvZxS644
         p+IPCamWe22698XKTniyirF6H7KEwPLPbxFtAfTGUi5Yw/fOozA32oNIYPKk8SA2XJ
         +VFKf39ko9xUA==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-arch@vger.kernel.org, x86@kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 21/27] sparc: remove wrong comment from arch/sparc/include/asm/Kbuild
Date:   Thu, 28 Jan 2021 09:51:03 +0900
Message-Id: <20210128005110.2613902-22-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210128005110.2613902-1-masahiroy@kernel.org>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

These are NOT exported to userspace.

The headers listed in arch/sparc/include/uapi/asm/Kbuild are exported.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sparc/include/asm/Kbuild | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
index 3688fdae50e4..aec20406145e 100644
--- a/arch/sparc/include/asm/Kbuild
+++ b/arch/sparc/include/asm/Kbuild
@@ -1,6 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-# User exported sparc header files
-
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
 generated-y += syscall_table_c32.h
-- 
2.27.0

