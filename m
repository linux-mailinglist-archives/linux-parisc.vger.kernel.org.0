Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0573D5190FB
	for <lists+linux-parisc@lfdr.de>; Wed,  4 May 2022 00:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243178AbiECWBK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 3 May 2022 18:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbiECWBJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 3 May 2022 18:01:09 -0400
Received: from mail-oa1-x41.google.com (mail-oa1-x41.google.com [IPv6:2001:4860:4864:20::41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF9A42499
        for <linux-parisc@vger.kernel.org>; Tue,  3 May 2022 14:57:35 -0700 (PDT)
Received: by mail-oa1-x41.google.com with SMTP id 586e51a60fabf-deb9295679so18559471fac.6
        for <linux-parisc@vger.kernel.org>; Tue, 03 May 2022 14:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=czLZHU7MG6H1spBLHXY5jaZbzV59tXkMuN+Ck8Z7wc4=;
        b=hhWjsHnmVba6J3iaRJaO09nZL4LxjIq8C9W91LOfNC4XgTIwgTHymewopsSR7xhrbE
         wJfMPDofFT9Orm5X1Xmnq6csdeG70AmAjQHsJ6oidSvnu+c5NqT0zTpfwvGt6c7imJaY
         Yx4JIofQGY7s+yKOtcqFuF1p2zpjcELmsl0YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=czLZHU7MG6H1spBLHXY5jaZbzV59tXkMuN+Ck8Z7wc4=;
        b=UoRitnbPkkP6hdbvJHykoTjC2RJlXNHtAje1hgxKyVxt1W5sa1qxDvv8fBcuQDk8uq
         3qFIDlIiI4Tf5v8L0o3GEPNV3dezJd8DtDUp1Fnhh2vEPvqqMCAsgURbS8Tx0wiI4h86
         JdABfasG3b75HJai9p5xy5MHoqVeIFjhnDfMfEZpQB6oboQ7+dDoFjJcoWC6Um3YVGkA
         ylBwM8phzRvfYygyFxkb6i8dBMIZHeaJKG+L9jpRnqoUbp2wiBrJRum8wLLcV0zwINTt
         SBxd7dETMy8jFOKlATd7sZL0t6pXh7+4HsbzoxyiqD8+OGKgb+I6hUl8ck3sEq+95Q3B
         TOLg==
X-Gm-Message-State: AOAM530h/TsA7F+I9Q0SnOkIAyqH2uFieCjXr1G8tdDKco6kIDHajNRa
        NIwWXoFGf2VKQqxbJ89unpFm2Vdk3ef/MQ==
X-Google-Smtp-Source: ABdhPJypw3W2Om1apt4GOc3H0KnRF7Y3KOYgAMfqnMdqG5lYQa71jHwBYtWXhOlV7KErmzZMOntqrA==
X-Received: by 2002:a05:6870:14ca:b0:e3:17c9:cba3 with SMTP id l10-20020a05687014ca00b000e317c9cba3mr2579282oab.111.1651615055048;
        Tue, 03 May 2022 14:57:35 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id g6-20020a056830160600b0060603221266sm4418427otr.54.2022.05.03.14.57.34
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 14:57:34 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id m11so19558144oib.11
        for <linux-parisc@vger.kernel.org>; Tue, 03 May 2022 14:57:34 -0700 (PDT)
X-Received: by 2002:a05:6808:219a:b0:325:93fc:e0fd with SMTP id
 be26-20020a056808219a00b0032593fce0fdmr2775646oib.241.1651615054192; Tue, 03
 May 2022 14:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224924.592546-1-gpiccoli@igalia.com> <20220427224924.592546-5-gpiccoli@igalia.com>
 <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com> <adcf6d0e-c37c-6ede-479e-29959d03d8c0@igalia.com>
In-Reply-To: <adcf6d0e-c37c-6ede-479e-29959d03d8c0@igalia.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 3 May 2022 14:56:58 -0700
X-Gmail-Original-Message-ID: <CAE=gft623NxqetRssrZnaRmJLSP4BT5=-sVVwtYoHuspO_gULQ@mail.gmail.com>
Message-ID: <CAE=gft623NxqetRssrZnaRmJLSP4BT5=-sVVwtYoHuspO_gULQ@mail.gmail.com>
Subject: Re: [PATCH 04/30] firmware: google: Convert regular spinlock into
 trylock on panic path
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, bhe@redhat.com,
        pmladek@suse.com, kexec@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, Linux PM <linux-pm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
        linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net,
        halves@canonical.com, fabiomirmar@gmail.com,
        alejandro.j.jimenez@oracle.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Jonathan Corbet <corbet@lwn.net>, d.hatayama@jp.fujitsu.com,
        dave.hansen@linux.intel.com, dyoung@redhat.com,
        feng.tang@intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com,
        jgross@suse.com, john.ogness@linutronix.de,
        Kees Cook <keescook@chromium.org>, luto@kernel.org,
        mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
        peterz@infradead.org, rostedt@goodmis.org,
        senozhatsky@chromium.org, Alan Stern <stern@rowland.harvard.edu>,
        Thomas Gleixner <tglx@linutronix.de>, vgoyal@redhat.com,
        vkuznets@redhat.com, Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        David Gow <davidgow@google.com>,
        Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Guilherme,

On Tue, May 3, 2022 at 12:12 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> On 03/05/2022 15:03, Evan Green wrote:
> > [...]
> > gsmi_shutdown_reason() is a common function called in other scenarios
> > as well, like reboot and thermal trip, where it may still make sense
> > to wait to acquire a spinlock. Maybe we should add a parameter to
> > gsmi_shutdown_reason() so that you can get your change on panic, but
> > we don't convert other callbacks into try-fail scenarios causing us to
> > miss logs.
> >
>
> Hi Evan, thanks for your feedback, much appreciated!
> What I've done in other cases like this was to have a helper checking
> the spinlock in the panic notifier - if we can acquire that, go ahead
> but if not, bail out. For a proper example of an implementation, check
> patch 13 of the series:
> https://lore.kernel.org/lkml/20220427224924.592546-14-gpiccoli@igalia.com/ .
>
> Do you agree with that, or prefer really a parameter in
> gsmi_shutdown_reason() ? I'll follow your choice =)

I'm fine with either, thanks for the link. Mostly I want to make sure
other paths to gsmi_shutdown_reason() aren't also converted to a try.

>
>
> > Though thinking more about it, is this really a Good Change (TM)? The
> > spinlock itself already disables interrupts, meaning the only case
> > where this change makes a difference is if the panic happens from
> > within the function that grabbed the spinlock (in which case the
> > callback is also likely to panic), or in an NMI that panics within
> > that window. The downside of this change is that if one core was
> > politely working through an event with the lock held, and another core
> > panics, we now might lose the panic log, even though it probably would
> > have gone through fine assuming the other core has a chance to
> > continue.
>
> My feeling is that this is a good change, indeed - a lot of places are
> getting changed like this, in this series.
>
> Reasoning: the problem with your example is that, by default, secondary
> CPUs are disabled in the panic path, through an IPI mechanism. IPIs take
> precedence and interrupt the work in these CPUs, effectively
> interrupting the "polite work" with the lock held heh

The IPI can only interrupt a CPU with irqs disabled if the IPI is an
NMI. I haven't looked before to see if we use NMI IPIs to corral the
other CPUs on panic. On x86, I grepped my way down to
native_stop_other_cpus(), which looks like it does a normal IPI, waits
1 second, then does an NMI IPI. So, if a secondary CPU has the lock
held, on x86 it has roughly 1s to finish what it's doing and re-enable
interrupts before smp_send_stop() brings the NMI hammer down. I think
this should be more than enough time for the secondary CPU to get out
and release the lock.

So then it makes sense to me that you're fixing cases where we
panicked with the lock held, or hung with the lock held. Given the 1
second grace period x86 gives us, I'm on board, as that helps mitigate
the risk that we bailed out early with the try and should have spun a
bit longer instead. Thanks.

-Evan

>
> Then, such CPU is put to sleep and we finally reach the panic notifier
> hereby discussed, in the main CPU. If the other CPU was shut-off *with
> the lock held*, it's never finishing such work, so the lock is never to
> be released. Conclusion: the spinlock can't be acquired, hence we broke
> the machine (which is already broken, given it's panic) in the path of
> this notifier.
> This should be really rare, but..possible. So I think we should protect
> against this scenario.
>
> We can grab others' feedback if you prefer, and of course you have the
> rights to refuse this change in the gsmi code, but from my
> point-of-view, I don't see any advantage in just assume the risk,
> specially since the change is very very simple.
>
> Cheers,
>
>
> Guilherme
