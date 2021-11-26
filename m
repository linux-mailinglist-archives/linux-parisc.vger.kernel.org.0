Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2435045F115
	for <lists+linux-parisc@lfdr.de>; Fri, 26 Nov 2021 16:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350759AbhKZPzP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 26 Nov 2021 10:55:15 -0500
Received: from mout.gmx.net ([212.227.17.21]:37587 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1378304AbhKZPvY (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 26 Nov 2021 10:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637941678;
        bh=1F+85ST5X+Wl10SqBhKPZC0uz2QWcQZBBL1+GoTcjRs=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=NVxrTcoIwPeC4B8rYFmdIzy6sKB+vjk6G5o14nDZx6s6tHpRN1FrUXb4xwlqH5Xnz
         XT51KjN3c6Y7Mok3ct1VKo8IjXNhFevXf+RXCZxLLM+tFp2TW9MINhcnFARy2XW1ks
         FeBm3S1360OvAWva+uiDmVuuWCJBf9R5i8In+3Gg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.133.198]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUUm-1mGXTe1O5k-00pulR; Fri, 26
 Nov 2021 16:47:58 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] parisc/agp: Annotate parisc agp init functions with __init
Date:   Fri, 26 Nov 2021 16:47:54 +0100
Message-Id: <20211126154754.263487-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lIAMW6Ta2Tykv0hadPQ2X2ru8ThtUQQaRITGrWIjtZg9mMBRALw
 H7Z/9xy0w4UlfGbJxy8TPnH3Zl1uSt4jVdVybljFA/XhJ+zE1BHMvRR3laaV4NyAe7U5quf
 mKopmoMymwHnepPFa+4JzHGH4Fa9l7YUNrvEJgnA+7CF2wpN8kCfNfS1WbZON+HoPOTD2rH
 CrF+Qgt6QidTtTb1daUbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m9eLKWx96Ck=:jyWUH4KgbdeGd+ZIPcfqku
 VcGmzI8UOcyukZPGicuszB8aMfnPDG7lKxM+xw+1KzuoFe4v/8A54Bppl1ycb++JKY68T5KMT
 EaZ8IjJJM/R1R6ltXjnI4SV3rlT1eXhUxfcy0M3Ls3J8E7r6q+iJAwVTw4DXJQsto3dUNrWMC
 J/azSQow/5Qf2ZGAorXjsZxQcEPnxpPMOqfW6c1X8i2a1ifIgkpILXrbzx+NljyCc8o8BDh52
 o0rwJ0u5oWdyERn5SQZiHc/qfqK0mYwbRLhQ8b0y7+qKo/DT532Gs0KqAolWcGKXaCqezwr/f
 xW/zr8op/tkP8tgMXDNNxEacSyiUmv5KskExyJKc8+jGAfTgUjNTVN6+AWRc8i5o8BU93aeJ8
 N/T7Q8SAEysEalYZyBufiTpfPye17Cl4rLUm9eADTyfyZogvkki8OLJWSWsJqI+bRxuonxx9H
 vv0jSWS4m4c3wLPmfYBJv5KT0Y30xzHuAzxry+ZwEZw7R5NbYWhERFVISQi7GDQZQe6TeZ4Ob
 tDIG2bpJ1TjFtCaBe9zeRQowJWsmPU7SNkp4yj87pYPklUCuTheeDER176L21bOjJcK8ML40o
 0nvviiMYoZZ+EQvIkwLg0zfKaYqw17KcCiyKTAGIkc53JJXNMHzc81n0c2nm/EncEYfTkiQpJ
 qwjjd0sFuNt3R3hWLRYLNjfkm8Xlh9RKM9or+w4QUFuvfOr63F2+Z/qCMcHyd5GaPfqUAdcug
 L1LI4DSfzMGLkaPJBYVXoI06BQbKypisu+yjFsxhlbqxtDJwypuWtjFE2FJdP/84fCsnHBrJQ
 aY2YSxGyYd0N+qD8qNwGApHKQDY+chEzzCGs9H8eTQ5D/9H0oaakJLzSSuHKTPohgkwi+RSZh
 TDSdEBJz5FNiVuy7+4klaW3adaB50gcDG2uDNvj9fIkOPSXnCor9lHByrjbNkh1vJHlTwyGeF
 9qS/505QreZxgGztfX5LgkTJvQmCU3QfZcHWkpOJE987BgYhoTF+I7UHOkEPHXqzwDzNnMDvw
 KL++aSaIS0KJu38l+nRGlL+7EHlm8gUq9D4di2Dxx/n+Wz4Fw16DmZMtkRGWq3oHmVTUjImFo
 Vw5eRjynL2d/GY=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: kernel test robot <lkp@intel.com>
=2D--
 drivers/char/agp/parisc-agp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
index ed3c4c42fc23..d68d05d5d383 100644
=2D-- a/drivers/char/agp/parisc-agp.c
+++ b/drivers/char/agp/parisc-agp.c
@@ -281,7 +281,7 @@ agp_ioc_init(void __iomem *ioc_regs)
         return 0;
 }

-static int
+static int __init
 lba_find_capability(int cap)
 {
 	struct _parisc_agp_info *info =3D &parisc_agp_info;
@@ -366,7 +366,7 @@ parisc_agp_setup(void __iomem *ioc_hpa, void __iomem *=
lba_hpa)
 	return error;
 }

-static int
+static int __init
 find_quicksilver(struct device *dev, void *data)
 {
 	struct parisc_device **lba =3D data;
@@ -378,7 +378,7 @@ find_quicksilver(struct device *dev, void *data)
 	return 0;
 }

-static int
+static int __init
 parisc_agp_init(void)
 {
 	extern struct sba_device *sba_list;
=2D-
2.31.1

