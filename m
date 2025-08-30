Return-Path: <linux-parisc+bounces-3870-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A8EB3CBED
	for <lists+linux-parisc@lfdr.de>; Sat, 30 Aug 2025 17:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E9D6560646
	for <lists+linux-parisc@lfdr.de>; Sat, 30 Aug 2025 15:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E5B24A047;
	Sat, 30 Aug 2025 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="RgQYowbj"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-outgoing-1601.laposte.net (smtp-outgoing-1601.laposte.net [160.92.124.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBD11A7253
	for <linux-parisc@vger.kernel.org>; Sat, 30 Aug 2025 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756567552; cv=none; b=g+QxFIhorIxokSIACJP7FeljyAqzjZ6gxfiUkecLrhMSQE8Ch9onc1kmv7Qn4XU79WigTf29u17tcpuJ32YotvxQ8BQcnyS++k+NWPePzfoQLLS/1zTLhFRcK9M+35jDHhtxRD7LgBUAixgaqZVZuJi0j8+yxs/0UKaUUzfmXaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756567552; c=relaxed/simple;
	bh=DUpt1CJxWQGVReyq28b5sdeuPs4A5xFECzIvtgthjG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfXO8sUJ/e6cD+DV993wnsOp6peUrVqHLZfdbFmxx26m9Fu+PRNGyjH+IEJLaIk+oAZWrRMsbV2ULDG0CeU9E7axkDO0oaJdKsvVnzQhjq+5N+27SjoHVk2mGymnfVt5UP/pxrl1jafCcC2fh1oTHlKh+WPnJH+l8rrgIo3ZqUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=RgQYowbj; arc=none smtp.client-ip=160.92.124.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
X-mail-filterd: {"version":"1.9.3","queueID":"4cDf901fGfzPjdF","contextId":
 "33d23219-2b50-4395-a4c6-421e50f30656"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0117.laposte.net (SMTP Server) with ESMTP id 4cDf901fGfzPjdF;
	Sat, 30 Aug 2025 17:25:40 +0200 (CEST)
X-mail-filterd: {"version":"1.9.3","queueID":"4cDf90100LzPjd8","contextId":
 "61a975e7-9201-436b-9a90-b23ab0f8431c"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net [88.169.129.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mlpnf0117.laposte.net (SMTP Server) with ESMTPSA id 4cDf90100LzPjd8;
	Sat, 30 Aug 2025 17:25:40 +0200 (CEST)
Received: by romuald.bergerie (Postfix, from userid 1000)
	id 1F2546970BBB; Sat, 30 Aug 2025 17:25:46 +0200 (CEST)
Date: Sat, 30 Aug 2025 17:25:46 +0200
From: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Cc: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] ipl: adjust firmware entry type
Message-ID: <aLMX-qhLMaWNkmQ4@romuald.bergerie>
Mail-Followup-To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>,
	linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
References: <20250830152204.7868-1-vincent.stehle@laposte.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830152204.7868-1-vincent.stehle@laposte.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1756567547; bh=DUpt1CJxWQGVReyq28b5sdeuPs4A5xFECzIvtgthjG0=; h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=RgQYowbjH1htQ9jBGPFlNPc5QbSgT/sqdu2TS/4sW9Nx6ftbX4PBT9ak3LiVXRMDZApyzEYO5tZWndym3QizW/sGtmx5J2+ikguMqqjZIhAPW0QSyoOLC70lyF1xYn2ODkKAf8L8DNgVNTSoPLJGQ9FGFOnw+mTR/lbMKxmjwgd5rwi7mUrnQtwDDTgU2Ov1enMfhVwKykbzL6qyho2tJeda/qa4myFbiFeYt2IFpPXGd3Z+is2vnEb9pCFUlHSCsdBn/G/q2rXRgWmLkQFwiIKFpjAsMgwDi6NuJ2nPIa5oV/64vUUu6SD8ikft1IqogS3FzDRMubpM6Fvc8tz3AQ==;

I forgot to mention: this patch is for the palo bootloader.

