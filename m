Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5163ADA1E
	for <lists+linux-parisc@lfdr.de>; Mon,  9 Sep 2019 15:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730226AbfIINjP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 9 Sep 2019 09:39:15 -0400
Received: from mout.gmx.net ([212.227.15.18]:56447 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729267AbfIINjP (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 9 Sep 2019 09:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1568036341;
        bh=8HwLHDp7hSsMjrPYF/ooQNGT1HG8f6dznUtQ+1kaVBc=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=f+9BDtB9nyXl6jeuz9yqq16B0w5+Kk7sFQLPT0MLqxbeZyk9GddG3Tbs556EZV5vM
         H9kvVlY/JFLOe3GlM/qx1ATBce9poz+QlnlhZyKbUAMXJBLRRHipWsQtAB+UBBQQIH
         P7kTCPrIOrP2/4HrRWKCrOgHQGucbTfN+YhmK4RQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.164.25]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MgL1q-1hjaC31EXe-00NiVg; Mon, 09
 Sep 2019 15:39:01 +0200
Date:   Mon, 9 Sep 2019 15:38:56 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Fix vmap memory leak in ioremap()/iounmap()
Message-ID: <20190909133856.GA32746@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Provags-ID: V03:K1:7gsEoz+0mnQcns/E+5rEI5Q2VozwvaxOPuwmY14Yq3cfBTA9g+S
 oWd2gNYvUuIF+8s1c1nRo4BcYZTjSpaMeOajxUFD2bShDUxTUePu5kpxhIimkmb0s3TMXAR
 pxs4DxVzx7v0BAhHNV18TmpyA19x+diQkhAJqbxen1ZWjCVxeWOCvzcc8J6krXSYAwqqlZF
 Rgis7lK7LvmsQeLpLnzbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r4UjNMcftT4=:Q3EYVxEwlfTKUVtvI9Ob9M
 pQOohh8cEyMHDmxxja67IXdu/yzULdyn7w0a0vnvT+6TQoaaSHVyXnlIGi68YKlH89+COXsWs
 dCX95sgAoc+2SGVXRomQLxdNUKoxMcH0blaYEEOfepBwnEI+y2qRINneMKC3w5dPmrIuf6U8X
 Fu8vjxUOIWaFvssfPjFRVnGA28PNbzS+5+WO6YJJut1fZo52VOKxuWN9sf4XNNtF1L/syiRta
 Uqp+fJ6xeB78w0lL8z8CP1lZ/nhZSE1ISAZUnSlWKE7PCD2qsSURgtFJ411DK9e0NBly2JgMg
 H3Qxu+2qK6t/uB8R/sI2s0/zJijwRO8gyGmpoFSlCOrW/oCCv0g3F4mo6ToKv0fZIIgiYcN25
 e2ddb4nh/uhjY0uiXW9L06tO5O5hdaUdgb+HmWOPocd0O7Q2YR/G6ClLTwZ/kmN/s0YPqgxlp
 /Rz9wF1Fnv7mOG75Ird59NP4WzeTkuWbmdt7d9dQimpsV6XJkMpoAGhSnxnRedfvtY8AIY4TP
 qcOmxsRfaBgvYQscsQ4S9gMh8zKH/xlUbpOiFdqdjAfryKUefP3EZLvGEbzZJzQZjpmsrdGy+
 C3MbdWxjeu+6xCk8IHQiUMp4kmsLdCCpvJantYbG8Jc3BnwfyIPxHC77HggQJS6GHSteKPM7b
 C7mLjgHllkJq8kUbGJkCDiexq6/AjdReruBFXTsarapWqanIp2QDg+2NjbanmdmWkW3WrenKG
 pnZzTXJ1h/fDWN7JoUDRmky5kOzLi1iyMNt1v/kLBovPXhZ4V4ZuJDZMZhHR7eqDgFwqhtygC
 FY8ftLwEth81pe93b1WY88/Y68M5M2emDwJwZIZJoMhX5ZGt3/2ga5jrX7Jqhvtw2A/+lBX5a
 aeznh08wUog7t+QBOtZusHBVrsFp50s1QZWhTGjt0RNYgWDHU2aaQ49cAz3+fisjhpP85pjdr
 UGfzldqUSX3FlRNKAMoLQ0JznMHAOiwya8Hw1PjHO+iIpcl7EZ50yU1P5YQ+Rm2AOBKwT/N3p
 BNibI/nIAt6u35yOCdpv/sG4DtdvxfALqlSq1fIsOW5/eMaeXfHFM2ZTHQg0uZLG/tQurGFjb
 j3yhZjHFz1uaLx0+Xd/5hzZwSDRBBqYysYhPXYWW5u3NdVEICw5vnHs20xbZgGh7tVeb1Rhxv
 FSPlr/cNqAPSLU5XkQ1f+K7q2h8AJyD0R2ROT16WUDqX2WNiGFSyYJWwM2Z7pIo85lGuU=
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Sven noticed that calling ioremap() and iounmap() multiple times leads
to a vmap memory leak:
	vmap allocation for size 4198400 failed:
	use vmalloc=3D<size> to increase size

It seems we missed calling remove_vm_area() for ioummap().

Signed-off-by: Helge Deller <deller@gmx.de>
Noticed-by: Sven Schnelle <svens@stackframe.org>
Cc: <stable@vger.kernel.org>

diff --git a/arch/parisc/mm/ioremap.c b/arch/parisc/mm/ioremap.c
index 92a9b5f12f98..bcfa98aa134c 100644
=2D-- a/arch/parisc/mm/ioremap.c
+++ b/arch/parisc/mm/ioremap.c
@@ -3,13 +3,14 @@
  * arch/parisc/mm/ioremap.c
  *
  * (C) Copyright 1995 1996 Linus Torvalds
- * (C) Copyright 2001-2006 Helge Deller <deller@gmx.de>
+ * (C) Copyright 2001-2019 Helge Deller <deller@gmx.de>
  * (C) Copyright 2005 Kyle McMartin <kyle@parisc-linux.org>
  */

 #include <linux/vmalloc.h>
 #include <linux/errno.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <linux/io.h>
 #include <asm/pgalloc.h>

@@ -84,7 +85,8 @@ void __iomem * __ioremap(unsigned long phys_addr, unsign=
ed long size, unsigned l
 	addr =3D (void __iomem *) area->addr;
 	if (ioremap_page_range((unsigned long)addr, (unsigned long)addr + size,
 			       phys_addr, pgprot)) {
-		vfree(addr);
+		remove_vm_area((void __force *)addr);
+		kfree(area);
 		return NULL;
 	}

@@ -94,7 +96,24 @@ EXPORT_SYMBOL(__ioremap);

 void iounmap(const volatile void __iomem *addr)
 {
-	if (addr > high_memory)
-		return vfree((void *) (PAGE_MASK & (unsigned long __force) addr));
+	struct vm_struct *p, *o;
+
+	if (addr <=3D high_memory)
+		return;
+
+	addr =3D (volatile void __iomem *)
+		(PAGE_MASK & (unsigned long __force)addr);
+
+	p =3D find_vm_area((void __force *)addr);
+	if (!p) {
+		printk(KERN_ERR "iounmap: bad address %p\n", addr);
+		dump_stack();
+		return;
+	}
+
+	/* Finally remove it */
+	o =3D remove_vm_area((void __force *)addr);
+	BUG_ON(p !=3D o || o =3D=3D NULL);
+	kfree(p);
 }
 EXPORT_SYMBOL(iounmap);
