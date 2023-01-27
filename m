Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C1867F251
	for <lists+linux-parisc@lfdr.de>; Sat, 28 Jan 2023 00:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjA0Xjq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 27 Jan 2023 18:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232559AbjA0XjX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 27 Jan 2023 18:39:23 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41A537B57
        for <linux-parisc@vger.kernel.org>; Fri, 27 Jan 2023 15:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=K8+fy7FRjoVZidnVL7NtMIo8IXxS3d1BnUyMMPPC9oc=; b=ooQk1TA+f+DrOjQMlm89Inyzpg
        lFQMvHJnMF9aUIfxZDA5QHjwBWayEdS1UKahn/6alkpOkOu93CiHITIjH4q26TMqPz0LqLb+u4A9w
        bvVmJVy5EmEcO4YBklF8PpNbGIiczKLTLZCC8IIDo9WvHwDXg47v2+4RjE0dArtiIuUp6usQpDCWN
        S6A3zLtWqmQejjc9SbxNY0rlgz13JLZXnCP8As3n0SWzWNGecXBrUouEqDZb3DdPZ2V/wxS9/5HEX
        OHofakBnjUPY3pp+vFWzWOwIW1xCCENG8Oqw7WsxZy560RZy8FSGkqXrZFKFhz7uRJNqWyr0O+O5/
        vy/x+OsQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pLYJO-00891G-RG; Fri, 27 Jan 2023 23:39:14 +0000
Date:   Fri, 27 Jan 2023 23:39:14 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Ira Weiny <ira.weiny@intel.com>,
        "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH] parisc: Ensure page-aligned addresses in cache flush and
 copy functions
Message-ID: <Y9Rgor0T8dSzPgiX@casper.infradead.org>
References: <20230127213941.83967-1-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127213941.83967-1-deller@gmx.de>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Jan 27, 2023 at 10:39:41PM +0100, Helge Deller wrote:
> Matthew Wilcox noticed, that if ARCH_HAS_FLUSH_ON_KUNMAP is defined
> (which is the case for PA-RISC), __kunmap_local() calls
> kunmap_flush_on_unmap(), which may call the parisc flush functions with
> a non-page-aligned address and thus the page might not be fully flushed.
> 
> To prevent similiar cases, page-align any given address in the
> following parisc low-level calls:
> - clear_page_asm(),
> - copy_page_asm(),
> - copy_user_page_asm(),
> - clear_user_page_asm(),
> - flush_kernel_dcache_page_asm(),
> - purge_kernel_dcache_page_asm() and
> - flush_kernel_icache_page()

I don't think this is the right way to go.  Imagine that we enable
large folios on architectures that don't support TRANSPARENT_HUGEPAGE
(ie PA-RISC).  Then folio_zero_range() is going to call kmap_local()
and kunmap_local() once per folio instead of once per page, and so we'll
need to flush the entire folio, not just the page.
