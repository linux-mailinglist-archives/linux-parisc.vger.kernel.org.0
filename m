Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 867246070DA
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Oct 2022 09:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiJUHUz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 21 Oct 2022 03:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiJUHUy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 21 Oct 2022 03:20:54 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DFE24472F
        for <linux-parisc@vger.kernel.org>; Fri, 21 Oct 2022 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666336850;
        bh=U1qAUaxUwLof0kgz7r1VNvvv+lsnLtMM60u2lGmpqoY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=OPfLKyzPGBU2WPsl4hIVkkBCyLqO0/LweWnLLEhPygm770PyEKmP1u8USnBmtva01
         Ryr4U9nQcxRg3U68J9RvggWQ1o7X4aGQDZLkXLzXhpvz2CGXcgTCeUnQvYnaT52sBg
         da8YMHUhnklkzQm7xHvqWrWS+iPhnuhNH5znoWB8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.168.94]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdeR-1orbtf0zPp-00EhO5; Fri, 21
 Oct 2022 09:20:50 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] parisc: Use signed char for hardware path in pdc.h
Date:   Fri, 21 Oct 2022 09:20:38 +0200
Message-Id: <20221021072038.83248-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Nny1b/YxPjbTpVkS+2SpIZCAWFiisIA/Rp4cJk1X7QiqOo3XHy3
 mp4A7NZ12xg4lraN5zzMImofVK8DKj7MNed1gYnFnOJAWAD90/OjC5wl1ytyKRGnFRSfojq
 xHWgE8rTz65mhwy+6BMKJf2PAEFua4NHZTzjaMl8xTFacXCMr4q7MIP6ebG/b+GIFmOHllO
 ZdKfmkCHKUA4DldXp7lFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:acNH9/B/Hog=:PwMVe5KQ5mAVSd4xbgzDYP
 oJ60iBy8JvICf3L2eqzAtQ2VhR1sWisgnX2FLyszpxq2pL/AdDqD78qlNQs7roLpv8aLlVPbU
 /FCWCrn1FmenHWpFNyVV1agMGAvPOWrYh35vvkuO50Wrg+pyRnsweT/JJh8IbwILgJbd+IS2u
 J586drCbK7r4FlGaJrYWF9ILdvbFU635nn5YvZcC1PREwbbyuab971sn6t2FhgCaXU091K1cH
 Vn/ta+nblhw+62ePHIU09JP2lkMkNurwkEqOl+KhxxHgEDZSeaW75gfyfzJ75HvFYJ1l9XRF/
 P/htyRZwI8xIP8YuTLxf3nTK5SQja80xrvLofmXsUwpyz0dqM5tpqtKRG4J0k+L0JooMIwNGW
 O/6rTHTtuwplJgTjDE03Pspwx5XhytcxvizLan8KVMi9atkMb6GdP4jzz17XMukilnpeSFIiX
 T1XwQqJK1jV+Ey1c50QkWHVNeni30ctjH2lE7HVBLSKmUkeh+94Nv1oXuy9Jo5/1BOqioXf30
 XqYoxnaElIscETa96marqr1cJxvFWUBKUXhlCO7fNiJldDa4rlbN2pG7Dqu8VGQ4zNaap80nu
 BkkQii6+B7iu04rUSaT9GfryvCxYos6GfclqH7YWZwx4v80rty369UzXXtyvO8OOHkyvtQXgr
 sTtlzcUV23OU9oZkTYCCJYUlpk1ZDoSWH/dsgazcjh/haRMUCMOvWC+Rf5xMa6yq9qxkgju57
 0A86jh48B5mBOd6Zt3Rck0hMBtWkq5jSgkDTLEtmtA5nXC5kqJuIGYkxasQHDFvsBz2BXNH4N
 PvpDdUAmQM7kNPWN7JaoQ4rVzHdeX1UkB/J/hD7gUVg/+LwCMBgx5inlKjr6S2NjlK5yXtETe
 tBiRqWZm3K62L5ySIl3neSKQP8TmkDgPU8ZSS+HHaugPvpsTON+7kF1+OxQ620vhM89HPAWpl
 rgT6saiOPDbJz3dRdJhOcN6DNmHIjM/vH5fpvNafu2SB8vJNRpe/FCCrVjcyc5siyJfxGWk9c
 0PTFr7IgcgNEkMQHXGmYcW2H5ys2cmPkOtCwD7IhK063vcB6s3WaeeTR0VfY0vLM9EC6s8N95
 nuYElBeADX64QZOyV6/x5ovNkuNUxz9y3djjxiQ6eQwf77sUgj48kU178a1Wl62kcR5C7w6/A
 oF3QbRcvmEvOOah8q6SOBxU+vwcV0AWPpLELuNZuVJvcGn2nyLXsy1Utzp5aAhvTgN67ppz6a
 4n7YkSsFP//CLco/alv4ogS8/YJZQJFwm2O+D/ZQpQZJtrJKyiUTDLy5k6yVNEvFuGyMVvNBs
 KQp31xSoXtUTxVbH98KCS7qYh4NyVvvWH41kijAUmOoNBsBvIo+e3wPNqHB3Up+skQtfOdn8l
 wB5Gk3JTeGMH15r8jLB7svDURfG97t8h792KbkplOaR8ivFwCB+eItWGOzEviNOT1v/GctYZW
 JJ3Oo0L5n2AjCIsl+iRz2B0KD9Dn2YfZImJ4XkX2gBq4B5TKtH9UxWsd/Tw9AEZJi/WeNBd8Y
 JS/zkRI77Ya+PXEt3RZmlLW/hqDI2/juDv5oLiNKifyMg
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Clean up the struct for hardware_path and drop the struct device_path
with a proper assignment of bc[] and mod members as signed chars.

