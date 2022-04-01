Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94454EF884
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Apr 2022 18:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236989AbiDAQ7P (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 1 Apr 2022 12:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240531AbiDAQ7P (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 1 Apr 2022 12:59:15 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC96A1385AD
        for <linux-parisc@vger.kernel.org>; Fri,  1 Apr 2022 09:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648832238;
        bh=4tTy/hXIiYSMwfPpOkR+agUAlpRz/ul3oFK8DVv3F+g=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=HztN/a+i3XT2G1YKDfoUBTdo3XCoLNMk1UOPxE/DCEvtbEB2SyqT93qVOEqITJYix
         n9kM68+8kp2is628atvg0ohzB/eN7uAthLf1Fw2aY6YSDriAxgwvUyYexcp+iP8S20
         t5h65+u0oJy6suS+sZsA73+EZUdHGFQVMgOfSGIo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.191.12]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DO3-1nb8zo3usn-003dmL; Fri, 01
 Apr 2022 18:57:17 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Update 32- and 64-bit defconfigs
Date:   Fri,  1 Apr 2022 18:57:17 +0200
Message-Id: <20220401165717.202265-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KF9RVvaJ8CfeZ3ydZXiksJQfnLeQSnXHRtl6IgSAJP9DWxR32Rw
 SgZdQbfj2QNGlp6qKAVHFX35ducvucNnjxUkkqdboemEt0opJM7f3Rn+MxIk26GL8gDS2n6
 PFD3lx6D8RQvAo/Q8cW3fePsFNMuQ3hfsNbtWTjQBXAkmoanFn0z2owedo5O6uTRQGepSYZ
 f8bTeCTavlCbzUjQO14Pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XhI+8BVssNc=:GhtOVwE2cVzwXwsjzwSzOT
 a8I51dzxv2fyYnyAmTMcY1Z8/hH/70kxkdFXRHn1ERil719d47jqSzMIAxZJfJQ5I6a7F3K+i
 AdkXRB6RvEQXteuqctNuD5zN/GKclxvkA2vLwlcfcqxWW6xhYCITtIZNKc7I0nUv6+LsmVFd3
 ldx8uv/n0oY0/qqGbnkKCOAqDqKVPaVv1oJbpDEMtnOp4geSqoy6x3or5GT73JnaXasMdenog
 cquB8r0n/YvEE/H3PB3JwQVk7t9LXy22+ink5i0DEGLMY34Lg8XQk86q9c2Qu8Fw5c8z3HY4d
 SXQm/0o9B4BLhSbaQ+MwcqRHFj0ffScjP0+NNW/zLQL3JYw+hJQKSKImoYmHRKlH5+gr32NBW
 ku7DzHvLZAOxaYRwkL3K3ydJOKfiara6qJo274qG1z2HJorntTgnZimv27GpPy5kx32zkQjVl
 GQrjmOrL1bnNzhAQndXPW4ZNEgziKgd6O6PvsBI8KagoyVIIhh1vrJM7IzS6cwhK6IUaim6ui
 LE1wSAm7tNzgtMp8TMuuaWoBSrzxl+4QfWlo8a2/J0PZ0HuroY9fXsApAXkS0AI+pUy3c10M1
 z2rfJS2QhOyBJgGnBoLaPF3nJYB0f9seb1+sPZFmMY+a4f7r3b2C/dzEoZ1EP1TXL2d9k+zyf
 ogII9/V9ybcvrrzFHVDlNavRzL3bg7alGMDsih1bl7bJHZOxNLBeQdaL7kp/Uad/D16dQPYj3
 /oQiBc5/dFUq8FSAGagiazNFuRfHtdZz03oPa+LtcAicoNSJbSMonB1e3tN0oTA12RkaeI+SR
 26QYyXMmUczgbj0RInbZNpcxdNFrQ719iaKZ4Tqp7LkFeo4lyn3F16dtl9B78WA7/736fo39W
 yx0Q+R7SY4nxK0+YRxYsf5uO8/isVxUVBy9p6YcK3c5qhPaBNZzuZk9AmzT2vIc1KWSYb89u8
 0L6wY4+7C0d7opFY4bJ/vdSuFHinK5/C6iPWpDEtiVfK6XN5yXWPu0neS+kj02mpBmqyyiqqy
 36/mWyzG5KzSi5VtxkHbqOk+796Pj22YfRUV3wzhvIucUWFPgUKQ4YBT2nIUS2WtfBAolEzvi
 NU2RD2kolckhTg=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Enable CONFIG_CGROUPS=3Dy on 32-bit defconfig for systemd-support, and
enable CONFIG_NAMESPACES and CONFIG_USER_NS.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/configs/generic-32bit_defconfig | 4 +++-
 arch/parisc/configs/generic-64bit_defconfig | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/con=
figs/generic-32bit_defconfig
index a5fee10d76ee..8ce0ae370680 100644
=2D-- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -6,6 +6,9 @@ CONFIG_BSD_PROCESS_ACCT=3Dy
 CONFIG_IKCONFIG=3Dy
 CONFIG_IKCONFIG_PROC=3Dy
 CONFIG_LOG_BUF_SHIFT=3D16
+CONFIG_CGROUPS=3Dy
+CONFIG_NAMESPACES=3Dy
+CONFIG_USER_NS=3Dy
 CONFIG_BLK_DEV_INITRD=3Dy
 CONFIG_EXPERT=3Dy
 CONFIG_PERF_EVENTS=3Dy
@@ -47,7 +50,6 @@ CONFIG_PARPORT=3Dy
 CONFIG_PARPORT_PC=3Dm
 CONFIG_PARPORT_1284=3Dy
 CONFIG_BLK_DEV_LOOP=3Dy
-CONFIG_BLK_DEV_CRYPTOLOOP=3Dy
 CONFIG_BLK_DEV_RAM=3Dy
 CONFIG_BLK_DEV_RAM_SIZE=3D6144
 CONFIG_BLK_DEV_SD=3Dy
diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/con=
figs/generic-64bit_defconfig
index 1b8fd80cbe7f..57501b0aed92 100644
=2D-- a/arch/parisc/configs/generic-64bit_defconfig
+++ b/arch/parisc/configs/generic-64bit_defconfig
@@ -16,6 +16,7 @@ CONFIG_CGROUPS=3Dy
 CONFIG_MEMCG=3Dy
 CONFIG_CGROUP_PIDS=3Dy
 CONFIG_CPUSETS=3Dy
+CONFIG_USER_NS=3Dy
 CONFIG_RELAY=3Dy
 CONFIG_BLK_DEV_INITRD=3Dy
 CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
@@ -267,9 +268,9 @@ CONFIG_CRYPTO_DEFLATE=3Dm
 CONFIG_CRC_CCITT=3Dm
 CONFIG_LIBCRC32C=3Dy
 CONFIG_PRINTK_TIME=3Dy
+CONFIG_DEBUG_KERNEL=3Dy
 CONFIG_STRIP_ASM_SYMS=3Dy
 CONFIG_MAGIC_SYSRQ=3Dy
 CONFIG_DEBUG_FS=3Dy
-CONFIG_DEBUG_KERNEL=3Dy
 CONFIG_DEBUG_STACKOVERFLOW=3Dy
 # CONFIG_SCHED_DEBUG is not set
=2D-
2.35.1

