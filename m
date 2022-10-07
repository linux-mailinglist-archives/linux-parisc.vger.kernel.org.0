Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC2225F7C8E
	for <lists+linux-parisc@lfdr.de>; Fri,  7 Oct 2022 19:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbiJGR4p (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 7 Oct 2022 13:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJGR4m (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 7 Oct 2022 13:56:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4017792580;
        Fri,  7 Oct 2022 10:56:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C5E18614ED;
        Fri,  7 Oct 2022 17:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63F0C433D7;
        Fri,  7 Oct 2022 17:56:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="f8gITOWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1665165391;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nK/H0hVDBIBg7GodmLmaWI9qS4fvsGkmZJoRHEB4Sqs=;
        b=f8gITOWuIwqHaHfAd2Ip5iMe8yRrocgJ4MTv+syk8BIYaorE//Q+fvXw/I7Wb9QIt67mY7
        sXmAQixgC0HtGsR77BaUpuASQ/P2J6ViTMRZs6w1NXyDA3Tn8jOyTwjjjCV8bnJYFxdwV5
        RGF0qzBCT4wpILO3WXYw3dx9t9cPRE4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1a87e0a2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 7 Oct 2022 17:56:31 +0000 (UTC)
Date:   Fri, 7 Oct 2022 11:56:18 -0600
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "patches@lists.linux.dev" <patches@lists.linux.dev>,
        Andreas Noever <andreas.noever@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph =?utf-8?Q?B=C3=B6hmwalder?= 
        <christoph.boehmwalder@linbit.com>, Christoph Hellwig <hch@lst.de>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Dave Airlie <airlied@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Florian Westphal <fw@strlen.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Helge Deller <deller@gmx.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Huacai Chen <chenhuacai@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Jan Kara <jack@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        KP Singh <kpsingh@kernel.org>, Marco Elver <elver@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Theodore Ts'o <tytso@mit.edu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Graf <tgraf@suug.ch>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
        Yury Norov <yury.norov@gmail.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Message-ID: <Y0BoQmVauPLC2uW5@zx2c4.com>
References: <20221006165346.73159-1-Jason@zx2c4.com>
 <20221006165346.73159-4-Jason@zx2c4.com>
 <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu>
 <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
 <f10fcfbf-2da6-cf2d-6027-fbf8b52803e9@csgroup.eu>
 <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
 <CAHmME9pE4saqnwxhsAwt-xegYGjsavPOGnHCbZhUXD7kaJ+GAA@mail.gmail.com>
 <501b0fc3-6c67-657f-781e-25ee0283bc2e@csgroup.eu>
 <Y0Ayvov/KQmrIwTS@zx2c4.com>
 <202210071010.52C672FA9@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202210071010.52C672FA9@keescook>
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Oct 07, 2022 at 10:12:42AM -0700, Kees Cook wrote:
> On Fri, Oct 07, 2022 at 08:07:58AM -0600, Jason A. Donenfeld wrote:
> > On Fri, Oct 07, 2022 at 04:57:24AM +0000, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 07/10/2022 à 01:36, Jason A. Donenfeld a écrit :
> > > > On 10/6/22, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> > > >>
> > > >>
> > > >> Le 06/10/2022 à 19:31, Christophe Leroy a écrit :
> > > >>>
> > > >>>
> > > >>> Le 06/10/2022 à 19:24, Jason A. Donenfeld a écrit :
> > > >>>> Hi Christophe,
> > > >>>>
> > > >>>> On Thu, Oct 6, 2022 at 11:21 AM Christophe Leroy
> > > >>>> <christophe.leroy@csgroup.eu> wrote:
> > > >>>>> Le 06/10/2022 à 18:53, Jason A. Donenfeld a écrit :
> > > >>>>>> The prandom_u32() function has been a deprecated inline wrapper around
> > > >>>>>> get_random_u32() for several releases now, and compiles down to the
> > > >>>>>> exact same code. Replace the deprecated wrapper with a direct call to
> > > >>>>>> the real function. The same also applies to get_random_int(), which is
> > > >>>>>> just a wrapper around get_random_u32().
> > > >>>>>>
> > > >>>>>> Reviewed-by: Kees Cook <keescook@chromium.org>
> > > >>>>>> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk> # for sch_cake
> > > >>>>>> Acked-by: Chuck Lever <chuck.lever@oracle.com> # for nfsd
> > > >>>>>> Reviewed-by: Jan Kara <jack@suse.cz> # for ext4
> > > >>>>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > >>>>>> ---
> > > >>>>>
> > > >>>>>> diff --git a/arch/powerpc/kernel/process.c
> > > >>>>>> b/arch/powerpc/kernel/process.c
> > > >>>>>> index 0fbda89cd1bb..9c4c15afbbe8 100644
> > > >>>>>> --- a/arch/powerpc/kernel/process.c
> > > >>>>>> +++ b/arch/powerpc/kernel/process.c
> > > >>>>>> @@ -2308,6 +2308,6 @@ void notrace __ppc64_runlatch_off(void)
> > > >>>>>>     unsigned long arch_align_stack(unsigned long sp)
> > > >>>>>>     {
> > > >>>>>>         if (!(current->personality & ADDR_NO_RANDOMIZE) &&
> > > >>>>>> randomize_va_space)
> > > >>>>>> -             sp -= get_random_int() & ~PAGE_MASK;
> > > >>>>>> +             sp -= get_random_u32() & ~PAGE_MASK;
> > > >>>>>>         return sp & ~0xf;
> > > >>>>>
> > > >>>>> Isn't that a candidate for prandom_u32_max() ?
> > > >>>>>
> > > >>>>> Note that sp is deemed to be 16 bytes aligned at all time.
> > > >>>>
> > > >>>> Yes, probably. It seemed non-trivial to think about, so I didn't. But
> > > >>>> let's see here... maybe it's not too bad:
> > > >>>>
> > > >>>> If PAGE_MASK is always ~(PAGE_SIZE-1), then ~PAGE_MASK is
> > > >>>> (PAGE_SIZE-1), so prandom_u32_max(PAGE_SIZE) should yield the same
> > > >>>> thing? Is that accurate? And holds across platforms (this comes up a
> > > >>>> few places)? If so, I'll do that for a v4.
> > > >>>>
> > > >>>
> > > >>> On powerpc it is always (from arch/powerpc/include/asm/page.h) :
> > > >>>
> > > >>> /*
> > > >>>    * Subtle: (1 << PAGE_SHIFT) is an int, not an unsigned long. So if we
> > > >>>    * assign PAGE_MASK to a larger type it gets extended the way we want
> > > >>>    * (i.e. with 1s in the high bits)
> > > >>>    */
> > > >>> #define PAGE_MASK      (~((1 << PAGE_SHIFT) - 1))
> > > >>>
> > > >>> #define PAGE_SIZE        (1UL << PAGE_SHIFT)
> > > >>>
> > > >>>
> > > >>> So it would work I guess.
> > > >>
> > > >> But taking into account that sp must remain 16 bytes aligned, would it
> > > >> be better to do something like ?
> > > >>
> > > >> 	sp -= prandom_u32_max(PAGE_SIZE >> 4) << 4;
> > > >>
> > > >> 	return sp;
> > > > 
> > > > Does this assume that sp is already aligned at the beginning of the
> > > > function? I'd assume from the function's name that this isn't the
> > > > case?
> > > 
> > > Ah you are right, I overlooked it.
> > 
> > So I think to stay on the safe side, I'm going to go with
> > `prandom_u32_max(PAGE_SIZE)`. Sound good?
> 
> Given these kinds of less mechanical changes, it may make sense to split
> these from the "trivial" conversions in a treewide patch. The chance of
> needing a revert from the simple 1:1 conversions is much lower than the
> need to revert by-hand changes.
> 
> The Cocci script I suggested in my v1 review gets 80% of the first
> patch, for example.

I'll split things up into a mechanical step and a non-mechanical step.
Good idea.

Jason
