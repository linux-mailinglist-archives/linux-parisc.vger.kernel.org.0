Return-Path: <linux-parisc+bounces-2189-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C089672E0
	for <lists+linux-parisc@lfdr.de>; Sat, 31 Aug 2024 19:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D89791C2135A
	for <lists+linux-parisc@lfdr.de>; Sat, 31 Aug 2024 17:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101B217BA6;
	Sat, 31 Aug 2024 17:44:59 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009291D12E2
	for <linux-parisc@vger.kernel.org>; Sat, 31 Aug 2024 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.9.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725126299; cv=none; b=dpgwztEm30AoxSFYcuYj857oaIh5FGT9DVZUKjnpC/Q1M9ZkAtMv+mnrSf6eQ79lmXeYIvlgmk132WhmwtKChvluV08b8I4hWfm6AlzaBL54c6JpaKs7Pr+Cym/bZO23jwjN26fgBH63Yw8KUopc5/ytLL5H1F8ANFVjRtVXSC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725126299; c=relaxed/simple;
	bh=lLB1jny68yHkCbjGCkuQB+IcAX1fj8XY3NAvLdBKX4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gq43q9HrkiywwPLFHuls7L8kODPobQUagNe9sGPtxqdS6VrIAxbfGKV856S+ktnGnUb28SfiBw20zJamcdHwNB+yCdXvUbEm2PFJFLRg2kix7+f1OAd6Xa+JIKbbKY3tVg41zRRkaBfwAXgL1H65LXHIvBG7LlxNzl+HwJZZH8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=manchmal.in-ulm.de; spf=pass smtp.mailfrom=manchmal.in-ulm.de; arc=none smtp.client-ip=217.10.9.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=manchmal.in-ulm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manchmal.in-ulm.de
Date: Sat, 31 Aug 2024 19:44:49 +0200
From: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To: Helge Deller <deller@kernel.org>
Cc: Linux Parisc <linux-parisc@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	matoro <matoro_mailinglist_kernel@matoro.tk>,
	Sam James <sam@gentoo.org>
Subject: Re: Crash on booth with 6.10
Message-ID: <1725126092@msgid.manchmal.in-ulm.de>
References: <096cad5aada514255cd7b0b9dbafc768@matoro.tk>
 <1725041917@msgid.manchmal.in-ulm.de>
 <eeb2389b-7ff9-4ee5-b6c9-73cc716c5a81@gmx.de>
 <ZtLd9RUvxaV_SfiX@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtLd9RUvxaV_SfiX@p100>

Helge Deller wrote...

> Maturo, Christoph: Can you please test the patch and report back?

Tested-by: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>

Patch applies cleanly on 6.10.7, system now boots as expected.

Let me know if I should repeat the test on v6.11-rc5 or even current
HEAD.

All the best,

    Christoph

