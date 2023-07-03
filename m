Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D94C746399
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jul 2023 21:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbjGCT7r (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jul 2023 15:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjGCT7r (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jul 2023 15:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676ABE69
        for <linux-parisc@vger.kernel.org>; Mon,  3 Jul 2023 12:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688414340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=LoUauweNDt2UPReHWwhjgp3VsV7Mm+fSGj9PBNXZlgE=;
        b=QwXrd7RvGABOL7HxQlNy2FYC2ales6q7K7i9qZS5zXdnmE0D5iCQK8FRHzkA2aC4NnuuDG
        PHx0UhJaf2T+GuEXgq4dmaA3Pa+vEiGrn2de5j0RRv0ZqzpGx3P9KhO2EvHk6i2wKjUNv9
        fUN0DBJLmDyJ+5LSPCrggkZWU+zM6mY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-SiAgHKluOzClhvo0o0Tz-w-1; Mon, 03 Jul 2023 15:58:57 -0400
X-MC-Unique: SiAgHKluOzClhvo0o0Tz-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68CEB803FDC;
        Mon,  3 Jul 2023 19:58:56 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DE4340C2063;
        Mon,  3 Jul 2023 19:58:55 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
        id E807E3096A40; Mon,  3 Jul 2023 19:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id E32D83F7CF;
        Mon,  3 Jul 2023 21:58:41 +0200 (CEST)
Date:   Mon, 3 Jul 2023 21:58:41 +0200 (CEST)
From:   Mikulas Patocka <mpatocka@redhat.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
cc:     Vegard Nossum <vegard.nossum@oracle.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Frank Scheiner <frank.scheiner@web.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave@parisc-linux.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-parisc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH] parisc: fix inability to allocate stack pages on exec
Message-ID: <ccadf5d7-e22a-ab5b-21e8-18a788251845@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi

The patch 8d7071af8907 ("mm: always expand the stack with the mmap write 
lock held") breaks PA-RISC.

The breakage happens if we attempt to pass more arguments to execve than 
what fits into the initial stack page - we get -E2BIG in such a case.

The reason for the breakage is that the commit 8d7071af8907 adds the test 
"if (!(vma->vm_flags & VM_GROWSDOWN)) return -EFAULT;" to the function 
expand_downwards.

expand_downwards is called from get_arg_page to allocate initial stack 
pages. With the added test for VM_GROWSDOWN, it is not able to allocate 
any pages on PA-RISC at all, and execve fails as soon as it tries to 
allocate a stack page.

The bug can be fixed by dropping the test for VM_GROWSDOWN from 
expand_downwards.

Fixes: 8d7071af8907 ("mm: always expand the stack with the mmap write lock held")
Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v6.4

---
 mm/mmap.c |    3 ---
 1 file changed, 3 deletions(-)

Index: linux-6.4.1/mm/mmap.c
===================================================================
--- linux-6.4.1.orig/mm/mmap.c	2023-07-03 18:17:35.000000000 +0200
+++ linux-6.4.1/mm/mmap.c	2023-07-03 21:22:44.000000000 +0200
@@ -2036,9 +2036,6 @@ int expand_downwards(struct vm_area_stru
 	struct vm_area_struct *prev;
 	int error = 0;
 
-	if (!(vma->vm_flags & VM_GROWSDOWN))
-		return -EFAULT;
-
 	address &= PAGE_MASK;
 	if (address < mmap_min_addr || address < FIRST_USER_ADDRESS)
 		return -EPERM;

