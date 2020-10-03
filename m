Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA07281FFF
	for <lists+linux-parisc@lfdr.de>; Sat,  3 Oct 2020 03:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbgJCBWZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 2 Oct 2020 21:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgJCBWZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 2 Oct 2020 21:22:25 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BB0C0613D0
        for <linux-parisc@vger.kernel.org>; Fri,  2 Oct 2020 18:22:25 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id c25so641461vkm.1
        for <linux-parisc@vger.kernel.org>; Fri, 02 Oct 2020 18:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VZI9Xl835nEC2XqUCSNgxqxidkn3YlGD9peBbQa9oXw=;
        b=qsSJYdUAHimwZQBgTrHJ7txu23tNh6fHHZfe5u3cAR3bNCicUJVqxLtrOHqJG4xRCL
         iXwseG2y2a23Josov/DTrH/M9oJtbYivsXVojsANZEoeNev5on3SRs4DLVi5btD4P2pT
         cknenvO79xT9Z1/eabXOl9HRM4YHf0vUnFeok5iYqOsmhDxjZXdJXoJyD7jKFOqxaRnZ
         6XFBni06vThmc/fl751++cCNrpwdng/bvLsA8OxYHQnDoDaZeIltrkrO6tbOWygi0ksU
         9qsORd8CyfmNy+7Yxc0a2oS7J1aMekXR5c8Fj4dWKbxSBH6/OJZwI7j1BkbBxnPeqkVp
         EscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VZI9Xl835nEC2XqUCSNgxqxidkn3YlGD9peBbQa9oXw=;
        b=pryadnz8jW7aK3b+YIEaCIojbJYtmPIjIRSzmGvm/d8scG0mQGUibXd2b/sG1GzOIV
         ST9eA+wniBULk4RBC0F8KVIxXwUkfZfyCHtZ+DWz6dDPgykIsGiB5cqK49dvUjN5kabJ
         O7htwJdkNyTNlQy8Rw5rckwyVrPenowbFw/2nIQ+MM2d2oF3zEisrWl16GoURCModpAB
         +OknrrLwWo125JV3fcpPhBkDgCkNrIr4jP0VaPbsfLo43LH6wR7v4dxrQcD3tRCP9AUl
         Y/YwwqKJVkv4ziHb2Mguoa/7o+xjZ6w0ma9O1bl5UKXhQSS5ASKlhVZpmis1i8ESIei8
         FOYQ==
X-Gm-Message-State: AOAM532/n+NV3YLRAeU2CgfMAvcZ6Lc+KuzdPf/m03ny3EnfT1a+LU3D
        2CFMbpCnYHQvuVC/fg9RpnWfx1KndE0r4qsXdCDezA==
X-Google-Smtp-Source: ABdhPJzrekfMRdALEaBaTpjIGqzv4GVRajdkCdpE455fCCMoKFveAbHqRMOQy7C9FaZouxg6AudaykFJa83+AWU7Seo=
X-Received: by 2002:a1f:1f15:: with SMTP id f21mr2661286vkf.12.1601688144043;
 Fri, 02 Oct 2020 18:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598072840.git.pcc@google.com> <efdbcb5fc45a2dbdf1e2363d68ab0f7b5a276980.1598072840.git.pcc@google.com>
 <c83eeeff-ae86-14e0-a8a4-bcf71e5acb5a@gmx.de>
In-Reply-To: <c83eeeff-ae86-14e0-a8a4-bcf71e5acb5a@gmx.de>
From:   Peter Collingbourne <pcc@google.com>
Date:   Fri, 2 Oct 2020 18:22:13 -0700
Message-ID: <CAMn1gO7-MQbdYaOFtW1Oc8mBmgPyuT=0CfuD50jNQ8ysMrp5OA@mail.gmail.com>
Subject: Re: [PATCH v10 1/7] parisc: start using signal-defs.h
To:     Helge Deller <deller@gmx.de>
Cc:     "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Richard Henderson <rth@twiddle.net>,
        Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, Aug 30, 2020 at 10:07 AM Helge Deller <deller@gmx.de> wrote:
