Return-Path: <linux-parisc+bounces-3242-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A7CA1ADDF
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jan 2025 01:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4807E3A3DA0
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jan 2025 00:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1372878F29;
	Fri, 24 Jan 2025 00:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ene-kolla.pt header.i=@ene-kolla.pt header.b="g8xSx0Fb"
X-Original-To: linux-parisc@vger.kernel.org
Received: from ene-kolla.pt (mail.ene-kolla.pt [89.149.207.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE165588B
	for <linux-parisc@vger.kernel.org>; Fri, 24 Jan 2025 00:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.149.207.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737677808; cv=none; b=gCQtXFefKc04xymu+/jndSMWFEH3OmNH0PgL8JjYG6BXgPAaxWR0L+mEQvnWkRo+e/blBk9kauSree/Qtx6wvrLS0g9oyLF6hATqVjbugeegco9d0oY9b7e2J4e3vyPG9ghi1UM5MsPMj0i4L1hyhh5TKxxXEJzLqLpz1kLZM8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737677808; c=relaxed/simple;
	bh=6Cz1RoC77WgRsOJMWY05qhxtkmo/QejZ9PVT55bwtTs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=umRtmig3kUAshFNzkhGmfJ5S1wYbdRvB7NTvjcan6ueWdmnaaXk55uvS9DfstDfF/bTCiafo50cfZb+ysBLk8n+ZJOSkZBjEbnS/9KuRIiaE0EzO3hTHncG04jwDQBCmXUqdzzybPAksQbKjUIgZn8uIc4DnFBqt7YUa1Zjmiyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ene-kolla.pt; spf=pass smtp.mailfrom=ene-kolla.pt; dkim=pass (2048-bit key) header.d=ene-kolla.pt header.i=@ene-kolla.pt header.b=g8xSx0Fb; arc=none smtp.client-ip=89.149.207.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ene-kolla.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ene-kolla.pt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ene-kolla.pt;
	s=202211; t=1737677804;
	bh=6Cz1RoC77WgRsOJMWY05qhxtkmo/QejZ9PVT55bwtTs=;
	h=Reply-To:From:To:Subject:Date:From;
	b=g8xSx0FbcWu3LtI7VJ+YmKbSPaKKhdXW49zMKHS9oUCSTxxd3R2TElenh8xqcEze5
	 Q0uWACpc+v5B5380qChvhVxBHFEeWeRy6J6kNoAHaKkycavzVO56qRtIrYmxudfwC/
	 Db7taAuyvCj8JmFaHfedlRUZEz1HQ7plDmiw7h4LkPfu0YkfoSA3yVE/iDmNQvWRzW
	 0uS9KaFCRv5nqw5Yd99p7KAz/dv4ZcPy7VhPJKaN0lrJ7Qi1zgS3GgyPzq/GM846Nm
	 eY+hNSUPJkLZaSx1/B2tIk3SrjMWXfX4vMcKyfIbY8LpaynYdJf/GLoGGXay5EAMig
	 sWHAAlDLLpQ2Q==
Received: from [103.202.55.136] (unknown [103.202.55.136])
	by mail.ene-kolla.pt (Postfix) with ESMTPSA id 4C2ACF9098
	for <linux-parisc@vger.kernel.org>; Fri, 24 Jan 2025 00:16:44 +0000 (UTC)
Reply-To: wioleta.raimer@invpolamd.com
From: manuel.rodrigues@ene-kolla.pt
To: linux-parisc@vger.kernel.org
Subject: urgent request for a quote
Date: 24 Jan 2025 01:16:43 +0100
Message-ID: <20250124011643.F7FE2B961D2A9337@ene-kolla.pt>
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
My name is wioleta. we would like to know if you export to=20
Poland, as We have active
projects that require most products as seen on your website. If
yes, please kindly keep us informed upon your feedback so we can
send our preferred listing for quote. For further information or
have any questions, please do not hesitate to write us.
=20
Sten Arnlund
Purchase Manager
wioleta.raimer@invpolamd.com
a: Vedwalterdige by 2, Holmerskulle, 432 68 Poland.

