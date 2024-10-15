Return-Path: <linux-parisc+bounces-2714-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A7999F2C4
	for <lists+linux-parisc@lfdr.de>; Tue, 15 Oct 2024 18:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF5FE1F240B5
	for <lists+linux-parisc@lfdr.de>; Tue, 15 Oct 2024 16:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D3C1B3922;
	Tue, 15 Oct 2024 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I+9rbk9+"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFCF1D514F
	for <linux-parisc@vger.kernel.org>; Tue, 15 Oct 2024 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729009958; cv=none; b=YU5HRy4LxmpwGdQZEXpDb6oJkmJWqFMSCk/QqLrNbf1G+cUGUsFF4RcF+LcuNCDwPmCRJjuQO9dGrUsYv1dxjcR62QJOpnJTEo9Pl3dDowqMhxmG9+QOfTSOGZOarOr/tjj2yQ57IvBoobHUiHilWacNeXYZ9TqkLDUipvUwNKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729009958; c=relaxed/simple;
	bh=EXFtqNuhViSp41UsEwtz9A8/W219mS3ZxBuOHRiY98A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENpU+aTxdzPISAWEBvyjYQhXtV1QOAfQyvsRp+czarT37ybMi5APrO5pad470qbwWBsDOuRpit977yD02XDJu8QtyfsE5xOhvNeBWgSqJ7Sf9CDsCvDs0ZitQNKp5RTmyctpoBtkJYEjVKaZd3rXEUcrAkwNOD5MqvN1TF1nk8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I+9rbk9+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44BDC4CEC6;
	Tue, 15 Oct 2024 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729009957;
	bh=EXFtqNuhViSp41UsEwtz9A8/W219mS3ZxBuOHRiY98A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+9rbk9+LfYDBECNTh+dzIZXCLtPP0rygkltMucffhy2VKwaiSiij3g9p5/SREmK9
	 SCtkg1EjA6TO/q26b0mNPGIOFBKzlwulKzmFU+BdilnHR0svdNFJykJy8FQXac+j3R
	 uGrTH3dl/L+8SGZzYceRUwFZpBzek/509tJXcs7Q=
Date: Tue, 15 Oct 2024 12:32:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Subject: Re: Migrating parisc.wiki.kernel.org to RTD
Message-ID: <20241015-shrewd-mayfly-of-coffee-3802f0@lemur>
References: <20241011-fine-bold-quail-2d60be@lemur>
 <cb65fcea-3a45-4b96-a96c-e4480a12d6b4@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb65fcea-3a45-4b96-a96c-e4480a12d6b4@gmx.de>

On Mon, Oct 14, 2024 at 10:57:02PM +0200, Helge Deller wrote:
> It's really sad.

Unfortunately, I believe that the time of wikis has passed. They have to be
seriously locked down to avoid having to constantly fight spam, and this
largely defeats the purpose of having a wiki at all, as opposed to any other
publishing platform. In addition, in the past year we've seen more and more
aggressive AI training bots descend on public resources and try to grab as
much content as quickly as possible, which is both expensive in bandwidth and
tends to result in poor performance for everyone. I am strongly convinced that
going back to statically rendered sites is the way to go to avoid a lot of
modern-day problems.

> I was quite happy with mediawiki and the output was quite nice, at
> least nicer than what RTD currently generates.

Note, that the RTD output can be tweaked quite a bit -- I'm just using one of
the stock themes with no customizations. I also noticed that the light theme
looks much nicer on the front page than the dark theme due to all the logos.

> I have not used RTD yet, so maybe someone here on the mailing list
> has some knowledge and want to help?

I'm happy to guide you along. I've added a readthedocs.yml and
requirements.txt files to the repo:

https://git.kernel.org/pub/scm/docs/docsko/parisc.git

You can clone it and then push to your github or gitlab repo. After that,
generating a readthedocs build is very easy:

https://docs.readthedocs.io/en/stable/tutorial/index.html

If you follow that, you should be able to get a build of the repository in
20-30 minutes. After that, you can even edit the documents directly on github
and have them automatically rendered.

Once you have it working on the readthedocs site, I can help you configure a
docs.kernel.org domain and set the redirects from the old wiki.

Let me know if that helps.

-K

