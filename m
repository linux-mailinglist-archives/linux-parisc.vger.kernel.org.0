Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B2D7A30B8
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Sep 2023 15:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbjIPNxG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Sep 2023 09:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238064AbjIPNxC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Sep 2023 09:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 126AFCD3
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 06:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694872333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=PSLOsgEUqRpjTujQXFcsj5rZc2BLHxE2J32IiRjwSSg=;
        b=Zb9Z8yQoFu1GTPQ74VkN5gmUm5IgSy2keWW0ZQSJIK7iN/903mQUiUfyvAkhGlp+bHstAW
        yDvtKhDV2KqCEc+vxnujzgW1ex/LIMVLNefsFLnixxLh7GdJJFiSukMiaxUhXnPPKPkkF1
        hv1g5byaUSVg9nMNk71I1+Q24990cWA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-DS4gxDwQPZ6ygPO4xTV_-w-1; Sat, 16 Sep 2023 09:52:11 -0400
X-MC-Unique: DS4gxDwQPZ6ygPO4xTV_-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C52C800883;
        Sat, 16 Sep 2023 13:52:10 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 854DE40C6EBF;
        Sat, 16 Sep 2023 13:52:10 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
        id 679F930C1C0A; Sat, 16 Sep 2023 13:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 649D03FB77;
        Sat, 16 Sep 2023 15:52:10 +0200 (CEST)
Date:   Sat, 16 Sep 2023 15:52:10 +0200 (CEST)
From:   Mikulas Patocka <mpatocka@redhat.com>
To:     Richard Henderson <richard.henderson@linaro.org>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>
cc:     qemu-devel@nongnu.org, linux-parisc@vger.kernel.org
Subject: [PATCH] target/hppa: lock both words of function descriptor
Message-ID: <87bd9251-5d6a-11f5-9a28-78224a776742@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The code in setup_rt_frame reads two words at haddr, but locks only one.
This patch fixes it to lock both.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 linux-user/hppa/signal.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

Index: qemu/linux-user/hppa/signal.c
===================================================================
--- qemu.orig/linux-user/hppa/signal.c
+++ qemu/linux-user/hppa/signal.c
@@ -149,12 +149,11 @@ void setup_rt_frame(int sig, struct targ
         target_ulong *fdesc, dest;
 
         haddr &= -4;
-        if (!lock_user_struct(VERIFY_READ, fdesc, haddr, 1)) {
+        if (!(fdesc = lock_user(VERIFY_READ, haddr, 2 * sizeof(target_ulong), 1)))
             goto give_sigsegv;
-        }
         __get_user(dest, fdesc);
         __get_user(env->gr[19], fdesc + 1);
-        unlock_user_struct(fdesc, haddr, 1);
+        unlock_user(fdesc, haddr, 0);
         haddr = dest;
     }
     env->iaoq_f = haddr;

