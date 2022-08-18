Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1541A598E9D
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Aug 2022 23:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346417AbiHRVCA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 18 Aug 2022 17:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346325AbiHRVA4 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 18 Aug 2022 17:00:56 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08324D3E63
        for <linux-parisc@vger.kernel.org>; Thu, 18 Aug 2022 14:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=J+0LuYx4zBx/Bh2jF35dBkAziTr
        xR6PRQC6seCfIfWU=; b=aq/yzEMZGo+yIXj5dh24sLW6ukFlsNvmltGdN3ewT5i
        4gywVvcghvPraivTMzwJhR5Ueih3AEnbi5ES3zXBkIBZhDoB/ba6ZOOzsdECAdDX
        wt4963lQMly8x2S4/y6BBLb/aTYh2KUf5a2At+UgVOcfe4qp6TvPPJjZSvOau/Q8
        =
Received: (qmail 3960345 invoked from network); 18 Aug 2022 23:00:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Aug 2022 23:00:22 +0200
X-UD-Smtp-Session: l3s3148p1@5uQSRYrmbKYucref
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Nick Dyer <nick@shmanahar.org>, linux-input@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH] Input: move from strlcpy with unused retval to strscpy
Date:   Thu, 18 Aug 2022 23:00:19 +0200
Message-Id: <20220818210022.6865-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Follow the advice of the below link and prefer 'strscpy' in this
subsystem. Conversion is 1:1 because the return value is not used.
Generated by a coccinelle script.

Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/input/keyboard/lkkbd.c             |  8 ++++----
 drivers/input/misc/keyspan_remote.c        |  2 +-
 drivers/input/mouse/hgpk.c                 |  2 +-
 drivers/input/mouse/synaptics.c            |  4 ++--
 drivers/input/mouse/synaptics_usb.c        |  2 +-
 drivers/input/mouse/vsxxxaa.c              |  4 ++--
 drivers/input/rmi4/rmi_f03.c               |  2 +-
 drivers/input/rmi4/rmi_f54.c               |  8 ++++----
 drivers/input/serio/altera_ps2.c           |  4 ++--
 drivers/input/serio/ambakmi.c              |  4 ++--
 drivers/input/serio/ams_delta_serio.c      |  4 ++--
 drivers/input/serio/apbps2.c               |  2 +-
 drivers/input/serio/ct82c710.c             |  2 +-
 drivers/input/serio/gscps2.c               |  2 +-
 drivers/input/serio/hyperv-keyboard.c      |  4 ++--
 drivers/input/serio/i8042-x86ia64io.h      |  6 +++---
 drivers/input/serio/i8042.c                | 14 +++++++-------
 drivers/input/serio/olpc_apsp.c            |  8 ++++----
 drivers/input/serio/parkbd.c               |  2 +-
 drivers/input/serio/pcips2.c               |  4 ++--
 drivers/input/serio/ps2-gpio.c             |  4 ++--
 drivers/input/serio/ps2mult.c              |  2 +-
 drivers/input/serio/q40kbd.c               |  4 ++--
 drivers/input/serio/rpckbd.c               |  4 ++--
 drivers/input/serio/sa1111ps2.c            |  4 ++--
 drivers/input/serio/serport.c              |  2 +-
 drivers/input/serio/sun4i-ps2.c            |  4 ++--
 drivers/input/tablet/acecad.c              |  2 +-
 drivers/input/tablet/hanwang.c             |  2 +-
 drivers/input/tablet/pegasus_notetaker.c   |  2 +-
 drivers/input/touchscreen/atmel_mxt_ts.c   |  8 ++++----
 drivers/input/touchscreen/edt-ft5x06.c     | 12 ++++++------
 drivers/input/touchscreen/sur40.c          |  6 +++---
 drivers/input/touchscreen/usbtouchscreen.c |  2 +-
 drivers/input/touchscreen/wacom_w8001.c    |  6 +++---
 35 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/drivers/input/keyboard/lkkbd.c b/drivers/input/keyboard/lkkbd.c
