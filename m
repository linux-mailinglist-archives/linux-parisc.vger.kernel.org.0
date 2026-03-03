Return-Path: <linux-parisc+bounces-4618-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Pi4KJFip2lvhAAAu9opvQ
	(envelope-from <linux-parisc+bounces-4618-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Tue, 03 Mar 2026 23:37:05 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F501F80D6
	for <lists+linux-parisc@lfdr.de>; Tue, 03 Mar 2026 23:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3658C3006384
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Mar 2026 22:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D768E35DA71;
	Tue,  3 Mar 2026 22:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVJANFqC"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537D1A683D
	for <linux-parisc@vger.kernel.org>; Tue,  3 Mar 2026 22:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577378; cv=none; b=LCgvrZ73LGd3jYB6bHBZMokqxCNyaqgau7agt9xNol269p3eXFTttgcwsYETsTfdHi8AN5cmGiX5txngSVxZEZvgjXfC5OL/OuMW3y8lxpVd5mLdyh9fLu0wj6xsL5TJJhvihwIjXH097rYlKCvwJ9Lrrux+F9EaWMXOybUrXVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577378; c=relaxed/simple;
	bh=U6kRllDhiqt9PQqlP+Vf0LvXvrlQVsWXD5ZSvaQJ3mI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rxLKubn5NY+kS6vh1Jk29lMxATpdstoIO3susAx2P2rsK+LUIj74ec/WaOKNpNVTZA/Bgzq9CXQ//mqQxfWIRpowWkECHJUoUf3ifxN7rUv5tNdIflZ8TaJFjUniNQ8E/7mUwrapj6T0mZybd6ZdRnglaJXXL1xI97w/l9p0Jro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVJANFqC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FF7C116C6
	for <linux-parisc@vger.kernel.org>; Tue,  3 Mar 2026 22:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772577378;
	bh=U6kRllDhiqt9PQqlP+Vf0LvXvrlQVsWXD5ZSvaQJ3mI=;
	h=From:To:Subject:Date:From;
	b=ZVJANFqCGXbfm1btk8ADkAgBKBJNEJvStB56v/O/iEM+y7ANeB81cdpxJFG9qAWYc
	 eEpSVVM5pKL+inOAmVF+CbTgJpUI1UMWq9ln3/cFCXPhaL8QBqEtVC00HBoXZcT987
	 /UBF1K9FrXYZmnhGJEvbmvd/EL7fkN166VXcEWaLkuLRMYdqILmSOGOfmm9A2sDSeQ
	 PxPtfD1cxCpsnHxiOuvRB0AqEuSRhxxkblARSNxv2YLZY1pfW+UW6dvNEO3YYfFJv/
	 5G2GubPyXg3IA+XQtQ/0DnLku0dXIabdRzfANUaEH90gyJCBgfBQmR+W7Fv3tFQ2LI
	 krTsxknqcYqOw==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH 1/2] parisc: Increase initial mapping to 64MB with KALLSYMS
Date: Tue,  3 Mar 2026 23:36:10 +0100
Message-ID: <20260303223611.207646-1-deller@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28F501F80D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4618-lists,linux-parisc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,linux-parisc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-parisc];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gmx.de:email]
X-Rspamd-Action: no action

From: Helge Deller <deller@gmx.de>

It seems 32MB initial mapping is too small when CONFIG_KALLSYMS
is set. Increase the mapping to 64MB in this case.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 2c139a4dbf4b..17afe7a59edf 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -85,7 +85,7 @@ extern void __update_cache(pte_t pte);
 	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, (unsigned long)pgd_val(e))
 
 /* This is the size of the initially mapped kernel memory */
-#if defined(CONFIG_64BIT)
+#if defined(CONFIG_64BIT) || defined(CONFIG_KALLSYMS)
 #define KERNEL_INITIAL_ORDER	26	/* 1<<26 = 64MB */
 #else
 #define KERNEL_INITIAL_ORDER	25	/* 1<<25 = 32MB */
-- 
2.53.0


