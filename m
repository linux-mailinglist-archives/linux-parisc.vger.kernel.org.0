Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDB428AED8
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Oct 2020 09:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgJLHNu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Oct 2020 03:13:50 -0400
Received: from mout.gmx.net ([212.227.17.22]:52811 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgJLHNu (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Oct 2020 03:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602486823;
        bh=PBMV6H/lHUX3ucv2v04w9f9ta5ofjVH0EdWLWNm/G54=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Wp6wp0sdJKs3qqHaCvh3vWU4K4qqNkxAceWGdlriwVASQeDbCKoxrxG2+gmNP9m5c
         /DI8mJ93P1c5z9Elsn/XSFCGU/G2dxMzOB2vqz3CmxjjrBY58sn9Q+tYetZt4GUxOR
         idhYJi4JLGDICzN+1CNtB5A4SpvwF53GPWA8gmv4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.158.71]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1kBajD1i0a-00uEuR; Mon, 12
 Oct 2020 09:13:43 +0200
Date:   Mon, 12 Oct 2020 09:13:40 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc/sticon: Always register sticon console driver
Message-ID: <20201012071340.GA15080@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:RS9pKHSeShNg2llMUEk0OXZ/PtVMMjNA7w9KHOvIm9ewM5fSPMU
 xO5y9V637GBeY04lNg+BkkRnWefcyTTSL8dT2l62XxV0IqOsnc0zP/DljgB18sZi98mr54s
 qGqp3bFZTwOMv2jZgW9YRnie8R3JWTjoUHf/tvqG+3+SE5nwWo1UvEO3qZzQtWy0eQBDYsz
 yhO17SHRtoC1pEn5eXyzQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P8Cmpy6fJwk=:+LdU/ppQGUW1Kpb9znuI6T
 Cd7K21F1Hl3VsA/xQai4HbhyP1DfO3tTartosxR08dCqHro3p2r4lujoUjyMhVQ6K8RO3irR1
 nf3vSgCFq6uOivxPNpZn+xYoTOhl2TI5R9R6xTdd6iyLfWfPsRBECOidiVR7X34NF+x4lHBEq
 E2QBR+r8iGZvzzvWn1KBTeaeL9N6/RmuseRkkBuCsiXPyOm7/MeYidNzgc/k5wlbfRv6S1+pj
 AMlKBOaP9viNRUNZ3CZfhdqIcH6V+P+1CxMvS2+GWhpZMfgeP/KQfJAaZCL6KhaULfbyegv/b
 qrSYG2cqJfKHR2Odyre7MqNMjYUHTiNlqREu9z7cLW92LgdoVgoywtPSnVN+ucPKUtbraTd3a
 gevy9bTCnsAtUFv++yzEmBwKgn4/2JAkveRE9p8ZN/cT7DdLyxSeOMdHC7z0E55+uMa6YKh3G
 9OYD8d/iprHtw9GiJecgu2hYXciY7wDGvoWmKcHgLI2NPf0/USgXuJkyiYO2x0BjZKjfuUvwE
 bvWGJV/zMJAXN2EKT/uHenC7nSMWCQwZdl5KYSBLNW3mIq5YTXtppwIwW89u5CVf9IYeMtAbc
 /M81Zpv5JILp0RPg0m6IiFurZizuiK/HTFRAGjkbJlzi+66J3GlefbamX5cPBk/ovpKfQoWxr
 dzLrtybwl+EVNPXelbw7iQWNKIIlJbr9pkN1w2J82wZRKiaQFJKAaCbQg88HqgfXLtEPJZWZN
 Mm17UtHkwPPTeyQPmK+Kc86pbXKT6SeY2xU/sWKZDrcN/0pb045i8R7EPIL7dm/BS6tcYmw6i
 +S7oetoUZzl+kIw8pFvZ/yiQ2b7CGl4zJHnYlGgZywPaZmKyE3fscXMU8NSzbvc7Jveu6RAKO
 lTb9FjIE9D4X6LdmpQ6yDKg8Evhcdq9nsLY7cqbvg4B46ZqXqchakLszRe9mieik6tAJ2b3R7
 HuE4Z5d/+yuraaltU08NgCK0P8gAIIFJ0paUf5f+D783vfOyoq0ewi4Im80x+ds93fMvU7T9m
 FGcOp1jvmF17R+Y7kR8n0MA47tQ6VIukMYeoHKLEoEtezpI2vfObydVwfze1Bi25P5aRQtK9J
 vV6BCivChy0YmYRWsmydSj/rgWNaeskg2HDsWLUYmJTo78iK+BMomxT79r7fK/EgppDFsDjzT
 WDMbS+QeUYHt+LN9tlLqNYtNtT6cpxvxtmhZpldIqsQDF2BgvXPj2HX2tmzQjapxBhONbaDsM
 glRam6PbkpA4vvP9d
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

If the ROM provides functional STI routines, always register the sticon
driver, even if the serial console was choosen as boot device.
Additionally, in that case, do not make the sticon driver the default
output console device.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon=
.c
index 21a5c280c8c9..8647d2b654b1 100644
=2D-- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -355,14 +355,13 @@ static int __init sticonsole_init(void)
     if (!sticon_sti)
 	return -ENODEV;

-    if (conswitchp =3D=3D &dummy_con) {
-	printk(KERN_INFO "sticon: Initializing STI text console.\n");
-	console_lock();
-	err =3D do_take_over_console(&sti_con, 0, MAX_NR_CONSOLES - 1, 1);
-	console_unlock();
-	return err;
-    }
-    return 0;
+    pr_info("sticon: Initializing STI text console.\n");
+    console_lock();
+    err =3D do_take_over_console(&sti_con, 0, MAX_NR_CONSOLES - 1,
+		PAGE0->mem_cons.cl_class !=3D CL_DUPLEX);
+    console_unlock();
+
+    return err;
 }

 module_init(sticonsole_init);