index e4a1839ca934..ea9a1d8834c1 100644
--- a/drivers/input/keyboard/lkkbd.c
+++ b/drivers/input/keyboard/lkkbd.c
@@ -359,18 +359,18 @@ static void lkkbd_detection_done(struct lkkbd *lk)
 	 */
 	switch (lk->id[4]) {
 	case 1:
-		strlcpy(lk->name, "DEC LK201 keyboard", sizeof(lk->name));
+		strscpy(lk->name, "DEC LK201 keyboard", sizeof(lk->name));
 
 		if (lk201_compose_is_alt)
 			lk->keycode[0xb1] = KEY_LEFTALT;
 		break;
 
 	case 2:
-		strlcpy(lk->name, "DEC LK401 keyboard", sizeof(lk->name));
+		strscpy(lk->name, "DEC LK401 keyboard", sizeof(lk->name));
 		break;
 
 	default:
-		strlcpy(lk->name, "Unknown DEC keyboard", sizeof(lk->name));
+		strscpy(lk->name, "Unknown DEC keyboard", sizeof(lk->name));
 		printk(KERN_ERR
 			"lkkbd: keyboard on %s is unknown, please report to "
 			"Jan-Benedict Glaw <jbglaw@lug-owl.de>\n", lk->phys);
@@ -626,7 +626,7 @@ static int lkkbd_connect(struct serio *serio, struct serio_driver *drv)
 	lk->ctrlclick_volume = ctrlclick_volume;
 	memcpy(lk->keycode, lkkbd_keycode, sizeof(lk->keycode));
 
-	strlcpy(lk->name, "DEC LK keyboard", sizeof(lk->name));
+	strscpy(lk->name, "DEC LK keyboard", sizeof(lk->name));
 	snprintf(lk->phys, sizeof(lk->phys), "%s/input0", serio->phys);
 
 	input_dev->name = lk->name;
diff --git a/drivers/input/misc/keyspan_remote.c b/drivers/input/misc/keyspan_remote.c
index 4650f4a94989..bee4b1376491 100644
--- a/drivers/input/misc/keyspan_remote.c
+++ b/drivers/input/misc/keyspan_remote.c
@@ -485,7 +485,7 @@ static int keyspan_probe(struct usb_interface *interface, const struct usb_devic
 	}
 
 	if (udev->manufacturer)
-		strlcpy(remote->name, udev->manufacturer, sizeof(remote->name));
+		strscpy(remote->name, udev->manufacturer, sizeof(remote->name));
 
 	if (udev->product) {
 		if (udev->manufacturer)
diff --git a/drivers/input/mouse/hgpk.c b/drivers/input/mouse/hgpk.c
index 4dc441309aac..523b26a117d6 100644
--- a/drivers/input/mouse/hgpk.c
+++ b/drivers/input/mouse/hgpk.c
@@ -1057,7 +1057,7 @@ void hgpk_module_init(void)
 						strlen(hgpk_mode_name));
 	if (hgpk_default_mode == HGPK_MODE_INVALID) {
 		hgpk_default_mode = HGPK_MODE_MOUSE;
-		strlcpy(hgpk_mode_name, hgpk_mode_names[HGPK_MODE_MOUSE],
+		strscpy(hgpk_mode_name, hgpk_mode_names[HGPK_MODE_MOUSE],
 			sizeof(hgpk_mode_name));
 	}
 }
diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 434d48ae4b12..e3f657713b55 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -715,8 +715,8 @@ static void synaptics_pt_create(struct psmouse *psmouse)
 	}
 
 	serio->id.type = SERIO_PS_PSTHRU;
-	strlcpy(serio->name, "Synaptics pass-through", sizeof(serio->name));
-	strlcpy(serio->phys, "synaptics-pt/serio0", sizeof(serio->phys));
+	strscpy(serio->name, "Synaptics pass-through", sizeof(serio->name));
+	strscpy(serio->phys, "synaptics-pt/serio0", sizeof(serio->phys));
 	serio->write = synaptics_pt_write;
 	serio->start = synaptics_pt_start;
 	serio->stop = synaptics_pt_stop;
