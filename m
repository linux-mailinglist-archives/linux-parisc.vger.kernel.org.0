Return-Path: <linux-parisc+bounces-4631-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC82BMDcrmm/JQIAu9opvQ
	(envelope-from <linux-parisc+bounces-4631-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Mon, 09 Mar 2026 15:44:16 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B723AC91
	for <lists+linux-parisc@lfdr.de>; Mon, 09 Mar 2026 15:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28BAA3029249
	for <lists+linux-parisc@lfdr.de>; Mon,  9 Mar 2026 14:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AAF3C199F;
	Mon,  9 Mar 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJ8wdQ+/"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C93C197D
	for <linux-parisc@vger.kernel.org>; Mon,  9 Mar 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067289; cv=none; b=Jzm4XPlD9WOKHimxF48cKUEnE3rZXRq2aN5H1/DuYcEo8WHJog6JvJgS9n72BP14cCtFoz/dtV1UlaAIdlBa9mbA/qoqgMhUr/J67m4LKXuykU+1jMaRPJPUk4X9Cr4bbnG+IeZwWvMoahbX4WqN2D7AZ66sx4MW5JcNyRHipG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067289; c=relaxed/simple;
	bh=48Q37+V7P6uh/S1We1acqtTILdmqB6vqKgU9i18AlQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C+y/XSeCry3pKIZZVQhC+X7/+tyldOaaAe1FtOsibgwA5athFzjB9bGLYK2+3pN6UiGTJ68YK7aaMnYReUqj/K/Muieksl8G+yg9uTzlkMewVjZDGFWKh+cy5dssNVpwoqM9ImQNaV4RrclAUBGwbqbTs1GxIssZnugS1SF2gdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJ8wdQ+/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27799C4CEF7;
	Mon,  9 Mar 2026 14:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773067289;
	bh=48Q37+V7P6uh/S1We1acqtTILdmqB6vqKgU9i18AlQc=;
	h=From:To:Cc:Subject:Date:From;
	b=rJ8wdQ+/2r7L8E54kGZvif0e/jhPPNttuN2/kM26vlEJWS+DnVMS9fvu7aEeWdZSj
	 W/XkCU/pbPs6moq579vQH1DVfxdxtN9Dslqi/6w+KRNrVL6OxqJlfXImWZoUPCHb4H
	 piNadlKysgrAw7SXVXc/+lEWqROhecwutFF2qNG/iJrHkv9Dty+R5egj6D/0HT55XH
	 nYRq7ODRykC9RdJLE+LrnJhhYzuc1aG38FbW+Zm5poAfp1R9/Oc9w/Q+92Lx+FttL+
	 i1UP4U+u4rOHehHoCH+XK4RlB/50ZIxXRd8XngWnvjl1DEijDY9Dkr2Sr6z7/1ERXA
	 ilMyfzDgHt9uA==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	Felix Lechner <felix.lechner@lease-up.com>
Subject: [PATCH] parisc: Fix cacheflush() syscall to flush correct cache
Date: Mon,  9 Mar 2026 15:41:12 +0100
Message-ID: <20260309144112.5888-1-deller@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C59B723AC91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmx.de,lease-up.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4631-lists,linux-parisc=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,linux-parisc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-parisc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lease-up.com:email]
X-Rspamd-Action: no action

From: Helge Deller <deller@gmx.de>

Somehow the assembly flush instruction was swapped for I- and D-cache flags
in the cacheflush() syscall:
SYSCALL_DEFINE3(cacheflush, ...)
{
	if (cache & DCACHE) {
			"fic ...\n"
	}
	if (cache & ICACHE && error == 0) {
			"fdc ...\n"
	}

Fix it by using fdc for DCACHE, and fic for ICACHE flushing.

Noticed-by: Felix Lechner <felix.lechner@lease-up.com>
Fixes: c6d96328fecd ("parisc: Add cacheflush() syscall")
Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/cache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 4c5240d3a3c7..b189265785dc 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -953,7 +953,7 @@ SYSCALL_DEFINE3(cacheflush, unsigned long, addr, unsigned long, bytes,
 #else
 			"1: cmpb,<<,n	%0,%2,1b\n"
 #endif
-			"   fic,m	%3(%4,%0)\n"
+			"   fdc,m	%3(%4,%0)\n"
 			"2: sync\n"
 			ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 2b, "%1")
 			: "+r" (start), "+r" (error)
@@ -968,7 +968,7 @@ SYSCALL_DEFINE3(cacheflush, unsigned long, addr, unsigned long, bytes,
 #else
 			"1: cmpb,<<,n	%0,%2,1b\n"
 #endif
-			"   fdc,m	%3(%4,%0)\n"
+			"   fic,m	%3(%4,%0)\n"
 			"2: sync\n"
 			ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 2b, "%1")
 			: "+r" (start), "+r" (error)
-- 
2.53.0


