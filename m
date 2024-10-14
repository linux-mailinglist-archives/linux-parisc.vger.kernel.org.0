Return-Path: <linux-parisc+bounces-2704-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BED99D8AD
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Oct 2024 22:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56270282833
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Oct 2024 20:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272944C7C;
	Mon, 14 Oct 2024 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="VzgGzGq7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C196231C92
	for <linux-parisc@vger.kernel.org>; Mon, 14 Oct 2024 20:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728939428; cv=none; b=Y+EIQbTMzgBv5ypZs+aco7PClUt/afgjIisBimnqucG7wXvH2WkvnKKoNSfC1eKkbTlqAPgFtcXH9QSw/bvBB3TxpeR8BqoF269tGYTKdnEnm6UXF5R5+eJQgLzIEBmZjCsSrCv65KAHfsPkaXd5FkMul56zf4Y0qwbwNeExW2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728939428; c=relaxed/simple;
	bh=1IS5WStXW+9ROWK4ZahAAXaNIotvoGgkJGCrFbwyngw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=X1z1P2RGbnbqk7PV4QaYoif9oWWtQE1dU7VBxmIyh66O3banZbtMESlSYap3vItP5hvXLOZVSi773rj9099CRu2WK6UpCoDXFRKkBC7jQgU1jJUYN95/gKMBIb7cP+RLCYF8WwoLfBXNuut6koBaRzSFQeJjGFs7uULpGchbuYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=VzgGzGq7; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728939422; x=1729544222; i=deller@gmx.de;
	bh=nLwf34ncuCr3Pej42xokltkxCmuQxmVfKLSMKqTbc1M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VzgGzGq75mKlbyBzC6uhiv9ohspknJOlCUqjEDiKO6NJN/VO6Q5T+LX5dx8NVa9l
	 /FrBTp5cscgiGZF5IUIUqzRwSvWmbmFpUTrTFU3nkgsFVToK+zTvcsCjEmIvBHoxB
	 ALfWZtfxD8RncaE9FJJNJULl50f9JfWilAmVDcCsmuUqJDhW7otoQOWqqdur/icTg
	 JWAAigrg5aVysEmYhwijfGfoXorHyDLLgqFa4uFWmuh4AQazCUFZWZ68iFkn6ySes
	 Xh9YV729KoNICtezw06D/xwf1L/mCMR5cIvCx6Kjz5fPfYgab0DdChxFt2AwwfYaT
	 1ePNIMCY9QmcGWczEg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fnj-1t42cT2xTr-001IAn; Mon, 14
 Oct 2024 22:57:02 +0200
