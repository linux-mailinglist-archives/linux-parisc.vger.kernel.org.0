Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5297427CA4
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 20:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhJIS0r (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 14:26:47 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:45712 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhJIS0q (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 14:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kIblhylO3MT+beVqpvbhhAxsDJKP0zdf8VEC9dMv5gc=; b=HnDkdRODHuTKMHFmysA06sFW3Y
        KlxlHz+IkFuS0zCpVutBC3O9DCVWd+rJ1jORSoNzUoinKOyqgidyEuFfijSj8iKzpwQ/vwLW1AfTg
        V22Ksm598FzTg8OUp6gfHDLE0sgi+dVAhavOMKBvCRgfjoommQhcK8PkkA3K5TTZLFgo=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZH1c-0001dj-3k; Sat, 09 Oct 2021 20:24:48 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v2 1/5] parisc: disable preemption during local tlb flush
Date:   Sat,  9 Oct 2021 20:24:35 +0200
Message-Id: <20211009182439.30016-2-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009182439.30016-1-svens@stackframe.org>
References: <20211009182439.30016-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

flush_cache_mm() and flush_cache_range() fetch %sr3 via mfsp().
If it matches mm->context, they flush caches and the TLB. However,
the TLB is cpu-local, so if the code gets preempted shortly after
the mfsp(), and later resumed on another CPU, the wrong TLB is flushed.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/cache.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 39e02227e231..a1a7e2b0812f 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -558,6 +558,7 @@ void flush_cache_mm(struct mm_struct *mm)
 		return;
 	}
 
+	preempt_disable();
 	if (mm->context == mfsp(3)) {
 		for (vma = mm->mmap; vma; vma = vma->vm_next) {
 			flush_user_dcache_range_asm(vma->vm_start, vma->vm_end);
@@ -565,6 +566,7 @@ void flush_cache_mm(struct mm_struct *mm)
 				flush_user_icache_range_asm(vma->vm_start, vma->vm_end);
 			flush_tlb_range(vma, vma->vm_start, vma->vm_end);
 		}
+		preempt_enable();
 		return;
 	}
 
@@ -589,6 +591,7 @@ void flush_cache_mm(struct mm_struct *mm)
 			}
 		}
 	}
+	preempt_enable();
 }
 
 void flush_cache_range(struct vm_area_struct *vma,
@@ -605,11 +608,13 @@ void flush_cache_range(struct vm_area_struct *vma,
 		return;
 	}
 
+	preempt_disable();
 	if (vma->vm_mm->context == mfsp(3)) {
 		flush_user_dcache_range_asm(start, end);
 		if (vma->vm_flags & VM_EXEC)
 			flush_user_icache_range_asm(start, end);
 		flush_tlb_range(vma, start, end);
+		preempt_enable();
 		return;
 	}
 
@@ -629,6 +634,7 @@ void flush_cache_range(struct vm_area_struct *vma,
 			}
 		}
 	}
+	preempt_enable();
 }
 
 void
-- 
2.33.0

