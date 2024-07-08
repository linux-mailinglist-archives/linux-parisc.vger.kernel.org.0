Return-Path: <linux-parisc+bounces-1775-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A23929E95
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Jul 2024 10:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 274631C222DB
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Jul 2024 08:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F7313ACC;
	Mon,  8 Jul 2024 08:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="K6KNHXvS"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8150BB66F
	for <linux-parisc@vger.kernel.org>; Mon,  8 Jul 2024 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720429130; cv=none; b=QmY6IwMknPxVmcHACO4ma7dlKudFc5VOUS9Tyhn0IDXMjSN+AGlASqdR21MxQgQTvXUzv5Ii5V+DrmHTtz/cSgOXS+T36zvrOcklrhSiU6S03F/RLysTra8CqcDK2H5WB7XJBJkiaAFWRo5MwA3oanbnaA+tSk/NDz+/zG5YbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720429130; c=relaxed/simple;
	bh=71zXLS/ZQSATNgXQ0XSHSJJvSAF1JidqjFcgDAQXOck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3dUXV2i6aXfGsqJC7xchiugb1OJybbgETqBtClnH2qVOdlvV6nyhymZvzi+gZDiSm8BKqGPE+KNrrNiGhDKiItHxLNjkNNUf1QZjB10Q6823hBUtjDpR3kHXnB3+gqdTxaPmdq1qLpG4jWeWa3dWgzwzBpgc8W9UmTKTlfJEr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=K6KNHXvS; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1720429117; x=1721033917; i=deller@gmx.de;
	bh=o6SffuRJols1saHsPvfOcOHmKosaLv2+vz7Loc63bL0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=K6KNHXvSHIC5h6HgN6R7XyaecwiE2NsuthVlcwHqLf0L6k2hDnBTe/zrGr1wnc5m
	 9vSl5oBduGda8XRqvYYxzl8obcNh/NO0NxbJXZclhW9AH/RJnHYnFVV+R5uN9cHdA
	 +dlQHA0DiQ1E1/HseEhgbOMdXwZxKu74wxBdJac9b9RCmvRJiRp6lQLZ8o8Jjwjcg
	 t7v7W6EDtwICnI14Ou4Tj5XcRbwDS6pOMAvISPVKah/W0UkceC7/5Nu0gTCXKgDTv
	 hbwHvAJkeocY6CPy5fWPYtxy1XJyRg25xL7obvfh4zk85ZuXINItLA5WtzO7B7Ljc
	 Z2RFTS09g4t5FYEpwg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.33]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4z6k-1sIwkS3bxU-010CP7; Mon, 08
 Jul 2024 10:58:37 +0200
Message-ID: <a6a933be-9795-4614-a925-25049736d3c1@gmx.de>
Date: Mon, 8 Jul 2024 10:58:35 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hppa: Wire up cacheflush syscall
To: Florian Weimer <fweimer@redhat.com>, Helge Deller <deller@kernel.org>,
 John David Anglin <dave.anglin@bell.net>
Cc: libc-alpha@sourceware.org, linux-parisc@vger.kernel.org
References: <Zos8gVaGUcuaaNaI@carbonx1>
 <877cdwfgi9.fsf@oldenburg.str.redhat.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <877cdwfgi9.fsf@oldenburg.str.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wVL7hDVCthPl/fItuo2yT1ivzndSrBYnyhn8MlUlul7mgmiJ1w6
 R2OhCcrCvQ1m39jcorX0eRyFbnJPtBL+c5bENHR/H+PFMIxdG1zzayrEtJAQ2aYHcivBSIq
 yzlEjWXu+r+ZrtTrGoHkivOeTrY806KqGcpkqGlTQYpUGNI1hzFh7GFdFoAF8q3ayR6lTiu
 MItCJkK0Gpa7R+7te5MZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kcepeUxciQw=;DSVvOSQRWsKFnL65va44gKCRh6i
 5M/hBnynDo6gUftCRRAu0oQDl5YF5MOahOnIbvt/6COIDslufYcxzg4FBmXQiiichuoOzuUmt
 XyZWZv4ZHaagW1w7ZybkykGEWr73BMJXgQDKbRqio4YgXfuu0BVfX7iUTb1Pl9pPHvqq78Ypp
 I25GzeAtm/grV1P1eDQhypazpOHBSwzKYnPOF3Q76hG9L/9VlRBbgA4OhmY8WWh4a26hRQ+1T
 NXKNMYzfdaNEwsgGxaEx3JZvGExxwYhHIcQQSHdfYefH5rgn9kSFCChaKA/sTClXaVeJ7EuoY
 G8RSlSmH/S/+MJbJ1wq2GTrKaT0Q7CA4nEfLFS+1HUTNOmSogvXai7o/6aI3DJIz1rpzPxEBE
 vUwXE16bDCahymWa8IZLnN9xGy2jI4pPH+FbfQFQbfMyTADVMggnWGl9ULnWTXZ6oGdRHU5+m
 r6LBGwp4qZaxUBplkc00rx/zYGMr+sb4lB/U/k7D0hUEDyXvVjt3t4mCPAScvHY8skPN6/KPz
 wHO3vCx0mZ7RiP/oX21QeGn9X6LQnaFrvtKe96njz9PGSeSY0SXXdYOM/XDoYTB0/lJY6Y1zw
 5qL2Et6eRvWN6doRPgjp0bTiTPuSsYr6QT2sJOVO06tCIVERoVCE10k3YmamJkGNAIH9KcR7v
 CPJKjx9DUcIVHWKw+9plbx+OWhHGeMay5WP6e9jaTHjw3qy+IwErHUoyx5Bdhju3o+ZS7xh+h
 QmlbZs46q5RDRubdAE//sd2iRd4NE/Pz+Cixg6Lo6r27fJ8T/BbwyQ/4ji06ca7p9o6oz02eT
 FZA9P3kKDAif7jsZBAVnMtgmphVxJGuuLMoEpTjI6uuc8=

On 7/8/24 10:13, Florian Weimer wrote:
> * Helge Deller:
>
>> diff --git a/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h b/sysdeps/unix=
/sysv/linux/hppa/sys/cachectl.h
>> new file mode 100644
>> index 0000000000..16e47d1329
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h
>> @@ -0,0 +1,36 @@
>
>> +#ifndef _SYS_CACHECTL_H
>> +#define _SYS_CACHECTL_H 1
>> +
>> +#include <features.h>
>> +
>> +/* Get the kernel definition for the op bits.  */
>> +#include <asm/cachectl.h>
>
> This makes this header (<sys/cachectl.h>) unusable with older kernel
> headers.  I think it also results in a test failure with older headers.
> Is this a problem?

hppa lives in debian unstable, so basically you should always use
the latest kernel & kernel headers when upgrading glibc.
So, personally I think it's ok to ask people to upgrade.
Dave, any opinion on this?

> In similar cases, we use LINUX_VERSION_CODE checks (for older compilers)
> and __has_include to support backports.

I'd prefer to not add additional checks.
Another (maybe easier) possibility is to simply backport the kernel asm/ca=
chectl.h
file (just the header, not the implementation, so the syscall will return =
-ENOSYS on
older kernels):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3Dc6d96328fecdda16e12f3b3c33f3677f4bcef89f

Helge

