Return-Path: <linux-parisc+bounces-418-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DEE839401
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 16:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3182D28C137
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 15:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5E461681;
	Tue, 23 Jan 2024 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJ4htCgi"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883D761680
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706025565; cv=none; b=H7tl4Y8mGCZlhAagniRGTdEKqvSYuDIR2G+pg5N+zUaNpLfHEarKoj4+8/Vxv6teHTo7s1XPfxkn0syHCptQujnimHm9Sfkji7yj/mTwwrBCjhEhie1SEJzjuNdNYv8Tnh3P13E04xPQIeLBmavCsudUghkDe9i99Cr5RH3cdT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706025565; c=relaxed/simple;
	bh=E7rIaCLeep4xX+XPrhYVzcgsOlMCyKhWPwyTCqB8bGo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+GyBnSq4rsTohQ7nxzhWfwDtx8Bdstg9wsvJYmh+8cfzitClJKVu8gtVaDpgCeO4K1fv1sv6hSLQVziPu89j2CKQtdOBcz31jF0d28W6UNzbI5A2zLKM1nq28WgPHNV3+eRxU/8LhYyoCibwQDr7KKTqQT7PGF4aTU69jZkcdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJ4htCgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D107C43394
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706025565;
	bh=E7rIaCLeep4xX+XPrhYVzcgsOlMCyKhWPwyTCqB8bGo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RJ4htCgiIPED7/pLpw+cDFpCjNX0FGS0VsQorf07L3GJ8D12Yv9Yzi0JbP3CQ3A9G
	 vBfTzyTTCU6AUjX5QvEJBzXVX4WP6LZ3s2pXxSEuf2cxHBxKx5uGjgk5TlV6qbUesB
	 EHRUNwzhCI9D2di/XJZJrWvEYHA/qRtNyAZfLhJleh+LgTHaGgOI4fs9At1Ess0Ov9
	 gz+0H0UM6M8O0iB6R38QuZcddRZaAxeXK4fLC+rZrLLWsFPSIo1cDc3jYzl4pyFk3q
	 71bXjB9WfbqrNY9udcDYDzqGmUyUQb29i5O6BcgtP/4p1YLuGaoGjweJmpIl88Spz3
	 bdNcWXXdy09qg==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH 5/7] parisc: Drop unneeded semicolon in parse_tree_node()
Date: Tue, 23 Jan 2024 16:59:02 +0100
Message-ID: <20240123155904.6220-5-deller@kernel.org>
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

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Closes: https://lore.kernel.org/oe-kbuild-all/202401222059.Wli6OGT0-lkp@intel.com/
---
 arch/parisc/kernel/drivers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index 404ea37705ce..c7ff339732ba 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -742,7 +742,7 @@ parse_tree_node(struct device *parent, int index, struct hardware_path *modpath)
 	};
 
 	if (device_for_each_child(parent, &recurse_data, descend_children))
-		{ /* nothing */ };
+		{ /* nothing */ }
 
 	return d.dev;
 }
-- 
2.43.0


