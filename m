Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D36527D411
	for <lists+linux-parisc@lfdr.de>; Tue, 29 Sep 2020 19:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbgI2RBb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 29 Sep 2020 13:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgI2RBb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 29 Sep 2020 13:01:31 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98478C061755
        for <linux-parisc@vger.kernel.org>; Tue, 29 Sep 2020 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=vws/DrlcARCEDTABQlddJ440n6mIScdASUEvFbJCB/I=; b=iy9AMp7QR5Weg3JlyQEU+h7/kJ
        s2YPl6PDKe61ATA2Mq32gdr+S9et6iB+5qGnr67wwrzI+vrXWbgLV+sGpx/YBItG/45fM6d5dDPAa
        Myyi1mGhlFUtl+z++899vkiztngj8ba8hF9L3ha84tpMYouO5rNDKG1+txu8F/8ll8uvMzfGlKvJa
        Vn7k6ItApvYcHHxZTY5TRVTVEfOsd8d+dfzoeXXx3EK3muT0MbUsynNiSsyxOwl3b0pLy/YmrBnT7
        zSYq9ENzK1Rlwz+RArU4Sf66JgaBL8El9JSFM3dldF6kwNrnR7Vm1ODQuBlckBaAldM9XZ+lwzYqX
        APJ7Ry5g==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNJ0M-00060n-3D
        for linux-parisc@vger.kernel.org; Tue, 29 Sep 2020 17:01:30 +0000
Date:   Tue, 29 Sep 2020 18:01:30 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-parisc@vger.kernel.org
Subject: Re: Page tables on machines with >2GB RAM
Message-ID: <20200929170130.GA21889@casper.infradead.org>
References: <20200929153316.GG20115@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929153316.GG20115@casper.infradead.org>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Sep 29, 2020 at 04:33:16PM +0100, Matthew Wilcox wrote:
> I think we can end up truncating a PMD or PGD entry (I get confused
> easily about levels of the page tables; bear with me)
> 
> /* NOTE: even on 64 bits, these entries are __u32 because we allocate
>  * the pmd and pgd in ZONE_DMA (i.e. under 4GB) */
> typedef struct { __u32 pgd; } pgd_t;
> ...
> typedef struct { __u32 pmd; } pmd_t;
> 
> ...
> 
>         pgd_t *pgd = (pgd_t *)__get_free_pages(GFP_KERNEL,
>                                                PGD_ALLOC_ORDER);
> ...
>         return (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
> 
> so if we have more than 2GB of RAM, we can allocate a page with the top
> bit set, which we interpret to mean PAGE_PRESENT in the TLB miss handler
> and mask it off, causing us to load the wrong page for the next level
> of the page table walk.
> 
> Have I missed something?

Yes, yes I have.

We store the PFN, not the physical address.  So we have 28 bits for
storing the PFN and 4 bits for the PxD bits, supporting 28 + 12 = 40 bits
(1TB) of physical address space.
