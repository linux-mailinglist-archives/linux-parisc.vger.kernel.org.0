Return-Path: <linux-parisc+bounces-3767-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E24CCB000E9
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Jul 2025 13:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4D141C86824
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Jul 2025 11:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D1224E4C4;
	Thu, 10 Jul 2025 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="M6qdZQcV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster1-host9-snip4-10.eps.apple.com [57.103.64.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB272550D8
	for <linux-parisc@vger.kernel.org>; Thu, 10 Jul 2025 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752148642; cv=none; b=obCgqqXFLys1zdo+8Zn0XZsflkN1YFxX71AmfiiYQn0J+LxrBTzTkYHxGjmy7cP5/DxDoi+giUO4IHkRRtfc46V3rwwz2TBE36zbQ9C1ncJb1pUvWO5+fr8VRj21MPpiOGxjmnLAmGXx7MMUd69qFdTc78dlmONEAowIiVMUXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752148642; c=relaxed/simple;
	bh=1Rhoe7BHxRF/MuarYDxZKPJyK9zbtaR0YOq3N+f0hSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lG7+fd9kpsk2Ue//6qlwMGy0Z4YIhoSC5d5iaz+9G/Ec/a0xDm87Bb8slcHdkKWf0zD96K6tKLbuPqn7HO5ux6GxfEx3bJoXZflS8ycPafhmG2iE5hCk5yA5LHRYjiOYY1uYp8ftDScy2KP+e9hybYCXxk02n6x3tmqsl5YvmAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=M6qdZQcV; arc=none smtp.client-ip=57.103.64.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 97F55180022B;
	Thu, 10 Jul 2025 11:57:15 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; bh=3cxFlBecLs+olRGOsshuIdceYjGpKxI6JcAkEkmJa30=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=M6qdZQcVihI0IpOQo0KB1wmOOlrNCLgh2laqcmiAiF+pi/bVd343qQiIjZSdd41F+HTKsYHAMGIohFZv3URjA6Tv60X83ocKE3nZa8via19UveP/IJfL40fzQ39KVYO5Mbm3cYffnJpv/zqzuZC9WEPf7ES1tZphymp88Nq3AL0hasEt1GLLVBhvfGMJ7QH9XEH5bqR38QEeiVPO4I3VmWY0MDAGHqEpCiUCtx93cH9TJAtgBxFnt6mQ87rfSkalNM7Dt/xAQRMMn/WFJNjVlWf6SGVS1uXHSkZG+6byswlkRgaL8eL3Yvc49tDxBVqT35mJJu1DnA1Ln/2vDlr3iQ==
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 581A718001BB;
	Thu, 10 Jul 2025 11:57:11 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Thu, 10 Jul 2025 19:56:44 +0800
Subject: [PATCH v5 1/8] char: misc: Move drivers/misc/misc_minor_kunit.c to
 drivers/char/
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rfc_miscdev-v5-1-b3940297db16@oss.qualcomm.com>
References: <20250710-rfc_miscdev-v5-0-b3940297db16@oss.qualcomm.com>
In-Reply-To: <20250710-rfc_miscdev-v5-0-b3940297db16@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: j18TwZsvJ0ObSZZ3HtvZo9u3Xj6bew58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwMiBTYWx0ZWRfX5NSmSshhNZXa
 mWJ8uO1FhbQ2XcX0sY6XGt0FIxWqEZASFK9Nu6ZgTCkW7MgvY3lTOG0tVJ6wFcbqnaKn+WfeL3b
 49svbxV9VHKkiB5UsNApTAKjtFMQrCMHppdONP5AQbouKRSyqBnhU2XDNQ0OO7k/yCbALO3teJA
 OPjx5rAo188XPjIG8+GSaj1panPCyaHlBtwNjJX+h+0plr7lOjpw+HOj27sqCz+2Cgk2XuaH3Xp
 Ym04GNk34RvEzjRakVOly+1N3r+icbNAHF+Zk7Ulu8052EXkFN/DpIv4U1CL0zvf3UWwCMkUc=
X-Proofpoint-GUID: j18TwZsvJ0ObSZZ3HtvZo9u3Xj6bew58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 mlxlogscore=936 adultscore=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2507100102

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

drivers/misc/misc_minor_kunit.c is to test APIs defined in
drivers/char/misc.c, but is not in the same directory as the later.

Move misc_minor_kunit.c to drivers/char/.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/char/Makefile                     | 1 +
 drivers/{misc => char}/misc_minor_kunit.c | 0
 drivers/misc/Makefile                     | 1 -
 3 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index e9b360cdc99a7fee9c70eabcffe9caf763552aa2..1291369b9126511ff41a06f956af4bb1de7ea4b2 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -6,6 +6,7 @@
 obj-y				+= mem.o random.o
 obj-$(CONFIG_TTY_PRINTK)	+= ttyprintk.o
 obj-y				+= misc.o
+obj-$(CONFIG_TEST_MISC_MINOR)	+= misc_minor_kunit.o
 obj-$(CONFIG_ATARI_DSP56K)	+= dsp56k.o
 obj-$(CONFIG_VIRTIO_CONSOLE)	+= virtio_console.o
 obj-$(CONFIG_UV_MMTIMER)	+= uv_mmtimer.o
diff --git a/drivers/misc/misc_minor_kunit.c b/drivers/char/misc_minor_kunit.c
similarity index 100%
rename from drivers/misc/misc_minor_kunit.c
rename to drivers/char/misc_minor_kunit.c
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 917b9a7183aa1db63cc4049c042c3437f6756a1a..94f44e6c2db79dedc3839bbfb53e10cde103fbc6 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
 obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
 obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
 obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
-obj-$(CONFIG_TEST_MISC_MINOR)	+= misc_minor_kunit.o
 obj-$(CONFIG_SGI_XP)		+= sgi-xp/
 obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
 obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o

-- 
2.34.1


