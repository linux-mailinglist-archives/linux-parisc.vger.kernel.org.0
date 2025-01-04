Return-Path: <linux-parisc+bounces-3128-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB37A013AE
	for <lists+linux-parisc@lfdr.de>; Sat,  4 Jan 2025 10:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B231C162B0C
	for <lists+linux-parisc@lfdr.de>; Sat,  4 Jan 2025 09:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC00170A0A;
	Sat,  4 Jan 2025 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TeXZSTV7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sC1pT2um";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xf4dsglL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4vN8JDCn"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D964D14E2E2;
	Sat,  4 Jan 2025 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735983445; cv=none; b=BAqSE0OuV9BDrMMYdwRJC/GA/X2EYYAxqfZV2E1b2y/NlBCJydg54ACSdLQo9NjYhjK2vuBRbelQU1RKuVBq3lNYtrUW+13CNE8lRuazSdkHLqBdA5pv8o4zm/7GXlR8+2glI7hdL1qnWa4bKPBwomRd3lxn+O2NtRp9HBVpLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735983445; c=relaxed/simple;
	bh=B/2hezgO1SGWfqO6nMLSzVz0NAQ4Sf4MvhUIUKSxkss=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kTZre1WxiD3+VwEpidZXJbifJGnpn7vnoKvbTT2yX72zhBE6jYZ73urJ+eiUWw12iL8buTLXLNGr6wCIWbmP4MceoG7AlzQCXvo9EuTqjnys2OfiOOSKYhBwhyn5ple/GDezkmeLa4SDuSPcneXeISBf6WT25AkLamXemUdI0zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TeXZSTV7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sC1pT2um; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xf4dsglL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4vN8JDCn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B96B5210F6;
	Sat,  4 Jan 2025 09:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735983441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HNFDPxqL03XYhGt/qHZS8Fj6MSdsIYDimkqf6NOhYj8=;
	b=TeXZSTV71k/WUImicRucnw5O5x/4WyzyyBrkK1Uwr/q/skYr5R5YoTIGg6IFnt15wAVsxg
	P+QVmq4oVjl9it/LEbprMub3jk2Xe57rPXEGbcgEc8bOFnr1MmTl9E0U65zLugfao957tO
	7noEK3n0Rhzn+qwvQca7VW1qND500nA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735983441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HNFDPxqL03XYhGt/qHZS8Fj6MSdsIYDimkqf6NOhYj8=;
	b=sC1pT2umQQYb/udZL1DKCbVR0FakaB+6YBK3NIdFQZ2sEU9XgMqOwd0ccWxu9+5BbtZAms
	61PYd+D1OGrMQMDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Xf4dsglL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4vN8JDCn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735983439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HNFDPxqL03XYhGt/qHZS8Fj6MSdsIYDimkqf6NOhYj8=;
	b=Xf4dsglLGT/epyZihbybySzlY0aePrBye8FESmZYm0INImfus0+7W3cUsWqKByeYlDOW7k
	9m4mI4qGN3fkpSycIqpAYY6km7H1SWag4/e3PDAloDHuhiCTLwUoMF5TIYSTBaXwGiDT78
	sRVrtF6xH6FHs6xpXRc90c69xr44wfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735983439;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HNFDPxqL03XYhGt/qHZS8Fj6MSdsIYDimkqf6NOhYj8=;
	b=4vN8JDCn4YDzEu2csI6eUKadZfRbXXCv7Icw675J6BLxGxUBEHk53QclMmhe1tROYHYV/K
	KNl6xVafsTH4wKDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28CBB137CF;
	Sat,  4 Jan 2025 09:37:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qNQzCE8BeWfAXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 04 Jan 2025 09:37:19 +0000
