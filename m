Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF4D4B3DCA
	for <lists+linux-parisc@lfdr.de>; Sun, 13 Feb 2022 22:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238447AbiBMVfD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 13 Feb 2022 16:35:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238446AbiBMVfC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 13 Feb 2022 16:35:02 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9D454184
        for <linux-parisc@vger.kernel.org>; Sun, 13 Feb 2022 13:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644788089;
        bh=VUhXbwT/8iAB6iiRSejThQV7aC9Xn8BvHyWAY1fD4oY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=LojfENVy24ThOfcO5XCImqZkIm8yFZ941VEVtXmWTPCH7rPedOEDlSVwopp8YPlt2
         1OxVVgaXs27e3r6vSg39YP12On7G4oIm/D4YieTzCNZUiffd+5z5iNpZS36sE55mwf
         YSuJ2qv1dCCZe8n/sHq1nShbcvSI2hT3L91LGEao=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.238]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1oOTmu3cUm-015LD1; Sun, 13
 Feb 2022 22:34:48 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] parisc: Show error if wrong 32/64-bit compiler is being used
Date:   Sun, 13 Feb 2022 22:34:41 +0100
Message-Id: <20220213213441.227700-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rjtRfd9o60PL/84dIJoooToazIBI7A+l25wKfhoMukzomITjA6I
 vqayT/4pEnTSkW418xxSXnt4YRLeVXF6u/oOgF8+1c4dJb5u+D4K4451IGDtInK4/7Oy+fx
 IixiElL3hq2Coqnv4yKxn7qkloZf/5OSek7MD1rHLaBZIhwD0SULDF16dl3n9sabI5Nzawx
 ceatWNjx9jd0/26z7XcUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jbbWT7Ql+3U=:W3ke1Y9k7vZ2ZRkMWhMeEb
 ix9BM6yUVs4WluRZoT6gJLJXINeVqfUiIsLYN1weOJUdkLox7LwWrHdfUA1J2peSoZJxJVb0a
 4Dlpqj/Lb42ts8qrUw+gOkV2msPinm7x5SmOaL+E67vKlpRxQYKFYigE87Qsq+KUGZCNak3gR
 ET4pCRQavCXOKcz0JWNu4h/DbRoRlLjQu422dQm2TfZGfec7dIBBQr40BHMc4UyqLBy26D+Rs
 afX/mdsjdsyRyvEn1vkx4aTDwaRVt981FBVon5mpSZcLnO0dK1OTgRpDbvu6QwE9Wbgf3R2HO
 EbcKAsio1wZGp8PaF3VNkNjc/JkKghlBM1iU5NWxch4pa8XRH5/0AFbcIND1Zfo7FFIuqF8D8
 J7P4aNhrgFfQVeCn3U9/xvY9rMBNGomipttISVXaXy06lwPWz99f9oBDW6n0kPfmHT7s2s131
 fG0rlYVPiNwwFZVkBXgXGImtlbWq+TxCS1Cik09bGBUVyr+nvnK6eUsVRBDo9qXIoA1zOVMUW
 F0UfrKLiURv8FR7nwukD5+ZYDxdJiEBWvcLnpm889aiScwdbQAyzBSQ8IkMVznrcJk0uWt6Jt
 ApNxZgD+01LLSY8tb4GcUBVx5SZjFyYJE/IV5mwH6/Bi/FIkMH4QHdH0C0yhA7ZE2VOckYrLv
 3mSTUZz/lFzm4haVhwtAeAWopWbivyIRJJXGART+e0orrY7Vk7hYxoVk3664EbNDfeSxUS1Ci
 YgE/DpkGp5SkW8tzKGWFpTQ1ynZaHmMgc/YjCzrfy7Op2eETXGN9nlU2VfuRi3NCJUqELiNRB
 opsEoSYdPggq0RJbNKupSbat3ujVO8qEh3Lj/v2C/NSnUCYZCymVAAFe4Dj6bnHtaxkPYh2qt
 bxzMlEENAM4aTDPO0Lc0XYpwWQ82rsg/KpMi6vTYH0QkQ/8UI/ktNyfkNqfVaiCB3bTprVBc4
 tf9nbJbI5y0Ye2kvkJlRYBb+Z07uYUOZTVdESZqgch3PnR/RoFk6DhKoUj3oNavK67QyM19dZ
 Sa0wIrZeivenjkGccmpBTfDqaZgcWvALaBg9PXJ6HdGQZWWEy4Er7tSl1L6PQEfkrY+xlul74
 CEXiWxMz6vz6yk=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

It happens quite often that people use the wrong compiler to build the
kernel:

make ARCH=3Dparisc   -> builds the 32-bit kernel
make ARCH=3Dparisc64 -> builds the 64-bit kernel

This patch adds a sanity check which errors out with an instruction how
use the correct ARCH=3D option.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/bitops.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/parisc/include/asm/bitops.h b/arch/parisc/include/asm/bi=
tops.h
index 0ec9cfc5131f..56ffd260c669 100644
=2D-- a/arch/parisc/include/asm/bitops.h
+++ b/arch/parisc/include/asm/bitops.h
@@ -12,6 +12,14 @@
 #include <asm/barrier.h>
 #include <linux/atomic.h>

+/* compiler build environment sanity checks: */
+#if !defined(CONFIG_64BIT) && defined(__LP64__)
+#error "Please use 'ARCH=3Dparisc' to build the 32-bit kernel."
+#endif
+#if defined(CONFIG_64BIT) && !defined(__LP64__)
+#error "Please use 'ARCH=3Dparisc64' to build the 64-bit kernel."
+#endif
+
 /* See http://marc.theaimsgroup.com/?t=3D108826637900003 for discussion
  * on use of volatile and __*_bit() (set/clear/change):
  *	*_bit() want use of volatile.
=2D-
2.34.1

