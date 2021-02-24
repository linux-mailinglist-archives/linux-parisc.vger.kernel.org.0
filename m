Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21D632457A
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Feb 2021 21:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhBXUzI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 24 Feb 2021 15:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhBXUzI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 24 Feb 2021 15:55:08 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB48C061574
        for <linux-parisc@vger.kernel.org>; Wed, 24 Feb 2021 12:54:28 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id t15so1185623ual.6
        for <linux-parisc@vger.kernel.org>; Wed, 24 Feb 2021 12:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LLIfyeFIub3muB/CP7Hm2VoepJyVW4tHjdnBCk4yhLg=;
        b=ollMcONV3bdQ14QYtVBWt6OyYXIP4whd8nwR5FrAAoQprgeHlmN1Lh632mEYtxVBSI
         G4+0oh8aEKmX6WHRxZ/cD3de2wT6ITxtYGBJRwApyx5JOWST1pJvimvC7kIIEcRmJIhX
         cxWpev8Q9LWPytWtDWk5kkB7hijixTdqVkP5KuyaHMKZiVa/Quydp+bZJyfzHOEo3S0y
         10d7fNSsZkyAahwGnT4i6pWEhNAUdZpnmNn9XiLqYORRONogk6w8ca+FtsbgpAxmHru+
         GjzVvfuqXIq5M68x+natPnOzaLGwVMOrCilUbMYcEktclLWM0NLBY34qeQmJ/lQ8dJzi
         lEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LLIfyeFIub3muB/CP7Hm2VoepJyVW4tHjdnBCk4yhLg=;
        b=opREDrzdBbq5+HXkyV4uLRgiy0QC+Qja4C2cjHPzRUYsBPYrZ3DCC44Lj4YPAP8gZl
         M91Fp0kwlkJFZdAjzI74vu3t00WiEhldFRCto8b6hYy9a/6Jn3ptf/OX4V8NjWEQADV9
         pgTGBlb3pVJgz4Xp+/BKfufZgl/58AolC2qj+ABuQylzqJYM6JOS5oua/38zXQ7DIFu9
         9kI1kSxIBAioG7h9XF2b7xP1+B9I1BWbRTFQ4lMZxfj/2GZ+syAm+9u+UzT+/tnvWUxS
         mt3S5ZgnCrN/mPe2pTpsmSa5VrT+SAOXqHa8n3/Pnz/AgiTQXB6YuZNPXFOkvFkDD9+g
         EVJA==
X-Gm-Message-State: AOAM531KmLnWq3gHaVNAKihjJj1ViVXWDOziSmqOjwBb4qXqh7ER4Dun
        nYaq8HaMTgnIlCsyp9y/J1+C8EVgwZJEl1FD6ySI5A==
X-Google-Smtp-Source: ABdhPJwDkAZHxqTqNM1na6tlHBSoIcFQFsNIy4TN5WNwBY+1hn1Ea0NqgKnjX2WoQcdN6Tf/Ph1uK9pKsYI+hEdPksc=
X-Received: by 2002:a9f:2021:: with SMTP id 30mr11157082uam.66.1614200066849;
 Wed, 24 Feb 2021 12:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20201211184633.3213045-1-samitolvanen@google.com>
 <20201211184633.3213045-2-samitolvanen@google.com> <20210224201723.GA69309@roeck-us.net>
 <202102241238.93BC4DCF@keescook>
In-Reply-To: <202102241238.93BC4DCF@keescook>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Wed, 24 Feb 2021 12:54:15 -0800
Message-ID: <CABCJKufph4se58eiJNSJUd3ASBgbJGmL2e3wg4Jwo4Bi2UxP=Q@mail.gmail.com>
Subject: Re: [PATCH v9 01/16] tracing: move function tracer options to Kconfig
 (causing parisc build failures)
To:     Kees Cook <keescook@chromium.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>, linux-parisc@vger.kernel.org,
        Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Feb 24, 2021 at 12:38 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Feb 24, 2021 at 12:17:23PM -0800, Guenter Roeck wrote:
> > On Fri, Dec 11, 2020 at 10:46:18AM -0800, Sami Tolvanen wrote:
> > > Move function tracer options to Kconfig to make it easier to add
> > > new methods for generating __mcount_loc, and to make the options
> > > available also when building kernel modules.
> > >
> > > Note that FTRACE_MCOUNT_USE_* options are updated on rebuild and
> > > therefore, work even if the .config was generated in a different
> > > environment.
> > >
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> >
> > With this patch in place, parisc:allmodconfig no longer builds.
> >
> > Error log:
> > Arch parisc is not supported with CONFIG_FTRACE_MCOUNT_RECORD at scripts/recordmcount.pl line 405.
> > make[2]: *** [scripts/mod/empty.o] Error 2
> >
> > Due to this problem, CONFIG_FTRACE_MCOUNT_RECORD can no longer be
> > enabled in parisc builds. Since that is auto-selected by DYNAMIC_FTRACE,
> > DYNAMIC_FTRACE can no longer be enabled, and with it everything that
> > depends on it.
>
> Ew. Any idea why this didn't show up while it was in linux-next?

Does anyone build parisc allmodconfig from -next?

parisc seems to always use -fpatchable-function-entry with dynamic
ftrace, so we just need to select
FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY to stop it from defaulting
to recordmcount:

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index ecef9aff9d72..9ee806f68123 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -60,6 +60,7 @@ config PARISC
        select HAVE_KPROBES
        select HAVE_KRETPROBES
        select HAVE_DYNAMIC_FTRACE if
$(cc-option,-fpatchable-function-entry=1,1)
+       select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if HAVE_DYNAMIC_FTRACE
        select HAVE_FTRACE_MCOUNT_RECORD if HAVE_DYNAMIC_FTRACE
        select HAVE_KPROBES_ON_FTRACE
        select HAVE_DYNAMIC_FTRACE_WITH_REGS

I'll send a proper patch shortly.

Sami
