Return-Path: <linux-parisc+bounces-417-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B635839400
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 16:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD9E11C2386F
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 15:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820B561679;
	Tue, 23 Jan 2024 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1LE7tl+"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C36167C
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706025565; cv=none; b=cThuPuguZr5BabgPXKbJ297uNEavjjYJ2SsVsnsdStVzeCLJNN/C6cN+Qko8nXqJjPvJZfaLEaDJQeS+iyjHoV2Vj8ePRmgadujCQQue2z0/urHplsey4LM0EONrkPLY+U8b7Ftkn3yhroiKjF8H79fcc4ej3CBd1OvYm8EHnHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706025565; c=relaxed/simple;
	bh=73qFuYasz0mQEmxPeu3hv+8nCU445gydjCiGlQEFpsQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYTCGDlRTWTNnHwQcMDoAQnMKtZiNGBy5pYFRk922Q+tRGIZRuc6HF3tSINUPK8VANBDZiAMHo/OCDqVDrXRMnR5Y/f0IeUXGNkQHiw1F6B7lLprUFTF1UDlLD6ya/XJ4Tj/q8gSlV11XteU/2q8KjiZDoXpe9xB4sutIAFXSCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1LE7tl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611EEC43390
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706025564;
	bh=73qFuYasz0mQEmxPeu3hv+8nCU445gydjCiGlQEFpsQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O1LE7tl+tJ0g8uqvI7Rw2axfwyWjVevOVpqr5MK7anJY41QeEWliUyPa52Hw8hBC8
	 c0D5yq1VGrSuAuHIkvilVDLmSjk35RSo0RGgE3XDWZdWIyg6bXY5Whxh6AwS5nW/sP
	 p62eXkHW7KO0+NRAXylnfZrLDEiD30+8DWnAnBgfm6lqLp9kqRTIIM/RR8CzlMrdCx
	 Cw0gA+hPGn0F2FAX8bUuGjTNXhNoiDHdaMP4XXFkmZzWJCVxyuaOZ4BTy138Ry+zYr
	 fZTGmfU8HEl0yV7X+aWZoNnTSTyQa8X/kYj4L2yZ0u8fcWJ7O5X0xN+UjoLtvlUM2N
	 W3b0BxMGcLfXQ==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH 4/7] parisc: Prevent hung tasks when printing inventory on serial console
Date: Tue, 23 Jan 2024 16:59:01 +0100
Message-ID: <20240123155904.6220-4-deller@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123155904.6220-1-deller@kernel.org>
References: <20240123155904.6220-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Printing the inventory on a serial console can be quite slow and thus may
trigger the hung task detector (CONFIG_DETECT_HUNG_TASK=y) and possibly
reboot the machine. Adding a cond_resched() prevents this.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # v6.0+
---
 arch/parisc/kernel/drivers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index 25f9b9e9d6df..404ea37705ce 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -1004,6 +1004,9 @@ static __init int qemu_print_iodc_data(struct device *lin_dev, void *data)
 
 	pr_info("\n");
 
+	/* Prevent hung task messages when printing on serial console */
+	cond_resched();
+
 	pr_info("#define HPA_%08lx_DESCRIPTION \"%s\"\n",
 		hpa, parisc_hardware_description(&dev->id));
 
-- 
2.43.0


