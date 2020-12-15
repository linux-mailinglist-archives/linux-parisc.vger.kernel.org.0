Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BEB2DAEF1
	for <lists+linux-parisc@lfdr.de>; Tue, 15 Dec 2020 15:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgLOO1u (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 15 Dec 2020 09:27:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728648AbgLOOZ2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 15 Dec 2020 09:25:28 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DCBC06179C
        for <linux-parisc@vger.kernel.org>; Tue, 15 Dec 2020 06:24:47 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id b2so21236122edm.3
        for <linux-parisc@vger.kernel.org>; Tue, 15 Dec 2020 06:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fLpk+0c6FuyfGY/ZPM8JLqZ7uOu3TenhRTPoyAvYEGM=;
        b=bABxRUzF+8ZxeFd1UT+nifMCe3/bsD9P1eGnnGbiecDth0Z+o1KFOGVsOSoJ/piXIE
         XuPG61GuEQqe6Aj6eaw2SVpZksUBg/Lwlnn6cj3T3k4/vYkSc4lQ9aS0MaleRSWwJxzZ
         YN1WSdUWqWQ9ZF1GQZr3iWhRwlLS8GC/VMBnStAjmbf6tVtHOVzlEXIG5fbMs3KNOeWx
         Bhe27fsPeeGf3azCz14n3Ffgo6h9BzitvM30sWW/KDyLWI25oguqYTE/tAmntQSV8I9H
         c86KYGKniC3UIEXndhgW+GbHFhdYDLiWcrNDYijoLsQnGwSDgskTvdztQpUm7lF4HjJu
         unZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fLpk+0c6FuyfGY/ZPM8JLqZ7uOu3TenhRTPoyAvYEGM=;
        b=K+iA6k15ZvDiJEOYsx8pJPWks9R23wLNMg24DRy5u3yRB3wvPl+g0IbnBcfUbUfJ29
         QjARNps5HXJFBjtjPCvDotzqwhk1wbOVEHIBrdTArvLLLO2UsNVcDfb8H+GWlhhx8F/W
         gaXRmvHsh0dNu83l6EUVkJBA+q6Wc2Q+PMPxrq+lcshwtKFTz82ERR+ui6TfM94x0sIN
         lvYHN59T+Tp6+VnlyTQBlZ3n4xuRv+shb+hVkXahmhx9Bh6+7OEr6bcVmaVCwDowyOm1
         bCHRbL+ySlYy5Remqa4jdPVD0bGwnwrz6pcv3OLO55szN9pOtuYrd915EEelhowEZ6NH
         swCA==
X-Gm-Message-State: AOAM533wq2nUS0qKAB/MSGZrTMA/2jETA3aa5YDlpFzZi12PhlIj/wWX
        py+sVxzszC56oN3b9lLiSZYBV9m7Pz9/UIQ1hm2wWA==
X-Google-Smtp-Source: ABdhPJzHxKob1ssLVm6vrZLfegboHmbPniBwBbz7OSz4o9b90xXM3Bo0HfSHJ1jAtKSRAuumlFWY6EGplsEYfGteu/g=
X-Received: by 2002:a05:6402:229b:: with SMTP id cw27mr29522993edb.23.1608042286116;
 Tue, 15 Dec 2020 06:24:46 -0800 (PST)
MIME-Version: 1.0
References: <20201126130606.2290438-1-anders.roxell@linaro.org>
 <8affd609-f037-8b21-853a-8b87299db044@gmx.de> <CADYN=9+pSK2SHY4ncFaseT9qz6BoTCUxi0e3poTDao4v=S_84g@mail.gmail.com>
 <CA+G9fYtNgeOgymsVwj423eXOFP1B=mS4KKvy+1Bu3tUapXyxDA@mail.gmail.com>
In-Reply-To: <CA+G9fYtNgeOgymsVwj423eXOFP1B=mS4KKvy+1Bu3tUapXyxDA@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 15 Dec 2020 19:54:32 +0530
Message-ID: <CA+G9fYtgKFUsiY2x8Ue-cnO2Jr1+teQZ_3TbKC+eD9c6OpkPGg@mail.gmail.com>
Subject: Re: [PATCH] parisc: signal: remove _SA_SIGGFAULT
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Helge Deller <deller@gmx.de>,
        James.Bottomley@hansenpartnership.com,
        linux-parisc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Anders,

On Wed, 2 Dec 2020 at 13:31, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Anders,
>
> On Fri, 27 Nov 2020 at 04:10, Anders Roxell <anders.roxell@linaro.org> wrote:
> >
> > On Thu, 26 Nov 2020 at 15:46, Helge Deller <deller@gmx.de> wrote:
> > >
> > > On 11/26/20 2:06 PM, Anders Roxell wrote:
> > > > When building tinyconfig on parisc the following error shows up:
> > > >
> > > > /tmp/kernel/signal.c: In function 'do_sigaction':
> > > > /tmp/arch/parisc/include/asm/signal.h:24:30: error: '_SA_SIGGFAULT' undeclared (first use in this function); did you mean 'SIL_FAULT'?
> > > >  #define __ARCH_UAPI_SA_FLAGS _SA_SIGGFAULT
> > > >                               ^~~~~~~~~~~~~

I see these build failures on Linux mainline.

ref:
https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline/-/jobs/911416687

Steps to reproduce:
-----------------------------
# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime docker --target-arch parisc --toolchain gcc-9
--kconfig defconfig


- Naresh
