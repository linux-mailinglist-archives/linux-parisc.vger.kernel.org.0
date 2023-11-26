Return-Path: <linux-parisc+bounces-69-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8E07F9461
	for <lists+linux-parisc@lfdr.de>; Sun, 26 Nov 2023 18:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED7E7B20C2D
	for <lists+linux-parisc@lfdr.de>; Sun, 26 Nov 2023 17:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B036DDA0;
	Sun, 26 Nov 2023 17:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8DD26E
	for <linux-parisc@vger.kernel.org>; Sun, 26 Nov 2023 17:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DD0C433C8;
	Sun, 26 Nov 2023 17:04:43 +0000 (UTC)
Date: Sun, 26 Nov 2023 18:04:41 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fixes for v6.7-rc3
Message-ID: <ZWN6qUkUEewrKNOe@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

this patchset fixes and enforces correct section alignments for the ex_table,
altinstructions, parisc_unwind, jump_table and bug_table which are created by
inline assembly.
Due to not being correctly aligned at link & load time they can trigger
unnecessarily the kernel unaligned exception handler at runtime.
While at it, I switched the bug table to use relative addresses which reduces
the size of the table by half on 64-bit.

We still had the ENOSYM and EREMOTERELEASE errno symbols as left-overs from
HP-UX, which now trigger build-issues with glibc. We can simply remove them.

Most of the patches are tagged for stable kernel series.

Please pull.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b2263:

  Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.7-rc3

for you to fetch changes up to 43266838515d30dc0c45d5c7e6e7edacee6cce92:

  parisc: Reduce size of the bug_table on 64-bit kernel by half (2023-11-25 09:43:18 +0100)

----------------------------------------------------------------
parisc architecture fixes for kernel v6.7-rc3:

- Drop HP-UX ENOSYM and EREMOTERELEASE return codes to avoid glibc
  build issues
- Fix section alignments for ex_table, altinstructions, parisc unwind
  table, jump_table and bug_table
- Reduce size of bug_table on 64-bit kernel by using relative
  pointers

----------------------------------------------------------------
Helge Deller (9):
      parisc: Mark ex_table entries 32-bit aligned in assembly.h
      parisc: Mark ex_table entries 32-bit aligned in uaccess.h
      parisc: Mark altinstructions read-only and 32-bit aligned
      parisc: Mark jump_table naturally aligned
      parisc: Mark lock_aligned variables 16-byte aligned on SMP
      parisc: Ensure 32-bit alignment on parisc unwind section
      parisc: Use natural CPU alignment for bug_table
      parisc: Drop the HP-UX ENOSYM and EREMOTERELEASE error codes
      parisc: Reduce size of the bug_table on 64-bit kernel by half

 arch/parisc/Kconfig                        |  7 ++++--
 arch/parisc/include/asm/alternative.h      |  9 ++++---
 arch/parisc/include/asm/assembly.h         |  1 +
 arch/parisc/include/asm/bug.h              | 38 +++++++++++++++++-------------
 arch/parisc/include/asm/jump_label.h       |  8 +++++--
 arch/parisc/include/asm/ldcw.h             |  2 +-
 arch/parisc/include/asm/uaccess.h          |  1 +
 arch/parisc/include/uapi/asm/errno.h       |  2 --
 arch/parisc/kernel/vmlinux.lds.S           |  1 +
 lib/errname.c                              |  6 -----
 tools/arch/parisc/include/uapi/asm/errno.h |  2 --
 11 files changed, 43 insertions(+), 34 deletions(-)

