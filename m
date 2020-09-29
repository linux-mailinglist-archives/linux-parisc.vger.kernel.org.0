Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6D027D595
	for <lists+linux-parisc@lfdr.de>; Tue, 29 Sep 2020 20:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbgI2SO2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 29 Sep 2020 14:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI2SO2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 29 Sep 2020 14:14:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FD7C061755
        for <linux-parisc@vger.kernel.org>; Tue, 29 Sep 2020 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=L+eaolTBgRyx7aJRi5Va2pTB8K0imv46oZgInJWEIhE=; b=lMhBSM1jRgFJms0EtBUZw0oMZi
        0SC6xwaTQ8nDpSfHcpdRbdFGJ9eaK32IK64LlULA5BfoN8dcZPxQdmN5UrVo2l8yTy27uW4CkQk9u
        9rmgSkGMCgPJfdLKoArEawCyJ85TjPsZQSTr05SkXuWsW6iaZg+2YbfkNouOvqwnEcZbMeZjL/CrX
        afuOnlcqm+om5I1thyrL3Rmf4Ku4VHRYDwNBHTL7w1eIPgS6aOu3frNxph71Mnu3MZFxI+I7jnAKb
        qHc98A381R8a9O4VYraV7VGvzwROO1jVj8SNppBm/6dqCzBnlLOWNk9IQjidvNq0MS+aUS1vRICV+
        ngaFTK2w==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNK8x-00027T-4E; Tue, 29 Sep 2020 18:14:27 +0000
Date:   Tue, 29 Sep 2020 19:14:27 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: Page tables on machines with >2GB RAM
Message-ID: <20200929181427.GI20115@casper.infradead.org>
References: <20200929153316.GG20115@casper.infradead.org>
 <20200929170130.GA21889@casper.infradead.org>
 <ec43d0b5-a40b-28d4-4a31-3c841cd89820@bell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec43d0b5-a40b-28d4-4a31-3c841cd89820@bell.net>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Sep 29, 2020 at 01:26:29PM -0400, John David Anglin wrote:
> On 2020-09-29 1:01 p.m., Matthew Wilcox wrote:
> > On Tue, Sep 29, 2020 at 04:33:16PM +0100, Matthew Wilcox wrote:
> >> I think we can end up truncating a PMD or PGD entry (I get confused
> >> easily about levels of the page tables; bear with me)
> >>
> >> /* NOTE: even on 64 bits, these entries are __u32 because we allocate
> >>  * the pmd and pgd in ZONE_DMA (i.e. under 4GB) */
> >> typedef struct { __u32 pgd; } pgd_t;
> >> ...
> >> typedef struct { __u32 pmd; } pmd_t;
> >>
> >> ...
> >>
> >>         pgd_t *pgd = (pgd_t *)__get_free_pages(GFP_KERNEL,
> >>                                                PGD_ALLOC_ORDER);
> >> ...
> >>         return (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
> >>
> >> so if we have more than 2GB of RAM, we can allocate a page with the top
> >> bit set, which we interpret to mean PAGE_PRESENT in the TLB miss handler
> >> and mask it off, causing us to load the wrong page for the next level
> >> of the page table walk.
> >>
> >> Have I missed something?
> > Yes, yes I have.
> >
> > We store the PFN, not the physical address.  So we have 28 bits for
> > storing the PFN and 4 bits for the PxD bits, supporting 28 + 12 = 40 bits
> > (1TB) of physical address space.
> The comment in pgalloc.h says 8TB?  I think improving the description as to how this works
> would be welcome.

It's talking about 8TB of virtual address space.  But I think it's wrong.
On 64-bit,

Each PTE defines a 4kB region of address space (ie one page).
Each PMD is a 4kB allocation with 8-byte entries, so covers 512 * 4kB = 2MB
Each PGD is an 8kB allocation with 4-byte entries, so covers 2048 * 2M = 4GB
The top-level allocation is a 32kB allocation, but the first 8kB is used
for the first PGD, so it covers 24kB / 4 bytes * 4GB = 24TB.

I think the top level allocation was supposed to be an order-2 allocation,
which would be an 8TB address space, but it's order-3.

There's a lot of commentary which disagrees with the code.  For example,

#define PMD_ORDER       1 /* Number of pages per pmd */

That's just not true; an order-1 allocation is 2 pages, not 1.
