Return-Path: <linux-parisc+bounces-3092-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFDC9F9FED
	for <lists+linux-parisc@lfdr.de>; Sat, 21 Dec 2024 10:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1C891892028
	for <lists+linux-parisc@lfdr.de>; Sat, 21 Dec 2024 09:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEC61F0E2B;
	Sat, 21 Dec 2024 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G+aImdx5"
X-Original-To: linux-parisc@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39E41EE7B3
	for <linux-parisc@vger.kernel.org>; Sat, 21 Dec 2024 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734774742; cv=none; b=K4nNjh4g5EULE2LGXbZkzqX4NXjRYpTQo3NHY/iT867nGilku80PBgrWSc7xCkkyg9+M5vdskx4k4VHWNrR+5MeyxAepnDwl6mVVYgM/K+zxfRmNFtbP/yroa5zVxrCvRTCee6ibN0w6iycvVN6j+mI5l0gJ6/5KI3+3sR0nAkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734774742; c=relaxed/simple;
	bh=bBQGMjtmehLhiHYnuPhaI6TAnsR36mqxUXDSdnaB/O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DR5gnspcpkV7WV1PHpGlfNvq34EqWbattNTy7xq55UScai7q+dz7m3lDvQb7NZVrww04jMlAIAzqcjAlZXr8U4RS8tVERLFCvnTsCjjwrUsYmqxfufOkXHCNkxmUvscz3A4J1o0p3Ue39GLoqTpjhNy+5XMh0iUKZ6i+gmPFwtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G+aImdx5; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734774738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7OlUS5D46h7r/4zsY2+HDH2lSpd8R101wqbvEQXcPGM=;
	b=G+aImdx5CI0/ka/LhCGBW1QaHRoVYXUhfCdzM1T42LvN1zDb7XmZ+J8JC3md2rUa5w8yHK
	v3dd9qAWX2vUaPi3R5Q8TwmsyEP9j9p+2s+Z+IdeKEb3azijoe/dzZwyDws8E7DKfgmq1J
	L1XcLpzz9o0Fbv6Ai0Wj+u4eKqa2g+k=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-parisc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: ad1889: Use str_enabled_disabled() helper function
Date: Sat, 21 Dec 2024 10:52:08 +0100
Message-ID: <20241221095210.5473-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/pci/ad1889.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 50e30704bf6f..9ed778b6b03c 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -626,7 +626,7 @@ snd_ad1889_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffe
 
 	reg = ad1889_readw(chip, AD_DS_WSMC);
 	snd_iprintf(buffer, "Wave output: %s\n",
-			(reg & AD_DS_WSMC_WAEN) ? "enabled" : "disabled");
+			str_enabled_disabled(reg & AD_DS_WSMC_WAEN));
 	snd_iprintf(buffer, "Wave Channels: %s\n",
 			(reg & AD_DS_WSMC_WAST) ? "stereo" : "mono");
 	snd_iprintf(buffer, "Wave Quality: %d-bit linear\n",
@@ -642,7 +642,7 @@ snd_ad1889_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffe
 				
 	
 	snd_iprintf(buffer, "Synthesis output: %s\n",
-			reg & AD_DS_WSMC_SYEN ? "enabled" : "disabled");
+			str_enabled_disabled(reg & AD_DS_WSMC_SYEN));
 	
 	/* SYRQ is at offset 4 */
 	tmp = (reg & AD_DS_WSMC_SYRQ) ?
@@ -654,7 +654,7 @@ snd_ad1889_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffe
 
 	reg = ad1889_readw(chip, AD_DS_RAMC);
 	snd_iprintf(buffer, "ADC input: %s\n",
-			(reg & AD_DS_RAMC_ADEN) ? "enabled" : "disabled");
+			str_enabled_disabled(reg & AD_DS_RAMC_ADEN));
 	snd_iprintf(buffer, "ADC Channels: %s\n",
 			(reg & AD_DS_RAMC_ADST) ? "stereo" : "mono");
 	snd_iprintf(buffer, "ADC Quality: %d-bit linear\n",
@@ -669,7 +669,7 @@ snd_ad1889_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffe
 			(reg & AD_DS_RAMC_ADST) ? "stereo" : "mono");
 	
 	snd_iprintf(buffer, "Resampler input: %s\n",
-			reg & AD_DS_RAMC_REEN ? "enabled" : "disabled");
+			str_enabled_disabled(reg & AD_DS_RAMC_REEN));
 			
 	/* RERQ is at offset 12 */
 	tmp = (reg & AD_DS_RAMC_RERQ) ?
-- 
2.47.1


