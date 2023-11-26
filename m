Return-Path: <linux-parisc+bounces-70-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B73C7F94C0
	for <lists+linux-parisc@lfdr.de>; Sun, 26 Nov 2023 19:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC866B20C1C
	for <lists+linux-parisc@lfdr.de>; Sun, 26 Nov 2023 18:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917998C13;
	Sun, 26 Nov 2023 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqn6AJAZ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723AC3D7C
	for <linux-parisc@vger.kernel.org>; Sun, 26 Nov 2023 18:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F19E7C433C7;
	Sun, 26 Nov 2023 18:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701021800;
	bh=Gg5Y8fFkPZFunUuSW0JeQ9r0V4qzjdDkY3C8H17USiQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hqn6AJAZaRTHPIktwMJ4bbX6FV0Da94c8dXmXIPCt7uiCd1QWgEDFkwNdgHr5Qabr
	 B2V1QeutPMFGj7bA7jI28bL8yk16mqoa5bIYZnFu3HaWa3Ir7J+JiH4RhDZP10Favp
	 OX7Is46Yj0eP8MuWqA5bU5YyDOcVBM8VyEG/SJKnlkvxaCrVD91aeFDM4Pa2ZKyeca
	 s4FXKFTO/C9FNOz3hZeLPyFZvM/S15nkgNrEM3Ii1Ml/TRZ+NkBCwnty4r9UfOLUlE
	 Sq+btNvGSTTvRKk+hpPKP5NRbiEyHluJjj+tKxi20S7zzz9e9WFgiu7NosAiqjSA2h
	 UKwDBdfM2Q6eQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DC619EAA958;
	Sun, 26 Nov 2023 18:03:19 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes for v6.7-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZWN6qUkUEewrKNOe@p100>
References: <ZWN6qUkUEewrKNOe@p100>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZWN6qUkUEewrKNOe@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.7-rc3
X-PR-Tracked-Commit-Id: 43266838515d30dc0c45d5c7e6e7edacee6cce92
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d2da77f431ac49b5763b88751a75f70daa46296c
Message-Id: <170102179989.12031.198762284192392864.pr-tracker-bot@kernel.org>
Date: Sun, 26 Nov 2023 18:03:19 +0000
To: Helge Deller <deller@gmx.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, John David Anglin <dave.anglin@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 26 Nov 2023 18:04:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.7-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d2da77f431ac49b5763b88751a75f70daa46296c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

