Return-Path: <linux-parisc+bounces-4175-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC39ABB0052
	for <lists+linux-parisc@lfdr.de>; Wed, 01 Oct 2025 12:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CA64194011C
	for <lists+linux-parisc@lfdr.de>; Wed,  1 Oct 2025 10:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E15329BDBC;
	Wed,  1 Oct 2025 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="K3+ks7kL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F46288C13
	for <linux-parisc@vger.kernel.org>; Wed,  1 Oct 2025 10:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759314704; cv=none; b=gbtH7GGz/Eex1PsXRh8w+0HAXP1rQN8mVk9jAKUXPo5CzH6Yh7ncZwl9+JU6Hykisp63REB3/rd1gKNLmAGY972abZHCpUaua9a2Nm45JE6O02WnPY4iDwG/PJwbvRjyABclex6ikqy7BR4zEsOaVZAcbJYx7FKK8o9w5KKNW2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759314704; c=relaxed/simple;
	bh=NYpvHFrW+6WJdAoVAxtmW6ZPYUGGPlR0B51uZtc+3E0=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=G4ctn1gCCaE0gfMNgGW0uw+yvAVVq7bafibzdDLl/MzW7gjyLTRfIp6Wp6mvAfEeZ9URKdc93y4n4R254yOtS427IJK8Oq5izHvvt4/vuj19n5cR/FD00BXrZF016iT3mzlWoMrOVhejCvtAvK4Go1fo2grBQ2nMKjWRxJ8j/TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=K3+ks7kL; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr2.hinet.net ([10.199.216.81])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 591AVeQx188944
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Wed, 1 Oct 2025 18:31:40 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1759314700; bh=bHPGMPKfAEEenMl5a6VUBVWn7TE=;
	h=From:To:Subject:Date;
	b=K3+ks7kLJLN8QQ1saWnSFX8Y6AJVBU9Vuhv9ESOFgkJlr64Vm4HGRH3+WDhZHW8RV
	 ksUTQOFPBESop6QHoQdd2l4M5+ygbUtXbP6Tsjy38JSc2jdR48jVeP4OFcgEWNCP4F
	 SlwgUfmmYFN+nhbd/qjHCEDEpSvSdaXvXDSHhFIU=
Received: from [127.0.0.1] (118-171-10-232.dynamic-ip.hinet.net [118.171.10.232])
	by cmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 591AShN1233849
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Wed, 1 Oct 2025 18:28:47 +0800
From: "Info - Albinayah 112" <Linux-parisc@ms29.hinet.net>
To: linux-parisc@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gOTA1MzQgV2VkbmVzZGF5LCBPY3RvYmVyIDEsIDIwMjUgYXQgMTI6Mjg6NDEgUE0=?=
Message-ID: <b2cd7ba5-320f-633e-e1c3-e5b8598ca92c@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Wed, 01 Oct 2025 10:28:42 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=L46+QPT8 c=0 sm=1 tr=0 ts=68dd0260
	p=OrFXhexWvejrBOeqCD4A:9 a=cY7OJCTA0kKZHwJy2uE19A==:117 a=IkcTkHD0fZMA:10
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

