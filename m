Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE444686F49
	for <lists+linux-parisc@lfdr.de>; Wed,  1 Feb 2023 20:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjBATv5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 Feb 2023 14:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbjBATvz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 Feb 2023 14:51:55 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1E7125A0
        for <linux-parisc@vger.kernel.org>; Wed,  1 Feb 2023 11:51:54 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id k4so49226744eje.1
        for <linux-parisc@vger.kernel.org>; Wed, 01 Feb 2023 11:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vLOt8Htpi1Up/DCPSKgd2HVLgjbb3KJvZ9wNHdxeIi0=;
        b=F70AJ99pkUxssTeL0XhQsULJ+i1q3hIfT9mQJxKYXMRcGN/4hPjNKQXfjgd8TBqpBG
         BetUorZ/VTlYCLAfd+XP2RRKW0JVrfaxYcX4T9dpsWXY9GYLSKeTv64OlMI8Kd6WjuJ/
         BWyXoO4myVBwLlBRPvXQouhFGSPXaEWcUSKkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLOt8Htpi1Up/DCPSKgd2HVLgjbb3KJvZ9wNHdxeIi0=;
        b=FKbPs4EZZuBGAO+8kr0lKQH1ZKBSPQSii+UHOOfWN1LD3mc+DC4R3A3ZY0IqnOg2CN
         Ol3p4EVVd6oku8XkPNB+99oTqt/QyZGYbP7wnl/qaRUvZPQVFNzAzuDOsLwEExxutmdF
         OkFrHlksz9LKrIc8RovjmHPTh5z+pVEa0+AMZthdr61h71Kn9pZwY5KasGuqEVm2aIUM
         vJGTN+kQarMcQbKgkzaufLgZ/ex+F4vNOZojouXP5fv1PuneV/vT1cza92954g2gZNvE
         Z80KAq9oQR2+DX1f6JKhISddyVib0AK1tMBGhHgAmxtaYCywqfCumiA4TjMAh/BCz7Gh
         X0jQ==
X-Gm-Message-State: AO0yUKWstK9A8A0mcXhuhcaw5a3Ciu2Yo/hbZwoBTkwKgDi/rJTKQhO8
        /Yi+yWUsuCiYF0PHVhj/rL3F5vZobaa+5IDgs7U=
X-Google-Smtp-Source: AK7set9pr75I+NZRXS4wC7tHtvRXP3LmvdsakpvKDt/gDiqZkHaeSxu5CMyFIzLcoAID7tQ5K8D02A==
X-Received: by 2002:a17:906:b04a:b0:878:814d:bc99 with SMTP id bj10-20020a170906b04a00b00878814dbc99mr3314494ejb.66.1675281112481;
        Wed, 01 Feb 2023 11:51:52 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b0085fc3dec567sm10549262ejn.175.2023.02.01.11.51.51
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 11:51:51 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id dr8so33096781ejc.12
        for <linux-parisc@vger.kernel.org>; Wed, 01 Feb 2023 11:51:51 -0800 (PST)
X-Received: by 2002:a17:906:f8d4:b0:878:51a6:ff35 with SMTP id
 lh20-20020a170906f8d400b0087851a6ff35mr995069ejb.43.1675281111261; Wed, 01
 Feb 2023 11:51:51 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV> <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <8f60f7d8-3e2f-2a91-c7a3-6a005d36d7d3@gmx.de>
In-Reply-To: <8f60f7d8-3e2f-2a91-c7a3-6a005d36d7d3@gmx.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 1 Feb 2023 11:51:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=whYidrLJSq80s8C0LSui_h9164cxG6WNV1M77Tk_2QFug@mail.gmail.com>
Message-ID: <CAHk-=whYidrLJSq80s8C0LSui_h9164cxG6WNV1M77Tk_2QFug@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Helge Deller <deller@gmx.de>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, Peter Xu <peterx@redhat.com>,
        linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Feb 1, 2023 at 12:21 AM Helge Deller <deller@gmx.de> wrote:
>
> AFAICS, the only applications which really care about the return
> code are
> - testsuites like LTP (i.e. the fstat05 testcase)

Those have actually shown issues with various library implementations,
exactly because real system calls act very differently in this area
from library wrappers.

Things like the vdso implementation of gettimeofday() get a SIGSEGV if
the timeval or timezone pointer is invalid, while the "real system
call" version returns -1/EFAULT instead.

And very similar things happen when glibc ends up wrapping system
calls and converting buffers manually. At some point, glibc had a
special 'struct stat' and basically converted the native system call
to it, so you did 'stat()' on something, and it ended up actually
using a private on-stack buffer for the system call, followed by a
"convert that kernel 'struct stat' to the glibc 'struct stat'" phase.
So once again, instead of -1/EFAULT, you'd first have a successful
system call, and then get a SIGSEGV  in glibc.

And as you say, test suites would notice. But no actual normal app
would ever care.

Of course, there's always the abnormal apps. There _are_ the odd cases
that actually catch faults and fix them up, and can then be confused
by changes like that.

It's very very rare, but it happens - things like emulators do tend to
do some really strange things.

         Linus
