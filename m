Return-Path: <linux-parisc+bounces-4248-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FC0C29A99
	for <lists+linux-parisc@lfdr.de>; Mon, 03 Nov 2025 00:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 975BB4E75BF
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Nov 2025 23:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E797253B5C;
	Sun,  2 Nov 2025 23:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b="YKctrMFS"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B568E22422D
	for <linux-parisc@vger.kernel.org>; Sun,  2 Nov 2025 23:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762127696; cv=none; b=FuzIlbBic6mlmdA5Ea7ThHJDsvmJSEwLU7GfZ+23eAYXNW5JSJQNUbYwk+HQkHwRK5kEOyj8zjoYWuuGY7+JIwcnBKhmJDGS5c20WDzGLy7A1sxuyj8Zu2YvcjvpupPKMQjHAMSxUK5lHuPG8pTZV7daKieym3COIilZO3bfMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762127696; c=relaxed/simple;
	bh=Wkh+agUt0LUUVBd0sMs7/qctqrcKSZ6PZbHGjIf5e8U=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=AAZIsPIjnvC1SMs5YG9nzGHHV4vCZjiK4nsJqHloiflZ9/5JqXfbbEmSg+MnkQVhqA4Xv1H4xN6CW+WhFzPR8M5FlG2xlSLath1rO2fI7gNZqv29fMhXlafkB9a/1xdWYd1r0GnoWmeQX0i9bvzk2Mae7XpvXhv3z+IiIJUDung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net; spf=pass smtp.mailfrom=msa.hinet.net; dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b=YKctrMFS; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=msa.hinet.net
Received: from cmsr7.hinet.net ([10.199.216.86])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 5A2NsiIZ991522
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Mon, 3 Nov 2025 07:54:45 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=msa.hinet.net;
	s=default; t=1762127685; bh=wxEVEIpQpvAHfBnLVQ2IcW8FqlU=;
	h=From:To:Subject:Date;
	b=YKctrMFSE21lU2bk4RKzdS1AGp0u3ExTdSyBn/ticyvAErjmlj0nYuO3YqesZXTbs
	 T3BPLcsW1CHVji3vnEjIRL49LgB51tntFHKuAeycD8UPKErV95lAH7t7Oj0BMG5LnE
	 INpAYUmIfqEqRvxs634i93VSkw1rw7s/AhvSRjtg=
Received: from [127.0.0.1] (220-143-17-2.dynamic-ip.hinet.net [220.143.17.2])
	by cmsr7.hinet.net (8.15.2/8.15.2) with ESMTPS id 5A2NltMu996357
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Mon, 3 Nov 2025 07:49:35 +0800
From: Procurement 03142 <Linux-parisc@msa.hinet.net>
To: linux-parisc@vger.kernel.org
Reply-To: Procurement <purchase@pathnsithu.com>
Subject: =?UTF-8?B?TkVXIFBPIDI4MDI5IE1vbmRheSwgTm92ZW1iZXIgMywgMjAyNSBhdCAxMjo0OTozMyBBTQ==?=
Message-ID: <48b4a916-c0bb-d876-43b6-7ba3a00a2626@msa.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Sun, 02 Nov 2025 23:49:34 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KqTu2nWN c=1 sm=1 tr=0 ts=6907ee10
	a=X4mNPFsjQvS7wtIdOyEb8Q==:117 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10
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

