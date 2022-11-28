Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D0263B41E
	for <lists+linux-parisc@lfdr.de>; Mon, 28 Nov 2022 22:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbiK1VYU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 28 Nov 2022 16:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbiK1VYT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 28 Nov 2022 16:24:19 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE0410FC3
        for <linux-parisc@vger.kernel.org>; Mon, 28 Nov 2022 13:24:18 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id s196so11119464pgs.3
        for <linux-parisc@vger.kernel.org>; Mon, 28 Nov 2022 13:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=golang-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9NBCbjseT6e+Shy1FdUuIkXAgUD9VMP0mwaLAPqsdlg=;
        b=F+Xli0MBh1du9HhjNLCpVhmFdZd/av3dIpf1JmCXxj5+tZfGqwlTs3oo3regqadulO
         0d6pKu9OXoQLk3/KuFmpo2EBLqj+PyrIce5SKdT0BgJ4ey2Srz9yQJdnlsXI1SGDQndy
         Mr5v1WUNuvm+P1L8N425UJCO5CcgGSZArpsyRUPCuPByJnTjFcRDLUeOUjOqTlieMW5C
         5T41Xq0vTPjT4bKAEDmlKXgkvwc5Nn94+7sWAH5jA0Bb9Alcoo9hHeGStMJ1Jf1Qe4cj
         15ITEJOKKLG6fUEHFJWwakBo8vIJ2w5fCTxlG6mTqCg1l0Asq+BRhWFOUg5nVtQU1drI
         R1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NBCbjseT6e+Shy1FdUuIkXAgUD9VMP0mwaLAPqsdlg=;
        b=bFILKpU3/xUQIqDwAwM+6UQdb3wvxWxy4nR4NmwWHVLNtDCFiSBpsWmE8PqvVPlk3t
         /5bq2mpwU/dt8+TbFTK1ZBNv9ka6PDhf/HZg9XG3Cm0HkaYJgoxeHzLiUkptX7PmAm/X
         YfXYd/iBJGSNnU9UmZF6qxnkHefq+WzQHbldd/i2w6QBk32DLm9iaTFNEDvsjdJ4NxbX
         lO7J4TSSPsbYBhdt5/GVk/hq73Ttkgz0w3SVxmTURmIjgMw9f/0H5zHwmgT71nfmAezg
         abkbRt5GGMurrvwMcHHRu0IfI3vGwEQpY/uV+BjBACtVnuSGWvFR1SS7q4lIWe26KRjC
         C7aw==
X-Gm-Message-State: ANoB5pkJbVzfpWhQt1od+o5afpmf5zJUreRw/+nwgaYxnsVXz9wJgoQ9
        hEZCDHBCh0tiDaP9Zn4iUhtblXDfymXfQG0ohtFLwg==
X-Google-Smtp-Source: AA0mqf5a869Z+y3PWhK1f0iQBvG6zg9cdoOC5JLfJPIV/9BrEuggdmfa1XYB3ZM2xhu/WP/MwCLQWI0XpHLq0VWPq3E=
X-Received: by 2002:a65:6049:0:b0:477:2ac1:9d2c with SMTP id
 a9-20020a656049000000b004772ac19d2cmr27938038pgp.184.1669670658124; Mon, 28
 Nov 2022 13:24:18 -0800 (PST)
MIME-Version: 1.0
References: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk> <67cd6ed7-e2cb-0e0a-5611-e4cd57eb8feb@bell.net>
 <cc3d9dc4727b3e7d76e76a2f0bb200ac@matoro.tk> <CAOyqgcXknGW0AvMy-noFZsSxYdiruoA_HxXaiuW+n-osyyzyMg@mail.gmail.com>
 <067345a4e47eed632a994084ae53856b@matoro.tk> <CAOyqgcWK4UhU-GhEvUo26X_UEK_GK-a1xzqr27J98HAe1J9VYg@mail.gmail.com>
 <8d3b98ad973d3cd0ed807ec9d2edeaf2@matoro.tk> <e4ea795a-ad17-4c8c-0231-579906813839@gmx.de>
 <CAOyqgcXbXHVX8qJzyFVgdV5J4hkZXwD_bwe+ZBzJsSdTQ7zbew@mail.gmail.com> <5e5c81e3b576674f769707c1def830f8@matoro.tk>
In-Reply-To: <5e5c81e3b576674f769707c1def830f8@matoro.tk>
From:   Ian Lance Taylor <iant@golang.org>
Date:   Mon, 28 Nov 2022 13:24:07 -0800
Message-ID: <CAOyqgcWqcMEbi5WH-w_ARwTXOmG81+yf3fesSHAff0dQHCLo8g@mail.gmail.com>
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
To:     matoro <matoro_mailinglist_kernel@matoro.tk>
Cc:     Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, hppa@gentoo.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Nov 28, 2022 at 1:07 PM matoro
<matoro_mailinglist_kernel@matoro.tk> wrote:
>
> That seemed to do the trick!  Looks like it needs support added to
> golang.org/x/sys/unix:  https://dpaste.com/4K99E4DWH.txt
>
> This is something I can look into on my own though.  I might come back
> to ask about the asm parts, but will try and figure it out.
>
> So does this mean it is a GC bug?

It's a GC bug but it's probably going to require a parisc specific
fix, likely in runtime/stack.c though possibly elsewhere as well.

Ian


> -------- Original Message --------
> Subject: Re: Correct goarch.sh settings for gccgo on hppa?
> Date: 2022-11-28 15:20
>  From: Ian Lance Taylor <iant@golang.org>
> To: Helge Deller <deller@gmx.de>
>
> On Sun, Nov 27, 2022 at 12:19 AM Helge Deller <deller@gmx.de> wrote:
> >
> > I don't know if it's relevant, but on hppa the stack grows upwards,
> > while on all(?) other platforms the stack grows downwards.
> > Maybe something is missing, esp. since setcontext() is involved where
> > a new context including stack is set and this leads to the "corrupt
> > stack" ?
>
> Interesting point and quite possibly relevant.  See the code in
> runtime/stack.c.  More generally, see if the tests behave better with
> the environment variable GOGC=off.  That disables the garbage
> collector.
>
> Ian
