Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1072920BC9D
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jun 2020 00:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgFZWg1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 26 Jun 2020 18:36:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57027 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726047AbgFZWg0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 26 Jun 2020 18:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593210984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eYfbH2Z9PmFD3YC1EEjF5e5lSljD0oX0ZInZG0GJcWM=;
        b=dF6jtPizPLR2dwLk1KXThJe53cbscuH3ouIM+FSi2V5U+ohT5eXLuczAm5dNZCRV852ojF
        waC9GB6pToUojut6eLnQlH+pS4VzlIqX02rLCdP5bPCzDdXV4ZD1ZbTpNDo7aPx2mHPVbI
        9ZVt7jYhgazxjQ4JRNZcbbzFEAsksko=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-iOKOIWlfMdaS9eaF8OhVmg-1; Fri, 26 Jun 2020 18:36:22 -0400
X-MC-Unique: iOKOIWlfMdaS9eaF8OhVmg-1
Received: by mail-qt1-f198.google.com with SMTP id b1so7561041qti.4
        for <linux-parisc@vger.kernel.org>; Fri, 26 Jun 2020 15:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eYfbH2Z9PmFD3YC1EEjF5e5lSljD0oX0ZInZG0GJcWM=;
        b=VGHsrYyoVL7MD4W9bWt4I+br5rP3QM5RvrTQ/8QpEiqbuHH2hwIcb74adG96q9npF7
         hjD7Tx2vdJoRUzs34Kv+ydnmnjckMYmNM6dhr14QJ/JgawzTHSLkX2TZCvD9lILW5QDw
         K4ZgWr9TzSaMsOiDobikK8o9LJ0NKlbVEXoqGN2c5UGuN1fmjQjX+Yti0yaam4VGNK6w
         4nQ6ytTfHSbibcZo9460g63CnmYzpItiD3VXGl3IoOajuurn4iDly/uhI+GftrHJQM5v
         3SESRibPfL459w3Nf26PaRyVYg7kklQW+3VOH62AkQzgDI4QMhp7vo4JEiQuAcEXKuE+
         6+rw==
X-Gm-Message-State: AOAM532aSMvxwBVFSDdZpL3LYlR9uLOf+s9+pNtF+iY9vMs/T+mq7z1v
        RQzy02PudDUYpb5Wwzv4Qk9Ja6RLmhe7b+TUa8C6Ivmji9kM0cz843hJAZD1uJtfkWL/q9CBmMF
        3MiZgserD3jwm75Poeeql/L4P
X-Received: by 2002:a05:6214:1543:: with SMTP id t3mr5519093qvw.89.1593210982454;
        Fri, 26 Jun 2020 15:36:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl3mgTYzAchfuJraPE8dLa9XFZmdj1PMxdhHvQ42A6yqkEgqYM5QwOpt7P688Ahd9QfaIH2g==
X-Received: by 2002:a05:6214:1543:: with SMTP id t3mr5519084qvw.89.1593210982236;
        Fri, 26 Jun 2020 15:36:22 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id j24sm7981634qkl.79.2020.06.26.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:36:21 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Peter Xu <peterx@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: [PATCH 15/26] mm/parisc: Use general page fault accounting
Date:   Fri, 26 Jun 2020 18:36:20 -0400
Message-Id: <20200626223620.199717-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
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
index c10908ea8803..65661e22678e 100644
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
 	down_read(&mm->mmap_sem);
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
 			 * No need to up_read(&mm->mmap_sem) as we would
-- 
2.26.2

