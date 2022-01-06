Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4D44862F7
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Jan 2022 11:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237989AbiAFKdF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 6 Jan 2022 05:33:05 -0500
Received: from mout.gmx.net ([212.227.17.20]:48949 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237059AbiAFKdF (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 6 Jan 2022 05:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641465175;
        bh=a+d3ouwVPKSi7h9BPSCzStsAuRF4nxh1JXphg8yUST0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Qn+jBgqBdunuiVYqQApvpdDxIlDttownlzXp1T7nZOz5xbJGjDZFvEIRNMC24OMsK
         kUAdr61FNW+x9idUUtLjNHMm1oQy25s5lL0UzqRMNrYkiIZhcjmyf4JkXa5UXTMFOD
         j3u7jXj2RcnLwtzTwVmNxw2XiMUqs91FwhkP8B1I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.152.191]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKGP-1nCLy21a2r-00FnsW; Thu, 06
 Jan 2022 11:32:55 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Add kgdb io_module to read chars via PDC
Date:   Thu,  6 Jan 2022 11:31:55 +0100
Message-Id: <20220106103155.609070-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S/7zTl7Eu2dg5eOLA6RCtmyPipNpq1bpdJljWkQlOqucmX2c0KQ
 vRl2aTSRPdQyj2h1t2jviv2kpahGdHe6vYp0PmjZUn1B7zvDxq6NRCzwgdrEiqNKc+app0d
 ISuw2MOhn49LNiKABTrr2ejwxJP5P+Nzek2QCb/r/Lo7PM9BaPoiyE1MvuPSCu5V7X+NRNm
 mtolT4ehXVK5mhqL1Xk5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o8/VUDA4Ek8=:IGtPHXbtXTtPOnwJLNy3wI
 cYWuI+Og5Kck2w7sVDLzSp7YRHrWoRENm2QNwjQCAfdW/riUhyhuCOpoUT7OzeJuFTXpggAeY
 9TchgK3UXHSt1DdEBQLkom+AixneeY4sH1owxhGpi44xd1oNqOPY+fcOSFpNaeawdPW91adav
 fR0eKb1J8uwI/oUS/bgKdcwwlVw3BI/iD8hyI2po0U445lu2BDf+B2VvgOSTc36QGhTjn23KP
 XniUEkl3YaLCpGb1laq6ap6QTusxs03HgNsPu3YnjCjpoLGHoAj1l/5pLPRU2EJsVb2K1MXv9
 evQuhgZ1jKRdp29OzJQl3k7fvmFHAcCwUNnKmmEWepTE4RDSQ9y+OPBm7OiWRlI4ScmZ+ko/d
 FB86VCzuqQ9V5BBVDjUNhELrLAZFmcjjf2ql+HNsWGl9KUCHfQc5oAcUAOeMSkJOszDmHF+cI
 QP/6XfMD6aI16aDYCSlsd2cIuGsnPIV3orSUnoz8Una2M2QssNE1hlz2ZFWFXD/PZ/8C9wXtE
 vMszDg61aGzrWDNSnTNAnII7sqGJFcsziqdodh1smoHYKsHXKZu+a5ulBkpAhvLrfm6gpLUv2
 Lrm+4kzOwdUMQhrd2dPrU/RBIhhY1mMpVvoIkJfsZmmLbEr40ce9DKKMMjYBzlZrsGNCPM58R
 cnE9BrBUNRjXcI7XnBjqu3i+yuwfdbdtTyERSZ+c3GeGKzziXUli5QTK2Uj/Xl8r2ZwFc+ivQ
 P14BJGFkdfCOFD+4inuS/fsvF1aJLSDAsMcRxK+TcFwpBHdWzuaAU+6KARsnlHmjYBUuRaVwf
 WBLJ6Uu8sOWUHYr3ihQy1NEDbllFpl0NZI6E4taFUeQSZS1yXUcfXM1ImtHtpTutmbE+AMTW+
 rTASE3CavNgFxzS95u9wXfw0EeGrO3NdT7AVmgZWntG8Lod7DsLr8FSgTSFIjCIfYNa6vEIUJ
 biMh6R4/LzoQRXg3/kHZ0xD3R2+IzC4J/cw/gisJ2zcjNCy30eT+6GboiipBV5uCa288/pKHP
 OAiaxjGnvpaPAo97NkT176mjpjSS5KvJVixY6YvXVitAJM9AB0kE4ssENNL079dWdw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add a simplistic keyboard driver for usage of PDC I/O functions
with kgdb. This driver makes it possible to use KGDB with QEMU.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/kgdb.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/parisc/kernel/kgdb.c b/arch/parisc/kernel/kgdb.c
index c4554ac13eac..ab7620f695be 100644
=2D-- a/arch/parisc/kernel/kgdb.c
+++ b/arch/parisc/kernel/kgdb.c
@@ -3,6 +3,7 @@
  * PA-RISC KGDB support
  *
  * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ * Copyright (c) 2022 Helge Deller <deller@gmx.de>
  *
  */

@@ -207,3 +208,23 @@ int kgdb_arch_handle_exception(int trap, int signo,
 	}
 	return -1;
 }
+
+/* KGDB console driver which uses PDC to read chars from keyboard */
+
+static void kgdb_pdc_write_char(u8 chr)
+{
+	/* no need to print char. kgdb will do it. */
+}
+
+static struct kgdb_io kgdb_pdc_io_ops =3D {
+	.name		=3D "kgdb_pdc",
+	.read_char	=3D pdc_iodc_getc,
+	.write_char	=3D kgdb_pdc_write_char,
+};
+
+static int __init kgdb_pdc_init(void)
+{
+	kgdb_register_io_module(&kgdb_pdc_io_ops);
+	return 0;
+}
+early_initcall(kgdb_pdc_init);
=2D-
2.31.1

