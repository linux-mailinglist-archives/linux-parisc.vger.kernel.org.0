Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2084D42728F
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Oct 2021 22:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242932AbhJHUuh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 8 Oct 2021 16:50:37 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:43320 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243266AbhJHUuf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 8 Oct 2021 16:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QbiWZaIEFL/r5D4YIsa9tNdWo0DCFE/2tu4bKS0BZe8=; b=ZdYgPXn7EfclBuLnocDtmIPB/J
        Ayodd1j1e+0XowmaHzPNwesPR78i8sH3SCWkdFmDdzuNY9KI5aedB6/5u1RYCQCmnXR7hAfI/d2qF
        uZ2OzJwEmqWuS8c82dPi4y8LZD7UOsBpSMYyeCxs59EOQPlMXysHJNBAV8pH2nNBgBxA=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mYwnG-0006vO-Cj; Fri, 08 Oct 2021 22:48:38 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH 1/4] parisc: disable preemption during local tlb flush
Date:   Fri,  8 Oct 2021 22:48:23 +0200
Message-Id: <20211008204825.6229-2-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008204825.6229-1-svens@stackframe.org>
References: <20211008204825.6229-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

flush_cache_mm() fetches %sr3 via mtsp(3). If it matches mm->context,
it flushes caches and the TLB. However, the TLB is cpu-local, so if the
code gets preempted shortly after the mtsp(), and later resumed on another
CPU, the wrong TLB is flushed.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/cache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 39e02227e231..90656c49bc07 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -558,6 +558,7 @@ void flush_cache_mm(struct mm_struct *mm)
 		return;
 	}
 
+	preempt_disable();
 	if (mm->context == mfsp(3)) {
 		for (vma = mm->mmap; vma; vma = vma->vm_next) {
 			flush_user_dcache_range_asm(vma->vm_start, vma->vm_end);
@@ -565,8 +566,10 @@ void flush_cache_mm(struct mm_struct *mm)
 				flush_user_icache_range_asm(vma->vm_start, vma->vm_end);
 			flush_tlb_range(vma, vma->vm_start, vma->vm_end);
 		}
+		preempt_enable();
 		return;
 	}
+	preempt_enable();
 
 	pgd = mm->pgd;
 	for (vma = mm->mmap; vma; vma = vma->vm_next) {
-- 
2.33.0

