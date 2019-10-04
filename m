Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 036E4CC1A6
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Oct 2019 19:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387593AbfJDRYJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 4 Oct 2019 13:24:09 -0400
Received: from mout.gmx.net ([212.227.17.21]:33485 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387458AbfJDRYI (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 4 Oct 2019 13:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570209822;
        bh=ys3aZPwSBLC2twrV1BBYb4FN+71zdDvMKzRk4VCq2iY=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=F4MgXaD6L1FDcWYZBhG6ydjJSdL0WBzq781PRCakCjRmEYERiWDBrT1qsqiRfNub+
         dENta+yPaK6+zSWTWmrIp3Vki2ma8YX6vnK1FtO3B8BmFcIsiQmAWquqQs89aPCwJa
         YSgnDPdOqEtD//WYQfESlLM86CG9ZOpJhLGIhvRY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.137.238]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MA7GM-1iQvxs0BX0-00Bg6T; Fri, 04
 Oct 2019 19:23:42 +0200
Date:   Fri, 4 Oct 2019 19:23:37 +0200
From:   Helge Deller <deller@gmx.de>
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Jeroen Roovers <jer@gentoo.org>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v2] parisc: Fix vmap memory leak in ioremap()/iounmap()
Message-ID: <20191004172337.GA14723@ls3530.fritz.box>
References: <20190909133856.GA32746@ls3530.fritz.box>
 <20190930082026.6ac087ff@wim.jer>
 <66fcabcb-ba00-b6c4-7d46-c1fdd9b05283@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66fcabcb-ba00-b6c4-7d46-c1fdd9b05283@gmx.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Provags-ID: V03:K1:m3cdwIBhzLjoKr29W0u2vdUac0pnAU4hF2HDfmpDp3S356ARN1l
 iuVGYX0/UNs0f9hFupVGTrc7gYm7H8mhnsAoHle5fRs0++TfRmj3yaAUIs60mJPJnbzq9Gn
 LanWzo+lT4WCKbN77au7sGANkrmW1huXrjILxdD8pkbqcvNBcaeJ5HlIhUuExMYF5apMT/f
 PEtF3HbK0EjYRSLpXaz9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kHVrKi/Yfwo=:5KzrthtItxgRFoNXKX9dmY
 dU7KlHPmlblKF36TYvN2dbo3o9fV3SsWtPdgLhYzmYR9piAtOSQH/ynyXGPEENdi2yMl/fl5Z
 m1ge39FTaltv/nSX9JIuK9kbf5F3i3Oo0D180Axut/QcYeyGvI/+JKpy73gtCRG8h9P5iIro6
 6IBbwp9XyIDwTmDHqbiIMr344X5pI6XcebMTnjeOMJsqs7q5qHBxeBAJpRFIglZrVyGh0cBzz
 8EHz02sa7pn1tQj4cTN8JZl/vfMN9eLZ0LOQ6X4eGxTEt3lMeCfhs9T+D9MkiFlIzP6Bl3OwK
 Oy4S2A512qQQJKjHAes2Blu6y184vtirYH3evgbWZGua7wwne5oehQn2qybSV39/LcSDAN3LN
 8m+WdS3A+R5P5C4r22vC5fnb3beB3hD5ee66ZhpvMvVNve1fFv36XMxclkXkyrYkv59v0XwMd
 78msd9VKDMFphRdGwwy16Pe6Py0GOoCod2iq8HuKhVYBn38iQF3aIb0LCXy1ia/+Z+6y+r01F
 fNaBctZN2DdQJzQs+0gDY5Ow5U8idXskRT9uW3XR57DBuEcrhU46efY2/eAfuaZ1BPHUafBGj
 h86tI/g84sqGaEw6erqDMifo721lrZ/P2qmHJfWzp2s9UsNL55Z3G1QfU9TeUBrE/gl3kiaQq
 K/6iId8rXvaCHRYORMeMV57dxhKJnGbkMcWuZ7r2RUR8Sn/7+/wPI9rFfFcIl5vQsT4AFw551
 N3jh4dzbfs1AkWa+uluykmf5ACslrEf84FgI7y0q3+cNVatMaCflqrxTyCPk26608QNAm7uYo
 3RdCshaVgNjHOVSAAX8LxOBx5XGMVym6F5v/StF2YtLfgpNBW9i4T+DyS/2Qg0hQQ1uXOhCaE
 ldPn3MHemJFZKJjIIHq8/kyg5aKKc4q15sXGlE8XBbaPRWPeCn/8sLI/Dn+hfXyKwcXH8d6G3
 rNXRt9UoALT60KZVGZ1PL2/nP7jr1oYFGYM+Uc9ai3tVOP/TNr46YukEpfNrDWr6BuzAh4Lft
 AqOlq5Emm4qlKmITk1prcFBDVp3cTCj2I8lMyX75nVL19F62c8mJYJCw25ttCpseq/D3zGlar
 yXRXtljSXyZ87A1J5R8qWBZMMlPx4vr8HiF1b7u2afaWUpcx8rTx3rP+Evlq7nCXR7u1ky+RT
 EPv+tM0tUyEhAtMYy8qBtq0K5sAXP+Hnr3pThZPzyxxGw30rlj5ZHTGmAeYacYnwM87MtJfTp
 WG3iaN83pVPx+PoN3eaf7kenyXCw1WER2v4uWPw==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Sven noticed that calling ioremap() and iounmap() multiple times leads
to a vmap memory leak:
	vmap allocation for size 4198400 failed:
	use vmalloc=3D<size> to increase size

It seems we missed calling vunmap() in ioummap().

Signed-off-by: Helge Deller <deller@gmx.de>
Noticed-by: Sven Schnelle <svens@stackframe.org>
Cc: <stable@vger.kernel.org>

diff --git a/arch/parisc/mm/ioremap.c b/arch/parisc/mm/ioremap.c
index 92a9b5f12f98..f29f682352f0 100644
=2D-- a/arch/parisc/mm/ioremap.c
+++ b/arch/parisc/mm/ioremap.c
@@ -3,7 +3,7 @@
  * arch/parisc/mm/ioremap.c
  *
  * (C) Copyright 1995 1996 Linus Torvalds
- * (C) Copyright 2001-2006 Helge Deller <deller@gmx.de>
+ * (C) Copyright 2001-2019 Helge Deller <deller@gmx.de>
  * (C) Copyright 2005 Kyle McMartin <kyle@parisc-linux.org>
  */

@@ -84,7 +84,7 @@ void __iomem * __ioremap(unsigned long phys_addr, unsign=
ed long size, unsigned l
 	addr =3D (void __iomem *) area->addr;
 	if (ioremap_page_range((unsigned long)addr, (unsigned long)addr + size,
 			       phys_addr, pgprot)) {
-		vfree(addr);
+		vunmap(addr);
 		return NULL;
 	}

@@ -92,9 +92,11 @@ void __iomem * __ioremap(unsigned long phys_addr, unsig=
ned long size, unsigned l
 }
 EXPORT_SYMBOL(__ioremap);

-void iounmap(const volatile void __iomem *addr)
+void iounmap(const volatile void __iomem *io_addr)
 {
-	if (addr > high_memory)
-		return vfree((void *) (PAGE_MASK & (unsigned long __force) addr));
+	unsigned long addr =3D (unsigned long)io_addr & PAGE_MASK;
+
+	if (is_vmalloc_addr((void *)addr))
+		vunmap((void *)addr);
 }
 EXPORT_SYMBOL(iounmap);
