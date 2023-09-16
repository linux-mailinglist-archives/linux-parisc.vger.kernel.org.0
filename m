Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDA87A30B5
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Sep 2023 15:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236550AbjIPNu6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Sep 2023 09:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234156AbjIPNug (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Sep 2023 09:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7F68C1A5
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694872184;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=V5Ps3a4lJ+EI3U+7BofjCe0p/UZQX+zLEOiygSYpzvo=;
        b=IgXEWdLTtuaijcbbtbY7YhoAAQCTiLALNcWH+wCQYipk1wCB117ITZdooq1DHmvx2tKLzd
        R7VQd9StJhszXryNSX4ip5dDb7UZnMqmvEmYn8TwXaq5XhHdOjxFHBcHCwZ7Jzd3wPzzSH
        zDoHacjrqDKdLI+2G0Z4+tHwK85cX0U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-D1xesqKoMZSNQ706M3z0Pg-1; Sat, 16 Sep 2023 09:49:42 -0400
X-MC-Unique: D1xesqKoMZSNQ706M3z0Pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79D00101A529;
        Sat, 16 Sep 2023 13:49:42 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BCFA28FE;
        Sat, 16 Sep 2023 13:49:42 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
        id 4249730C1C0A; Sat, 16 Sep 2023 13:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 3E2EA3FB77;
        Sat, 16 Sep 2023 15:49:42 +0200 (CEST)
Date:   Sat, 16 Sep 2023 15:49:42 +0200 (CEST)
From:   Mikulas Patocka <mpatocka@redhat.com>
To:     Richard Henderson <richard.henderson@linaro.org>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>
cc:     qemu-devel@nongnu.org, linux-parisc@vger.kernel.org
Subject: [PATCH] target/hppa: clear the PSW 'N' bit when delivering signals
Message-ID: <f69ce25f-733d-7931-e59c-e3f1279b965a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

qemu-hppa may crash when delivering a signal. It can be demonstrated with 
this program. Compile the program with "hppa-linux-gnu-gcc -O2 signal.c" 
and run it with "qemu-hppa -one-insn-per-tb a.out". It reports that the 
address of the flag is 0xb4 and it crashes when attempting to touch it.

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <signal.h>

sig_atomic_t flag;

void sig(int n)
{
	printf("&flag: %p\n", &flag);
	flag = 1;
}

int main(void)
{
	struct sigaction sa;
	struct itimerval it;

	sa.sa_handler = sig;
	sigemptyset(&sa.sa_mask);
	sa.sa_flags = SA_RESTART;
	if (sigaction(SIGALRM, &sa, NULL)) perror("sigaction"), exit(1);

	it.it_interval.tv_sec = 0;
	it.it_interval.tv_usec = 100;
	it.it_value.tv_sec = it.it_interval.tv_sec;
	it.it_value.tv_usec = it.it_interval.tv_usec;

	if (setitimer(ITIMER_REAL, &it, NULL)) perror("setitimer"), exit(1);

	while (1) {
	}
}

The reason for the crash is that the signal handling routine doesn't clear 
the 'N' flag in the PSW. If the signal interrupts a thread when the 'N' 
flag is set, the flag remains set at the beginning of the signal handler 
and the first instruction of the signal handler is skipped.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 linux-user/hppa/signal.c |    1 +
 1 file changed, 1 insertion(+)

Index: qemu/linux-user/hppa/signal.c
===================================================================
--- qemu.orig/linux-user/hppa/signal.c
+++ qemu/linux-user/hppa/signal.c
@@ -159,6 +159,7 @@ void setup_rt_frame(int sig, struct targ
     }
     env->iaoq_f = haddr;
     env->iaoq_b = haddr + 4;
+    env->psw_n = 0;
     return;
 
  give_sigsegv:

