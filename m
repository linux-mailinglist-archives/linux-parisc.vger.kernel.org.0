Return-Path: <linux-parisc+bounces-3380-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46683A58857
	for <lists+linux-parisc@lfdr.de>; Sun,  9 Mar 2025 22:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0892A16AB27
	for <lists+linux-parisc@lfdr.de>; Sun,  9 Mar 2025 21:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C896215770;
	Sun,  9 Mar 2025 21:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVrANalD"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87CE214205
	for <linux-parisc@vger.kernel.org>; Sun,  9 Mar 2025 21:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741554398; cv=none; b=J6CbJ95mXzWAhh9Oi/HSiLZIM+En44qNIaPGtqqArqG5ZO9qtAKoCVaWVinJj98Qt2VZ0vbKhU96JcREgvA4yXK8dnqEigYqI8UG5WfwOmkBmW/3W5VOuveQIUkR8WyHQam9X2mHkkAMEkByXr7CVVggn1Fc9KBF1wXJMFHN9nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741554398; c=relaxed/simple;
	bh=XEcHJMASdU1/M3wgMkZ1PzvYQJanoP95NDLDCOJjgQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1h2QI5R50bGS7se/33WJKQaUWF+jzTI8yJJjbJgukRiBeLvAge92Z5Ul5/CkkAasTeHNQaxDGSkNbFPZBO57V3pPjuaTvVSMRYXpbvp5EqG4rQAagXGajmQWwwoiTS2Fn5Ttf7BJIa8KvdTPm07qyYPyhK5YCcJGKJ62P6c48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVrANalD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3A1C4CEE3;
	Sun,  9 Mar 2025 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741554398;
	bh=XEcHJMASdU1/M3wgMkZ1PzvYQJanoP95NDLDCOJjgQg=;
	h=From:To:Cc:Subject:Date:From;
	b=LVrANalDsfQte9a/bNRo+9bNXibgfHUShtv/HK7XeOUmHwIZY0p1h5+4IDdNZIOfS
	 fb5zrw59jtS7oo3BWg2IRmwCRAyIDgSXZNbaGHjGS8GDtcK83tFfnfbButh9wiWFjr
	 8xZD6HerpCKEXBzX+ijkzulQO5BdD+0rOqdwvD1dApUp8Yo1Aa1yBw9OOQFDfXvsAM
	 oOqHEegc0RcYlg61l4WgKyTV3M9KySDJz/gADaS5g4hUSPNGdQZYErPm4So79D1qEo
	 PvZYJNywZ4vO6Z94vcP1eaNE0QK0hXW82O23nErqBnOjlqAmTPKbq43rSfOKYAMmTP
	 osDGJR8RexAgw==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: led: Use scnprintf() to avoid string truncation warning
Date: Sun,  9 Mar 2025 22:06:29 +0100
Message-ID: <20250309210629.28798-1-deller@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

We intentionally truncate the string and store only up to 20 characters
since the LCD display does not provide more chars. For that use
scnprintf() instead of snprintf() to avoid the warning.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 drivers/parisc/led.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index e71674753711..016c9d5a60a8 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -39,7 +39,6 @@ static unsigned char led_type;		/* bitmask of LED_HAS_XXX */
 static unsigned char lastleds;		/* LED state from most recent update */
 static unsigned char lcd_new_text;
 static unsigned char lcd_text[20];
-static unsigned char lcd_text_default[20];
 static unsigned char lcd_no_led_support; /* KittyHawk doesn't support LED on its LCD */
 
 struct lcd_block {
@@ -456,9 +455,8 @@ static int __init early_led_init(void)
 	struct pdc_chassis_info chassis_info;
 	int ret;
 
-	snprintf(lcd_text_default, sizeof(lcd_text_default),
+	scnprintf(lcd_text, sizeof(lcd_text),
 		"Linux %s", init_utsname()->release);
-	strcpy(lcd_text, lcd_text_default);
 	lcd_new_text = 1;
 
 	/* Work around the buggy PDC of KittyHawk-machines */
-- 
2.47.0


