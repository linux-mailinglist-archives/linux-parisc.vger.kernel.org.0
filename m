Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68858C92F1
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2019 22:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfJBUhn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 2 Oct 2019 16:37:43 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:49009 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726302AbfJBUhm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 2 Oct 2019 16:37:42 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20191002203741.KXVW4444.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 2 Oct 2019 16:37:41 -0400
Received: from [192.168.0.101] (really [65.93.108.228])
          by mtlspm01.bell.net with ESMTP
          id <20191002203741.ENKZ87666.mtlspm01.bell.net@[192.168.0.101]>;
          Wed, 2 Oct 2019 16:37:41 -0400
Subject: Re: some progress with radeon on C8000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org, deller@gmx.de
References: <20190928214436.GC18685@stackframe.org>
 <20191002141907.GA8897@alpha.franken.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <c9ef7686-96fc-e4ed-33d2-ebee7fb4aeed@bell.net>
Date:   Wed, 2 Oct 2019 16:37:41 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002141907.GA8897@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 cx=a_idp_d a=J40defo5PZcdwcBNGSby1A==:117 a=J40defo5PZcdwcBNGSby1A==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=FBHGMhGWAAAA:8 a=Pao8065q8881-Eg7d54A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfGQZcYd3FkyhiCQduU747q2SqK9Bp7eItXeecjo6unM6nL7LHvEMBmRL4KbFTNGeKYtBq5UXcSNA4iyzIA20lcYl1sF7cbCVs9gM032mbZkwKoPEccPv Z+kL/xkdLOo4VUe4DZPLzPf5REY/7SCY/gdpP4kiK8XvPdyjYPJdlqav4cMyhky0rjnP1DxFlshAbg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-10-02 10:19 a.m., Thomas Bogendoerfer wrote:
> On Sat, Sep 28, 2019 at 11:44:36PM +0200, Sven Schnelle wrote:
>> Hi List,
>>
>> i've spent quite some time this evening debugging why the Fire GL
>> doesn't work in my C8000. As reading debug output didn't give me
>> much insights, i decided to throw some Hardware at the Problem and
>> connect a Logic Analyzer to the C8000. For that i switched to an old
>> PCI Radeon 7000 which shows the same ring test failure.
> below patch (with debug print left in) got PCI radeon working for me, when
> I played with it last time.  The added fdc is a real fix, while the change
> in parisc_agp_mask_memory is just a hack. The big problem there is to get
> virtual address where the memory is mapped to in user space...
>
> Thomas.
>
>
> diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
> index 15f2e7025b78..756bc4a265d9 100644
> --- a/drivers/char/agp/parisc-agp.c
> +++ b/drivers/char/agp/parisc-agp.c
> @@ -20,6 +20,7 @@
>  #include <linux/agp_backend.h>
>  #include <linux/log2.h>
>  #include <linux/slab.h>
> +#include <linux/pagemap.h>
>  
>  #include <asm/parisc-device.h>
>  #include <asm/ropes.h>
> @@ -162,6 +163,16 @@ parisc_agp_insert_memory(struct agp_memory *mem, off_t pg_start, int type)
>  			info->gatt[j] =
>  				parisc_agp_mask_memory(agp_bridge,
>  					paddr, type);
> +			asm volatile("fdc %%r0(%0)" : : "r" (&info->gatt[j]));
> +#if 0
> +#if 0
> +			printk("i %x j %lx page %p va %lx  paddr %lx gatt %lx\n",
> +			       i, j, mem->pages[i], __va(paddr), paddr, info->gatt[j]);
> +#else
> +			printk("i %x j %lx page %p va %lx  paddr %lx\n",
> +			       i, j, mem->pages[i], __va(paddr), paddr);
> +#endif
> +#endif
>  		}
>  	}
>  
> @@ -184,7 +195,7 @@ parisc_agp_remove_memory(struct agp_memory *mem, off_t pg_start, int type)
>  	io_pg_start = info->io_pages_per_kpage * pg_start;
>  	io_pg_count = info->io_pages_per_kpage * mem->page_count;
>  	for (i = io_pg_start; i < io_pg_count + io_pg_start; i++) {
> -		info->gatt[i] = agp_bridge->scratch_page;
> +		// info->gatt[i] = agp_bridge->scratch_page;
>  	}
>  
>  	agp_bridge->driver->tlb_flush(mem);
> @@ -195,7 +206,22 @@ static unsigned long
>  parisc_agp_mask_memory(struct agp_bridge_data *bridge, dma_addr_t addr,
>  		       int type)
>  {
> -	return SBA_PDIR_VALID_BIT | addr;
> +#if 1
> +	u64 pa;
> +	register unsigned ci; /* coherent index */
> +	
> +	pa = addr & IOVP_MASK;
> +	mtsp(0,1);
> +	asm("lci 0(%%sr1, %1), %0" : "=r" (ci) : "r" (__va(pa)));
I believe you can remove the mtsp and just use "lci 0(%1), %0" to load the coherence index.  The space
registers sr4 to sr7 are always 0 in kernel.

> +	
> +	pa |= (ci >> PAGE_SHIFT) & 0xff;  /* move CI (8 bits) into lowest byte */
> +
> +	pa |= SBA_PDIR_VALID_BIT;	/* set "valid" bit */
> +
> +	return cpu_to_le64(pa);
> +#else
> +	return cpu_to_le64(SBA_PDIR_VALID_BIT | addr);
> +#endif
>  }
>  
>  static void
>

Dave

-- 
John David Anglin  dave.anglin@bell.net

