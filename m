Return-Path: <linux-parisc+bounces-149-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED080739F
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Dec 2023 16:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1F8B1C209DA
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Dec 2023 15:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BD23EA9D;
	Wed,  6 Dec 2023 15:21:59 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F323EA88
	for <linux-parisc@vger.kernel.org>; Wed,  6 Dec 2023 15:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51A6C433C7;
	Wed,  6 Dec 2023 15:21:57 +0000 (UTC)
Date: Wed, 6 Dec 2023 16:21:54 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fix for v6.7-rc5
Message-ID: <ZXCRkjpftWJwIbpk@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull a single line patch for parisc which fixes the build
in tinyconfig configurations.

Thanks!
Helge

----------------------------------------------------------------

The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:

  Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.7-rc5

for you to fetch changes up to 487635756198cad563feb47539c6a37ea57f1dae:

  parisc: Fix asm operand number out of range build error in bug table (2023-11-27 11:01:38 +0100)

----------------------------------------------------------------
parisc architecture fix for kernel v6.7-rc5:

- Fix asm operand number out of range build error in bug table

----------------------------------------------------------------
Helge Deller (1):
      parisc: Fix asm operand number out of range build error in bug table

 arch/parisc/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

