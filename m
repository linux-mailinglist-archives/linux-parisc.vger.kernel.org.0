Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3DA29734
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 13:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390772AbfEXLco (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 07:32:44 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:57275 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390654AbfEXLco (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 07:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:To:From:Date;
        bh=fQ8LXvp4CHx93THlN+T8RLY7dLAsldw7mbUJpka8h5M=; b=cbpkdXC1QPrpLntjrhL6EvKpKo
        RaGk3LjtRe6p6yghyApXJnJCVMCRnZeas7WxoIOvMiUT1qsGUfNjhbQqiZXkl1N4xdUraYxvLHRLS
        iwCcmFoP/dBJVv5syd1uDJBb+zJBNDIrXNAfyrYU8Kd3ruXIIrx/U3PVM0KeI4b2It+M=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hU8RG-0003kK-TM
        for linux-parisc@vger.kernel.org; Fri, 24 May 2019 13:32:42 +0200
Date:   Fri, 24 May 2019 13:32:41 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: PCI HPMC on C240 with alternatives Patching
Message-ID: <20190524113241.GA11609@t470p.stackframe.org>
References: <20190524065850.GA9849@t470p.stackframe.org>
 <20190524105003.GE9450@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524105003.GE9450@t470p.stackframe.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi List,

On Fri, May 24, 2019 at 12:50:03PM +0200, Sven Schnelle wrote:
> On Fri, May 24, 2019 at 08:58:50AM +0200, Sven Schnelle wrote:
> > Hi List,
> > 
> > i recently got my hands on an old C240. I see a Kernel oops pretty early when
> > alternatives patching is enabled:
> > [..]
> > My (wild) guess is that we're patching away some memory barrier or cache flush
> > so the SCRIPTS engine in the SCSI controller starts executing garbage and triggers
> > a PCI bus read/write to an invalid address. The reason the INB() is given as the
> > HPMC location is likely caused by the delay between writing DSPS and the chip actually
> > starting to fetch insn/data.
> > 
> > Does that ring any bell for someone on the list? Otherwise i can check the
> > alternatives patching over the weekend, i think there are not that many locations.
> > 
> > The good thing is it's reproducible - it always crashes. Either in SCSI or in
> > Tulip.
> 
> Did a quick test, removing ALT_COND_N_IOC_FDC from asm_io_fdc() seems to fix this
> issue. Haven't looked in more detail into this though.

Added some debugging:

[   25.405365] boot_cpu_data.pdc_capabilities: 2

So PDC says IO-PDIR fetches are not performed coherently, *BUT*:

When this bit is clear, flushes and syncs are not required. This
bit is only applicable to SBAs, and does not apply to Legacy IOAs.

With my limited understand i would think that C240 has a 'Legacy IOA' while
C3xxx has SBA? So i think we would need to add some check whether we have
an IOA or SBA in the alternatives code?

Sven

