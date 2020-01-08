Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C6613405B
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Jan 2020 12:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgAHLYi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Jan 2020 06:24:38 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:49536 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726107AbgAHLYh (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Jan 2020 06:24:37 -0500
Received: from wim.jer (jer.xs4all.nl [212.238.182.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jer)
        by smtp.gentoo.org (Postfix) with ESMTPSA id A051C34DEAE;
        Wed,  8 Jan 2020 11:24:31 +0000 (UTC)
Date:   Wed, 8 Jan 2020 12:24:21 +0100
From:   Jeroen Roovers <jer@gentoo.org>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Mike Rapoport <rppt@linux.ibm.com>, linux-parisc@vger.kernel.org,
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
Message-ID: <20200108122421.37e3d709@wim.jer>
In-Reply-To: <alpine.LRH.2.02.2001080504340.1997@file01.intranet.prod.int.rdu2.redhat.com>
References: <de6b77cc-9c32-23fa-5caf-b6d370792e85@linux.ee>
        <20191209202626.0f2c2112@wim.jer>
        <alpine.LRH.2.02.2001070944280.18122@file01.intranet.prod.int.rdu2.redhat.com>
        <20200108080208.GA8272@linux.ibm.com>
        <alpine.LRH.2.02.2001080504340.1997@file01.intranet.prod.int.rdu2.redhat.com>
Organization: Gentoo Foundation
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 8 Jan 2020 05:05:24 -0500 (EST)
Mikulas Patocka <mpatocka@redhat.com> wrote:

> On Wed, 8 Jan 2020, Mike Rapoport wrote:
> 
> > On Tue, Jan 07, 2020 at 09:52:20AM -0500, Mikulas Patocka wrote:  
> > > 
> > > On Mon, 9 Dec 2019, Jeroen Roovers wrote:
> > >   
> > > > On Mon, 9 Dec 2019 20:22:17 +0200
> > > > Meelis Roos <mroos@linux.ee> wrote:
> > > >   
> > > > > I tried 5.5-rc1 on RP3440 and got a surprise panic on boot
> > > > > (5.4 worked):  
> > > > 
> > > > Ah, I was going to reported this, too.
> > > >   
> > > > > mem auto-init: stack:off, heap alloc:off, heap free:off
> > > > > Memory: 12348004K/12580864K available (6438K kernel code,
> > > > > 2148K rwdata, 954K rodata, 1193K init, 500K bss, 232860K
> > > > > reserved, 0K cma-reserved)  
> > > > 
> > > > I see an additional message after this:
> > > > 
> > > > random: get_random_u64 called from
> > > > __kmem_cache_create+0x70/0x660 with crng_init=0
> > > > 
> > > > And then the same or similar enough backtrace.
> > > > 
> > > > 
> > > > Regards,
> > > >      jer  
> > > 
> > > Hi
> > > 
> > > I also have this panic. I bisected it and it is caused by the
> > > patch d96885e277b5edcd1e474e8b1579005163f23dbe.  
> > 
> > My guess would be that pgd is not populated after the change.
> > Can you please check if the below hack fixes the crash?
> > 
> > 
> > diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> > index ddca8287d43b..354cf060b67f 100644
> > --- a/arch/parisc/mm/init.c
> > +++ b/arch/parisc/mm/init.c
> > @@ -401,7 +401,7 @@ static void __init map_pages(unsigned long
> > start_vaddr, pmd = (pmd_t *) __pa(pmd);
> >  		}
> >  
> > -		pgd_populate(NULL, pg_dir, __va(pmd));
> > +		pud_populate(NULL, (pud_t *)pg_dir, __va(pmd));
> >  #endif
> >  		pg_dir++;
> >  
> >    
> 
> Test-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> This patch fixes it.
> 
> Mikulas
> 

Fixes the issue on a C8000.

Tested-by: Jeroen Roovers <jer@gentoo.org>


Thanks,
     jer
