Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C90C639847
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Nov 2022 22:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiKZVgd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 26 Nov 2022 16:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiKZVgc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 26 Nov 2022 16:36:32 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7B015A35
        for <linux-parisc@vger.kernel.org>; Sat, 26 Nov 2022 13:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1669498588; bh=qBosl0qnGdS7MiRdl5lH9+kvm6szht8PS1NyKeQS9LI=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=ixvZ6ing2TBelQIYhGiiOPe97DH2ast3aJporCESIIb+AT/bhQMxv4ficj4B96vBv
         Y5zMi4HkjA/FAqm18yvfWboNU5RleQmQY003pH8x7jpcEJlhQG1r2+bUj4Sn+Qjj/k
         NuMKHcdo58m5W1Po9buA3R06wt9fifwPZRFChbXVYxuibOIr9CYuRaeUappneOAVds
         qxcKKPmHpAQ9WkItDPmdUJz4d6Pof2C1oHLD6nj9edFtN9lSX8aMusrHLvT0C7jYpV
         R15JeMPNGNyWfJ6n8EofNzMD+aXjPQA0o9MJuFJl4AsQWdjTbPHt+ZSrtj6EqFYSH6
         eowL9X6dCOy5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.155.181]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqs0R-1odEh32S5R-00moY7 for
 <linux-parisc@vger.kernel.org>; Sat, 26 Nov 2022 22:36:28 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 3/4] parisc: Drop duplicate kgdb_pdc console in pdc_cons.c
Date:   Sat, 26 Nov 2022 22:36:20 +0100
Message-Id: <20221126213621.363838-3-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221126213621.363838-1-deller@gmx.de>
References: <20221126213621.363838-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wpeq5+fuuutHRRW/xpY/jBIaXOW8x62jJz/Qgyygyk9bvYe7eW7
 C5DBaKVHc7wWFlhZXC80kA2fM5CXMlTM2iBe+qNRzWTCYT6JnuQjnpv8ZnqvEgJq/ZZtnn6
 P26J0rgaHbPCrMJiLbQefWtfdNEPerNOrehRrLOyB7pOzN80AqXOT88V698RB+/0hPKOETA
 XoSdnCAbODsETsgf5dV/A==
UI-OutboundReport: notjunk:1;M01:P0:tkntjkuTdV0=;xXbqgoxymyh/pQoxqObD7+tV/0a
 H6FiGiHpKiRq0fNY83TCErNsr5UDvnuGLj6tm8dQLw8A42+KYYNgkT7897ORwFsv7omri5UTv
 fasgVrMMj8+DXNFyBSco+5ET6RkHqjNa4wq2+bQahDPJ5ipOOirb8ywTUl+dSueSdyV2hFicG
 fWcnGoYmyAXA7Sc1GR+oC/pBnnPsj+z0LaYTJ0eyGsVBbkhbBLvDS7GOkUXs19bWihZ/hqVud
 5ExxYdkvxwtG547GFWeNF58vC+eqE7F9Id7aHt/zDKa9DQlpA0J2FWWo+1zabrWkA3C9Zf8d5
 8cmIAln2kqfQXIVOjbQ+uZwzrIgY/gpHPdU1CRh21nOaKpdGGziCWcuSnIUpWgIm7lQLTIKCz
 BVacymuN3kxakBhXsxefYLzZ60mKez/10MRZZ4/epswFrmPDUSUtDNcymYwOcRmNEJueyZH4G
 XgNXO3/lLq1y47cRjAHbA3yxX/IFtv7cPvPFIwfpUeNMha+26X2Y+OwGRTTQ4S3wHg/XPgu40
 DX5xiVCyaoYJ5b00IAYq5+laK7NrxRX+IAGR6e5NRMDJyJVs6L3wDAcZDLVuVswXpEBf9QCde
 M54LD8JO85JJmSOXrYap6rmQHZ5lX6HqNSMvGX/g19s6IJquy5dppq2FL4cb92d5KCxGNrhLC
 4KSvNndZe3eVAJ+mCbtiNYGrE78R631STgKfECAJG/ka9TRF+wQleldwlcP0MT5k0pr8JXRbk
 bSmVER1X/AK0PC7oxBZmfHnkoFSbBlRJTUKlok0ursG6CUUjInUMKALNB1MO+rVoENsGvtpAq
 pdX4P+SfYrFRBnCwmB+zok4JaaUaisKxICrvLTQz2uxg4yCUXmp+pc/7zWibvOJmVKy7OKqrp
 E1r9BO2XoJ0n4xlXHc3y8pRWPg6P5+rTpBbYObmcsgo5ZTYNpTNJW/2i4W7QIBCsOy4ZuVrrj
 f5XsUQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The kgdb console is already registered in kgdb.c, so the duplicate code
can be dropped.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/pdc_cons.c | 36 -----------------------------------
 1 file changed, 36 deletions(-)

diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons.c
index 7d0989f523d0..eebfc3e3d94c 100644
=2D-- a/arch/parisc/kernel/pdc_cons.c
+++ b/arch/parisc/kernel/pdc_cons.c
@@ -8,50 +8,18 @@
 #include <linux/console.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
-#include <linux/kgdb.h>
 #include <asm/page.h>		/* for PAGE0 */
 #include <asm/pdc.h>		/* for iodc_call() proto and friends */

-static DEFINE_SPINLOCK(pdc_console_lock);
-
 static void pdc_console_write(struct console *co, const char *s, unsigned=
 count)
 {
 	int i =3D 0;
-	unsigned long flags;

-	spin_lock_irqsave(&pdc_console_lock, flags);
 	do {
 		i +=3D pdc_iodc_print(s + i, count - i);
 	} while (i < count);
-	spin_unlock_irqrestore(&pdc_console_lock, flags);
-}
-
-#ifdef CONFIG_KGDB
-static int kgdb_pdc_read_char(void)
-{
-	int c;
-	unsigned long flags;
-
-	spin_lock_irqsave(&pdc_console_lock, flags);
-	c =3D pdc_iodc_getc();
-	spin_unlock_irqrestore(&pdc_console_lock, flags);
-
-	return (c <=3D 0) ? NO_POLL_CHAR : c;
 }

-static void kgdb_pdc_write_char(u8 chr)
-{
-	if (PAGE0->mem_cons.cl_class !=3D CL_DUPLEX)
-		pdc_console_write(NULL, &chr, 1);
-}
-
-static struct kgdb_io kgdb_pdc_io_ops =3D {
-	.name =3D "kgdb_pdc",
-	.read_char =3D kgdb_pdc_read_char,
-	.write_char =3D kgdb_pdc_write_char,
-};
-#endif
-
 static int __init pdc_earlycon_setup(struct earlycon_device *device,
 				     const char *opt)
 {
@@ -65,10 +33,6 @@ static int __init pdc_earlycon_setup(struct earlycon_de=
vice *device,
 	earlycon_console->write =3D pdc_console_write;
 	device->port.iotype =3D UPIO_MEM32BE;

-#ifdef CONFIG_KGDB
-	kgdb_register_io_module(&kgdb_pdc_io_ops);
-#endif
-
 	return 0;
 }

=2D-
2.38.1

