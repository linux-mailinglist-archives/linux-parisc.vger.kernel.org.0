Return-Path: <linux-parisc+bounces-1884-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D4942CC3
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2024 13:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B29F81F214A9
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2024 11:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999031AD9C3;
	Wed, 31 Jul 2024 11:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eYkOn8h1"
X-Original-To: linux-parisc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75241AED47
	for <linux-parisc@vger.kernel.org>; Wed, 31 Jul 2024 11:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722423986; cv=none; b=fAESLKH1cy54JTp5JJMIk0uIbcyfIo3NjML1D/xuCjQ1aAyf9w8c8GImCr3zO0ktMzO7TJiH4LcSaQAOLYC9CheEXZ3dVcAF5G3PY5xA8wrPcVQGMtDemQVTGsSXryINhSQluizs+gb8SUDGc4D4MUo2ySKuqV/6oXQQ/7Gj1aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722423986; c=relaxed/simple;
	bh=BOftzJBxXph8wdZVbIeyBWRCXnn59nLVw2WeZ8HBKCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4f4iOYeDrYPcWqPpOAb26o7YUgLaF744iI1jnZkz/BqoBJZv3GP0GhFAbU6UWeW4Du5ikZayI6W1qDKfHAhbGp1znUIVpquz8BtcLBn0pG34FJ/VBk7BPcLg+st+pkMRqBpIw/tY2FB54mJi6B5o0YJtgtsY6+Kz+K+HLb62sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eYkOn8h1; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MH0EcLHW2IroO+I9AnzBysuaGZCDwF38n2qMlFLBB6g=; b=eYkOn8h1WFY+yWWaxGbBLRIKxp
	yklVWH1kwdmtXnH/c43ShzjUqO83jBbUFbxqMphLB1Kk1eLNq56Kb5O1wBRnqGNHHD871w9jHgA0M
	6IifV2+C8KXCooXB0TAIyq+O5WPUaFcUomVQ6Z9HzwR9BnO1Z+VrpfVUsyhFihdRQuLOh2Spq4Syf
	8sxkfw1M/Qk6FJnUst7pThbjBF9Zw0620BDdFI1JLcuhBy3YYol1G6c1Bex7rF/cbAJKYaRHLo/G4
	RgPOtRPpLC1ymcYuV9V8wAoOR6unYcxAWhVK0sbydDtHE0A5rx0t35tzrSDGrgxy4sSL4mbNn77Ri
	HIpE/AKg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ79u-00000005CiZ-2cGn;
	Wed, 31 Jul 2024 11:06:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D54F2300820; Wed, 31 Jul 2024 13:06:17 +0200 (CEST)
Date: Wed, 31 Jul 2024 13:06:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: matoro <matoro_mailinglist_kernel@matoro.tk>
Cc: John David Anglin <dave.anglin@bell.net>,
	Linux Parisc <linux-parisc@vger.kernel.org>, Deller <deller@gmx.de>,
	John David Anglin <dave@parisc-linux.org>
Subject: Re: Crash on boot with CONFIG_JUMP_LABEL in 6.10
Message-ID: <20240731110617.GZ33588@noisy.programming.kicks-ass.net>
References: <096cad5aada514255cd7b0b9dbafc768@matoro.tk>
 <bebe64f6-b1e1-4134-901c-f911c4a6d2e6@bell.net>
 <11e13a9d-3942-43a5-b265-c75b10519a19@bell.net>
 <cb2c656129d3a4100af56c74e2ae3060@matoro.tk>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb2c656129d3a4100af56c74e2ae3060@matoro.tk>

On Tue, Jul 30, 2024 at 08:36:13PM -0400, matoro wrote:
> On 2024-07-30 09:50, John David Anglin wrote:
> > On 2024-07-30 9:41 a.m., John David Anglin wrote:
> > > On 2024-07-29 7:11 p.m., matoro wrote:
> > > > Hi all, just bumped to the newest mainline starting with 6.10.2
> > > > and immediately ran into a crash on boot. Fully reproducible,
> > > > reverting back to last known good (6.9.8) resolves the issue. 
> > > > Any clue what's going on here?
> > > > I can provide full boot logs, start bisecting, etc if needed...
> > > 6.10.2 built and booted okay on my c8000 with the attached config.
> > > You could start
> > > with it and incrementally add features to try to identify the one
> > > that causes boot failure.
> > Oh, I have an experimental clocksource patch installed.  You will need
> > to regenerate config
> > with "make oldconfig" to use the current timer code.  Probably, this
> > would happen automatically.
> > > 
> > > Your config would be needed to duplicate.    Full boot log would also help.
> > 
> > Dave
> 
> Hi Dave, bisecting quickly revealed the cause here.

https://lkml.kernel.org/r/20240731105557.GY33588@noisy.programming.kicks-ass.net

