Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4955440404E
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Sep 2021 22:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235450AbhIHUuw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Sep 2021 16:50:52 -0400
Received: from mout.gmx.net ([212.227.15.19]:48303 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235437AbhIHUuw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Sep 2021 16:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631134179;
        bh=U+ZSvVRGB3AOmVtCt9rABCabZjmlLkOO+Z2vlRCcckM=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=C5axlmJdV1/GQg6Ez7YhC/Oj31DBMOt30YD3+/2GAuLZLFUAz0+GsUNuHs6EizzhM
         Y/ZyGnvhbz8iv4t+cqUc4aR1cI98fNITnF+0s1qlFb0UjEFYrzSoy8st2Ak1WGMU9b
         dKC8sB5OKDl5szI39KFsQrM1/U/CY5QvvaROBTZs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([80.187.121.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wuk-1mKnGI3YAu-005VUd; Wed, 08
 Sep 2021 22:49:39 +0200
Date:   Wed, 8 Sep 2021 22:48:00 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add missing FORCE prerequisite in Makefile
Message-ID: <YTkhgGcj0cJ8ax+j@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:ZWLNTVEHHQEMjQdOTI0dj9hTDK1CTVHO/ZVn05DD9x1n8nWrRPK
 PzSX5ygS4TGU3yf7iMbbWEmkCjk3PkwpoJnSEiKt2wPkowFJrqWymg8s7encsFrPwRfa3hF
 WMCGNkvnsHJc35qp573ECW2mLiILn0+hdpC9Ez4ijj3jk+6CFLTVQF9S6axFWBXacZIw7i1
 XnN+/4gSy1OUiDeKLfExg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3pCYVL/AlaA=:0Y7mLZFeRcAXJ7+/qWXNTw
 g039aM8Q/CPy2voWl14gtg2wWqeAjVrTsIMG8NMCPWAPmhwu8fuP8uv9bR2OP9aXe2KzMLGKA
 B8uKqgeSEULLy+/l1HubZlffK2Xr8ySmK26298XSzOZK171C+lQKiA4VWjcQfH1nj/Ioc0CgX
 kKR42zonYXQ/0OECkQNDe88jyuQcshoLxU6ZpFJBby+guBu1XAhUvz4TXdVGYXHF3dd4jKklL
 yFelEGnIWLV5nUWwrH2B9Z7Owx9hdQX/AbjUSYbMTDSC06d1RUua5T9oXU1RpeORLku5n/9N6
 MwcMatFKc/euRcJzxJGMKlSQB5K3AS/UG43Rw/n5hUtsjyIvEv601uJfb2bwZOsWRmxRsojQl
 8d4YCqhytdSRIaExvRmWNsgFARrB27o8626g388eYLZMMZt3LnOly2yBVXgovJL3br8+za3sQ
 KsY9u7ueRSGZVQrUwf0UFPE65GdK2PyKZJyUQ5O2I2NZ06j16RWwUtdn7dzh1UFAoZjMfafsV
 aAFmKCbH+KSzOzZvR4qiKX29JR3kowIogqh45ltoYH9EaQxWSYEyK5aCoUaxePbrrXcpS8lqe
 S5uJMUGjC3KGlnFD4sHmzavcxJRiWCWj9jJTJu7791FAooNgPrJPH88lgJhBlg+A/UJ1p7GQe
 TOFEYjY/4aDNizjiAraR76bf/Iq2pHGNLmvqRa35HAMUoTVIfofpLaIg4bWcTnQ/qWOOkoN2o
 YMl70G8kt3gPHmWHUyjVGZ428jqzsz05GUlwGKwWl5vcuK1Kz3kYS6xfz28lVOHrLpoTC8iq6
 lgx/I6vXT43KxGycWdDF18hkHnZYehhWyL+arLzFjzn8Y5d9SBYk51FJsWPMZnIeDIbIKL7My
 JIpxOBvRCCZxbRAcsEMPLixDvJtMp115SPkOg+aNxzGDGcP+HuFmvzZhNMOzSpL0ph5p0drtX
 fQ4CQl9KPpzI69OAqcCEOaTkuWQp3y93VuqlHY4fhx+dGL3mC6sX6I+w8fCAgouS+sexZXdHt
 rdrKCjKalhUWll3s0KXDNRIE7zT529u78wwiEV1l2D+I5YQnftdQBSiJVFDtzaTbBSeUqlLiD
 0ic6dxXfhThtoI=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compr=
essed/Makefile
index dff453687530..9fe54878167d 100644
=2D-- a/arch/parisc/boot/compressed/Makefile
+++ b/arch/parisc/boot/compressed/Makefile
@@ -26,7 +26,7 @@ endif
 OBJECTS +=3D $(obj)/head.o $(obj)/real2.o $(obj)/firmware.o $(obj)/misc.o=
 $(obj)/piggy.o

 LDFLAGS_vmlinux :=3D -X -e startup --as-needed -T
-$(obj)/vmlinux: $(obj)/vmlinux.lds $(OBJECTS) $(LIBGCC)
+$(obj)/vmlinux: $(obj)/vmlinux.lds $(OBJECTS) $(LIBGCC) FORCE
 	$(call if_changed,ld)

 sed-sizes :=3D -e 's/^\([0-9a-fA-F]*\) . \(__bss_start\|_end\|parisc_kern=
el_start\)$$/\#define SZ\2 0x\1/p'
@@ -34,7 +34,7 @@ sed-sizes :=3D -e 's/^\([0-9a-fA-F]*\) . \(__bss_start\|=
_end\|parisc_kernel_start\
 quiet_cmd_sizes =3D GEN $@
       cmd_sizes =3D $(NM) $< | sed -n $(sed-sizes) > $@

-$(obj)/sizes.h: vmlinux
+$(obj)/sizes.h: vmlinux FORCE
 	$(call if_changed,sizes)

 AFLAGS_head.o +=3D -I$(objtree)/$(obj) -DBOOTLOADER
@@ -70,19 +70,19 @@ suffix-$(CONFIG_KERNEL_LZMA)  :=3D lzma
 suffix-$(CONFIG_KERNEL_LZO)  :=3D lzo
 suffix-$(CONFIG_KERNEL_XZ)  :=3D xz

-$(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y)
+$(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,gzip)
-$(obj)/vmlinux.bin.bz2: $(vmlinux.bin.all-y)
+$(obj)/vmlinux.bin.bz2: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,bzip2)
-$(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y)
+$(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lz4)
-$(obj)/vmlinux.bin.lzma: $(vmlinux.bin.all-y)
+$(obj)/vmlinux.bin.lzma: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lzma)
-$(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y)
+$(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lzo)
-$(obj)/vmlinux.bin.xz: $(vmlinux.bin.all-y)
+$(obj)/vmlinux.bin.xz: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,xzkern)

 LDFLAGS_piggy.o :=3D -r --format binary --oformat $(LD_BFD) -T
-$(obj)/piggy.o: $(obj)/vmlinux.scr $(obj)/vmlinux.bin.$(suffix-y)
+$(obj)/piggy.o: $(obj)/vmlinux.scr $(obj)/vmlinux.bin.$(suffix-y) FORCE
 	$(call if_changed,ld)