diff --git a/drivers/input/mouse/synaptics_usb.c b/drivers/input/mouse/synaptics_usb.c
index b5ff27e32a0c..75e45f3ae675 100644
--- a/drivers/input/mouse/synaptics_usb.c
+++ b/drivers/input/mouse/synaptics_usb.c
@@ -354,7 +354,7 @@ static int synusb_probe(struct usb_interface *intf,
 	synusb->urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
 
 	if (udev->manufacturer)
-		strlcpy(synusb->name, udev->manufacturer,
+		strscpy(synusb->name, udev->manufacturer,
 			sizeof(synusb->name));
 
 	if (udev->product) {
diff --git a/drivers/input/mouse/vsxxxaa.c b/drivers/input/mouse/vsxxxaa.c
index bd415f4b574e..3bd6e723a422 100644
--- a/drivers/input/mouse/vsxxxaa.c
+++ b/drivers/input/mouse/vsxxxaa.c
@@ -138,12 +138,12 @@ static void vsxxxaa_detection_done(struct vsxxxaa *mouse)
 {
 	switch (mouse->type) {
 	case 0x02:
-		strlcpy(mouse->name, "DEC VSXXX-AA/-GA mouse",
+		strscpy(mouse->name, "DEC VSXXX-AA/-GA mouse",
 			sizeof(mouse->name));
 		break;
 
 	case 0x04:
-		strlcpy(mouse->name, "DEC VSXXX-AB digitizer",
+		strscpy(mouse->name, "DEC VSXXX-AB digitizer",
 			sizeof(mouse->name));
 		break;
 
diff --git a/drivers/input/rmi4/rmi_f03.c b/drivers/input/rmi4/rmi_f03.c
index c194b1664b10..1e11ea30d7bd 100644
--- a/drivers/input/rmi4/rmi_f03.c
+++ b/drivers/input/rmi4/rmi_f03.c
@@ -181,7 +181,7 @@ static int rmi_f03_register_pt(struct f03_data *f03)
 	serio->close = rmi_f03_pt_close;
 	serio->port_data = f03;
 
-	strlcpy(serio->name, "RMI4 PS/2 pass-through", sizeof(serio->name));
+	strscpy(serio->name, "RMI4 PS/2 pass-through", sizeof(serio->name));
 	snprintf(serio->phys, sizeof(serio->phys), "%s/serio0",
 		 dev_name(&f03->fn->dev));
 	serio->dev.parent = &f03->fn->dev;
diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index c5ce907535ef..5c3da910b5b2 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -390,8 +390,8 @@ static int rmi_f54_vidioc_querycap(struct file *file, void *priv,
 {
 	struct f54_data *f54 = video_drvdata(file);
 
-	strlcpy(cap->driver, F54_NAME, sizeof(cap->driver));
-	strlcpy(cap->card, SYNAPTICS_INPUT_DEVICE_NAME, sizeof(cap->card));
+	strscpy(cap->driver, F54_NAME, sizeof(cap->driver));
+	strscpy(cap->card, SYNAPTICS_INPUT_DEVICE_NAME, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
 		"rmi4:%s", dev_name(&f54->fn->dev));
 
@@ -410,7 +410,7 @@ static int rmi_f54_vidioc_enum_input(struct file *file, void *priv,
 
 	i->type = V4L2_INPUT_TYPE_TOUCH;
 
-	strlcpy(i->name, rmi_f54_report_type_names[reptype], sizeof(i->name));
+	strscpy(i->name, rmi_f54_report_type_names[reptype], sizeof(i->name));
 	return 0;
 }
 
@@ -696,7 +696,7 @@ static int rmi_f54_probe(struct rmi_function *fn)
 	rmi_f54_set_input(f54, 0);
 
 	/* register video device */
-	strlcpy(f54->v4l2.name, F54_NAME, sizeof(f54->v4l2.name));
+	strscpy(f54->v4l2.name, F54_NAME, sizeof(f54->v4l2.name));
 	ret = v4l2_device_register(&fn->dev, &f54->v4l2);
 	if (ret) {
 		dev_err(&fn->dev, "Unable to register video dev.\n");
diff --git a/drivers/input/serio/altera_ps2.c b/drivers/input/serio/altera_ps2.c
index 379e9240c2b3..3a92304f64fb 100644
--- a/drivers/input/serio/altera_ps2.c
+++ b/drivers/input/serio/altera_ps2.c
@@ -110,8 +110,8 @@ static int altera_ps2_probe(struct platform_device *pdev)
 	serio->write		= altera_ps2_write;
 	serio->open		= altera_ps2_open;
 	serio->close		= altera_ps2_close;
-	strlcpy(serio->name, dev_name(&pdev->dev), sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(&pdev->dev), sizeof(serio->phys));
+	strscpy(serio->name, dev_name(&pdev->dev), sizeof(serio->name));
+	strscpy(serio->phys, dev_name(&pdev->dev), sizeof(serio->phys));
 	serio->port_data	= ps2if;
 	serio->dev.parent	= &pdev->dev;
 	ps2if->io		= serio;
diff --git a/drivers/input/serio/ambakmi.c b/drivers/input/serio/ambakmi.c
index 4408245b61d2..c391700fc4ae 100644
--- a/drivers/input/serio/ambakmi.c
+++ b/drivers/input/serio/ambakmi.c
@@ -126,8 +126,8 @@ static int amba_kmi_probe(struct amba_device *dev,
 	io->write	= amba_kmi_write;
 	io->open	= amba_kmi_open;
 	io->close	= amba_kmi_close;
-	strlcpy(io->name, dev_name(&dev->dev), sizeof(io->name));
-	strlcpy(io->phys, dev_name(&dev->dev), sizeof(io->phys));
+	strscpy(io->name, dev_name(&dev->dev), sizeof(io->name));
+	strscpy(io->phys, dev_name(&dev->dev), sizeof(io->phys));
 	io->port_data	= kmi;
 	io->dev.parent	= &dev->dev;
 
diff --git a/drivers/input/serio/ams_delta_serio.c b/drivers/input/serio/ams_delta_serio.c
index 1c0be299f179..ec93cb4573c3 100644
--- a/drivers/input/serio/ams_delta_serio.c
+++ b/drivers/input/serio/ams_delta_serio.c
@@ -159,8 +159,8 @@ static int ams_delta_serio_init(struct platform_device *pdev)
 	serio->id.type = SERIO_8042;
 	serio->open = ams_delta_serio_open;
 	serio->close = ams_delta_serio_close;
-	strlcpy(serio->name, "AMS DELTA keyboard adapter", sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(&pdev->dev), sizeof(serio->phys));
+	strscpy(serio->name, "AMS DELTA keyboard adapter", sizeof(serio->name));
+	strscpy(serio->phys, dev_name(&pdev->dev), sizeof(serio->phys));
 	serio->dev.parent = &pdev->dev;
 	serio->port_data = priv;
 
diff --git a/drivers/input/serio/apbps2.c b/drivers/input/serio/apbps2.c
index 974d7bfae0a0..9c9ce097f8bf 100644
--- a/drivers/input/serio/apbps2.c
+++ b/drivers/input/serio/apbps2.c
@@ -176,7 +176,7 @@ static int apbps2_of_probe(struct platform_device *ofdev)
 	priv->io->close = apbps2_close;
 	priv->io->write = apbps2_write;
 	priv->io->port_data = priv;
-	strlcpy(priv->io->name, "APBPS2 PS/2", sizeof(priv->io->name));
+	strscpy(priv->io->name, "APBPS2 PS/2", sizeof(priv->io->name));
 	snprintf(priv->io->phys, sizeof(priv->io->phys),
 		 "apbps2_%d", apbps2_idx++);
 
diff --git a/drivers/input/serio/ct82c710.c b/drivers/input/serio/ct82c710.c
index d45009d654bf..752ce60e2211 100644
--- a/drivers/input/serio/ct82c710.c
+++ b/drivers/input/serio/ct82c710.c
@@ -170,7 +170,7 @@ static int ct82c710_probe(struct platform_device *dev)
 	ct82c710_port->open = ct82c710_open;
 	ct82c710_port->close = ct82c710_close;
 	ct82c710_port->write = ct82c710_write;
-	strlcpy(ct82c710_port->name, "C&T 82c710 mouse port",
+	strscpy(ct82c710_port->name, "C&T 82c710 mouse port",
 		sizeof(ct82c710_port->name));
 	snprintf(ct82c710_port->phys, sizeof(ct82c710_port->phys),
 		 "isa%16llx/serio0", (unsigned long long)CT82C710_DATA);
diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index da2c67cb8642..633c7de49d67 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -361,7 +361,7 @@ static int __init gscps2_probe(struct parisc_device *dev)
 
 	snprintf(serio->name, sizeof(serio->name), "gsc-ps2-%s",
 		 (ps2port->id == GSC_ID_KEYBOARD) ? "keyboard" : "mouse");
-	strlcpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
+	strscpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
 	serio->id.type		= SERIO_8042;
 	serio->write		= gscps2_write;
 	serio->open		= gscps2_open;
diff --git a/drivers/input/serio/hyperv-keyboard.c b/drivers/input/serio/hyperv-keyboard.c
index 1a7b72a9016d..d62aefb2e245 100644
--- a/drivers/input/serio/hyperv-keyboard.c
+++ b/drivers/input/serio/hyperv-keyboard.c
@@ -334,9 +334,9 @@ static int hv_kbd_probe(struct hv_device *hv_dev,
 	hv_serio->dev.parent  = &hv_dev->device;
 	hv_serio->id.type = SERIO_8042_XL;
 	hv_serio->port_data = kbd_dev;
-	strlcpy(hv_serio->name, dev_name(&hv_dev->device),
+	strscpy(hv_serio->name, dev_name(&hv_dev->device),
 		sizeof(hv_serio->name));
-	strlcpy(hv_serio->phys, dev_name(&hv_dev->device),
+	strscpy(hv_serio->phys, dev_name(&hv_dev->device),
 		sizeof(hv_serio->phys));
 
 	hv_serio->start = hv_kbd_start;
diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index 4fbec7bbecca..732b7a6b315d 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -1300,7 +1300,7 @@ static char i8042_pnp_aux_name[32];
 
 static void i8042_pnp_id_to_string(struct pnp_id *id, char *dst, int dst_size)
 {
-	strlcpy(dst, "PNP:", dst_size);
+	strscpy(dst, "PNP:", dst_size);
 
 	while (id) {
 		strlcat(dst, " ", dst_size);
@@ -1320,7 +1320,7 @@ static int i8042_pnp_kbd_probe(struct pnp_dev *dev, const struct pnp_device_id *
 	if (pnp_irq_valid(dev,0))
 		i8042_pnp_kbd_irq = pnp_irq(dev, 0);
 
-	strlcpy(i8042_pnp_kbd_name, did->id, sizeof(i8042_pnp_kbd_name));
+	strscpy(i8042_pnp_kbd_name, did->id, sizeof(i8042_pnp_kbd_name));
 	if (strlen(pnp_dev_name(dev))) {
 		strlcat(i8042_pnp_kbd_name, ":", sizeof(i8042_pnp_kbd_name));
 		strlcat(i8042_pnp_kbd_name, pnp_dev_name(dev), sizeof(i8042_pnp_kbd_name));
@@ -1347,7 +1347,7 @@ static int i8042_pnp_aux_probe(struct pnp_dev *dev, const struct pnp_device_id *
 	if (pnp_irq_valid(dev, 0))
 		i8042_pnp_aux_irq = pnp_irq(dev, 0);
 
-	strlcpy(i8042_pnp_aux_name, did->id, sizeof(i8042_pnp_aux_name));
+	strscpy(i8042_pnp_aux_name, did->id, sizeof(i8042_pnp_aux_name));
 	if (strlen(pnp_dev_name(dev))) {
 		strlcat(i8042_pnp_aux_name, ":", sizeof(i8042_pnp_aux_name));
 		strlcat(i8042_pnp_aux_name, pnp_dev_name(dev), sizeof(i8042_pnp_aux_name));
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 3fc0a89cc785..f9486495baef 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -1341,9 +1341,9 @@ static int i8042_create_kbd_port(void)
 	serio->ps2_cmd_mutex	= &i8042_mutex;
 	serio->port_data	= port;
 	serio->dev.parent	= &i8042_platform_device->dev;
-	strlcpy(serio->name, "i8042 KBD port", sizeof(serio->name));
-	strlcpy(serio->phys, I8042_KBD_PHYS_DESC, sizeof(serio->phys));
-	strlcpy(serio->firmware_id, i8042_kbd_firmware_id,
+	strscpy(serio->name, "i8042 KBD port", sizeof(serio->name));
+	strscpy(serio->phys, I8042_KBD_PHYS_DESC, sizeof(serio->phys));
+	strscpy(serio->firmware_id, i8042_kbd_firmware_id,
 		sizeof(serio->firmware_id));
 	set_primary_fwnode(&serio->dev, i8042_kbd_fwnode);
 
@@ -1371,15 +1371,15 @@ static int i8042_create_aux_port(int idx)
 	serio->port_data	= port;
 	serio->dev.parent	= &i8042_platform_device->dev;
 	if (idx < 0) {
-		strlcpy(serio->name, "i8042 AUX port", sizeof(serio->name));
-		strlcpy(serio->phys, I8042_AUX_PHYS_DESC, sizeof(serio->phys));
-		strlcpy(serio->firmware_id, i8042_aux_firmware_id,
+		strscpy(serio->name, "i8042 AUX port", sizeof(serio->name));
+		strscpy(serio->phys, I8042_AUX_PHYS_DESC, sizeof(serio->phys));
+		strscpy(serio->firmware_id, i8042_aux_firmware_id,
 			sizeof(serio->firmware_id));
 		serio->close = i8042_port_close;
 	} else {
 		snprintf(serio->name, sizeof(serio->name), "i8042 AUX%d port", idx);
 		snprintf(serio->phys, sizeof(serio->phys), I8042_MUX_PHYS_DESC, idx + 1);
-		strlcpy(serio->firmware_id, i8042_aux_firmware_id,
+		strscpy(serio->firmware_id, i8042_aux_firmware_id,
 			sizeof(serio->firmware_id));
 	}
 
diff --git a/drivers/input/serio/olpc_apsp.c b/drivers/input/serio/olpc_apsp.c
index 59de8d9b6710..04d2db982fb8 100644
--- a/drivers/input/serio/olpc_apsp.c
+++ b/drivers/input/serio/olpc_apsp.c
@@ -199,8 +199,8 @@ static int olpc_apsp_probe(struct platform_device *pdev)
 	kb_serio->close		= olpc_apsp_close;
 	kb_serio->port_data	= priv;
 	kb_serio->dev.parent	= &pdev->dev;
-	strlcpy(kb_serio->name, "sp keyboard", sizeof(kb_serio->name));
-	strlcpy(kb_serio->phys, "sp/serio0", sizeof(kb_serio->phys));
+	strscpy(kb_serio->name, "sp keyboard", sizeof(kb_serio->name));
+	strscpy(kb_serio->phys, "sp/serio0", sizeof(kb_serio->phys));
 	priv->kbio		= kb_serio;
 	serio_register_port(kb_serio);
 
@@ -216,8 +216,8 @@ static int olpc_apsp_probe(struct platform_device *pdev)
 	pad_serio->close	= olpc_apsp_close;
 	pad_serio->port_data	= priv;
 	pad_serio->dev.parent	= &pdev->dev;
-	strlcpy(pad_serio->name, "sp touchpad", sizeof(pad_serio->name));
-	strlcpy(pad_serio->phys, "sp/serio1", sizeof(pad_serio->phys));
+	strscpy(pad_serio->name, "sp touchpad", sizeof(pad_serio->name));
+	strscpy(pad_serio->phys, "sp/serio1", sizeof(pad_serio->phys));
 	priv->padio		= pad_serio;
 	serio_register_port(pad_serio);
 
diff --git a/drivers/input/serio/parkbd.c b/drivers/input/serio/parkbd.c
index 51b68501896c..0d54895428f5 100644
--- a/drivers/input/serio/parkbd.c
+++ b/drivers/input/serio/parkbd.c
@@ -169,7 +169,7 @@ static struct serio *parkbd_allocate_serio(void)
 	if (serio) {
 		serio->id.type = parkbd_mode;
 		serio->write = parkbd_write;
-		strlcpy(serio->name, "PARKBD AT/XT keyboard adapter", sizeof(serio->name));
+		strscpy(serio->name, "PARKBD AT/XT keyboard adapter", sizeof(serio->name));
 		snprintf(serio->phys, sizeof(serio->phys), "%s/serio0", parkbd_dev->port->name);
 	}
 
diff --git a/drivers/input/serio/pcips2.c b/drivers/input/serio/pcips2.c
index bedf75de0a2c..05878750f2c2 100644
--- a/drivers/input/serio/pcips2.c
+++ b/drivers/input/serio/pcips2.c
@@ -149,8 +149,8 @@ static int pcips2_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	serio->write		= pcips2_write;
 	serio->open		= pcips2_open;
 	serio->close		= pcips2_close;
-	strlcpy(serio->name, pci_name(dev), sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
+	strscpy(serio->name, pci_name(dev), sizeof(serio->name));
+	strscpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
 	serio->port_data	= ps2if;
 	serio->dev.parent	= &dev->dev;
 	ps2if->io		= serio;
diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
index 9b02dd5dd2b9..bc1dc484389b 100644
--- a/drivers/input/serio/ps2-gpio.c
+++ b/drivers/input/serio/ps2-gpio.c
@@ -449,8 +449,8 @@ static int ps2_gpio_probe(struct platform_device *pdev)
 	serio->write = drvdata->write_enable ? ps2_gpio_write : NULL;
 	serio->port_data = drvdata;
 	serio->dev.parent = dev;
-	strlcpy(serio->name, dev_name(dev), sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(dev), sizeof(serio->phys));
+	strscpy(serio->name, dev_name(dev), sizeof(serio->name));
+	strscpy(serio->phys, dev_name(dev), sizeof(serio->phys));
 
 	drvdata->serio = serio;
 	drvdata->dev = dev;
diff --git a/drivers/input/serio/ps2mult.c b/drivers/input/serio/ps2mult.c
index 0071dd5ebcc2..902e81826fbf 100644
--- a/drivers/input/serio/ps2mult.c
+++ b/drivers/input/serio/ps2mult.c
@@ -131,7 +131,7 @@ static int ps2mult_create_port(struct ps2mult *psm, int i)
 	if (!serio)
 		return -ENOMEM;
 
-	strlcpy(serio->name, "TQC PS/2 Multiplexer", sizeof(serio->name));
+	strscpy(serio->name, "TQC PS/2 Multiplexer", sizeof(serio->name));
 	snprintf(serio->phys, sizeof(serio->phys),
 		 "%s/port%d", mx_serio->phys, i);
 	serio->id.type = SERIO_8042;
diff --git a/drivers/input/serio/q40kbd.c b/drivers/input/serio/q40kbd.c
index bd248398556a..a1c61f5de047 100644
--- a/drivers/input/serio/q40kbd.c
+++ b/drivers/input/serio/q40kbd.c
@@ -126,8 +126,8 @@ static int q40kbd_probe(struct platform_device *pdev)
 	port->close = q40kbd_close;
 	port->port_data = q40kbd;
 	port->dev.parent = &pdev->dev;
-	strlcpy(port->name, "Q40 Kbd Port", sizeof(port->name));
-	strlcpy(port->phys, "Q40", sizeof(port->phys));
+	strscpy(port->name, "Q40 Kbd Port", sizeof(port->name));
+	strscpy(port->phys, "Q40", sizeof(port->phys));
 
 	q40kbd_stop();
 
diff --git a/drivers/input/serio/rpckbd.c b/drivers/input/serio/rpckbd.c
index 37fe6a5711ea..7008bc101415 100644
--- a/drivers/input/serio/rpckbd.c
+++ b/drivers/input/serio/rpckbd.c
@@ -128,8 +128,8 @@ static int rpckbd_probe(struct platform_device *dev)
 	serio->close		= rpckbd_close;
 	serio->dev.parent	= &dev->dev;
 	serio->port_data	= rpckbd;
-	strlcpy(serio->name, "RiscPC PS/2 kbd port", sizeof(serio->name));
-	strlcpy(serio->phys, "rpckbd/serio0", sizeof(serio->phys));
+	strscpy(serio->name, "RiscPC PS/2 kbd port", sizeof(serio->name));
+	strscpy(serio->phys, "rpckbd/serio0", sizeof(serio->phys));
 
 	platform_set_drvdata(dev, serio);
 	serio_register_port(serio);
diff --git a/drivers/input/serio/sa1111ps2.c b/drivers/input/serio/sa1111ps2.c
index 68fac4801e2e..2724c3aa512c 100644
--- a/drivers/input/serio/sa1111ps2.c
+++ b/drivers/input/serio/sa1111ps2.c
@@ -267,8 +267,8 @@ static int ps2_probe(struct sa1111_dev *dev)
 	serio->write		= ps2_write;
 	serio->open		= ps2_open;
 	serio->close		= ps2_close;
-	strlcpy(serio->name, dev_name(&dev->dev), sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
+	strscpy(serio->name, dev_name(&dev->dev), sizeof(serio->name));
+	strscpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
 	serio->port_data	= ps2if;
 	serio->dev.parent	= &dev->dev;
 	ps2if->io		= serio;
diff --git a/drivers/input/serio/serport.c b/drivers/input/serio/serport.c
index 669a728095b8..7f7ef0e3a749 100644
--- a/drivers/input/serio/serport.c
+++ b/drivers/input/serio/serport.c
@@ -171,7 +171,7 @@ static ssize_t serport_ldisc_read(struct tty_struct * tty, struct file * file,
 	if (!serio)
 		return -ENOMEM;
 
-	strlcpy(serio->name, "Serial port", sizeof(serio->name));
+	strscpy(serio->name, "Serial port", sizeof(serio->name));
 	snprintf(serio->phys, sizeof(serio->phys), "%s/serio0", tty_name(tty));
 	serio->id = serport->id;
 	serio->id.type = SERIO_RS232;
diff --git a/drivers/input/serio/sun4i-ps2.c b/drivers/input/serio/sun4i-ps2.c
index f15ed3dcdb9b..eb262640192e 100644
--- a/drivers/input/serio/sun4i-ps2.c
+++ b/drivers/input/serio/sun4i-ps2.c
@@ -256,8 +256,8 @@ static int sun4i_ps2_probe(struct platform_device *pdev)
 	serio->close = sun4i_ps2_close;
 	serio->port_data = drvdata;
 	serio->dev.parent = dev;
-	strlcpy(serio->name, dev_name(dev), sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(dev), sizeof(serio->phys));
+	strscpy(serio->name, dev_name(dev), sizeof(serio->name));
+	strscpy(serio->phys, dev_name(dev), sizeof(serio->phys));
 
 	/* shutoff interrupt */
 	writel(0, drvdata->reg_base + PS2_REG_GCTL);
diff --git a/drivers/input/tablet/acecad.c b/drivers/input/tablet/acecad.c
index 56c7e471ac32..80e06727464d 100644
--- a/drivers/input/tablet/acecad.c
+++ b/drivers/input/tablet/acecad.c
@@ -155,7 +155,7 @@ static int usb_acecad_probe(struct usb_interface *intf, const struct usb_device_
 	acecad->input = input_dev;
 
 	if (dev->manufacturer)
-		strlcpy(acecad->name, dev->manufacturer, sizeof(acecad->name));
+		strscpy(acecad->name, dev->manufacturer, sizeof(acecad->name));
 
 	if (dev->product) {
 		if (dev->manufacturer)
diff --git a/drivers/input/tablet/hanwang.c b/drivers/input/tablet/hanwang.c
index 6d58443bb3e9..e492a0331b24 100644
--- a/drivers/input/tablet/hanwang.c
+++ b/drivers/input/tablet/hanwang.c
@@ -356,7 +356,7 @@ static int hanwang_probe(struct usb_interface *intf, const struct usb_device_id
 	usb_make_path(dev, hanwang->phys, sizeof(hanwang->phys));
 	strlcat(hanwang->phys, "/input0", sizeof(hanwang->phys));
 
-	strlcpy(hanwang->name, hanwang->features->name, sizeof(hanwang->name));
+	strscpy(hanwang->name, hanwang->features->name, sizeof(hanwang->name));
 	input_dev->name = hanwang->name;
 	input_dev->phys = hanwang->phys;
 	usb_to_input_id(dev, &input_dev->id);
diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index c608ac505d1b..d836d3dcc6a2 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -319,7 +319,7 @@ static int pegasus_probe(struct usb_interface *intf,
 	pegasus->irq->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
 
 	if (dev->manufacturer)
-		strlcpy(pegasus->name, dev->manufacturer,
+		strscpy(pegasus->name, dev->manufacturer,
 			sizeof(pegasus->name));
 
 	if (dev->product) {
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index eb66cd2689b7..e5cfceff3e36 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2497,8 +2497,8 @@ static int mxt_vidioc_querycap(struct file *file, void *priv,
 {
 	struct mxt_data *data = video_drvdata(file);
 
-	strlcpy(cap->driver, "atmel_mxt_ts", sizeof(cap->driver));
-	strlcpy(cap->card, "atmel_mxt_ts touch", sizeof(cap->card));
+	strscpy(cap->driver, "atmel_mxt_ts", sizeof(cap->driver));
+	strscpy(cap->card, "atmel_mxt_ts touch", sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
 		 "I2C:%s", dev_name(&data->client->dev));
 	return 0;
@@ -2514,11 +2514,11 @@ static int mxt_vidioc_enum_input(struct file *file, void *priv,
 
 	switch (i->index) {
 	case MXT_V4L_INPUT_REFS:
-		strlcpy(i->name, "Mutual Capacitance References",
+		strscpy(i->name, "Mutual Capacitance References",
 			sizeof(i->name));
 		break;
 	case MXT_V4L_INPUT_DELTAS:
-		strlcpy(i->name, "Mutual Capacitance Deltas", sizeof(i->name));
+		strscpy(i->name, "Mutual Capacitance Deltas", sizeof(i->name));
 		break;
 	}
 
diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 82beddb28761..70d595c5a667 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -912,8 +912,8 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 		p = strchr(rdbuf, '*');
 		if (p)
 			*p++ = '\0';
-		strlcpy(model_name, rdbuf + 1, EDT_NAME_LEN);
-		strlcpy(fw_version, p ? p : "", EDT_NAME_LEN);
+		strscpy(model_name, rdbuf + 1, EDT_NAME_LEN);
+		strscpy(fw_version, p ? p : "", EDT_NAME_LEN);
 	} else if (!strncasecmp(rdbuf, "EP0", 3)) {
 		tsdata->version = EDT_M12;
 
@@ -926,8 +926,8 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 		p = strchr(rdbuf, '*');
 		if (p)
 			*p++ = '\0';
-		strlcpy(model_name, rdbuf, EDT_NAME_LEN);
-		strlcpy(fw_version, p ? p : "", EDT_NAME_LEN);
+		strscpy(model_name, rdbuf, EDT_NAME_LEN);
+		strscpy(fw_version, p ? p : "", EDT_NAME_LEN);
 	} else {
 		/* If it is not an EDT M06/M12 touchscreen, then the model
 		 * detection is a bit hairy. The different ft5x06
@@ -945,7 +945,7 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 		if (error)
 			return error;
 
-		strlcpy(fw_version, rdbuf, 2);
+		strscpy(fw_version, rdbuf, 2);
 
 		error = edt_ft5x06_ts_readwrite(client, 1, "\xA8",
 						1, rdbuf);
@@ -981,7 +981,7 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 							1, rdbuf);
 			if (error)
 				return error;
-			strlcpy(fw_version, rdbuf, 1);
+			strscpy(fw_version, rdbuf, 1);
 			snprintf(model_name, EDT_NAME_LEN,
 				 "EVERVISION-FT5726NEi");
 			break;
diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 12f2562b0141..8ddb3f7d307a 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -939,8 +939,8 @@ static int sur40_vidioc_querycap(struct file *file, void *priv,
 {
 	struct sur40_state *sur40 = video_drvdata(file);
 
-	strlcpy(cap->driver, DRIVER_SHORT, sizeof(cap->driver));
-	strlcpy(cap->card, DRIVER_LONG, sizeof(cap->card));
+	strscpy(cap->driver, DRIVER_SHORT, sizeof(cap->driver));
+	strscpy(cap->card, DRIVER_LONG, sizeof(cap->card));
 	usb_make_path(sur40->usbdev, cap->bus_info, sizeof(cap->bus_info));
 	return 0;
 }
@@ -952,7 +952,7 @@ static int sur40_vidioc_enum_input(struct file *file, void *priv,
 		return -EINVAL;
 	i->type = V4L2_INPUT_TYPE_TOUCH;
 	i->std = V4L2_STD_UNKNOWN;
-	strlcpy(i->name, "In-Cell Sensor", sizeof(i->name));
+	strscpy(i->name, "In-Cell Sensor", sizeof(i->name));
 	i->capabilities = 0;
 	return 0;
 }
diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 3dda6eaabdab..d6d04b9f04fc 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -1708,7 +1708,7 @@ static int usbtouch_probe(struct usb_interface *intf,
 	usbtouch->input = input_dev;
 
 	if (udev->manufacturer)
-		strlcpy(usbtouch->name, udev->manufacturer, sizeof(usbtouch->name));
+		strscpy(usbtouch->name, udev->manufacturer, sizeof(usbtouch->name));
 
 	if (udev->product) {
 		if (udev->manufacturer)
diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touchscreen/wacom_w8001.c
index 691285ace228..928c5ee3ac36 100644
--- a/drivers/input/touchscreen/wacom_w8001.c
+++ b/drivers/input/touchscreen/wacom_w8001.c
@@ -625,7 +625,7 @@ static int w8001_connect(struct serio *serio, struct serio_driver *drv)
 	/* For backwards-compatibility we compose the basename based on
 	 * capabilities and then just append the tool type
 	 */
-	strlcpy(basename, "Wacom Serial", sizeof(basename));
+	strscpy(basename, "Wacom Serial", sizeof(basename));
 
 	err_pen = w8001_setup_pen(w8001, basename, sizeof(basename));
 	err_touch = w8001_setup_touch(w8001, basename, sizeof(basename));
@@ -635,7 +635,7 @@ static int w8001_connect(struct serio *serio, struct serio_driver *drv)
 	}
 
 	if (!err_pen) {
-		strlcpy(w8001->pen_name, basename, sizeof(w8001->pen_name));
+		strscpy(w8001->pen_name, basename, sizeof(w8001->pen_name));
 		strlcat(w8001->pen_name, " Pen", sizeof(w8001->pen_name));
 		input_dev_pen->name = w8001->pen_name;
 
@@ -651,7 +651,7 @@ static int w8001_connect(struct serio *serio, struct serio_driver *drv)
 	}
 
 	if (!err_touch) {
-		strlcpy(w8001->touch_name, basename, sizeof(w8001->touch_name));
+		strscpy(w8001->touch_name, basename, sizeof(w8001->touch_name));
 		strlcat(w8001->touch_name, " Finger",
 			sizeof(w8001->touch_name));
 		input_dev_touch->name = w8001->touch_name;
-- 
2.35.1

