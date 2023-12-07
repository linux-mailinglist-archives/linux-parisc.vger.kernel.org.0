Return-Path: <linux-parisc+bounces-158-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E648092AC
	for <lists+linux-parisc@lfdr.de>; Thu,  7 Dec 2023 21:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7F01B20C2E
	for <lists+linux-parisc@lfdr.de>; Thu,  7 Dec 2023 20:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5657B4B146;
	Thu,  7 Dec 2023 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhBQ/9Dp"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AC4B12F
	for <linux-parisc@vger.kernel.org>; Thu,  7 Dec 2023 20:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFC8EC433C7;
	Thu,  7 Dec 2023 20:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701982014;
	bh=NwNkY7Lupu4KcZz4m8HPPe5ArDTwKZ+txhqyvO9E6GE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UhBQ/9DpspEHJZqhRTXWizm64gQwdF7qtbu/0nGC0JNrijNqQvw4XbJsqI0jhC35G
	 HrkRpWqr/sP0wN07yX2P19D6FLof3A3jpGisojN72BuswIc6DD/b5tkpOu6kfaxd3b
	 7SO7sP5XaQuX/JdA/4y+woZAq62r4KB0IGYXfKSH4xwKhnYfjMW9UgiYHCeAaZbAKn
	 To5Ey2ARrtinZPc3pw0Zq1xswq0+Z835wcrudI/ED7082B2xDOwTo6OgIHtveheXSw
	 JDE/VIo5tf0JIrpRueXtSHJ250Ulbv4NQGkg6Jq8UlBokZbe4lsIvSrO7BsJXrqCSM
	 HyUHfdsAM5pbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ADFDAC4314C;
	Thu,  7 Dec 2023 20:46:54 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fix for v6.7-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZXCRkjpftWJwIbpk@p100>
References: <ZXCRkjpftWJwIbpk@p100>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZXCRkjpftWJwIbpk@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.7-rc5
X-PR-Tracked-Commit-Id: 487635756198cad563feb47539c6a37ea57f1dae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55b224d90d44d794c1afab046c4fd9dc8be9247d
Message-Id: <170198201470.1554.10463763662820932160.pr-tracker-bot@kernel.org>
Date: Thu, 07 Dec 2023 20:46:54 +0000
To: Helge Deller <deller@gmx.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, John David Anglin <dave.anglin@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 6 Dec 2023 16:21:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.7-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55b224d90d44d794c1afab046c4fd9dc8be9247d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

