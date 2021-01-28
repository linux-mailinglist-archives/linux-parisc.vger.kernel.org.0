Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330B630719F
	for <lists+linux-parisc@lfdr.de>; Thu, 28 Jan 2021 09:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhA1IhM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 28 Jan 2021 03:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhA1Igx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 28 Jan 2021 03:36:53 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD687C061574
        for <linux-parisc@vger.kernel.org>; Thu, 28 Jan 2021 00:36:12 -0800 (PST)
Received: (qmail 27175 invoked from network); 28 Jan 2021 08:35:51 -0000
Received: from p548d426b.dip0.t-ipconnect.de ([::ffff:84.141.66.107]:55290 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <dave.anglin@bell.net>; Thu, 28 Jan 2021 09:35:51 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Cc:     Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
Date:   Thu, 28 Jan 2021 09:36:01 +0100
Message-ID: <2053670.irdbgypaU6@eto.sf-tec.de>
In-Reply-To: <20210127211851.GA32689@ls3530.fritz.box>
References: <c696f95d-a5ba-1f73-fbe9-a5d3f25e79c0@bell.net> <4f76001d-f050-286f-4b6f-790554583eea@bell.net> <20210127211851.GA32689@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12697130.uLZWGnKmhe"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart12697130.uLZWGnKmhe
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 27. Januar 2021, 22:18:51 CET schrieb Helge Deller:
> On parisc a spinlock is stored in the next page behind the pgd which
> protects against parallel accesses to the pgd. That's why one additional
> page (PGD_ALLOC_ORDER) is allocated for the pgd.
> 
> Matthew Wilcox suggested that we instead should use a pointer in the
> struct page table for this spinlock and noted, that the comments for the
> PGD_ORDER and PMD_ORDER defines were wrong.
> 
> Both suggestions are addressed in this patch. The pgd spinlock
> (parisc_pgd_lock) is stored in the struct page table. In
> switch_mm_irqs_off() the physical address of this lock is loaded into
> cr28 (tr4) and the pgd into cr25, so that the fault handlers can
> directly access the lock.
> 
> The currently implemened Hybrid L2/L3 page table scheme (where the pmd
> is adjacent to the pgd) is dropped now too.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
> Signed-off-by: Helge Deller <deller@gmx.de>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> 
> diff --git a/arch/parisc/include/asm/mmu_context.h
> b/arch/parisc/include/asm/mmu_context.h index 46f8c22c5977..3e02b1f75e54
> 100644
> --- a/arch/parisc/include/asm/mmu_context.h
> +++ b/arch/parisc/include/asm/mmu_context.h
> @@ -5,6 +5,7 @@
>  #include <linux/mm.h>
>  #include <linux/sched.h>
>  #include <linux/atomic.h>
> +#include <linux/spinlock.h>
>  #include <asm-generic/mm_hooks.h>
> 
>  /* on PA-RISC, we actually have enough contexts to justify an allocator
> @@ -50,6 +51,14 @@ static inline void switch_mm_irqs_off(struct mm_struct
> *prev, struct mm_struct *next, struct task_struct *tsk)
>  {
>  	if (prev != next) {
> +#ifdef CONFIG_SMP
> +		/* phys address of tlb lock in cr28 (tr4) for TLB faults 
*/
> +		struct page *page;
> +
> +		page = virt_to_page((unsigned long) next->pgd);

This is one of the few cases you have a space after the cast.

Another one is in pgd_alloc():

>+       page = virt_to_page((unsigned long) pgd);

> diff --git a/arch/parisc/include/asm/pgalloc.h
> b/arch/parisc/include/asm/pgalloc.h index a6482b2ce0ea..9c1a54543c87 100644
> --- a/arch/parisc/include/asm/pgalloc.h
> +++ b/arch/parisc/include/asm/pgalloc.h
> @@ -68,43 +66,27 @@ static inline void pud_populate(struct mm_struct *mm,
> pud_t *pud, pmd_t *pmd) (__u32)(__pa((unsigned long)pmd) >>
> PxD_VALUE_SHIFT)));
>  }
> 
> -static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long
> address) 
> +static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned
> long addr)

Does that change add benefit?

> {
> -	return (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
> +	pmd_t *pmd;
> +
> +	pmd = (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
> +	if (pmd)

Maybe annotate that as likely() as it was in pgd_alloc() before?

> +		memset ((void *)pmd, 0, PAGE_SIZE << PMD_ORDER);
> +	return pmd;
>  }

> diff --git a/arch/parisc/include/asm/pgtable.h
> b/arch/parisc/include/asm/pgtable.h index 75cf84070fc9..c08c7b37e5f4 100644
> --- a/arch/parisc/include/asm/pgtable.h
> +++ b/arch/parisc/include/asm/pgtable.h
> @@ -94,10 +96,12 @@ static inline void purge_tlb_entries(struct mm_struct
> *mm, unsigned long addr) #define set_pte_at(mm, addr, ptep, pteval)		
	\
>  	do {							
\
>  		unsigned long flags;				
\
> -		spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
> +		spinlock_t *pgd_lock;				
\
> +		pgd_lock = pgd_spinlock((mm)->pgd);		\

These should just fit into a single line.

> +		spin_lock_irqsave(pgd_lock, flags);		\
>  		set_pte(ptep, pteval);				
\
>  		purge_tlb_entries(mm, addr);			
\
> -		spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
> +		spin_unlock_irqrestore(pgd_lock, flags);	\
>  	} while (0)
> 
>  #endif /* !__ASSEMBLY__ */

> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index 3ec633b11b54..4f3f180b0b20 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -681,6 +681,24 @@ static void __init parisc_bootmem_free(void)
>  	free_area_init(max_zone_pfn);
>  }
> 
> +static void __init parisc_init_pgd_lock(void)
> +{
> +	struct page *page;
> +
> +	page = virt_to_page((unsigned long) &swapper_pg_dir);

Another space.

> +	page->parisc_pgd_lock = &pa_swapper_pg_lock;
> +}
> +
> +#ifdef CONFIG_SMP
> +spinlock_t *pgd_spinlock(pgd_t *pgd)
> +{
> +	struct page *page;
> +
> +	page = virt_to_page((unsigned long) pgd);
> +	return page->parisc_pgd_lock;
> +}
> +#endif

This is very simple, and I suspect it being called rather often. Wouldn't it 
make sense to make it inline?

Eike
--nextPart12697130.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYBJ3cQAKCRBcpIk+abn8
TqpOAJ0WoJnpQzqNe35QDHLOkxrxMcZ71ACbB9V4Ht5mkp4JW8WabgoMklI1y/Y=
=4bvG
-----END PGP SIGNATURE-----

--nextPart12697130.uLZWGnKmhe--



