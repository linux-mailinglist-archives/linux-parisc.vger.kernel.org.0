Return-Path: <linux-parisc+bounces-4340-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68448CAAFBF
	for <lists+linux-parisc@lfdr.de>; Sun, 07 Dec 2025 01:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 359AE3079E9A
	for <lists+linux-parisc@lfdr.de>; Sun,  7 Dec 2025 00:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825321E5B9E;
	Sun,  7 Dec 2025 00:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2FZcPhk"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599A11DFE22;
	Sun,  7 Dec 2025 00:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765067406; cv=none; b=X8aJmd6bBN7a2auJgKJcNl3bsA+iTBRJrd1/hxRXibnR8w+lxVN0OV9xgqVLbQ1HXSAxiZQqqwj1UUH75uZQ478kBGw/gPrHwSErPA0yG3O4mWWELPpkLcnbFP/RvLLPGKHNNfCShCmwDgVzF7xvDXHbUnfFjldNX6reSz1F74I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765067406; c=relaxed/simple;
	bh=BehhbUYKFUXF0F2HaT8t6MPhySJRTR/bSDoV/wVqBuo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=t3uadUevHGLhlWm4NYt+kwHav7OpRhdFORbZ4UGL7Xunago3tlY9sv49VxpB71AYWcg6d99nz076UVFdLKG61JugmkQJFszhDonQIT9CuErhVt/29rkPXz/woQc4V0/6/MF+RRsTs8VKqmYdp2O8QNectrWhk9f2RN94Uh9fi3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2FZcPhk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCC1C4CEF5;
	Sun,  7 Dec 2025 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765067405;
	bh=BehhbUYKFUXF0F2HaT8t6MPhySJRTR/bSDoV/wVqBuo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=e2FZcPhkRn8oMoMk8Ii+P77i0JPQy3EiT4iP50pfwZVVDagTqVQT4RtWlLC1SDht6
	 p/fIL8HezLKeae/h0qDQ+XSz+iXk7b8jwwt6g5ctBwvEsWBZ11MnoPd9epClZOVx0e
	 6AkQKuN12W3eIzsvXiFD9Q5oUs7Wl6oYhA4yKlY6NKaecpoHXAIYJyvJ3oBvDjgNJy
	 tX1OuDUvinxT7du+hjVSsjFM7o/2IRzRdY9AbQT3/kPOxNg3P7Dtcn/V91EN6nDhw2
	 qW50pF1bUVQyDAaI/C37Piaz7pqFELfEuA9vx/10lGOPks05ch8jc9cy6Jr1vSJ6Y6
	 nVQW5/WvCkclw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B579F3808200;
	Sun,  7 Dec 2025 00:27:03 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes and updates for v6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aTSdXEYJFuhxMltf@p100>
References: <aTSdXEYJFuhxMltf@p100>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aTSdXEYJFuhxMltf@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.19-rc1
X-PR-Tracked-Commit-Id: dca7da244349eef4d78527cafc0bf80816b261f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 50471f8b7371c95c72c168eb45e4f42f1514fd5e
Message-Id: <176506722219.2244723.16870759143766873657.pr-tracker-bot@kernel.org>
Date: Sun, 07 Dec 2025 00:27:02 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, John David Anglin <dave.anglin@bell.net>, Sven Schnelle <svens@stackframe.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 6 Dec 2025 22:17:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/50471f8b7371c95c72c168eb45e4f42f1514fd5e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

