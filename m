Return-Path: <linux-parisc+bounces-4626-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hDBxE+mHrGkpqgEAu9opvQ
	(envelope-from <linux-parisc+bounces-4626-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Sat, 07 Mar 2026 21:17:45 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 338DD22D7C4
	for <lists+linux-parisc@lfdr.de>; Sat, 07 Mar 2026 21:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95658300AD99
	for <lists+linux-parisc@lfdr.de>; Sat,  7 Mar 2026 20:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D87331218;
	Sat,  7 Mar 2026 20:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E48jajpO"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE2F27F749;
	Sat,  7 Mar 2026 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772914659; cv=none; b=hJ9dZnlmiIBrKBcrIRcgFT5DgPaz92RQ5YxPXUcFeshrbVt6MAvyn3gh+Lg5Ge1MJR6aOFQSa4DKBSqTf2nokswdJEceD41wdaWnA+USE0l2Np22+MD07y9V9Wm+X68ZIbQrzg64FuUOxzHKhUeDAWnooEerkvYFBdXKvrc8gyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772914659; c=relaxed/simple;
	bh=SxELuXWu1uewFZXpz+wH6+Uu3+KiyfZlxNUxJwfvaGw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gVtQdVN4W7natPiZ9l5GSy22ot3j72aDzX4RhIZlN3HzJ6Tn5mfKcg5lEHhyNejklAz+mzGsfOhg9WKFcpLyYV8+xsejctoZPuF7syhvKWd36wWZ1OkMDsjDJ+t0e9SeLoFnHNpulQtsbHuAghGNTwJdR9wUE5A/YRaO50OLroM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E48jajpO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E93DC19422;
	Sat,  7 Mar 2026 20:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772914658;
	bh=SxELuXWu1uewFZXpz+wH6+Uu3+KiyfZlxNUxJwfvaGw=;
	h=Date:From:To:Subject:From;
	b=E48jajpOHr+CyOonvWH0/A7Tv84WI9V1AvWFewxQm5wDLBsc3hlczDZTkYCWaZDqh
	 XqFK8lSEbTMsckLzSvLcHB3s4QA13pdQmq855kmQ/3JHGG1KYjRfzHHi+htTJ3kug1
	 sbn6GQf2vsq5FbZCkeX/5NJt5oAKM2qpcNBbCXgXCe+t21tMtfFDawdZs4L3PGrJSK
	 68SuSLEcNDIhT3IlrEStxPCRdMumnrLh03fMkG2dUt+Fnwy1JcEWMMbCK4Uyy16RkN
	 /Voxo77Dqh0JFrv/b99uMbRKGiO1i2VSer7HR2bCYGj61TerhOic532tyhNzkdO5g7
	 joFkbRcLUuWXw==
Date: Sat, 7 Mar 2026 21:17:34 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fixes for v7.0-rc3
Message-ID: <aayH3iaMo6nEiCKr@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 338DD22D7C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux-foundation.org,vger.kernel.org,hansenpartnership.com,bell.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4626-lists,linux-parisc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.926];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,linux-parisc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-parisc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Linus,

While testing Sasha Levin's "kallsyms: embed source file:line info in kernel
stack traces" patch series, which increases the typical kernel image size, I
found some issues with the parisc initial kernel mapping which may prevent the
kernel to boot.

The three small patches here fix this.

Please pull for kernel v7.0-rc3.

Thanks!
Helge
----------------------------------------------------------------

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.0-rc3

for you to fetch changes up to 8475d8fe21ec9c7eb2faca555fbc5b68cf0d2597:

  parisc: Fix initial page table creation for boot (2026-03-06 11:33:13 +0100)

----------------------------------------------------------------
parisc architecture fixes for kernel v7.0-rc3:

Three initial kernel mapping fixes

----------------------------------------------------------------
Helge Deller (3):
      parisc: Increase initial mapping to 64 MB with KALLSYMS
      parisc: Check kernel mapping earlier at bootup
      parisc: Fix initial page table creation for boot

 arch/parisc/include/asm/pgtable.h |  2 +-
 arch/parisc/kernel/head.S         |  7 ++++++-
 arch/parisc/kernel/setup.c        | 20 ++++++++++++--------
 3 files changed, 19 insertions(+), 10 deletions(-)

