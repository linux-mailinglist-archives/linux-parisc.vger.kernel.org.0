Return-Path: <linux-parisc+bounces-3751-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E48AF942F
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Jul 2025 15:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C59E918891A9
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Jul 2025 13:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEF12FCFD0;
	Fri,  4 Jul 2025 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="tofw/KkB"
X-Original-To: linux-parisc@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster1-host2-snip4-10.eps.apple.com [57.103.64.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B7930748B
	for <linux-parisc@vger.kernel.org>; Fri,  4 Jul 2025 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751635729; cv=none; b=DelugsFKAILjX2r7MgXp5zMhko/F3DQGGiRUPFZa+6kI053WuGlxLP+JydFHmEshR4lmOPPbAhq9S+8dgl+GGXxZqHfbk+Fs3BhQR3zY1l7yF5dfTrssPOUGOqaAU70CbidfeqDM/U5egGN4Jmhu60DjfKm+3iYMQncLofyxTgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751635729; c=relaxed/simple;
	bh=abVLHhlrbRD4j7Q9knssLHFcwdKTohtl5aEN2e8X638=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDXYaBHhXBD2s80JBPDUoFMPv8kQegDJrKwfJDB720VhexJeMm+shM+IfQ9+/jJTWbkkkccJWe+YAKabniwFX2KEqbZYx0+mgKQYU8Y9VhOqPrZ3nLIgVeW5+zSZFnz7TxbaYH8WLpjGb4iFmkrTPJpGUzDRCRiXUaI5w3QrArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=tofw/KkB; arc=none smtp.client-ip=57.103.64.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=OZilOEgmhkbniE4e1rdKTYefieL2PDjJBxvY1WxL31Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=tofw/KkBc42tT2g3cnzlQpM97ojeBygBqSdUNsKNEUsbIq2zws+LhNI5A/qxoSgUv
	 c2KmZ9oX4rJcyfN9IW+PxnAkcxl/RORMBT0owOwPvsswPV/dSWRUfZKKHFxj3InG2N
	 /xdGbV0eajT+vci13NAN46Z9tFIjBSgjwXvhxFU8uyJjp+uj1ale6hyuXUNbJaP3X5
	 jp4HAyNgWTQu5JArEQOgL5Q2rCScigUY3UG7/QlOPk4s26DniUPIUrOyh+7cYIziJq
	 Kpjo/9a+F9dh3FEydvFQ8bHGydVy6SQ2VypiLXYJFTYwG6UxIwC0/kTFKa70BYFzhQ
	 XH0ZDi81faOTA==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id EAA1A1802113;
	Fri,  4 Jul 2025 13:28:43 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 5E20718034AA;
	Fri,  4 Jul 2025 13:26:36 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Fri, 04 Jul 2025 21:26:05 +0800
Subject: [PATCH v4 7/8] char: misc: Register fixed minor EISA_EEPROM_MINOR
 in linux/miscdevice.h
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rfc_miscdev-v4-7-b48986112d6a@oss.qualcomm.com>
References: <20250704-rfc_miscdev-v4-0-b48986112d6a@oss.qualcomm.com>
In-Reply-To: <20250704-rfc_miscdev-v4-0-b48986112d6a@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, 
 Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: lAKkc_CO_LmXz-dQhyBV7aWZOXttmFhr
X-Proofpoint-ORIG-GUID: lAKkc_CO_LmXz-dQhyBV7aWZOXttmFhr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwMiBTYWx0ZWRfX+CQkgNphkGcA
 prZPbrljimj1I6yuCmlJLG8M2MIbes1+5pkhf/qiV4Ro1wNeSc10WlG9EREF+znTlbqhC3sMNVK
 M6Cxwqh9lNHF8ZM2jSX7/uucLHlHO41sZ85XEBtxxHAUbAmU3k+PavNV9RbfNQihrN8lLgSpt5B
 AEB1rIh3D6DZYLfPa/qRrMyswX1cgrbvRN4Y8XvxqectIYJ2D8fcY3qmix14Cuqtm06NDHsa7F0
 QAKQUmAcPv8BiTAF0g3YlmnQQzkBXMj+b2DFh2VSW1iefxzw1oLL1khJZGutwrEWzILuTlwb4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507040102

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Move fixed minor EISA_EEPROM_MINOR definition to linux/miscdevice.h.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/parisc/eisa_eeprom.c | 2 --
 include/linux/miscdevice.h   | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/parisc/eisa_eeprom.c b/drivers/parisc/eisa_eeprom.c
index 443b15422fc179c7379082bb165ea2bb80785fb3..601cbb22574fd64b0c6be568442d5064d38a2c20 100644
--- a/drivers/parisc/eisa_eeprom.c
+++ b/drivers/parisc/eisa_eeprom.c
@@ -15,8 +15,6 @@
 #include <linux/uaccess.h>
 #include <asm/eisa_eeprom.h>
 
-#define 	EISA_EEPROM_MINOR 241
-
 static loff_t eisa_eeprom_llseek(struct file *file, loff_t offset, int origin)
 {
 	return fixed_size_llseek(file, offset, origin, HPEE_MAX_LENGTH);
diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
index 565b88efeb23d02b7d91df1cd7df4bdcf2898224..7d0aa718499cc1867790e98eb6b84c1673091905 100644
--- a/include/linux/miscdevice.h
+++ b/include/linux/miscdevice.h
@@ -70,6 +70,7 @@
 #define UHID_MINOR		239
 #define USERIO_MINOR		240
 #define VHOST_VSOCK_MINOR	241
+#define EISA_EEPROM_MINOR	241
 #define RFKILL_MINOR		242
 
 /*

-- 
2.34.1