Date: Sat, 04 Jan 2025 10:37:18 +0100
Message-ID: <8734hyzzqp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Philipp Stanner <phasta@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Clemens
 Ladisch <clemens@ladisch.de>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark
 Brown <broonie@kernel.org>,	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Heiner Kallweit
 <hkallweit1@gmail.com>,	Rui Salvaterra <rsalvaterra@gmail.com>,	Huacai Chen
 <chenhuacai@kernel.org>,	David Rhodes <drhodes@opensource.cirrus.com>,
	Jerome Brunet <jbrunet@baylibre.com>,	He Lugang <helugang@uniontech.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,	Tang Bin <tangbin@cmss.chinamobile.com>,
	linux-parisc@vger.kernel.org,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: Replace deprecated PCI functions
In-Reply-To: <20250103175053.149735-2-phasta@kernel.org>
References: <20250103175053.149735-2-phasta@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: B96B5210F6
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,ladisch.de,gmail.com,kernel.org,linux.intel.com,linux.dev,opensource.cirrus.com,baylibre.com,uniontech.com,renesas.com,loongson.cn,linaro.org,cmss.chinamobile.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 03 Jan 2025 18:50:54 +0100,
Philipp Stanner wrote:
> 
> pcim_iomap_table() and pcim_iomap_regions() have been deprecated and
> should be removed from the kernel. Furthermore, some users of the latter
> function in sound/ currently misuse the @name parameter, which should
> describe the driver reserving a region, not the device the region is on.
> 
> Replace the deprecated functions with pcim_iomap_region().
> 
> Always pass the driver's name in that new function's @name parameter.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

The changes look OK, but I prefer splitting the patch to each driver,
so that it can be applied more safely for stable kernels if needed.

Care to do that?


thanks,

Takashi

