Return-Path: <linux-parisc+bounces-2430-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C3D98C806
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 00:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E98BB20EAC
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Oct 2024 22:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12881BFE0E;
	Tue,  1 Oct 2024 22:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="psUvfrjL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F8719F48D;
	Tue,  1 Oct 2024 22:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727821205; cv=none; b=ks62ht7BCaz4X9eykynOQTRLEO19Hje3557uRVr/p7zW+7fSHpOWfO4vBy7Oh7zHak7hFDjCrpuS8f9DdbzwM8GUia5NGubj6GoC1tm6L1FWKkKK5nJxepCe3JFDJIHo/JIv3i1vXC0UrWJRxYP9ledpUK8C5irGnMaQYxPyCjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727821205; c=relaxed/simple;
	bh=F9MnbCpcl9X9Zy5tZMWP0oiPv4qmvaGJ8tFMLmxiqQo=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=rcybehsQuQ1QpHHj22rM4aZ/9pOWue2cwmYLViAv1vyRJokPdnraMvWX5BShm1VYGVs9Rlndb+PTNnD6Voh1h3l2ENSgzOD4QlWjWiQuLgFzjWcqDHqXzjCmAtJmFIA+halyIr4D7Hz840POnWy1J/PjNWJxrGn7UeNShDYdhno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=psUvfrjL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42427C4CEC6;
	Tue,  1 Oct 2024 22:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727821205;
	bh=F9MnbCpcl9X9Zy5tZMWP0oiPv4qmvaGJ8tFMLmxiqQo=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=psUvfrjLvHSsGz0oqWltPxp5/IzluSny8Q/q5nS1MDJwd7FWN1PmbtIT6KnN6OY8X
	 nnKmsjaVywAIbSiDh5VcTu8Shw8u5zHqET0MpJrgnh4mq8+kgEW2PEtgrVEBAR6zHM
	 NRgS3jzQ8pYOcYnkECbBJh8W8pe4ivzPDxQi+ZBrt7pNapu2dW+nJ6z/8YDnaGApkD
	 sgE7i1LS7WDZXGfqDoScAdgOddrBlgiwc/GeWBPy4oXva4H1j8Qw5Yv8D7Up/+Fl2d
	 bltR5X4mYyCE6bKNqqSYJ+h8qjI3S1CfmplAFMCi5JHeqFDhPm5iGynBEcI5ZRUJET
	 XYVIw31lhnvnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7746D380DBF7;
	Tue,  1 Oct 2024 22:20:09 +0000 (UTC)
From: Helge Deller via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 01 Oct 2024 22:20:08 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: deller@gmx.de, bugs@lists.linux.dev, linux-parisc@vger.kernel.org, 
 James.Bottomley@HansenPartnership.com
Message-ID: <20241001-b219339c4-74b73b8edee4@bugzilla.kernel.org>
In-Reply-To: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
References: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
Subject: Re: calling getcpu with misaligned address causes kernel panic
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Helge Deller writes via Kernel.org Bugzilla:

I'd assume the segfault on x86 is because of the vDSO implementation
of getcpu() on x86, which executes vdso_read_cpunode() from
arch/x86/include/asm/segment.h:

static inline void vdso_read_cpunode(unsigned *cpu, unsigned *node)
{
...
        if (cpu)
                *cpu = (p & VDSO_CPUNODE_MASK);
        if (node)
                *node = (p >> VDSO_CPUNODE_BITS);

View: https://bugzilla.kernel.org/show_bug.cgi?id=219339#c4
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


