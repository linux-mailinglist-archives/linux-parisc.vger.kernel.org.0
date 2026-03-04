Return-Path: <linux-parisc+bounces-4620-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEfjKg2jqGnKwAAAu9opvQ
	(envelope-from <linux-parisc+bounces-4620-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Wed, 04 Mar 2026 22:24:29 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991E207EEB
	for <lists+linux-parisc@lfdr.de>; Wed, 04 Mar 2026 22:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9534A303C004
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Mar 2026 21:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4089138422C;
	Wed,  4 Mar 2026 21:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5XYnQCk"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D42F4C92
	for <linux-parisc@vger.kernel.org>; Wed,  4 Mar 2026 21:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659467; cv=none; b=Q8nZJ8EA+klWH1KVFlbRJlSk9UFdHDkhY0ru/H6cyNHEq254Mf8hUXfCQlVfqqww+TgwzZEoOV/otgcpev+pRXTs8vw7Br8edmHkwOiUWXH1FQxi1JG2VJZt/uvoRxazwwKwh+XK52i7IoEkVqGnMlxqMfm/gF9z8n2R54MxHfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659467; c=relaxed/simple;
	bh=KJDGB08fRKTKldBO09T1dAwZgPHDn6frUJYvrG+TxZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eq+IE81ib+mlxKBFagOpqx4ASFbWC2wTV2r+5hxmS/rhICPy3pltSbSM6QShJshnIplt0lp+IU2KZ9Iu0HPjdAdl8Drapj769h44NuQe1ITAh0bUHQetl422+Alok5HrWZE190/ZXEOf0aLpR8sp7RYxhdSVlWCXeuup99dbOy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5XYnQCk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02992C4CEF7;
	Wed,  4 Mar 2026 21:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772659466;
	bh=KJDGB08fRKTKldBO09T1dAwZgPHDn6frUJYvrG+TxZo=;
	h=From:To:Cc:Subject:Date:From;
	b=m5XYnQCkMKABRNsP8YrwhQZhmChdX5+mC/EyfA2Der1gR2leT1tRxaFo3BUNqOiVr
	 WawVPgYEF+w/2teloFISx1kvizOCv7BLb7JGHOnIpbzvCk9VKdUSTq+rv8+rLmUbjt
	 ZQ4f7WUezEBxK0ZkdUlrKWHeZimSNM4QmIZfWrbc1tzX9mzPaoZb2PTTTsX3uIG5xv
	 30bw644wNLZuv9WBj2QYj/mp84b+auF+Ok4B1NTvcEMpF3pam/bBemR9OHCwBsAQTp
	 Bn81ucgDykEN4i9KY6nlWg+U2t2iBx2TZe1mJMmoR87qau96yeGT9bJgAbMdK4EUL3
	 o0O/RM4kc8NrA==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix initial page table creation for boot
Date: Wed,  4 Mar 2026 22:24:18 +0100
Message-ID: <20260304212418.10556-1-deller@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1991E207EEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmx.de];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-4620-lists,linux-parisc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,linux-parisc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-parisc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gmx.de:email]
X-Rspamd-Action: no action

From: Helge Deller <deller@gmx.de>

The KERNEL_INITIAL_ORDER value defines the initial size (usually 32 or
64 MB) of the page table during bootup. Up until now the whole area was
initialized with PTE entries, but there was no check if we filled too
many entries.  Change the code to fill up with so many entries that the
"_end" symbol can be reached by the kernel, but not more entries than
actually fit into the initial PTE tables.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/head.S | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index 96e0264ac961..9188c8d87437 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -56,6 +56,7 @@ ENTRY(parisc_kernel_start)
 
 	.import __bss_start,data
 	.import __bss_stop,data
+	.import __end,data
 
 	load32		PA(__bss_start),%r3
 	load32		PA(__bss_stop),%r4
@@ -149,7 +150,11 @@ $cpu_ok:
 	 * everything ... it will get remapped correctly later */
 	ldo		0+_PAGE_KERNEL_RWX(%r0),%r3 /* Hardwired 0 phys addr start */
 	load32		(1<<(KERNEL_INITIAL_ORDER-PAGE_SHIFT)),%r11 /* PFN count */
-	load32		PA(pg0),%r1
+	load32		PA(_end),%r1
+	SHRREG		%r1,PAGE_SHIFT,%r1  /* %r1 is PFN count for _end symbol */
+	cmpb,<<,n	%r11,%r1,1f
+	copy		%r1,%r11	/* %r1 PFN count smaller than %r11 */
+1:	load32		PA(pg0),%r1
 
 $pgt_fill_loop:
 	STREGM          %r3,ASM_PTE_ENTRY_SIZE(%r1)
-- 
2.53.0


