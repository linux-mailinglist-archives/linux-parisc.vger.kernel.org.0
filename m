Return-Path: <linux-parisc+bounces-3707-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A38FEAEB4AB
	for <lists+linux-parisc@lfdr.de>; Fri, 27 Jun 2025 12:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5B2B3B7152
	for <lists+linux-parisc@lfdr.de>; Fri, 27 Jun 2025 10:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4D62DD5E9;
	Fri, 27 Jun 2025 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="k2+CuFGi"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D661E2DBF4F
	for <linux-parisc@vger.kernel.org>; Fri, 27 Jun 2025 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019755; cv=none; b=RB3HNbqcMH0bR/OCuLGw2nBMUMciZs8fPCO2Wq6hNw3Gt9HTtmo5yvB2WetM67J0OMA4agXYVol/KRVyFkYRvhilA6fld+C4Mz7dDPgTsyUtm6qvLye8kJjmoIJpm+nfDatLwX4cYx30PEImXwVbbciMX4+hKtzfsRCuOibWBhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019755; c=relaxed/simple;
	bh=s8ZiiE6pHUvr9gtLMt4WDPecDrQRJim5pyRk8EKuUdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N3i8YMogw1alnrEpx26/nzl4+Hmv3X0cKI6+KBYKBLRFNyFiyQtcFDmPs7BT8Mg9X21Gg23KBiX3vZr/El4S+/ztOmIgcJSaj2Tu6QWRwC+frGysoyizeRAi00m5dHjtaUYRv40UvyY4/uxw7ARCfqfz5xj+zyqhMBFTuFu35ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=k2+CuFGi; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso352618366b.0
        for <linux-parisc@vger.kernel.org>; Fri, 27 Jun 2025 03:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751019750; x=1751624550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGUGwnAuhK8MqbgXiShFzJdKHPJL+NaZqgwZsBl0yC4=;
        b=k2+CuFGi50chqJqdmP1/ruwT3KGhSiLY0i8WUBRnGZr8nKFBbfMRr1mQc1D4zsYxCG
         ZAoQkKyX1EyJ2F1jKuHCRjUiEuWcLjNd4RUju4/6EPRlhWcvAx0ZzS1feAHOUHjPY2pp
         rkjL+3txpVJZq48NDVatU0PhMp/x+QaOa5Yt4gPyEtqUAJOXKmnWq/HGQ9Une9i7rx0W
         ZOiZzpRUi5Pu33mniAA3+oU3LIrSS1rYNsmn1jPqOYpfQDK8ghW8/vidPD7r6awQ7L19
         2/ifltrdSJWpMCBN3M3thnQoeXv+fSicfKGX46mNDmSily1FrXXeo8whhkrQZ4moZKtY
         LPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019750; x=1751624550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGUGwnAuhK8MqbgXiShFzJdKHPJL+NaZqgwZsBl0yC4=;
        b=khfbWHSFi+VdQJutf7O5686w/ZbnKbgAbnwU0sowC/UafeRmgtGeKkPKRsdC+h0z2P
         ql8Wp6bLY1GTS51k4H+lJDCp8ezLUnZHOCGwPPDRI103boXALMbGeipalZKC663HZjv4
         1g2TnSlQyvK5dk0/VLJJXns8C2vMITXS/PWMMwL5IaoGLHcCf3cbBM1/GvxCxoWNhB3j
         rNYAj28jsLemI166y8T9YnMEMVDTiNp++bSxhMGq3JKSOVtfsJ7R7IWFVymBcdphSPhT
         eBvyPT3UzL89Z1QVjqNAeujQ3kRbLEy2zTcpxIG6wVp1xVOoI7nfIeyoRCGtA2ny6t4W
         mKkA==
X-Forwarded-Encrypted: i=1; AJvYcCVEBKFqsH44VN08lVhBQwYU/nnpbAabcMQRa1Vez05bF+G4q2YNQQomADIPqCjcR9OD6bFQe26JJerA4fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXSy4rDxnwat4ZXMG2janL/yDjNYxm5QgQ1WewZX1eo7Vbkp6k
	GbGPsWZE1FfT/13T4cuPJ2yyn2qtOezmEFRUMdJUsCAN/Noi9gskcAYZ9HYwevD5CCs=
