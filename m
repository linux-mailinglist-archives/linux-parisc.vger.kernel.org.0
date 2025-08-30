Return-Path: <linux-parisc+bounces-3869-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0BCB3CBD3
	for <lists+linux-parisc@lfdr.de>; Sat, 30 Aug 2025 17:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84CCD5E5973
	for <lists+linux-parisc@lfdr.de>; Sat, 30 Aug 2025 15:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC68D20E31C;
	Sat, 30 Aug 2025 15:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="HqhTCyvf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-outgoing-1702.laposte.net (smtp-outgoing-1702.laposte.net [160.92.124.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1559317A300
	for <linux-parisc@vger.kernel.org>; Sat, 30 Aug 2025 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756567273; cv=none; b=iP+lD5GRK2r3fhNM/bUMgTYkC7Ud3F3jginNI75PRmohda95WIFVD49yIZqZxbh38KF4hdEImUwlbIgqwKme3D8t3ZGRYV6kGqLk3rggF0owGeypSQP9iEj1t3YkAQOIhnEP+hEYhxEg6B5J+pZw/0JwMsPQJC2cwSXE1mv9m0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756567273; c=relaxed/simple;
	bh=3thogFjozItYeV1vMf+egzbEKKkBpymf19MuFubEmOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uKa/8CK7bwRP7My4rHakMgYbRENUQuHppd1XDkBGOvnnNY/8U2fpPYp0NDLClPSlAdW3Nm7vJKu++YAe/dBVE0ZY88bCCmycqcqpA5M+bKUmzDdp5xcrK9Cb0NdMvpJiF+MPP2SHGyPpvd6BGu1jV6ZBJbHVu6FW+VmtdnKyK/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=HqhTCyvf; arc=none smtp.client-ip=160.92.124.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
X-mail-filterd: {"version":"1.9.3","queueID":"4cDf3k1wgMzPjdG","contextId":
 "2f4311d5-4d2e-45f4-bd15-5ef073ed3a70"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0117.laposte.net (SMTP Server) with ESMTP id 4cDf3k1wgMzPjdG;
	Sat, 30 Aug 2025 17:21:06 +0200 (CEST)
X-mail-filterd: {"version":"1.9.3","queueID":"4cDf3k14rmzPjdF","contextId":
 "39e68a8c-636c-417a-a891-3addd64e23a4"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net [88.169.129.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0117.laposte.net (SMTP Server) with ESMTPSA id 4cDf3k14rmzPjdF;
	Sat, 30 Aug 2025 17:21:06 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
	by romuald.bergerie (Postfix) with ESMTP id 086026970AEC;
	Sat, 30 Aug 2025 17:21:12 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.2)
	(envelope-from <vincent@radicelle.bergerie>)
	id 1usNPH-000000002G0-0sBp;
	Sat, 30 Aug 2025 17:22:19 +0200
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
To: linux-parisc@vger.kernel.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH] ipl: adjust firmware entry type
Date: Sat, 30 Aug 2025 17:22:04 +0200
Message-ID: <20250830152204.7868-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1756567268; bh=3thogFjozItYeV1vMf+egzbEKKkBpymf19MuFubEmOc=; h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; b=HqhTCyvfQvmKBTz14qwFes40hG+rbOzreu9hCkX6SGZXiIww/VTdErs+WMCkDxBushE2mLMJT9+i9P3VDEF37KbHHdM0OK4VTshE2aVft8UuL72kuqh0C4k3scnAUApDpJkZxORjSHLfU9Rt3DKkK8DVyZVlidwALhGC1S44BWC3Gwv5V0YmGHp/1P2YO0t8OPNeNUcEu7K6DBGstHdyEzus7B+dzF1T+YTCGAMpbME6CUn99KyCKaRJCF2C9NwHAbBiW1z8So7hAIE1eyylNDlxJbnThHmRKTgA1mU5O9sBchJ2f9KCgiDeJhl5D8fj/muf+JRY+a08QeE0DFecdw==;

The `firmware_entry' function typedef used to call the firmware in
firmware_call() is defined with no argument.

This causes the compilation to fail with gcc 15:

  pdc_misc.c:119:14: error: too many arguments to function =E2=80=98(int =
(*)(void))(unsigned int)fn=E2=80=99; expected 0, have 14

Add all the 14 function arguments to the type definition to fix the
build with gcc 15.

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
---

Hi,

I could verify that this still compiles fine with gcc 14 and 13.

Best regards,
Vincent.

 ipl/pdc_misc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ipl/pdc_misc.c b/ipl/pdc_misc.c
index f516bd8..ab2191a 100644
--- a/ipl/pdc_misc.c
+++ b/ipl/pdc_misc.c
@@ -95,7 +95,10 @@ firmware_call(unsigned long long fn, ...)
     }
     else
     {
-	typedef int (*firmware_entry)();
+	typedef int (*firmware_entry)(unsigned long, unsigned long,
+	    unsigned long, unsigned long, unsigned long, unsigned long,
+	    unsigned long, unsigned long, unsigned long, unsigned long,
+	    unsigned long, unsigned long, unsigned long, unsigned long);
 	unsigned long arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8,
 	    arg9, arg10, arg11, arg12, arg13;
=20
--=20
2.47.2


