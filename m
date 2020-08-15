Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB4724536B
	for <lists+linux-parisc@lfdr.de>; Sun, 16 Aug 2020 00:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgHOWBi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 15 Aug 2020 18:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728787AbgHOVv1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 15 Aug 2020 17:51:27 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B5CC004591
        for <linux-parisc@vger.kernel.org>; Sat, 15 Aug 2020 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=wOZb4adGOGM9kJtmrMBRGZK7nJvDUPbZMvMCJHVs0ao=; b=QHJjMuoW+yk2e7O7fTrIHuOx+m
        Ay8JDTuXwllqIWcl4HOADrLw6cc5B7o7nffESpuvvxtkf2FGzmuMjtsshk0c0UgQq77u4/BiMPmeI
        s8vzJv/YwPAnubOtCjNC6icJhIZ07h83MThXLu04ggLBQDkPEM1r0tndQT38fViXR4O6ChVsvBzn1
        Vha/Wv5FPnzo5hBpURz/laX/3OD13sBOBoYSfv//3mxq1qlHXQzaRKX/eFJI5KLAJG90ZjSM4wTeE
        Se0Zrsr8X2RzWtafQNkCWtLbnvDc9whXKAlCmaXLBmaVw+aKeDgrZXfSbk35oOQU0WxHkhFPaia7e
        2641L4ww==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k717w-0005Su-8u; Sat, 15 Aug 2020 18:42:00 +0000
Date:   Sat, 15 Aug 2020 19:42:00 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Meelis Roos <mroos@linux.ee>
Cc:     Mike Rapoport <rppt@linux.ibm.com>, linux-parisc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Pekka Enberg <penberg@kernel.org>,
        Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Joerg Roedel <joro@8bytes.org>, Joerg Roedel <jroedel@suse.de>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
        Stafford Horne <shorne@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: (bisected) parisc boot crash in post-5.8 git - pgalloc changes
Message-ID: <20200815184200.GA17456@casper.infradead.org>
References: <820716ab-0c6d-5154-0789-072b01011313@linux.ee>
 <9f2b5ebd-e4a4-0fa1-6cd3-4b9f6892d1ad@linux.ee>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f2b5ebd-e4a4-0fa1-6cd3-4b9f6892d1ad@linux.ee>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Aug 15, 2020 at 09:35:05PM +0300, Meelis Roos wrote:
> > While 5.8.0 worked fine on my HP RP2470 (Gentoo with 10.2.0 kgcc), yesterdays dddcbc139e96 and todays a1d21081a60d crash on boot. I have started bisecting it.
> 
> And finished now. I included all CC-s and SOB-s from the commit to this mail - sorry if too broad.
> 
> 1355c31eeb7ea61a7f2f2937d17cd4e343a6b5af is the first bad commit

yes, I see the problem.

arch/parisc/include/asm/pgtable.h:#define PMD_ORDER     1 /* Number of pages per pmd */

-static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
-{
-       pmd_t *pmd = (pmd_t *)__get_free_pages(GFP_KERNEL, PMD_ORDER);

+       page = alloc_pages(gfp, 0);

So I think the quick fix is to restore the parisc pmd_alloc_one and define
__HAVE_ARCH_PMD_ALLOC_ONE.  I wasn't following this series too closely,
so I shan't propose a patch, but leave it up to Mike.  I'd probably miss
some subtlety.
