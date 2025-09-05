Return-Path: <linux-parisc+bounces-4005-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E78CB45FF9
	for <lists+linux-parisc@lfdr.de>; Fri,  5 Sep 2025 19:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E993CA45083
	for <lists+linux-parisc@lfdr.de>; Fri,  5 Sep 2025 17:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBA231328D;
	Fri,  5 Sep 2025 17:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="jd4nBzhx"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cdmsr2.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD5C31328B
	for <linux-parisc@vger.kernel.org>; Fri,  5 Sep 2025 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757092932; cv=none; b=an8pEFFrSe/bQIYnriHesBVpT878FBl2YyBNdudRQ9iLzCnTu/iNerW2Wh0iK0kXQl0jA4QzOTmdUwzJyhx9+hlt/a+ziI/DyDzNm2sqw7QnOFo6lz3bCrhlkDea3LeP7LphB6bg4nmYOKjyRpe40fmsRv6YfZnsCVTnNnKjgag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757092932; c=relaxed/simple;
	bh=NYpvHFrW+6WJdAoVAxtmW6ZPYUGGPlR0B51uZtc+3E0=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=P3GdQddu9iY7zTLuWy/S9ycaRUtRnGuX1Nv/yVO68B1oRHoJoMq8v4P18L5oYSusB4a49kGqwrjgeOvXzXyg/CkSy0DnhMQmbSubtCRHiup06h4abo3u/s9bxGbRMLRmSfIF70WGOLdEnjInvexVATctdcLAHWqOFo1RrdOvTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=jd4nBzhx; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr8.hinet.net ([10.199.216.87])
	by cdmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 585HM8CO863342
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Sat, 6 Sep 2025 01:22:08 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1757092928; bh=bHPGMPKfAEEenMl5a6VUBVWn7TE=;
	h=From:To:Subject:Date;
	b=jd4nBzhxA992Q6vZo+rI/bWDp80zpJiDkiKUpnVAl2m58JRAJOs2/EVdGbZ88OwVr
	 oFSDCsE3r2GDDNBaGt639n7oeSHXiklii8J8JE8zTzFjIvFxTs1gjb3RgHK+ggeGF0
	 L2GX2xLy1vQAeuJ/nToQwrV6aYIfNJq6DhlYjUEY=
Received: from [127.0.0.1] (111-248-75-151.dynamic-ip.hinet.net [111.248.75.151])
	by cmsr8.hinet.net (8.15.2/8.15.2) with ESMTPS id 585HIVOf015527
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Sat, 6 Sep 2025 01:19:19 +0800
From: "Info - Albinayah 404" <Linux-parisc@ms29.hinet.net>
To: linux-parisc@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gNjc2NDUgRnJpZGF5LCBTZXB0ZW1iZXIgNSwgMjAyNSBhdCAwNzoxOToxOCBQTQ==?=
Message-ID: <0e2cb64b-6a64-c6e0-b706-f78347d6ae9c@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Fri, 05 Sep 2025 17:19:19 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=V87e0vni c=0 sm=1 tr=0 ts=68bb1b98
	p=OrFXhexWvejrBOeqCD4A:9 a=WE7OcPvpjVj+lK8zVrb6uw==:117 a=IkcTkHD0fZMA:10
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

