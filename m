Return-Path: <linux-parisc+bounces-2941-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA16E9D9B50
	for <lists+linux-parisc@lfdr.de>; Tue, 26 Nov 2024 17:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83431162EDA
	for <lists+linux-parisc@lfdr.de>; Tue, 26 Nov 2024 16:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E921D63EF;
	Tue, 26 Nov 2024 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dr6rZWKO"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77FBBE46;
	Tue, 26 Nov 2024 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638148; cv=none; b=EX+GpmuiELirU+bCbeQUzlPFfzoCkgymut51O1MSlCtixo4aOTD9yyg8HbHVNHMYQRqn/htoZ3uplWoBybrtfek5v/guZPeJCgDmucMtP9+PEiEGoYT0pNErdenfrJYQYL960xRH7xPFhleTL8fpYBAQ5vE4uPUE0zhWWQDGcqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638148; c=relaxed/simple;
	bh=b6+NGOJfp+JbW1CpxNpRRj9OEKL5/4GqVU18Zg0UyCE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZG4bBSKg7WH+QEe2jW+sA4B/Z7J0TI9cY8myKTxmHWOKavYF+IS6MOJazp081OacLIOj9qf9Wxo7Ko+pggoiCPEemElVVcDQFMyFEygi5qlnI4Haw1uMhmpcB+Lrkvi3wR5H06cdebXXwpI4nA22R0X0MYIzYsIts/F7HNF9hdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dr6rZWKO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABCCC4CECF;
	Tue, 26 Nov 2024 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732638148;
	bh=b6+NGOJfp+JbW1CpxNpRRj9OEKL5/4GqVU18Zg0UyCE=;
	h=Date:From:To:Subject:From;
	b=dr6rZWKOkn9nSeRhj9twvsJMY5TnzYMmT9TY7LBw+iX5xbqHMdhFd5tdmTFH5KBxq
	 ke8mBslplRMIG2XZEuJd6FflTBwXVx1VvGKSx4uZHCQPljqcyXPJXoU9Zn/v6U97ci
	 pIkeQQwjx0gJ6cFTR1CBOI9YbRjq6MK2yDQ5vbVYvERYgIGpOSTi49S11cJrxNkjYf
	 vgYmCfjY3CR+It2bPcVuMXv2nS850duU0RqnUqlS740Odj+W7RyFMpkzw6YREdRALE
	 GSTB6F+xUoQVkMqtNbiJPpGUJrN3eFytC7mQyoMHAID49QcbzUajwXhZjcGVulgemP
	 puXIcD5WgNL/Q==
Date: Tue, 26 Nov 2024 17:22:24 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fix for v6.13-rc1
Message-ID: <Z0X1wDdw3sIo25WJ@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull one ftrace fix for the parisc architecture for 6.13-rc1.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.13-rc1

for you to fetch changes up to a5f05a138a8cac035bf9da9b6ed0e532bc7942c8:

  parisc/ftrace: Fix function graph tracing disablement (2024-11-16 22:55:56 +0100)

----------------------------------------------------------------
parisc architecture fixes for kernel v6.13-rc1:

- parisc/ftrace: Fix function graph tracing disablement

----------------------------------------------------------------
Josh Poimboeuf (1):
      parisc/ftrace: Fix function graph tracing disablement

 arch/parisc/kernel/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

