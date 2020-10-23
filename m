Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A91E296C08
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 11:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461419AbgJWJYs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 05:24:48 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36077 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S461413AbgJWJYs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 05:24:48 -0400
Received: by mail-ot1-f65.google.com with SMTP id 32so735998otm.3;
        Fri, 23 Oct 2020 02:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zc+AeQKYu0eA1NCCr9Ea0RhGk/czUMV0vr6kVFJGHw0=;
        b=svL8bMrhDiYdFU+nFRtfqmOTeNEsuLToWpA+nHPR5eeAcE7vAK9E0lqS+vuiZ6CrWN
         PBQnXJ1Ri/xnY6yWeDoDwod69OLYqXUn4oD+B7/fozdJydzRwv+Zc/21rTv/pmxgvuJO
         NE3sE3Qtew4RgCkawyh0mwvmHIqGwUTdmFJDMnPqYnFHHV/6dnTEr6Y3KyQuqk2bX9yG
         x7al8CTEqWpgv4ghMJABLurkaPz1HG1CFbmeezoY5QzmFB6hvFaMkAAkxyDRHQFKcQx4
         +dhlY7GLWB5uBcsb1GRz/M0rStunz4sVTfb26bvaifJyanZEaB6+kr43EcHMY3khCPx1
         a1SQ==
X-Gm-Message-State: AOAM533HcoD//sSkCHkQJXswjFpctjlDUp88eJeC1UFKkz9VVlgu3ZAT
        sKqT5MxLYtDs9UKuhQRUhfo0eRav94ezvAFWrio=
X-Google-Smtp-Source: ABdhPJxehtfOoAm+qzRUkw5mm184UYL/qN+HgKHa1e9IqAJmQlfvEJk1yo1vlYOgf9p2GgsKSFaJDrnAsY04iiRnVFk=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr904469otb.250.1603445087314;
 Fri, 23 Oct 2020 02:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-14-arnd@arndb.de>
 <alpine.LNX.2.23.453.2010091900150.12@nippy.intranet> <CAK8P3a3rM7gJjdTtcKzr6yi15n6xs-yhEpmSOf3QHfahQwxqkw@mail.gmail.com>
 <alpine.LNX.2.23.453.2010150937430.16@nippy.intranet> <CAK8P3a3i6cum_9xGgsbxjXXvbRsP8Po5qLZ0Agb3c4gZTKC9GQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3i6cum_9xGgsbxjXXvbRsP8Po5qLZ0Agb3c4gZTKC9GQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Oct 2020 11:24:36 +0200
Message-ID: <CAMuHMdUyGH=ORa4yHivMeJZaGQ3kEXi1kr9=P+u1y3QQnC+-4g@mail.gmail.com>
Subject: Re: [RFC 13/13] m68k: mac: convert to generic clockevent
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Arnd,

On Fri, Oct 23, 2020 at 9:52 AM Arnd Bergmann <arnd@kernel.org> wrote:
> On Sun, Oct 18, 2020 at 2:55 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> > On Thu, 15 Oct 2020, Arnd Bergmann wrote:
> > > On Thu, Oct 15, 2020 at 3:19 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> > > > On Sat, 10 Oct 2020, Arnd Bergmann wrote:
> >
> > That configuration still produces the same 5 KiB of bloat. I see that
> > kernel/time/Kconfig has this --
> >
> > # Core internal switch. Selected by NO_HZ_COMMON / HIGH_RES_TIMERS. This is
> > # only related to the tick functionality. Oneshot clockevent devices
> > # are supported independent of this.
> > config TICK_ONESHOT
> >         bool
> >
> > But my question was really about both kinds of dead code (oneshot device
> > support and oneshot tick support). Anyway, after playing with the code for
> > a bit I don't see any easy way to reduce the growth in text size.
>
> Did you look more deeply into where those 5KB are? Is this just
> the code in kernel/time/{clockevents,tick-common}.c and the
> added platform specific bits, or is there something more?
> I suppose the sysfs interface and the clockevents_update_freq()
> logic are not really needed on m68k, but it wouldn't make much
> sense to split those out either.
>
> How does the 5KB bloat compare to the average bloat we get
> from one release to the next? Geert has been collecting statistics
> for this.

It would be a fair share of the typical increase of ca. 30 KiB per
kernel release. Still, it would be lost in the noise of the increase for
v5.10-rc1:

    add/remove: 1200/455 grow/shrink: 1419/821 up/down: 468970/-93714 (375256)
    Function                                     old     new   delta
    _printk_rb_static_infos                        -  180224 +180224
    write_buf                                   8192   32768  +24576
    _printk_rb_static_descs                        -   24576  +24576
    HUF_decompress4X4_usingDTable_internal         -    5664   +5664
    HUF_decompress4X2_usingDTable_internal         -    5006   +5006
    __ext4_ioctl                                   -    4774   +4774
    sock_ops_convert_ctx_access                 3840    8462   +4622
    ZSTD_decompressSequences                       -    3100   +3100

> > > The arm/rpc timer seems to be roughly in the same category as most of
> > > the m68k ones or the i8253 counter on a PC. It's possible that some of
> > > them could use the same logic as drivers/clocksource/i8253.o as long as
> > > there is any hardware oneshot mode.
> >
> > There appear to be 15 platforms in that category. 4 have no clocksource
> > besides the jiffies clocksource, meaning there's no practical alternative
> > to using a periodic tick, like you did in your RFC patch:
> >
> > arch/m68k/apollo/config.c
> > arch/m68k/q40/q40ints.c
> > arch/m68k/sun3/sun3ints.c
> > arch/m68k/sun3x/time.c
>
> Do any of these have users? I'm fairly sure sun3x has never worked in mainline,
> sun3 seems to still need the same few patches it did 20 years ago. I
> couldn't find
> much about Linux on Apollo or q40, the information on the web for either
> of them seems to all be for linux-2.4 kernels.

They probably don't have any users.
AFAIK, the only users are the usual triumvirate of amiga/atari/mac
(and perhaps the fleet of VME boards in the Australian navy? ;)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
