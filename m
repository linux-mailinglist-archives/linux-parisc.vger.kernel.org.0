Return-Path: <linux-parisc+bounces-2424-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D598C4C0
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Oct 2024 19:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F405B281E43
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Oct 2024 17:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9331CC8AB;
	Tue,  1 Oct 2024 17:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNm/rGGW"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0C1CC8A3;
	Tue,  1 Oct 2024 17:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727804705; cv=none; b=L/FFvN/y168AQ05AZdJ1tRB14S+yeYpPi1D1V48/Kv8GA8wIMa96FOEBXzGkBq1oDh08u7tfvUBrB1GvU/7FVSe9QjSwk/trqA1eKTSspWtlmk+rj+Ks94bZfECQrH9lAf7oYr7VqQTdA2evpUSSRkREHGREw3HmzgcTRpMTROk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727804705; c=relaxed/simple;
	bh=cGmlGzyEVG67x2K50IvHyi/Tx0saPFW7DN8+mkLx76c=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=eKA49/ZlBDnE3zq5kH7nfPpjGAbMsIq5IQn2IdZoL3YQVOqjhadpZLgDcUaavRobZ9+ISApXSj7cLfcmvB4HrkZs8hO5XzETTl4OeBK1qgDcRSVVJIAlVLb5LdmkImXnIUwfdfJmOWJF8xUDBZhDqErw+W/g2ZONjZSco6aoEi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNm/rGGW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42028C4CEC6;
	Tue,  1 Oct 2024 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727804705;
	bh=cGmlGzyEVG67x2K50IvHyi/Tx0saPFW7DN8+mkLx76c=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=TNm/rGGWZT3CreG/BTSEWpbxklniFKAQ7z2ot8FWwmHNqbgjJ0ta7cDl9E4dvAD90
	 XrBFwHkOv6RBA/Xk5z4MM1xUZlzEQrLSRbMH0Qx4kVpJpU/N6Q5XV+yjCw03rC5UHz
	 kXceY9txJI4kUveLSKJO+mQ4S0P9xajpjhJiAXakvbwtyocLjm2y46ThR5V1WsQN57
	 KCUHrl9TYxlm/qtvuxWYE4aE80tiewbCf+cJVPO3VYidmdNl4iahWE7tGtIuiuyrD3
	 l1N9FubWI8yqrwHjpEFdLlIFyYkrfl8VnXhT6v5B1OwxCEX89FEVuYvrUm4Nf2EwQY
	 MjUeafkneA1QQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 79B27380DBF7;
	Tue,  1 Oct 2024 17:45:09 +0000 (UTC)
From: Colin Ian King via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 01 Oct 2024 17:45:06 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-parisc@vger.kernel.org, bugs@lists.linux.dev, 
 James.Bottomley@HansenPartnership.com, deller@gmx.de
Message-ID: <20241001-b219339c3-a45bf793c6b7@bugzilla.kernel.org>
In-Reply-To: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
References: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
Subject: Re: calling getcpu with misaligned address causes kernel panic
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Colin Ian King writes via Kernel.org Bugzilla:

arm64 and riscv returns EFAULT too, whereas x86 segfault with my tests:

Linux debian-11-all-h3-cc-h5 6.10.6-arm64 #1 SMP Debian 6.10.6-1 (2024-08-19) aarch64 GNU/Linux:
mmap(NULL, 4096, PROT_READ, MAP_SHARED|MAP_ANONYMOUS, -1, 0) = 0xffffac174000
getcpu(0xffffac174000, 0xffffac174001, NULL) = -1 EFAULT (Bad address)


Linux starfive 5.15.0-starfive #1 SMP Fri Nov 11 06:58:52 EST 2022 riscv64 GNU/Linux:
mmap(NULL, 4096, PROT_READ, MAP_SHARED|MAP_ANONYMOUS, -1, 0) = 0x3fb20df000
getcpu(0x3fb20df000, 0x3fb20df001, NULL) = -1 EFAULT (Bad address)


Linux t480 6.1.0-25-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.106-3 (2024-08-26) x86_64 GNU/Linux:
mmap(NULL, 4096, PROT_READ, MAP_SHARED|MAP_ANONYMOUS, -1, 0) = 0x7ff780a24000
--- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_ACCERR, si_addr=0x7ff780a24000} ---
+++ killed by SIGSEGV +++

so x86-64 does behave differently with the access.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219339#c3
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


