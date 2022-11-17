Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A869462E5D8
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Nov 2022 21:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240221AbiKQU3v (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Nov 2022 15:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiKQU3k (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Nov 2022 15:29:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEDA10BD;
        Thu, 17 Nov 2022 12:29:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EAEAAB821F8;
        Thu, 17 Nov 2022 20:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399D6C433D7;
        Thu, 17 Nov 2022 20:29:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="J2Rh2Qpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1668716972;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GUOLjwe2IeIpzWXOEF9lexW8mdcNzGTdZsyQ38BdoPo=;
        b=J2Rh2Qpc9DsvsDbF+m2czgSGbM5Ll5MOXAjDPCXLD2nTdJklt5tqKU6J+WcFuhyR7iOVNl
        nDsxVygX1V70q8oW1CY5Wrtm40Q0MuJ2+I1BvJvChEmmgguswnlvUmIux/9qEWHnssUi4g
        R46w+6Rv/8yOdUKBYQWT9WWQFkQmiLk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 413bc89d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 17 Nov 2022 20:29:32 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-kernel@vger.kernel.org, patches@lists.linux.dev
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= 
        <christoph.boehmwalder@linbit.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Theodore Ts'o <tytso@mit.edu>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        "Darrick J . Wong" <djwong@kernel.org>,
        SeongJae Park <sj@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Helge Deller <deller@gmx.de>, netdev@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-block@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mmc@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: [PATCH v3 2/3] treewide: use get_random_u32_{above,below}() instead of manual loop
Date:   Thu, 17 Nov 2022 21:29:05 +0100
Message-Id: <20221117202906.2312482-3-Jason@zx2c4.com>
In-Reply-To: <20221117202906.2312482-1-Jason@zx2c4.com>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221117202906.2312482-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

These cases were done with this Coccinelle:

@@
expression E;
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (I > E);
+   I = get_random_u32_below(E + 1);

@@
expression E;
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (I >= E);
+   I = get_random_u32_below(E);

@@
expression E;
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (I < E);
+   I = get_random_u32_above(E - 1);

@@
expression E;
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (I <= E);
+   I = get_random_u32_above(E);

@@
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (!I);
+   I = get_random_u32_above(0);

@@
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (I == 0);
+   I = get_random_u32_above(0);

@@
expression E;
@@
- E + 1 + get_random_u32_below(U32_MAX - E)
+ get_random_u32_above(E)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 fs/ext4/mmp.c            | 8 +-------
 lib/test_fprobe.c        | 5 +----
 lib/test_kprobes.c       | 5 +----
 net/ipv6/output_core.c   | 8 +-------
 net/vmw_vsock/af_vsock.c | 3 +--
 5 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/fs/ext4/mmp.c b/fs/ext4/mmp.c
index 588cb09c5291..4681fff6665f 100644
--- a/fs/ext4/mmp.c
+++ b/fs/ext4/mmp.c
@@ -262,13 +262,7 @@ void ext4_stop_mmpd(struct ext4_sb_info *sbi)
  */
 static unsigned int mmp_new_seq(void)
 {
-	u32 new_seq;
-
-	do {
-		new_seq = get_random_u32();
-	} while (new_seq > EXT4_MMP_SEQ_MAX);
-
-	return new_seq;
+	return get_random_u32_below(EXT4_MMP_SEQ_MAX + 1);
 }
 
 /*
diff --git a/lib/test_fprobe.c b/lib/test_fprobe.c
index e0381b3ec410..1fb56cf5e5ce 100644
--- a/lib/test_fprobe.c
+++ b/lib/test_fprobe.c
@@ -144,10 +144,7 @@ static unsigned long get_ftrace_location(void *func)
 
 static int fprobe_test_init(struct kunit *test)
 {
-	do {
-		rand1 = get_random_u32();
-	} while (rand1 <= div_factor);
-
+	rand1 = get_random_u32_above(div_factor);
 	target = fprobe_selftest_target;
 	target2 = fprobe_selftest_target2;
 	target_ip = get_ftrace_location(target);
diff --git a/lib/test_kprobes.c b/lib/test_kprobes.c
index eeb1d728d974..1c95e5719802 100644
--- a/lib/test_kprobes.c
+++ b/lib/test_kprobes.c
@@ -339,10 +339,7 @@ static int kprobes_test_init(struct kunit *test)
 	stacktrace_target = kprobe_stacktrace_target;
 	internal_target = kprobe_stacktrace_internal_target;
 	stacktrace_driver = kprobe_stacktrace_driver;
-
-	do {
-		rand1 = get_random_u32();
-	} while (rand1 <= div_factor);
+	rand1 = get_random_u32_above(div_factor);
 	return 0;
 }
 
diff --git a/net/ipv6/output_core.c b/net/ipv6/output_core.c
index 2685c3f15e9d..b5205311f372 100644
--- a/net/ipv6/output_core.c
+++ b/net/ipv6/output_core.c
@@ -15,13 +15,7 @@ static u32 __ipv6_select_ident(struct net *net,
 			       const struct in6_addr *dst,
 			       const struct in6_addr *src)
 {
-	u32 id;
-
-	do {
-		id = get_random_u32();
-	} while (!id);
-
-	return id;
+	return get_random_u32_above(0);
 }
 
 /* This function exists only for tap drivers that must support broken
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index ff38c5a4d174..d593d5b6d4b1 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -626,8 +626,7 @@ static int __vsock_bind_connectible(struct vsock_sock *vsk,
 	struct sockaddr_vm new_addr;
 
 	if (!port)
-		port = LAST_RESERVED_PORT + 1 +
-			get_random_u32_below(U32_MAX - LAST_RESERVED_PORT);
+		port = get_random_u32_above(LAST_RESERVED_PORT);
 
 	vsock_addr_init(&new_addr, addr->svm_cid, addr->svm_port);
 
-- 
2.38.1

