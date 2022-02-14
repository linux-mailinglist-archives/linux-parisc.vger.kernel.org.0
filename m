Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17014B58C0
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Feb 2022 18:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238348AbiBNRmU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 14 Feb 2022 12:42:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239681AbiBNRmU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 14 Feb 2022 12:42:20 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0893065481
        for <linux-parisc@vger.kernel.org>; Mon, 14 Feb 2022 09:42:12 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id b13so28335614edn.0
        for <linux-parisc@vger.kernel.org>; Mon, 14 Feb 2022 09:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hl2tx2/b0j1as4iPc8br7ak6VbssTN3Lkaa01qKImp4=;
        b=B3+89vMVlD+t/jr4Ir3J5heCAGLy+8O/Bfqv5DSjHS7vGRacFAUCCs0TF2tOD5+IOJ
         DARHbhMwmXg8IKTGNN5wyW1UIWJ3dy3zDkUXnMSy6euD4EH/SAawjrYbWaSs+0JtxWja
         ZBOb3OkzZ9V/CSYGxjkJVHb89skxzNvZve0yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hl2tx2/b0j1as4iPc8br7ak6VbssTN3Lkaa01qKImp4=;
        b=KomY4Lu01wSUXqxyRy414ajJOm8lWLzF0vWqgDtbotbJLbjKARWmfJvjtH9cIdrGDn
         5sEgobtg6OareP+AKaMbnBfyyCFsQIu8fK1Yr8EqBAWDPB/Nk+tuZ1ZHcC5bmGLbSa44
         QG5chFkfJu7iYIOGt4rwNDGB1vHj+/q+Q7JmROqNLdFyRMqB0thqzOH3WuPkgJMk3s86
         DiBXfvtQPcyjAKs2QX0BWsWlTkETzAsH5ctZDiFzw6/xkksqsn0UAVNYPGUewDz81szE
         PQisVAzD5MvhijN0ty+zyIE1sGbXHzvPVllIHXryaSvlRc4PhexKG+42l0EA6rZRAuac
         hZ6A==
X-Gm-Message-State: AOAM5337sfKOxnJWf7Uf4alpxB+K8zX9DBppMboif2oQzMChNbsDymNt
        MA/VcGJ1fnDlOok09yc55j/WadYnTofiYl24FMo=
X-Google-Smtp-Source: ABdhPJwWFOguWzDK0yHBt5F2xKi7fdT0U46ySFzMI0o3Nl6wCjnC3DGhT6NpwFyl0G+uqWL1Y2pN/w==
X-Received: by 2002:a50:ec85:: with SMTP id e5mr722670edr.55.1644860530397;
        Mon, 14 Feb 2022 09:42:10 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id b15sm4040126edd.60.2022.02.14.09.42.10
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 09:42:10 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id o24so25457553wro.3
        for <linux-parisc@vger.kernel.org>; Mon, 14 Feb 2022 09:42:10 -0800 (PST)
X-Received: by 2002:a19:4302:: with SMTP id q2mr49672lfa.449.1644860131952;
 Mon, 14 Feb 2022 09:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 14 Feb 2022 09:35:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com>
Message-ID: <CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] clean up asm/uaccess.h, kill set_fs for good
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Stafford Horne <shorne@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Rich Felker <dalias@libc.org>,
        David Miller <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-hexagon <linux-hexagon@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        openrisc@lists.librecores.org,
        linux-parisc <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-sparc <sparclinux@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-xtensa@linux-xtensa.org
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

On Mon, Feb 14, 2022 at 8:35 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I did a patch for microblaze at some point, which turned out to be fairly
> generic, and now ported it to most other architectures, using new generic
> implementations of access_ok() and __{get,put}_kernel_nocheck().

Thanks for doing this.

Apart from the sparc64 issue with completely separate address spaces
(so access_ok() should always return true like Al pointed out), this
looks excellent to me.

Somebody should check that there aren't other cases like sparc64, but
let's merge this asap other than that.

              Linus
