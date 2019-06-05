Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A941236583
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jun 2019 22:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfFEUc1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jun 2019 16:32:27 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:50084 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFEUc0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jun 2019 16:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=wchMKd4QnWx9yZ26MZez4ppwTrJJj5iYiSeI3yEAsdw=; b=tTakmL45xf48P4zvWyT6cZy9Sg
        cDSOHIN9CdwH1aIkNAt80GSCknOInIPHhg7Bsg3nZIpIuDWteedK747glufumUF5xsPkcFaXprW3H
        FKerpnlxHw138Gg4Q9gzj26KN/UCIwILxZ9rYV629rPZaqnDyM3szkuOfyXOp4e/e+yI=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hYca9-0004ei-EJ; Wed, 05 Jun 2019 22:32:25 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v3 5/6] compiler.h: add CC_USING_PATCHABLE_FUNCTION_ENTRY
Date:   Wed,  5 Jun 2019 22:32:21 +0200
Message-Id: <20190605203222.6194-6-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190605203222.6194-1-svens@stackframe.org>
References: <20190605203222.6194-1-svens@stackframe.org>
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