>
> On 22.08.20 07:10, Peter Collingbourne wrote:
> > We currently include signal-defs.h on all architectures except parisc.
> > Make parisc fall in line. This will make maintenance easier once the
> > flag bits are moved here.
>
> The patch is basically OK, but....
>
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > View this change in Gerrit: https://linux-review.googlesource.com/q/If03a5135fb514fe96548fb74610e6c3586a04064
> >
> >  arch/parisc/include/uapi/asm/signal.h  | 9 +--------
> >  include/uapi/asm-generic/signal-defs.h | 6 ++++++
> >  2 files changed, 7 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/uapi/asm/signal.h
> > index d38563a394f2..92a1c7ea44b4 100644
> > --- a/arch/parisc/include/uapi/asm/signal.h
> > +++ b/arch/parisc/include/uapi/asm/signal.h
> > @@ -69,14 +69,7 @@
> >  #define MINSIGSTKSZ  2048
> >  #define SIGSTKSZ     8192
> >
> > -
> > -#define SIG_BLOCK          0 /* for blocking signals */
> > -#define SIG_UNBLOCK        1 /* for unblocking signals */
> > -#define SIG_SETMASK        2 /* for setting the signal mask */
> > -
> > -#define SIG_DFL      ((__sighandler_t)0)     /* default signal handling */
> > -#define SIG_IGN      ((__sighandler_t)1)     /* ignore signal */
> > -#define SIG_ERR      ((__sighandler_t)-1)    /* error return from signal */
> > +#include <asm/signal-defs.h>
> >
> >  # ifndef __ASSEMBLY__
> >
> > diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
> > index e9304c95ceea..ecdf6312bfa5 100644
> > --- a/include/uapi/asm-generic/signal-defs.h
> > +++ b/include/uapi/asm-generic/signal-defs.h
> > @@ -15,8 +15,14 @@
> >  #endif
> >
> >  #ifndef __ASSEMBLY__
>
> > +#ifndef __hppa__
> > +/*
> > + * These have a special definition on parisc, see:
> > + * arch/parisc/include/uapi/asm/signal.h
> > + */
> >  typedef void __signalfn_t(int);
> >  typedef __signalfn_t __user *__sighandler_t;
>
> please drop this special-case/#ifdef for hppa/parisc.
> Instead please drop the typedef in arch/parisc/include/uapi/asm/signal.h,
> same as you did for the other architectures.
>
> I've committed this patch to my tree, which will collide with yours:
>  https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next
> If you like I can drop mine, and you fix it up on your side.
> Just let me know.
>
> Other than that you can add:
> Acked-by: Helge Deller <deller@gmx.de>
>
> Thanks!

Thanks for the review and apologies for the delay in getting back to
you. I've picked up your patch from your for-next branch into my
series before this change, and removed the special case for hppa. I
also build tested my series on hppa which revealed a typo in the
#include directive which I fixed. The new patch looks like this and it
will be included in v11 which I will try to send out soon.

diff --git a/arch/parisc/include/uapi/asm/signal.h
b/arch/parisc/include/uapi/asm/signal.h
index f1fd4fa880d7..e67b1bfb82ba 100644
--- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -69,14 +69,7 @@
 #define MINSIGSTKSZ    2048
 #define SIGSTKSZ       8192

-
-#define SIG_BLOCK          0   /* for blocking signals */
-#define SIG_UNBLOCK        1   /* for unblocking signals */
-#define SIG_SETMASK        2   /* for setting the signal mask */
-
-#define SIG_DFL        ((__sighandler_t)0)     /* default signal handling */
-#define SIG_IGN        ((__sighandler_t)1)     /* ignore signal */
-#define SIG_ERR        ((__sighandler_t)-1)    /* error return from signal */
+#include <asm-generic/signal-defs.h>

 # ifndef __ASSEMBLY__

@@ -85,10 +78,6 @@
 /* Avoid too many header ordering problems.  */
 struct siginfo;

-/* Type of a signal handler.  */
-typedef void __signalfn_t(int);
-typedef __signalfn_t __user *__sighandler_t;
-
 typedef struct sigaltstack {
        void __user *ss_sp;
        int ss_flags;

Peter
