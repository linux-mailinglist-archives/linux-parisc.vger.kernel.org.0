Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0AD33FF50D
	for <lists+linux-parisc@lfdr.de>; Thu,  2 Sep 2021 22:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbhIBUnB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 2 Sep 2021 16:43:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:59152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232045AbhIBUnB (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 2 Sep 2021 16:43:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A86360FDA
        for <linux-parisc@vger.kernel.org>; Thu,  2 Sep 2021 20:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630615322;
        bh=xgEywScCxG9d/MNnGUKlxPg3X6w8mPiyS2kTlSbH1yw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N1gI8fwZvI7yKYYphoDhGwPtDtdnobWaJ7k1avUFAggsDhM21OhpsxiXwH1FI8WxP
         nretNaT2ZT037gyziA5DaEFnDzbsDwXsEp/DO9vVXhs9/YNomcI5VpTKb5bXubXuQi
         yMJd524CF7J8QijM1XcaYxZPeSrMRgmlmJMURrBvEUorM0JxpDzCeZdlwzKNY8+pJj
         Aw4FmwyzOf4RaYxtPwHt6eoIxPBbc111mFq8hdfvKO7ZhRA1/SDaqI7ehfaeOqbpc2
         4eXYwq62NOujUM9kgYZcB/1+Lme1vCt6Z59Pxguv76BQvZo7EMAUmP2kflTVpfw4Ak
         JBRlwrpXVpZeA==
Received: by mail-wm1-f44.google.com with SMTP id e26so2147762wmk.2
        for <linux-parisc@vger.kernel.org>; Thu, 02 Sep 2021 13:42:02 -0700 (PDT)
X-Gm-Message-State: AOAM532bdinlEiTcpFxEBjAMrtR2inGV0ijTvERU5KphBUPqsL9vcdCT
        PmzwIHFGYPHF2ZJOt8t6LYhPp6Jqn9AvrD0z3Pw=
X-Google-Smtp-Source: ABdhPJwTS0TLkP+iCs+VRFgVj+M5rWypGPan1PwEFRLzSIQfcdsYUdeIcKrL+EtQwnIX0LWPluQW+zU66ZBaXveZBFU=
X-Received: by 2002:a7b:c933:: with SMTP id h19mr4976070wml.120.1630615321057;
 Thu, 02 Sep 2021 13:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <YS6VGsZ7fZtZeu/i@ls3530> <YTDaZAMvAipdvkaB@ls3530>
 <CAK8P3a0zwnEUK_ztPRBx0H9VGBoPVY-+aASFV97zSKrL=diXUA@mail.gmail.com> <51d6b8cb-a64f-0cf7-1545-4c2fee89799e@gmx.de>
In-Reply-To: <51d6b8cb-a64f-0cf7-1545-4c2fee89799e@gmx.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 2 Sep 2021 22:41:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3oJo496dXpAWHQKG=Sdr+RSfScYbWKyGrk8HNfH5G1CQ@mail.gmail.com>
Message-ID: <CAK8P3a3oJo496dXpAWHQKG=Sdr+RSfScYbWKyGrk8HNfH5G1CQ@mail.gmail.com>
Subject: Re: [PATCH v2] parisc: Fix boot with kernel v5.14
To:     Helge Deller <deller@gmx.de>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Sep 2, 2021 at 9:48 PM Helge Deller <deller@gmx.de> wrote:
> On 9/2/21 8:35 PM, Arnd Bergmann wrote:
> > On Thu, Sep 2, 2021 at 2:06 PM Helge Deller <deller@gmx.de> wrote:
> >>
> >> Kernel v5.14 has various changes to optimize unaligned memory accesses,
> >> e.g. commit 0652035a5794 ("asm-generic: unaligned: remove byteshift helpers").
> >>
> >> Those changes break the bootloader and other places in kernel for parisc
> >> which needs byte-wise accesses to unaligned memory.
> >>
> >> Here is an updated patch/hack which fixes those boot problems by adding
> >> a compiler optimization barrier. More info and background can be found in BZ:
> >> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102162
> >>
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >
> > Right, this should fix it, but I tend to agree with what Andrew Pinski
> > said: the existing version is actually correct and allows valid
> > optimizations on static variables as long as those are correctly
> > annotated in C.
> Let's look at generic kernel code, e.g. in fs/btrfs/inode.c.
> You will find many similiar cases all around the kernel.
> ------------
> struct dir_entry {
>          u64 ino;
>          u64 offset;
>          unsigned type;
>          int name_len;
> };
>
> static int btrfs_filldir(void *addr, int entries, struct dir_context *ctx)
> {
>          while (entries--) {
>                  struct dir_entry *entry = addr;
>                  char *name = (char *)(entry + 1);
>
>                  ctx->pos = get_unaligned(&entry->offset);
>                  if (!dir_emit(ctx, name, get_unaligned(&entry->name_len),
>                                           get_unaligned(&entry->ino),
>                                           get_unaligned(&entry->type)))
>                          return 1;
>                  addr += sizeof(struct dir_entry) +
>                          get_unaligned(&entry->name_len);
>                  ctx->pos++;
>          }
>          return 0;
> }
> -----------
> According to Andrew Pinski's statement, the compiler will assume here that all of
> those get_unaligned() calls will access naturally aligned memory and I'm pretty
> sure the compiler will generate native 4/8 byte accesses on all platforms.
> Most likely you will not notice on most platforms because it will get fixed by
> exception handlers or natively in hardware.
> But anyway, it's not what the developers intended by adding get_unaligned().

No, this case is completely different: 'entry' points to dynamically allocated
memory that gets passed in via a void pointer, so gcc has no knowledge of
the alignment of the underlying storage, and it will do the access according to
the __packed constrains in the get_unaligned() helper. When you look at the
assembler output for this function on a 5.14 parisc kernel, I'm sure you will
see the correct byte accesses, just like the trivial example I posted
in bugzilla.

The reason that the "output_len" access breaks is that gcc explicitly optimizes
the bytewise access  into word accesses because it assumes that global variables
are correctly declared, and that they are aligned according to the requirements
of the ABI.
This may be surprising and even unfortunate, but I can see why they did
this optimization, and that it helps in other cases as well.

> I see no chance to change all those places in the kernel.

No, that would mean changing all get_unaligned() accesses to pointer
dereferences on types that are declared as __packed themselves.
The get_unaligned()/put_unaligned() helpers generally do what they
are designed for, it just breaks when you have misaligned global
variables that are created by a linker script.

     Arnd
