Return-Path: <linux-parisc+bounces-2312-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4F973DF6
	for <lists+linux-parisc@lfdr.de>; Tue, 10 Sep 2024 19:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB4461C253DC
	for <lists+linux-parisc@lfdr.de>; Tue, 10 Sep 2024 17:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437B83C2F;
	Tue, 10 Sep 2024 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4AerRYC"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0DC538A
	for <linux-parisc@vger.kernel.org>; Tue, 10 Sep 2024 17:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987620; cv=none; b=fnbcfGDYBZFv+R05pUnRQPx9I665K9fizuCg4vJES2Hb0ABphQ//o+kTh7dS/qRrzB7sHp/MljFx3coHz/fgaZYcBjtE99rXLkYZzYVjaheO2vVLQqw69g55gPYk/Uri9eZ5egwsvmMZhD5ctBRH50ovQ7aHiGcihJrOzMRfhH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987620; c=relaxed/simple;
	bh=VPTNiB9XOrXv1LVXMD1tsMo243hkvnb5+aCZ8WDPt7E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hrzReyXG8k/lBlBvmzYZvcfU6ga4Sqc69s7DauhG29rIlnLr4LGWxM9vR40o6TWhvsasPkzoDKuCMhLNJUAne8mbXwm+g0Mr3Jpb+UdDD507LdrY0ouARotBHG0ngxM7TGGddPP1amGn40BBJ0CqsoR1Iey4wGX2BTlOUMYJyy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4AerRYC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1BAC4CEC3
	for <linux-parisc@vger.kernel.org>; Tue, 10 Sep 2024 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725987619;
	bh=VPTNiB9XOrXv1LVXMD1tsMo243hkvnb5+aCZ8WDPt7E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d4AerRYCnRG/nPkvVzvl0KsfHqlLoEyOmwkHC/ygMzMenICgudQLGvpO961gvsBqK
	 qJ7we5ltdi5pHyDzhq3wdykey95wEUttN4TO8rnsOodbxc1j2rBzp+E1XI/y1ipz7V
	 UGX/Nx7E0C7oJwGQX9R2iWy8vLg/k4rEOeQdZ/57yR3bz5iTA5D6n0x7C1zSh39pVF
	 ay1TVag6iL4vJImUCuo7y4x+k9okW6ylWrFXYQ5UFnL49FPHH2M5a3PGuYq/rvGs2Y
	 1Ys0t8f5t7oAzCiOM7wyBLXdxRGV4qXd6Cjb6BnqyscRjgzzDL9tZSdP4Fg+r6w00j
	 YCN9e841w1P9Q==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH 2/2] parisc: Use PRIV_USER instead of hardcoded value
Date: Tue, 10 Sep 2024 19:00:00 +0200
Message-ID: <20240910170000.63672-2-deller@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240910170000.63672-1-deller@kernel.org>
References: <20240910170000.63672-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 1107ca819ac8..294b0e026c9a 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -504,7 +504,7 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 	if (((unsigned long)regs->iaoq[0] & 3) &&
 	    ((unsigned long)regs->iasq[0] != (unsigned long)regs->sr[7])) { 
 		/* Kill the user process later */
-		regs->iaoq[0] = 0 | 3;
+		regs->iaoq[0] = 0 | PRIV_USER;
 		regs->iaoq[1] = regs->iaoq[0] + 4;
 		regs->iasq[0] = regs->iasq[1] = regs->sr[7];
 		regs->gr[0] &= ~PSW_B;
-- 
2.46.0


