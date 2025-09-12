Return-Path: <linux-parisc+bounces-4017-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C931B559CE
	for <lists+linux-parisc@lfdr.de>; Sat, 13 Sep 2025 01:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA8537A2C01
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Sep 2025 23:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADD2235072;
	Fri, 12 Sep 2025 23:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="uirz5xpd"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEBDB67F
	for <linux-parisc@vger.kernel.org>; Fri, 12 Sep 2025 23:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757718336; cv=none; b=R7ou32gPS0+tk3uXph+c3e6RevCK1OzR1WtPmjTyLF2Jino26YxnQPGgh4q/KBlrKVYTz1Xg02XXFN7PJ0vblANrS600XS1NP58yfh75I1APbtlagAM/rcUD1SXg/2rb6O51E0E3lJaiKSgkDgA7qBIoDxL4h42S0jjS1VgE2HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757718336; c=relaxed/simple;
	bh=r6DDzIvH6kLWrQvYc2wOnx0F3cOnO7OACWXL9FEPz5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Id7yjk8soycsHgsGi2qTxaJ93sI6BJkh4zls7WEXvkzY37wDs7AmMl/vC9z2BTIghsOBByY+XZMnvEiqTjv5ZgsLvnGREIj/ZDlXgUG1S/eX8wde9AJYhBbT6MWU9rbtpdms/Li34ToudniQwwavMbbF7jwFZYnuiRWlbj0eODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=uirz5xpd; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1757718328; x=1758323128; i=deller@gmx.de;
	bh=YpYXdzWcolF9/Am3Z3gefvTK7Uczynqa2koMlORNBVE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uirz5xpdW57xhMt7ppAkAGS8dwxHwy8Co0dxi82YJheo7cO+dxeP/7U6rdYn9gXw
	 s+ItsXeELPqfMAzvdhoO+wf3Q9V3nyAL+/Nni+K/gVUzch/Smc076PXQ8bUt2cCcA
	 X00BQurbejCCcbgQ1kQmHacHjDbmsUvdkFZ71F/M7wypoaznBB9mpCOmGsbx57X0I
	 jD63TWciI1Q4k4cX6d2LrlUdeFkBzFeZfQ5NszrJIqFgHID1cTf2tDvXqEgglufFF
	 20n4QQErCcatp/8HScv/EUiCLfb6l0FWpBqhVFgQLu2hxdVB2+jrq9+xfOfC0rDYS
	 tdwzRKytm2qvr3ww6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.58]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9dwd-1uIh183PNN-00wMF4; Sat, 13
 Sep 2025 01:05:27 +0200
Message-ID: <cceda667-c3f8-463f-950e-eb8c87a14c6e@gmx.de>
Date: Sat, 13 Sep 2025 01:05:26 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix 32-bit boot failure due inaccurate
 page_pool_page_is_pp()
To: Andrew Morton <akpm@linux-foundation.org>,
 Helge Deller <deller@kernel.org>
Cc: David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux parisc List <linux-parisc@vger.kernel.org>
References: <aMQ2ZjZNyNwAiUk-@p100>
 <20250912154717.c557cc39b72740491938fd91@linux-foundation.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250912154717.c557cc39b72740491938fd91@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FVjiofPZrb+zFDrcvV1yZA5m4JLxoKQw1w36mGff7P2K+qYQDHd
 mzvdiEYscxP2/w+4F4qLZINVX7/QIAVFwlJvT/zA8AVrq2C2mGhJBUVUcz8AH1arP5l8sop
 IBJMxjW8sF0pXJvorDpjau908VD2Epe0SMbnQbjsxW3VwoO588V0jaN9oEJuPbuYTv5QPzg
 TIQoKXFL2Gkb5JfBn0SMw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pu3oHaVghp8=;W5kJ3gG7BTVCtAz5UF18estOaaR
 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

On 9/13/25 00:47, Andrew Morton wrote:
> On Fri, 12 Sep 2025 17:04:06 +0200 Helge Deller <deller@kernel.org> wrot=
e:
>=20
>> To: David Hildenbrand <david@redhat.com>, Toke H=C3=B8iland-J=C3=B8rgen=
sen <toke@redhat.com>, Linux Memory Management List <linux-mm@kvack.org>, =
Linux parisc List <linux-parisc@vger.kernel.org>, Andrew Morton <akpm@linu=
x-foundation.org>
>> Subject: [PATCH] Fix 32-bit boot failure due inaccurate page_pool_page_=
is_pp()
>> Date: Fri, 12 Sep 2025 17:04:06 +0200
>>
>> Commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them =
when
>> destroying the pool") changed PP_MAGIC_MASK from 0xFFFFFFFC to 0xc00000=
7c on
>> 32-bit platforms.
>=20
> page_pool is a networking thing which partly lives in mm/.
>=20
> Can you please resend, Cc'ing the people and lists identified by
> 	scripts/get_maintainer.pl net/core/page_pool.c

Sure, will resend accordingly.

Helge

