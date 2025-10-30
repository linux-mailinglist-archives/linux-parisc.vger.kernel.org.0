Return-Path: <linux-parisc+bounces-4244-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA74C20041
	for <lists+linux-parisc@lfdr.de>; Thu, 30 Oct 2025 13:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44AE21A2150D
	for <lists+linux-parisc@lfdr.de>; Thu, 30 Oct 2025 12:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F3631D37C;
	Thu, 30 Oct 2025 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=stackframe.org header.i=@stackframe.org header.b="Jpt5WWYQ";
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="KEVKG7qz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stackframe.org header.i=@stackframe.org header.b="WrdHiHkP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from baboon.maple.relay.mailchannels.net (baboon.maple.relay.mailchannels.net [23.83.214.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087130BBA0
	for <linux-parisc@vger.kernel.org>; Thu, 30 Oct 2025 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.214.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761827221; cv=pass; b=ONySFasie1/I1dyuI5JTK+32rd7iykrRyedHYVzHU0JSZjgzPaHi8NYzQict5+5J9DYIatE+oxKQhcOZF1Adyzm4R+0ygQm9gphGQ3YOKAszeqTK7GUwcs8C2U3BSANy9yw7Pm+Gf37AcrfncVMCrlCQ9QKT2HUkhGaZNeK1NpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761827221; c=relaxed/simple;
	bh=zv7Xisf2dDOQTvsxcDQ7JOe+5bv5pND7d11dDNrubZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bf2uhO0F5wZytCmCtMmwHwhnlxCc/Sth1wE4CS3J11pOdmDSETIgQIWwfbNlSWVzXcnKEoYw033c1RpG64I2B6eJfwPMV/URGYmcURiveHoGDXWb+AHq/1ZMXQeucv4PVgIxIN3z4QCdZHtXww2HDRs6bVA6oTrBhDviykAxdsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stackframe.org; spf=pass smtp.mailfrom=stackframe.org; dkim=pass (1024-bit key) header.d=stackframe.org header.i=@stackframe.org header.b=Jpt5WWYQ; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=KEVKG7qz; dkim=pass (2048-bit key) header.d=stackframe.org header.i=@stackframe.org header.b=WrdHiHkP; arc=pass smtp.client-ip=23.83.214.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stackframe.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stackframe.org
X-Sender-Id: _forwarded-from|130.180.31.158
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BC632462C3D
	for <linux-parisc@vger.kernel.org>; Thu, 30 Oct 2025 07:56:33 +0000 (UTC)
Received: from outbound1a.eu.mailhop.org (trex-green-0.trex.outbound.svc.cluster.local [100.124.152.27])
	(Authenticated sender: duocircle)
	by relay.mailchannels.net (Postfix) with ESMTPA id B898F462C1D
	for <linux-parisc@vger.kernel.org>; Thu, 30 Oct 2025 07:56:32 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761810993; a=rsa-sha256;
	cv=none;
	b=V7988EgLzHBJwnmrmI3QQinMcr6bGmjh6kr/wXz/Ciz/YNKgYQUblD+fgOp24Ceg7ImLAK
	8FgQpm70hOpXAm0VilKVQOXxsKS1wP0YHE6cJvGGlwc93kvOsuugzOSMjM98VsOSm4TE+l
	6+YWG66UYNM6j9wo8GF+gYy/V+siAVLOcEwYozf6ZmqECTBgRD1FUXVGu3JKYcKXLn3p+q
	wP9HR6eaEqKevTGQHeh6sthioDpDzjQ3H2EH81IG85ujqLBBBumrZ5t0jlB1mdI9EeTXkR
	lSPIlO/qyWhYqWbCmgDwVyVBWYppaeNqWU9+j5oKkIkSqC1SeqLi2zsO/5PmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761810993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=geBef8sHNNBePPAjsqHaoi+qHD6Md9wPNfceF+6ekR8=;
	b=cs9sY6zbAoZe4GbCYKbZuv7rekjgQWQVx4l5KjL1y780agt07PrumWxWvg9E0uDWTQCDw6
	NLN3oOwmhUA+oZvAKRPhj95KGs55N/mhxPsEwo2mzG4tLE82BrBWLsoXTUcqwdVcoLglPI
	rexHr0q/9O9+BDevUA1PE1L1jB74RigkcUDAmu/OTodICHjuKm86b6Qamn8bLYA1d1tlAE
	2Hml59kP4+7S87wY6YwbveSmldwwwb/IeluWY5wGe5LFs6hnwCDqLA5Up5fT5vpVe/EzLb
	Md1A5h+mMuiDJi+MXOTYCnCk7wXY7lWkaIJSLjE9jehNG9cNEiUUqtagyULfDA==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-bglb6;
	auth=pass smtp.auth=duocircle smtp.mailfrom=svens@stackframe.org
X-Sender-Id: _forwarded-from|130.180.31.158
X-MC-Relay: Forwarding
X-MailChannels-SenderId: _forwarded-from|130.180.31.158
X-MailChannels-Auth-Id: duocircle
X-Stretch-Vacuous: 688ed3dc593d514c_1761810993635_180156595
X-MC-Loop-Signature: 1761810993635:1891442916
X-MC-Ingress-Time: 1761810993635
Received: from outbound1a.eu.mailhop.org (outbound1a.eu.mailhop.org
 [52.58.109.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.152.27 (trex/7.1.3);
	Thu, 30 Oct 2025 07:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stackframe.org; s=duo-1634547266507-560c42ae;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 cfbl-address:cfbl-feedback-id:from;
	bh=geBef8sHNNBePPAjsqHaoi+qHD6Md9wPNfceF+6ekR8=;
	b=Jpt5WWYQanSVmsQszHL3YVMQF9mDLZc+RSZzIWxHbCRba1w6B/HmdUgwat6SpNCew0zG59bhboQFy
	 uYcB/zt7ZyFm9wrj3rO9/IrvViQ3nvjRxj0GJopZ8vEEqG1Y2AATNljddOh0geE1MdnhaYXC+b/Srb
	 Dll5Ji4nVia50oqc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 cfbl-address:cfbl-feedback-id:from;
	bh=geBef8sHNNBePPAjsqHaoi+qHD6Md9wPNfceF+6ekR8=;
	b=KEVKG7qzsDvU/tqLO/lDh5Pac/fWa7RK9NjKagp40aQUVSMTAvixFmEgKXU7748bmqhXLtFIN/sVd
	 /afu0ZG1Ulw/P5aCqzITAf74kEUqAf0v/xxo1Z6IXbJjFWVhkupeH6WEKEMmel5wH/T/nfSm22PVFt
	 F4ZyBrTglVMjBwZylgRljlY0a3OxGEKDt+nU9u/JSSIczId1P+P3IIXITG+uf/7ab3v2/WUr0mZAGk
	 n5u25MZAe5tzkt/lvkAhH93W+KpEo1vGoQBpE3lpSqK0iwDU6otjzCn2aHCv4R4gSdvkA9QGCu+HZQ
	 DsuXu9NAIwzJ34Y6jIZPebIQ5tVVUEw==
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: efdaa1d4-b565-11f0-9d43-310e225498a9
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
CFBL-Feedback-ID: efdaa1d4-b565-11f0-9d43-310e225498a9:7
CFBL-Address: prvs=0398f65023=abuse@outbound.mailhop.org; report=arf
Received: from mail.duncanthrax.net (mail.duncanthrax.net [130.180.31.158])
	by outbound2.eu.mailhop.org (Halon) with ESMTPSA
	id efdaa1d4-b565-11f0-9d43-310e225498a9;
	Thu, 30 Oct 2025 07:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=stackframe.org; s=dkim1; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=geBef8sHNNBePPAjsqHaoi+qHD6Md9wPNfceF+6ekR8=; b=WrdHiHkPhS8Bf6gBrsBvzGIdDI
	dlmWOlPYiB4csp4TFhx8FUbJ5bxBxaTD6cIqjMnci2/bn+KvNRx8zp0cRm10Ls8BFyy+J1PJWLD+D
	8WM4nWoEmqnYCIzcca3nRrRQBl5BXvgTEFsXQEoGWIIlAlwODrA9V788miP9jAzpfOXnRnns+WlDZ
	+zDn0WmRn6cVQZaosbpqqgvyCZYrG+n412kmLFszo3JnKdDc5fYpu4oVRhdzbIXJGHxeN53UGaDWF
	qKTOzdk++n7R1i6FSUwV4C5/Bq7UnUe3cqcJdZAHN0sUWCWYVU0ljyCVTCXlyrAPP+aJ1avhepN9l
	ylN3y07w==;
Received: from [134.3.93.166] (helo=debian.stackframe.org)
	by mail.duncanthrax.net with esmtpa (Exim 4.97)
	(envelope-from <svens@stackframe.org>)
	id 1vENWE-0000000210f-0kyc;
	Thu, 30 Oct 2025 08:56:26 +0100
From: Sven Schnelle <svens@stackframe.org>
To: Helge Deller <deller@gmx.de>
Cc: John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc/entry: fix space adjustment on interruption
Date: Thu, 30 Oct 2025 08:56:05 +0100
Message-ID: <20251030075605.61854-1-svens@stackframe.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In wide mode, the IASQ contain the upper part of the GVA
during interruption. This needs to be reversed before
the space is used - otherwise it contains parts of IAOQ.
See Page 2-13 "Processing Resources / Interruption Instruction
Address Queues" in the Parisc 2.0 Architecture Manual page 2-13
for an explanation.

The IAOQ/IASQ space_adjust was skipped for other interruptions
than itlb misses. However, the code in handle_interruption()
checks whether iasq[0] contains a valid space. Due to the not
masked out bits this match failed and the process was killed.

Also add space_adjust for IAOQ1/IASQ1 so ptregs contains sane values.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/entry.S | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 36914138f5f88..e04c5d806c105 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1059,8 +1059,6 @@ ENTRY_CFI(intr_save)		/* for os_hpmc */
 	STREG           %r17, PT_IOR(%r29)
 
 #if defined(CONFIG_64BIT)
-	b,n		intr_save2
-
 skip_save_ior:
 	/* We have a itlb miss, and when executing code above 4 Gb on ILP64, we
 	 * need to adjust iasq/iaoq here in the same way we adjusted isr/ior
@@ -1069,10 +1067,17 @@ skip_save_ior:
 	bb,COND(>=),n	%r8,PSW_W_BIT,intr_save2
 	LDREG		PT_IASQ0(%r29), %r16
 	LDREG		PT_IAOQ0(%r29), %r17
-	/* adjust iasq/iaoq */
+	/* adjust iasq0/iaoq0 */
 	space_adjust	%r16,%r17,%r1
 	STREG           %r16, PT_IASQ0(%r29)
 	STREG           %r17, PT_IAOQ0(%r29)
+
+	LDREG		PT_IASQ1(%r29), %r16
+	LDREG		PT_IAOQ1(%r29), %r17
+	/* adjust iasq1/iaoq1 */
+	space_adjust	%r16,%r17,%r1
+	STREG           %r16, PT_IASQ1(%r29)
+	STREG           %r17, PT_IAOQ1(%r29)
 #else
 skip_save_ior:
 #endif
-- 
2.51.0


