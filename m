Return-Path: <linux-parisc+bounces-3241-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E059BA1A805
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Jan 2025 17:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FBD77A0F61
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Jan 2025 16:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C8A212F86;
	Thu, 23 Jan 2025 16:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCsuRLuz"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEFC17BA5;
	Thu, 23 Jan 2025 16:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737650651; cv=none; b=foXS8XQGPXGTRizfPY/m5mI2xXybD1bSO+tqx+5qip8gI1EouKFa++vTCIdkdIn8Dpprc8JaalDpCaDwDSmZ77PHTOanI5m9ds6hwkf69KFTtUkh/L1VklddHdbaXX/ErMqOgxpFUVsfIMz8RsYDg02RzFjNrhdfPWxN5ganr2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737650651; c=relaxed/simple;
	bh=aclHII/wnqyrZyPeoi7ERHg+TKo4C/8n7avlN9z3++U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ElC31iKj+qqMX8KPdC13MwMLz9AntCMwzWrKZXqvfOKfiDzboujTMBmsyMFhMHfySponsSCVNtS0jZ2xUYEVweEtFopgHkE1H3jJ8rvJEaMxBBHvLd2J8w4OEw0M5e1LIRwZcogoOsV8j/o4Ps0l97sC+0F9Q++ZMcSrO/G/k+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCsuRLuz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB246C4CED3;
	Thu, 23 Jan 2025 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737650650;
	bh=aclHII/wnqyrZyPeoi7ERHg+TKo4C/8n7avlN9z3++U=;
	h=Date:From:To:Subject:From;
	b=QCsuRLuzEW7HvUERPZMOygeBa6iKskwVzsbztF4N3vTzk+N7la1uF11wTikyJwHDs
	 17xZmPBZmC16ZI0Tljp7l9QZG/YQttByiiBr50JGcaJZhaJ+rxUnwkdCEoI8Rg64Lh
	 A847p+/70r0Zn/QOBF0VJHtewguWgasZn6sUIHgObkquWuHHGepHctwB50GNsdRafE
	 mhSxjOkhvE7GXR0Gv4MzIZCEo6JFT9fo5M7zfFwSCh5bXK5CJCozGldFcFIF7mpwZL
	 4iuxtqRRGLbEHzCLEuHwP8zD42RE0Hts5g0PaeXqmsb+fOD+rlajlK1TT7SikwBOjr
	 /ixGhVaBlG2FQ==
Date: Thu, 23 Jan 2025 17:44:07 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fixes and updates for v6.14-rc1
Message-ID: <Z5Jx15b2n2JworTb@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull some fixes and updates for the parisc architecture for 6.14-rc1:

- Temporarily disable jump label support to avoid kernel crash with 32-bit kernel
- Add vdso linker script to 'targets' instead of extra-y
- Remove parisc versions of memcpy_toio and memset_io

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit adc218676eef25575469234709c2d87185ca223a:

  Linux 6.12 (2024-11-17 14:15:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.14-rc1

for you to fetch changes up to 3599bae489d86fbabe039f9a2ab5472ffb04f7f1:

  parisc: Temporarily disable jump label support (2025-01-20 21:05:32 +0100)

----------------------------------------------------------------
parisc architecture fixes and updates for kernel v6.14-rc1:

- Temporarily disable jump label support to avoid kernel crash with
  32-bit kernel
- Add vdso linker script to 'targets' instead of extra-y
- Remove parisc versions of memcpy_toio and memset_io

----------------------------------------------------------------
Helge Deller (1):
      parisc: Temporarily disable jump label support

Julian Vetter (1):
      parisc: Remove memcpy_toio and memset_io

Masahiro Yamada (1):
      parisc: add vdso linker script to 'targets' instead of extra-y

 arch/parisc/Kconfig                |  4 ++--
 arch/parisc/include/asm/io.h       |  4 ----
 arch/parisc/kernel/parisc_ksyms.c  |  2 --
 arch/parisc/kernel/vdso32/Makefile |  2 +-
 arch/parisc/kernel/vdso64/Makefile |  2 +-
 arch/parisc/lib/io.c               | 47 --------------------------------------
 6 files changed, 4 insertions(+), 57 deletions(-)

