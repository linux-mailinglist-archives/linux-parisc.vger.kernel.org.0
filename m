Return-Path: <linux-parisc+bounces-2311-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825EC973DF5
	for <lists+linux-parisc@lfdr.de>; Tue, 10 Sep 2024 19:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 449D6288455
	for <lists+linux-parisc@lfdr.de>; Tue, 10 Sep 2024 17:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62487198842;
	Tue, 10 Sep 2024 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vdo2Udve"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E25B19755E
	for <linux-parisc@vger.kernel.org>; Tue, 10 Sep 2024 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987616; cv=none; b=rwkvSJW1vUUbf+YAYA2X5+OG3DPvvf56zbdkB22IPqTuRtPxX+PgEQbSbJfXEEOqpsHtwllu8y97TuA0BeE3CigJErnO3239giGG2KFtZVolDQdeYCHoJL41r0o/cUjDxe8e4WBK4eAQ1YxpmbFLohtEhMUzquk60L7RzgTGMSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987616; c=relaxed/simple;
	bh=7b7bv6otQMSGDnfa1leF3MWP5+bW5QGJzYA8i/0fdws=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eX3mYaXNeT8lzhRnkMm+OqPyj2JiDxzVYIGhFqy45uSLBO4u4xK+uub96dokBnwU1caT2hCGv9YoD81MDCji/3njp25CGz+LD7HpD1nQ8ExB6S8YthIxoNa66VvUEOHh/o9zkk0RxBD0qLAd71ljsAwHQAxz1N8TIOB+VCz4D9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vdo2Udve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40268C4CEC3
	for <linux-parisc@vger.kernel.org>; Tue, 10 Sep 2024 17:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725987615;
	bh=7b7bv6otQMSGDnfa1leF3MWP5+bW5QGJzYA8i/0fdws=;
	h=From:To:Subject:Date:From;
	b=Vdo2Udver+5FHbbaL1xbiSIGHy+qtq4nVDHeJelA1j5so3XZGBgmfd0zWd4A285v6
	 oZzkS7h7mIqElN02hId9y194Y3iqG+LDAX2M1EVd56/6MR/W/Ixutyq/nTUJ61rpaW
	 2X6bPdZUAUzw06ZX/FN1QDuzfFNwXWyAjRJvkhAtddEZBiWLAIbVOfIk7SQTqz4JlK
	 9Q4A+92/pOMu3LFDTjYxkD3Q3ZyBIrvc+VFADJUH1y3KWPRVPGap+IWr05sFUqjODC
	 Gg9gP+M3BNCdquXoIwKhJtIU9ogIxpT5snAES78KUE5U4TvoqkYTyRVaU+cIDrjM2g
	 Bwn9FkdglvGcg==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH 1/2] parisc: Fix itlb miss handler for 64-bit programs
Date: Tue, 10 Sep 2024 18:59:59 +0200
Message-ID: <20240910170000.63672-1-deller@kernel.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

For an itlb miss when executing code above 4 Gb on ILP64 adjust the
iasq/iaoq in the same way isr/ior was adjusted.  This fixes signal
delivery for the 64-bit static test program from
http://ftp.parisc-linux.org/src/64bit.tar.gz.  Note that signals are
handled by the signal trampoline code in the 64-bit VDSO which is mapped
into high userspace memory region above 4GB for 64-bit processes.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org	# v6.0+
---
 arch/parisc/kernel/entry.S | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index ab23e61a6f01..838c27f93302 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1051,8 +1051,7 @@ ENTRY_CFI(intr_save)		/* for os_hpmc */
 	STREG           %r16, PT_ISR(%r29)
 	STREG           %r17, PT_IOR(%r29)
 
-#if 0 && defined(CONFIG_64BIT)
-	/* Revisit when we have 64-bit code above 4Gb */
+#if defined(CONFIG_64BIT)
 	b,n		intr_save2
 
 skip_save_ior:
@@ -1061,7 +1060,7 @@ skip_save_ior:
 	 * above.
 	 */
 	extrd,u,*	%r8,PSW_W_BIT,1,%r1
-	cmpib,COND(=),n	1,%r1,intr_save2
+	cmpib,COND(=),n	0,%r1,intr_save2
 	LDREG		PT_IASQ0(%r29), %r16
 	LDREG		PT_IAOQ0(%r29), %r17
 	/* adjust iasq/iaoq */
-- 
2.46.0


