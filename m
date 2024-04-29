Return-Path: <linux-parisc+bounces-1268-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ABE8B62D7
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Apr 2024 21:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB50E283A22
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Apr 2024 19:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3DE13B7A4;
	Mon, 29 Apr 2024 19:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nona.1cooldns.com header.i=ghim@nona.1cooldns.com header.b="KOrltZkK"
X-Original-To: linux-parisc@vger.kernel.org
Received: from rdns0.nona.1cooldns.com (rdns0.nona.1cooldns.com [31.192.235.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ACA13C3F6
	for <linux-parisc@vger.kernel.org>; Mon, 29 Apr 2024 19:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.192.235.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714420182; cv=none; b=EN3CRcwE5hAZtbuBbL9qDVjrDNDfu133IehvNgBkruh0q/A7+NHNnQp9JOvOZdndkQoTCueoQAnwZGTgOPSknbV7Dtzi22IMyqyPUxLtS7tqMtYiyuzYKJLj9AWIVr/QZYIYIOeSL5TxUWOw335y7ntC8t9j2lzVuuXCXQluMH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714420182; c=relaxed/simple;
	bh=JG0SV9hXY/1TtbjjSQkLyMvYYfN5KWdFuiRFpI+nqE8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rMnkWUGgHB2VfCycsgVSBHSTwuDqLNcHr2rv86zQSGk55Oc/LSn+ToaHbleWoieMg52HmTpYpcNFM/kwv3PFjgZA90diIubHKuBUZq1C53FfEneA4OqesHjUZqnfk6ThfxbIO2mXGen93LJr8em6TTAFZE16D90d+aqkcsDPKvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=nona.1cooldns.com; spf=pass smtp.mailfrom=nona.1cooldns.com; dkim=pass (1024-bit key) header.d=nona.1cooldns.com header.i=ghim@nona.1cooldns.com header.b=KOrltZkK; arc=none smtp.client-ip=31.192.235.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=nona.1cooldns.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nona.1cooldns.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=nona.1cooldns.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=ghim@nona.1cooldns.com;
 bh=JG0SV9hXY/1TtbjjSQkLyMvYYfN5KWdFuiRFpI+nqE8=;
 b=KOrltZkKDVJuCmJbyc+ZXns1D5hqbD3mVgeoPMeiRlyyI8jSrbHRh41RR3ha6fZHva9c+aUDaGH1
   0zsLaPyShkHpbzE8/YdSyeOiqusdHRE6i/hzp4CDs+4kgw5ecJtCD90zHNLWWzOApoeCNvZzmPvc
   TEFAgDCQhTFnPS/9wCA=
Reply-To: stanislav.marcel@aliancegroup-se.com
From: "Support" <ghim@nona.1cooldns.com>
To: linux-parisc@vger.kernel.org
Subject: request for quote from sweden
Date: 30 Apr 2024 05:49:37 +1000
Message-ID: <20240430054937.CA34AAB476D66845@nona.1cooldns.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

My name is Stanislav Head of Department, purchase. We would
like to know if you export to Sweden, as we need some of your
products for our client, kindly gives us a reply so we can send
you the full specifications and details of what we would like to
purchase.


We would appreciate your prompt attention to this request, as we
should begin a cooperation as soon as possible.


thanks & best regards.


Sten Arnlund

Purchase Manager
stanislav.marcel@aliancegrup-se.com


a: Veddige by 2, Holmerskulle, 432 68 Sweden.

