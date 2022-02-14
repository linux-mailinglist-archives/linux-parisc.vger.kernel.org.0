Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822A14B5C1A
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Feb 2022 22:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbiBNVDU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 14 Feb 2022 16:03:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiBNVDU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 14 Feb 2022 16:03:20 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B8CF8B92
        for <linux-parisc@vger.kernel.org>; Mon, 14 Feb 2022 13:03:10 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id b38so8240263ljr.12
        for <linux-parisc@vger.kernel.org>; Mon, 14 Feb 2022 13:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uV1vHLzIr83T8MOCn12tMQAgRRvl8B7jglczOSl4CII=;
        b=JVRzXzobglXSiT0bLuA7vSr1HiJLXJeQF0BO276l66RCTCZjx8953KmFOVPMErrs0l
         on/NKX4mjsS9TS9bqhorHzBzM+OjtKgBLqdNoyLvrA639t1A433SV7/dJ5dxrhaCdPXH
         bTp5UzrLKiAt8Y3WQUfvdICLgLXk8cVAfLq1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uV1vHLzIr83T8MOCn12tMQAgRRvl8B7jglczOSl4CII=;
        b=m0fw7vYzbCw4TKWaTnPCcDmaPP9tdHXH19phKjoVX1iAmTZsmu9xSq/vBXxC85T+gg
         2lrFGQxZmIyUO5ibS3FtyFzfZpqu05mRLVKE8p+vuwa+M9Ty4gF2z9V9CdIB2J6KGpfS
         uTF2wYaNlpmGmiFFNfWvPmt+Ev6PjYjwSOCqTqjTgLsfrxXTARnWtiG0b3wzfvX+gJd1
         /eC3UIjFNI7muSrCEiOWaLnMr8FuBxj5qtxC5rqaglB2NfV+P0TeexY2Kv0XVuCI031N
         ratv4znFhhYBz2sgH2L5P0S4revmsd1snlyeyhtV4+lDhMrmM3dmyian8ETb5J+lyyiA
         vY7A==
X-Gm-Message-State: AOAM531pgd0vwp6xuJ5ZxCZKMbkOE/XrHrBUZJCROr6cSS6HgKRQtKLC
        pHqLeX8fuPtlh4E7tSCZIZdKpfhCNJvo1xJiO+A=
X-Google-Smtp-Source: ABdhPJzofVxP9pZ0rHzAk1cgQgpNIS3Tds2pZWABg8+lq7mTerXNWN3qlj+Luz7zhWXHTC0HjD3vog==
X-Received: by 2002:a17:907:6096:: with SMTP id ht22mr371350ejc.611.1644870282424;
        Mon, 14 Feb 2022 12:24:42 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id z5sm10897093eja.20.2022.02.14.12.24.40
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 12:24:41 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id w10so10221820edd.11
        for <linux-parisc@vger.kernel.org>; Mon, 14 Feb 2022 12:24:40 -0800 (PST)
X-Received: by 2002:a05:651c:1543:: with SMTP id y3mr306548ljp.152.1644870269711;
 Mon, 14 Feb 2022 12:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org> <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org> <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
 <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
In-Reply-To: <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 14 Feb 2022 12:24:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYu67OwP4LhcrPdDVxv2mOsx-Xsc2DKoVW6GZwKFtOYQ@mail.gmail.com>
Message-ID: <CAHk-=wgYu67OwP4LhcrPdDVxv2mOsx-Xsc2DKoVW6GZwKFtOYQ@mail.gmail.com>
Subject: Re: [PATCH 04/14] x86: use more conventional access_ok() definition
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        Helge Deller <deller@gmx.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Openrisc <openrisc@lists.librecores.org>,
        Greentime Hu <green.hu@gmail.com>,
        Stafford Horne <shorne@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Nick Hu <nickhu@andestech.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Richard Weinberger <richard@nod.at>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        David Miller <davem@davemloft.net>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Feb 14, 2022 at 12:01 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> x86-64 has always(*) used TASK_SIZE_MAX for access_ok(), and the
> get_user() assembler implementation does the same.

Side note: we could just check the sign bit instead, and avoid big
constants that way.

Right now we actually have this complexity in the x86-64 user access code:

  #ifdef CONFIG_X86_5LEVEL
  #define LOAD_TASK_SIZE_MINUS_N(n) \
        ALTERNATIVE __stringify(mov $((1 << 47) - 4096 - (n)),%rdx), \
                    __stringify(mov $((1 << 56) - 4096 - (n)),%rdx),
X86_FEATURE_LA57
  #else
  #define LOAD_TASK_SIZE_MINUS_N(n) \
          mov $(TASK_SIZE_MAX - (n)),%_ASM_DX
  #endif

just because the code tries to get that TASK_SIZE_MAX boundary just right.

And getting that boundary just right is important on 32-bit x86, but
it's *much* less important on x86-64.

There's still a (weak) reason to do it even for 64-bit code: page
faults outside the valid user space range don't actually cause a #PF
fault - they cause #GP - and then we have the #GP handler warn about
"this address hasn't been checked".

Which is nice and useful for doing syzbot kind of randomization loads
(ie user accesses that didn't go through access_ok() will stand out
nicely), but maybe it's not worth this. syzbot would be fine with only
the "sign bit set" case warning for the same thing.

So on x86-64, we could just check the sign of the address instead, and
simplify and shrink those get/put_user() code sequences (but
array_index_mask_nospec() currently uses the carry flag computation
too, so we'd have to change that part as well, maybe not worth it).

                  Linus
