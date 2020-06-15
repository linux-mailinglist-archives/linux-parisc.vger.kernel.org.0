Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C781FA350
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Jun 2020 00:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgFOWQm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 15 Jun 2020 18:16:42 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23689 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726607AbgFOWQl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 Jun 2020 18:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592259399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RqJKKw8a1NKRln+8zArdPqt59N0jqlX/yu/HW/s9kC4=;
        b=RLUlysi/KLIyFM757BgJM53Q5bDKA8+90Yvf13v87FqQTRF0g0URn8h5J1usqIGUdjMVLz
        kCQ2zhk7k3hl9CmDyrkqMoXj6LlwwenkpFMpQVY+LL1RjvWwzPO6vQ8plqW9WZzztH0Bx5
        Qzivv+P+ilF13TCINXMWyEDJom6RPPw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-BZXG226YNCaiwNAknkZQkA-1; Mon, 15 Jun 2020 18:16:38 -0400
X-MC-Unique: BZXG226YNCaiwNAknkZQkA-1
Received: by mail-qt1-f200.google.com with SMTP id y5so15213172qtd.0
        for <linux-parisc@vger.kernel.org>; Mon, 15 Jun 2020 15:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RqJKKw8a1NKRln+8zArdPqt59N0jqlX/yu/HW/s9kC4=;
        b=SlvK45YBnRYakShfp7Enzv5jJ+0DE2K3zLnB/woYFaF5SuBTXj2AKe7l6hoWpS412N
         9eA1E0B9gO0pN3t1wsJZEg2Tlb/TIKX/QCuE+k5HS4SC+fUKy3FcjhJD5v/hemcGsXxp
         e1ScQ7hcRK6krU9WSihbAXsT/SKIVAQLrYXXJk8do+rsFIJZesrEARXKnSHAfPNRf7bx
         ecxmNEknAamLBQPFHEJTQgH7bhrzIEX5eWMvtrSLkXx6d6R4fmG3rlcYauJ/jl4Emf/v
         dcukkFfOxa1iSmLMFPKngtRs5zFsyNZb4f3EuSxtKppqfer4JtUQBKEe/kwb91zdDm4f
         xkiQ==
X-Gm-Message-State: AOAM533snaScl0NSDjWiX0HLxq2pWUTBHioAD6xIj1LODL9SwMzzkOO/
        WW1M2TFCxm4l8LofUBIWRVbvJ0R2v37GZqxZlH9964P5mGzbGcGtWLScOt4FV7gY9iNyaJWuKqi
        wVRI0q21YjBptrLFBc8qvxR9x
X-Received: by 2002:ac8:2b98:: with SMTP id m24mr18160583qtm.7.1592259397575;
        Mon, 15 Jun 2020 15:16:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym0dTv1jCtl4PPadaK3FtEqrEEdDfUimjvunbZFPifhmsxPtnWv/2yi5DBIOU+dU1tzU/YzA==
X-Received: by 2002:ac8:2b98:: with SMTP id m24mr18160561qtm.7.1592259397379;
        Mon, 15 Jun 2020 15:16:37 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id w13sm12351509qkb.91.2020.06.15.15.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:16:36 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: [PATCH 16/25] mm/parisc: Use mm_fault_accounting()
Date:   Mon, 15 Jun 2020 18:15:58 -0400
Message-Id: <20200615221607.7764-17-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Use the new mm_fault_accounting() helper for page fault accounting.

Avoid doing page fault accounting multiple times if the page fault is retried.
Also, the perf events for page faults will be accounted too when the config has
CONFIG_PERF_EVENTS defined.

CC: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
CC: Helge Deller <deller@gmx.de>
CC: linux-parisc@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/parisc/mm/fault.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 86e8c848f3d7..eab1ee8d18c6 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -263,7 +263,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 	struct task_struct *tsk;
 	struct mm_struct *mm;
 	unsigned long acc_type;
-	vm_fault_t fault = 0;
+	vm_fault_t fault = 0, major = 0;
 	unsigned int flags;
 
 	if (faulthandler_disabled())
@@ -303,6 +303,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 	 */
 
 	fault = handle_mm_fault(vma, address, flags);
+	major |= fault & VM_FAULT_MAJOR;
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -323,10 +324,6 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 		BUG();
 	}
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR)
-			current->maj_flt++;
-		else
-			current->min_flt++;
 		if (fault & VM_FAULT_RETRY) {
 			/*
 			 * No need to up_read(&mm->mmap_sem) as we would
@@ -338,6 +335,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 		}
 	}
 	up_read(&mm->mmap_sem);
+	mm_fault_accounting(current, regs, address, major);
 	return;
 
 check_expansion:
-- 
2.26.2

