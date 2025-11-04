Return-Path: <linux-parisc+bounces-4251-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA885C33139
	for <lists+linux-parisc@lfdr.de>; Tue, 04 Nov 2025 22:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA04C4E1130
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Nov 2025 21:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49B81DA55;
	Tue,  4 Nov 2025 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b="LloRipvW"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FFEA41
	for <linux-parisc@vger.kernel.org>; Tue,  4 Nov 2025 21:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762291833; cv=none; b=dbXLqhwptaV/HBy8KoymqOdJCwCRcoXnsGRnS0wAYZDwow+S2WKKg+X8XtPEcU1mzlIyhlwo5LWAvSHO/2qy0NgFieFkczets/gb2dypwOxrplJlK2qmaMNT68WDlH00rJ73wKIi5np2PUZjFyxgNq/hm+2ZgQRjbMTVz0yOMcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762291833; c=relaxed/simple;
	bh=ZHovlWt+7uOZNIIUZZLzt4j8bZT1PO5dZkWk1vNPs3M=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=CIyoWbpu2TqJ8s1nB+yGfETtSn+suLp2+Dpdm8956ckwzYX/4uD9CCTPxIjEWJd7O7BfxY7A4cETwxsB3AV6/nPOYnh1jInTDKYewrrD4ZhCBDRyAuP1z/ROR1tRvnWUkwUg6eSOYtd3wqufaES/jOXtYsyOB5fQ263vGd9g3tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net; spf=pass smtp.mailfrom=msa.hinet.net; dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b=LloRipvW; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=msa.hinet.net
Received: from cmsr3.hinet.net ([10.199.216.82])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 5A4LUOfA521265
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Wed, 5 Nov 2025 05:30:29 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=msa.hinet.net;
	s=default; t=1762291829; bh=MXb1N9NNb/efBMpxBfWwfEf+1ZY=;
	h=From:To:Subject:Date;
	b=LloRipvWHsNezo9Afo0exvnUMhCvOHnRjag6IueJlTDlEKsPRIN9KhJizx/EmPbL6
	 WNlRQ4xqAx3x9wHt2X+lppepO360ww7K/PlQvW56flM4qNgiCTH4J4EjnJt/DVOBdY
	 W5hNAO6XtanZYWG6UNBiNk7ehci9WwQA8gBsTiH4=
Received: from [127.0.0.1] (114-42-208-135.dynamic-ip.hinet.net [114.42.208.135])
	by cmsr3.hinet.net (8.15.2/8.15.2) with ESMTPS id 5A4LPRPa556094
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Wed, 5 Nov 2025 05:26:26 +0800
From: Procurement 99046 <Linux-parisc@msa.hinet.net>
To: linux-parisc@vger.kernel.org
Reply-To: Procurement <purchase@pathnsithu.com>
Subject: =?UTF-8?B?TkVXIFBPIDUwMjg3IFR1ZXNkYXksIE5vdmVtYmVyIDQsIDIwMjUgYXQgMTA6MjY6MjQgUE0=?=
Message-ID: <c69422dc-bcbc-9c04-f04d-7c566f6f35ec@msa.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Tue, 04 Nov 2025 21:26:25 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=e6elSrp/ c=1 sm=1 tr=0 ts=690a6f83
	a=r3vJa6IkFzW4KQsu729KTw==:117 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10
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

Noble alliance trade

