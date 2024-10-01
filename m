Return-Path: <linux-parisc+bounces-2423-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF5998C23D
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Oct 2024 18:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA59BB219BC
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Oct 2024 16:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C351CBEA4;
	Tue,  1 Oct 2024 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qzypTkbM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481D11CBE88;
	Tue,  1 Oct 2024 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727798707; cv=none; b=Xv9DV8EWk6V6L2DDXaTkszSmzQfv2EcoGsxna5jfBpiFzqqbDh8/WlAZ8TLuneZi/1H9OMhl04v1GEKZWYNZaf//zrkKXezH2d960kql9Akr4soPV92zU+UcBFvtH9hAfF5mIpTA1v1NqdwB63x2wUXZGuvP5KL8N4mfcY8psEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727798707; c=relaxed/simple;
	bh=q8AWGhR5TRgJQrxCSCenmHtqjWoiXajsw3lB9UjWwzs=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=Rp6aZRvFBu/ftSTx5B4U7yny5g5hh4GpAeLfAKxOTfx4yIVHtnoaiCnHHNE48S37aGMooxUEjBogxEMelMfF9VETVmW0CEzPrjYkq2A4waajAStemZKdrC67xDOmtpGxtH+ltuRVx7jhaJUrammm/KUlkBcnADxtXLpeXRjEMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qzypTkbM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3897C4CEC6;
	Tue,  1 Oct 2024 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727798706;
	bh=q8AWGhR5TRgJQrxCSCenmHtqjWoiXajsw3lB9UjWwzs=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=qzypTkbMVbdRx1J0ekJe7AMX9QKy598/BJh6y2wToANyzroatKxtCLoP4YYHJmxhe
	 6aMRtr+3l1VUxgBE/8lbkbakAnQciMSz/fTWOEaYYjTP9jSEEQiURDv0pEnszRK80J
	 KcJC2o+oaZ07c2ZW6nBLA0eelgCoZkm85NA0c1WUAZLD4VtYz6WgaqwtZIS6PwK5OI
	 /pFLZrkj6sX06Vngk8ZW6ycJDwsCj/0Abip+y6JYM9NJHkT5JgQt+PUYAfrEw9uGSw
	 v5KkkJN4DVXCeFbWtDRyHzrTOJ3udfkA9UHZTSegOpzX269PR4I4iixLGeJ+XiGJG7
	 Wy4o8Nob3oaeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 14612380DBF7;
	Tue,  1 Oct 2024 16:05:11 +0000 (UTC)
From: Helge Deller via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 01 Oct 2024 16:05:07 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: deller@gmx.de, linux-parisc@vger.kernel.org, 
 James.Bottomley@HansenPartnership.com, bugs@lists.linux.dev
Message-ID: <20241001-b219339c2-998d00851129@bugzilla.kernel.org>
In-Reply-To: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
References: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
Subject: Re: calling getcpu with misaligned address causes kernel panic
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Helge Deller writes via Kernel.org Bugzilla:

This *is* a bug in qemu.
When running on a physical box, strace shows that the kernel behaves correctly:

mmap2(NULL, 4096, PROT_READ, MAP_SHARED|MAP_ANONYMOUS, -1, 0) = 0xf9000000
getcpu(0xf9000000, 0xf9000001, NULL)    = -1 EFAULT (Bad address)
exit_group(-1)                          = ?
+++ exited with 255 +++

On an AMD64 box I get a segfault (which seems strange?):

mmap(NULL, 4096, PROT_READ, MAP_SHARED|MAP_ANONYMOUS, -1, 0) = 0x7f2b62c73000
--- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_ACCERR, si_addr=0x7f2b62c73000} ---
+++ killed by SIGSEGV +++
Segmentation fault

qemu-user works OK.

will try qemu-system soon.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219339#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