X-Gm-Gg: ASbGncsnY1NupJuWVdx46nzKdicE1J4vbVWNcnCHRjSQIw6iKkayHJloF8tvSd1jmeS
	h24bigkQSA8BuEBL1TAMtSYqox7MMSogA2DypgQXdU9Q+h2tbOp3vaQrONNA/R6+xbT7/z4iuV0
	YwwRRd2zn3ICiKFv7fjcazfaFCOUvgb1IrQLt9VLfl+jwZdieOSFKs16VGmpNXTFdEUJvSEnXjg
	VJ7VcaXiqMqIuZa2l+kEajy13bi2/rRA+t5XQVjKhxSZdJbUE/0cmghNK0f7BycUWC8RXrzq7NU
	3kAY2ASZ9nOPMT8L5/nCLKZBy+Y98K3VRFdzE3l4ia4nLPs5QJVD3Y8VTNrMt+ORx9g79ME4Bgw
	76DlMnm72eGA4eEy23qwM3t4997iO
X-Google-Smtp-Source: AGHT+IE91OPz08IFTkinkt2AHiqhjKg3XMlDuTR8nwgBpzRrkeW2Al5f9bM+VB6od7e4zbBUhZYi+A==
X-Received: by 2002:a17:907:7fa2:b0:ad8:959c:c567 with SMTP id a640c23a62f3a-ae35024fe25mr244930366b.10.1751019749860;
        Fri, 27 Jun 2025 03:22:29 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae353c6bbe3sm97297066b.118.2025.06.27.03.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:22:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH] net: tulip: Rename PCI driver struct to end in _driver
Date: Fri, 27 Jun 2025 12:22:20 +0200
Message-ID: <20250627102220.1937649-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=s8ZiiE6pHUvr9gtLMt4WDPecDrQRJim5pyRk8EKuUdg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoXnDcMjJBYg5gCFIS22jS0XuNYbfDlnIdAovsd FAxr2zVZF6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaF5w3AAKCRCPgPtYfRL+ Tu71B/47n29FL5xDhs0JB0Z6fwiwT6cSBmwA2DKeJN9JTAO52f4BOIn/xG+k4CIL8PDVS1jewQX 4ZxGCTR3gdGmxIUMjPA1XYuao+NRl2J2wHaWPUXh0/QhWIoC1gBaEDKRB+2KR8FYgZLJQbyLxo4 8MCW8ANovTUBEcTQEo2S2/l2PAx6+1Y17ac7WaI7nO6LYBfW5HIm1ki2daioIztAakncfJt6nxT Mi+Np+FwiAY5bFaQ7f7sI09Kjrpe0wdyICVHxk2CvqWGzluN+orNZ+I22mEFD3I5/8EdZ18wY3I 8TD4cWzg4NwQCuxzJP/jpuKey+yk1efSdCTNRW8sjpPc9Gmr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This is not only a cosmetic change because the section mismatch checks
also depend on the name and for drivers the checks are stricter than for
ops.

However xircom_driver also passes the stricter checks just fine, so no
further changes needed.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/net/ethernet/dec/tulip/xircom_cb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/xircom_cb.c b/drivers/net/ethernet/dec/tulip/xircom_cb.c
index 8759f9f76b62..e5d2ede13845 100644
--- a/drivers/net/ethernet/dec/tulip/xircom_cb.c
+++ b/drivers/net/ethernet/dec/tulip/xircom_cb.c
@@ -143,7 +143,7 @@ static const struct pci_device_id xircom_pci_table[] = {
 };
 MODULE_DEVICE_TABLE(pci, xircom_pci_table);
 
-static struct pci_driver xircom_ops = {
+static struct pci_driver xircom_driver = {
 	.name		= "xircom_cb",
 	.id_table	= xircom_pci_table,
 	.probe		= xircom_probe,
@@ -1169,4 +1169,4 @@ investigate_write_descriptor(struct net_device *dev,
 	}
 }
 
-module_pci_driver(xircom_ops);
+module_pci_driver(xircom_driver);

base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.49.0


