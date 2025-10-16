Return-Path: <linux-parisc+bounces-4233-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72BBE5A5C
	for <lists+linux-parisc@lfdr.de>; Fri, 17 Oct 2025 00:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0B583BD30A
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Oct 2025 22:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEF318FDDB;
	Thu, 16 Oct 2025 22:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="c9LgNd44"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmsr-t-5.hinet.net (cmsr-t-5.hinet.net [203.69.209.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E00F199385
	for <linux-parisc@vger.kernel.org>; Thu, 16 Oct 2025 22:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.69.209.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760652779; cv=none; b=VDwEfTIymys4MH9Q4e0ukmzVevW1RAK1I3wX9P+Y9t9y84a7GpxzMn6KZU8r0M50FX8LfpUXwa+gUbrj8G6MAm6lo/Ul1useWmRw2I5/YL2FXgbLBEw2jLboWUCoDAEYEVTbV7Zqf9zLWn1OLnGKp56pOgcuofGxAtwbPvUwINM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760652779; c=relaxed/simple;
	bh=Wkh+agUt0LUUVBd0sMs7/qctqrcKSZ6PZbHGjIf5e8U=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=YhkuePd+HPPVjkPbSLjHb1+KqNtdohjJd/DShu9FvzKYvtBWRjyB3ghbSUPtjppaaubtuG6uJ9RzK5SCx6ZpY87DXp+dLVtPh2ivJEhXFE/H9qmL6IS+mjD6mgz9YC8RU/QIF+YgjQNtvuK3+0vGb2LiY79q+z0Bw7YE5VMVvHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (2048-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=c9LgNd44; arc=none smtp.client-ip=203.69.209.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr2.hinet.net ([10.199.216.81])
	by cmsr-t-5.hinet.net (8.15.2/8.15.2) with ESMTPS id 59GMCsdk286902
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Fri, 17 Oct 2025 06:12:54 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ms29.hinet.net;
	s=s2; t=1760652774; bh=Wkh+agUt0LUUVBd0sMs7/qctqrcKSZ6PZbHGjIf5e8U=;
	h=From:To:Subject:Date;
	b=c9LgNd44jpNiVsj0zrGXA5/IiRGIUwOKhlI664OJP+63lICtTighAL/38Hec2XAVF
	 PVziDjkXZ8O9/ZvPBWLtxpQqwWKEqKlNNZSMf26XXNdr7wIGUzK+NdvABe8t4vH+1T
	 X7KLmd/8qyfBRfJ5NjBNRsu045Yxk06NOHjGmgwXc9ICNG0wjFA//lA7mbK0XjxSSi
	 Xsc+d3C5z1mA2mp6XZ6IKebtAS7Y4wkeYcjZQpvFgJfB3WJPvjRr/kelSKzxZRF4VG
	 CiIi5pATz/RzSla+6L/wcDEHYqFfAJVFgXEm8aGkr8myn+jmF4u1Y5yPa+9WUDyBSW
	 5PTeV3U2jBXxA==
Received: from [127.0.0.1] (118-161-7-186.dynamic-ip.hinet.net [118.161.7.186])
	by cmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 59GMBR5d669352
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Fri, 17 Oct 2025 06:12:53 +0800
From: "Purchase - PathnSitu 226" <Linux-parisc@ms29.hinet.net>
To: linux-parisc@vger.kernel.org
Reply-To: "Purchase - PathnSitu." <purchase@pathnsithu.com>
Subject: =?UTF-8?B?TmV3IE9jdG9iZXIgT3JkZXIuIDE5NDkyIEZyaWRheSwgT2N0b2JlciAxNywgMjAyNSBhdCAxMjoxMjo1MiBBTQ==?=
Message-ID: <9fffb4a3-f08a-436b-16fa-d8d5124c2b84@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Thu, 16 Oct 2025 22:12:52 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=UMR+Hzfy c=1 sm=1 tr=0 ts=68f16de6
	a=fjjSVnO+gdGhGarqVF6Nug==:117 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10
	a=UGgpRm_RchrTRtReUJ8A:9 a=QEXdDO2ut3YA:10

Hi Linux-parisc,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: October

Thanks!

Danny Peddinti

PathnSitu Trading

