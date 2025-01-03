Return-Path: <linux-parisc+bounces-3120-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E781A00D3F
	for <lists+linux-parisc@lfdr.de>; Fri,  3 Jan 2025 18:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F084C164B94
	for <lists+linux-parisc@lfdr.de>; Fri,  3 Jan 2025 17:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9867D1FC111;
	Fri,  3 Jan 2025 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyWFKc4H"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16B1FC10A;
	Fri,  3 Jan 2025 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735926707; cv=none; b=FPw3jQ9osHVSYf3NZ6B7Cz5f/ZHwpT/i6sgBSco9//L5FSiEC38iv0dfoomv2aZDsVlexkeONDyEsZW8DQXp9bYKNJkioGEZ1BBeG0cV+7z5sAK7Ce03d7v75zkp7VRXnYAE1QXkypIWDJ0Qcqwvirs6tjxSef/AhUPV0agQ6pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735926707; c=relaxed/simple;
	bh=s3W7MSv8p396xBco7vZv47Zh8azq9osxxAA67ZWxG28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ogBtBI8CfbEgD91aAlAA1ZdBhPX8OX8t4VFPcKaaUEkNzDm+dt9wTuSdDglNaYSHI/T6+Olo2iYMCauN5oJ7SC1cAsLJ49KO6Cl9ULaTn2RZMien7nrYLvZQq+hU/AL1N3ezqM1ctKTfwiKf8yE1ZgiMY8TQjhrhPvCZMKjnaBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyWFKc4H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E97C4CECE;
	Fri,  3 Jan 2025 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735926707;
	bh=s3W7MSv8p396xBco7vZv47Zh8azq9osxxAA67ZWxG28=;
	h=From:To:Cc:Subject:Date:From;
	b=XyWFKc4H72gRXLQzXcXAaKiSiCX7+8nglCo+TullgzIJJhfIRzEvDx9x0X40J21hD
	 6PokEwaFNa4SVrqGJRvr3HNyR2ETzttl5ysds26sLBBW+pmP1Rk0E9tlaEPHjmfooB
	 88DT5meLvpZRKRWDPEn9GS/2BVN2PAZVqYNREXlEpTmJOLU1BfzRm6vMHmp7ArVkiZ
	 VVHY+lV/F16FZ/DNKpc+epN1qZWIXmdJgZAfPIbc3VTKXxXoiAlsF5dBMT10r5rAnS
	 aT5ZUYxiqvOIGXURVkYDCRZMhwyr34a12T0o+lDf6/EmAPQmCmm1NGk6kSxOiCputW
	 2MR1V+zkUcN+Q==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	He Lugang <helugang@uniontech.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-parisc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sound: Replace deprecated PCI functions
Date: Fri,  3 Jan 2025 18:50:54 +0100
Message-ID: <20250103175053.149735-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_table() and pcim_iomap_regions() have been deprecated and
should be removed from the kernel. Furthermore, some users of the latter
function in sound/ currently misuse the @name parameter, which should
describe the driver reserving a region, not the device the region is on.

Replace the deprecated functions with pcim_iomap_region().

Always pass the driver's name in that new function's @name parameter.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/pci/ad1889.c                    |  7 +++----
 sound/pci/atiixp.c                    |  7 +++----
 sound/pci/atiixp_modem.c              |  7 +++----
 sound/pci/au88x0/au88x0.c             |  7 +++----
 sound/pci/aw2/aw2-alsa.c              |  7 +++----
 sound/pci/bt87x.c                     |  7 +++----
 sound/pci/cs4281.c                    | 13 +++++++------
 sound/pci/cs5530.c                    |  7 +++----
 sound/pci/hda/hda_intel.c             |  7 +++----
 sound/pci/lola/lola.c                 | 16 +++++++++++-----
 sound/pci/rme9652/hdspm.c             |  7 +++----
 sound/soc/loongson/loongson_i2s_pci.c | 13 +++++++------
 12 files changed, 52 insertions(+), 53 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 50e30704bf6f..a90c579f77a2 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -810,12 +810,11 @@ snd_ad1889_create(struct snd_card *card, struct pci_dev *pci)
 	chip->irq = -1;
 
 	/* (1) PCI resource allocation */
-	err = pcim_iomap_regions(pci, 1 << 0, card->driver);
-	if (err < 0)
-		return err;
+	chip->iobase = pcim_iomap_region(pci, 0, card->driver);
+	if (IS_ERR(chip->iobase))
+		return PTR_ERR(chip->iobase);
 
 	chip->bar = pci_resource_start(pci, 0);
-	chip->iobase = pcim_iomap_table(pci)[0];
 	
 	pci_set_master(pci);
 
diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index df2fef726d60..427006be240b 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1544,11 +1544,10 @@ static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
-	err = pcim_iomap_regions(pci, 1 << 0, "ATI IXP AC97");
-	if (err < 0)
-		return err;
+	chip->remap_addr = pcim_iomap_region(pci, 0, "ATI IXP AC97");
+	if (IS_ERR(chip->remap_addr))
+		return PTR_ERR(chip->remap_addr);
 	chip->addr = pci_resource_start(pci, 0);
