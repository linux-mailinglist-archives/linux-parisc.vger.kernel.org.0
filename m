Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727ED24A9AC
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Aug 2020 00:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgHSWoX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 18:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgHSWoV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 18:44:21 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D515C061757
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 15:44:21 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id b17so400250ion.7
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 15:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3aI3GYQ8yCVJYE2jDTBDvoVmD6exr+CyvcwBd7jUGj4=;
        b=I2tyLF5tOSbc3/gUUps856aJrJA2JazzNCPVe0EHbe6TJdQB5bteyeeDWbcy4l7y7S
         v5nkUaRWh7R4l8kCEDYMPUqEfAszf9AhupjWCrDcfE9RIkUgy90qlnTEFBDdP4gLzcdN
         6AgetYGayDjh52fOUxhWCZ01DdeJbh4HpEOLaV50wi93lJ7apWVZmlNTnWXMihEA4F+Y
         cRc6uNOIKqi/Tjw/32pMY7pkp+px+vv429SEzKYAiXhJ69WEK9xJAHpXnwpr4NICpPO2
         Oq/JEz8LhEa575ogZ/1yXGg4+Q9f3g9Bei/mr/MHhGtlUi2ilOQVXvC18IiPu2PRaTl/
         iOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3aI3GYQ8yCVJYE2jDTBDvoVmD6exr+CyvcwBd7jUGj4=;
        b=tAhTWWTgFUTQzG085b1S++AC8m1zCoVFADr+Korqvt2oasWubUcj5Md0D+upCs8zWa
         E5QNEpxK96i0etz1lSvjJlDeb8XCW7LMwqeYsjbA4irU0BPAGJQGrfrC71we48JGRHzq
         lwpgqOfBoEuQAh1gry3s+XpndoJ8WKF7o7ax5DEWWSoV1f63QWDzuTtAqvxSSWBCIhph
         PqZb+ZjldVFVC49XQIrS/laG/2IOVSFtBprsvHORLHJXnT5RR2Tb/VXyV37cpMlQ9p7m
         HGOAzl9Dw/BGJbHBoDB9OtKSALo3Hy4zs4kyoMXz09tcJUcEhG4XT57IOmz2QzGhdtIi
         VNxw==
X-Gm-Message-State: AOAM532qwhUMXIpD/DVjD+O+zOI5sZ2W1BNC4JiCzElekChzfir8OMya
        tkGqNhAP0N61iKM+E018lO0luaiA7C66GuKGeNlGPg==
X-Google-Smtp-Source: ABdhPJzhPYeraUsteKY/Vuc+QwNIWvBHTQTbcPFuwcWlHSICK2lAjmat4u6qYG6NNZdlR89aG1oI0KLodOfD/XRpZCI=
X-Received: by 2002:a02:730b:: with SMTP id y11mr595522jab.126.1597877060398;
 Wed, 19 Aug 2020 15:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <691510496a422023a2934d42b068493ed2d60ccc.1597720138.git.pcc@google.com>
 <CAMuHMdV9teGX8pJg5H6qYhAh=vB5D8wYddhcEyJBOGWPh_jfEQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV9teGX8pJg5H6qYhAh=vB5D8wYddhcEyJBOGWPh_jfEQ@mail.gmail.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Wed, 19 Aug 2020 15:44:08 -0700
Message-ID: <CAMn1gO4MKTgyYpL3eidW4nK2Ve1JcBRULHt2DFTZ6N59-GxrOw@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] arch: move SA_* definitions to generic headers
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        David Spickett <david.spickett@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Aug 19, 2020 at 12:14 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Peter,
>
> On Tue, Aug 18, 2020 at 5:39 AM Peter Collingbourne <pcc@google.com> wrote:
> > Most architectures with the exception of alpha, mips, parisc and
> > sparc use the same values for these flags. Move their definitions into
> > asm-generic/signal-defs.h and allow the architectures with non-standard
> > values to override them. Also, document the non-standard flag values
> > in order to make it easier to add new generic flags in the future.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
>
> Thanks for your patch!
>
> >  arch/m68k/include/uapi/asm/signal.h    | 24 -------------
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> > --- a/include/uapi/asm-generic/signal-defs.h
> > +++ b/include/uapi/asm-generic/signal-defs.h
> > @@ -4,6 +4,53 @@
> >
> >  #include <linux/compiler.h>
> >
> > +/*
> > + * SA_FLAGS values:
> > + *
> > + * SA_ONSTACK indicates that a registered stack_t will be used.
> > + * SA_RESTART flag to get restarting signals (which were the default long ago)
> > + * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
> > + * SA_RESETHAND clears the handler when the signal is delivered.
> > + * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
> > + * SA_NODEFER prevents the current signal from being masked in the handler.
>
> Perhaps the order should match the order of the definitions below?
> Then it becomes obvious SA_SIGINFO is not documented (it was on arm).

That makes sense. I'll copy the deleted arm comment for SA_SIGINFO here as well.

> > + *
> > + * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
> > + * Unix names RESETHAND and NODEFER respectively.
>
> I think moving this last comment below, just above the definitions of
> SA_NOMASK and SA_ONESHOT, would make this easier to read.
>
> > + */
> > +#ifndef SA_NOCLDSTOP
> > +#define SA_NOCLDSTOP   0x00000001
> > +#endif
> > +#ifndef SA_NOCLDWAIT
> > +#define SA_NOCLDWAIT   0x00000002
> > +#endif
> > +#ifndef SA_SIGINFO
> > +#define SA_SIGINFO     0x00000004
> > +#endif
> > +#ifndef SA_ONSTACK
> > +#define SA_ONSTACK     0x08000000
> > +#endif
> > +#ifndef SA_RESTART
> > +#define SA_RESTART     0x10000000
> > +#endif
> > +#ifndef SA_NODEFER
> > +#define SA_NODEFER     0x40000000
> > +#endif
> > +#ifndef SA_RESETHAND
> > +#define SA_RESETHAND   0x80000000
> > +#endif
> > +/*
> > + * The following bits are used in architecture-specific SA_* definitions and
> > + * should be avoided for new generic flags: 3, 4, 5, 6, 7, 8, 9, 16, 24, 25, 26.
>
> And I think this belongs to the previous comment block.

I put the comment block here to make it more likely that it will be
seen when adding new flags, but either location is fine with me.

Peter
