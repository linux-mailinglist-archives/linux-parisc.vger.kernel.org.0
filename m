Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E81E917BF8A
	for <lists+linux-parisc@lfdr.de>; Fri,  6 Mar 2020 14:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCFNts (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 6 Mar 2020 08:49:48 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33111 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgCFNts (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 6 Mar 2020 08:49:48 -0500
Received: by mail-oi1-f195.google.com with SMTP id q81so2606552oig.0;
        Fri, 06 Mar 2020 05:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=45pGa+uCD/7A+VRC5UUzYpdjCzztyUtq5sWde7kE5BE=;
        b=SPUstaSRdEtndXhHkYgn+J4ma85k+P27H1W5+GNPjs9r2K2UZj/zPTpnlUiTU2a7e3
         B8hnPGyPV/un58qdVTZgwb1JbCAdhzjzZyQcvq4oo5VmYTwoBhX4wRCKVxJu8pt2XxqG
         eZ9A7i/tLRhesUWa2c1vrn2roS56/3R2lE9gAiV0rEvclVnnGftcCFC9hya5NJRsTHde
         8jtkQMCc8uV03RGhev4JuetVLwUZgWgsobHgGuqi48AzUWrRganIS0EDbzSl9Q770Mfg
         K4v4na0keAhBYsvrLd5G36o+CfYUymuA54pLo++4n0k0M7Etya5Ttkz00kEe+GsVo/Ka
         2YMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=45pGa+uCD/7A+VRC5UUzYpdjCzztyUtq5sWde7kE5BE=;
        b=JHTW1GtKF89diAtAkJ+hIPTL/WWOf7YF4jW71z9eyydx8/i3i/6x4O6FjgHl+ynZ9P
         XVGpFwXP8lhMiriufCQLLtycMvRwytMIlz6CmQdA9wfaj1soVDbzMDLZtVYh+ernPFwu
         qYqiFNS+OrE4OOApcvY2qm5YximnKIsCLYH5bNazR7hNnQxtQT5JcZQYTugP63ekt/os
         jZi2xYTdwhr53H4VNW4LoFgV7eX/fakR7xbIeyLILBvnLTyhc3dD+rjug6jpnk06CezW
         g9o6poEgYNAA7scU2axtFlicMpqAq4LZr6FkCoiW6HOXp0lB59HXCssEgglmqIUbwWZV
         8bwA==
X-Gm-Message-State: ANhLgQ0ljArkGibIBqUp4tcqzRokpEuPiEiNJAk5pVh4+iTAZa+EqsHF
        uVp3ACFZ17M7TlUDJsEddADpjsRnnmJQs0CDe1g=
X-Google-Smtp-Source: ADFU+vs4xHd7rTx2opUFkFVCwj8ZpvGJ9ZRefEzlYdiIX9gkGR0/gUhT+AA4BxU5cWc4vmNOrYjuH8oNmDyx9ekK7lE=
X-Received: by 2002:aca:f12:: with SMTP id 18mr2601690oip.126.1583502587496;
 Fri, 06 Mar 2020 05:49:47 -0800 (PST)
MIME-Version: 1.0
References: <69fb1d36-b6cf-7c46-96d1-9403de6ab47a@infradead.org>
 <cover.1582878393.git.joe@perches.com> <d03d6ce4-f40e-2905-1641-089a82720383@infradead.org>
 <3b5e2c9f59b8296af3992c5d979d4c4dae05244d.camel@perches.com>
In-Reply-To: <3b5e2c9f59b8296af3992c5d979d4c4dae05244d.camel@perches.com>
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date:   Fri, 6 Mar 2020 13:49:11 +0000
Message-ID: <CADVatmPwa+Ey-jrwZyQ4cgTX962ue1qDJxJc4PG=DoU5gVtJtw@mail.gmail.com>
Subject: Re: [PATCH 0/7] parport: Use generic kernel logging styles
To:     Joe Perches <joe@perches.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Feb 29, 2020 at 7:35 PM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2020-02-29 at 08:40 -0800, Randy Dunlap wrote:
> > On 2/28/20 12:32 AM, Joe Perches wrote:
> > > Well, if the parport logging is getting some generic fixing,
> > > here's some more generic logging fixing...
> > >
> > > Joe Perches (7):
> > >   parport: Convert printk(KERN_<LEVEL> to pr_<level>(
> > >   parport: Use more comon logging styles
> > >   parport: daisy: Convert DPRINTK to pr_debug
> > >   parport_amiga: Convert DPRINTK to pr_debug
> > >   parport_mfc3: Convert DPRINTK to pr_debug
> > >   parport_pc: Convert DPRINTK to pr_debug
> > >   parport: Standardize use of printmode
> >
> > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>
> btw: Sudip
>
> After this recent daisy change:
> ---------------------------------------------------------------------
>
> commit 60f8a59ddcdc7fb7c17180ba10d9c49bc91156c7
> Author: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Date:   Wed Oct 16 15:45:40 2019 +0100
>
>     parport: daisy: use new parport device model
>
>     Modify parport daisy driver to use the new parallel port device model.
>
>     Last attempt was '1aec4211204d ("parport: daisy: use new parport device
>     model")' which failed as daisy was also trying to load the low level
>     driver and that resulted in a deadlock.
>
> ---------------------------------------------------------------------
>
> parport_register_device is no longer in use and
> parport_register_dev_model is used instead.

Yes, I will do the cleanup, if you have not done that already. ;-)
This last change was done after a failed attempt where the previous
change had to be reverted by Linus for a regression.
So, just thought it to be safe to wait for a cycle for any regression
report before I remove the last bits.


-- 
Regards
Sudip
