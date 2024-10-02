Return-Path: <linux-parisc+bounces-2441-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC1C98E38F
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 21:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83092285BD7
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 19:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BED2141C6;
	Wed,  2 Oct 2024 19:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="im8h6cdd"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5642629C
	for <linux-parisc@vger.kernel.org>; Wed,  2 Oct 2024 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727897932; cv=none; b=V3yKhe4bWI87eRnTHNkybA3WTmPAvegqSG172CWL28YYdH5rX+rdk6F/5hkMlPmD39Ha8LeEhaj2gdWO54jSP6os2vWS2O3S5Oa11c2wLdaCFjD7G16r1LCzawpm3rnyPTZKdgHlSlPELE6cN4r/lStlo7MwTda46vCf9oW3UQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727897932; c=relaxed/simple;
	bh=NabVw+4ogaElkgK+aOgmxAwzHzGxSLSPROO9m+z5R5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNnUiqLwd4jPjJ3WE04sYFeSN3L/k4SpSb4UEgWNQ+ZUfosVDFXs4M34E+K1T1i8lBn70Xdo7M1ZtfY+9Ln44KhieA91R7Or0aQ1Ste8F48/Y1V9WwownCoScH705kKc/Yl8MuzhjO7PNuY7naGBuYLV4e5wPosJ5ITeBXls9XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=im8h6cdd; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727897911; x=1728502711; i=deller@gmx.de;
	bh=jh8q2iiTxcrq7mWBbjp8ALUZER0F8ATlcu8/MCFVIr0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=im8h6cddRa1Am/dMLVfj3NP0j7M1Tnh4ekXKS+sEFcFwE0GZAwtBN8JCxob6xJ9m
	 eemTJw1Ze/UDBpMlHiGPR5h+dRqSIHRN3ZT1XCwvAoFpGcu/Wz010OGaob4aSIpHU
	 ibTNXg/b1e08WsvaPAqiMvCyYPRNe0ZXrOWIdyboNsQxwI0sX2uScAl43dM1J2aAy
	 upUjfC/VXjYtuiUYO91aQhbdWVfPJEz7FbrwnSUt72VlDdIFy+91FfFK0sxk3aBS/
	 o/Kdc9/c5qLdqxWWtnZYRaxzLCm5Qs7HjzaOu3VQ+Nn7nCQ5audfEaN8ajikf6VMk
	 qbQMBa+q613FWt9Tdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1rsoyB3JVt-010IWQ; Wed, 02
 Oct 2024 21:38:30 +0200
Message-ID: <5e1dd7c4-4f99-4f68-ad49-eea67b99bd5a@gmx.de>
Date: Wed, 2 Oct 2024 21:38:30 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: {PATCH] accel/tcg: Fix CPU specific unaligned behaviour
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Helge Deller <deller@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 linux-parisc@vger.kernel.org
References: <Zvyx1kM4JljbzxQW@p100> <87cykimsb9.fsf@draig.linaro.org>
 <CAFEAcA81YtAGO0iFZRWXGjJb91DhWEDTGr+cjWbNWEW4yJDksQ@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAFEAcA81YtAGO0iFZRWXGjJb91DhWEDTGr+cjWbNWEW4yJDksQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MxIFdAZMQJyeQXSc2PQqsryIewM357IeOXnO/RK5nsg4mz/rIWp
 TdKYlNsLntt+xTq8jqPEuPoODiLayRq1U7M4pF/8TJgjIZA2MIFCkXwelfKTGK9jClNT+eU
 7nPDutErGzVVtO6s8erkjAQKKX0ya8piXKBcQlxPE0KCOjoa2K9q2SH8EHeb+XsazOjtkP9
 FDU3zXLLo0qaPNKv5aNeA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Bt9yKMfASec=;nOFLeXinyFO+ffTcgHjTBAzU40f
 d7WuwEx7/tHisD7wW0Wv4CiO4HWqKOKuIW18M4jrvlPJ68A67bRb0pB/q3YWlFchXJZ7nZYLI
 OYHNcE+6DNY1ChMH/o8bbLuCN5Khj2aTrzATFasw3xxjHVxjAdbyIBHS7F9+dB1W63VeFh5KF
 8lznSQWR4wa7M51Xgr0Bf+fK+98NIayFep2JdoX1nbJ9KPEZNVGIwYQcslmNqX7moESS9A9QI
 SXJ4AiosuYxMR+l//4CXoTUqBwzA8lpmW6xnd/QT4N5VJfJ76QO7mlV5yf61QO3KvH9Q2mQR+
 yidagHsvep25G4wMQMcpRwMntPPP8BO3p1OW3TMfHQJVqgijJ0WlR1hXE3zMQ5TFNWMtkozSf
 lIt5oeXEqTdX6qXyCo6ru3sh3CVyTu1jNQwaedbmWlfWLtX7geyPGwxiJTZe03uY4z7MLYuOg
 2wOpc2z5Z9ArUD3wPDCdpHU3jzPTBRD6flc9YXKRnh9f1OEyDgyf1lRdylMnXmppJNTQOoBS0
 cBuJ3ssSBu+R/tBCivErGAjnefNIpLb3k1aeDEiAJkDCJtYpO99xplUupyDBG4wlDb25KPrbc
 k6L8a9c86v0li8YJ5w5euYrBWG5AACbzPjXCubUjui0fc8llmtOsPv4bJWhqm+g9YfrnJ29oI
 nf/PZWcu4KXE2x7BPfXLdZetsSfRnTvdxlVLEzsF6fvM8tJTttFpHcWox++oq5HQwOe93tcK5
 IoU1StI+WnEyClJ68Qc1XAda0ntf3B/roaMdVL7o522TrLOWBdUwzWicRLolfTGLE91OolHm6
 tn5L1llacDG5uOJaxlRIVBzg==