Message-ID: <cb65fcea-3a45-4b96-a96c-e4480a12d6b4@gmx.de>
Date: Mon, 14 Oct 2024 22:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Migrating parisc.wiki.kernel.org to RTD
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 linux-parisc@vger.kernel.org
References: <20241011-fine-bold-quail-2d60be@lemur>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241011-fine-bold-quail-2d60be@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rpUHSV7mBJ/d3FJKLmWViGpTapKcpZNqHWPbd1eCz2THRmAYmE3
 U7nBckw5X18nPLp6B74ynVElcUiN/j+2IEBsGSh7ssolRNY8oir+H2hMdS0ACr85at2bXVu
 gAmPRjSa2Y6duPXJvG9s7YtmARwnoskdnfFGbfjyk/hzcJpqim3ubB6GkurZEch0YYrNkKa
 lrqxZokgHORaBBwXP/tcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0+7ggWi+RHM=;fDxUGxJNZ/+29G7LSyXEzXno/ZW
 KFADLah3RyR84gsAYrAcErZeeOVh09C7ZYtgC5E1HAqq4YYCoa9OwLjfgGVEekyRqsPsJuBbJ
 MbEe2jwIzvoK7jVfwvt5P9BNEjl3FcaINzaj1gxwf8E03FhwPb76V3b9rOzJhgou117tysPyo
 hrFEZdzR3Y3qTHR22Ui076erCg3P7pEYr73C9OP+IPZWsa2LdeCdUnqfI98Sh42GuM9160bRQ
 4L4qyP0gEyfg+UVE4JXE1xu8E3nAMiRGTDv0rB/KG4ySnjBXct/2TWkBahBeIS95jl7V8WjCG
 A+QhYfMrjJrErIwaxhY0AunJTTHCpCRf9/YhcdnmiULGlquvGIjm/DfLL6jPGmh8Inb9hChnv
 d9V5svpGwDyjaqfFHe/uWqfiUkHVoZKtXCrn9tub0wgr/kGZzu1ORnX6TDNQ3cyrLJ5vnL0eR
 kqQgySed0LlPMfORS5gUhscl5+sGxejW3j6YJ+0dowRWtXCSizD6Ib8W7m2wbfofcwKyZsTDK
 hzar7T5+mZRv2LgzSmRnyQOm8KUDWf6kBKkzUm3/ugsQ7Q8R9bI7FOn11WxRZJ4Z6Yp64nhCE
 YTVOynhWuZnHuRzNIxhSkBURDjNTNVIZurmXFbOKcZ/dxtoXg/1WzP5IdpGuY8VqVvQPSBfxz
 4T6nyzlyywlTLXw74RQ1bGMse1zmXJFr7C5J/Q7pMkEBJPrPWBopHXKL0XNiqneg6TubsXPBD
 oqYZXS9YxqQ3iicfgJKGUNRjGB4Lk78VILoLt0AWQ4UdinixqwnYatbBzXoePM/7xtpeOz52L
 7S2yeem4kBhQGEnqI71DAl2g==

Hi Konstantin,

On 10/11/24 16:31, Konstantin Ryabitsev wrote:
> We are trying to sunset the last few wikis that we are hosting and conve=
rt
> them all to git-backed sphinx documentation. The PARISC wiki is one of t=
he
> last MediaWikis that we have, and I have prepared a migration path for y=
ou
> that I hope you will find suitable.
>
> # Preliminary build
>
> I have the preliminary conversion build available here:
>
> https://www.kernel.org/doc/projects/parisc/index.html
>
> The underlying repository for it can be found here:
>
> https://git.kernel.org/pub/scm/docs/docsko/parisc.git/
>
> The git repository includes the entire mediawiki history (excluding medi=
a),
> plus the new source tree with the conversion results.

You've have done a good job in converting it.
Thanks!

> # Multiple RTD hosting options
>
> If you would like to switch to the new sphinx-backed site, there are mul=
tiple
> ways to host it:
>
> 1. You can clone that git repository and host it on github. This would a=
llow
>     for a quick readthedocs.org integration and allow you to edit the fi=
les
>     directly via the github interface. This is a very wiki-like workflow=
 and
>     would allow you to grant access to the repository to anyone with a g=
ithub
>     account, plus accept pull requests with modifications. Once you have
>     readthedocs.org integration working, we can configure it to be under=
 the
>     docs.kernel.org domain, which will allow you to remove the ads from =
the
>     site.
>
> 2. Continue to host it in the current location and edit it with your
>     kernel.org account credentials, plus accept edits via patches sent t=
o this
>     mailing list.
>
> # Staying with mediawiki
>
> I believe switching to sphinx-style documentation is the right way forwa=
rd,
> because wikis are increasingly problematic to host due to spam and hosti=
le
> scraper bots. By switching to RTD you also gain a lot more independence =
in
> your hosting options, as the statically generated site can be put anywhe=
re
> capable of serving files.
>
> However, if you're absolutely sure you want to stay with MediaWiki, we c=
an
> arrange hosting with OSUOSL, but it would need to be under a non-kernel-=
org
> domain.

It's really sad.
I was quite happy with mediawiki and the output was quite nice, at
least nicer than what RTD currently generates.
I have not used RTD yet, so maybe someone here on the mailing list
has some knowledge and want to help?

> # What next?
>
> Please let me know which way you would like to proceed in the next few d=
ays,
> as I am hoping to sunset our last wikis by the end of October.

Unless someone else steps up and want to work on the
website, I think I will go with RTD and choose either option 1 or 2.
Do you have some more docs what steps have to be done then?

Helge

