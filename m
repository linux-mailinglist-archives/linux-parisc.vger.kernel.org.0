Return-Path: <linux-parisc+bounces-4561-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJYGOe8YjGnegQAAu9opvQ
	(envelope-from <linux-parisc+bounces-4561-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Feb 2026 06:51:43 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418B121814
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Feb 2026 06:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7AE73005A91
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Feb 2026 05:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C42318ED9;
	Wed, 11 Feb 2026 05:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njYZyBlj"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E398630EF94;
	Wed, 11 Feb 2026 05:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770789102; cv=none; b=p7V3ZQeVELf1zq7LCiabqR+BWikfAmupMiZss2cAUwb3fHrnQt55wSzTm3DiZeqTC8lUM4OebfwhlqPJYGTCsias4X18M1tNBCzNd06D/Ia9wHuelkABo+kRlfAtSAqCxn5oIPSt+90kqcspPOwRYpyQm5fpeDHmwZa+Gg7h/PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770789102; c=relaxed/simple;
	bh=jiY1+qAAKjj39P5OR7E/UexSRo4KkSZuuRl63yIfwws=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GkXSxZfNxEYd/Rsx6a7u9gl0BQtBRlwwx9BGBwgafIojJICDPogE9i01TEY47At1ZS0r4GxO46tJ6etaj/AXWWdj1KgIlrjcF/9EgN/5Y808sKgJD0Vzi45TxBqcGP/z6+2lqWEB2nRDT5ehsOYXLbCriy2a2fi2NsJsLTGZGE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njYZyBlj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83143C4CEF7;
	Wed, 11 Feb 2026 05:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770789101;
	bh=jiY1+qAAKjj39P5OR7E/UexSRo4KkSZuuRl63yIfwws=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=njYZyBljm5qr1gFTWs+zACwiKgRnarqBFl1mT5kzOFWuLN23ZMp4bwJIlf2X/czg6
	 thZirSA4bIFwlhaUYTd35Ut04eYITwsYdBXpPDfn+nr/sr4jmGqyOWpaPdpI6HAzcC
	 C/zzK+TTUpOZ6hCr7KKXAmLF7Gh2Oi6TrFB+vE3UMM83Yi8bwhBLk4gFaA8FiLcMA+
	 v3k8dGz36P2AGOWB/NxpNnF0hn7VVzg5OqXoFzwywruYuPM7LyGBgk8NfWPhd4YbrM
	 TxEWdPG6cJ5o7q3WUhsUCBBsHPwuYTBPhQmc5QkcqXGzsSF8NeQlTaHXZQLA1S7JOh
	 w40syxSa0FvIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C221F380AA50;
	Wed, 11 Feb 2026 05:51:37 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes and updates for v7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aYuQBx7-f11nAgU6@p100>
References: <aYuQBx7-f11nAgU6@p100>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aYuQBx7-f11nAgU6@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.0-rc1
X-PR-Tracked-Commit-Id: 1651d69443c3a5fc12f1dee1229d526e7af9020a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8ad8d24d962804d3c54b5b7542c4cb7cd6bacb3b
Message-Id: <177078909620.32382.11067309202024010107.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 05:51:36 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4561-lists,linux-parisc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-parisc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-parisc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8418B121814
X-Rspamd-Action: no action

The pull request you sent on Tue, 10 Feb 2026 21:07:35 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8ad8d24d962804d3c54b5b7542c4cb7cd6bacb3b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

