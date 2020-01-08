Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86BCB133ED9
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Jan 2020 11:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgAHKFk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Jan 2020 05:05:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59375 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726368AbgAHKFk (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Jan 2020 05:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578477939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XYNRjJ4ki8ZOiAW4tvRvbpcfvmsaNw/kNwbZmqeksiM=;
        b=L5s3sEFQ1dlow8d9hGAtvGtWXzsoFaarTpUX63wjkE/wB0op5tGI4FwjWYSDssFdAMkwau
        ptWCjudO/X+f17jh3gb3ADHvIqEwxHWg2lN4fgp5Qqymz/3VZLqYqhvHP3zlb+ldceCTjW
        39UtHiu5QdDRTJLX6wvFgdFIVqMpgY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-7P8UxfkjOOy-AsMo5ZU2Cg-1; Wed, 08 Jan 2020 05:05:36 -0500
X-MC-Unique: 7P8UxfkjOOy-AsMo5ZU2Cg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8915E8A2C40;
        Wed,  8 Jan 2020 10:05:31 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A98C57C34E;
        Wed,  8 Jan 2020 10:05:28 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 008A5S4w002092;
        Wed, 8 Jan 2020 05:05:28 -0500
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 008A5O8c002083;
        Wed, 8 Jan 2020 05:05:24 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 8 Jan 2020 05:05:24 -0500 (EST)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Mike Rapoport <rppt@linux.ibm.com>
cc:     Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org,
        Meelis Roos <mroos@linux.ee>, Helge Deller <deller@gmx.de>,
        Anatoly Pugachev <matorola@gmail.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greentime Hu <green.hu@gmail.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Jeff Dike <jdike@addtoit.com>,
        John David Anglin <dave.anglin@bell.net>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Mark Salter <msalter@redhat.com>,
        Matt Turner <mattst88@gmail.com>,
        Michal Simek <monstr@monstr.eu>, Peter Rosin <peda@axentia.se>,
        Richard Weinberger <richard@nod.at>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Russell King <linux@armlinux.org.uk>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Sam Creasey <sammy@sammy.net>,
        Vincent Chen <deanbo422@gmail.com>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: new panic in 5.5-rc1 (parisc, kmem_cache_open)
In-Reply-To: <20200108080208.GA8272@linux.ibm.com>
Message-ID: <alpine.LRH.2.02.2001080504340.1997@file01.intranet.prod.int.rdu2.redhat.com>
References: <de6b77cc-9c32-23fa-5caf-b6d370792e85@linux.ee> <20191209202626.0f2c2112@wim.jer> <alpine.LRH.2.02.2001070944280.18122@file01.intranet.prod.int.rdu2.redhat.com> <20200108080208.GA8272@linux.ibm.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Wed, 8 Jan 2020, Mike Rapoport wrote:

> On Tue, Jan 07, 2020 at 09:52:20AM -0500, Mikulas Patocka wrote:
> > 
> > On Mon, 9 Dec 2019, Jeroen Roovers wrote:
> > 
> > > On Mon, 9 Dec 2019 20:22:17 +0200
> > > Meelis Roos <mroos@linux.ee> wrote:
> > > 
> > > > I tried 5.5-rc1 on RP3440 and got a surprise panic on boot (5.4
> > > > worked):
> > > 
> > > Ah, I was going to reported this, too.
> > > 
> > > > mem auto-init: stack:off, heap alloc:off, heap free:off
> > > > Memory: 12348004K/12580864K available (6438K kernel code, 2148K
> > > > rwdata, 954K rodata, 1193K init, 500K bss, 232860K reserved, 0K
> > > > cma-reserved)
> > > 
> > > I see an additional message after this:
> > > 
> > > random: get_random_u64 called from __kmem_cache_create+0x70/0x660 with
> > > crng_init=0
> > > 
> > > And then the same or similar enough backtrace.
> > > 
> > > 
> > > Regards,
> > >      jer
> > 
> > Hi
> > 
> > I also have this panic. I bisected it and it is caused by the patch 
> > d96885e277b5edcd1e474e8b1579005163f23dbe.
> 
> My guess would be that pgd is not populated after the change.
> Can you please check if the below hack fixes the crash?
> 
> 
> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index ddca8287d43b..354cf060b67f 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -401,7 +401,7 @@ static void __init map_pages(unsigned long start_vaddr,
>  			pmd = (pmd_t *) __pa(pmd);
>  		}
>  
> -		pgd_populate(NULL, pg_dir, __va(pmd));
> +		pud_populate(NULL, (pud_t *)pg_dir, __va(pmd));
>  #endif
>  		pg_dir++;
>  
>  

Test-by: Mikulas Patocka <mpatocka@redhat.com>

This patch fixes it.

Mikulas

