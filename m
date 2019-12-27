Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 356E112B6D4
	for <lists+linux-parisc@lfdr.de>; Fri, 27 Dec 2019 18:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbfL0Rp2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 27 Dec 2019 12:45:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:44094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728703AbfL0Rp1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 27 Dec 2019 12:45:27 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9F2920740;
        Fri, 27 Dec 2019 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577468726;
        bh=sy2Calgp9CwR7ibuyNniX63iyl5RxqkfSkdj2DtD6cM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=adm+0lQZcydEfMtF2SZmXem9zonJKKP45hk4sdmhfQgn14HTWOKRZCG2bQFotN4lZ
         CndxgTmqlFL2/h6OrCR/EmjnncxEVSkTaoRxOGDZ9A5c+BSqVwxRwBpNZ5meNrEa53
         G4jxVdWqSmCTjoygd+9HPgzwK1tnDweeg+CwZ1fk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Sasha Levin <sashal@kernel.org>,
        linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 79/84] parisc: Fix compiler warnings in debug_core.c
Date:   Fri, 27 Dec 2019 12:43:47 -0500
Message-Id: <20191227174352.6264-79-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227174352.6264-1-sashal@kernel.org>
References: <20191227174352.6264-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

[ Upstream commit 75cf9797006a3a9f29a3a25c1febd6842a4a9eb2 ]

Fix this compiler warning:
kernel/debug/debug_core.c: In function ‘kgdb_cpu_enter’:
arch/parisc/include/asm/cmpxchg.h:48:3: warning: value computed is not used [-Wunused-value]
   48 |  ((__typeof__(*(ptr)))__xchg((unsigned long)(x), (ptr), sizeof(*(ptr))))
arch/parisc/include/asm/atomic.h:78:30: note: in expansion of macro ‘xchg’
   78 | #define atomic_xchg(v, new) (xchg(&((v)->counter), new))
      |                              ^~~~
kernel/debug/debug_core.c:596:4: note: in expansion of macro ‘atomic_xchg’
  596 |    atomic_xchg(&kgdb_active, cpu);
      |    ^~~~~~~~~~~

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/parisc/include/asm/cmpxchg.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/cmpxchg.h b/arch/parisc/include/asm/cmpxchg.h
index f627c37dad9c..ab5c215cf46c 100644
--- a/arch/parisc/include/asm/cmpxchg.h
+++ b/arch/parisc/include/asm/cmpxchg.h
@@ -44,8 +44,14 @@ __xchg(unsigned long x, __volatile__ void *ptr, int size)
 **		if (((unsigned long)p & 0xf) == 0)
 **			return __ldcw(p);
 */
-#define xchg(ptr, x) \
-	((__typeof__(*(ptr)))__xchg((unsigned long)(x), (ptr), sizeof(*(ptr))))
+#define xchg(ptr, x)							\
+({									\
+	__typeof__(*(ptr)) __ret;					\
+	__typeof__(*(ptr)) _x_ = (x);					\
+	__ret = (__typeof__(*(ptr)))					\
+		__xchg((unsigned long)_x_, (ptr), sizeof(*(ptr)));	\
+	__ret;								\
+})
 
 /* bug catcher for when unsupported size is used - won't link */
 extern void __cmpxchg_called_with_bad_pointer(void);
-- 
2.20.1

