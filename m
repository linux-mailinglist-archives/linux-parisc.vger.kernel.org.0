Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85B54040DC
	for <lists+linux-parisc@lfdr.de>; Thu,  9 Sep 2021 00:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235936AbhIHWJk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Sep 2021 18:09:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235838AbhIHWJk (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Sep 2021 18:09:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA1886115B
        for <linux-parisc@vger.kernel.org>; Wed,  8 Sep 2021 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631138911;
        bh=Ur8btnqRAMRzrm0xB26mqSI0B9W7RiYL27K4hpP3jQI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qZi99r5xquM3qg0kg7JIxqZPchPSvNz48AueI0i0meEdRC1wVVgE7ZAVayuC4Ba+c
         FF4Z6R4HS/R2sLIhvk+j4NktXLmBHOttAKQ5t27OgzHNI5n7CdYfgJcPbubGXzLqP5
         TaqvCoI+75jSBHEaR/cvBf8azEQXPO6AKvDLBAADztgyoNvrugTPRU96oE9H3GN79p
         x+XxVt6sxi63iOpyv1SYctEz/UHnUHzq9i5uLO4CUuU9vlij5VIbs/BpmNpLDoWntx
         GPWEPbqlGGNpOBie4EC2rmsOivmwVtM6Kuc3cgZJ5wh9l+Png/OKC3yxVNNbPdD2m9
         DQwWzQTFwMzLA==
Received: by mail-wr1-f49.google.com with SMTP id v10so5440192wrd.4
        for <linux-parisc@vger.kernel.org>; Wed, 08 Sep 2021 15:08:31 -0700 (PDT)
X-Gm-Message-State: AOAM531o0sjt3R8UWtRZuhju1VehbDKh1vzrk93yt0FlvXht2oOAteL0
        oBj+ePR+ttrmGYM1ncuYPstTyF55tvMILweGAGY=
X-Google-Smtp-Source: ABdhPJyTfREu9NmFRODRHBgE+cAAA0ekpehUk2ToxkDUgeWKL5179zKU9kVMPiSP4i5IVri2K7GzMe9U9O0BHTQ1OJA=
X-Received: by 2002:adf:914e:: with SMTP id j72mr487749wrj.428.1631138910486;
 Wed, 08 Sep 2021 15:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210908204405.127665-1-deller@gmx.de> <CAK8P3a1-ajAFtO5zE396DBPUzssdas5o+adsEDtAK58X1ZAU7w@mail.gmail.com>
 <97d4c69c-59ff-8e28-0cfe-50908b999729@gmx.de>
In-Reply-To: <97d4c69c-59ff-8e28-0cfe-50908b999729@gmx.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 9 Sep 2021 00:08:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0wkfWsz7a91Qf--+BDDWKmYyBC4wkBEnbehWu1vGXEZQ@mail.gmail.com>
Message-ID: <CAK8P3a0wkfWsz7a91Qf--+BDDWKmYyBC4wkBEnbehWu1vGXEZQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] parisc: Drop strnlen_user() in favour of generic version
To:     Helge Deller <deller@gmx.de>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Sep 8, 2021 at 11:40 PM Helge Deller <deller@gmx.de> wrote:
> On 9/8/21 11:26 PM, Arnd Bergmann wrote:
> >>   /*
> >>    * Complex access routines -- macros
> >>    */
> >> -#define user_addr_max() (~0UL)
> >> +#define user_addr_max() (uaccess_kernel() ? ~0UL : TASK_SIZE)
>
> I noticed that our user_addr_max() was actually wrong.
> It's used in the generic strnlen_user() so fixing it seemed appropriate.

The user_addr_max() definition should match what you do in access_ok()
for USER_DS though, which is a nop on architectures that have split user
address space, so I think the ~0UL was correct here.

No matter what the arguments are, there is no danger of spilling over
into kernel space, which is what the user_addr_max() check is trying
to prevent on other architectures.

> > We are getting very close to completely removing set_fs()/get_fs(),
> > uaccess_kernel() and some related bits from the kernel, so I think
> > it would be better to the other way here and finish off removing
> > CONFIG_SET_FS from parisc.
> >
> > I think this will also simplify your asm/uaccess.h a lot, in particular
> > since it has separate address spaces for __get_user() and
> > __get_kernel_nofault(), and without set_fs() you can leave out
> > the runtime conditional to switch between them.
>
> That's a good idea and should probably be done.
> Do you have some pointers where to start, e.g. initial commits from other arches ?

Russell just merged my series for arch/arm in linux-5.15, you
can look at that but it's probably easier for parisc.

I think the only part you need to add is __get_kernel_nofault()
and __put_kernel_nofault(). You can see in mm/maccess.c
what the difference between the two versions in there is.

Once you have those, you define HAVE_GET_KERNEL_NOFAULT
and then remove CONFIG_SET_FS, set_fs(), get_fs(), load_sr2(),
thread_info->addr_limit, KERNEL_DS, and USER_DS.

        Arnd
