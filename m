Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D99A0639848
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Nov 2022 22:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiKZVge (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 26 Nov 2022 16:36:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiKZVgc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 26 Nov 2022 16:36:32 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9E815A3B
        for <linux-parisc@vger.kernel.org>; Sat, 26 Nov 2022 13:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1669498588; bh=ID/MTKP3PPqJPgKAHGtKRaXgMrF1EMooZyza4l+OCrw=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=H58Xw/giHhTXE5Fr0ZDLKX/rmwNCRiU/mNIOtkg/bX+ZI842o8t9XhNiPoIv2bIv+
         lQecWIpsh8YBTXiGF09jemcTYkelPt0psBNSB9h8KMIzR1AwsBfQg9s5gxAPPW+bZn
         aKq113eJbm2mKsF6GuAAfTBYMocgWqQTOnupYH1e7lOOSnaYN76iKG/C3oK9OUrh7T
         7pikLl3YhuK04ESf6LQLLUnq9NdX+Zk5uoKko+OlT8en9OrbKbcXMNOCOPKG4f+4Qd
         Spcpm3s5WhzC9Jqv2Pa1jOlTwFUwazByFth16YASOcgitzQJmc5mb8FrnlFbl1cs2M
         suri8p+pllI2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.155.181]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQT9-1oikRt2mTF-00sQkZ for
 <linux-parisc@vger.kernel.org>; Sat, 26 Nov 2022 22:36:28 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 4/4] parisc: Fix kgdb_pdc console read/write funtions
Date:   Sat, 26 Nov 2022 22:36:21 +0100
Message-Id: <20221126213621.363838-4-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221126213621.363838-1-deller@gmx.de>
References: <20221126213621.363838-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JWVzsGw3mJKorsI80wU6yxHNIFvhSK/A0zTViH0C7KesI811jAS
 zrzicGHxNUqQza5ObTjzVZAL8FQxCVpNsZek/DYQswH1jxxA53McyoHCnk8A/jG5mlQrpuU
 WTGt5NHWs1E7/+XizfKp7dtHTKftjCIbdTE00Dw/E8qH/lxHYQkJB41f0geVwvkbQvpXVRc
 csdxLLDEXRbF5kJsJvAzA==
UI-OutboundReport: notjunk:1;M01:P0:MP4aYXSajH8=;Yr0wC/dNoK4Wf7rCpZoigXMKThf
 uqlqpUnOluc4rhpa6polKI+qoNq8YsD4b7C8C17lgcDifNMHZE5jn8dtZUBqG6vem/4yu8hxJ
 5yQFXmGFsUk8Lx9pElRH/6Cu5wnqy17xZqZM9hW9t5P8PzZ9lTsBGT1QffqDIx96UKSE5wOzu
 6LFPZGyXrresJWDzPW//AoAeiJu0iuIu/LtrIlMayM87CX+kvIlAatY4IEraYG0MtxMjw5myA
 bDGVI1sb9pY4EJtUdC8RYLicz13U0UzhZf0gb9gH/cCS5zxmvqFQmcxeWvEsscSVsmX/lItPY
 Ftc1MIiSyU4ilEtDyCNky7TMlyAoBO0j5y9iabxbgryeTSNMFVus71rA7rsfFkLt5GeqiLJWr
 xxeBFuHvXoxfcKPFUwIEy7CvAt4C44DQ+E59ZlDIElXCE/2X2ICYL+lonZ+USCl0okSibtiot
 nISzQEwMXENQ6gaMCw4SfJSUifNCP6A1gvUzvOADssXB+1Z1bddpXarr7k5FpwZbzznwr+En8
 BSKqWcCYLvpAjTP0jp1cpSUUAzvCZe8y7q5ZvcGl2VgtA7Bte8nvn12SF6TKleJH2tW0/5Jpf
 XmmcE2EaVaOCpdKtRA361fTYllT+n3+2QhOHyo1lsM+M6GHgTxx/C7hpSk4oeXDHxEjejbpds
 9wb5GAhEbcE8v75Uc/bscS7hODNEecbE152S/bl8Ca1l9QfMnEha7SE2FrHHM1q/bqmNIxvUc
 Ub7LfetmKpcT24qdCloJ/zU1FeDBW9hNGMKYGh+PVy3dRxvujKzLjLKHQfle/zXCAumWeUpJV
 wgjyuMZJmF/Q8F4DjB9A0oVAmmm2lLh+vt+AZ1VvDCM8SV5V0U+T8a0CsEZ4jiIejhzuq1QjC
 i8CfDAcKnzS1DrGcg2HY8rQz0PNztL2oeOq0H1ItvwkAqdGEExMAJQHQRP8WRZ3aIQYYEqvW2
 bQWbYBZCAmRPCELbREJjWnkW8Z4=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Allow the kgdb debugger to read chars from PDC firmware console
(keyboard or serial port), and fix output to only show up on monitors
since the output to serial ports is already happens in the kgdb serial
driver.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/kgdb.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/kgdb.c b/arch/parisc/kernel/kgdb.c
index ab7620f695be..586046d52712 100644
=2D-- a/arch/parisc/kernel/kgdb.c
+++ b/arch/parisc/kernel/kgdb.c
@@ -13,6 +13,7 @@
 #include <linux/notifier.h>
 #include <linux/kdebug.h>
 #include <linux/uaccess.h>
+#include <linux/serial_core.h>
 #include <asm/ptrace.h>
 #include <asm/traps.h>
 #include <asm/processor.h>
@@ -211,14 +212,22 @@ int kgdb_arch_handle_exception(int trap, int signo,

 /* KGDB console driver which uses PDC to read chars from keyboard */

+static int kgdb_pdc_read_char(void)
+{
+        int c =3D pdc_iodc_getc();
+
+        return (c <=3D 0) ? NO_POLL_CHAR : c;
+}
+
 static void kgdb_pdc_write_char(u8 chr)
 {
-	/* no need to print char. kgdb will do it. */
+	if (PAGE0->mem_cons.cl_class !=3D CL_DUPLEX)
+		pdc_iodc_print(&chr, 1);
 }

 static struct kgdb_io kgdb_pdc_io_ops =3D {
 	.name		=3D "kgdb_pdc",
-	.read_char	=3D pdc_iodc_getc,
+	.read_char	=3D kgdb_pdc_read_char,
 	.write_char	=3D kgdb_pdc_write_char,
 };

=2D-
2.38.1

