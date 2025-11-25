Return-Path: <linux-parisc+bounces-4310-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A01C85772
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Nov 2025 15:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ED8A3AB046
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Nov 2025 14:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EEE32572F;
	Tue, 25 Nov 2025 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRFgKXIf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2163632572E
	for <linux-parisc@vger.kernel.org>; Tue, 25 Nov 2025 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081696; cv=none; b=Q3g6emvTc2b6Y3zUOWnYlO5MR+kdSvD+EAhgdpkeT7pVs0gTyNTNbaKwp5Rr6w/L+bTKIeFqXGCoDjzIxKAlD8MWqtSdqfyQ3RIvbTDC7YSxJT8935TSg+O6vciLjPaCmmaUuFTG9L4hWBKKTHsz4o0FcuXNmkX3UbVcyszEfs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081696; c=relaxed/simple;
	bh=QL9Ah7Jwb+qHi4RNE5KlIpKh4+8sgeu7pPKv06nzbnA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=QkzDqws4U3br85b5ylccyqM6C2jH0iA6uuTwIGejrnfERPhO3Z9+72k/XADssJTgtO9Jos9i0AtGwf9AXNK4rFjgbbQWm+cVJnZ+wSvo1NbF1P+oMXGEY/bIE1IPyqrN9ch0ZdjOjSxAilWup+Iu5c4W8uW2nBk+NAwm8jerPo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRFgKXIf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB4BC4CEF1
	for <linux-parisc@vger.kernel.org>; Tue, 25 Nov 2025 14:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764081695;
	bh=QL9Ah7Jwb+qHi4RNE5KlIpKh4+8sgeu7pPKv06nzbnA=;
	h=From:To:Subject:Date:From;
	b=TRFgKXIfyg2Q8ebXmgqwqaJViwUntC3YF7i9uKmOunBXYDXYpequuFgodQh/U13jh
	 TL16LZ83Ad5htY2diYoJZL6TNSbbMrTIvx8gyLnc1LO+rI9vmwwWLrUUeDaMXmQ3oJ
	 BrfLt3nSVxfoTK6hEzTmhnjyoNN6UMqywIOPTyeTbuvjUYDMovlKxLnJ0tv0+HgB6Z
	 XjGKxuABZWLhfeMvXGAOTiSOGc6J0Ern0W/HOMULrjI5kjvrpoMzaOcsDuU3mZTBqg
	 D5ZKnas0MtaAYsz20Bk0rD9GFqa5UNPR1MYFIRrqC+e6GJhv6ib7NGvRx9F6XxHDKZ
	 E1/PCPewcPZDA==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Do not reprogram affinitiy on ASP chip
Date: Tue, 25 Nov 2025 15:41:23 +0100
Message-ID: <20251125144123.23614-1-deller@kernel.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

The ASP chip is a very old variant of the GSP chip and is used e.g. in
HP 730 workstations. When trying to reprogram the affinity it will crash
with a HPMC as the relevant registers don't seem to be at the usual
location.  Let's avoid the crash by checking the sversion. Also note,
that reprogramming isn't necessary either, as the HP730 is a just a
single-CPU machine.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org
---
 drivers/parisc/gsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/parisc/gsc.c b/drivers/parisc/gsc.c
index a0daaa548bc3..8ba778170447 100644
--- a/drivers/parisc/gsc.c
+++ b/drivers/parisc/gsc.c
@@ -154,7 +154,9 @@ static int gsc_set_affinity_irq(struct irq_data *d, const struct cpumask *dest,
 	gsc_dev->eim = ((u32) gsc_dev->gsc_irq.txn_addr) | gsc_dev->gsc_irq.txn_data;
 
 	/* switch IRQ's for devices below LASI/WAX to other CPU */
-	gsc_writel(gsc_dev->eim, gsc_dev->hpa + OFFSET_IAR);
+	/* ASP chip (svers 0x70) does not support reprogramming */
+	if (gsc_dev->gsc->id.sversion != 0x70)
+		gsc_writel(gsc_dev->eim, gsc_dev->hpa + OFFSET_IAR);
 
 	irq_data_update_effective_affinity(d, &tmask);
 
-- 
2.51.1


