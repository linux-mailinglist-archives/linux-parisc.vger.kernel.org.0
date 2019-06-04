Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA06234FDB
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2019 20:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfFDSen (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jun 2019 14:34:43 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:59054 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfFDSem (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jun 2019 14:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=wchMKd4QnWx9yZ26MZez4ppwTrJJj5iYiSeI3yEAsdw=; b=hWXzfem8pgBJLTQi9O55KtI0P/
        VaSfurR+fq3v9QjrNAKWEM/jwOH/r9PNsXvLrdnKZuX9s4NzcSLOv3bVUNPNVZxRk9Qvxedv6H1x8
        rUVxdhuivv+Arn3X5rkUUY7Gg1ujTYAwp07u2YIJVhaVGZ2Ip/UJ3tiF8xrvOxntMzXs=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hYEGf-0002tN-5Y; Tue, 04 Jun 2019 20:34:41 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v2 5/6] compiler.h: add CC_USING_PATCHABLE_FUNCTION_ENTRY
Date:   Tue,  4 Jun 2019 20:34:34 +0200
Message-Id: <20190604183435.20175-6-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604183435.20175-1-svens@stackframe.org>
References: <20190604183435.20175-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This can be used for architectures implementing dynamic
ftrace via -fpatchable-function-entry.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 include/linux/compiler_types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 19e58b9138a0..095d55c3834d 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -112,6 +112,8 @@ struct ftrace_likely_data {
 
 #if defined(CC_USING_HOTPATCH)
 #define notrace			__attribute__((hotpatch(0, 0)))
+#elif defined(CC_USING_PATCHABLE_FUNCTION_ENTRY)
+#define notrace			__attribute__((patchable_function_entry(0, 0)))
 #else
 #define notrace			__attribute__((__no_instrument_function__))
 #endif
-- 
2.20.1

