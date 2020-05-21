Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8791DD1D7
	for <lists+linux-parisc@lfdr.de>; Thu, 21 May 2020 17:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729997AbgEUPXO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 21 May 2020 11:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbgEUPXN (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 21 May 2020 11:23:13 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0102FC061A0E;
        Thu, 21 May 2020 08:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=81hDLaNsDP1XezBBCmTYO/9RleZtnLgOrYL3Jzc5rEw=; b=RelSvCH17DkzALKE5okRB+Y0wg
        KoFoeYNS38bl7gxLrLZ+lN3ApsSbTXeo1Mfx2PvWHH7REwAnx2ksix/dbD2jN3AIzpkm1Q+KYLrjb
        VCOu49KNHxA/far0fLLFGhtG6hKhnd5pRh00XeEBXomnMrq/JCfwWdde3cmQoAJ8EmS7QWQU6wfI3
        K6s2sps5HEy6NC9ldAe8gdJe6PHsU//hvdwAWSNJEjDzDouYLde2uR06cU4hUD29c941CcBwxKIKf
        QAWCwq2uFV/cwPzJVDOcsOF6JEtASh79XLNDBFIdet6IcrqMA5F0kvpD8cqNyImcP1pNuG7VhnHzd
        a7FX8gdA==;
Received: from [2001:4bb8:18c:5da7:c70:4a89:bc61:2] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jbn2H-000403-Jc; Thu, 21 May 2020 15:23:06 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     x86@kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/23] maccess: unexport probe_kernel_write and probe_user_write
Date:   Thu, 21 May 2020 17:22:39 +0200
Message-Id: <20200521152301.2587579-2-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521152301.2587579-1-hch@lst.de>
References: <20200521152301.2587579-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

These two functions are not used by any modular code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/maccess.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/maccess.c b/mm/maccess.c
index 3ca8d97e50106..cf21e604f78cb 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -121,7 +121,6 @@ long __probe_kernel_write(void *dst, const void *src, size_t size)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(probe_kernel_write);
 
 /**
  * probe_user_write(): safely attempt to write to a user-space location
@@ -148,7 +147,6 @@ long __probe_user_write(void __user *dst, const void *src, size_t size)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(probe_user_write);
 
 /**
  * strncpy_from_unsafe: - Copy a NUL terminated string from unsafe address.
-- 
2.26.2