-	chip->remap_addr = pcim_iomap_table(pci)[0];
 
 	if (devm_request_irq(&pci->dev, pci->irq, snd_atiixp_interrupt,
 			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index eb569539f322..8d3083b9b024 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -1174,11 +1174,10 @@ static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
-	err = pcim_iomap_regions(pci, 1 << 0, "ATI IXP MC97");
-	if (err < 0)
-		return err;
+	chip->remap_addr = pcim_iomap_region(pci, 0, "ATI IXP MC97");
+	if (IS_ERR(chip->remap_addr))
+		return PTR_ERR(chip->remap_addr);
 	chip->addr = pci_resource_start(pci, 0);
-	chip->remap_addr = pcim_iomap_table(pci)[0];
 
 	if (devm_request_irq(&pci->dev, pci->irq, snd_atiixp_interrupt,
 			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index 62b10b0e07b1..fd986247331a 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -160,12 +160,11 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci)
 	// (1) PCI resource allocation
 	// Get MMIO area
 	//
-	err = pcim_iomap_regions(pci, 1 << 0, CARD_NAME_SHORT);
-	if (err)
-		return err;
+	chip->mmio = pcim_iomap_region(pci, 0, KBUILD_MODNAME);
+	if (IS_ERR(chip->mmio))
+		return PTR_ERR(chip->mmio);
 
 	chip->io = pci_resource_start(pci, 0);
-	chip->mmio = pcim_iomap_table(pci)[0];
 
 	/* Init audio core.
 	 * This must be done before we do request_irq otherwise we can get spurious
diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index 29a4bcdec237..7b4b8f785517 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -225,11 +225,10 @@ static int snd_aw2_create(struct snd_card *card,
 	chip->irq = -1;
 
 	/* (1) PCI resource allocation */
-	err = pcim_iomap_regions(pci, 1 << 0, "Audiowerk2");
-	if (err < 0)
-		return err;
+	chip->iobase_virt = pcim_iomap_region(pci, 0, "Audiowerk2");
+	if (IS_ERR(chip->iobase_virt))
+		return PTR_ERR(chip->iobase_virt);
 	chip->iobase_phys = pci_resource_start(pci, 0);
-	chip->iobase_virt = pcim_iomap_table(pci)[0];
 
 	/* (2) initialization of the chip hardware */
 	snd_aw2_saa7146_setup(&chip->saa7146, chip->iobase_virt);
diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 621985bfee5d..91492dd2b38a 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -696,10 +696,9 @@ static int snd_bt87x_create(struct snd_card *card,
 	chip->irq = -1;
 	spin_lock_init(&chip->reg_lock);
 
-	err = pcim_iomap_regions(pci, 1 << 0, "Bt87x audio");
-	if (err < 0)
-		return err;
-	chip->mmio = pcim_iomap_table(pci)[0];
+	chip->mmio = pcim_iomap_region(pci, 0, "Bt87x audio");
+	if (IS_ERR(chip->mmio))
+		return PTR_ERR(chip->mmio);
 
 	chip->reg_control = CTL_A_PWRDN | CTL_DA_ES2 |
 			    CTL_PKTP_16 | (15 << CTL_DA_SDR_SHIFT);
diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index 0cc86e73cc62..90958a422b75 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1302,14 +1302,15 @@ static int snd_cs4281_create(struct snd_card *card,
 	}
 	chip->dual_codec = dual_codec;
 
-	err = pcim_iomap_regions(pci, 0x03, "CS4281"); /* 2 BARs */
-	if (err < 0)
-		return err;
+	chip->ba0 = pcim_iomap_region(pci, 0, "CS4281");
+	if (IS_ERR(chip->ba0))
+		return PTR_ERR(chip->ba0);
 	chip->ba0_addr = pci_resource_start(pci, 0);
-	chip->ba1_addr = pci_resource_start(pci, 1);
 
-	chip->ba0 = pcim_iomap_table(pci)[0];
-	chip->ba1 = pcim_iomap_table(pci)[1];
+	chip->ba1 = pcim_iomap_region(pci, 1, "CS4281");
+	if (IS_ERR(chip->ba1))
+		return PTR_ERR(chip->ba1);
+	chip->ba1_addr = pci_resource_start(pci, 1);
 	
 	if (devm_request_irq(&pci->dev, pci->irq, snd_cs4281_interrupt,
 			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
diff --git a/sound/pci/cs5530.c b/sound/pci/cs5530.c
index 93ff029e6583..532891e67c34 100644
--- a/sound/pci/cs5530.c
+++ b/sound/pci/cs5530.c
@@ -91,11 +91,10 @@ static int snd_cs5530_create(struct snd_card *card,
 	chip->card = card;
 	chip->pci = pci;
 
-	err = pcim_iomap_regions(pci, 1 << 0, "CS5530");
-	if (err < 0)
-		return err;
+	mem = pcim_iomap_region(pci, 0, "CS5530");
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
 	chip->pci_base = pci_resource_start(pci, 0);
-	mem = pcim_iomap_table(pci)[0];
 	map = readw(mem + 0x18);
 
 	/* Map bits
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 4a62440adfaf..73ac16ac6900 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1863,12 +1863,11 @@ static int azx_first_init(struct azx *chip)
 			chip->jackpoll_interval = msecs_to_jiffies(1500);
 	}
 
-	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
-	if (err < 0)
-		return err;
+	bus->remap_addr = pcim_iomap_region(pci, 0, "ICH HD audio");
+	if (IS_ERR(bus->remap_addr))
+		return PTR_ERR(bus->remap_addr);
 
 	bus->addr = pci_resource_start(pci, 0);
-	bus->remap_addr = pcim_iomap_table(pci)[0];
 
 	if (chip->driver_type == AZX_DRIVER_SKL)
 		snd_hdac_bus_parse_capabilities(bus);
diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index 1aa30e90b86a..fb8bd54e4c2d 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -541,6 +541,7 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci, int dev)
 	struct lola *chip = card->private_data;
 	int err;
 	unsigned int dever;
+	void __iomem *iomem;
 
 	err = pcim_enable_device(pci);
 	if (err < 0)
@@ -580,14 +581,19 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci, int dev)
 		chip->sample_rate_min = 16000;
 	}
 
-	err = pcim_iomap_regions(pci, (1 << 0) | (1 << 2), DRVNAME);
-	if (err < 0)
-		return err;
+	iomem = pcim_iomap_region(pci, 0, DRVNAME);
+	if (IS_ERR(iomem))
+		return PTR_ERR(iomem);
 
+	chip->bar[0].remap_addr = iomem;
 	chip->bar[0].addr = pci_resource_start(pci, 0);
-	chip->bar[0].remap_addr = pcim_iomap_table(pci)[0];
+
+	iomem = pcim_iomap_region(pci, 2, DRVNAME);
+	if (IS_ERR(iomem))
+		return PTR_ERR(iomem);
+
+	chip->bar[1].remap_addr = iomem;
 	chip->bar[1].addr = pci_resource_start(pci, 2);
-	chip->bar[1].remap_addr = pcim_iomap_table(pci)[2];
 
 	pci_set_master(pci);
 
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index d7290463d654..9aa2b2f37c25 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6561,13 +6561,12 @@ static int snd_hdspm_create(struct snd_card *card,
 
 	pci_set_master(hdspm->pci);
 
-	err = pcim_iomap_regions(pci, 1 << 0, "hdspm");
-	if (err < 0)
-		return err;
+	hdspm->iobase = pcim_iomap_region(pci, 0, "hdspm");
+	if (IS_ERR(hdspm->iobase))
+		return PTR_ERR(hdspm->iobase);
 
 	hdspm->port = pci_resource_start(pci, 0);
 	io_extent = pci_resource_len(pci, 0);
-	hdspm->iobase = pcim_iomap_table(pci)[0];
 	dev_dbg(card->dev, "remapped region (0x%lx) 0x%lx-0x%lx\n",
 			(unsigned long)hdspm->iobase, hdspm->port,
 			hdspm->port + io_extent - 1);
diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index d2d0e5d8cac9..1ea5501a97f8 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -16,6 +16,8 @@
 #include "loongson_i2s.h"
 #include "loongson_dma.h"
 
+#define DRIVER_NAME "loongson-i2s-pci"
+
 static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -92,13 +94,12 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 	i2s->dev = dev;
 	pci_set_drvdata(pdev, i2s);
 
-	ret = pcim_iomap_regions(pdev, 1 << 0, dev_name(dev));
-	if (ret < 0) {
-		dev_err(dev, "iomap_regions failed\n");
-		return ret;
+	i2s->reg_base = pcim_iomap_region(pdev, 0, DRIVER_NAME);
+	if (IS_ERR(i2s->reg_base)) {
+		dev_err(dev, "iomap_region failed\n");
+		return PTR_ERR(i2s->reg_base);
 	}
 
-	i2s->reg_base = pcim_iomap_table(pdev)[0];
 	i2s->regmap = devm_regmap_init_mmio(dev, i2s->reg_base,
 					    &loongson_i2s_regmap_config);
 	if (IS_ERR(i2s->regmap))
@@ -147,7 +148,7 @@ static const struct pci_device_id loongson_i2s_ids[] = {
 MODULE_DEVICE_TABLE(pci, loongson_i2s_ids);
 
 static struct pci_driver loongson_i2s_driver = {
-	.name = "loongson-i2s-pci",
+	.name = DRIVER_NAME,
 	.id_table = loongson_i2s_ids,
 	.probe = loongson_i2s_pci_probe,
 	.driver = {
-- 
2.47.1


