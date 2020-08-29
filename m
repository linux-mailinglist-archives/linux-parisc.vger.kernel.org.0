Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E386256918
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Aug 2020 18:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgH2Qgn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Aug 2020 12:36:43 -0400
Received: from mout.gmx.net ([212.227.17.22]:50661 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgH2Qgk (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Aug 2020 12:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1598718994;
        bh=70N/kDxiZ26zyiI59bhpH+rl84NGTltTf5gUcVc9Rvg=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=YmHcw+S3B+xAwsF3z9sn3JKpvV3QZASDPO3JO9XGSG7H0iNzplVhNW8YwDjT2vEfM
         iM0xakij5EySzvjWnboKjHNa5k+Qqf+HdaDerxE4u2zDDoQev0spPOI9/L/DSMX2C8
         x7JM4qbbLoh5W/1OO7708zu1haCUhGsXeI8P7Uig=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.169.105]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bfq-1kfCPv3mko-0183Or; Sat, 29
 Aug 2020 18:36:33 +0200
Date:   Sat, 29 Aug 2020 18:36:31 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [RFC][PATCH] parisc: Drop parisc special case for __sighandler_t
Message-ID: <20200829163631.GA7483@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:H34qufhWAXa0HS3DJ/bbr05obDqmq62vz79HuCHchlTaf01w84f
 1BnUS+cJiqfQ4etRicH6dfM6twvm7fx4LdpWn13xXcKd3rLODUWpZc0gaBxEM/DujmU8lWl
 9fjnJOvsg39u4at9OrtfYwqfqC1De8vCaqdv6eftpV9h+jdkjn78yC45CcdJ+UxEExrF5lq
 5oFbXORwgT5AFJCCFXf2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uU7+yinSglc=:Z0FBia2OYeUdbV/tw3tF3l
 iAMpr+mGpg4DIMJxIvt3TEeMsZcO+VkD0/o5oaHbD9vRAC6y3SwjYT1iCXGEFrwkOXp/BpYQI
 DCPqS/UeTUGK/zbLD9uxzLYfkyTjvaQl0E+3wvJXNsxeIRyJTzDOcEWjgv3zIg0VbJGioq+61
 PeA8agcMJLPnn4d0yx7q+rm+SoJACmG1JURT/8eWRcCg6aGsM2YAaBjP7Issl8U/YLaLP/5/d
 W6F6ozOa35CV+/pfNMbWmM4l2S71cr0OCuy5hCLFFkdyd/qawFFt4ttLee8mxGW1pmiBLsf+N
 5RxEIPZfg0OPWyB6SEmPrG9GS4DQCiJpOnCzkmf+S0rMqCv8X+Q9M/Bwix7AhZxEPQlEIX3bl
 DmqXVPzqSXyhGJxDftwp/KzsiMjapoG+Pc1kWecEXKsU7Ezp+JE/aOcC+8LUq0kcGqLcESkJD
 ZHqQfHBJ7NxlfpiDNS2GlyP9J2BGjVwvHzCiTvv2XPE8VoSnBkNt0tJtC7wi44hN4fAKhMCEW
 L6xw8bHSDMkIBd8iFmj7YZkAf60XfowvU0x5zXQD7FnEUG/tUBYl1bSvzR4Ece/JPweMne+oY
 IqRpbfurlLVlcSu3lz3S8ozRc+usArrlpdRvjJg/vb3iGBp4hgTyNzw8MM4i0+SKSauz7+Q4Y
 raW52Vit1Et0rElv9WpyFIHbAJcmxIxj0WdACcUqkQrU/6hRM14XMWOu+Hx7j4GMEAsXCJDfd
 xX1tnHdfcXTqyZ91XrZZLgm/0PWWGMuPwQY42Inq/ePpVuuGr9mRGSD3GwbydZte5JGyt+xu/
 5IFGAyrl6HLMGaou/lpsdjn9B3w71Mp1Mst/MUlPvPZj+HC/p2vj0r5RE+Jb4dq0Axm2LAewx
 pzdUdEDi1G8tanYNt/JH91UEb5iIjRlkB46P+Y106LYZCth4QJ8MjA2sC9TDXsgqTGinvmMQb
 JdcieAFDceOGPb5J4YeteQvYh9uU+c7QH6OwQ9NMg0EkOK0R3Vg/JM74xDvCa8v+Z9zpmODeP
 I8TplvUFDxkq+VHZq70a6ZV7EsfU8SfdS20j4HKapoEBZRm8091Qa2DR5APk3Rb/ujZ6WQF2k
 A2fVHQtL1Efl9ccmU9c1YN7WANgoB1DRdTYF5J5PDi/2aj2FXnWSUfUTZvTWeIUDVEtv3/rOE
 nM9JOsK0WUlN12HfyCiafx7TlXw7+sR3LRhCWw0QFFT9e6mP3y7O4DfYsW0boIZME3XwENtRd
 o67nrtGbVDgshdA4g
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I believe we can and *should* drop this parisc-specific typedef for
__sighandler_t when compiling a 64-bit kernel. The reasons:

1. We don't have a 64-bit userspace yet, so nothing (on userspace side)
can break.

2. Inside the Linux kernel, this is only used in kernel/signal.c, in
function kernel_sigaction() where the signal handler is compared against
SIG_IGN.  SIG_IGN is defined as (__sighandler_t)1), so only the pointers
are compared.

3. Even when a 64-bit userspace gets added at some point, I think
__sighandler_t should be defined what it is: a function pointer struct.

I compiled kernel/signal.c with and without the patch, and the produced co=
de
is identical in both cases.

Opinions?
Do I miss something?
If we want to change it, we should do it before this patch gets applied:
https://patchwork.kernel.org/patch/11730893/

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/u=
api/asm/signal.h
index e605197b462c..d9c51769851a 100644
=2D-- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -85,16 +85,8 @@
 struct siginfo;

 /* Type of a signal handler.  */
-#if defined(__LP64__)
-/* function pointers on 64-bit parisc are pointers to little structs and =
the
- * compiler doesn't support code which changes or tests the address of
- * the function in the little struct.  This is really ugly -PB
- */
-typedef char __user *__sighandler_t;
-#else
 typedef void __signalfn_t(int);
 typedef __signalfn_t __user *__sighandler_t;
-#endif

 typedef struct sigaltstack {
 	void __user *ss_sp;
