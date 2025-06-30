Return-Path: <linux-parisc+bounces-3710-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAF0AEE50C
	for <lists+linux-parisc@lfdr.de>; Mon, 30 Jun 2025 18:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1624189D53A
	for <lists+linux-parisc@lfdr.de>; Mon, 30 Jun 2025 16:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A4517A30B;
	Mon, 30 Jun 2025 16:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SHaQFO1R"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D5A291C38
	for <linux-parisc@vger.kernel.org>; Mon, 30 Jun 2025 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302456; cv=none; b=egeq2LMJMxW5KY0ifQfqB5Cm2m50n94xBBoOs4GZxc8FzCefwRXKZOQQyb9xlWIY5wMUCfJszlbM9aQXN9Q9zm51vrjszdILFqzBcHI3j9Ml1GT+GPRSeO1MFqkanwYhukzdBjn+yywnH/VGAw5Pen4S//Vopnd9Xz2KLZm8wz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302456; c=relaxed/simple;
	bh=Bua19u83N4yQfBvV+FR0C6HCUTQZzUf1l8HOnCaYXbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VelKQYynpNELCbM5Ovk9MXYzrog4udmOOezlibOl1pcjXTVAXKYW/EUJcFFD8LQjaz/w7UBxjgwsloHHDbZYfuwO75dG40301diYFpANl8Q8G6fcyO4ZrT10VicWzZoQTft3a+z9v0KjXXfblgONSQQszHQ0AFtkVZj+gY7UBJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SHaQFO1R; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so9898759a12.1
        for <linux-parisc@vger.kernel.org>; Mon, 30 Jun 2025 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751302452; x=1751907252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AVlTKyPObX8xANSWlvUCIPQx70rBMPsGogAF60L6kB8=;
        b=SHaQFO1RYTeCIVy9UxHJ847MWJ3cxmWJR0NQbISGSOhkk8KwTyrZtWl990ZBSTWQ/F
         74gWfBS8wRLrGT/ACGj4x3Vgyg5C7TUql043fdLJ33WpYXewcvLV5ZSS2t4XMMiKZNQE
         k5MOC8RxjlZ4PPeoZhTyzCT+XeqeB+WY8MJwTth+gANfcTqVsrCJeui0zDZGWwsb/BuU
         Orw1ewzf3TO32K806AKry2FQnvscOeY5beitUS1oYMy+Od2Q+xMdgltvhpJ25UK+4blP
         XYZIDq+k6dbWO3/BBzEq9R41omJq9n/UnoBcab+Dmx+vYwElsxgaJ7HaEPvJpY9QdmgD
         zVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302452; x=1751907252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVlTKyPObX8xANSWlvUCIPQx70rBMPsGogAF60L6kB8=;
        b=dD4+DRF0ViHZL5SCcM+Yz4MBtV4X1qm8R9tpN/gUkIslljklPUueEn+JDaP9mPiJrE
         WVK89n1acvpPZxJTxrynY2IX6owcO7x//AGR11e1agamriFDNjGfUwCbcogPuEN5GRA3
         CsuJn/9vk7Q/Wz5O2duB4sdWD4EYWQVNZr4GreqCf2/AjngvvsmszpFhncmyq7ISzWIM
         ZHV6vdSnS7mhn1RkPfOXs7ENO0nOfn3BTdlvxGE/c4j9NLtU9wPpCKBq0WpKVpJbDbKn
         twJ1QrCA74yHIljE6DUFSPr7gly3ZZB2JO2qIQcYTW2OecbNZY7dee6qtybAiN/H5tlp
         hMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCURzcunr0DPesTMOo1KjcmEzQvzKsk0pBv4F3ct0ghhOSnnm+cl136g6JKlO9Amqb4q/TBwyLAoMgTVyps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzKitqcNrbiWZ29RqnO1mFVgkMoEEMUbEefRvpifcaGkcHrP7N
	MXKVjCfoLiZErEo6yJWm2bs+0T8m0aI8y8p0n8CyNAYywCXS1YkJEVR5tZZkQelYuKU=
X-Gm-Gg: ASbGncsQH3He9ScUP17qoJ9pcKFQSMJsStGW38WNXpBXYQI6JPVHCJ7a133Dwpztq9M
	yM4Xol1u6gQZONiSJwwdfNt7MlEEfjfR1mEBbYCWVYw1Fek+GWpebvEAGTnmMPha10UYDIquVsG
	kS9ZAAL7JNErLc4xO8Ubcj3iAWhik5jlEaHNG08M2+r3OAZXxBn/4eI/7uN1b+p2XRdY4gWYfcD
	mj2zhuOaz4hRlUvc9HWID9Cerx/UWUdeFsNH6Ux1GPlRDzEL5SkQlT11r0CwiZCZ/ocI42aDErM
	tvc3eEYE9UL9SP/Ih3HLt8+6GZvI/vB832bl8AfsrLj2yZ1s2EsKVi5kP29mFyrHEh/BvtvENXV
	u54Tq/Q7AM5slMDaeGF4LZTcCH0CT
X-Google-Smtp-Source: AGHT+IFoNMUIVI+EmRrZyQRvO9MnLGs5xGWA4zruF04k/04nMdTcPKgpKS/KKk1l0zHkMasXnYubpQ==
X-Received: by 2002:a05:6402:34c7:b0:60c:5853:5b54 with SMTP id 4fb4d7f45d1cf-60e2e84e47bmr228282a12.14.1751302452287;
        Mon, 30 Jun 2025 09:54:12 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60c831d25cdsm6228579a12.64.2025.06.30.09.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:54:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH v2 net-next] net: tulip: Rename PCI driver struct to end in _driver
Date: Mon, 30 Jun 2025 18:54:03 +0200
Message-ID: <20250627102220.1937649-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1699; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Bua19u83N4yQfBvV+FR0C6HCUTQZzUf1l8HOnCaYXbg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoYsErsc2xrMhxvuAp3NDvoDSlWyc/9thZStGyk WAgYH+7KeSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGLBKwAKCRCPgPtYfRL+ TiIeCAC6ugc0ToqGufz3eVqgUsyYI4Http0lUMNYc/NK8dwXURH+01xjxLktNgdDVNd7hTWwdmM 4L8Y7hg921vZSYXg0CrBulz8pM3p8kZDYF6r7cO/2UwyvMw5ps59FjODC3YnADFF0k+PqoSRlF3 Uq/pMzE7a+U6DWO3Lr3Dx+02uShT21AJc/fdZhQg3YbaxlVbZcW6r4HFnqZhfqH3lKr4evMoTnR Y/Get/oJw/n7Q7TrStT85v9OuRvMktFO3ujIVOT/zANpAPiIhCFsCMHg4fXTEwOHEu2YDIEeNYj o03fAYuGYKyDkLbMRgAjGGALnb5qG6w4Qs7YWbmun5aKpx+b
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This is not only a cosmetic change because the section mismatch checks
(implemented in scripts/mod/modpost.c) also depend on the name and for
drivers the checks are stricter than for ops.

However xircom_driver also passes the stricter checks just fine, so no
further changes needed.

The driver got this wrong for the longer than the kernel is tracked in
git, so commit 1da177e4c3f4 ("Linux-2.6.12-rc2") was already wrong.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
changes since implicit v1 (available at
https://lore.kernel.org/netdev/20250627102220.1937649-2-u.kleine-koenig@baylibre.com):

 - Improve commit log to explain in more detail the check
 - Mention the introducing commit in prose and not in a Fixes: line
 - Explicitly mark for net-next in the Subject line

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


