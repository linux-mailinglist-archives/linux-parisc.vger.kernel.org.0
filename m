Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7BDB401A35
	for <lists+linux-parisc@lfdr.de>; Mon,  6 Sep 2021 12:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233903AbhIFK4J (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 6 Sep 2021 06:56:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:35758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233893AbhIFK4J (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 6 Sep 2021 06:56:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CD8160BD3
        for <linux-parisc@vger.kernel.org>; Mon,  6 Sep 2021 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630925704;
        bh=DXU/iDgFPYwFbWeLLPrL796ADMpPY64n0onBPUm3oCY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tTlMS+4KwRu3KaaFLm6AbqqJ7uHADQ5xnA1nfHpswkjJB9nUFMbg8bpSQg9PKSqA/
         N8fA8n6TVqy0J2xpCSdrvLxn29cVRG3/hSKczePz3RrgPLeEuNFA6zHBH/CIRLCTl6
         f384LAgwUQ4akicIDeL4QGFUOlHq3hH2dGiOLmPtaaLODbyMpzP+7AigONKPHkAC3f
         qC3nl7XJyEyZ4P/Y7WII0d1LMiN7Kr2i7+2acOYOmAyc0gn3xp4XY2/VvlsEPGIL2y
         bW42/fT7t4nmGRRe73nHY1iTkemBt3wd2nl4rLGMBJMWHHfIJxUtN/BEt43X1Y5Asw
         8/GNnwTlXHx+Q==
Received: by mail-wr1-f41.google.com with SMTP id q11so9203190wrr.9
        for <linux-parisc@vger.kernel.org>; Mon, 06 Sep 2021 03:55:04 -0700 (PDT)
X-Gm-Message-State: AOAM532HGahNa8QtpLyWyTPqL/8h9lI8MZk9wAxrJTV7BaPXa67TSYDs
        xOzmUQfIxXZJ3bkfDUKBHOlFQO8r9bD0kT6tY4U=
X-Google-Smtp-Source: ABdhPJxNSGb1mauVJH1iDvWoHatHK0+eLam5rJpi2EEKEkqAnIKqdEjUJMd7fRjkm0Wtm5H22Mkl33MmLDCPvSGjpsI=
X-Received: by 2002:adf:f884:: with SMTP id u4mr12082819wrp.411.1630925703261;
 Mon, 06 Sep 2021 03:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <YS6VGsZ7fZtZeu/i@ls3530> <YTDaZAMvAipdvkaB@ls3530>
 <CAK8P3a0zwnEUK_ztPRBx0H9VGBoPVY-+aASFV97zSKrL=diXUA@mail.gmail.com>
 <51d6b8cb-a64f-0cf7-1545-4c2fee89799e@gmx.de> <CAK8P3a3oJo496dXpAWHQKG=Sdr+RSfScYbWKyGrk8HNfH5G1CQ@mail.gmail.com>
 <41e38a49-5a11-4f93-6771-b67d8184a673@gmx.de>
In-Reply-To: <41e38a49-5a11-4f93-6771-b67d8184a673@gmx.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 6 Sep 2021 12:54:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Tzi8L3+7YypPMukjDM+D8a_dxK1q7fOK357LATsouoA@mail.gmail.com>
Message-ID: <CAK8P3a0Tzi8L3+7YypPMukjDM+D8a_dxK1q7fOK357LATsouoA@mail.gmail.com>
Subject: Re: [PATCH v2] parisc: Fix boot with kernel v5.14
To:     Helge Deller <deller@gmx.de>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, Sep 5, 2021 at 11:40 PM Helge Deller <deller@gmx.de> wrote:
> On 9/2/21 10:41 PM, Arnd Bergmann wrote:
> >
> > The reason that the "output_len" access breaks is that gcc explicitly optimizes
> > the bytewise access  into word accesses because it assumes that global variables
> > are correctly declared, and that they are aligned according to the requirements
> > of the ABI.
> > This may be surprising and even unfortunate, but I can see why they did
> > this optimization, and that it helps in other cases as well.
>
> Arnd, you were absolutely correct and I was wrong.
>
> It seems to work nicely now after I changed the output_len variable to
> become an "extern char".

Ok, that's a relief, at least my patch wasn't the main cause then.

Changing the declaration to 'extern char' of course is still incorrect, so
this might cause other problems in the future, the same way that the
old declaration caused the problem by decaring the wrong alignment.

I think declaring it as an array of four characters, or a struct with reduced
alignment would be the safer choice here. Ideally however you would
change the linker script to insert a

    . = ALIGN(4);

before the output to make the variable properly aligned according to
the ABI. See 'git log arch/arm/kernel/vmlinux.lds.S' for a long history
of alignment changes we did there.

        Arnd
