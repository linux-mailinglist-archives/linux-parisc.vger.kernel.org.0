Return-Path: <linux-parisc+bounces-2395-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C57F987982
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2024 21:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D0E1286E4F
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2024 19:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404C715C14D;
	Thu, 26 Sep 2024 19:08:13 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD231D5AC5
	for <linux-parisc@vger.kernel.org>; Thu, 26 Sep 2024 19:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727377693; cv=none; b=qr9sdTcQtA+zpo027wJtUj6HGiOAnhTSTBiab+h+4rN+Qatyx4usQjL+J7BmtC2ewXpvtchT8U1r6P18F5c/i00tETlqWYEaeOKKndWl6BihhvL7jTdtNII5vPNQiYbOhUrZlUCmL8ehpe5LcvDD8SVpXY2O+4pLQsjuNIiE5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727377693; c=relaxed/simple;
	bh=6eQywAYL6QqRhhFJ0Fj6Awvb59wVsPS/pP5wyQ4Sa+w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QwpmXEhJQy/FS7vQHJ1es9Q8AIEY7/+PAtSyVyDf7h6AEyuZUb8Nq+2cxJw8iTF2fhizK9585mHgITLDHIf6CH4EJL+Eg2s2Xof3KnVDaQQqU1O3ygiLclE+vg0xMN8zZwnSP50QZwjog/ZcnEua9RassUcS15oqawcMX5PEr+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: John David Anglin <dave.anglin@bell.net>
Cc: Helge Deller <deller@gmx.de>,  "Andreas K. Huettel"
 <dilfridge@gentoo.org>,  Florian Weimer <fweimer@redhat.com>,  Helge
 Deller <deller@kernel.org>,  libc-alpha@sourceware.org,
  linux-parisc@vger.kernel.org
Subject: Re: [PATCH] hppa: Wire up cacheflush syscall
In-Reply-To: <e959c48b-8584-440a-a46e-a7442043076f@bell.net> (John David
	Anglin's message of "Sat, 3 Aug 2024 04:57:47 -0400")
Organization: Gentoo
References: <Zos8gVaGUcuaaNaI@carbonx1>
	<877cdwfgi9.fsf@oldenburg.str.redhat.com>
	<a6a933be-9795-4614-a925-25049736d3c1@gmx.de>
	<2572286.PYKUYFuaPT@kona>
	<b494d5e4-123e-4625-b947-644ac4283838@gmx.de>
	<87a5iq7kdh.fsf@gentoo.org>
	<e959c48b-8584-440a-a46e-a7442043076f@bell.net>
Date: Thu, 26 Sep 2024 20:08:07 +0100
Message-ID: <87ikuiutbc.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

John David Anglin <dave.anglin@bell.net> writes:

> On 2024-07-09 9:41 a.m., Sam James wrote:
>> In this instance, I wonder if we should do the extra checks. The kernel
>> instability because of the cache / TLB issues means at least one of our
>> machines runs an older kernel for now. (Dave's latest patches seem to
>> help a lot there, but you get the point.)
> Can you be more specific?=C2=A0 Do you still experience instability due t=
o cache / TLB issues
> on this machine?

Sorry for the delay. Our main machine, 'muta', has been suffering
instability for a while. It ended up also having bad RAM and failing
disks. We've now replaced them last night.

We had a lot of kernel crashes since then but after upgrading to
6.10.11, everything seems okay so far. Fingers crossed, and then I can
get back to the other bits (like testing the binutils patch).

(The panics were all in pte_offset_map_nolock.)

>
> Dave

thanks,
sam

