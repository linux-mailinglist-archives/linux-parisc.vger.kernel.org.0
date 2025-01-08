Return-Path: <linux-parisc+bounces-3137-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9F4A0568C
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Jan 2025 10:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABFE03A6D3B
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Jan 2025 09:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04A1198A06;
	Wed,  8 Jan 2025 09:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GEI1b8lv"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004AE1F12E8;
	Wed,  8 Jan 2025 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327816; cv=none; b=GSH5Bhupvkse7ogAj7eHnGCnZT583dBxnhDs2v5JlA6gxFlcAsGTjgCpx9Ren5KbM9mrbesG17Lq6BK8P+bUqEufZ6A9jtTmqMrlYsvW5LiMT60dDoeu0i3pCSRg+Y1rSL9zcYXmnLkdegG3EkXR3vj5eqcS9yHy+1yr6Kzbm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327816; c=relaxed/simple;
	bh=sSQeXypCQyxJlaJuPpuwCap1kRRCKGe3hx7PgH8V+0Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rPMp6kyuUaYTlT0G7nBzGEv/PdS+5Q0AEcL2NFK5EOHQos0IQvC9YStAjF1RpVI/NQ8aGtzzQn+uWQBeRmNPLOWs8AkPjKqDYE9Y5CXTqMva6gRoYZvtAPPeEfSlSHBYDQXFjAobTW7pX7E1DQEJ6fzdiNou+8/jm8Rbk+WEpOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GEI1b8lv; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4YShsm4CCBz9xjb;
	Wed,  8 Jan 2025 10:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1736327308; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSQeXypCQyxJlaJuPpuwCap1kRRCKGe3hx7PgH8V+0Y=;
	b=GEI1b8lvtyaJp/G9rrcNTo1AL/Sq5rqXp4hKN5F7M23SZa38MMvBtQLxZW1SIjXgreFKuN
	Y15z1zNyDpcbZRi8TiF5aZh9DsgA3zsF4OdcMcDEtFchsXMUMDZHXwtRsU1h0OwCyJ36Zu
	L0dVkdbaNPA29mcbyCRfzkQufWCCwDQemF1cbWao6Uyp0G0S4ys5Q3wcxk32QE84M64gB2
	HEvnvi99L9w2sfje8ZGDuK4aj1EEbDgO9F1vU2TfogSWApnwxG+nHcegKZguUH2fqdo/d5
	EoMVSXtEaKelGO6gLRQUIq8Mwbp7H0mygx96/6s4G/gF6htfGAKnF5mp/0+vhg==
Message-ID: <dcd0add74cf1f61052710b5cb91baf38548c5a52.camel@mailbox.org>
Subject: Re: [PATCH] sound: Replace deprecated PCI functions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Takashi Iwai <tiwai@suse.de>, Philipp Stanner <phasta@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Clemens
 Ladisch <clemens@ladisch.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,  Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,  Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Heiner Kallweit
 <hkallweit1@gmail.com>,  Rui Salvaterra <rsalvaterra@gmail.com>, Huacai
 Chen <chenhuacai@kernel.org>, David Rhodes <drhodes@opensource.cirrus.com>,
 Jerome Brunet <jbrunet@baylibre.com>, He Lugang <helugang@uniontech.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,  Binbin Zhou
 <zhoubinbin@loongson.cn>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-parisc@vger.kernel.org,  linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 08 Jan 2025 10:07:28 +0100
In-Reply-To: <8734hyzzqp.wl-tiwai@suse.de>
References: <20250103175053.149735-2-phasta@kernel.org>
	 <8734hyzzqp.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 988eb3818ef2979f353
X-MBO-RS-META: 7aqx4385zxfrmkzmmzr397p981fz6yxh

On Sat, 2025-01-04 at 10:37 +0100, Takashi Iwai wrote:
> On Fri, 03 Jan 2025 18:50:54 +0100,
> Philipp Stanner wrote:
> >=20
> > pcim_iomap_table() and pcim_iomap_regions() have been deprecated
> > and
> > should be removed from the kernel. Furthermore, some users of the
> > latter
> > function in sound/ currently misuse the @name parameter, which
> > should
> > describe the driver reserving a region, not the device the region
> > is on.
> >=20
> > Replace the deprecated functions with pcim_iomap_region().
> >=20
> > Always pass the driver's name in that new function's @name
> > parameter.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> The changes look OK, but I prefer splitting the patch to each driver,
> so that it can be applied more safely for stable kernels if needed.
>=20
> Care to do that?

