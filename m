Return-Path: <linux-parisc+bounces-4120-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10054B825EB
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Sep 2025 02:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7E641C20FF1
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Sep 2025 00:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE8D1922FD;
	Thu, 18 Sep 2025 00:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="vY2FQqZj"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cdmsr2.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1A5185B67
	for <linux-parisc@vger.kernel.org>; Thu, 18 Sep 2025 00:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758155239; cv=none; b=DWcoem8IBJAGHpmAzxahTYw1sYdvHutivNCOeTVarEzjgk9zvtcpBi7l4cfHJ+OrOCnJqriQLP2dBspyUoZTY1RqzKagVsqYqUGf7wduKO7E+h3eZYehTQJ0U7f59jIU2bX4UG6PFMJ5Y+6Cmu0VJ0FEJNoscLqsI6wHsaLH10U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758155239; c=relaxed/simple;
	bh=NYpvHFrW+6WJdAoVAxtmW6ZPYUGGPlR0B51uZtc+3E0=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=rWFQs4raSb9nNx4ZtXWixg40H6hDeA5kylauURHz0rpTsqjaQhVVuF+hXLp06qxWtFUeCJpQFRs7Si4wEuBwyP0KDV4UQHn3weBPKmAdV9IAVHEyQGJvBrAIpXMkETRlHTBj+Qnw7CmFa+zuTU1YvzKLf/PCpG6sWK6C20vA6s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=vY2FQqZj; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr8.hinet.net ([10.199.216.87])
	by cdmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 58I0R9mV429619
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Thu, 18 Sep 2025 08:27:15 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1758155235; bh=bHPGMPKfAEEenMl5a6VUBVWn7TE=;
	h=From:To:Subject:Date;
	b=vY2FQqZjo9fhYuOyfUOlOJezAK2QcF556flfeWbCvQl/CyyCPiCayhjg3QL8xCx+j
	 PoPCwSD2bKLmEPy9So08ReqO6DgxFnz895/DNGqr48Ct9K6WRbTyK0le7WTqVgo9yl
	 2w+vkTKk5gXdkfFIF7THA+zszisaGwTqUymSqoAQ=
Received: from [127.0.0.1] (36-237-152-93.dynamic-ip.hinet.net [36.237.152.93])
	by cmsr8.hinet.net (8.15.2/8.15.2) with ESMTPS id 58I0IsS4692655
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Thu, 18 Sep 2025 08:23:07 +0800
From: "Info - Albinayah 247" <Linux-parisc@ms29.hinet.net>
To: linux-parisc@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gNDY1NzIgVGh1cnNkYXksIFNlcHRlbWJlciAxOCwgMjAyNSBhdCAwMjoyMzowNiBBTQ==?=
Message-ID: <63cfe111-96c3-79f0-237e-37f2942883b9@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Thu, 18 Sep 2025 00:23:06 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=LvQxyWdc c=0 sm=1 tr=0 ts=68cb50ec
	p=OrFXhexWvejrBOeqCD4A:9 a=ECSLwNRI2jCDHCWmz5/pyw==:117 a=IkcTkHD0fZMA:10
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

