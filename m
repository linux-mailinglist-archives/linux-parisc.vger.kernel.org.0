Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01511D9829
	for <lists+linux-parisc@lfdr.de>; Tue, 19 May 2020 15:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729023AbgESNpB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 May 2020 09:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726471AbgESNpA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 May 2020 09:45:00 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7BFC08C5C0;
        Tue, 19 May 2020 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=FhwjB9eDi0xwZgnRZDImeNjcc9cNIZkOcwQVq4y1nSU=; b=gvPazP0vAzyOSCV6Y78Gm/hLx3
        cjtD+OyrHK0VAwl70OlTSW7w6w/0Mv2ZeKo7JtUFGhs62HnEF/+vnW215rz3Q/0uRJtrhvhMP8FF6
        fTvsU9xL+p7X+Wtc9ssMtimHnwcd/TBauomv5aLe5kjP2j2w3fv6gsH2+hiGHsBiJB62Fg84Lt2Sa
        J0KXEMhK3NTGagzNd9xOuvJRJslfGv2yI6rB5bkV3CeHn+XkgFkzdPysLNKTbFV+WL8iJi4vMOmFj
        5/MUgU8o6Lvz4y/I9XUoyX1m5SLsf0J/XiVJkH5sL9RIUsQhfo9o9+YaQ6cclcHmd6pyBFm0hL1gG
        XJqpJrfg==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jb2YE-00010U-3c; Tue, 19 May 2020 13:44:58 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     x86@kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/20] maccess: remove various unused weak aliases
Date:   Tue, 19 May 2020 15:44:31 +0200
Message-Id: <20200519134449.1466624-3-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519134449.1466624-1-hch@lst.de>
References: <20200519134449.1466624-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

maccess tends to define lots of underscore prefixed symbols that then
have other weak aliases.  But except for two cases they are never
actually used, so remove them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/uaccess.h |  3 ---
 mm/maccess.c            | 19 +++----------------
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 67f016010aad5..a2c606a403745 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -324,7 +324,6 @@ extern long __probe_kernel_read(void *dst, const void *src, size_t size);
  * happens, handle that and return -EFAULT.
  */
 extern long probe_user_read(void *dst, const void __user *src, size_t size);
-extern long __probe_user_read(void *dst, const void __user *src, size_t size);
 
 /*
  * probe_kernel_write(): safely attempt to write to a location
@@ -336,7 +335,6 @@ extern long __probe_user_read(void *dst, const void __user *src, size_t size);
  * happens, handle that and return -EFAULT.
  */
 extern long notrace probe_kernel_write(void *dst, const void *src, size_t size);
-extern long notrace __probe_kernel_write(void *dst, const void *src, size_t size);
 
 /*
  * probe_user_write(): safely attempt to write to a location in user space
@@ -348,7 +346,6 @@ extern long notrace __probe_kernel_write(void *dst, const void *src, size_t size
  * happens, handle that and return -EFAULT.
  */
 extern long notrace probe_user_write(void __user *dst, const void *src, size_t size);
-extern long notrace __probe_user_write(void __user *dst, const void *src, size_t size);
 
 extern long strncpy_from_unsafe(char *dst, const void *unsafe_addr, long count);
 extern long strncpy_from_unsafe_strict(char *dst, const void *unsafe_addr,
diff --git a/mm/maccess.c b/mm/maccess.c
index cf21e604f78cb..4e7f3b6eb05ae 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -79,11 +79,7 @@ EXPORT_SYMBOL_GPL(probe_kernel_read);
  * Safely read from user address @src to the buffer at @dst. If a kernel fault
  * happens, handle that and return -EFAULT.
  */
-
-long __weak probe_user_read(void *dst, const void __user *src, size_t size)
-    __attribute__((alias("__probe_user_read")));
-
-long __probe_user_read(void *dst, const void __user *src, size_t size)
+long probe_user_read(void *dst, const void __user *src, size_t size)
 {
 	long ret = -EFAULT;
 	mm_segment_t old_fs = get_fs();
@@ -106,11 +102,7 @@ EXPORT_SYMBOL_GPL(probe_user_read);
  * Safely write to address @dst from the buffer at @src.  If a kernel fault
  * happens, handle that and return -EFAULT.
  */
-
-long __weak probe_kernel_write(void *dst, const void *src, size_t size)
-    __attribute__((alias("__probe_kernel_write")));
-
-long __probe_kernel_write(void *dst, const void *src, size_t size)
+long probe_kernel_write(void *dst, const void *src, size_t size)
 {
 	long ret;
 	mm_segment_t old_fs = get_fs();
@@ -131,11 +123,7 @@ long __probe_kernel_write(void *dst, const void *src, size_t size)
  * Safely write to address @dst from the buffer at @src.  If a kernel fault
  * happens, handle that and return -EFAULT.
  */
-
-long __weak probe_user_write(void __user *dst, const void *src, size_t size)
-    __attribute__((alias("__probe_user_write")));
-
-long __probe_user_write(void __user *dst, const void *src, size_t size)
+long probe_user_write(void __user *dst, const void *src, size_t size)
 {
 	long ret = -EFAULT;
 	mm_segment_t old_fs = get_fs();
@@ -171,7 +159,6 @@ long __probe_user_write(void __user *dst, const void *src, size_t size)
  * probing memory on a user address range where strncpy_from_unsafe_user() is
  * supposed to be used instead.
  */
-
 long __weak strncpy_from_unsafe(char *dst, const void *unsafe_addr, long count)
     __attribute__((alias("__strncpy_from_unsafe")));
 
-- 
2.26.2

