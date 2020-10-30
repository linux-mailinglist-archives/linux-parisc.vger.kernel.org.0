Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B2129F9E4
	for <lists+linux-parisc@lfdr.de>; Fri, 30 Oct 2020 01:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgJ3Ami (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 29 Oct 2020 20:42:38 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54046 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgJ3Ami (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 29 Oct 2020 20:42:38 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 55B4C2A441;
        Thu, 29 Oct 2020 20:41:36 -0400 (EDT)
Date:   Fri, 30 Oct 2020 11:41:36 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Arnd Bergmann <arnd@kernel.org>
cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
        linux-ia64@vger.kernel.org,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC 13/13] m68k: mac: convert to generic clockevent
In-Reply-To: <CAK8P3a3i6cum_9xGgsbxjXXvbRsP8Po5qLZ0Agb3c4gZTKC9GQ@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2010241025410.6@nippy.intranet>
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-14-arnd@arndb.de> <alpine.LNX.2.23.453.2010091900150.12@nippy.intranet> <CAK8P3a3rM7gJjdTtcKzr6yi15n6xs-yhEpmSOf3QHfahQwxqkw@mail.gmail.com> <alpine.LNX.2.23.453.2010150937430.16@nippy.intranet>
 <CAK8P3a3i6cum_9xGgsbxjXXvbRsP8Po5qLZ0Agb3c4gZTKC9GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 23 Oct 2020, Arnd Bergmann wrote:

> On Sun, Oct 18, 2020 at 2:55 AM Finn Thain <fthain@telegraphics.com.au>  wrote:
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
> > But my question was really about both kinds of dead code (oneshot 
> > device support and oneshot tick support). Anyway, after playing with 
> > the code for a bit I don't see any easy way to reduce the growth in 
> > text size.
> 
> Did you look more deeply into where those 5KB are? Is this just the code 
> in kernel/time/{clockevents,tick-common}.c and the added platform 
> specific bits, or is there something more?

What I did was to list the relevant functions using scripts/bloat-o-meter 
and tried stubbing out some code related to oneshot clockevent devices. I 
didn't find any low fruit and don't plan to pursue that without the help 
of LTO.

> I suppose the sysfs interface and the clockevents_update_freq() logic 
> are not really needed on m68k, but it wouldn't make much sense to split 
> those out either.
> 
> How does the 5KB bloat compare to the average bloat we get from one 
> release to the next? Geert has been collecting statistics for this.
> 

Perhaps that 5 KB is justified by gaining the hrtimers feature... hard to 
say; it's never been available on these platforms. I can see the value in 
it though.

> > > Yes, makes sense. I think the one remaining problem with the 
> > > periodic mode in this driver is that it can drop timer ticks when 
> > > interrupts are disabled for too long, while in oneshot mode there 
> > > may be a way to know how much time has passed since the last tick as 
> > > long as the counter does not overflow.
> >
> > Is there any benefit from adopting a oneshot tick (rather than 
> > periodic) if no clocksource is consulted when calculating the next 
> > interval? (I'm assuming NO_HZ is not in use, for reasons discussed 
> > below.)
> 
> If the clocksource does not set CLOCK_SOURCE_IS_CONTINOUS, the kernel 
> will keep using periodic timers and not allow hrtimers.
> 

IIUC, when HIGH_RES_TIMERS=y, the kernel will enable hrtimers only if the 
platform provides both a continuous clocksource device and a oneshot 
clockevent device. However, the "jiffies" clocksource does not set 
CLOCK_SOURCE_IS_CONTINOUS and neither does the one in 
arch/arm/mach-rpc/time.c.

When HIGH_RES_TIMERS=n and NO_HZ_COMMON=n (which is presently the case for 
all platforms with GENERIC_CLOCKEVENTS=n) there's no use for a oneshot 
clockevent device, right?

It seems likely that NO_HZ_COMMON=n because the clocksources on these 
platforms produce a periodic interrupt regardless (e.g. 
clocksource/i8253.c, arm/rpc, m68k platform timers etc.).

Finally, HIGH_RES_TIMERS=n seems likely if the only clocksource is 
unreliable (e.g. because it loses time due to interrupt priorities). There 
may be a few of platforms in this category (Mac, Atari?).

> > > I would agree that despite this oneshot mode is probably worse 
> > > overall for timekeeping if the register accesses introduce 
> > > systematic errors.
> > >
> >
> > It probably has to be tried. But consulting a VIA clocksource on every 
> > tick would be expensive on this platform, so if that was the only way 
> > to avoid cumulative errors, I'd probably just stick with the periodic 
> > tick.
> 
> I'm sure there is a tradeoff somewhere. Without hrtimers, some events 
> will take longer when they have to wait for the next tick, and using 
> NO_HZ_FULL can help help make things faster on some workloads.
> 

Yes, such a tradeoff is discussed in drivers/iio/adc/ep93xx_adc.c.

But OTOH, Documentation/timers/timers-howto.rst says,

    On slower systems, (embedded, OR perhaps a speed-stepped PC!) the 
    overhead of setting up the hrtimers for usleep *may* not be worth it

I guess it has to be tried.

> ...
> > The other 11 platforms in that category also have 'synthetic' 
> > clocksources derived from a timer reload interrupt. In 3 cases, the 
> > clocksource read method does not (or can not) check for a pending 
> > counter reload interrupt. For these also, I see no practical 
> > alternative to the approach you've taken in your RFC patch:
> >
> > arch/m68k/68000/timers.c
> > arch/m68k/atari/time.c
> > arch/m68k/coldfire/timers.c
> 
> Agreed. It's possible there is a way, but I don't see one either.
> 

For arch/m68k/68000/timers.c, I suppose we may be able to check for the 
TMR1 bit in the Interrupt Status Register at 0xFFFFF30C or the COMP bit in 
the Timer Status Register at 0xFFFFF60A. But testing that patch could be 
difficult.

I expect that equivalent flags are available in Coldfire registers, making 
it possible to improve upon mcftmr_read_clk() and m68328_read_clk() if 
need be -- that is, if it turns out that the clocksource interrupt was 
subject to higher priority IRQs that would slow down the clocksource or 
defeat its monotonicity.

The other difficulty is a lack of hardware timers. There's only one timer 
on MC68EZ328. On Atari, for now only Timer C is available though Michael 
has said that it would be possible to free up Timer D. Some Coldfire chips 
have only 2 timers and the second timer seems to be allocated to 
profiling.

> > That leaves 8 platforms that have reliable clocksource devices which 
> > should be able to provide an accurate reading even in the presence of 
> > a dropped tick (due to drivers disabling interrupts for too long):
> >
> > arch/arm/mach-rpc/time.c
> > arch/m68k/amiga/config.c
> > arch/m68k/bvme6000/config.c
> > arch/m68k/coldfire/sltimers.c
> > arch/m68k/hp300/time.c
> > arch/m68k/mac/via.c
> > arch/m68k/mvme147/config.c
> > arch/m68k/mvme16x/config.c
> >
> > But is there any reason to adopt a oneshot tick on any of these platforms,
> > if NO_HZ won't eliminate the timer interrupt that's needed to run a
> > 'synthetic' clocksource?
> 
> I would expect that these could be changed to behave more like 
> drivers/clocksource/i8253.c, which does support a clocksource in oneshot 
> mode.
> 

I think you meant to write, "... support a clockevent device in oneshot 
mode". I would agree.

Since Macs do have a spare hardware timer, I will attempt to convert 
arch/m68k/mac/via.c to a oneshot clockevent, using your 
GENERIC_CLOCKEVENTS patch series as a basis, and see what effect that has 
in the NO_HZ_COMMON=n, HIGH_RES_TIMERS=y case.

>      Arnd
> 
