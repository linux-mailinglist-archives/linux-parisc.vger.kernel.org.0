Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A595282AA0
	for <lists+linux-parisc@lfdr.de>; Sun,  4 Oct 2020 14:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgJDMW3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 4 Oct 2020 08:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgJDMW3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 4 Oct 2020 08:22:29 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D14C0613CE
        for <linux-parisc@vger.kernel.org>; Sun,  4 Oct 2020 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=GoHkfHG2p32qg+TA8oa5qpfjbpyI22ffUGWGGiJhz2k=; b=cYDWO5D96Qkvo9+N0nEpcJtiAd
        zZQt3+NaD8YW+8I7P29rv5DxDH5kechbNtam22ffdHS3mZ0NN3Xc0PWdrN/Q1g8awKzE4CapTfBLN
        avDRcP8Pe8wwAp4iPrHfFc0qAFP7ceSDPWuEqfOHmZNCAGVTxfQfVgTRorru3gWKjuqpqCmoTpb3F
        f2PsVDnDKjMJOwhkxle5HyI4Xfzt/W/jmNYRrWZwVCVAOhETVCigJWXs2ko8fwUIJJVnfo1Y95uJi
        pTJPYoPsHvZ1RlMvh7ThFEyjV5sXheiC4jo60elUnBKKQioBBXoGL+PExZ9t5oz76avPoTopba2yR
        i0sE/ibA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kP323-0002km-86; Sun, 04 Oct 2020 12:22:27 +0000
Date:   Sun, 4 Oct 2020 13:22:27 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: Page tables on machines with >2GB RAM
Message-ID: <20201004122227.GH20115@casper.infradead.org>
References: <20200929153316.GG20115@casper.infradead.org>
 <20200929170130.GA21889@casper.infradead.org>
 <ec43d0b5-a40b-28d4-4a31-3c841cd89820@bell.net>
 <20200929181427.GI20115@casper.infradead.org>
 <954ff0a3-bdc6-9b1e-9603-f7e58456cd95@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <954ff0a3-bdc6-9b1e-9603-f7e58456cd95@gmx.de>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, Oct 04, 2020 at 07:29:33AM +0200, Helge Deller wrote:
> On 9/29/20 8:14 PM, Matthew Wilcox wrote:
> > It's talking about 8TB of virtual address space.  But I think it's wrong.
> > On 64-bit,
> >
> > Each PTE defines a 4kB region of address space (ie one page).
> > Each PMD is a 4kB allocation with 8-byte entries, so covers 512 * 4kB = 2MB
> 
> No, PMD is 4kb allocation with 4-byte entries, so covers 1024 * 4kb = 4MB
> We always us 4-byte entries, for 32- and 64-bit kernels.

#if CONFIG_PGTABLE_LEVELS == 3
#define PGD_ORDER       1 /* Number of pages per pgd */
#define PMD_ORDER       1 /* Number of pages per pmd */
#define PGD_ALLOC_ORDER (2 + 1) /* first pgd contains pmd */
...
#if CONFIG_PGTABLE_LEVELS == 3
...
static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
{
        return (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
}

We're definitely doing an 8kB allocation.  If we should be allocating
4kB, then PMD_ORDER should be 0.

The 32-bit entries, even on 64-bit are a nice hack.  I think that just means
we're over-allocating memory for the page tables.

> > Each PGD is an 8kB allocation with 4-byte entries, so covers 2048 * 2M = 4GB
> 
> No. each PGD is a 4kb allocation with 4-byte entries. so covers 1024 * 4MB = 4GB
> Still, my calculation ends up with 4GB, like yours.

Again, I think there's an order vs count confusion here.

> > The top-level allocation is a 32kB allocation, but the first 8kB is used
> > for the first PGD, so it covers 24kB / 4 bytes * 4GB = 24TB.
> 
> size of PGD (swapper_pg_dir) is 8k, so we have 8k / 4 bytes * 4GB = 8 TB
> virtual address space.
> 
> At boot we want to map (1 << KERNEL_INITIAL_ORDER) pages (=64MB on 64bit kernel)
> and for this pmd0 gets pre-allocated with 8k size, and pg0 with 132k to
> simplify the filling the initial page tables - but that's not relevant for
> the calculations above.

I was talking about pgd_alloc():

        pgd_t *pgd = (pgd_t *)__get_free_pages(GFP_KERNEL,
                                               PGD_ALLOC_ORDER);

where we allocate 8 * 4kB pages

> > I think the top level allocation was supposed to be an order-2 allocation,
> > which would be an 8TB address space, but it's order-3.
> >
> > There's a lot of commentary which disagrees with the code.  For example,
> >
> > #define PMD_ORDER       1 /* Number of pages per pmd */
> > That's just not true; an order-1 allocation is 2 pages, not 1.
> 
> Yes, that should be fixed up.
> 
> Helge