> ---
>  sound/pci/ad1889.c                    |  7 +++----
>  sound/pci/atiixp.c                    |  7 +++----
>  sound/pci/atiixp_modem.c              |  7 +++----
>  sound/pci/au88x0/au88x0.c             |  7 +++----
>  sound/pci/aw2/aw2-alsa.c              |  7 +++----
>  sound/pci/bt87x.c                     |  7 +++----
>  sound/pci/cs4281.c                    | 13 +++++++------
>  sound/pci/cs5530.c                    |  7 +++----
>  sound/pci/hda/hda_intel.c             |  7 +++----
>  sound/pci/lola/lola.c                 | 16 +++++++++++-----
>  sound/pci/rme9652/hdspm.c             |  7 +++----
>  sound/soc/loongson/loongson_i2s_pci.c | 13 +++++++------
>  12 files changed, 52 insertions(+), 53 deletions(-)
> 
> diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
> index 50e30704bf6f..a90c579f77a2 100644
> --- a/sound/pci/ad1889.c
> +++ b/sound/pci/ad1889.c
> @@ -810,12 +810,11 @@ snd_ad1889_create(struct snd_card *card, struct pci_dev *pci)
>  	chip->irq = -1;
>  
>  	/* (1) PCI resource allocation */
> -	err = pcim_iomap_regions(pci, 1 << 0, card->driver);
> -	if (err < 0)
> -		return err;
> +	chip->iobase = pcim_iomap_region(pci, 0, card->driver);
> +	if (IS_ERR(chip->iobase))
> +		return PTR_ERR(chip->iobase);
>  
>  	chip->bar = pci_resource_start(pci, 0);
> -	chip->iobase = pcim_iomap_table(pci)[0];
>  	
>  	pci_set_master(pci);
>  
> diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
> index df2fef726d60..427006be240b 100644
> --- a/sound/pci/atiixp.c
> +++ b/sound/pci/atiixp.c
> @@ -1544,11 +1544,10 @@ static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
>  	chip->card = card;
>  	chip->pci = pci;
>  	chip->irq = -1;
> -	err = pcim_iomap_regions(pci, 1 << 0, "ATI IXP AC97");
> -	if (err < 0)
> -		return err;
> +	chip->remap_addr = pcim_iomap_region(pci, 0, "ATI IXP AC97");
> +	if (IS_ERR(chip->remap_addr))
> +		return PTR_ERR(chip->remap_addr);
>  	chip->addr = pci_resource_start(pci, 0);
> -	chip->remap_addr = pcim_iomap_table(pci)[0];
>  
>  	if (devm_request_irq(&pci->dev, pci->irq, snd_atiixp_interrupt,
>  			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
> diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
> index eb569539f322..8d3083b9b024 100644
> --- a/sound/pci/atiixp_modem.c
> +++ b/sound/pci/atiixp_modem.c
> @@ -1174,11 +1174,10 @@ static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
>  	chip->card = card;
>  	chip->pci = pci;
>  	chip->irq = -1;
> -	err = pcim_iomap_regions(pci, 1 << 0, "ATI IXP MC97");
> -	if (err < 0)
> -		return err;
> +	chip->remap_addr = pcim_iomap_region(pci, 0, "ATI IXP MC97");
> +	if (IS_ERR(chip->remap_addr))
> +		return PTR_ERR(chip->remap_addr);
>  	chip->addr = pci_resource_start(pci, 0);
> -	chip->remap_addr = pcim_iomap_table(pci)[0];
>  
>  	if (devm_request_irq(&pci->dev, pci->irq, snd_atiixp_interrupt,
>  			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
> diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
> index 62b10b0e07b1..fd986247331a 100644
> --- a/sound/pci/au88x0/au88x0.c
> +++ b/sound/pci/au88x0/au88x0.c
> @@ -160,12 +160,11 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci)
>  	// (1) PCI resource allocation
>  	// Get MMIO area
>  	//
> -	err = pcim_iomap_regions(pci, 1 << 0, CARD_NAME_SHORT);
> -	if (err)
> -		return err;
> +	chip->mmio = pcim_iomap_region(pci, 0, KBUILD_MODNAME);
> +	if (IS_ERR(chip->mmio))
> +		return PTR_ERR(chip->mmio);
>  
>  	chip->io = pci_resource_start(pci, 0);
> -	chip->mmio = pcim_iomap_table(pci)[0];
>  
>  	/* Init audio core.
>  	 * This must be done before we do request_irq otherwise we can get spurious
> diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
> index 29a4bcdec237..7b4b8f785517 100644
> --- a/sound/pci/aw2/aw2-alsa.c
> +++ b/sound/pci/aw2/aw2-alsa.c
> @@ -225,11 +225,10 @@ static int snd_aw2_create(struct snd_card *card,
>  	chip->irq = -1;
>  
>  	/* (1) PCI resource allocation */
> -	err = pcim_iomap_regions(pci, 1 << 0, "Audiowerk2");
> -	if (err < 0)
> -		return err;
> +	chip->iobase_virt = pcim_iomap_region(pci, 0, "Audiowerk2");
> +	if (IS_ERR(chip->iobase_virt))
> +		return PTR_ERR(chip->iobase_virt);
>  	chip->iobase_phys = pci_resource_start(pci, 0);
> -	chip->iobase_virt = pcim_iomap_table(pci)[0];
>  
>  	/* (2) initialization of the chip hardware */
>  	snd_aw2_saa7146_setup(&chip->saa7146, chip->iobase_virt);
> diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
> index 621985bfee5d..91492dd2b38a 100644
> --- a/sound/pci/bt87x.c
> +++ b/sound/pci/bt87x.c
> @@ -696,10 +696,9 @@ static int snd_bt87x_create(struct snd_card *card,
>  	chip->irq = -1;
>  	spin_lock_init(&chip->reg_lock);
>  
> -	err = pcim_iomap_regions(pci, 1 << 0, "Bt87x audio");
> -	if (err < 0)
> -		return err;
> -	chip->mmio = pcim_iomap_table(pci)[0];
> +	chip->mmio = pcim_iomap_region(pci, 0, "Bt87x audio");
> +	if (IS_ERR(chip->mmio))
> +		return PTR_ERR(chip->mmio);
>  
>  	chip->reg_control = CTL_A_PWRDN | CTL_DA_ES2 |
>  			    CTL_PKTP_16 | (15 << CTL_DA_SDR_SHIFT);
> diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
> index 0cc86e73cc62..90958a422b75 100644
> --- a/sound/pci/cs4281.c
> +++ b/sound/pci/cs4281.c
> @@ -1302,14 +1302,15 @@ static int snd_cs4281_create(struct snd_card *card,
>  	}
>  	chip->dual_codec = dual_codec;
>  
> -	err = pcim_iomap_regions(pci, 0x03, "CS4281"); /* 2 BARs */
> -	if (err < 0)
> -		return err;
> +	chip->ba0 = pcim_iomap_region(pci, 0, "CS4281");
> +	if (IS_ERR(chip->ba0))
> +		return PTR_ERR(chip->ba0);
>  	chip->ba0_addr = pci_resource_start(pci, 0);
> -	chip->ba1_addr = pci_resource_start(pci, 1);
>  
> -	chip->ba0 = pcim_iomap_table(pci)[0];
> -	chip->ba1 = pcim_iomap_table(pci)[1];
> +	chip->ba1 = pcim_iomap_region(pci, 1, "CS4281");
> +	if (IS_ERR(chip->ba1))
> +		return PTR_ERR(chip->ba1);
> +	chip->ba1_addr = pci_resource_start(pci, 1);
>  	
>  	if (devm_request_irq(&pci->dev, pci->irq, snd_cs4281_interrupt,
>  			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
> diff --git a/sound/pci/cs5530.c b/sound/pci/cs5530.c
> index 93ff029e6583..532891e67c34 100644
> --- a/sound/pci/cs5530.c
> +++ b/sound/pci/cs5530.c
> @@ -91,11 +91,10 @@ static int snd_cs5530_create(struct snd_card *card,
>  	chip->card = card;
>  	chip->pci = pci;
>  
> -	err = pcim_iomap_regions(pci, 1 << 0, "CS5530");
> -	if (err < 0)
> -		return err;
> +	mem = pcim_iomap_region(pci, 0, "CS5530");
> +	if (IS_ERR(mem))
> +		return PTR_ERR(mem);
>  	chip->pci_base = pci_resource_start(pci, 0);
> -	mem = pcim_iomap_table(pci)[0];
>  	map = readw(mem + 0x18);
>  
>  	/* Map bits
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 4a62440adfaf..73ac16ac6900 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1863,12 +1863,11 @@ static int azx_first_init(struct azx *chip)
>  			chip->jackpoll_interval = msecs_to_jiffies(1500);
>  	}
>  
> -	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
> -	if (err < 0)
> -		return err;
> +	bus->remap_addr = pcim_iomap_region(pci, 0, "ICH HD audio");
> +	if (IS_ERR(bus->remap_addr))
> +		return PTR_ERR(bus->remap_addr);
>  
>  	bus->addr = pci_resource_start(pci, 0);
> -	bus->remap_addr = pcim_iomap_table(pci)[0];
>  
>  	if (chip->driver_type == AZX_DRIVER_SKL)
>  		snd_hdac_bus_parse_capabilities(bus);
> diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
> index 1aa30e90b86a..fb8bd54e4c2d 100644
> --- a/sound/pci/lola/lola.c
> +++ b/sound/pci/lola/lola.c
> @@ -541,6 +541,7 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci, int dev)
>  	struct lola *chip = card->private_data;
>  	int err;
>  	unsigned int dever;
> +	void __iomem *iomem;
>  
>  	err = pcim_enable_device(pci);
>  	if (err < 0)
> @@ -580,14 +581,19 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci, int dev)
>  		chip->sample_rate_min = 16000;
>  	}
>  
> -	err = pcim_iomap_regions(pci, (1 << 0) | (1 << 2), DRVNAME);
> -	if (err < 0)
> -		return err;
> +	iomem = pcim_iomap_region(pci, 0, DRVNAME);
> +	if (IS_ERR(iomem))
> +		return PTR_ERR(iomem);
>  
> +	chip->bar[0].remap_addr = iomem;
>  	chip->bar[0].addr = pci_resource_start(pci, 0);
> -	chip->bar[0].remap_addr = pcim_iomap_table(pci)[0];
> +
> +	iomem = pcim_iomap_region(pci, 2, DRVNAME);
> +	if (IS_ERR(iomem))
> +		return PTR_ERR(iomem);
> +
> +	chip->bar[1].remap_addr = iomem;
>  	chip->bar[1].addr = pci_resource_start(pci, 2);
> -	chip->bar[1].remap_addr = pcim_iomap_table(pci)[2];
>  
>  	pci_set_master(pci);
>  
> diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
> index d7290463d654..9aa2b2f37c25 100644
> --- a/sound/pci/rme9652/hdspm.c
> +++ b/sound/pci/rme9652/hdspm.c
> @@ -6561,13 +6561,12 @@ static int snd_hdspm_create(struct snd_card *card,
>  
>  	pci_set_master(hdspm->pci);
>  
> -	err = pcim_iomap_regions(pci, 1 << 0, "hdspm");
> -	if (err < 0)
> -		return err;
> +	hdspm->iobase = pcim_iomap_region(pci, 0, "hdspm");
> +	if (IS_ERR(hdspm->iobase))
> +		return PTR_ERR(hdspm->iobase);
>  
>  	hdspm->port = pci_resource_start(pci, 0);
>  	io_extent = pci_resource_len(pci, 0);
> -	hdspm->iobase = pcim_iomap_table(pci)[0];
>  	dev_dbg(card->dev, "remapped region (0x%lx) 0x%lx-0x%lx\n",
>  			(unsigned long)hdspm->iobase, hdspm->port,
>  			hdspm->port + io_extent - 1);
> diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
> index d2d0e5d8cac9..1ea5501a97f8 100644
> --- a/sound/soc/loongson/loongson_i2s_pci.c
> +++ b/sound/soc/loongson/loongson_i2s_pci.c
> @@ -16,6 +16,8 @@
>  #include "loongson_i2s.h"
>  #include "loongson_dma.h"
>  
> +#define DRIVER_NAME "loongson-i2s-pci"
> +
>  static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
>  {
>  	switch (reg) {
> @@ -92,13 +94,12 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
>  	i2s->dev = dev;
>  	pci_set_drvdata(pdev, i2s);
>  
> -	ret = pcim_iomap_regions(pdev, 1 << 0, dev_name(dev));
> -	if (ret < 0) {
> -		dev_err(dev, "iomap_regions failed\n");
> -		return ret;
> +	i2s->reg_base = pcim_iomap_region(pdev, 0, DRIVER_NAME);
> +	if (IS_ERR(i2s->reg_base)) {
> +		dev_err(dev, "iomap_region failed\n");
> +		return PTR_ERR(i2s->reg_base);
>  	}
>  
> -	i2s->reg_base = pcim_iomap_table(pdev)[0];
>  	i2s->regmap = devm_regmap_init_mmio(dev, i2s->reg_base,
>  					    &loongson_i2s_regmap_config);
>  	if (IS_ERR(i2s->regmap))
> @@ -147,7 +148,7 @@ static const struct pci_device_id loongson_i2s_ids[] = {
>  MODULE_DEVICE_TABLE(pci, loongson_i2s_ids);
>  
>  static struct pci_driver loongson_i2s_driver = {
> -	.name = "loongson-i2s-pci",
> +	.name = DRIVER_NAME,
>  	.id_table = loongson_i2s_ids,
>  	.probe = loongson_i2s_pci_probe,
>  	.driver = {
> -- 
> 2.47.1
> 

