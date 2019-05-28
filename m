Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB0D12C522
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 13:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfE1LGf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 07:06:35 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:41806 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbfE1LGe (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 07:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=Xufmy54Jwnh3fX3wJN3H6Zg6F2B+K6IK8X61KHw5IE4=; b=LA7eEO8RkT/kHDYgwgMGX3lCWQ
        gVSFqj7g63af1+/Svu4nhm99uXq87IuntNDZwhPGFIl2eUr4928i7JJ1GvmFfcr745kUJA3GdyMee
        +35u5whUiVRc2ZLdfOIkN49gtPdVer8sqzanRsjP/jkC7SrSvLUo5u87JaAh0F/7lW84=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hVZw5-0002LV-38; Tue, 28 May 2019 13:06:29 +0200
Date:   Tue, 28 May 2019 13:06:27 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <20190528110627.GA16860@t470p.stackframe.org>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
 <20190527201538.GD29337@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527201538.GD29337@t470p.stackframe.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, May 27, 2019 at 10:15:38PM +0200, Sven Schnelle wrote:
> Hi,
> 
> On Mon, May 27, 2019 at 09:35:54PM +0200, Carlo Pisani wrote:
> > isn't possible to burn the flash in the C3600 machine with the
> > firmware of C3750?
> > these two look similar.
> 
> I have a firmware image here that has '9000/785 B,C,J Workstation PDC', built
> 08/10/1999 in the header. In that firmware, the PDC_MODEL capabilities handler
> is pretty simple and static:
> 
>   _pdc_model_capabilities
>    fffffff0f002588c 081e0601             add                sp, r0, r1
>    fffffff0f0025890 73c23fe1             std                rp, -0x10(sp)
>    fffffff0f0025894 73c300c8             std,ma             r3, 0x60(sp)
>    fffffff0f0025898 73c43f51             std                r4, -0x58(sp)
>    fffffff0f002589c 0fc112d1             std                r1, -0x10(sp)
>    fffffff0f00258a0 b4210020             addi               0x10, r1, r1
>    fffffff0f00258a4 37430000             copy               r26, r3		; load pointer for capabilites word
>    fffffff0f00258a8 20800000             ldil               0x0, r4
>    fffffff0f00258ac 20200000             ldil               0x0, r1
>    fffffff0f00258b0 34840006             ldo                0x3( r4), r4	; OS32|OS64
>    fffffff0f00258b4 34210000             copy               r1, r1
>    fffffff0f00258b8 f0810c00             depd               r1, 0x1f, 0x20, r4
>    fffffff0f00258bc 0c6412c0             std                r4, 0x0(r3)			; store value
>    fffffff0f00258c0 341c0000             copy               r0, r28
>    fffffff0f00258c4 53c23f21             ldd                -0x70(sp), rp
>    fffffff0f00258c8 53c43f51             ldd                -0x58(sp), r4
>    fffffff0f00258cc e840d000             bv                 ( rp)
>    fffffff0f00258d0 53c33f4d             ldd,mb             -0x60(sp), r3
> 
> So at least this version has no clue about the NP bit (or leaves it intentionally
> at zero, which would mean it's independent of CPU/Chipset revisions) - it would
> be interesting how this function looks in newer firmware revisions. Anyone has
> a Firmware update file for any of the B/C/J Class systems flying around? I'll
> take it regardless of the version.

This is how the PDC_MODEL capabilities function looks in Version 2.0 (My former post
was from Version 3.1)

                         *******************************************************
                         *                      FUNCTION                       *
                         *******************************************************
                         undefined pdc_model_capabilities()
           undefined       r28:1                      <RETURN>
           undefined8      Stack[0x70]:8              local_70                           XREF[1]:   fffffff0f0045c
           undefined8      Stack[-0x10]:8             local_res10                        XREF[1]:   fffffff0f0045c
  pdc_model_capabilities
   fffffff0f0045c94 081e0601             add                sp, r0, r1                                                        XREF[1]:   fffffff0f0045884(c)
   fffffff0f0045c98 73c23fe1             std                rp, -0x10(sp)=>local_res10
   fffffff0f0045c9c 73c300e8             std,ma             r3, 0x70(sp)=>local_70
   fffffff0f0045ca0 73c43f31             std                r4, -0x68(sp)
   fffffff0f0045ca4 73c53f41             std                r5, -0x60(sp)
   fffffff0f0045ca8 73c63f51             std                r6, -0x58(sp)
   fffffff0f0045cac 0fc112d1             std                r1, -0x10(sp)
   fffffff0f0045cb0 b4210040             addi               0x20, r1, r1
   fffffff0f0045cb4 37430000             copy               r26, r3
   fffffff0f0045cb8 20800000             ldil               0x0, r4
   fffffff0f0045cbc 20200000             ldil               0x0, r1
   fffffff0f0045cc0 34840006             ldo                0x3( r4), r4      	      	  ; OS32|OS64                                                                                                         
   fffffff0f0045cc4 34210000             copy               r1, r1
   fffffff0f0045cc8 f0810c00             depd               r1, 0x1f, 0x20, r4
   fffffff0f0045ccc 20a00000             ldil               0x0, r5
   fffffff0f0045cd0 20200000             ldil               0x0, r1
   fffffff0f0045cd4 34a50008             ldo                0x4( r5), r5      	      	  ; NP                                                                                                                
   fffffff0f0045cd8 34210000             copy               r1, r1
   fffffff0f0045cdc f0a10c00             depd               r1, 0x1f, 0x20, r5
   fffffff0f0045ce0 08a40244             or                 r4, r5, r4	      	      	  ; NP|OS32|OS64                                                                                                      
   fffffff0f0045ce4 0c6412c0             std                r4, 0x0(r3)
   fffffff0f0045ce8 341c0000             copy               r0, r28
   fffffff0f0045cec 53c23f01             ldd                -0x80(sp), rp
   fffffff0f0045cf0 53c63f51             ldd                -0x58(sp), r6
   fffffff0f0045cf4 53c53f41             ldd                -0x60(sp), r5
   fffffff0f0045cf8 53c43f31             ldd                -0x68(sp), r4
   fffffff0f0045cfc e840d000             bv                 ( rp)
   fffffff0f0045d00 53c33f2d             _ldd,mb            -0x70(sp), r3


This is interesting, because:

Version 2.0: always sets NP
Version 3.1 and 5.0 always clears that bit

I think all of these versions support B/C/J class systems, but i haven't
tried flashing the C3750 ROM to my J5000. Have to think about a way to recover
if it goes wrong and bricks my J5000.

FWIW, i hacked up a small driver to read the firmware, i'm attaching it to this
Mail. Would be nice if some people could try reading the firmware from their PA-RISC
system so we can collect and archive them. Note that it HPMC's in 32 Bit Mode,
but it worked in 64 Bit mode on my C3750/J5000.

The driver exposes a /sys/firmware/pdcrom file which can be read like every other
file, so copying the firmware should be easy.

Regards
Sven

From 8011a512583926f104431a3c52b9ea5507493b22 Mon Sep 17 00:00:00 2001
From: Sven Schnelle <svens@stackframe.org>
Date: Tue, 28 May 2019 13:03:01 +0200
Subject: [PATCH] parisc: quick hack to read the firmware ROM

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 drivers/parisc/Kconfig        | 13 ++++++
 drivers/parisc/Makefile       |  1 +
 drivers/parisc/pdc_firmware.c | 83 +++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/parisc/pdc_firmware.c

diff --git a/drivers/parisc/Kconfig b/drivers/parisc/Kconfig
index 74e119adca01..37a077eb2a29 100644
--- a/drivers/parisc/Kconfig
+++ b/drivers/parisc/Kconfig
@@ -155,4 +155,17 @@ config PDC_STABLE
 	  To compile this driver as a module, choose M here.
 	  The module will be called pdc_stable.
 
+config PDC_FIRMWARE
+	tristate "PDC Firmware sysfs support"
+	depends on SYSFS
+	default n
+	help
+	  Say Y here if you want to have the kernel expose a file in sysfs
+	  that contains the content of the PDC ROM.
+
+	  If unusre, say N.
+
+	  To compile this driver as a module, choose M here.
+	  The module will be called pdc_firmware.
+
 endmenu
diff --git a/drivers/parisc/Makefile b/drivers/parisc/Makefile
index 99fa6a89e0b9..a3acda40ca78 100644
--- a/drivers/parisc/Makefile
+++ b/drivers/parisc/Makefile
@@ -21,5 +21,6 @@ obj-$(CONFIG_EISA)		+= eisa.o eisa_enumerator.o eisa_eeprom.o
 obj-$(CONFIG_SUPERIO)		+= superio.o
 obj-$(CONFIG_CHASSIS_LCD_LED)	+= led.o
 obj-$(CONFIG_PDC_STABLE)	+= pdc_stable.o
+obj-$(CONFIG_PDC_FIRMWARE)	+= pdc_firmware.o
 obj-y				+= power.o
 
diff --git a/drivers/parisc/pdc_firmware.c b/drivers/parisc/pdc_firmware.c
new file mode 100644
index 000000000000..b6ec76e44c34
--- /dev/null
+++ b/drivers/parisc/pdc_firmware.c
@@ -0,0 +1,83 @@
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/sysfs.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+
+static struct bin_attribute *pdc_firmware_attr;
+
+static ssize_t pdc_firmware_read_rom(struct file *filp, struct kobject *kobj,
+				     struct bin_attribute *attr, char *buf,
+				     loff_t off, size_t count)
+{
+	int size = attr->size;
+
+	if (off >= size)
+		count = 0;
+	else {
+		if (off + count > size)
+			count = size - off;
+
+		memcpy_fromio(buf, attr->private + off, count);
+	}
+	return count;
+}
+
+static int __init pdc_firmware_register_sysfs(void)
+{
+	struct bin_attribute *attr;
+	int size, err = -ENOMEM;
+
+	attr = kzalloc(sizeof(*attr), 0);
+	if (!attr)
+		return -ENOMEM;
+
+	size = 1048576; // FIXME
+
+	sysfs_bin_attr_init(attr);
+
+	attr->size = size;
+	attr->attr.name = "pdcrom";
+	attr->attr.mode = S_IRUSR;
+	attr->read = pdc_firmware_read_rom;
+#ifdef CONFIG_64BIT
+	attr->private = ioremap(0xfffffff0f0000000, size);
+#else
+	attr->private = ioremap(0xf0000000, size);
+#endif
+	if (!attr->private)
+		goto err_attr;
+
+	err = sysfs_create_bin_file(firmware_kobj, attr);
+	if (err)
+		goto err_unmap;
+
+	pdc_firmware_attr = attr;
+	return 0;
+
+err_unmap:
+	iounmap(attr->private);
+err_attr:
+	kfree(attr);
+	return err;
+}
+
+static int __init pdc_firmware_init(void)
+{
+	return pdc_firmware_register_sysfs();
+}
+
+static void __exit pdc_firmware_exit(void)
+{
+	struct pdc_firmware_priv *priv = pdc_firmware_attr->private;
+
+	sysfs_remove_bin_file(firmware_kobj, pdc_firmware_attr);
+	iounmap(pdc_firmware_attr->private);
+	kfree(priv);
+	kfree(pdc_firmware_attr);
+}
+
+module_init(pdc_firmware_init);
+module_exit(pdc_firmware_exit);
+MODULE_AUTHOR("Sven Schnelle <svens@stackframe.org>");
+MODULE_LICENSE("GPL");
-- 
2.20.1

