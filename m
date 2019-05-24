Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2EE92A040
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 23:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404202AbfEXVLa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 17:11:30 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:59467 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404197AbfEXVLa (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 17:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=u5mSazLUN/uKwSpBLDTE3PqJY4YRpVyjUW7WfPXJI6Q=; b=Ep1s1lKJOuhaFs7xJ+XzoYnMXV
        lTu0tM9G5ChiEyzdmtNzUmtd0YoD0ONfWMFA974trLTP4/vHS5BfmqGEhzffcTYz7ivPzM+quKumF
        steMInZXNmVxpW8rcz/ht67zxPV5k25gfD38HC2qZKEcU6fgNr1UjZLLYKx1MaQfMOR0=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hUHTM-0003CN-TE; Fri, 24 May 2019 23:11:28 +0200
Date:   Fri, 24 May 2019 23:11:27 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: PCI HPMC on C240 with alternatives Patching
Message-ID: <20190524211127.GB20978@t470p.stackframe.org>
References: <20190524065850.GA9849@t470p.stackframe.org>
 <20190524105003.GE9450@t470p.stackframe.org>
 <20190524113241.GA11609@t470p.stackframe.org>
 <20190524153819.GA778@t470p.stackframe.org>
 <20190524195830.GA18978@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524195830.GA18978@ls3530.dellerweb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Fri, May 24, 2019 at 09:58:30PM +0200, Helge Deller wrote:

> > I did the patch below to check for legacy IO Adapters. Is HW_BCPORT the right
> > type? On my C240 both GSC Adapters are HW_BCPORT.
> 
> I'm not sure.
> Seems to be dependend on the CPU.
> See comment in drivers/parisc/ccio-dma.c, line 607ff:
> 
>         /* FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
>         **        PCX-U/U+ do. (eg C200/C240)
>         **        PCX-T'? Don't know. (eg C110 or similar K-class)
>         **
>         ** See PDC_MODEL/option 0/SW_CAP word for "Non-coherent IO-PDIR bit".
>         **
>         ** "Since PCX-U employs an offset hash that is incompatible with
>         ** the real mode coherence index generation of U2, the PDIR entry
>         ** must be flushed to memory to retain coherence."
> 
> 
> Can you try this patch instead?
> [..]

Works on my C240 and C3750. Thanks!

Regards
Sven
