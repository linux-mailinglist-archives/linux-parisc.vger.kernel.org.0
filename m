Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1B9C8AEE
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2019 16:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbfJBOT0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 2 Oct 2019 10:19:26 -0400
Received: from elvis.franken.de ([193.175.24.41]:37413 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728231AbfJBOT0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 2 Oct 2019 10:19:26 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1iFfTQ-0005jR-00; Wed, 02 Oct 2019 16:19:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BD4FEC01A5; Wed,  2 Oct 2019 16:19:07 +0200 (CEST)
Date:   Wed, 2 Oct 2019 16:19:07 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org, deller@gmx.de
Subject: Re: some progress with radeon on C8000
Message-ID: <20191002141907.GA8897@alpha.franken.de>
References: <20190928214436.GC18685@stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190928214436.GC18685@stackframe.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Sep 28, 2019 at 11:44:36PM +0200, Sven Schnelle wrote:
> Hi List,
> 
> i've spent quite some time this evening debugging why the Fire GL
> doesn't work in my C8000. As reading debug output didn't give me
> much insights, i decided to throw some Hardware at the Problem and
> connect a Logic Analyzer to the C8000. For that i switched to an old
> PCI Radeon 7000 which shows the same ring test failure.

below patch (with debug print left in) got PCI radeon working for me, when
I played with it last time.  The added fdc is a real fix, while the change
in parisc_agp_mask_memory is just a hack. The big problem there is to get
virtual address where the memory is mapped to in user space...

Thomas.


diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
index 15f2e7025b78..756bc4a265d9 100644
--- a/drivers/char/agp/parisc-agp.c
+++ b/drivers/char/agp/parisc-agp.c
@@ -20,6 +20,7 @@
 #include <linux/agp_backend.h>
 #include <linux/log2.h>
 #include <linux/slab.h>
+#include <linux/pagemap.h>
 
 #include <asm/parisc-device.h>
 #include <asm/ropes.h>
@@ -162,6 +163,16 @@ parisc_agp_insert_memory(struct agp_memory *mem, off_t pg_start, int type)
 			info->gatt[j] =
 				parisc_agp_mask_memory(agp_bridge,
 					paddr, type);
+			asm volatile("fdc %%r0(%0)" : : "r" (&info->gatt[j]));
+#if 0
+#if 0
+			printk("i %x j %lx page %p va %lx  paddr %lx gatt %lx\n",
+			       i, j, mem->pages[i], __va(paddr), paddr, info->gatt[j]);
+#else
+			printk("i %x j %lx page %p va %lx  paddr %lx\n",
+			       i, j, mem->pages[i], __va(paddr), paddr);
+#endif
+#endif
 		}
 	}
 
@@ -184,7 +195,7 @@ parisc_agp_remove_memory(struct agp_memory *mem, off_t pg_start, int type)
 	io_pg_start = info->io_pages_per_kpage * pg_start;
 	io_pg_count = info->io_pages_per_kpage * mem->page_count;
 	for (i = io_pg_start; i < io_pg_count + io_pg_start; i++) {
-		info->gatt[i] = agp_bridge->scratch_page;
+		// info->gatt[i] = agp_bridge->scratch_page;
 	}
 
 	agp_bridge->driver->tlb_flush(mem);
@@ -195,7 +206,22 @@ static unsigned long
 parisc_agp_mask_memory(struct agp_bridge_data *bridge, dma_addr_t addr,
 		       int type)
 {
-	return SBA_PDIR_VALID_BIT | addr;
+#if 1
+	u64 pa;
+	register unsigned ci; /* coherent index */
+	
+	pa = addr & IOVP_MASK;
+	mtsp(0,1);
+	asm("lci 0(%%sr1, %1), %0" : "=r" (ci) : "r" (__va(pa)));
+	
+	pa |= (ci >> PAGE_SHIFT) & 0xff;  /* move CI (8 bits) into lowest byte */
+
+	pa |= SBA_PDIR_VALID_BIT;	/* set "valid" bit */
+
+	return cpu_to_le64(pa);
+#else
+	return cpu_to_le64(SBA_PDIR_VALID_BIT | addr);
+#endif
 }
 
 static void

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
