Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8F4AACBD0
	for <lists+linux-parisc@lfdr.de>; Sun,  8 Sep 2019 11:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfIHJdS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 8 Sep 2019 05:33:18 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:34707 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbfIHJdS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 8 Sep 2019 05:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=caDhX3bd3eJChISbQjTGvjXKfzvtwrhWH2Q33X5hVDI=; b=i+8KNg611BRTH/36pTtxAHSyd7
        l01BfeU/2qRIbfwFK1yYv65HVTeISAC9PEbXy7IC3D+8V8inR7jLdOwYPIpyQHYv5w2i6Hrtm2Fkp
        aCKMJLuaCwifGI8K6U3sjU3jpNIZ+8cxYuJ9DUjBpVbUoXTydqeBt2e6VUt4t2WkNauA=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de ([46.5.233.221] helo=x280.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1i6tZN-0005Ro-78; Sun, 08 Sep 2019 11:33:17 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 3/4] parisc: wire up kexec_file_load syscall
Date:   Sun,  8 Sep 2019 11:33:05 +0200
Message-Id: <20190908093306.31455-4-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190908093306.31455-1-svens@stackframe.org>
References: <20190908093306.31455-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/syscalls/syscall.tbl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index 670d1371aca1..285ff516150c 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -399,7 +399,8 @@
 352	common	pkey_alloc		sys_pkey_alloc
 353	common	pkey_free		sys_pkey_free
 354	common	rseq			sys_rseq
-# 355 through 402 are unassigned to sync up with generic numbers
+355	common	kexec_file_load		sys_kexec_file_load		sys_kexec_file_load
+# up to 402 is unassigned and reserved for arch specific syscalls
 403	32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
 404	32	clock_settime64			sys_clock_settime		sys_clock_settime
 405	32	clock_adjtime64			sys_clock_adjtime		sys_clock_adjtime
-- 
2.23.0.rc1