This patch prepares for the kbuild change from Jason A. Donenfeld to
treat char as always unsigned.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
=2D--
 arch/parisc/include/uapi/asm/pdc.h | 36 +++++++++++-------------------
 drivers/parisc/pdc_stable.c        | 34 ++++++++++++++--------------
 2 files changed, 30 insertions(+), 40 deletions(-)

diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi=
/asm/pdc.h
index e794e143ec5f..7a90070136e8 100644
=2D-- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -363,20 +363,25 @@

 #if !defined(__ASSEMBLY__)

-/* flags of the device_path */
+/* flags for hardware_path */
 #define	PF_AUTOBOOT	0x80
 #define	PF_AUTOSEARCH	0x40
 #define	PF_TIMER	0x0F

-struct device_path {		/* page 1-69 */
-	unsigned char flags;	/* flags see above! */
-	unsigned char bc[6];	/* bus converter routing info */
-	unsigned char mod;
-	unsigned int  layers[6];/* device-specific layer-info */
-} __attribute__((aligned(8))) ;
+struct hardware_path {
+	unsigned char flags;	/* see bit definitions below */
+	signed   char bc[6];	/* Bus Converter routing info to a specific */
+				/* I/O adaptor (< 0 means none, > 63 resvd) */
+	signed   char mod;	/* fixed field of specified module */
+};
+
+struct pdc_module_path {	/* page 1-69 */
+	struct hardware_path path;
+	unsigned int layers[6]; /* device-specific info (ctlr #, unit # ...) */
+} __attribute__((aligned(8)));

 struct pz_device {
-	struct	device_path dp;	/* see above */
+	struct pdc_module_path dp;	/* see above */
 	/* struct	iomod *hpa; */
 	unsigned int hpa;	/* HPA base address */
 	/* char	*spa; */
@@ -611,21 +616,6 @@ struct pdc_initiator { /* PDC_INITIATOR */
 	int mode;
 };

-struct hardware_path {
-	char  flags;	/* see bit definitions below */
-	char  bc[6];	/* Bus Converter routing info to a specific */
-			/* I/O adaptor (< 0 means none, > 63 resvd) */
-	char  mod;	/* fixed field of specified module */
-};
-
-/*
- * Device path specifications used by PDC.
- */
-struct pdc_module_path {
-	struct hardware_path path;
-	unsigned int layers[6]; /* device-specific info (ctlr #, unit # ...) */
-};
-
 /* Only used on some pre-PA2.0 boxes */
 struct pdc_memory_map {		/* PDC_MEMORY_MAP */
 	unsigned long hpa;	/* mod's register set address */
diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index d9e51036a4fa..d6af5726ddf3 100644
=2D-- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -14,7 +14,7 @@
  *    all) PA-RISC machines should have them. Anyway, for safety reasons,=
 the
  *    following code can deal with just 96 bytes of Stable Storage, and a=
ll
  *    sizes between 96 and 192 bytes (provided they are multiple of struc=
t
- *    device_path size, eg: 128, 160 and 192) to provide full information=
.
+ *    pdc_module_path size, eg: 128, 160 and 192) to provide full informa=
tion.
  *    One last word: there's one path we can always count on: the primary=
 path.
  *    Anything above 224 bytes is used for 'osdep2' OS-dependent storage =
area.
  *
@@ -88,7 +88,7 @@ struct pdcspath_entry {
 	short ready;			/* entry record is valid if !=3D 0 */
 	unsigned long addr;		/* entry address in stable storage */
 	char *name;			/* entry name */
-	struct device_path devpath;	/* device path in parisc representation */
+	struct pdc_module_path devpath;	/* device path in parisc representation =
*/
 	struct device *dev;		/* corresponding device */
 	struct kobject kobj;
 };
