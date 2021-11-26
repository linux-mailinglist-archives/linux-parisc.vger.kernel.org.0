Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9BBD45F69D
	for <lists+linux-parisc@lfdr.de>; Fri, 26 Nov 2021 22:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241851AbhKZVpM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 26 Nov 2021 16:45:12 -0500
Received: from mout.gmx.net ([212.227.15.15]:60915 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243142AbhKZVnL (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 26 Nov 2021 16:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637962790;
        bh=zofstjjuY5bb5SU+8cjlvVWMzAKuIE7KGOJYUUd2mfA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=k1NBd2dHGxSpsj0F6EUusTd75gojS9t01NzJk2HmNMEwSLcnoDjzZdceIpgDRA2Dz
         Avaw0QLzHfd7VLSVVsGu7dEHOiCyvUPLUA2RcSSGfW4Jg4yJ9GX/S0mDSPlYmn7c/9
         1u6zm2T/yQsdUYzaBXOGjQV79FvVv4lnfoCy8W14=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.133.198]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdefD-1mHOGF0361-00ZjG6; Fri, 26
 Nov 2021 22:39:50 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Set correct KBUILD_IMAGE value for self-extracting kernel
Date:   Fri, 26 Nov 2021 22:39:45 +0100
Message-Id: <20211126213945.286053-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nszDtH/nBGZYCnMLmKFQa3BQTWYkX4x9oN0WmMKqVbhZLynnFjZ
 ahChjYOiJzi/lXZ1nC15VItjn3mUb9ILAqievNFZIWWPezL+6VJNlQmADYkZA8ojHPewT4g
 5Km/eooBaTUX+3IGFI2wQsRCmJJiGkH8FX++cQ2NS5TVPnombtJHBPgAwAv6CsMr5NhdBzl
 +Taf1zQrhaL0IVNmqOgSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8McaBZ9y6Q4=:PX69VIgUEbljE3KtnQaqHl
 2cbC8CctRmYlFFeJJSrf0O9PpF4ZR0J6DVjiZXS+TqtPvmdq0gdcGBOcC/0PiUKK/MRTZ61Lg
 UtN47nXPjzRQhe/k8pUV10JKvfckecIHcmV6VULZ4FjS/yEf3n9KPzmcAguafZjbj6PgDpdqJ
 A2U9gDUn3RLzIjzGx7gNBMvdEdbL8XbV+bVe36rgV5NTHU9gvidDLvQkE9JUvgdzTAVMEgzbN
 rHYugv8GgD42GmdI6PphD41LRYLzU4BhFHgBUZw6+dl5PQmYHf4TmBRZIL9Dr9MLqTDV+2lmK
 uCuHWy6NjWfDsj58znU8Kyurc85pL/fV/ZwAZ9YRkhbtCukBF/39l69kSOhwaUQHuxbsoh6Lw
 dqqxgNvdYxZf86ueZIy4JQZmwxAIoDsosT3lSwIjZVZ4HFcLIXs74iSnjTheOnjyySpOXXJ6d
 A5TdHK7jSZd8W5Td9oFPOncZIrJolvNYQ0+XZAMbPaiLKOHlOQqNRHcvgJtTdBqvxoy2aXyvh
 1ttR7HYhwkfwNKDj+ePJS3qOZ4g/5PYgNCqHfYbY3nXq5zr7Ly0Cv+6Wt/Y0CihqrKreMt6RA
 LlSIAEV4Cj0KlHtixKhPr4ZvuVILGARUd/Di8X7E7+AHg9bngHZzQNPhQUfsVsSMz8CAmnD64
 yLbadY8wwS69kr1p1kQ3hTRGBlZYZTXA5sc00RRrvF4U43QEiFAa4+HJSyw9ULffaJw5TqavN
 qYZKKeLWRCNZX0Xvt4uD7DkmeXI4nEMud2QLxaWJlnfP2TmCETyt9mIdB2KV4gO4bq8ceA+t4
 Q2ITFLZpfPu7Ls6VNsTHvYf6jpcblnGleYRjDQezzL2N+ug4XZkKbbAJ+7zzG+ytFXtzqxqeF
 9C6nCNzVcmE6phvhXU2o56XB6FVHTBAsoOHgxnRi9UL1mL+S1IUi4LV/JvbuhT5+sZ2YCGP7t
 PTB3ZKkdavrQxn/QYDsPysaQX0Zm2C+Ss8bmsOsAbCtdp2QL/82F9fnsXm5J+M9J/AvVsU4Tp
 tmYUOZKbR7nxOZ6sH2TbODyeD9lhHb6I4nVZks56P6/5+Oe1Jq7htj18i+JRStW0NLoFGVzvc
 uCbS9W4QkGL5+s=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Default KBUILD_IMAGE to $(boot)/bzImage if a self-extracting
(CONFIG_PARISC_SELF_EXTRACT=3Dy) kernel will be built.
This fixes the bindeb-pkg make target.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 8db4af4879d0..0b34f58d6fab 100644
=2D-- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -15,7 +15,10 @@
 # Mike Shaver, Helge Deller and Martin K. Petersen
 #

-KBUILD_IMAGE :=3D vmlinuz
+ifdef CONFIG_PARISC_SELF_EXTRACT
+boot :=3D arch/parisc/boot
+KBUILD_IMAGE :=3D $(boot)/bzImage
+endif

 NM		=3D sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+=3D -D__hppa__=3D1
=2D-
2.31.1

