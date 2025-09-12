Return-Path: <linux-parisc+bounces-4016-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2EAB559B3
	for <lists+linux-parisc@lfdr.de>; Sat, 13 Sep 2025 00:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D655B5A78D5
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Sep 2025 22:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5482417FB;
	Fri, 12 Sep 2025 22:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dxWG5wTB"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947561F63FF
	for <linux-parisc@vger.kernel.org>; Fri, 12 Sep 2025 22:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757717238; cv=none; b=IhNSeZ+yEAEihYw9qYTUfxdfmgx/j+2BGHWRuP/1Mnst8lTcj7p/YVKWCoJKxWR1lepO6B/pCnjf0BwhZqkOSdnem5+fyXj/UdMJc1+wshSlM7ny8VugxBNhG++NHr8yoJbR9ekJQloLeHq38vlJ/ev2N1qvbC1jYDBMqhxzHXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757717238; c=relaxed/simple;
	bh=PuC0x0wZxSshYp65vfPecqp3riKCUu3EhmJ42hnawOo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gl8ARYCPx/f3NeStU5T50/4dhFpaQbSQ8oXNRosZm2aOOsCdPTVbLz67jhLgMOcTgBGjMrfO8NZNKX85mKIF6/csU/spyt1V0wAXojBZFOuhH+YWZZkLzV5MKZ4qmLT0r3kp4tmgasj1Iul1Ix75N+BDoF+hudTqqzuBWeQXYTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dxWG5wTB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B1DC4CEF1;
	Fri, 12 Sep 2025 22:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757717238;
	bh=PuC0x0wZxSshYp65vfPecqp3riKCUu3EhmJ42hnawOo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dxWG5wTBOFkF1kdlND8tSYAP+hU5SK1eCl0+VJNoGbNp3Ul8kyb6vt39djZqMiKPh
	 cGjstpDgVr1sAiu7IzNZbUBYoHspUKQsZYnwXdtN8j6l0tYdNrPd2Sy3XCXkoXu+8L
	 +ICkEZ2dGlH2F5G2gzSNf9Exd5CVFWp9Hv37b2Fc=
Date: Fri, 12 Sep 2025 15:47:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Helge Deller <deller@kernel.org>
Cc: David Hildenbrand <david@redhat.com>, Toke =?ISO-8859-1?Q?H=F8iland-J?=
 =?ISO-8859-1?Q?=F8rgensen?= <toke@redhat.com>, Linux Memory Management List
 <linux-mm@kvack.org>, Linux parisc List <linux-parisc@vger.kernel.org>
Subject: Re: [PATCH] Fix 32-bit boot failure due inaccurate
 page_pool_page_is_pp()
Message-Id: <20250912154717.c557cc39b72740491938fd91@linux-foundation.org>
In-Reply-To: <aMQ2ZjZNyNwAiUk-@p100>
References: <aMQ2ZjZNyNwAiUk-@p100>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Sep 2025 17:04:06 +0200 Helge Deller <deller@kernel.org> wrote:

> To: David Hildenbrand <david@redhat.com>, Toke H=F8iland-J=F8rgensen <tok=
e@redhat.com>, Linux Memory Management List <linux-mm@kvack.org>, Linux par=
isc List <linux-parisc@vger.kernel.org>, Andrew Morton <akpm@linux-foundati=
on.org>
> Subject: [PATCH] Fix 32-bit boot failure due inaccurate page_pool_page_is=
_pp()
> Date: Fri, 12 Sep 2025 17:04:06 +0200
>=20
> Commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them wh=
en
> destroying the pool") changed PP_MAGIC_MASK from 0xFFFFFFFC to 0xc000007c=
 on
> 32-bit platforms.

page_pool is a networking thing which partly lives in mm/. =20

Can you please resend, Cc'ing the people and lists identified by
	scripts/get_maintainer.pl net/core/page_pool.c

