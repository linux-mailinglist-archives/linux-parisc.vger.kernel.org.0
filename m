Return-Path: <linux-parisc+bounces-4627-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LiTN/GNrGkYqwEAu9opvQ
	(envelope-from <linux-parisc+bounces-4627-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Sat, 07 Mar 2026 21:43:29 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D06222D8A9
	for <lists+linux-parisc@lfdr.de>; Sat, 07 Mar 2026 21:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C900F300A3A1
	for <lists+linux-parisc@lfdr.de>; Sat,  7 Mar 2026 20:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E97E364EA9;
	Sat,  7 Mar 2026 20:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbSeIaM6"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA8330AD00;
	Sat,  7 Mar 2026 20:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772916207; cv=none; b=jkZYQNVEsIJdwXFGqv20zKCpSpF1K3i7tNPyiGTyvggDrxxUBLeNokGw8NVnc/VWhSb3zaIFZfOfyP91r16JL8PxP3e+ZcO/x7DH2MNxbbEzMmHJwk8YYvpSKcwSk5S1g60ftXrkyCE8E2S54v2nYHA4TV6W44tlrHBEtqZNOY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772916207; c=relaxed/simple;
	bh=IN1gR4dHttfOCgqZ9wjOPSXHFuTmY4VSK+s5d6HxwBI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=njbbS93WTNX2/+NamkZDYU7bYWOFD7Hs8fgm6aS24jNraVnvSGAb9gRmwA3JuPR34axAZvMagrRpjdJv3Q8hSmzwyDqOwG63Fw28yk+HJCcM2FuTIuiukU5ZdTNRfp0VhsJ8NpR1NzpQuXlS0B0ow2sjGZ/cNbhyt8zo/9XEM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbSeIaM6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BFDC19422;
	Sat,  7 Mar 2026 20:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772916206;
	bh=IN1gR4dHttfOCgqZ9wjOPSXHFuTmY4VSK+s5d6HxwBI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CbSeIaM6P3LDRVK4hWFylckou2AnNmSokeKgWoUyCLGMDQong48iEtNJ6zi48KcGC
	 qu6WcIAKnKmLHAQ84AaMlYsPtH6BM9UuNERRtgssT6eYc2bL1dv7d+9LlYHZvkMEIh
	 IHZjqIxWJ2yW+7yoQiO0eJfS3Z1la5jhD7inMoDaFCwy8hL6fpZken6CVyviMfklcy
	 l+sJXifB9j9n2VO1SAwjoNPF4Z/cKMrkHuv49V9i7GU8K2HbF3NhzJQNnOymNaP7XB
	 awShJrvsTC3e7KIuvIesGBsEvLF3VVeeCewcTw13W+RpprlCEs809+1yuynV+lpd/Y
	 pxArMxol1Adbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF543808200;
	Sat,  7 Mar 2026 20:43:26 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes for v7.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aayH3iaMo6nEiCKr@p100>
References: <aayH3iaMo6nEiCKr@p100>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aayH3iaMo6nEiCKr@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.0-rc3
X-PR-Tracked-Commit-Id: 8475d8fe21ec9c7eb2faca555fbc5b68cf0d2597
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6deccafcb45b53825b2039c475da0258c899418b
Message-Id: <177291620494.316744.1656882369193098052.pr-tracker-bot@kernel.org>
Date: Sat, 07 Mar 2026 20:43:24 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, John David Anglin <dave.anglin@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 3D06222D8A9
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
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,hansenpartnership.com,bell.net];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4627-lists,linux-parisc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-parisc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-parisc];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The pull request you sent on Sat, 7 Mar 2026 21:17:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.0-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6deccafcb45b53825b2039c475da0258c899418b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

