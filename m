Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A759244E46
	for <lists+linux-parisc@lfdr.de>; Fri, 14 Aug 2020 20:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgHNSBN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 14 Aug 2020 14:01:13 -0400
Received: from mout.gmx.net ([212.227.15.19]:44645 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726681AbgHNSBM (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 14 Aug 2020 14:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597428064;
        bh=B+/wRrxb+Xwc2Bu7H8IPy+zYicBnYCO1vO56BPTEI2E=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=L7x6mYX33t7swkYFNxKEb72Vbve5WDQto7IVJ7ckCSenaR6hJEHJkLFAxqZmYEmUE
         WobkaSmKMBfZ8IML98nJycsws3bIYcNJg7qJJnSGtrK+P/sD4FpDpIyhcMf+EjG56E
         aCQ75gVHwBJhYzgi4d+YPTLs5isoLFIfJm5UEzpg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.148.19]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJhO-1kVqPU2sFw-00jFk8; Fri, 14
 Aug 2020 20:01:04 +0200
Date:   Fri, 14 Aug 2020 20:00:59 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add qemu fw_cfg interface
Message-ID: <20200814180059.GA12471@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:mee+qXbeITgNMrdAxOWGccd1nTGpOPZ+fiP9ekmTSasRAkPjIaM
 SKHi/ME0b3aaaf7shgGECi8pORUIV1CP/Ac1v8U299OcFmBkTAX0sygmbGNOoqghRcv1WpK
 qGGSz+oLOm/bzZcn2ORlIZ86QjQv6Fie7ax8U18gG+XmWuzLcJ0DXmees4QjfYjdzRp/BpS
 vBVY/Dbt0v1bJv8C4TZkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f0ItsOYekkk=:5O5pAv4UJ+H3R5NjxZxUK0
 0uXxjeyCKFIZINW2FuSyM1HSVt3ATHya6hb5e44Fslx8g1CZxT96zK5mkkf7Qj1dNVf5I1MCe
 3cEIBm1RsruLZzvZiJYqXsg3z3hfIlNuFZvJF0C5l5VuQ1kpbq8GQg4re3UgcpExiF6S3Be8L
 HesEzIhG21El8XLwfG+YdWc+VEvtVH2Ac21B3JtXZt+rrO5OKP4qoZCub9JZqHtpSsOpZud5B
 Yy0RDqARbsCvyuPgVY2/eDYB6OwuYSDzEEY4+9XlNXBEcZp84/cgcom8Fz+VaDrsoO6eZOSHr
 d0+URzGj7O81L1wbEMhgfsIzHsHuZgFd8QxpuonrAfDwgX3QZKE5dbvXQ18xpo3AdRDtFwkMO
 3tiTxxAns3j9dyrOqSYkJeeHWA834UEQmDi2zp8Eo8+pjOn0PoIElrZeTExY/sGnHRmImPCRJ
 yBciIIOAtn7ijzR/Y/WlwdSOP/0Zn8Z2HnJq4NUPRDX/3zZRH0FJDOh3B9h3gHa9j1fkOeSS9
 X9wdAQr6CbNqf5r1bzvqK7M4aZ8t6qFowHtcNCQuvp1+YB+7g04R6jvJKTN8qBXm4X4GjkC+e
 VUnnKALzjy3JKk/1L1GEIYTzyGYnrLlJ6kXAi23juOe40i+XuwCz9HWaOxGYbB97HXNbl4aG4
 9qrlxICCJGi/WCVcKquu/5tl+Wy6tx+IbuqcaUgaZowKAXrncIVic4rgyxaYLy+0GSb5q19f4
 iBEZ8RO/Gigdga6dWF7rHi34CERJG+SKTXDtllHFRdSh53Bs6b3ZVsXfVXpFQ1pl6SsOlysMM
 ShHIzXiu8oYfSpjICeVa9kxwsURmutLPITX/fuVuYTwMhxQvQ6cVgkKYiJMAOh8gX+KkuDJCr
 sPWa5v2QZuYTNODoNQWbwovhcJh8dV3K+rUCSlSu6JkpFt6iSg2ulgWCxFdyxMEPCZBZPM8uo
 nGAKgWZmuFYKpiS+RiLGRl/h5Y99jYQMTdUfejv8fnkDAdrkJHkNPkFOc19itMdch5zxZbKZD
 uzcxcVgGTq04EVfoIqwGAUWx+EnNbZCyoRJI01hO+nziea7XJC+FtdmWL3BJlFtFtl7Wga3Ko
 nc6TLaZV1/y+IyWidoa07dklJfFzw2+VGB7vFWpP0AKlO2CUlKDKVC1v5uiLdEq7ek0EVi9Rg
 06Fm3y/9wSaNwFG/upVLnu8nBHvGgjGs309/MbcdRZ5/tKA0/2OgfVOpA0A/XzOC7XXtAMOvI
 opi0KBlpJbZODma0k
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When running on qemu, SeaBIOS-hppa stores the iomem address for the
emulated fw_cfg port in PAGE0_>pad0[2/3]. Let the Linux driver
auto-configure the fw_cfg interface with it, so that the fw_cfg info
shows up in /sys/firmware/qemu_fw_cfg.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 8e4c3708773d..ba26d224c653 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -376,6 +376,7 @@ config KEXEC_FILE

 endmenu

+source "drivers/firmware/Kconfig"

 source "drivers/parisc/Kconfig"

diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory=
.c
index 9298f2285510..7ab2f2a54400 100644
=2D-- a/arch/parisc/kernel/inventory.c
+++ b/arch/parisc/kernel/inventory.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
+#include <linux/platform_device.h>
 #include <asm/hardware.h>
 #include <asm/io.h>
 #include <asm/mmzone.h>
@@ -641,4 +642,33 @@ void __init do_device_inventory(void)
 	if (pa_serialize_tlb_flushes)
 		pr_info("Merced bus found: Enable PxTLB serialization.\n");
 #endif
+
+#if defined(CONFIG_FW_CFG_SYSFS)
+	if (running_on_qemu) {
+		struct resource res[3] =3D {0,};
+		unsigned int base;
+
+		base =3D ((unsigned long long) PAGE0->pad0[2] << 32)
+			| PAGE0->pad0[3]; /* SeaBIOS stored it here */
+
+		res[0].name =3D "fw_cfg";
+		res[0].start =3D base;
+		res[0].end =3D base + 8 - 1;
+		res[0].flags =3D IORESOURCE_MEM;
+
+		res[1].name =3D "ctrl";
+		res[1].start =3D 0;
+		res[1].flags =3D IORESOURCE_REG;
+
+		res[2].name =3D "data";
+		res[2].start =3D 4;
+		res[2].flags =3D IORESOURCE_REG;
+
+		if (base) {
+			pr_info("Found qemu fw_cfg interface at %#08x\n", base);
+			platform_device_register_simple("fw_cfg",
+				PLATFORM_DEVID_NONE, res, 3);
+		}
+	}
+#endif
 }
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index fbd785dd0513..25f51b60194b 100644
=2D-- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -187,7 +187,7 @@ config RASPBERRYPI_FIRMWARE

 config FW_CFG_SYSFS
 	tristate "QEMU fw_cfg device support in sysfs"
-	depends on SYSFS && (ARM || ARM64 || PPC_PMAC || SPARC || X86)
+	depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || SPARC || X86)
 	depends on HAS_IOPORT_MAP
 	default n
 	help
diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg=
.c
index 6945c3c96637..0078260fbabe 100644
=2D-- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -215,6 +215,9 @@ static void fw_cfg_io_cleanup(void)
 #  define FW_CFG_CTRL_OFF 0x08
 #  define FW_CFG_DATA_OFF 0x00
 #  define FW_CFG_DMA_OFF 0x10
+# elif defined(CONFIG_PARISC)	/* parisc */
+#  define FW_CFG_CTRL_OFF 0x00
+#  define FW_CFG_DATA_OFF 0x04
 # elif (defined(CONFIG_PPC_PMAC) || defined(CONFIG_SPARC32)) /* ppc/mac,s=
un4m */
 #  define FW_CFG_CTRL_OFF 0x00
 #  define FW_CFG_DATA_OFF 0x02
