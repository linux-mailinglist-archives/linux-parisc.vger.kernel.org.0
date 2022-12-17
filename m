Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAB864FC8A
	for <lists+linux-parisc@lfdr.de>; Sat, 17 Dec 2022 23:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiLQWEp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 17 Dec 2022 17:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLQWEn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 17 Dec 2022 17:04:43 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C37E010
        for <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1671314680; bh=lPhOkcviP5cIFEr/v7cW3NawV3oKdVOmZI/JsrKubSI=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=Pq7w4qkIkh/mkBeMrdtQArLO63cry8Ul2YoeZcMgXCDYp4mWSN+YkpvjKQYk4LiWn
         Wq03hbTZ0z62LXN/HiPcFfJd6hQzVpjoTh6nbJ3zb3M6Cf0I48b+PGO/QYz/w1ZweP
         zs8EVidqC+l5bgCXfMAwlseO0KHwQ5VKBQ/1PgVsXxNu+W/UF6FRBhDBfDQzP5TLMK
         0uiBDJQiXBRepMjzGgy8xNB7YLY07cHVSPtw3gvRA+Ok7EE6bDVtLqHSda3CC3EhHL
         KWoNflgD6OWNfDy4gc+biLl9S7VAeYNNjintEzn5iNIOdbNFT2pfVQwGCKgCvegiUT
         sHeXXmAd9WYZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.160.18]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mw9UE-1ooARH3vnQ-00s2a5 for
 <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 23:04:39 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 1/6] parisc: Drop PMD_SHIFT from calculation in pgtable.h
Date:   Sat, 17 Dec 2022 23:04:23 +0100
Message-Id: <20221217220428.383330-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8QRu3spDNW0+hHA6cvK2ZYBUErBk93cxPhyXYDb1UuBhzoR0+lS
 EXU5MrSzqxKDKNmPE9CV7zYGSTk/XcY22hURS8D8o6ysCU7N9uidvQaMkfgaay1rJ6OGV/7
 1oG3t+HBgeF3Ym9shqgABXmISyDyIKGJ4q3TEKq8dSelVua8j39dXe2yFS9NuJWwnUHdvoC
 xFh+csdYBDkeQhSWjgjXQ==
UI-OutboundReport: notjunk:1;M01:P0:bIpo4XhEDkI=;4x4guHmVcDFDnmdfa+N8fv5HiS9
 /0F2QXfTAYin3Gm/YWym30cKJg4b70lnbUYBoNkItCKfbcpH4D3oqFH6zZm3YlBL0wE1O7IJz
 +O9GFr2WYm6b59yqK8au9Q+iX1pkv08Ht1UduOt9fQmTXHxXdorwZkDfwancpJ2rgYnV16yCq
 wHUQSLJu5ULAx9jS+SS2U/sEbcVx8e5GhpHD2weBRFi9RvL+M/tUfpCXddNyR6bcTrOJdO41Q
 F5YHdYMsUBKPxh9HAB9Xv4NkMKrEsvKMJkDwtAgyKaZNZSdGaNlsupIPKeB7Xy5Tg51BylsCT
 XG99ifOseRCAcHknKtxB8mPXycBKXpsH5MbizQyjXLaGXddsaCXBzEokc/K7u7VIdZ4DL9Br3
 OLO4R8T/C6b+XC5gRPFlBSa+MEaSUUPk72qM2Jfdr3p9lLzimNlOpDbFwkPYM/bLAK6O4ZKxW
 hjwAfbHx+EEBahRaDAZtdUymG+N8u9octMJ5VIuAWbj9XXpvFy7YaRjtBvq0fcwiY0bdD7SgO
 2VjA/FemCyW3NGvWHq9IrK6CMuUyshkz1l0OuCR2DU5k5V01TLP16o3mBYOUiO9K7LG2jUj8T
 3/9r2xwpeIaGekPEORLmQMrS6qCPdMVCbK3iePK6aThvrR7fMPXaULc3s/vKqKhUZrp2e5FCO
 jvLvq2YtaMNA8FP6E9SpjCl0SZbu0mTEDrzrABM0Ee5exlz0aJrIldMJHghPeBY2d+HWpNN8a
 SyvGwKFcZ1Sc8kCenZYrmQqnFFpQgR9Y81VHVME2BvQz+A5T/b9GKlKMFFMJiaDjKuVSglaHS
 rx5D3fSTzY1IqsZE35LsZDiigPmTwBSHfO35iaCE+pOyBIgJ3clPNbHYUam9J2dadfN0jvPfu
 1HosrqkPM3tisVl+PkgQufmhHT/QheD8cYQDF6OA/KKUnYswHLab0mOA5K3OLkFvx+XpK/FUU
 g50wRj7Roe/Gnh34Y0kOQfmbfx0=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

PMD_SHIFT isn't defined if CONFIG_PGTABLE_LEVELS =3D=3D 3, and as
such the kernel test robot found this warning:

 In file included from include/linux/pgtable.h:6,
                  from arch/parisc/kernel/head.S:23:
 arch/parisc/include/asm/pgtable.h:169:32: warning: "PMD_SHIFT" is not def=
ined, evaluates to 0 [-Wundef]
     169 | #if (KERNEL_INITIAL_ORDER) >=3D (PMD_SHIFT)

Avoid the warning by using PLD_SHIFT and BITS_PER_PTE.

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: kernel test robot <lkp@intel.com>
=2D--
 arch/parisc/include/asm/pgtable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/p=
gtable.h
index ecd028854469..68ae77069d23 100644
=2D-- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -166,8 +166,8 @@ extern void __update_cache(pte_t pte);

 /* This calculates the number of initial pages we need for the initial
  * page tables */
-#if (KERNEL_INITIAL_ORDER) >=3D (PMD_SHIFT)
-# define PT_INITIAL	(1 << (KERNEL_INITIAL_ORDER - PMD_SHIFT))
+#if (KERNEL_INITIAL_ORDER) >=3D (PLD_SHIFT + BITS_PER_PTE)
+# define PT_INITIAL	(1 << (KERNEL_INITIAL_ORDER - PLD_SHIFT - BITS_PER_PT=
E))
 #else
 # define PT_INITIAL	(1)  /* all initial PTEs fit into one page */
 #endif
=2D-
2.38.1

