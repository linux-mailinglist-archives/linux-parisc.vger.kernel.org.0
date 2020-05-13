Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571891D1F57
	for <lists+linux-parisc@lfdr.de>; Wed, 13 May 2020 21:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390725AbgEMThe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 May 2020 15:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390185AbgEMThc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 May 2020 15:37:32 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEBCC061A0C
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 12:37:31 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h26so533444lfg.6
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5FRYECFHiQr3Nfb1uzqLNFih4Bcng0OOjZJ5V5m4DAs=;
        b=ZjLEDdjhfQ+ZsfStprzo3boptGtjEB8xMJMPV9hfgVHHrrYSleH8mLbHC8Rk2rWQqc
         NnCj3BIzoVOHPTIgSoBKM0vWlfW3SuT0UoYyIfcumKGQE/4wsqoLb39sPYuJ5/AuOelG
         tGQKJ8l9ywdlX+FMm4CTzGEq2pztEwBhTbMlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5FRYECFHiQr3Nfb1uzqLNFih4Bcng0OOjZJ5V5m4DAs=;
        b=OCgLn629pC6BjlGA1mjKMEHedFC9g6ixoqS2qduaxe2bh0VcFkpW5J1av7q9vN8/ah
         L04ek2DWs3PElYjSJa0LYA6fSzdaFNDDgjd6SYiqKqFrjCBw3ggr8LUnqYAEW18dxlEh
         yUu8rTN76pAOppKCgzz33SBB5nvV+BK5Hx5XhrC0jYGuqLyPtOlSbJORDIdq29R4xFRz
         UUQ0ZvJvJut52+binmjvQDw3cKkSurVvxmmazWcMui9XttwpktrWrq24CwBK50Zng1JX
         5Kuk3p43HUdSCU0kokaq0xZPQnJzKiE/WSOZ8UpGMLaMT0+YY3pz/zGUZWjcvHykd1MT
         sZwQ==
X-Gm-Message-State: AOAM533vjQs7EnDVaXvJCu3AqoP1LcjsCQrlkECxIAJp1YmWwwlWTM/I
        AAOGlLwZZ6e9vD+6MNnF9PKRbRmHaws=
X-Google-Smtp-Source: ABdhPJyL0CYPVKCzLId1BFoOKjJoRZ9S3jzAgiiVVC2kyzr4Z7lG8u2RQ3yFHqRJpVOqM6xYYAHWtA==
X-Received: by 2002:ac2:5bdd:: with SMTP id u29mr670924lfn.72.1589398650039;
        Wed, 13 May 2020 12:37:30 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id v2sm219139ljv.86.2020.05.13.12.37.28
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 12:37:29 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id z22so571680lfd.0
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 12:37:28 -0700 (PDT)
X-Received: by 2002:ac2:4da1:: with SMTP id h1mr686949lfe.152.1589398648496;
 Wed, 13 May 2020 12:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200513160038.2482415-1-hch@lst.de>
In-Reply-To: <20200513160038.2482415-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 13 May 2020 12:37:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wghd2efrE_DoJaC7nTkpCC1gPGp+xbNY7KWOE-7sa4h0Q@mail.gmail.com>
Message-ID: <CAHk-=wghd2efrE_DoJaC7nTkpCC1gPGp+xbNY7KWOE-7sa4h0Q@mail.gmail.com>
Subject: Re: clean up and streamline probe_kernel_* and friends v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     "the arch/x86 maintainers" <x86@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-parisc@vger.kernel.org,
        linux-um <linux-um@lists.infradead.org>,
        Netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, May 13, 2020 at 9:00 AM Christoph Hellwig <hch@lst.de> wrote:
>
> this series start cleaning up the safe kernel and user memory probing
> helpers in mm/maccess.c, and then allows architectures to implement
> the kernel probing without overriding the address space limit and
> temporarily allowing access to user memory.  It then switches x86
> over to this new mechanism by reusing the unsafe_* uaccess logic.

Ok, I think I found a bug, and I had one more suggestion, but other
than the two emails I sent this all looks like an improvement to me.

                 Linus
