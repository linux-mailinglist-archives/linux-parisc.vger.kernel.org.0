Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5DFCB9DC
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Oct 2019 14:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729586AbfJDMGx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 4 Oct 2019 08:06:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:44293 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbfJDMGx (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 4 Oct 2019 08:06:53 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1iGMMF-0001Ak-00; Fri, 04 Oct 2019 14:06:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 43AE2C01D9; Fri,  4 Oct 2019 14:06:32 +0200 (CEST)
Date:   Fri, 4 Oct 2019 14:06:32 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Sven Schnelle <svens@stackframe.org>, linux-parisc@vger.kernel.org,
        deller@gmx.de
Subject: Re: some progress with radeon on C8000
Message-ID: <20191004120632.GA7472@alpha.franken.de>
References: <20190928214436.GC18685@stackframe.org>
 <20191002141907.GA8897@alpha.franken.de>
 <c9ef7686-96fc-e4ed-33d2-ebee7fb4aeed@bell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9ef7686-96fc-e4ed-33d2-ebee7fb4aeed@bell.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Oct 02, 2019 at 04:37:41PM -0400, John David Anglin wrote:
> On 2019-10-02 10:19 a.m., Thomas Bogendoerfer wrote:
> > +	pa = addr & IOVP_MASK;
> > +	mtsp(0,1);
> > +	asm("lci 0(%%sr1, %1), %0" : "=r" (ci) : "r" (__va(pa)));
> I believe you can remove the mtsp and just use "lci 0(%1), %0" to load the coherence index.  The space
> registers sr4 to sr7 are always 0 in kernel.

ok, good to know.

while reading this I realized what the other hacks were for, which I didn't
include in my first mail. 

diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index 028ab6007873..e84c7652eb1b 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -66,7 +67,8 @@ static int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_mem_reg *bo_mem)
 		if (!page)
 			page = ttm->dummy_read_page;
 
-		mem->pages[mem->page_count++] = page;
+		mem->pages[(ttm->num_pages - 1) - mem->page_count] = page;
+		mem->page_count++;
 	}
 	agp_be->mem = mem;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d0459b392e5e..4bb301cab128 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -571,8 +571,14 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 		 */
 		prot = ttm_io_prot(mem->placement, PAGE_KERNEL);
 		map->bo_kmap_type = ttm_bo_map_vmap;
+		printk("vmap %p\n", ttm->pages[start_page]);
+#if 0
 		map->virtual = vmap(ttm->pages + start_page, num_pages,
 				    0, prot);
+#else
+		map->virtual = kmap(ttm->pages[start_page]);
+#endif
+		
 	}
 	return (!map->virtual) ? -ENOMEM : 0;
 }

 
This is needed to be able to get the virtual address with __va(pa).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
