Return-Path: <linux-parisc+bounces-1904-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5615946A87
	for <lists+linux-parisc@lfdr.de>; Sat,  3 Aug 2024 18:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EE16281753
	for <lists+linux-parisc@lfdr.de>; Sat,  3 Aug 2024 16:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81356134DE;
	Sat,  3 Aug 2024 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEl20ahU"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D9134A9;
	Sat,  3 Aug 2024 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722702762; cv=none; b=T2/CrCHcaD8lLnJxjpp99HnOzNedPX4slvXKCmk4a3+86XZ2RBWHJt51MOBpjsW7qwRo+YOfTu3f1JPKyvkbDT0rlVJYHgAaSy2beJ4Eydp90B9leRdWjsIJo4zq4YXqdKkh02L4lki+N9yqAACYd5BKgIbPYAk4WGZF7uOMB1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722702762; c=relaxed/simple;
	bh=l+GsN6fvjMRiQKKYKQBxIZyd4R4E9u6bHc9VzAZu3RQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=E8rJxa88nIMqlylLGpBOXiyud91PfFYIj4IxlTWIksnPzZqej71nFIRe6B/wHXWilk935jSnuRbJS+TDjhbwYvuNvU8ERQ3P3p76Q9IGrPDyrLzZzasdlLgneFxP+7mGgkvFQ5K4k3LAqJ4yKz6RivkaU79k9etNaRALQWsNuQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEl20ahU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C698C116B1;
	Sat,  3 Aug 2024 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722702762;
	bh=l+GsN6fvjMRiQKKYKQBxIZyd4R4E9u6bHc9VzAZu3RQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IEl20ahUg0smHYk4MaA0Hq179lMbY1QTRaAyhCSppwwNVrSxjbjP6SwPQ+b7fDjmK
	 W7pUNN9CJG3PMlfgpTUddpIFMAPKQf7x9tibxKyFkFgtvNcSrEKgVTjgfuLrucouT1
	 MYdNEUjgJJdWB7LCxpgHi+Q+GFUIMeibXkSXNexrOeoOc65oazLAYAIF52/GVzOhYU
	 q/ugHOq/bH+kjz7nQkjULg/xdfM7w1vF9D3BWOPhkIOc7R5v7qDJqj6/TbaZ6wPoYP
	 gyfebbe/0citbjydbATuE0HzWBYZOkL6Hxqew2H4FDMRYpbrienbw6TF+tEt9nr7Dk
	 b0JmxW46n5JnA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 22505C433F2;
	Sat,  3 Aug 2024 16:32:42 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes for v6.11-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <7ab022d9-c1f3-446f-b27e-1d95f725e75b@gmx.de>
References: <Zq1B366giNrrbU3W@p100> <7ab022d9-c1f3-446f-b27e-1d95f725e75b@gmx.de>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <7ab022d9-c1f3-446f-b27e-1d95f725e75b@gmx.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.11-rc2
X-PR-Tracked-Commit-Id: 7ae04ba36b381bffe2471eff3a93edced843240f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1dd950f2888f63ec163f3f142161e21a66685e35
Message-Id: <172270276213.23596.15937313810472071921.pr-tracker-bot@kernel.org>
Date: Sat, 03 Aug 2024 16:32:42 +0000
To: Helge Deller <deller@gmx.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-parisc <linux-parisc@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 Aug 2024 10:10:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.11-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1dd950f2888f63ec163f3f142161e21a66685e35

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

