Return-Path: <linux-parisc+bounces-1787-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328292BB97
	for <lists+linux-parisc@lfdr.de>; Tue,  9 Jul 2024 15:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF91CB25134
	for <lists+linux-parisc@lfdr.de>; Tue,  9 Jul 2024 13:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DB5158D8C;
	Tue,  9 Jul 2024 13:41:53 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D34257D
	for <linux-parisc@vger.kernel.org>; Tue,  9 Jul 2024 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720532513; cv=none; b=Bvlh7iD6s2GgYwxaEBA9l0XBFUkplwLSgUkXzJCkOuKTpj4vVcLK6EjZacgsLbMvHaVKzvedv7okMt8gbHQltYj6AxyFMKd79rMJKuuf/+/+DgOhYdiRrymbplnIRD7DYy0Lyit2mYBKIprf9Yk4USFSSta1YDS8NvG0HnQMyac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720532513; c=relaxed/simple;
	bh=/zZJbdgz8iJT40g/2wI5HKaKjqimBDEJyKKfk4wM/rg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fi/pUQznONkb2PE5uFYAxvTYBgmP5zRU79QnymQU2adeHsLHvmuV1I19KFGB//5OoT5RzDzDEDH+faetdXjiD+ovuDuBbolFc7pC9Ocna4hyrP+EIu3CPwEy2RTv6wXrCYiaINTVQkVunS4F7T92GwtHQU0xEO/UiA9sMHkR6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Helge Deller <deller@gmx.de>
Cc: "Andreas K. Huettel" <dilfridge@gentoo.org>,  Florian Weimer
 <fweimer@redhat.com>,  Helge Deller <deller@kernel.org>,  John David
 Anglin <dave.anglin@bell.net>,  libc-alpha@sourceware.org,
  linux-parisc@vger.kernel.org
Subject: Re: [PATCH] hppa: Wire up cacheflush syscall
In-Reply-To: <b494d5e4-123e-4625-b947-644ac4283838@gmx.de> (Helge Deller's
	message of "Mon, 8 Jul 2024 20:26:21 +0200")
Organization: Gentoo
References: <Zos8gVaGUcuaaNaI@carbonx1>
	<877cdwfgi9.fsf@oldenburg.str.redhat.com>
	<a6a933be-9795-4614-a925-25049736d3c1@gmx.de>
	<2572286.PYKUYFuaPT@kona>
	<b494d5e4-123e-4625-b947-644ac4283838@gmx.de>
Date: Tue, 09 Jul 2024 14:41:46 +0100
Message-ID: <87a5iq7kdh.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Helge Deller <deller@gmx.de> writes:

> On 7/8/24 18:00, Andreas K. Huettel wrote:
>> Am Montag, 8. Juli 2024, 10:58:35 CEST schrieb Helge Deller:
>>> On 7/8/24 10:13, Florian Weimer wrote:
>>>> * Helge Deller:
>>>>
>>>>> diff --git a/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h b/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h
>>>>> new file mode 100644
>>>>> index 0000000000..16e47d1329
>>>>> --- /dev/null
>>>>> +++ b/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h
>>>>> @@ -0,0 +1,36 @@
>>>>
>>>>> +#ifndef _SYS_CACHECTL_H
>>>>> +#define _SYS_CACHECTL_H 1
>>>>> +
>>>>> +#include <features.h>
>>>>> +
>>>>> +/* Get the kernel definition for the op bits.  */
>>>>> +#include <asm/cachectl.h>
>>>>
>>>> This makes this header (<sys/cachectl.h>) unusable with older kernel
>>>> headers.  I think it also results in a test failure with older headers.
>>>> Is this a problem?
>>>
>>> hppa lives in debian unstable, so basically you should always use
>>> the latest kernel & kernel headers when upgrading glibc.
>>
>> Ahem.
>> https://www.gentoo.org/downloads/#hppa
>
> Sure. But I didn't mentioned it, because Gentoo usually uses a
> more recent kernel than Debian, right?
>

In this instance, I wonder if we should do the extra checks. The kernel
instability because of the cache / TLB issues means at least one of our
machines runs an older kernel for now. (Dave's latest patches seem to
help a lot there, but you get the point.)

thanks,
sam

