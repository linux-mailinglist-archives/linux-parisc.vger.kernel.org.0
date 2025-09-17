Return-Path: <linux-parisc+bounces-4115-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C135FB7F84D
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Sep 2025 15:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AC7D3BB522
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Sep 2025 00:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1C01ACED7;
	Wed, 17 Sep 2025 00:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="NIEHzy04"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6311FDA
	for <linux-parisc@vger.kernel.org>; Wed, 17 Sep 2025 00:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758067816; cv=none; b=BHLpIEvRzeDmJMvUIIWRjuzwF3DEh6ijqeQpwu9sDRSWI8kxtF+2ohxz8yOleXaud2cpmX3lz4YiSFIU6k8Zomz9ooPGkTL5gSG88AXhM17RjMsXoJqi3zerQw08VQHRfDpIVO3UjWLPIzdsXoo1ENTa9t0pGa8LGJEfhr2/Enw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758067816; c=relaxed/simple;
	bh=NYpvHFrW+6WJdAoVAxtmW6ZPYUGGPlR0B51uZtc+3E0=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=r8/9YcYmCfHtWy8XYQ9x6hmlmHRdiKZb9l9J1O+62SaM05oelq05QgGgG5422hXyomMTv+bV4xwHXimcdsPn83tyrXPkH989OyVb6x/jCI7Hicito8u3DpGapsjepzO04VkHdHhFIvOb1J8d2n2jAm6lC0zZx1FGM8WDlBpctX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=NIEHzy04; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr6.hinet.net ([10.199.216.85])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 58H0A83p873512
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Wed, 17 Sep 2025 08:10:12 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1758067812; bh=bHPGMPKfAEEenMl5a6VUBVWn7TE=;
	h=From:To:Subject:Date;
	b=NIEHzy04smZ7rzI1mZXqJ25vCX00b831GZPtJEYdz4r5SWcRJVohTflvV3VDy2f5c
	 e7xhL7NzFTxzgb6MOxMW5ipSW/DgYq50xQYAU/561FspGl0GhQ3U3LxiMjKkqfZW9M
	 voMHhbrp2+r58SBeZGvd/uqHNSESWyngi6zXll6c=
Received: from [127.0.0.1] (114-40-72-8.dynamic-ip.hinet.net [114.40.72.8])
	by cmsr6.hinet.net (8.15.2/8.15.2) with ESMTPS id 58H0438p649057
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Wed, 17 Sep 2025 08:06:15 +0800
From: "Info - Albinayah 398" <Linux-parisc@ms29.hinet.net>
To: linux-parisc@vger.kernel.org
Reply-To: "Info - Albinayah." <sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gODAwOTMgV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTcsIDIwMjUgYXQgMDI6MDY6MTQgQU0=?=
Message-ID: <5288e819-99a9-64b3-8bb6-cec570e7837e@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Wed, 17 Sep 2025 00:06:15 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=UojANPwB c=0 sm=1 tr=0 ts=68c9fb78
	p=OrFXhexWvejrBOeqCD4A:9 a=IqSu7Mo8Di0l4jt5ompC/A==:117 a=IkcTkHD0fZMA:10
	a=5KLPUuaC_9wA:10

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

