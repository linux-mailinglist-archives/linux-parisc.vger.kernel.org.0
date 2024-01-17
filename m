Return-Path: <linux-parisc+bounces-349-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DB0830BB4
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Jan 2024 18:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97985286142
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Jan 2024 17:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2A6225A8;
	Wed, 17 Jan 2024 17:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+jXHZSL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42431224FB;
	Wed, 17 Jan 2024 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705511360; cv=none; b=ISkMvfBlgiWEMt2un+rhuy0q8lcTZpaRzuYESOKIkN9QKjI4/w9K5lY86UpnnthjV+SMCdKFEC7kM1PZcpb5rQ/RjK6u2kDC8ROnMbKWoO2v+WeE2pE0PS1yVVRTfXRt9pTlBauHX7rqs2b7qIQ+grGlsU2w5a9MkozFLEx79Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705511360; c=relaxed/simple;
	bh=31ia4BHPVzV6at4JXVjCNm7JNSTI1HhyWm9vSSLO+Tg=;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=owdPJhdiLaAjayuBa4lIC5DtYWvK/h/2Y3oHs5Yv5PpPAHKrk0SFEWfpYg0Bq1tCwOihELR+fUTyh/x3o4iOUdZHYGLvIJ7urgx21tRLfnzY4vTkkZi+Ism8ZXguHkZ/h0iPcXBbrZwb+r6d7WS2RXh/PL9qIBJNegpXJIrVf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+jXHZSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49629C433F1;
	Wed, 17 Jan 2024 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705511359;
	bh=31ia4BHPVzV6at4JXVjCNm7JNSTI1HhyWm9vSSLO+Tg=;
	h=Date:From:To:Subject:From;
	b=M+jXHZSLtK+cSLaHmgoOuITwXrCxy5auWiQGwKRyqpFwqy0EPTubTFzl4KzEc4gXA
	 d1ju+ikfeH+Et/5ZQfj2WpKcdvoEsH9mWxuCT/weDQal8nm1aD+TdGqKgL5ZcAnpql
	 FAPv1Frlv3wSJYgGKKr/0FYA0vtOPyweL2gm9QZky1749bNYXZIrhwAul2BT77th9a
	 Tu4Jr+z2K/2qIP06rOXMIXnFKilzPhwh8v8zyE2Gi25pSy9yrxx74hNnCOJln1b1eH
	 cLh9q4Tot7/HEk7IKNW2AdFLhtE8kQHrXIeecOyipC43jrNx4MPTjxG5ahkge4lX3o
	 BT+Ca+DedbiqA==
Date: Wed, 17 Jan 2024 18:09:15 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fixes for v6.8-rc1
Message-ID: <ZagJuxudO7V510hS@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull a two small fixes for the parisc architecture.
Both are tagged for stable series.

Ensure power button works on qemu and fix firmware start address
calculation on machines with 32-bit firmware running a 64-bit Linux kernel.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 0dd3ee31125508cd67f7e7172247f05b7fd1753a:

  Linux 6.7 (2024-01-07 12:18:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.8-rc1

for you to fetch changes up to 6472036581f947109b20664121db1d143e916f0b:

  parisc/power: Fix power soft-off button emulation on qemu (2024-01-07 22:59:16 +0100)

----------------------------------------------------------------
parisc architecture fixes for kernel v6.8-rc1:

- Fix PDC address calculation with narrow firmware (64-bit kernel
  on 32-bit firmware)
- Fix kthread which checks power button get started on qemu too

----------------------------------------------------------------
Helge Deller (2):
      parisc/firmware: Fix F-extend for PDC addresses
      parisc/power: Fix power soft-off button emulation on qemu

 arch/parisc/kernel/firmware.c | 4 ++--
 drivers/parisc/power.c        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

