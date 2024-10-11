Return-Path: <linux-parisc+bounces-2672-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF77E99A660
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2024 16:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A20B1C20F62
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2024 14:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6490FC12;
	Fri, 11 Oct 2024 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aRZ/XCZc"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EB31373
	for <linux-parisc@vger.kernel.org>; Fri, 11 Oct 2024 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728657091; cv=none; b=USTzI/ydCzr0LDVC1ZZdjtegOVJJG9n7QlD8OBGzccR713xY6eDKQUPAEFmIVSQCUhjwhKAEr9RW0j0s1zSZqWQv0MdLxLc1+n3mPGvdn8lcu2W/u2liego9vkOq5YoGaSRpt8Gzry09Z+RgnqE0gdpJjztmhQ42ymjoli3DyyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728657091; c=relaxed/simple;
	bh=sCp7Y4v4oitSLh28ujzh/mMUtjoN/5t4sO7P92KUcVs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PXfvnevQbc0Vi0cHRfXjgdkj3UQ220YLBzXzqvg4+SnhefC3Awh78cwMWp5lPTg78BlBWPUCvTckRe1ZGoSdfZLg4NXn/hBbUb35OO8T+5W+p+2W1NqZgxp7BhiyIBAmASSvmt0OBl6qZ6hZmsaSac7VBBCDVp7xl+WiAAlmo1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aRZ/XCZc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C03BC4CEC3;
	Fri, 11 Oct 2024 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728657091;
	bh=sCp7Y4v4oitSLh28ujzh/mMUtjoN/5t4sO7P92KUcVs=;
	h=Date:From:To:Subject:From;
	b=aRZ/XCZcHqEZNoZzPwPl18Zy3LK0wU4A8EcN6o2OHfKaJVHFzYkgaNFyLft4/PJSH
	 MBf2OMpiGEF3lT63ik81eJlhRbcBfc6HVKtcGpuT1WKNuaNlSjsm2S2iWKFkpnZsJG
	 ev2pFgB3LeRB6ukFDBMgVVxR4HvCjENHsxmFSP7c=
Date: Fri, 11 Oct 2024 10:31:28 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-parisc@vger.kernel.org
Subject: Migrating parisc.wiki.kernel.org to RTD
Message-ID: <20241011-fine-bold-quail-2d60be@lemur>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Greetings:

We are trying to sunset the last few wikis that we are hosting and convert
them all to git-backed sphinx documentation. The PARISC wiki is one of the
last MediaWikis that we have, and I have prepared a migration path for you
that I hope you will find suitable.

# Preliminary build

I have the preliminary conversion build available here:

https://www.kernel.org/doc/projects/parisc/index.html

The underlying repository for it can be found here:

https://git.kernel.org/pub/scm/docs/docsko/parisc.git/

The git repository includes the entire mediawiki history (excluding media),
plus the new source tree with the conversion results.

# Multiple RTD hosting options

If you would like to switch to the new sphinx-backed site, there are multiple
ways to host it:

1. You can clone that git repository and host it on github. This would allow
   for a quick readthedocs.org integration and allow you to edit the files
   directly via the github interface. This is a very wiki-like workflow and
   would allow you to grant access to the repository to anyone with a github
   account, plus accept pull requests with modifications. Once you have
   readthedocs.org integration working, we can configure it to be under the
   docs.kernel.org domain, which will allow you to remove the ads from the
   site.

2. Continue to host it in the current location and edit it with your
   kernel.org account credentials, plus accept edits via patches sent to this
   mailing list.

# Staying with mediawiki

I believe switching to sphinx-style documentation is the right way forward,
because wikis are increasingly problematic to host due to spam and hostile
scraper bots. By switching to RTD you also gain a lot more independence in
your hosting options, as the statically generated site can be put anywhere
capable of serving files.

However, if you're absolutely sure you want to stay with MediaWiki, we can
arrange hosting with OSUOSL, but it would need to be under a non-kernel-org
domain.

# What next?

Please let me know which way you would like to proceed in the next few days,
as I am hoping to sunset our last wikis by the end of October.

Best regards,
-- 
Konstantin Ryabitsev
kernel.org

