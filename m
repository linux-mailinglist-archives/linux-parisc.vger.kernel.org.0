Return-Path: <linux-parisc+bounces-58-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A27F769E
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 15:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C799B20B84
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 14:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1F92D629;
	Fri, 24 Nov 2023 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHrEfYdl"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE712D62C
	for <linux-parisc@vger.kernel.org>; Fri, 24 Nov 2023 14:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AD4C433CC;
	Fri, 24 Nov 2023 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700836934;
	bh=Icy628uVpvuy8wN0/O3qpojcfA2WQhYZl8avGJkmjLE=;
	h=From:To:Cc:Subject:Date:From;
	b=FHrEfYdlUrRBkRD3UgLIrQYFEkTfjuJyi2Vdzlj53JgIYeYfRelaKESjxmG3W/sJz
	 CSc0vA2+bP9bKVA3dZod0nY8UfOMBxZk/rxHdkV7tva2Mmu9QszKtOpffad9OlnXnw
	 y1PLFQ3j/GBppnJhi5COqsRK8on+n66vWVWEL5Ol20c74vcwMYsOCkhso6oZS3eGig
	 HkxtmINdRUMAnR21xE7ZeXaApHBNN5AG3RSxCuaBUiJzeG+JvBWfvc6TPQqKGIO51U
	 IBC4hZJPvUzTYCHQnkM/0whSSFkJUg5IF68updOnHpTdmCHesyY9A8XELtoqSJ0qMg
	 5/6VcHDSVsUlA==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 0/8] parisc patch queue
Date: Fri, 24 Nov 2023 15:40:58 +0100
Message-ID: <20231124144158.158993-1-deller@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Some current patches for parisc, mostly section alignment fixes.

Helge Deller (8):
  parisc: Mark __ex_table entries 32-bit aligned in assembly.h
  parisc: Mark __ex_table entries 32-bit aligned in uaccess.h
  parisc: Specify alignments for .PARISC.unwind and .data..lock_aligned
  parisc: Mark altinstructions 32-bit aligned
  parisc: Mark __jump_table aligned to CPU long width
  parisc: Use correct alignment in __bug_table
  parisc: Drop the HP-UX ENOSYM and EREMOTERELEASE error codes
  parisc: Reduce size of __bug_table[] on 64-bit kernel by half

 arch/parisc/Kconfig                        |  7 ++--
 arch/parisc/include/asm/alternative.h      |  9 +++--
 arch/parisc/include/asm/assembly.h         |  1 +
 arch/parisc/include/asm/bug.h              | 38 +++++++++++++---------
 arch/parisc/include/asm/jump_label.h       |  8 +++--
 arch/parisc/include/asm/ldcw.h             |  2 +-
 arch/parisc/include/asm/uaccess.h          |  1 +
 arch/parisc/include/uapi/asm/errno.h       |  2 --
 arch/parisc/kernel/vmlinux.lds.S           |  4 +--
 lib/errname.c                              |  6 ----
 tools/arch/parisc/include/uapi/asm/errno.h |  2 --
 11 files changed, 44 insertions(+), 36 deletions(-)

-- 
2.42.0


