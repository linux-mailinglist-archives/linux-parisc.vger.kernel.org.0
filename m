Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C57B59AEF3
	for <lists+linux-parisc@lfdr.de>; Sat, 20 Aug 2022 17:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiHTP7c (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 20 Aug 2022 11:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbiHTP7b (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 20 Aug 2022 11:59:31 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661693ED57
        for <linux-parisc@vger.kernel.org>; Sat, 20 Aug 2022 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1661011162;
        bh=wu9KwNGczkoJI0+tdf0YihWeT79JXh0hQFtHi8XlaB8=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=SKhWFEkprB6LlueBXGnneuzs7pcGK/rIH4Slv1SN8o1rihIA8so80M9JBnRViGn3z
         FypQMPCvzl/rkq0tdWIu7RG+XOM9ST0BGHKr1uUidfJ9FvIjObTxt2J7edC47HAb9I
         kd4D6bV9G7nLvk7Cty9btfyALSE1fcN5aKX9MXpU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.161.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwbp-1oaCWZ0Xm5-00BJj0; Sat, 20
 Aug 2022 17:59:22 +0200
Date:   Sat, 20 Aug 2022 17:59:17 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix unalignment handler for fldw and fstw
Message-ID: <YwEE1caP4rvzZvqQ@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:hksc3yB86bOkF0dISQ+a5PLEJCXAVd/pGEf+0DxDxzylvvmww8/
 IJRC8HSBJ2R2DePqzxOor6ef3t556mcw1jx0pEZGHVVOICY3czg03bzUej9QRg9q/OTdoMi
 JBJMfGj3X0jL3c0yTtufxg+9ARGEdKY5qgS0UvI30Sn04xgwjPMssBncC12SmgUNU1NbX6y
 Hzo+gqu45eucfNwrtIcyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zqiavG4nxN4=:Fg+csv2ky/yFKUzSCY4j84
 K1FpjDzrY8hM29rvsqLQAszTHFANYZocEulxviZe+y0/PnI5CQCzBf8iIwZPP9uf489NtGn6f
 bs5j8jSBhM5+41uUL1zN0ufnEfg7x/DSS+y2L5CEV+JbUxOGyl5+GtXuxjpFbgYxdFz/E9rsT
 WfiCwilq07chagptoSCh58JAax3HbyoitEiIpo5/aa/iuzyFdoqaZHhu5VQ1e51q2Ukcv2VOl
 I+PKqlpXWGLrjbcCLMOmFCiBZ7XxYD7G9IhLrlTnTbRbTCUH6LfoQL8L0ex5digrvL7sGPjxo
 IHmrqZqTJJtQoJnK+OKHHRo5bH+T8uGn5P8W8hrfyHctHUaINNIC94kZ8PLZrkDzfIwW+3epB
 zbL87EsJejGOhVhHFXQozRvKHcHc7M1ylewCXd643ysZL2Y2Gp7J3LNooGxID4KGzkD2vADKo
 y27HSsa4vg551OioHk/D8dO0/ix/rLW47PLJ6isXuz1H4ovw3y3aHJvGe4AyBmW88CuaQwWPS
 CaCHiaBn9FtiOVQrmU+aU7/4Os4mvYmXVR3pZWHgthROv4wTZ8myMr8leIuoAL/qEQ9lSuXCW
 1CmWn26YQf3qs4/zaJaaHeHEhgh/veYebq/hlrDWxHWJRb45yWl4uigVP6/I9iNq77JnkHHM+
 9oZ9mCggFKzIuf3lhnACLofSLK9L9cnrQKSJKKmCK2oJB+QJqyO2UzZnzAG0TvwRmAH7tKo42
 bFz2aL1x09XqGBrNzX1Q529WpkdrVWGIwasFvRUbVXnLzUffOqQDB+tfbv2pUM8CN058q7Id6
 ubph4Yz6h83vWnWd2nuerSh6R4ovcOatu5PS2MouYO2j1rKDHq6oD2+EZ1h3IQ+lsfTqAWZ1+
 GK40xR6SEek1rO5uiydA7ISgst+mDc2qzhobfQDKyM0LrFigJl5m93rPBBWdJ7oPrpXSZ/dQs
 wjDRtK31842LSpu6HapCj/rvSIpxafy/AJjQW594gdljPXc0Ybaxm3y32S/7KlGXp0Cu4iUM3
 PFzt9cebG5tmdHrFVk+QGWziWcBZftwUuiq2o/5DYmDJqoxNtTabwiIJguYcnZiLURNHt9ZmQ
 OKZYUyJbbfcQq1qt3J3OEiSBxjCl16X0yeCjsENcn4iuZD6kHocSHpThA==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This ugly bug has been since forever in the parisc kernel and I wonder
why it wasn't detected earlier. Interestingly I noticed this bug just
because the libime debian package failed to build on *native* hardware,
while it successfully built in qemu.

The instruction "fldw 0(addr),%fr22L" (and the other fldw/fstw
instructions) encode the target register (%fr22) in the rightmost 5
bits. The 7th rightmost bit defines if the left or right half of %fr22
should be used.

While processing unaligned address accesses, the FR3() define is used to
calculate the offset into the floating-point register set.  But the
calculation in FR3() was buggy, so that for example instead of %fr22,
register %fr12 [((22 * 2) & 0x1f) = 12] was used.

Correct the calculation in FR3() to get the correct FP register.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org>

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned.c
index bac581b5ecfc..e8a4d77cff53 100644
--- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -93,7 +93,7 @@
 #define R1(i) (((i)>>21)&0x1f)
 #define R2(i) (((i)>>16)&0x1f)
 #define R3(i) ((i)&0x1f)
-#define FR3(i) ((((i)<<1)&0x1f)|(((i)>>6)&1))
+#define FR3(i) ((((i)&0x1f)<<1)|(((i)>>6)&1))
 #define IM(i,n) (((i)>>1&((1<<(n-1))-1))|((i)&1?((0-1L)<<(n-1)):0))
 #define IM5_2(i) IM((i)>>16,5)
 #define IM5_3(i) IM((i),5)
