Return-Path: <linux-parisc+bounces-3871-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B84B3D507
	for <lists+linux-parisc@lfdr.de>; Sun, 31 Aug 2025 21:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7B634E0543
	for <lists+linux-parisc@lfdr.de>; Sun, 31 Aug 2025 19:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884751CAA4;
	Sun, 31 Aug 2025 19:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="hB6w3IVP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmsr-t-6.hinet.net (cmsr-t-6.hinet.net [203.69.209.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1E168BD
	for <linux-parisc@vger.kernel.org>; Sun, 31 Aug 2025 19:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.69.209.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756669733; cv=none; b=rqJnWRTXA2EIt/QVcl6xrQOTq6BaqnOOXSE+2dd8KZ2fUMOmDjRgNgOoaV9q5RZVzOAEAOcK6WSVELGwDzBXhuFlJAU7ats77ewqLrLpN8Ftnq/kiM6hDC1ixCv7ef9Pp3do+1Xs68OrHnreDe2TYLhzmv38fjYEU3PN5DKT4Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756669733; c=relaxed/simple;
	bh=NYpvHFrW+6WJdAoVAxtmW6ZPYUGGPlR0B51uZtc+3E0=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=tmLrMr30NUM9z9T1gzkFZP8/OJ+9VLuZTCcJij4KXQDUpC4fotXO8bWPaz/TLZOSjIENHM5gx9ZaEznkLfGeuwW1hJSB2/0zV84HAT6WtfjLntZNYPljQU+Ga/jINnvh0t/d9dv4B8jLPgO4dekI6k8qWJCQy2gDj8E+Ge4ceog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (2048-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=hB6w3IVP; arc=none smtp.client-ip=203.69.209.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr10.hinet.net ([10.199.216.89])
	by cmsr-t-6.hinet.net (8.15.2/8.15.2) with ESMTPS id 57VJF2dl059370
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Mon, 1 Sep 2025 03:15:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ms29.hinet.net;
	s=s2; t=1756667703; bh=NYpvHFrW+6WJdAoVAxtmW6ZPYUGGPlR0B51uZtc+3E0=;
	h=From:To:Subject:Date;
	b=hB6w3IVPRIncjGsFg3XohHNQ0C/QIU8dZomixqOcopZA8MTDSDS/gGicjxxxiYMdo
	 fGiyLBDM34TEUPp3JD35jUqGzayIL23mRvfVO24SxpVrtUWTImX+lZhFVhWjfQgtmG
	 PlTSXZrWltzY+dTsD5IeyT1wb4mVjsdsCDvi1VKEs2yganAYQI0Bj+jHuK2s3t2k+f
	 s6pF4nq5bRskyiSCMN7MTSFggBVX5qu0JDuW2naoONTzkFSMIVId6nL6EJV16Jfi75
	 z1JdnoTwtkX+zbUK5bcimAJH6cPkJv/dY395OmngCNV8u/Frq2/yLPmTmLQX/jztHp
	 KzehDJTdpZXxg==
Received: from [127.0.0.1] (61-223-201-177.dynamic-ip.hinet.net [61.223.201.177])
	by cmsr10.hinet.net (8.15.2/8.15.2) with ESMTPS id 57VJEHNB900126
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Mon, 1 Sep 2025 03:15:01 +0800
From: "Info - Albinayah 481" <Linux-parisc@ms29.hinet.net>
To: linux-parisc@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gNTc0MTQgU3VuZGF5LCBBdWd1c3QgMzEsIDIwMjUgYXQgMDk6MTU6MDAgUE0=?=
Message-ID: <670df148-e5b4-a9ff-4a33-dd029b747287@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Sun, 31 Aug 2025 19:15:01 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=ZJd0mm7b c=1 sm=1 tr=0 ts=68b49f36
	a=EZpPB5Mc+P+Fck9gmuaeHA==:117 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10
	a=OrFXhexWvejrBOeqCD4A:9 a=QEXdDO2ut3YA:10

Hi Linux-parisc,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: September

Thanks!

Kamal Prasad

Albinayah Trading

