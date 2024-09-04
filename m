Return-Path: <linux-parisc+bounces-2235-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A893396B62C
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Sep 2024 11:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20970B25A87
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Sep 2024 09:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14081CCEE4;
	Wed,  4 Sep 2024 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b368OBVG"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9C1CCEDA;
	Wed,  4 Sep 2024 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725441051; cv=none; b=b29yx2zZpesKI40R+jScK+6GgURH6GNZYTwSjT+5uP3YJZLI7vUDq83ByQDcdoxelwx2bmGkVZgEuntT4Zs/d0CbQTWpgy8K+5w43VgowGoSR3USoy2V7lDJUVEruT2pOKA4qVGyI78nZKMYTOexGUIKChy/bhW1uwx/LOKzMis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725441051; c=relaxed/simple;
	bh=qQdj5io8WhOjytcaHec8EnLMlt0GCgYP5levN+qpTg0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bc8VEMrOfRP/ZV06aYAX2xOhiUllDf8i0X6cKlKek3oEQ88+oSuPaZ3rk3x4czQdGuhPJR4Z4mNtmvgkzlJBa0yKn1D4zxHSoxQDhfLHMkAimd4TK9Vgyh+Y7U1ijyW3PT25vzVIB5osFcGhiksxhnxb1F0nIznRKMlK4ialVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b368OBVG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C451FC4CEC8;
	Wed,  4 Sep 2024 09:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725441051;
	bh=qQdj5io8WhOjytcaHec8EnLMlt0GCgYP5levN+qpTg0=;
	h=Date:From:To:Subject:From;
	b=b368OBVGzqEQeguKTcPGgw1yZ9ii8zoVPqHgk8VqyL8uk/7yGDoJ7fkAS2kLONUpa
	 xMLQfie7u0I57ke/3JCU+bl12IDKxBgBM5PrTEs6Hju9ygJrLxJj5qU5x7e7rEo5hA
	 xwM5BlzC34ClITpZBIJJw1HUlNEydI4XDnWFexWSWRJv1jIr320DXWKDh4QcZxWW3N
	 yJdzKxvjWlipfpM7EZhE04/a2DjlllQI4cu5SmJYC4WjMMPu6+cEA1sU8bJAE9OvfF
	 3XDsLtLB23LvbXIYbbAlI3OZNcENTE6AJO5p0Ua5uzp6+EJ2HJ4tkje8zcg4V8PyIG
	 LG8uzy/IE+H9g==
Date: Wed, 4 Sep 2024 11:10:47 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fix for v6.11-rc7
Message-ID: <ZtgkFznSCnkAREgA@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull one fix for the parisc architecture to fix a boot issue.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 5be63fc19fcaa4c236b307420483578a56986a37:

  Linux 6.11-rc5 (2024-08-25 19:07:11 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.11-rc7

for you to fetch changes up to 213aa670153ed675a007c1f35c5db544b0fefc94:

  parisc: Delay write-protection until mark_rodata_ro() call (2024-09-03 12:59:21 +0200)

----------------------------------------------------------------
parisc architecture fix for kernel v6.11-rc7:

- Fix boot issue where boot memory is marked read-only too early

----------------------------------------------------------------
Helge Deller (1):
      parisc: Delay write-protection until mark_rodata_ro() call

 arch/parisc/mm/init.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

