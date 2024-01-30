Return-Path: <linux-parisc+bounces-452-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2A784282A
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jan 2024 16:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3789E281D69
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jan 2024 15:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C97823CF;
	Tue, 30 Jan 2024 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vb0XBiRi"
X-Original-To: linux-parisc@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAB182D76
	for <linux-parisc@vger.kernel.org>; Tue, 30 Jan 2024 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628976; cv=none; b=kYK+gISSrvHFqLIDK+gy6MnBAd3IyloB/awDHXAKU+lJD9w3xuTc0bH/BwzI8H1PZJ/uyu5VROQyt4PVdqX0XrZimJsT12MzuiTerB2QeeBlcaT6LO2NWbLWNU59RpUfZvdmWhLLT6NSRna4SwTcCSyupZ02O+CAmaPxUDezfJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628976; c=relaxed/simple;
	bh=CJNrEa6rRHCU98wfeV1yw4EOq8STop8OSbjdu8GBnj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxY+ueTECx4KXO1dN+ScolbbxSxMu+TF7oQJWg7SrVu4qJWYoNap+Bsl9jLpDrGzW6GJQKSbBd6GyG3m6DNOBTunhqm2jjPkx2aL26N3mK8ernl/7ouorgMePZXaFylfKIHTDxNON58z0Z+p+vtCnJbV0nttgOaM+bSHFef6kuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vb0XBiRi; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 30 Jan 2024 10:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1706628972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=94sfxf9zhRULG1ClZ8x2hL0jp/Uo63jk6kyodpGTzo8=;
	b=Vb0XBiRilChg0sHHq5iqbttUOKpyZkhjMEZKg3mjc1q3VDnxZRmdzItRPTiGDm4k4KuPGj
	XOQtAJ4WHUzqGQADrGP+Eq/hpCj6DQx+YurQN7s38V8dY3X6zwRYzzdv01zxrC1Lloyt+2
	nc9Qg/Pqr2zVYF/uYhgrjlEHWT0G6gc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Helge Deller <deller@gmx.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Parisc List <linux-parisc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the bcachefs tree
Message-ID: <iextwtpae2nydt4ixa3l5u6uh6sjremg5nynoboh53mezusqnj@476wzpde2iho>
References: <20240130100723.323c19fc@canb.auug.org.au>
 <214411d1-f9e2-4611-93fe-223a020072da@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <214411d1-f9e2-4611-93fe-223a020072da@gmx.de>
X-Migadu-Flow: FLOW_OUT

On Tue, Jan 30, 2024 at 08:03:08AM +0100, Helge Deller wrote:
> On 1/30/24 00:07, Stephen Rothwell wrote:
> > The following commit is also in the parisc-hd tree as a different commit
> > (but the same patch):
> > 
> >    eba38cc7578b ("bcachefs: Fix build on parisc by avoiding __multi3()")
> > 
> > This is commit
> > 
> >    94a54e4eb439 ("bcachefs: Fix build for parisc by avoiding __multi3()")
> > 
> > in the parisc-hd tree.
> 
> Kent, I've dropped the patch from the parisc git tree.
> Thanks for applying it to your tree!
> Helge

Of course! Cheers

