Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263C27A3170
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Sep 2023 18:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjIPQdq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Sep 2023 12:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbjIPQdl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Sep 2023 12:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BB8E2CCF
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694881969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xIHfhbG9vrWXCteyDogmUAAdtPlvGL+scSsfu6RPhII=;
        b=Uo62GkBRibPsNkq7XKb7MIz/6Xxamd4lYi4ljMOPXetuNKhCETnfVAXZJAzRgUqU47Kg4n
        JJKBdIIdfo4vYjpxrJDfKnJZ9vf5H21QPgNyYeDK/xMPZ5OhqxZvOB2W/Biz7tjZ7ClBxm
        q5hHuTbymdG9OWTWE+kGxCZU4bdU83I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-Ch7xPuwEOPqseIIX3YoWyw-1; Sat, 16 Sep 2023 12:32:45 -0400
X-MC-Unique: Ch7xPuwEOPqseIIX3YoWyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84D468039C8;
        Sat, 16 Sep 2023 16:32:45 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6386C40C6EA8;
        Sat, 16 Sep 2023 16:32:45 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
        id 44A6130C1C0A; Sat, 16 Sep 2023 16:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 412633FB77;
        Sat, 16 Sep 2023 18:32:45 +0200 (CEST)
Date:   Sat, 16 Sep 2023 18:32:45 +0200 (CEST)
From:   Mikulas Patocka <mpatocka@redhat.com>
To:     Helge Deller <deller@gmx.de>
cc:     Richard Henderson <richard.henderson@linaro.org>,
        John David Anglin <dave.anglin@bell.net>,
        qemu-devel@nongnu.org, linux-parisc@vger.kernel.org
Subject: [PATCH v2] qemu-hppa: lock both words of function descriptor
In-Reply-To: <953ee56d-173a-aaf2-c7fc-34386f285340@gmx.de>
Message-ID: <e09db414-c3ca-9725-1d28-42811767e60@redhat.com>
References: <87bd9251-5d6a-11f5-9a28-78224a776742@redhat.com> <953ee56d-173a-aaf2-c7fc-34386f285340@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Sat, 16 Sep 2023, Helge Deller wrote:

> On 9/16/23 15:52, Mikulas Patocka wrote:
> > The code in setup_rt_frame reads two words at haddr, but locks only one.
> > This patch fixes it to lock both.
> >
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> >
> > ---
> >   linux-user/hppa/signal.c |    5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > Index: qemu/linux-user/hppa/signal.c
> > ===================================================================
> > --- qemu.orig/linux-user/hppa/signal.c
> > +++ qemu/linux-user/hppa/signal.c
> > @@ -149,12 +149,11 @@ void setup_rt_frame(int sig, struct targ
> >           target_ulong *fdesc, dest;
> >
> >           haddr &= -4;
> > -        if (!lock_user_struct(VERIFY_READ, fdesc, haddr, 1)) {
> > +        if (!(fdesc = lock_user(VERIFY_READ, haddr, 2 *
> > sizeof(target_ulong), 1)))
> >               goto give_sigsegv;
> > -        }
> 
> Patch is Ok, but I think the qemu coding style is to keep the { } braces, even
> if they are unnecessary (as in this case).
> 
> Acked-by: Helge Deller <deller@gmx.de>

OK, here I resend it:


From: Mikulas Patocka <mpatocka@redhat.com>

The code in setup_rt_frame reads two words at haddr, but locks only one.
This patch fixes it to lock both.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Acked-by: Helge Deller <deller@gmx.de>

---
 linux-user/hppa/signal.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: qemu/linux-user/hppa/signal.c
===================================================================
--- qemu.orig/linux-user/hppa/signal.c
+++ qemu/linux-user/hppa/signal.c
@@ -149,12 +149,12 @@ void setup_rt_frame(int sig, struct targ
         target_ulong *fdesc, dest;
 
         haddr &= -4;
-        if (!lock_user_struct(VERIFY_READ, fdesc, haddr, 1)) {
+        if (!(fdesc = lock_user(VERIFY_READ, haddr, 2 * sizeof(target_ulong), 1))) {
             goto give_sigsegv;
         }
         __get_user(dest, fdesc);
         __get_user(env->gr[19], fdesc + 1);
-        unlock_user_struct(fdesc, haddr, 1);
+        unlock_user(fdesc, haddr, 0);
         haddr = dest;
     }
     env->iaoq_f = haddr;

