Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55391538306
	for <lists+linux-parisc@lfdr.de>; Mon, 30 May 2022 16:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240159AbiE3O3g (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 30 May 2022 10:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242014AbiE3O1U (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 30 May 2022 10:27:20 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120678FFAB
        for <linux-parisc@vger.kernel.org>; Mon, 30 May 2022 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1653918670;
        bh=jfEaLxYqUDDV4VkM7c1+xtbsNovQ009YqPttUtsEnpA=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=HRiPZVQt/ik99NhwABxaA9zndjRmuYjMqlB4MfGznn7BHE2A/69i6nkmlcQxhwTSx
         czaR0VKv00Ya+i9LVN65Ca740CSGDUOe3iuX4XKuypYf0+0SjTjm+UOgO4PFWo5ctd
         RRv7MtuY8PpK+oM/2KnmyV96Qic8utp3P/ubF9qs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.163.222]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ycr-1nygbN0DWN-0036vA; Mon, 30
 May 2022 15:51:10 +0200
Date:   Mon, 30 May 2022 15:51:08 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Drop __ARCH_WANT_OLD_READDIR and
 __ARCH_WANT_SYS_OLDUMOUNT
Message-ID: <YpTLzAuADYsIb4jZ@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:1Fqo9dO1gEGscAUEmgE9pcgmJQCpzhXLWKgY2zaqAET20TkKFAe
 kb7VHffOdq8P0omfiuPEj3zA+yfLHKNGPz6LZsbQduAmACHCLk1F34mXkS41NyoiCXyvFQL
 MzrGOpIIUVeV2EJEyJsOK54iD6R7MYJyZmsPHkWpEPxiAiZ2oGoY/5rnkRmRDnBIWwPkQtv
 JHCe0Hp4WNC2S74lwr/mQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NtvMfPUBFzo=:FDP39shWO5BjVDFkLjy1pi
 cxH5cm5Nu1b9/lVzJn71pV9t/01hoP6rpAzo8daCdroT7+FGucqy4zrIJonuIfe5SSj4btXGb
 p/71OWLKXsQjnZVAbQ9O79XJL0aF5ZVyLthgVY79oeva87f/EgNRDo4ftEGUthjlLy+zYlgrw
 C8YKxOtKFDSJ9hIFgOCuW4LbIkmCThbJ0IhqoVAzMKvFeQ9pD+AiboVywlJQJLRU3YxcsGjam
 8AlU605vhQU7ek8sIKLiCDjFti7rD6uvPpP+9ZA4IxnAn5wAhxPRDMh4XQs/3uEH9KYocteLQ
 Gd3JZyXi9ZXFj2chhyuqPMWzEKr6VgAheOiOm6fV/z+N/9jybSF0bzLGAihJHsQLMucfVNKih
 qbrCCMOviWFNVHrFFll4JKUE9qauM/GTzlL5Dpco2gR3nb4JmKRyPdG+ou4zSTpYyaV5pHNG6
 hbfGRzDSV+nOBKA1+/tbvxUsC0Dj0SFdEcVmpm7yfTHhHbrzj6t4/qVNO7xA2zxDVh50QHTUM
 RYXllZ8beUfAwrqoJC7RqVgWtTX6/7V4+dO10tAKfHy63tD6GG1YSBlDRA9st8xje9ixvZUWZ
 ftxZTz2KbYy2gEIQptKfKVVkl2Q/GPOqx/jxmGmtciPATZA7uGaU7I6bACk4rH0fqln38ZEFN
 zzdpKMYwNIuSiornKnhYMf54I6n/fJR1ytLA5YiURH+cUFZeAzGNgtexWDKuw/5fZ4QnQn8SM
 xqypBC844faWXQdkEX7Hq953fCReR8Dxl1U9Ytcl1+Gf96xV1d2IzSOPPJNJ+2nrgA4cCKYUw
 QCQojlU03EMmpbTMRWuvQ+IPAAynN878rmlx5FJTASapCa5ocu0Y2DvZGBGLfK06tMmaXlNDR
 SJeQOKuLErBOpElCuRIXmWrdLymA737R8929OmyHXZdn9ni6WthYO5aykG8AU05Gf7Yn5Kn0w
 d96XmbWAXl9P1HSTZlSy+7QKLXM6ndXGrTY99cy5qQV3SSGjXa7YyXvoTSbQJ3Qpe/+HVCAgX
 9qy4aNwtZNoJCu7rFnapG25n75xAs179B9MD7sif05+gn5Cg3Sva1f2q7g7CK5Sp07JNLQ2NO
 af3YcD8JWuybYIG6Vkx0D22BVAGrQ+8bhGblDbWX7qCYX01tDc2iIaTXA==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Those old syscalls aren't exported via our syscall table, so just drop
them.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/un=
istd.h
index 7708a5806f09..c033e427838f 100644
=2D-- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -142,7 +142,6 @@ type name(type1 arg1, type2 arg2, type3 arg3, type4 ar=
g4, type5 arg5)	\
 }

 #define __ARCH_WANT_NEW_STAT
-#define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_STAT64
 #define __ARCH_WANT_SYS_ALARM
 #define __ARCH_WANT_SYS_GETHOSTNAME
@@ -156,7 +155,6 @@ type name(type1 arg1, type2 arg2, type3 arg3, type4 ar=
g4, type5 arg5)	\
 #define __ARCH_WANT_SYS_FADVISE64
 #define __ARCH_WANT_SYS_GETPGRP
 #define __ARCH_WANT_SYS_NICE
-#define __ARCH_WANT_SYS_OLDUMOUNT
 #define __ARCH_WANT_SYS_SIGPENDING
 #define __ARCH_WANT_SYS_SIGPROCMASK
 #define __ARCH_WANT_SYS_FORK
