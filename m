Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64924788F63
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Aug 2023 21:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjHYTvJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Aug 2023 15:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjHYTul (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Aug 2023 15:50:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5FB62685;
        Fri, 25 Aug 2023 12:50:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B52060B9A;
        Fri, 25 Aug 2023 19:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5D7C433C7;
        Fri, 25 Aug 2023 19:50:36 +0000 (UTC)
Date:   Fri, 25 Aug 2023 21:50:33 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Chanho Min <chanho.min@lge.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit
 kernels
Message-ID: <ZOkGCSNr0VN2VIJJ@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The gcc compiler translates on some architectures the 64-bit
__builtin_clzll() function to a call to the libgcc function
__clzdi2(), which should take a 64-bit parameter on 32- and 64-bit
platforms.

But in the current kernel code, the built-in __clzdi2() function is
defined to operate (wrongly) on 32-bit parameters if BITS_PER_LONG == 32,
thus the return values on 32-bit kernels are in the range from
[0..31] instead of the expected [0..63] range.

This patch fixes the in-kernel functions __clzdi2() and __ctzdi2() to
take a 64-bit parameter on 32-bit kernels as well, thus it makes the
functions identical for 32- and 64-bit kernels.

This bug went unnoticed since kernel 3.11 for over 10 years, and
here are some possible reasons for that:

a) Some architectures have assembly instructions to count the bits
   and which are used instead of calling __clzdi2(), e.g. on x86 the
   bsr instruction and on ppc cntlz is used. On such architectures
   the wrong __clzdi2() implementation isn't used and as such the
   bug has no effect and won't be noticed.

b) Some architectures link to libgcc.a, and the in-kernel weak
   functions get replaced by the correct 64-bit variants from libgcc.a.

c) __builtin_clzll() and __clzdi2() doesn't seem to be used in many
   places in the kernel, and most likely only in uncritical functions,
   e.g. when printing hex values via seq_put_hex_ll(). The wrong return
   value will still print the correct number, but just in a wrong formatting
   (e.g. with too many leading zeroes).

d) 32-bit kernels aren't used that much any longer, so they are less
   tested.

A trivial testcase to verify if the currently running 32-bit kernel
is affected by the bug is to look at the output of /proc/self/maps:

Here the kernel uses a correct implementation of __clzdi2():
root@debian:~# cat /proc/self/maps
00010000-00019000 r-xp 00000000 08:05 787324     /usr/bin/cat
00019000-0001a000 rwxp 00009000 08:05 787324     /usr/bin/cat
0001a000-0003b000 rwxp 00000000 00:00 0          [heap]
f7551000-f770d000 r-xp 00000000 08:05 794765     /usr/lib/hppa-linux-gnu/libc.so.6
...

and this kernel uses the broken implementation of __clzdi2():
root@debian:~# cat /proc/self/maps
0000000010000-0000000019000 r-xp 00000000 000000008:000000005 787324  /usr/bin/cat
0000000019000-000000001a000 rwxp 000000009000 000000008:000000005 787324  /usr/bin/cat
000000001a000-000000003b000 rwxp 00000000 00:00 0  [heap]
00000000f73d1000-00000000f758d000 r-xp 00000000 000000008:000000005 794765  /usr/lib/hppa-linux-gnu/libc.so.6
...

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: 4df87bb7b6a22 ("lib: add weak clz/ctz functions")
Cc: Chanho Min <chanho.min@lge.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: <stable@vger.kernel.org> # v3.11+

diff --git a/lib/clz_ctz.c b/lib/clz_ctz.c
index 0d3a686b5ba2..fb8c0c5c2bd2 100644
--- a/lib/clz_ctz.c
+++ b/lib/clz_ctz.c
@@ -28,36 +28,16 @@ int __weak __clzsi2(int val)
 }
 EXPORT_SYMBOL(__clzsi2);
 
-int __weak __clzdi2(long val);
-int __weak __ctzdi2(long val);
-#if BITS_PER_LONG == 32
-
-int __weak __clzdi2(long val)
+int __weak __clzdi2(u64 val);
+int __weak __clzdi2(u64 val)
 {
-	return 32 - fls((int)val);
+	return 64 - fls64(val);
 }
 EXPORT_SYMBOL(__clzdi2);
 
-int __weak __ctzdi2(long val)
+int __weak __ctzdi2(u64 val);
+int __weak __ctzdi2(u64 val)
 {
-	return __ffs((u32)val);
+	return __ffs64(val);
 }
 EXPORT_SYMBOL(__ctzdi2);
-
-#elif BITS_PER_LONG == 64
-
-int __weak __clzdi2(long val)
-{
-	return 64 - fls64((u64)val);
-}
-EXPORT_SYMBOL(__clzdi2);
-
-int __weak __ctzdi2(long val)
-{
-	return __ffs64((u64)val);
-}
-EXPORT_SYMBOL(__ctzdi2);
-
-#else
-#error BITS_PER_LONG not 32 or 64
-#endif
