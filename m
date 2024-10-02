Return-Path: <linux-parisc+bounces-2433-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01898CB52
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 04:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DAEE1F24EED
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 02:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5043209;
	Wed,  2 Oct 2024 02:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzZSq1bw"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B7123AD;
	Wed,  2 Oct 2024 02:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727837106; cv=none; b=njC9urOF2lpLPz3PeRtyxyY0UGirbQhVeS7G/2SxW19rBmUm5zp3VvVfGmw5EFETgiYDD5WaqUzxbOL6nZjhjQCFKmjHlE/tBOFEDpkUpZLvy7iioP40s5nKVNei/DI0x47AEOmgPKXJRNuq5HK7quhnuQtrHB5136IyWhTUQCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727837106; c=relaxed/simple;
	bh=ddh9qlrDrucQy9lLTbOD/9mCbmekVbRFJ/r27ykIZ84=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=JvdlgH9qCNAodl96iHOAWQ0vRXOQaDLp3Z7MhVhu6TvnRMibP+itczfxmC00NP1CrxFdcdWsh2EL7MgLR7z6CbPtPsqQxZRSxWdwEPLAVcD655m3vFcuP8ji5k/bURZ/B5l2GcDwLF3njfTNQVYh6Ix7/XcCDMJqB68dGXLXCqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzZSq1bw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0443FC4CEC6;
	Wed,  2 Oct 2024 02:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727837106;
	bh=ddh9qlrDrucQy9lLTbOD/9mCbmekVbRFJ/r27ykIZ84=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=hzZSq1bwCIg591+7KZddak9uQe5cJPxrJgDz/K3MH3koB0JMJSwNDSHn9Wc0pcnJI
	 ufGsyVjzBlUhYgSWJTt1uT3jzcRdwmgAdMRrEa4MjIL2olQA7j2IgvW3iZq6MLb2Ap
	 XuXWXsCjKXFG/eKrCyiaqgHmeytBTkNbPHW03WV9YQ/G5Y/lR44MxqKf1LJcv6B1rU
	 D5tUOTC1DBM+6/D6+a8OGkFtTdPqvqYeoGs5EK8Zv9ARlKLP99HCXuxmHs0YyOSCAy
	 1h4/YZZr8whAU3u0bE8OjwepnPdEKM/8m349yrYdMM6ylIfkvA3VcPPrxIqnLKZhcu
	 BZv+9Mfkugn8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 40E17380DBF7;
	Wed,  2 Oct 2024 02:45:10 +0000 (UTC)
From: Helge Deller via Bugspray Bot <bugbot@kernel.org>
Date: Wed, 02 Oct 2024 02:45:09 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@HansenPartnership.com, bugs@lists.linux.dev, 
 deller@gmx.de, linux-parisc@vger.kernel.org
Message-ID: <20241002-b219339c5-8775d7b15b4b@bugzilla.kernel.org>
In-Reply-To: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
References: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
Subject: Re: calling getcpu with misaligned address causes kernel panic
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Helge Deller writes via Kernel.org Bugzilla:

Initial patch to fix qemu emulation for parisc posted:
https://lore.kernel.org/linux-parisc/Zvyx1kM4JljbzxQW@p100/T/#u

View: https://bugzilla.kernel.org/show_bug.cgi?id=219339#c5
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


