Return-Path: <linux-parisc+bounces-2729-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F799A0EBF
	for <lists+linux-parisc@lfdr.de>; Wed, 16 Oct 2024 17:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2772D1C214A7
	for <lists+linux-parisc@lfdr.de>; Wed, 16 Oct 2024 15:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91F320E029;
	Wed, 16 Oct 2024 15:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GrB8zzIf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9F20E013
	for <linux-parisc@vger.kernel.org>; Wed, 16 Oct 2024 15:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093453; cv=none; b=FYJmND2tBGMjDjyW/yz4hktgwotRz1fuJYk3c7l702gSqfnpM+N8wMe2y8wLLev97c5FAIzuE1G/fRibIbVPcFzfWcsV3dboBuf0zlFMdwGFwhc6qLMnGr8XN/Uz5oesRxgk59YvDuZinSJxz2Iy/LxtmJLMbXc0PcJutGO4hL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093453; c=relaxed/simple;
	bh=C6mVo0hjxJdqaFTApn2CuAkbtDJRTMixylyITUhsQ7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKNRCkIjRGHjHq0NHXaoVqNQjRhdtRgq2vHgVCgFpbrwQL4Kpg/Q6pXk1jGaNhcIyTPVAd2hxt7g29+KwKM0ruvOBaKtMVwYjTrz6AKgf5B7W6N2+5K4+KyuuB5LohW9XeIiq6T5iN8vPjgnqLofa7uhyPOnmFceiWjtrUDSfkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GrB8zzIf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A48C4CEC5;
	Wed, 16 Oct 2024 15:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729093453;
	bh=C6mVo0hjxJdqaFTApn2CuAkbtDJRTMixylyITUhsQ7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrB8zzIfTGAjLdOsbk4WqjoCOoVOtSGWTKEyjDpm9+xJl7AypG/6N1vOpPp95B+YS
	 PwO6vYNvUoUNcSyYTw3OD5lkUWbL89/zwMksAuTs/4cSzf3+HXtbf9dEzRi12lXOT+
	 BlKiXOcFn4vdRuLi80DscLGQhd2hIND3J4X7dsZI=
Date: Wed, 16 Oct 2024 11:44:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Subject: Re: Migrating parisc.wiki.kernel.org to RTD
Message-ID: <20241016-cocky-wasp-of-support-deffbe@lemur>
References: <20241011-fine-bold-quail-2d60be@lemur>
 <cb65fcea-3a45-4b96-a96c-e4480a12d6b4@gmx.de>
 <20241015-shrewd-mayfly-of-coffee-3802f0@lemur>
 <333db349-e721-4093-9918-7a6b7e62dfb3@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <333db349-e721-4093-9918-7a6b7e62dfb3@gmx.de>

On Wed, Oct 16, 2024 at 05:00:51PM +0200, Helge Deller wrote:
> Ok so far.
> https://readthedocs.org/projects/parisc/
> https://parisc.readthedocs.io/en/latest/

Nice, I'm happy it's working.

> source from here:
> https://github.com/hdeller/parisc-website.git
> 
> > and set the redirects from the old wiki.
> 
> Before setting up redirects, can you help me with this error:
> 
> deller@carbonx1:/home/cvs/LINUX/parisc-website$ make html
> Running Sphinx v8.1.3
> loading translations [en]... done
> Extension error:
> Could not import extension sphinxcontrib.applehelp (exception: cannot import name 'SkipProgressMessage' from 'sphinx.util' (/home/deller/.local/lib/python3.12/site-packages/sphinx/util/__init__.py))
> make: *** [Makefile:20: html] Error 2

I suggest that instead of using the system-wide sphinx package, that you
install a venv to build the site locally. E.g., inside the parisc-website
repository:

    python3 -mvenv .venv
    source .venv/bin/activate
    pip install --upgrade pip
    pip install Sphinx furo
    make html

You can add .venv to .gitignore so it doesn't interfere with the rest of the
repo. To deactivate the venv, just do "deactivate".

Let me know if that helps.

-K

