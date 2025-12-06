Return-Path: <linux-parisc+bounces-4339-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CBDCAADE4
	for <lists+linux-parisc@lfdr.de>; Sat, 06 Dec 2025 22:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5514300A372
	for <lists+linux-parisc@lfdr.de>; Sat,  6 Dec 2025 21:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238E3285404;
	Sat,  6 Dec 2025 21:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bpw86d/W"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45FB27E040;
	Sat,  6 Dec 2025 21:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765055841; cv=none; b=bgRKsdkWT3k7VRPK1UWJzYT8n1TEZr2iKuHFfN/thJVwJBxOArbkNy54uVm0Uv4/9ztl7r50yPsWAE5sMxVBt3JvB0VXpPR9EiUUhrqYmbFtLrbfQM2JfrGAWtzbpJa3mAsthzd8c2egLDLPOft0qbcZoevnxgOTG6Mre70sghw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765055841; c=relaxed/simple;
	bh=DX50nouUIp4RVK+Wxa1Rxi74xqKgxSTwYGNQNdsdWso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hnF3BzRGwczS7FkMdwynxMQYdI78HZDCVI3D7TWomq8SL+YIQICx11zQ1Ofw3OS/5XNs30oWJGqBytCXQlsn1AstS9ZjTAThNaIl4/57OLfQscI4f702yO06zDGO4VKrpwJxUEnqY7MK6uBPq9TF+Dh4r1L0hFuh0EMspPMtEPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bpw86d/W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA59C4CEF5;
	Sat,  6 Dec 2025 21:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765055840;
	bh=DX50nouUIp4RVK+Wxa1Rxi74xqKgxSTwYGNQNdsdWso=;
	h=Date:From:To:Cc:Subject:From;
	b=Bpw86d/WORCEgSe6ZSDz5csIzE3IWFGvegYWiT5HKhlX0Cia5jlrI45jrmrs1wbeH
	 bHQWcdQN3PdKONno6RcAT1IZC+0tuBnbDNsdlhQqBd5ztjQNcMqLoc95GWi7HWgjpu
	 RGS5C4zZjnkbo5ZYm+M1OeFXj6HetHpBvU5ByRUxP0C1K8Z3YRTDZf+15kP0wxEDWI
	 0Xe1skNxu5Ou/F4eCz3kU+4NFeZ1KDlux5sW6bWwVV/kqpH3K4bGgbKhnIrNSkt1IS
	 ZzuRtdqyOC9kBmv5qlQhXq9VcmoOI9lvkXufeKwjymr2t6MUU62JumrKl4lLVYE9FX
	 Buqtbb3doKB8g==
Date: Sat, 6 Dec 2025 22:17:16 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Sven Schnelle <svens@stackframe.org>
Subject: [GIT PULL] parisc architecture fixes and updates for v6.19-rc1
Message-ID: <aTSdXEYJFuhxMltf@p100>
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
Note that although we currently have a 64-bit (static) kernel to allow more
than 4 GB physical RAM, there is no support for 64-bit userspace for
parisc-linux yet, but Dave and Sven are making slowly progress to port and fix
glibc and gcc.

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

