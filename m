Return-Path: <linux-parisc+bounces-3245-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA86A1BD1F
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jan 2025 21:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F81D167F11
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jan 2025 20:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEE02248BB;
	Fri, 24 Jan 2025 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiDEtmwI"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91250155726;
	Fri, 24 Jan 2025 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737749125; cv=none; b=ZgvgDro3w+H/9SnAxrbMr493TOZn/OlEOLm8s877KmAqGXF2TH5ExV4w2+/J3vHwaBonK8MhYm9y4DNINaTIbDlwl8819XuZ5nU/I6w/BDmzGW9SmAy2g26TgFmJWHplC2K0hly8c5TT6A0XkoynzIVh0rWOpfqmTilWtzsZimg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737749125; c=relaxed/simple;
	bh=Eg6rmXWMxJicRidNRX+YdDvrX6uGhpGKzJkzwwOiSj0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=h3rpNPI7aQzWBD0B8FTyrUXMt60mG/N5y0ApXeHJczcttqqM3PFu23ppwZrCEMfJRnpQIrA83wQuFiKTR/MW7pxqPV1Ufu1fVt2LCdVcjMkJhIwa6/uUlTIaQ8rsSVvKyRIRpMhC99Vq7bcKsOSeMEHGSR960ouND/rNiwqm6oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiDEtmwI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C565C4CED2;
	Fri, 24 Jan 2025 20:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737749125;
	bh=Eg6rmXWMxJicRidNRX+YdDvrX6uGhpGKzJkzwwOiSj0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aiDEtmwIn36It9+l6dZtLws1VvR6jATLKJTJA774XerNWC1qowqX1axCimwg3D1ZV
	 YVT1stqYHB0ol6GPVt+Faqn/cYTaT8l3OvRZLYlJ73aFRaCkSga4dIU/p7WuFaM1jz
	 PQ8CYdb1oJtu/348COnjgXd90t9nBpp/GzICQESt+BZ6ijp8CRfn04sYNbYtnKdbgi
	 GCEmM5nJkelDFiIPrX6/F6jMVNt4T67W7/tHvNn4BmD+JkONq8hRdBOta8eiBlwagy
	 rMdWBesBlOH/GF7T6QtKQ1nduxt1Y+laxJjdJrqDgfGTEo7kGjwpfxzzQMvT435Q+t
	 KMh7eqcbrEayw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C38380AA79;
	Fri, 24 Jan 2025 20:05:51 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes and updates for v6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5Jx15b2n2JworTb@p100>
References: <Z5Jx15b2n2JworTb@p100>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5Jx15b2n2JworTb@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.14-rc1
X-PR-Tracked-Commit-Id: 3599bae489d86fbabe039f9a2ab5472ffb04f7f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 47d65738b9752d6bf0ed694c3c829a06a1c460ac
Message-Id: <173774914981.2152159.117615076498347496.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 20:05:49 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, John David Anglin <dave.anglin@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 23 Jan 2025 17:44:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/47d65738b9752d6bf0ed694c3c829a06a1c460ac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

