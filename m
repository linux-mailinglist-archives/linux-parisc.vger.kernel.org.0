Return-Path: <linux-parisc+bounces-415-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4EE8393FA
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 16:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 539941F22C25
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 15:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00896612DA;
	Tue, 23 Jan 2024 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLUlBs4e"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF3D612D4
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706025559; cv=none; b=iJPshWHUFxWzGHWwWHsIPvm0IQyInkAIhZn8HgrsD1xJ8Mp6UeIkNzGIzf1Gbj6+mdGlU5vEn89/mAjc0XrfZVFmmq08C6Nf1qv0bPOf6o8TZb1Uahaf+Hb37WuWeZll/5FccmxnkHzd5XP73qTQXp0nmxNmrZPajAuYgf4VIQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706025559; c=relaxed/simple;
	bh=nae3i8UXEwIIw3jiWGvnvBhc24Dd5nRhmHR+H7c/mPE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZhFS6r6vuzXbJmRi0S3uFZWMJ22/zIHhZ1tyydd0/EhlgUiUOkirItqWfo7xAi+pNMAaQEghed/SXvBScgS+ZKZx49q4er/VWcmm0Jf1hK7Kxq9D72MHBdLFk7GDQTVjPJYLxUQhKQlF+wIk1tjDB+V+gGfuMqcd8wikbxZfYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLUlBs4e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106B8C433C7
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706025559;
	bh=nae3i8UXEwIIw3jiWGvnvBhc24Dd5nRhmHR+H7c/mPE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lLUlBs4eVB/hmH363FYc6kh1fevGNOpB/Ee+6HPM+xwA/UKW8rHKbLFwAaXr7Y9cX
	 QnS4sLd9/fGOcuO81L5f9zygMhZeqCNcr4tqdLqQp0HvClW0+c9FbK4SQKjBVW9oUZ
	 g5nvx6eitfsC9GSa2jTVnla5XRwAwJ51zjO3Uh+MxM0AMfG3gjZsGln7wGfz/C5A3Y
	 mJD/P6JP46oLWJI0BAuXVKiYUDmjLHxSPajr9zC0LkGnFLtfm/+Ef2bSf995hTrZE2
	 ogLr3Fgww6RToHqbIQd820XCK87NvxBOq/UeIzu1C6tlf185TGJTpOWVyvT6co2QT0
	 +optrLIiGgXBA==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH 2/7] parisc: Make RO_DATA page aligned in vmlinux.lds.S
Date: Tue, 23 Jan 2024 16:58:59 +0100
Message-ID: <20240123155904.6220-2-deller@kernel.org>
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

The rodata_test program for CONFIG_DEBUG_RODATA_TEST=y complains if
read-only data does not start at page boundary.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 548051b0b4af..b445e47903cf 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -127,7 +127,7 @@ SECTIONS
 	}
 #endif
 
-	RO_DATA(8)
+	RO_DATA(PAGE_SIZE)
 
 	/* unwind info */
 	. = ALIGN(4);
-- 
2.43.0