Yes, I can do that. Could take a while until I find a slot for it. I'll
send a v2 then

P.

>=20
>=20
> thanks,
>=20
> Takashi
>=20
> > ---
> > =C2=A0sound/pci/ad1889.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 7 +++----
> > =C2=A0sound/pci/atiixp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 7 +++----
> > =C2=A0sound/pci/atiixp_modem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++----
> > =C2=A0sound/pci/au88x0/au88x0.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++----
> > =C2=A0sound/pci/aw2/aw2-alsa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++----
> > =C2=A0sound/pci/bt87x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 7 +++----
> > =C2=A0sound/pci/cs4281.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 =
+++++++------
> > =C2=A0sound/pci/cs5530.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 7 +++----
> > =C2=A0sound/pci/hda/hda_intel.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++----
> > =C2=A0sound/pci/lola/lola.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++++++++++----=
-
> > =C2=A0sound/pci/rme9652/hdspm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++----
> > =C2=A0sound/soc/loongson/loongson_i2s_pci.c | 13 +++++++------
> > =C2=A012 files changed, 52 insertions(+), 53 deletions(-)
> >=20
> > diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
> > index 50e30704bf6f..a90c579f77a2 100644
> > --- a/sound/pci/ad1889.c
> > +++ b/sound/pci/ad1889.c
> > @@ -810,12 +810,11 @@ snd_ad1889_create(struct snd_card *card,
> > struct pci_dev *pci)
> > =C2=A0 chip->irq =3D -1;
> > =C2=A0
> > =C2=A0 /* (1) PCI resource allocation */
> > - err =3D pcim_iomap_regions(pci, 1 << 0, card->driver);
> > - if (err < 0)
> > - return err;
> > + chip->iobase =3D pcim_iomap_region(pci, 0, card->driver);
> > + if (IS_ERR(chip->iobase))
> > + return PTR_ERR(chip->iobase);
> > =C2=A0
> > =C2=A0 chip->bar =3D pci_resource_start(pci, 0);
> > - chip->iobase =3D pcim_iomap_table(pci)[0];
> > =C2=A0=20
> > =C2=A0 pci_set_master(pci);
> > =C2=A0
> > diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
> > index df2fef726d60..427006be240b 100644
> > --- a/sound/pci/atiixp.c
> > +++ b/sound/pci/atiixp.c
> > @@ -1544,11 +1544,10 @@ static int snd_atiixp_init(struct snd_card
> > *card, struct pci_dev *pci)
> > =C2=A0 chip->card =3D card;
> > =C2=A0 chip->pci =3D pci;
> > =C2=A0 chip->irq =3D -1;
> > - err =3D pcim_iomap_regions(pci, 1 << 0, "ATI IXP AC97");
> > - if (err < 0)
> > - return err;
> > + chip->remap_addr =3D pcim_iomap_region(pci, 0, "ATI IXP AC97");
> > + if (IS_ERR(chip->remap_addr))
> > + return PTR_ERR(chip->remap_addr);
> > =C2=A0 chip->addr =3D pci_resource_start(pci, 0);
> > - chip->remap_addr =3D pcim_iomap_table(pci)[0];
> > =C2=A0
> > =C2=A0 if (devm_request_irq(&pci->dev, pci->irq, snd_atiixp_interrupt,
> > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 IRQF_SHARED, KBUILD_MODNAME, chip)) {
> > diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
> > index eb569539f322..8d3083b9b024 100644
> > --- a/sound/pci/atiixp_modem.c
> > +++ b/sound/pci/atiixp_modem.c
> > @@ -1174,11 +1174,10 @@ static int snd_atiixp_init(struct snd_card
> > *card, struct pci_dev *pci)
> > =C2=A0 chip->card =3D card;
> > =C2=A0 chip->pci =3D pci;
> > =C2=A0 chip->irq =3D -1;
> > - err =3D pcim_iomap_regions(pci, 1 << 0, "ATI IXP MC97");
> > - if (err < 0)
> > - return err;
> > + chip->remap_addr =3D pcim_iomap_region(pci, 0, "ATI IXP MC97");
> > + if (IS_ERR(chip->remap_addr))
> > + return PTR_ERR(chip->remap_addr);
> > =C2=A0 chip->addr =3D pci_resource_start(pci, 0);
> > - chip->remap_addr =3D pcim_iomap_table(pci)[0];
> > =C2=A0
> > =C2=A0 if (devm_request_irq(&pci->dev, pci->irq, snd_atiixp_interrupt,
> > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 IRQF_SHARED, KBUILD_MODNAME, chip)) {
> > diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
> > index 62b10b0e07b1..fd986247331a 100644
> > --- a/sound/pci/au88x0/au88x0.c
> > +++ b/sound/pci/au88x0/au88x0.c
> > @@ -160,12 +160,11 @@ snd_vortex_create(struct snd_card *card,
> > struct pci_dev *pci)
> > =C2=A0 // (1) PCI resource allocation
> > =C2=A0 // Get MMIO area
> > =C2=A0 //
> > - err =3D pcim_iomap_regions(pci, 1 << 0, CARD_NAME_SHORT);
> > - if (err)
> > - return err;
> > + chip->mmio =3D pcim_iomap_region(pci, 0, KBUILD_MODNAME);
> > + if (IS_ERR(chip->mmio))
> > + return PTR_ERR(chip->mmio);
> > =C2=A0
> > =C2=A0 chip->io =3D pci_resource_start(pci, 0);
> > - chip->mmio =3D pcim_iomap_table(pci)[0];
> > =C2=A0
> > =C2=A0 /* Init audio core.
> > =C2=A0 * This must be done before we do request_irq otherwise we can ge=
t
> > spurious
> > diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
> > index 29a4bcdec237..7b4b8f785517 100644
> > --- a/sound/pci/aw2/aw2-alsa.c
> > +++ b/sound/pci/aw2/aw2-alsa.c
> > @@ -225,11 +225,10 @@ static int snd_aw2_create(struct snd_card
> > *card,
> > =C2=A0 chip->irq =3D -1;
> > =C2=A0
> > =C2=A0 /* (1) PCI resource allocation */
> > - err =3D pcim_iomap_regions(pci, 1 << 0, "Audiowerk2");
> > - if (err < 0)
> > - return err;
> > + chip->iobase_virt =3D pcim_iomap_region(pci, 0, "Audiowerk2");
> > + if (IS_ERR(chip->iobase_virt))
> > + return PTR_ERR(chip->iobase_virt);
> > =C2=A0 chip->iobase_phys =3D pci_resource_start(pci, 0);
> > - chip->iobase_virt =3D pcim_iomap_table(pci)[0];
> > =C2=A0
> > =C2=A0 /* (2) initialization of the chip hardware */
> > =C2=A0 snd_aw2_saa7146_setup(&chip->saa7146, chip->iobase_virt);
> > diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
> > index 621985bfee5d..91492dd2b38a 100644
> > --- a/sound/pci/bt87x.c
> > +++ b/sound/pci/bt87x.c
> > @@ -696,10 +696,9 @@ static int snd_bt87x_create(struct snd_card
> > *card,
> > =C2=A0 chip->irq =3D -1;
> > =C2=A0 spin_lock_init(&chip->reg_lock);
> > =C2=A0
> > - err =3D pcim_iomap_regions(pci, 1 << 0, "Bt87x audio");
> > - if (err < 0)
> > - return err;
> > - chip->mmio =3D pcim_iomap_table(pci)[0];
> > + chip->mmio =3D pcim_iomap_region(pci, 0, "Bt87x audio");
> > + if (IS_ERR(chip->mmio))
> > + return PTR_ERR(chip->mmio);
> > =C2=A0
> > =C2=A0 chip->reg_control =3D CTL_A_PWRDN | CTL_DA_ES2 |
> > =C2=A0 =C2=A0=C2=A0=C2=A0 CTL_PKTP_16 | (15 << CTL_DA_SDR_SHIFT);
> > diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
> > index 0cc86e73cc62..90958a422b75 100644
> > --- a/sound/pci/cs4281.c
> > +++ b/sound/pci/cs4281.c
> > @@ -1302,14 +1302,15 @@ static int snd_cs4281_create(struct
> > snd_card *card,
> > =C2=A0 }
> > =C2=A0 chip->dual_codec =3D dual_codec;
> > =C2=A0
> > - err =3D pcim_iomap_regions(pci, 0x03, "CS4281"); /* 2 BARs */
> > - if (err < 0)
> > - return err;
> > + chip->ba0 =3D pcim_iomap_region(pci, 0, "CS4281");
> > + if (IS_ERR(chip->ba0))
> > + return PTR_ERR(chip->ba0);
> > =C2=A0 chip->ba0_addr =3D pci_resource_start(pci, 0);
> > - chip->ba1_addr =3D pci_resource_start(pci, 1);
> > =C2=A0
> > - chip->ba0 =3D pcim_iomap_table(pci)[0];
> > - chip->ba1 =3D pcim_iomap_table(pci)[1];
> > + chip->ba1 =3D pcim_iomap_region(pci, 1, "CS4281");
> > + if (IS_ERR(chip->ba1))
> > + return PTR_ERR(chip->ba1);
> > + chip->ba1_addr =3D pci_resource_start(pci, 1);
> > =C2=A0=20
> > =C2=A0 if (devm_request_irq(&pci->dev, pci->irq, snd_cs4281_interrupt,
> > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 IRQF_SHARED, KBUILD_MODNAME, chip)) {
> > diff --git a/sound/pci/cs5530.c b/sound/pci/cs5530.c
> > index 93ff029e6583..532891e67c34 100644
> > --- a/sound/pci/cs5530.c
> > +++ b/sound/pci/cs5530.c
> > @@ -91,11 +91,10 @@ static int snd_cs5530_create(struct snd_card
> > *card,
> > =C2=A0 chip->card =3D card;
> > =C2=A0 chip->pci =3D pci;
> > =C2=A0
> > - err =3D pcim_iomap_regions(pci, 1 << 0, "CS5530");
> > - if (err < 0)
> > - return err;
> > + mem =3D pcim_iomap_region(pci, 0, "CS5530");
> > + if (IS_ERR(mem))
> > + return PTR_ERR(mem);
> > =C2=A0 chip->pci_base =3D pci_resource_start(pci, 0);
> > - mem =3D pcim_iomap_table(pci)[0];
> > =C2=A0 map =3D readw(mem + 0x18);
> > =C2=A0
> > =C2=A0 /* Map bits
> > diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> > index 4a62440adfaf..73ac16ac6900 100644
> > --- a/sound/pci/hda/hda_intel.c
> > +++ b/sound/pci/hda/hda_intel.c
> > @@ -1863,12 +1863,11 @@ static int azx_first_init(struct azx *chip)
> > =C2=A0 chip->jackpoll_interval =3D msecs_to_jiffies(1500);
> > =C2=A0 }
> > =C2=A0
> > - err =3D pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
> > - if (err < 0)
> > - return err;
> > + bus->remap_addr =3D pcim_iomap_region(pci, 0, "ICH HD audio");
> > + if (IS_ERR(bus->remap_addr))
> > + return PTR_ERR(bus->remap_addr);
> > =C2=A0
> > =C2=A0 bus->addr =3D pci_resource_start(pci, 0);
> > - bus->remap_addr =3D pcim_iomap_table(pci)[0];
> > =C2=A0
> > =C2=A0 if (chip->driver_type =3D=3D AZX_DRIVER_SKL)
> > =C2=A0 snd_hdac_bus_parse_capabilities(bus);
> > diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
> > index 1aa30e90b86a..fb8bd54e4c2d 100644
> > --- a/sound/pci/lola/lola.c
> > +++ b/sound/pci/lola/lola.c
> > @@ -541,6 +541,7 @@ static int lola_create(struct snd_card *card,
> > struct pci_dev *pci, int dev)
> > =C2=A0 struct lola *chip =3D card->private_data;
> > =C2=A0 int err;
> > =C2=A0 unsigned int dever;
> > + void __iomem *iomem;
> > =C2=A0
> > =C2=A0 err =3D pcim_enable_device(pci);
> > =C2=A0 if (err < 0)
> > @@ -580,14 +581,19 @@ static int lola_create(struct snd_card *card,
> > struct pci_dev *pci, int dev)
> > =C2=A0 chip->sample_rate_min =3D 16000;
> > =C2=A0 }
> > =C2=A0
> > - err =3D pcim_iomap_regions(pci, (1 << 0) | (1 << 2), DRVNAME);
> > - if (err < 0)
> > - return err;
> > + iomem =3D pcim_iomap_region(pci, 0, DRVNAME);
> > + if (IS_ERR(iomem))
> > + return PTR_ERR(iomem);
> > =C2=A0
> > + chip->bar[0].remap_addr =3D iomem;
> > =C2=A0 chip->bar[0].addr =3D pci_resource_start(pci, 0);
> > - chip->bar[0].remap_addr =3D pcim_iomap_table(pci)[0];
> > +
> > + iomem =3D pcim_iomap_region(pci, 2, DRVNAME);
> > + if (IS_ERR(iomem))
> > + return PTR_ERR(iomem);
> > +
> > + chip->bar[1].remap_addr =3D iomem;
> > =C2=A0 chip->bar[1].addr =3D pci_resource_start(pci, 2);
> > - chip->bar[1].remap_addr =3D pcim_iomap_table(pci)[2];
> > =C2=A0
> > =C2=A0 pci_set_master(pci);
> > =C2=A0
> > diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
> > index d7290463d654..9aa2b2f37c25 100644
> > --- a/sound/pci/rme9652/hdspm.c
> > +++ b/sound/pci/rme9652/hdspm.c
> > @@ -6561,13 +6561,12 @@ static int snd_hdspm_create(struct snd_card
> > *card,
> > =C2=A0
> > =C2=A0 pci_set_master(hdspm->pci);
> > =C2=A0
> > - err =3D pcim_iomap_regions(pci, 1 << 0, "hdspm");
> > - if (err < 0)
> > - return err;
> > + hdspm->iobase =3D pcim_iomap_region(pci, 0, "hdspm");
> > + if (IS_ERR(hdspm->iobase))
> > + return PTR_ERR(hdspm->iobase);
> > =C2=A0
> > =C2=A0 hdspm->port =3D pci_resource_start(pci, 0);
> > =C2=A0 io_extent =3D pci_resource_len(pci, 0);
> > - hdspm->iobase =3D pcim_iomap_table(pci)[0];
> > =C2=A0 dev_dbg(card->dev, "remapped region (0x%lx) 0x%lx-0x%lx\n",
> > =C2=A0 (unsigned long)hdspm->iobase, hdspm->port,
> > =C2=A0 hdspm->port + io_extent - 1);
> > diff --git a/sound/soc/loongson/loongson_i2s_pci.c
> > b/sound/soc/loongson/loongson_i2s_pci.c
> > index d2d0e5d8cac9..1ea5501a97f8 100644
> > --- a/sound/soc/loongson/loongson_i2s_pci.c
> > +++ b/sound/soc/loongson/loongson_i2s_pci.c
> > @@ -16,6 +16,8 @@
> > =C2=A0#include "loongson_i2s.h"
> > =C2=A0#include "loongson_dma.h"
> > =C2=A0
> > +#define DRIVER_NAME "loongson-i2s-pci"
> > +
> > =C2=A0static bool loongson_i2s_wr_reg(struct device *dev, unsigned int
> > reg)
> > =C2=A0{
> > =C2=A0 switch (reg) {
> > @@ -92,13 +94,12 @@ static int loongson_i2s_pci_probe(struct
> > pci_dev *pdev,
> > =C2=A0 i2s->dev =3D dev;
> > =C2=A0 pci_set_drvdata(pdev, i2s);
> > =C2=A0
> > - ret =3D pcim_iomap_regions(pdev, 1 << 0, dev_name(dev));
> > - if (ret < 0) {
> > - dev_err(dev, "iomap_regions failed\n");
> > - return ret;
> > + i2s->reg_base =3D pcim_iomap_region(pdev, 0, DRIVER_NAME);
> > + if (IS_ERR(i2s->reg_base)) {
> > + dev_err(dev, "iomap_region failed\n");
> > + return PTR_ERR(i2s->reg_base);
> > =C2=A0 }
> > =C2=A0
> > - i2s->reg_base =3D pcim_iomap_table(pdev)[0];
> > =C2=A0 i2s->regmap =3D devm_regmap_init_mmio(dev, i2s->reg_base,
> > =C2=A0 =C2=A0=C2=A0=C2=A0 &loongson_i2s_regmap_config);
> > =C2=A0 if (IS_ERR(i2s->regmap))
> > @@ -147,7 +148,7 @@ static const struct pci_device_id
> > loongson_i2s_ids[] =3D {
> > =C2=A0MODULE_DEVICE_TABLE(pci, loongson_i2s_ids);
> > =C2=A0
> > =C2=A0static struct pci_driver loongson_i2s_driver =3D {
> > - .name =3D "loongson-i2s-pci",
> > + .name =3D DRIVER_NAME,
> > =C2=A0 .id_table =3D loongson_i2s_ids,
> > =C2=A0 .probe =3D loongson_i2s_pci_probe,
> > =C2=A0 .driver =3D {
> > --=20
> > 2.47.1
> >=20


