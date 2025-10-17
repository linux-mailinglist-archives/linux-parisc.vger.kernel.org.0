Return-Path: <linux-parisc+bounces-4234-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04230BE8BC7
	for <lists+linux-parisc@lfdr.de>; Fri, 17 Oct 2025 15:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 825445E5BE7
	for <lists+linux-parisc@lfdr.de>; Fri, 17 Oct 2025 13:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0055E345738;
	Fri, 17 Oct 2025 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b="jRyUFvdg"
X-Original-To: linux-parisc@vger.kernel.org
Received: from manage.vyzra.com (unknown [104.128.60.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00B331A6C
	for <linux-parisc@vger.kernel.org>; Fri, 17 Oct 2025 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.128.60.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706311; cv=none; b=F8XgxCEAKVEayDtfXpOF3HdIPAy4nSsEglOlJ6qJMZoIhzv3gLJ76kgF4uBiDTyiKM5oRPwBT9X8cTs/3oswFJi3o7sYQNYJRQ2l38C0vojaLx1+/CAzRaT9nufExg/CBrwD5LeHW8LQ5SkLAPRYcqkScCfRPNSWbp8rfKAvqeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706311; c=relaxed/simple;
	bh=biLnUx9jTTyVdIbdiavoTAgEZeIqqOihfb373MH/e18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mduQiZmJLR/aH3A/th4DAk7VCwLMmCjwKx99s6fhTAWYBpvJ9Fbp5kVjVo0ksjq1S4PeSjpWUCZPTeN9ROlvjnD6e+FY7BNqTrOro0e3iYizy+6Kz+LgWiLzVGr1U76grqOTii04CmysrLLi2k8tA6Vdni/lSQmIHrQMSlqwdXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org; spf=none smtp.mailfrom=manage.vyzra.com; dkim=fail (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b=jRyUFvdg reason="key not found in DNS"; arc=none smtp.client-ip=104.128.60.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=manage.vyzra.com
Received: from debtmanager.org (unknown [103.237.86.103])
	by manage.vyzra.com (Postfix) with ESMTPA id 95B0F492D2DB
	for <linux-parisc@vger.kernel.org>; Fri, 17 Oct 2025 07:45:35 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debtmanager.org;
	s=DKIM2021; t=1760705136; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Aj8bDacQlJB5qNMC5+yWWged1+K/M8YReXQkzUminbQ=;
	b=jRyUFvdgMOGKmLwfe+iJu//6yxy46iAqO6gt88uKDuaPrcfpvethTOwaHeIhKLl3nxlWP7
	YgiPOSsIW3sXDLYbz/WzOrhZ4J8+zba2Rkpw0I5wK0MhGwov240TKO4uR+jaedu8vlYemD
	zyMk4yhjPxL9Ux78sBNWi2ZVqR4pCFj9J60VokRWYXxCt8RATunZXSiEmopu2MCDr+aM2x
	wl24dvuyO7Pw99U12SFl38tLeRJm5eH5Tom1SSUDXdWoZjg7E08OaTl1fnFgeCVmeHpPlP
	lOd46Bv6KP6Q4PXQXm+4Kt3i2ai8vXRTe4S/uWTFLm1t21ySKX6xlow+FL8iOg==
Reply-To: vlad.dinu@rdslink.ro
From: "Vlad Dinu" <info@debtmanager.org>
To: linux-parisc@vger.kernel.org
Subject: *** Urgent Change ***
Date: 17 Oct 2025 05:45:33 -0700
Message-ID: <20251017054533.D702D1760EA43760@debtmanager.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -0.10

Hello,

I am Vlad Dinu, the newly appointed Director of IMF Legal=20
Affairs, Security and Investigation. I have been given the=20
responsibility to look into all the payments that are still=20
pending and owed to fund beneficiaries / scam victims worldwide.

This action was taken because there have been issues with some=20
banks not being able to send or release money to the correct=20
beneficiary accounts. We have found out that some directors in=20
different organizations are moving pending funds to their own=20
chosen accounts instead of where they should go.

During my investigation, I discovered that an account was=20
reported to redirect your funds to a bank in Sweden.
The details of that account are provided below. I would like you=20
to confirm if you are aware of this new information, as we are=20
now planning to send the payment to the account mentioned.

NAME OF BENEFICIARY: ERIK KASPERSSON
BANK NAME: SWEDBANK AB
ADDRESS: REPSLAGAREGATAN 23A, 582 22 LINK=C3=96PING, SWEDEN
SWIFT CODE: SWEDSESS
ACCOUNT NUMBER: 84806-31282205


A payment instruction has been issued by the Department of=20
Treasury for an immediate release of your payment to the bank=20
account above without further prejudice. We cannot approve or=20
schedule payment to the 

given bank account without your confirmation. May we proceed with=20
the transfer to the Beneficiary: Erik Kaspersson, bank account in=20
Sweden?

I await your urgent response.

Mr. Vlad Dinu.