@@ -138,7 +138,7 @@ struct pdcspath_attribute paths_attr_##_name =3D { \
 static int
 pdcspath_fetch(struct pdcspath_entry *entry)
 {
-	struct device_path *devpath;
+	struct pdc_module_path *devpath;

 	if (!entry)
 		return -EINVAL;
@@ -153,7 +153,7 @@ pdcspath_fetch(struct pdcspath_entry *entry)
 		return -EIO;

 	/* Find the matching device.
-	   NOTE: hardware_path overlays with device_path, so the nice cast can
+	   NOTE: hardware_path overlays with pdc_module_path, so the nice cast c=
an
 	   be used */
 	entry->dev =3D hwpath_to_device((struct hardware_path *)devpath);

@@ -179,7 +179,7 @@ pdcspath_fetch(struct pdcspath_entry *entry)
 static void
 pdcspath_store(struct pdcspath_entry *entry)
 {
-	struct device_path *devpath;
+	struct pdc_module_path *devpath;

 	BUG_ON(!entry);

@@ -221,7 +221,7 @@ static ssize_t
 pdcspath_hwpath_read(struct pdcspath_entry *entry, char *buf)
 {
 	char *out =3D buf;
-	struct device_path *devpath;
+	struct pdc_module_path *devpath;
 	short i;

 	if (!entry || !buf)
@@ -236,11 +236,11 @@ pdcspath_hwpath_read(struct pdcspath_entry *entry, c=
har *buf)
 		return -ENODATA;

 	for (i =3D 0; i < 6; i++) {
-		if (devpath->bc[i] >=3D 128)
+		if (devpath->path.bc[i] < 0)
 			continue;
-		out +=3D sprintf(out, "%u/", (unsigned char)devpath->bc[i]);
+		out +=3D sprintf(out, "%d/", devpath->path.bc[i]);
 	}
-	out +=3D sprintf(out, "%u\n", (unsigned char)devpath->mod);
+	out +=3D sprintf(out, "%u\n", (unsigned char)devpath->path.mod);

 	return out - buf;
 }
@@ -296,12 +296,12 @@ pdcspath_hwpath_write(struct pdcspath_entry *entry, =
const char *buf, size_t coun
 	for (i=3D5; ((temp =3D strrchr(in, '/'))) && (temp-in > 0) && (likely(i)=
=29; i--) {
 		hwpath.bc[i] =3D simple_strtoul(temp+1, NULL, 10);
 		in[temp-in] =3D '\0';
-		DPRINTK("%s: bc[%d]: %d\n", __func__, i, hwpath.bc[i]);
+		DPRINTK("%s: bc[%d]: %d\n", __func__, i, hwpath.path.bc[i]);
 	}

 	/* Store the final field */
 	hwpath.bc[i] =3D simple_strtoul(in, NULL, 10);
-	DPRINTK("%s: bc[%d]: %d\n", __func__, i, hwpath.bc[i]);
+	DPRINTK("%s: bc[%d]: %d\n", __func__, i, hwpath.path.bc[i]);

 	/* Now we check that the user isn't trying to lure us */
 	if (!(dev =3D hwpath_to_device((struct hardware_path *)&hwpath))) {
@@ -342,7 +342,7 @@ static ssize_t
 pdcspath_layer_read(struct pdcspath_entry *entry, char *buf)
 {
 	char *out =3D buf;
-	struct device_path *devpath;
+	struct pdc_module_path *devpath;
 	short i;

 	if (!entry || !buf)
@@ -547,7 +547,7 @@ static ssize_t pdcs_auto_read(struct kobject *kobj,
 	pathentry =3D &pdcspath_entry_primary;

 	read_lock(&pathentry->rw_lock);
-	out +=3D sprintf(out, "%s\n", (pathentry->devpath.flags & knob) ?
+	out +=3D sprintf(out, "%s\n", (pathentry->devpath.path.flags & knob) ?
 					"On" : "Off");
 	read_unlock(&pathentry->rw_lock);

@@ -594,8 +594,8 @@ static ssize_t pdcs_timer_read(struct kobject *kobj,

 	/* print the timer value in seconds */
 	read_lock(&pathentry->rw_lock);
-	out +=3D sprintf(out, "%u\n", (pathentry->devpath.flags & PF_TIMER) ?
-				(1 << (pathentry->devpath.flags & PF_TIMER)) : 0);
+	out +=3D sprintf(out, "%u\n", (pathentry->devpath.path.flags & PF_TIMER)=
 ?
+				(1 << (pathentry->devpath.path.flags & PF_TIMER)) : 0);
 	read_unlock(&pathentry->rw_lock);

 	return out - buf;
@@ -764,7 +764,7 @@ static ssize_t pdcs_auto_write(struct kobject *kobj,

 	/* Be nice to the existing flag record */
 	read_lock(&pathentry->rw_lock);
-	flags =3D pathentry->devpath.flags;
+	flags =3D pathentry->devpath.path.flags;
 	read_unlock(&pathentry->rw_lock);

 	DPRINTK("%s: flags before: 0x%X\n", __func__, flags);
@@ -785,7 +785,7 @@ static ssize_t pdcs_auto_write(struct kobject *kobj,
 	write_lock(&pathentry->rw_lock);

 	/* Change the path entry flags first */
-	pathentry->devpath.flags =3D flags;
+	pathentry->devpath.path.flags =3D flags;

 	/* Now, dive in. Write back to the hardware */
 	pdcspath_store(pathentry);
=2D-
2.37.3

