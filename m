Return-Path: <linux-parisc+bounces-4226-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D85BE0F76
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Oct 2025 00:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D68A23AC4D5
	for <lists+linux-parisc@lfdr.de>; Wed, 15 Oct 2025 22:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC1A30CDB8;
	Wed, 15 Oct 2025 22:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=stackframe.org header.i=@stackframe.org header.b="gDnUM41q";
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="L7CYbgxU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stackframe.org header.i=@stackframe.org header.b="VSiTHgoC"
X-Original-To: linux-parisc@vger.kernel.org
Received: from ivory.cherry.relay.mailchannels.net (ivory.cherry.relay.mailchannels.net [23.83.223.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE1427E07E
	for <linux-parisc@vger.kernel.org>; Wed, 15 Oct 2025 22:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760568010; cv=pass; b=OeG3KQUvMC7ZVk/BoUEJo5sNOHSwxnShuetAnJ9eDQagTD0obCVhZE6mp/hwqA5sZlcAJkJ9AiNV5IUGus7xasA7Zk363BifW6+ZcwNcD8wyXMxqzUCTAWx6xZVi/+3g+aimvORkKtZJhk2uleGcckgf7yrCuN5QONDYvUt/NTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760568010; c=relaxed/simple;
	bh=A4FSuQu01mqnGALSftiol8Wdyba6L3ZUVRFMGjKbBfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SExXe0aGOt6lziZ3qePcqKRirr5C1b6/p5ujJGwnmPEDBVQPXzPqN2CseAWoK1aYzgAYH18GEOHJCV5EqENQU+T37l9uHzxiJWPgHzWqULFs2MjKokzQu1aveSUwuM6tbgJpZqLuf+D8KjFhB5o8U/GCuNTv6lRf4IhfdRGoj7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stackframe.org; spf=pass smtp.mailfrom=stackframe.org; dkim=pass (1024-bit key) header.d=stackframe.org header.i=@stackframe.org header.b=gDnUM41q; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=L7CYbgxU; dkim=pass (2048-bit key) header.d=stackframe.org header.i=@stackframe.org header.b=VSiTHgoC; arc=pass smtp.client-ip=23.83.223.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stackframe.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stackframe.org
X-Sender-Id: _forwarded-from|130.180.31.158
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E2C0F40D64
	for <linux-parisc@vger.kernel.org>; Wed, 15 Oct 2025 21:21:55 +0000 (UTC)
Received: from outbound1f.eu.mailhop.org (100-117-100-204.trex-nlb.outbound.svc.cluster.local [100.117.100.204])
	(Authenticated sender: duocircle)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3EC0340768
	for <linux-parisc@vger.kernel.org>; Wed, 15 Oct 2025 21:21:51 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1760563311; a=rsa-sha256;
	cv=none;
	b=BCXhBZJttdftjxxgJu1JwbuwlNnn0A0pfvBnEylBIgn4yom+5OyxBTFzpNR5XPAfPbFd/T
	R3Y16g1Zrcl586i0RZUU8Z20Zn99/mqsMy25hZ3Zc0onovwyZAypJ2sUBONvYpgW2jUhIe
	nSzyRMWuKgcKo42S8UP53to2SxUPbqnZ+5A7P2EiukbDNvSR7vjKjPSdJNn9apQMEvChFw
	NwyegV2Vk+0LT9GRG+YZYP3wthhwI8PT0aVNRWyRgyBXxf9KTSGK5m6ePGRSjGUUO081C7
	lp0B6gUoCNJ3m8W+7X59hoq4JMVE3k+TVIeqTmBYoHJ438Xy1BApMmkYSEFo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1760563311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=WJ5h/bZae62hklU8U6ALTGj+0AtDIY7VGz/ya+XbYwI=;
	b=r8POOmp8fPhaUw98BA6qJMc+KOjYyfYHl4tIc0aSPE9nxo1OkR1vIyBwNYFZXTSKq7+A/Z
	ACdJiKmyq/yIfk1lsxAbnv/0Wd5cjd4QZ3YOcH5VUoypuy6xEVV9Qrl1inKf4grLz6lUEq
	BteZfLD1bkV2WdnGz9yu2VXpS3MUWCN/tUTvMbDXPg+VfOpxFuuFjkQA1gHxJuUPVcsVff
	iWzi1TsIY2sMUBhROJJ7THMUpGbsyKZv+HNozBq0OlmfCz6xZFedUU74DPaY9eTxaHogY3
	IDEun9VdRqMSRCeXqG6jgrth3FG+SZ4KTmmgHrIq285+Y5ILHNJOMDnIqGkceA==
ARC-Authentication-Results: i=1;
	rspamd-57f765db6d-9kt5f;
	auth=pass smtp.auth=duocircle smtp.mailfrom=svens@stackframe.org
X-Sender-Id: _forwarded-from|130.180.31.158
X-MC-Relay: Forwarding
X-MailChannels-SenderId: _forwarded-from|130.180.31.158
X-MailChannels-Auth-Id: duocircle
X-Trail-Trouble: 729d080a10562cd0_1760563315746_2549335224
X-MC-Loop-Signature: 1760563315746:2760601378
X-MC-Ingress-Time: 1760563315745
Received: from outbound1f.eu.mailhop.org (outbound1f.eu.mailhop.org
 [52.28.59.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.117.100.204 (trex/7.1.3);
	Wed, 15 Oct 2025 21:21:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stackframe.org; s=duo-1634547266507-560c42ae;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 cfbl-address:cfbl-feedback-id:from;
	bh=WJ5h/bZae62hklU8U6ALTGj+0AtDIY7VGz/ya+XbYwI=;
	b=gDnUM41q3Jo0I+6vVfjch30qyr5fyW1uWIlTvuTWB9wfcmyHLIm+tAXEU4OUuP70YZwJVOeBCb6va
	 WizunWdd6k45hHH52tLGSbdJ57Cz1hH1ItBYxv26aAj2PGWHJtI+pm5H9sv7XtpVeOGNmcOc3GruCn
	 VlaZE8CriTf7jOKA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 cfbl-address:cfbl-feedback-id:from;
	bh=WJ5h/bZae62hklU8U6ALTGj+0AtDIY7VGz/ya+XbYwI=;
	b=L7CYbgxUu6tcyWhAyRJ7AG05c/rSrFroVDNTpx8I5tH6hGsXm8c0R/9g1YVn05IGkhqrM1qrksvLx
	 87TYmni+mCAjVj4CtMXXog4mT3i/NhN2Uaw39RUncvR7kPSoTeegBJj0HDjuf7mKgdJmhobhhetgMF
	 z/M7bIcQYELzTS+5wqibDYSEZGjolVWfrFlyFNuZnloMTB812q5dd0nXewA2xMC2bG1EiwrU822R72
	 URbohuvLh0MpNBq+3vvsbMkZ2qHAszPzwEpHwnYl8am8IHTrZPe8c1kxFT1Ga3FEdwD7SIojqY3y7C
	 4YJtw4S0E1++WIgRUJ+9bDp9qREVrqw==
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: f4601854-aa0c-11f0-9de8-eb1d40c36193
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
CFBL-Feedback-ID: f4601854-aa0c-11f0-9de8-eb1d40c36193:5
CFBL-Address: prvs=03833f0c0f=abuse@outbound.mailhop.org; report=arf
Received: from mail.duncanthrax.net (mail.duncanthrax.net [130.180.31.158])
	by outbound2.eu.mailhop.org (Halon) with ESMTPSA
	id f4601854-aa0c-11f0-9de8-eb1d40c36193;
	Wed, 15 Oct 2025 21:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=stackframe.org; s=dkim1; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WJ5h/bZae62hklU8U6ALTGj+0AtDIY7VGz/ya+XbYwI=; b=VSiTHgoCkEE72/csWdgkF396Lj
	snwsJZAh2qBMMrtcvLp6y1GSH79xG0Rs1lDNbOCsimOfn2yk/1ykGVr7GdQRE6PZ2X575nlMfR/27
	Oa7i47CX4qGhOPRRA+12vLp56yZAmEguvgQSZc1tOPAlOsk0IYHIKy/YwKF/1XGy2pIkEIZOq+nM1
	O2SKWEI+IXWfNLhOZdoGSUmg1BwWFdDbTn125cN4B+VpJ4AyJ/r9585bN/4N5YXgG67gAvIrMXQ6U
	zpm0VUdcekGjZOEawRhcSVgIYmzC/+/uPVeqyjZepMda1ROWXCA9zYJweQpIwjWfqhdtiFZzeOB0p
	U7F3EnGA==;
Received: from [134.3.94.10] (helo=debian.stackframe.org)
	by mail.duncanthrax.net with esmtpa (Exim 4.97)
	(envelope-from <svens@stackframe.org>)
	id 1v98wL-00000007txx-2YCJ;
	Wed, 15 Oct 2025 23:21:45 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc/entry: set W bit for !compat tasks in syscall_restore_rfi()
Date: Wed, 15 Oct 2025 23:21:41 +0200
Message-ID: <20251015212141.289981-1-svens@stackframe.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the kernel leaves to userspace via syscall_restore_rfi(), the
W bit is not set in the new PSW. This doesn't cause any problems
because there's no 64 bit userspace for parisc. Simple static binaries
are usually loaded at addresses way below the 32 bit limit so the W bit
doesn't matter.

Fix this by setting the W bit when TIF_32BIT is not set.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/asm-offsets.c | 2 ++
 arch/parisc/kernel/entry.S       | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index 9abfe65492c65..3de4b5933b107 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -258,6 +258,8 @@ int main(void)
 	BLANK();
 	DEFINE(TIF_BLOCKSTEP_PA_BIT, 31-TIF_BLOCKSTEP);
 	DEFINE(TIF_SINGLESTEP_PA_BIT, 31-TIF_SINGLESTEP);
+	DEFINE(TIF_32BIT_PA_BIT, 31-TIF_32BIT);
+
 	BLANK();
 	DEFINE(ASM_PMD_SHIFT, PMD_SHIFT);
 	DEFINE(ASM_PGDIR_SHIFT, PGDIR_SHIFT);
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index f4bf61a34701e..36914138f5f88 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1841,6 +1841,10 @@ syscall_restore_rfi:
 	extru,= %r19,TIF_BLOCKSTEP_PA_BIT,1,%r0
 	depi	-1,7,1,%r20			   /* T bit */
 
+#ifdef CONFIG_64BIT
+	extru,<> %r19,TIF_32BIT_PA_BIT,1,%r0
+	depi	-1,4,1,%r20			   /* W bit */
+#endif
 	STREG	%r20,TASK_PT_PSW(%r1)
 
 	/* Always store space registers, since sr3 can be changed (e.g. fork) */
@@ -1854,7 +1858,6 @@ syscall_restore_rfi:
 	STREG   %r25,TASK_PT_IASQ0(%r1)
 	STREG   %r25,TASK_PT_IASQ1(%r1)
 
-	/* XXX W bit??? */
 	/* Now if old D bit is clear, it means we didn't save all registers
 	 * on syscall entry, so do that now.  This only happens on TRACEME
 	 * calls, or if someone attached to us while we were on a syscall.
-- 
2.51.0


