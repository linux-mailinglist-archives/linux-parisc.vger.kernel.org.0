Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA55244A34
	for <lists+linux-parisc@lfdr.de>; Fri, 14 Aug 2020 15:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgHNNOQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 14 Aug 2020 09:14:16 -0400
Received: from mout.gmx.net ([212.227.15.15]:46267 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgHNNOQ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 14 Aug 2020 09:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597410854;
        bh=5/6YE+luh/bGB4iUD9EIoTiEvNgh1Fl8xFdHapJoG8k=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=GrArZpXp9iIzMGEHgw2EXx0w8yOigFsG2d4Qxq1JvbYbiVFMfAv+d2v6AgKiNdXCZ
         +TeZ1JHYIXz98gsJ0DY0iQwatgozGsfVRfIX/3UfzqpBjs7o6bAGUbFyLaVRZWdQmM
         NUEMlcU4OEqENEkv3Nk+83HpoWDvdEw3Wpcd6VCk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.148.19]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqs0R-1kSlGR1KID-00moaQ; Fri, 14
 Aug 2020 15:14:14 +0200
Date:   Fri, 14 Aug 2020 15:14:12 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Avoid external interrupts when IPI finishes
Message-ID: <20200814131412.GA9797@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:qh1+MzZ/BV43atAwBAsGirnWLpnHtRly+nueJfBdaMCy24uLqov
 1CxcDevRW8cVuQ592FaepHS31Q17UUrydPJSZ10AsZXCtiG1frvNYBTVUk4umkdIDgtGHZ+
 3Pl4BSKv4m5vaii8a1VoEEZeNLi30vPLVpcIYktemGIrBoh/N8qhV20/zOrfzfCpFBpq+F2
 4OTCu0p9mNlIRen8WjvHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SUUKVA2EOIQ=:2b2SyI4JwnYX2CYEOS+8eo
 LMuG7gYox2HQDuIHkQ1gTQ9ENqF8jJaIfED9XmEbHNLUDzOoAw4QoToYXZBbmX4ms4DEupZkD
 u0E9YwJr4YBFTZ+9KGwgRxj3K7oVGEbPve0i5oEW8J+28zAQybZRYV4e7Dy6s3mBRbiRootp+
 xZouG9cLjT7UNT7ecA/G57fm873FmaN/LelXkS8bC/15l3V+K+mYxWY1gTgP0TqLe8VFfqVqE
 RsX59s2UIRKeFyT0Y0tQMTqERBOAEyoE8iDhCI9u+gfBR/XG+NX/WRr5ZfRgS5VTlJxAkrSbu
 rCo/TsJzhZtDeHIlThszRbMsIL5oJzmdnzlFWWHxjAegQ4FbsUVOQ10wVIwYa19ps6DJrtZKT
 KxlJJmk0qAXWSKpBY3dUOaFCd/P2PCJFaw76XASN58KWdjLZkWerZD8ZjhuwKNMXlHj0qOkO4
 lKwJQbOEkFmdqpEAAYfVeyu78U/lG8g6kjJaqh61YYO+IBAHhK27Aib/Z2lGkJeeNOP8wKTl2
 DcWyIM3mtRFxg0ivp5nxvewB7QG57diCkyYp2XH47Za04XS1LUHnptuIzLErDgW83DvIyOPWP
 BMpaK5mkWVfB+F7WR7oExNse47AvpXKBKBDOhHO4d9vzfBpVfBZ8MYn0FDxVfEUcR2ntUG7vt
 2vhRMSx6jbECndXzI8Vij1/9IC6Pj4KGiYYluSY3ogeCZ1rMBUpo/7l6fEpaogCsSKfyM3UBN
 cPWoHP8W+rfAFvmbYKJVzyhrOKfTdxwJ1Hbwy1lDC/iCsKsKlQ3oDCXfckejkrt+8W3Ow5fRF
 pHBloLoY+xXm+GFgQBUnFBeD266IGXo8J//UJcQ9Dm3OuqQv+C9QUIJeYChaXpIl9Udzmw5U9
 CMNUekW79WwPF4myDqUAzuZMFYCQX7/Cg7dFjCyokhIiHv0vH0+gxDzbHFDJAsyNaZ6GdoZwr
 Yv3oJyUScuP3cJJZzzHOVPwSkS+R89LRfU+H481C9j1wtCAmH0TryCEpmAkV+2Zo/kKLyB4Wo
 frHr0oHnqIJi8IMvqvA/VT+MZYImw5meOBxFM/r00gW96QeMpopAXE7Pe0zdP/2BGj1PuhKCE
 1lHsiHnrbqN1S2zNA2CHQdl0AoNlxyFJT/ibzKnWiBiYZmbncYOM6cWIxN4cCQxmxbaHgDgiL
 qKO/aS/rcqkmXC6fNgFc5YP6lQke/GjXpEwRTIKHTKGVyD+wseUGUcHQu0aLnJkdRGV6QAbCX
 761gr6ySJKN+bsCjl
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

No need to allow external interrupts when the IPI loop is going to
finish now.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 6271139d2213..cd7694497428 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -173,9 +183,12 @@ ipi_interrupt(int irq, void *dev_id)
 					this_cpu, which);
 				return IRQ_NONE;
 			} /* Switch */
-		/* let in any pending interrupts */
-		local_irq_enable();
-		local_irq_disable();
+
+			/* before doing more, let in any pending interrupts */
+			if (ops) {
+				local_irq_enable();
+				local_irq_disable();
+			}
 		} /* while (ops) */
 	}
 	return IRQ_HANDLED;
