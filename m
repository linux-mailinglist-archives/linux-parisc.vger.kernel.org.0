Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8982639400
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Nov 2022 06:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiKZF0I (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 26 Nov 2022 00:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiKZF0H (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 26 Nov 2022 00:26:07 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC902C119
        for <linux-parisc@vger.kernel.org>; Fri, 25 Nov 2022 21:26:03 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id a9so2311471pfr.0
        for <linux-parisc@vger.kernel.org>; Fri, 25 Nov 2022 21:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=golang-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MmCNEN/iUe0UGXTS7XIpNhGlQwVoMpbQdfNf0AA+clY=;
        b=ICZkHL/ouNFjBxPtBAHvY9Aft9dQjEmFQqv1bK8V/00FyJ8fMn/7E8ScZ/ES8LA/Jc
         keX8rbxKe1YLnc1X6f1nLEpG1ypdwHF4gNlrXO+rX4XK7RH3j1HNn4eaCz8wBBMcCSjV
         O28bxmizJK1HFy/UQOtZ4N2yneVIw73vlHUYMovXHQDChnj9D9+R01386ZI15micBCse
         ppM86k1W1wKjYBvug1QOK9yIDeJLfK54ZCfI4qCq3rz/fdsVdpcprCB6vaWPEgAWVNeJ
         Ib/p/O2Gi7WazpdcTRBlJ6u0P07Tp9+k5XHBzlzJDM7ZABq40KvDa8QkCOyv9VovENJv
         yqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmCNEN/iUe0UGXTS7XIpNhGlQwVoMpbQdfNf0AA+clY=;
        b=ABwGQWPcrZcykDk1kDKPp+MQFG5Q6wOxQcgNTIvGKkfPbH0VGNfX9UUWsnCWdyFDh2
         As/4CEDJRU21JdIp8ZLA+q2kFmWptVXj7chyfWw9a9N8Q9dBMCCbGkbx29bGxyRDcjl+
         rF07IgNdQnsz3qdOpfaR/xN3wzHTOEJQuD9JUMhs/2Mn74kwH1G/9a3r3D774mL5AePb
         3tY46fLwCqowOe8QYz7aJXBqp3tesN9k5xcSAJAqY9Ds96y6xVPlxuWvnF73Ffjuasw8
         uYev+dxFjF5naHakqCTGORWYi5nIo007fY4Wh+nV1Q+JRRHeyVQWrxypBGXDPdDIyX6w
         aouA==
X-Gm-Message-State: ANoB5pk3NkPpEh1nqdUDlzAHwaH3BHqR7nhO03rGDl/7L4XCRY9ERfKr
        WbcivRFnJJpkfYFlLYhb/r05rQFBbZl6BblX5RBavMgqZJc=
X-Google-Smtp-Source: AA0mqf5NNRWJvUXI2hQIgPfNzdoRQAItALDOnMb4Riq2lOZW7tbVwEYTHJu07PtoSATt5Iz9GXTjMRwupZprp5Ls36s=
X-Received: by 2002:a63:5517:0:b0:42f:e191:2d35 with SMTP id
 j23-20020a635517000000b0042fe1912d35mr37781756pgb.1.1669440362248; Fri, 25
 Nov 2022 21:26:02 -0800 (PST)
MIME-Version: 1.0
References: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk> <67cd6ed7-e2cb-0e0a-5611-e4cd57eb8feb@bell.net>
 <cc3d9dc4727b3e7d76e76a2f0bb200ac@matoro.tk>
In-Reply-To: <cc3d9dc4727b3e7d76e76a2f0bb200ac@matoro.tk>
From:   Ian Lance Taylor <iant@golang.org>
Date:   Fri, 25 Nov 2022 21:25:51 -0800
Message-ID: <CAOyqgcXknGW0AvMy-noFZsSxYdiruoA_HxXaiuW+n-osyyzyMg@mail.gmail.com>
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
To:     matoro <matoro_mailinglist_kernel@matoro.tk>
Cc:     John David Anglin <dave.anglin@bell.net>, deller@gmx.de,
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

On Fri, Nov 25, 2022 at 8:31 PM matoro
<matoro_mailinglist_kernel@matoro.tk> wrote:
>
> Thank you both for the suggestions.  I tried the following values:
>
> diff --git a/libgo/goarch.sh b/libgo/goarch.sh
> index 977f318b3..e0d6a3ad8 100755
> --- a/libgo/goarch.sh
> +++ b/libgo/goarch.sh
> @@ -88,6 +88,16 @@ case $goarch in
>                  ;;
>          esac
>          ;;
> +    hppa)
> +       bigendian=true
> +       defaultphyspagesize=4096
> +       family=HPPA
> +       int64align=8
> +       minframesize=64
> +       pcquantum=4
> +       ptrsize=4
> +       stackalign=64
> +       ;;
>       ia64)
>          family=IA64
>          cachelinesize=128
>
> But unfortunately got the same result.  I wonder if there is something
> else missing?
>
> Ian, if you have the time, I have a machine you can use to look at this.

As far as I know gccgo has never been ported to parisc.  This requires
a fair bit more than just fixing up goarch.sh.  There are a bunch of
files in libgo that are conditionally compiled based on the GOARCH
(processor) and GOOS (operating system) values.  These are marked in
the files by comments that start with "+build" or "go:build".  Many of
those comments will need to be adjusted to recognize parisc and
whatever operating system you are using.  If this is for HP/UX, there
is also operating specific code required in various places.

I'm happy to answer questions about doing the port, but it's not a trivial task.

Ian
