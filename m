Return-Path: <linux-parisc+bounces-301-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C269819093
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Dec 2023 20:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26D0C289165
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Dec 2023 19:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BE038FB3;
	Tue, 19 Dec 2023 19:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mR8HS1zY"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C03838F8B
	for <linux-parisc@vger.kernel.org>; Tue, 19 Dec 2023 19:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-67f3f602bd5so17767596d6.3
        for <linux-parisc@vger.kernel.org>; Tue, 19 Dec 2023 11:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703013595; x=1703618395; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LnafHjmcxeMmG4v0Un/lPE+edElrILb4qaOIYdOvqC0=;
        b=mR8HS1zYMRLcOY71Yk/2JXhA/tkIWvvB0XBOCYtEF7ujLaPMvohFiWMjQDGmrtZYRD
         BeMuqnjkICfiyDG67jBUJUWDL7WWEKlpxSKvILGSsEmN4cdRZUpWBE/JOkQ0nAIewPCj
         1c3j8ILGFz7EDUiQlgACwrsxXb3B3EIo2WJD/dsvsXkitNt1eBdG/sH6mh7fId33oJQQ
         iHLIQ6D0pYg5/W1AmeDW4cKUUX4bKhKMKDZaIArXIpBNy7x7/7efP73us+KTvpRhqjsR
         uoubE8AWmE72Nmi00MZa5oHzx+P0+EBkdfz65yuCSK25gPdXAaPtjR7akbBj8Hlr5Z+T
         v1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703013595; x=1703618395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnafHjmcxeMmG4v0Un/lPE+edElrILb4qaOIYdOvqC0=;
        b=OzMmMeQCuoiEyBtgsMG0uqsuGscNMfDj01gLC2kuVMfrajOh77G8JFRrLLlLBrI3C1
         KIDrmTn5sqNdR61qB28kGlTql6Tkw2MHBAexG9+7YkNIlwpQcxbra3+N1FFtCu8wnavx
         j5l3biqb1z/H5kEkg5hzm6ULbQ7C2ePnPUqMebUIOlvmktKCYIK9mldydlk4tqulns1v
         Fq4m2iImT76eXztRKWjt5PF52c04qpTsj2BveY0SkwxEDx/MMYZwpwDB7iMbDqmEM3En
         1gAwMZR950gXLnIfh+t6pxX/VahJO8J4t6LMlSyze58LMCbfz+bTnF765wbG5ZNgET86
         jWug==
X-Gm-Message-State: AOJu0YxpcTafkrNtKQyfn6tgvAzSwtxSC8yTBKK7aPRWNVHtyVZAudSW
	o3aIYN1yxLPXQlUeCUN4wvwx7io2zRI1DsxxG2xonA==
X-Google-Smtp-Source: AGHT+IHEN06gZQhvx9hx2X1q6gsFT3zElEgtRsulmJDIP/auIfG6UAQpQWNnJC4AUrtoxYpTG8Ui/j4C6aM++7oLyJs=
X-Received: by 2002:ad4:5d47:0:b0:67f:1883:7873 with SMTP id
 jk7-20020ad45d47000000b0067f18837873mr14247936qvb.93.1703013595078; Tue, 19
 Dec 2023 11:19:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYvq+wdDhTjR2YkULF-_-nQNPGzCeOON-08EbVyidj-J6w@mail.gmail.com>
In-Reply-To: <CA+G9fYvq+wdDhTjR2YkULF-_-nQNPGzCeOON-08EbVyidj-J6w@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 19 Dec 2023 20:19:43 +0100
Message-ID: <CADYN=9+0stxkNLkqcbodZD879r8DACT1M-3QyZrt4JsrAi0E1Q@mail.gmail.com>
Subject: Re: arch/parisc/mm/init.c:534:29: error: invalid application of
 'sizeof' to incomplete type 'struct shmid64_ds'
