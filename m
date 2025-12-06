Return-Path: <linux-parisc+bounces-4338-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51FCAAD0F
	for <lists+linux-parisc@lfdr.de>; Sat, 06 Dec 2025 20:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B06E93027E20
	for <lists+linux-parisc@lfdr.de>; Sat,  6 Dec 2025 19:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A7B2C21C0;
	Sat,  6 Dec 2025 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXYnvvgu"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F36D2C11F8
	for <linux-parisc@vger.kernel.org>; Sat,  6 Dec 2025 19:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765050532; cv=none; b=RKzp2uJbNsA5HGQBBHOhvILXPbfTWUTskrzCPwH0WrK8UAgXItr8ONcXatsR+QxQx9CyqHwwg2mtH3+BKWtsKW8KiltZj3H9nomqsUniJQeQU4VK6ILX+MrCwmQs4Trn5dn1R4ZxU84KTS9VvA+6s9eWO5kLAJQ/lbS/KKi59D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765050532; c=relaxed/simple;
	bh=A5/ynKXh58UbrJBl2v/dntpeZRiOGasXH2OsqCV0TBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QOSkiTS3sRMB8POOcqhg1RHfDOsuSoDkYxdbSixp/ehSWK6ZiN8jmZjJL0dHwmZTHPghqX48grgtdlIAWVUND5GjjCEFhqfn1CHLsmtw4CO87CFjCBIh9v76rU/bcEwvpHu9dKdhYzsmGeVGeC1IQL0Cs7iGgcjWD75gb7Ri8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXYnvvgu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41419C4CEF5;
	Sat,  6 Dec 2025 19:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765050531;
	bh=A5/ynKXh58UbrJBl2v/dntpeZRiOGasXH2OsqCV0TBw=;
	h=Date:From:To:Cc:Subject:From;
	b=PXYnvvguGi/TGdHS+1VaXOu8gz43X8Nn0baId382Jp09GyucneYBwyfnP10YFUk2f
	 h2B0+38hyCba6UmVufMFQYEwlpMQynJ/KXLlnh7sl9CAZfwasdnXh5+9tSs7bK8hle
	 OmY1H/CCH3arVpM3YsNi8OFfQwWPh4/hPuQdSUmKn4qTdteAF8fhaMz2NageMG7rP9
	 PGI2HLLXhheJEFsJAMZ7dtZwrjB0FQagyky2dmMbHlj4TDm+lj3xGGJQgePcqFw7um
	 idvBdX7MVXwX76eXFp3XVFRTaMiyBbjPmGMIZ7hl9lKt4a0xFh3QkGDbX88QRUhbEN
	 jr+7J9jejmfxA==
Date: Sat, 6 Dec 2025 20:48:47 +0100
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Sven Schnelle <svens@stackframe.org>
Subject: [GIT PULL] parisc architecture fixes and updates for v6.19-rc1
Message-ID: <aTSInwCDyU6_L9p9@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull a few fixes and updates for the parisc architecture for 6.19-rc1.

A fix which allows booting on the very old 710 workstations, and two fixes in
the syscall entry/exit path which allow to execute 64-bit userspace binaries.
Note that although we currently support a 64-bit (static) kernel to support
more than 4 GB RAM, there is no support for 64-bit userspace for parisc-linux
yet, but Dave and Sven are making slowly progress to port and fix glibc and
gcc.

Thanks!
Helge

----------------------------------------------------------------

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.19-rc1

for you to fetch changes up to dca7da244349eef4d78527cafc0bf80816b261f5:

  parisc: Do not reprogram affinitiy on ASP chip (2025-11-25 15:23:02 +0100)

----------------------------------------------------------------
parisc architecture fixes and updates for kernel v6.19-rc1:

- Fix boot on 710 workstation by not reprogramming ASP chip
- Fix 64bit userspace syscalls (64-bit userspace is still being
  developed)
- minor code cleanups in asm/bug.h and perf_regs.c

----------------------------------------------------------------
Finn Thain (1):
      parisc: Drop linux/kernel.h include from asm/bug.h header

Helge Deller (2):
      parisc: Drop padding fields and layers entries from inventory log
      parisc: Do not reprogram affinitiy on ASP chip

Jiapeng Chong (1):
      parisc: remove unneeded semicolon in perf_regs.c

Sven Schnelle (2):
      parisc: entry: set W bit for !compat tasks in syscall_restore_rfi()
      parisc: entry.S: fix space adjustment on interruption for 64-bit userspace

 arch/parisc/include/asm/bug.h    |  2 --
 arch/parisc/kernel/asm-offsets.c |  2 ++
 arch/parisc/kernel/drivers.c     |  8 +-------
 arch/parisc/kernel/entry.S       | 16 ++++++++++++----
 arch/parisc/kernel/perf_regs.c   |  2 +-
 drivers/parisc/gsc.c             |  4 +++-
 6 files changed, 19 insertions(+), 15 deletions(-)

