Return-Path: <linux-parisc+bounces-1426-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC2E8C8C7C
	for <lists+linux-parisc@lfdr.de>; Fri, 17 May 2024 21:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AA5A286472
	for <lists+linux-parisc@lfdr.de>; Fri, 17 May 2024 19:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E6B1428F0;
	Fri, 17 May 2024 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cI889mZr"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2E1428EE;
	Fri, 17 May 2024 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715972503; cv=none; b=h36egbgzPwEfEOrRvrOq7M0kq6knPmVWsgRKAj2svOL9FawGhF1MjTQ4rr6DO4BmIQXiAXkOH1UYx8wQcpEqASgvwRq/WwVItVdI7TvEVth0IDeS/2g89nCoPCiEK748Al15K3EPdJ5dffkdPFZkq/61CsNuQMsJxM+gkleIXw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715972503; c=relaxed/simple;
	bh=a2St1COHMmyuL8VEWYPleeBpklVTgOPd/JYoTuTXTgw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=l9fUpgGcEbiHYbz3e0WvEF36Qw9gmomKTlvEma5gEFB/6dmIhqXOjLMJVthCdnJYCwM5DUkBJkVLwJg03Te3cVRmdCzHxOExnMrINTH3NI9i4PJ7I1SXL5BuwetGMBq0nnN73yw0eNksDErcLfunzJHYVtXfXDaxxdpH82GC8JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cI889mZr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C25CC2BD10;
	Fri, 17 May 2024 19:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715972503;
	bh=a2St1COHMmyuL8VEWYPleeBpklVTgOPd/JYoTuTXTgw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cI889mZrZyKwBiabnM6a7q2oHx01tgLAZw+PUTmUExNqWJlWxSeQ161U5Hth0jRlo
	 G9wttpHvbK2Aj7j8SNkhYEQZTwv02WvGm0IQvB1R1McQxcGxRu7n/KIUVEn3+MtMRy
	 Ex4L1l2kScrU/SYCT2hI+u2D1+ZkhMT3XGX3r3BYQpS23rNWQY4ZCrwUKo98INX8Cv
	 RmqxcTCJuZxjwb5tQBmAQBMqcAzs5GhcBiROSshwjRckSXhlGXSXOYCz05SX5r4xW9
	 K9VBqq9CcsdPJmK9bIxIDFRVxZUapktKIduLTDSEV0a+dGGqK3xfozq2nhON1f/s8h
	 kdyoxXue+88iA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81883C43336;
	Fri, 17 May 2024 19:01:43 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes for v6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZkelZteEp_Cgqwo1@p100>
References: <ZkelZteEp_Cgqwo1@p100>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZkelZteEp_Cgqwo1@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.10-1
X-PR-Tracked-Commit-Id: d4a599910193b85f76c100e30d8551c8794f8c2a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ee332c9f12bc5b380e36919cd7d056592a7073f
Message-Id: <171597250351.25909.4152617023438792632.pr-tracker-bot@kernel.org>
Date: Fri, 17 May 2024 19:01:43 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, John David Anglin <dave.anglin@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 17 May 2024 20:43:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.10-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ee332c9f12bc5b380e36919cd7d056592a7073f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

