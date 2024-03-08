Return-Path: <linux-parisc+bounces-871-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25682876032
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Mar 2024 09:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A95C0B22891
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Mar 2024 08:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85369210E7;
	Fri,  8 Mar 2024 08:51:54 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB3F2D056
	for <linux-parisc@vger.kernel.org>; Fri,  8 Mar 2024 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709887914; cv=none; b=iig36dJB1GU4BSbxhrN2OrXo44ZKeDlCkl/mJSy5QAbfRitvaCsAwY7UV7PlpQiqD31wHGkDGkc73IN3fkQNMzzDNFBd1Dpg4Xp3cNQlQS5Y0veS94RrcH5d6KVpk5jje1nfchJqXNSOt4WWn9ozufNHspSAelezjibk3mR+fbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709887914; c=relaxed/simple;
	bh=V5Lotr8EUHT4KiXi2hHGglbhHOSleVZ4X9wZxJR86yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UnIg8noIGqjysomJU5E7E0/HvbyHFiaFP0KNQqpAjDJG8CDCMpatfOSCUxBU++ZoVkmRSvHKHSyNpH0M7psCZ2yKaTvHbiWHFIicI5VHJWh/UX1HUkr42ui/B1PsIoplvzVAWIZZaUCW7oTc240ZRDHng5ppPDvy0XTN0GoNgW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxG-0006wY-FZ; Fri, 08 Mar 2024 09:51:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxF-0056NO-TD; Fri, 08 Mar 2024 09:51:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxF-00245p-2e;
	Fri, 08 Mar 2024 09:51:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] parisc: led: Convert to platform remove callback returning void
Date: Fri,  8 Mar 2024 09:51:12 +0100
Message-ID:  <a6c58690efa78eb20258f5831f0ed1861e357844.1709886922.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=V5Lotr8EUHT4KiXi2hHGglbhHOSleVZ4X9wZxJR86yw=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtRXF5t7oz/ucbwjI5GVKr4tUfvGnMRj1muKli+5qlalv KOg/G1rJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATWRfP/t/lKlPKhNUTAnce Yb278JC+xp+t5pxXJBoW2py9yhPCdjbWvK7dtqdi8t+8CVrGxsnttXyZZ858M+j97FAy4Zm+4b2 VE7jO9zgtF3N5Hdc4mYfJO2S9tTOPRVzasdv6S6SW5Fz6rZ15VC1cQHIt1zp1nsDLu/xdU2oTm1 yP/XPd/l5wxZ2ue8rXbC+8WXVTq3CGlrxrpEX0ZW21/SHWHjmSphGfZ96Iv3psx7dmI+0FNpnMy sGNEf4lHxZULC+zYA/aq3bidn0zf0N56CsVtod2P+92m63VF8pXEfla3v1gsiS38BIT3ks1XN+X W7z5cOhY51ajC5PrFynfPP+ihiu+r8loUX7O/ZXVrn4fAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-parisc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/parisc/led.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index 1f75d2416001..b49cb010a4d8 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -308,15 +308,13 @@ static int hppa_led_generic_probe(struct platform_device *pdev,
 	return 0;
 }
 
-static int platform_led_remove(struct platform_device *pdev)
+static void platform_led_remove(struct platform_device *pdev)
 {
 	struct hppa_drvdata *p = platform_get_drvdata(pdev);
 	int i;
 
 	for (i = 0; i < NUM_LEDS_PER_BOARD; i++)
 		led_classdev_unregister(&p->leds[i].led_cdev);
-
-	return 0;
 }
 
 static struct led_type mainboard_led_types[NUM_LEDS_PER_BOARD] = {
@@ -371,7 +369,7 @@ MODULE_ALIAS("platform:platform-leds");
 
 static struct platform_driver hppa_mainboard_led_driver = {
 	.probe		= platform_led_probe,
-	.remove		= platform_led_remove,
+	.remove_new	= platform_led_remove,
 	.driver		= {
 		.name	= "platform-leds",
 	},

base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.43.0