On 10/2/24 17:47, Peter Maydell wrote:
> On Wed, 2 Oct 2024 at 16:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Helge Deller <deller@kernel.org> writes:
>>
>>> When the emulated CPU reads or writes to a memory location
>>> a) for which no read/write permissions exists, *and*
>>> b) the access happens unaligned (non-natural alignment),
>>> then the CPU should either
>>> - trigger a permission fault, or
>>> - trigger an unalign access fault.
>>>
>>> In the current code the alignment check happens before the memory
>>> permission checks, so only unalignment faults will be triggered.
>>>
>>> This behaviour breaks the emulation of the PARISC architecture, where =
the CPU
>>> does a memory verification first. The behaviour can be tested with the=
 testcase
>>> from the bugzilla report.
>>>
>>> Add the necessary code to allow PARISC and possibly other architecture=
s to
>>> trigger a memory fault instead.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219339
>>>
>>>
>>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>>> index 117b516739..dd1da358fb 100644
>>> --- a/accel/tcg/cputlb.c
>>> +++ b/accel/tcg/cputlb.c
>>> @@ -1684,6 +1684,26 @@ static void mmu_watch_or_dirty(CPUState *cpu, M=
MULookupPageData *data,
>>>       data->flags =3D flags;
>>>   }
>>>
>>> +/* when accessing unreadable memory unaligned, will the CPU issue
>>> + * a alignment trap or a memory access trap ? */
>>> +#ifdef TARGET_HPPA
>>> +# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  1
>>> +#else
>>> +# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  0
>>> +#endif
>>
>> I'm pretty certain we don't want to be introducing per-guest hacks into
>> the core cputlb.c code when we are aiming to make it a compile once
>> object.

Ah, I didn't know.

I'm fine with either implementation people agree on and
which gets accepted in the end.

> There's also something curious going on here -- this patch
> says "we check alignment before permissions, and that's wrong
> on PARISC".

Yes, that's correct.
The first hunk of code in mmu_lookup() which I remove is the first
alignment check.
Then the memory access permissions are checked.

> But there's a comment in target/arm/ptw.c that
> says "we check permissions before alignment, and that's
> wrong on Arm":
>
>       * Enable alignment checks on Device memory.
>       *
>       * Per R_XCHFJ, this check is mis-ordered. The correct ordering
>       * for alignment, permission, and stage 2 faults should be:
>       *    - Alignment fault caused by the memory type
>       *    - Permission fault
>       *    - A stage 2 fault on the memory access
>       * but due to the way the TCG softmmu TLB operates, we will have
>       * implicitly done the permission check and the stage2 lookup in
>       * finding the TLB entry, so the alignment check cannot be done soo=
ner.

I'm no arm expert. Note there is a second ARM-related aligment check
in that function. See TLB_CHECK_ALIGNED.

> So do we check alignment first, or permissions first, or does
> the order vary depending on what we're doing?

currently alignment first.

Helge