To: Naresh Kamboju <naresh.kamboju@linaro.org>, kent.overstreet@linux.dev
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-parisc <linux-parisc@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 16:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Following build failures noticed on parisc on Linux next-20231219 tag.
>
> parisc:
>   build:
>     * gcc-11-defconfig - Failed
>     * gcc-11-allnoconfig - Failed
>     * gcc-11-tinyconfig - Failed
>
> Build error:
> arch/parisc/mm/init.c: In function 'mem_init':
> arch/parisc/mm/init.c:534:29: error: invalid application of 'sizeof'
> to incomplete type 'struct shmid64_ds'
>   534 |         BUILD_BUG_ON(sizeof(struct shmid64_ds) != 104);
>       |                             ^~~~~~
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Steps to reproduce:
>
>  tuxmake --runtime podman --target-arch parisc --toolchain gcc-11
> --kconfig defconfig

A bisection showed this patch as the faulty 1e462c05f65b ("shm: Slim
down dependencies")
Revering this patch made it build.

$ git bisect start next-20231219 next/stable && git bisect run tuxmake
--runtime podman --target-arch parisc --toolchain gcc-11 --kconfig
tinyconfig

Biseclog:
# bad: [aa4db8324c4d0e67aa4670356df4e9fae14b4d37] Add linux-next
specific files for 20231219
# good: [2cf4f94d8e8646803f8fb0facf134b0cd7fb691a] Merge tag
'scsi-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
git bisect start 'next-20231219' 'next/stable'
# good: [0762a5de2bd30a12821e519cbe722df9914da98a] Merge branch 'main'
of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect good 0762a5de2bd30a12821e519cbe722df9914da98a
# good: [19ac9eb1d925e26d8828f8ab1525696bad1b54c3] Merge branch 'next'
of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
git bisect good 19ac9eb1d925e26d8828f8ab1525696bad1b54c3
# good: [bf9602022c6726f0f8f888ba244d408661be5337] Merge branch
'char-misc-next' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
git bisect good bf9602022c6726f0f8f888ba244d408661be5337
# good: [9c6484cc7a133a7c54b8a1e195ec9083489e485b] Merge branch
'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
git bisect good 9c6484cc7a133a7c54b8a1e195ec9083489e485b
# good: [b3f7f46b85e7c1339cf2e55f1061a666147ccfe6] Merge branch
'rtc-next' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
git bisect good b3f7f46b85e7c1339cf2e55f1061a666147ccfe6
# good: [db2aea8e313f69f90beadbba97f400fe255168d4] Merge branch
'bitmap-for-next' of https://github.com/norov/linux.git
git bisect good db2aea8e313f69f90beadbba97f400fe255168d4
# good: [14a3e64715ea0a5853dd6a6876737c845f8aafb0] Merge branch
'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
git bisect good 14a3e64715ea0a5853dd6a6876737c845f8aafb0
# good: [b5759b6b16cb2b34e909d74f7b7f0b9e9a7590a9] rslib: kill bogus
dependency on list.h
git bisect good b5759b6b16cb2b34e909d74f7b7f0b9e9a7590a9
# bad: [f0a0cf5525892479795a5d1e1b81115a12915dee] seccomp: Split out
seccomp_types.h
git bisect bad f0a0cf5525892479795a5d1e1b81115a12915dee
# bad: [ea42bc1b4b8f04b8467e38f3e44e71cce372f1ab] ipc: Kill bogus
dependency on spinlock.h
git bisect bad ea42bc1b4b8f04b8467e38f3e44e71cce372f1ab
# good: [cd862cb689a09e55debd107df26744027a5fff8b] timers: Split out
timer_types.h
git bisect good cd862cb689a09e55debd107df26744027a5fff8b
# bad: [1e462c05f65b452f0e2e996ec97484dba9e95358] shm: Slim down dependencies
git bisect bad 1e462c05f65b452f0e2e996ec97484dba9e95358
# good: [840b9d9bfcfdc5ca12ce1af35a3ea10f05fda799] workqueue: Split
out workqueue_types.h
git bisect good 840b9d9bfcfdc5ca12ce1af35a3ea10f05fda799
# first bad commit: [1e462c05f65b452f0e2e996ec97484dba9e95358] shm:
Slim down dependencies


Cheers,
Anders

>
>
>
> Links:
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231219/testrun/21768759/suite/build/test/gcc-11-defconfig/log
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231219/testrun/21768759/suite/build/tests/
>
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org

