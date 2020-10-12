Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920D928B90E
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Oct 2020 15:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390573AbgJLN5Q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Oct 2020 09:57:16 -0400
Received: from foss.arm.com ([217.140.110.172]:48228 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389400AbgJLN5P (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Oct 2020 09:57:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5E7F31B;
        Mon, 12 Oct 2020 06:57:14 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E50A13F66B;
        Mon, 12 Oct 2020 06:57:12 -0700 (PDT)
Date:   Mon, 12 Oct 2020 14:57:09 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     Peter Collingbourne <pcc@google.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Oleg Nesterov <oleg@redhat.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Kostya Serebryany <kcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        David Spickett <david.spickett@linaro.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>,
        Evgenii Stepanov <eugenis@google.com>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v10 6/7] signal: define the field siginfo.si_xflags
Message-ID: <20201012135701.GF32292@arm.com>
References: <cover.1598072840.git.pcc@google.com>
 <8a12152d54ea782f47bc55d791b064abe478473e.1598072840.git.pcc@google.com>
 <20200908151337.GW6642@arm.com>
 <CAMn1gO5ZyHxvNNRpRhqE7fOY_O1QkH37K0ShT2sq7vbo_J-RZA@mail.gmail.com>
 <CAMn1gO6inoGhmoqCb4A_yR3UakU3JsJ4jpsKa5aBqAPhDoPvSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO6inoGhmoqCb4A_yR3UakU3JsJ4jpsKa5aBqAPhDoPvSg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Oct 09, 2020 at 11:19:55AM -0700, Peter Collingbourne wrote:
> On Wed, Oct 7, 2020 at 7:11 PM Peter Collingbourne <pcc@google.com> wrote:
> >
> > On Tue, Sep 8, 2020 at 8:13 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > >
> > > On Fri, Aug 21, 2020 at 10:10:16PM -0700, Peter Collingbourne wrote:

[...]

> > > > diff --git a/include/linux/compat.h b/include/linux/compat.h
> > > > index d38c4d7e83bd..55d4228dfd88 100644
> > > > --- a/include/linux/compat.h
> > > > +++ b/include/linux/compat.h
> > > > @@ -231,7 +231,9 @@ typedef struct compat_siginfo {
> > > >                                       char _dummy_pkey[__COMPAT_ADDR_BND_PKEY_PAD];
> > > >                                       u32 _pkey;
> > > >                               } _addr_pkey;
> > > > +                             compat_uptr_t _pad[6];
> > > >                       };
> > > > +                     compat_uptr_t _xflags;
> > >
> > > Should we have the same type here for native and compat?
> > >
> > > I don't have a very strong opinion on this, but currently native on
> > > 64-bit arches will have 32 extra bits in _xflags that can never be used
> > > (or have to be defined differently for compat).
> >
> > Good point. I will make this a u64 (although I think 32 bits will
> > probably be more than enough, the distance between si_xflags and
> > si_addr_ignored_bits will be 8 bytes on 64-bit architectures due to
> > alignment so we may as well make all of the bits available).
> 
> It turns out that we can't actually make this a u64 because on 32-bit
> platforms this increases the alignment of the union to 8, which breaks
> layout for the other fields in the union. In v12 I will make this a
> u32 so that we don't end up with unusable bits.

u32 seems fine to me.

If we need more bits later, we can always use one of the 32 xflags bits
to indicate that the new field(s) exist.

Cheers
---Dave
