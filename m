Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABE520FE32
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jun 2020 22:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgF3UwM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 30 Jun 2020 16:52:12 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40034 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725845AbgF3UwL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 30 Jun 2020 16:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593550330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=dSLF2JUETXiqlgMgrNmE+7rrHD1HC1gVnVSET6GUPpA=;
        b=LS/+/2KX5cLeugO6yTK+K3O1HbdfT8ndGkPfEDi8f9Ze178BOjWjAlsjDiDxuFyNX78uLs
        /fsxdCL4nKdlc1aHP5Csw0G1Ag0qzfTJZ/hC8V4k/vmfc73WUXM6pMDwbG40ChwYQvlKUw
        tBcrS0JhEEc1a6+vLshjtJhk8oZCfMw=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-mUWVp022Nq2Nlz2vP_Bmsw-1; Tue, 30 Jun 2020 16:52:08 -0400
X-MC-Unique: mUWVp022Nq2Nlz2vP_Bmsw-1
Received: by mail-io1-f72.google.com with SMTP id l16so13908871ioc.15
        for <linux-parisc@vger.kernel.org>; Tue, 30 Jun 2020 13:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dSLF2JUETXiqlgMgrNmE+7rrHD1HC1gVnVSET6GUPpA=;
        b=hQAO7pj6jphjaFfEx32WvSYkX/SfSsXya5D5UCwf9anakm/4SrfQv2SMnYYZaAXRkK
         42Ohsu3dV8mD5UfwbfvaGz6U0ZLgFSm/+BTCxC+pqzD8Thn4gdg3XIEYH5zlebfjWLug
         UfyougFTolM/PQ3Pt5v/OAjItymzZyBrO/ykNFP3NA8pG4IJXeykkJUOTrXNSdZasQ/9
         rhq84yYSfV+1G+NO2TDRJHeXquqAb7IhI+t7Kp7xfWL/OqJR7TdbpHCB40H8rPEA1Jcm
         Thb8qQSzvNzGii/vK+fZRiCiMBPCOMieO9JgenEZ0c/HuBwuqdwYdvyf5YcvzH/KMCKK
         fY5w==
X-Gm-Message-State: AOAM531HriB9P3IBJnNmlB/DQdoB/UoKZH1WDT3UW+8MbjiTyyR/cbf3
        HKobK04TMKrUWTQaExyP9rUUOrLjeIuy4tmamqR35/o4mKJ7uXdDqT3LkeXkcm+4B4TqI5kjdfN
        N/XvTn6VQX7BSRa/Gu/bosEAC
X-Received: by 2002:a05:6638:118:: with SMTP id x24mr25757296jao.48.1593550323727;
        Tue, 30 Jun 2020 13:52:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvoEV2FUJkvA5qAwTsI4mdiDZPCkCjdD/AwbVYfXw8WHclHjXZP0TyZnfiU/sv0k2kSJZuSg==
X-Received: by 2002:aed:204e:: with SMTP id 72mr22146487qta.313.1593549942977;
        Tue, 30 Jun 2020 13:45:42 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id t5sm3840619qkh.46.2020.06.30.13.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:45:42 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: [PATCH v4 15/26] mm/parisc: Use general page fault accounting
Date:   Tue, 30 Jun 2020 16:45:40 -0400
Message-Id: <20200630204540.39197-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Use the general page fault accounting by passing regs into handle_mm_fault().
It naturally solve the issue of multiple page fault accounting when page fault
retry happened.

Add the missing PERF_COUNT_SW_PAGE_FAULTS perf events too.  Note, the other two
perf events (PERF_COUNT_SW_PAGE_FAULTS_[MAJ|MIN]) were done in handle_mm_fault().

CC: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
CC: Helge Deller <deller@gmx.de>
CC: linux-parisc@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/parisc/mm/fault.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index e32d06928c24..4bfe2da9fbe3 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -18,6 +18,7 @@
 #include <linux/extable.h>
 #include <linux/uaccess.h>
 #include <linux/hugetlb.h>
+#include <linux/perf_event.h>
 
 #include <asm/traps.h>
 
@@ -281,6 +282,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 	acc_type = parisc_acctyp(code, regs->iir);
 	if (acc_type & VM_WRITE)
 		flags |= FAULT_FLAG_WRITE;
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	mmap_read_lock(mm);
 	vma = find_vma_prev(mm, address, &prev_vma);
@@ -302,7 +304,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 	 * fault.
 	 */
 
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -323,10 +325,6 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 		BUG();
 	}
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR)
-			current->maj_flt++;
-		else
-			current->min_flt++;
 		if (fault & VM_FAULT_RETRY) {
 			/*
 			 * No need to mmap_read_unlock(mm) as we would
-- 
2.26.2

