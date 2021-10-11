Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8962F4292D6
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Oct 2021 17:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbhJKPI6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 11 Oct 2021 11:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbhJKPIz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 11 Oct 2021 11:08:55 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EDAC06161C
        for <linux-parisc@vger.kernel.org>; Mon, 11 Oct 2021 08:06:54 -0700 (PDT)
Received: (qmail 17817 invoked from network); 11 Oct 2021 15:06:52 -0000
Received: from p200300cf07110c00f032864a1b601834.dip0.t-ipconnect.de ([2003:cf:711:c00:f032:864a:1b60:1834]:36570 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <deller@gmx.de>; Mon, 11 Oct 2021 17:06:52 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 2/5] parisc: deduplicate code in flush_cache_mm() and flush_cache_range()
Date:   Mon, 11 Oct 2021 17:06:52 +0200
Message-ID: <4685603.31r3eYUQgx@daneel.sf-tec.de>
In-Reply-To: <20211009182439.30016-3-svens@stackframe.org>
References: <20211009182439.30016-1-svens@stackframe.org> <20211009182439.30016-3-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4349407.LvFx2qVVIh"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart4349407.LvFx2qVVIh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 9. Oktober 2021, 20:24:36 CEST schrieb Sven Schnelle:
> Parts of both functions are the same, so deduplicate them. No functional
> change.
> 
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>  arch/parisc/kernel/cache.c | 81 ++++++++++++++------------------------
>  1 file changed, 30 insertions(+), 51 deletions(-)
> 
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index a1a7e2b0812f..c61827e4928a 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -543,10 +543,33 @@ static inline pte_t *get_ptep(pgd_t *pgd, unsigned
> long addr) return ptep;
>  }
> 
> +static void flush_cache_pages(struct vm_area_struct *vma, struct mm_struct
> *mm, +			      unsigned long start, unsigned long end)
> +{
> +	unsigned long addr, pfn;
> +	pte_t *ptep;
> +
> +	for (addr = start; addr < end; addr += PAGE_SIZE) {
> +		ptep = get_ptep(mm->pgd, addr);
> +		if (ptep) {
> +			pfn = pte_pfn(*ptep);
> +			flush_cache_page(vma, addr, pfn);
> +		}
> +	}
> +}
> +
> +static void flush_user_cache_tlb(struct vm_area_struct *vma,
> +				 unsigned long start, unsigned 
long end)
> +{
> +	flush_user_dcache_range_asm(start, end);
> +	if (vma->vm_flags & VM_EXEC)
> +		flush_user_icache_range_asm(start, end);
> +	flush_tlb_range(vma, start, end);
> +}

What you add here is less than what you removed below. If that is intentional 
I would welcome a description on why it is correct in the commit message.

>  void flush_cache_mm(struct mm_struct *mm)
>  {
>  	struct vm_area_struct *vma;
> -	pgd_t *pgd;
> 
>  	/* Flushing the whole cache on each cpu takes forever on
>  	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
> @@ -560,46 +583,20 @@ void flush_cache_mm(struct mm_struct *mm)
> 
>  	preempt_disable();
>  	if (mm->context == mfsp(3)) {
> -		for (vma = mm->mmap; vma; vma = vma->vm_next) {
> -			flush_user_dcache_range_asm(vma->vm_start, 
vma->vm_end);
> -			if (vma->vm_flags & VM_EXEC)
> -				flush_user_icache_range_asm(vma-
>vm_start, vma->vm_end);
> -			flush_tlb_range(vma, vma->vm_start, vma-
>vm_end);
> -		}
> +		for (vma = mm->mmap; vma; vma = vma->vm_next)
> +			flush_user_cache_tlb(vma, vma->vm_start, vma-
>vm_end);
>  		preempt_enable();
>  		return;
>  	}
> 
> -	pgd = mm->pgd;
> -	for (vma = mm->mmap; vma; vma = vma->vm_next) {
> -		unsigned long addr;
> -
> -		for (addr = vma->vm_start; addr < vma->vm_end;
> -		     addr += PAGE_SIZE) {
> -			unsigned long pfn;
> -			pte_t *ptep = get_ptep(pgd, addr);
> -			if (!ptep)
> -				continue;
> -			pfn = pte_pfn(*ptep);
> -			if (!pfn_valid(pfn))
> -				continue;
> -			if (unlikely(mm->context)) {
> -				flush_tlb_page(vma, addr);
> -				__flush_cache_page(vma, addr, 
PFN_PHYS(pfn));
> -			} else {
> -				__purge_cache_page(vma, addr, 
PFN_PHYS(pfn));
> -			}
> -		}
> -	}
> +	for (vma = mm->mmap; vma; vma = vma->vm_next)
> +		flush_cache_pages(vma, mm, vma->vm_start, vma->vm_end);
>  	preempt_enable();
>  }
> 
>  void flush_cache_range(struct vm_area_struct *vma,
>  		unsigned long start, unsigned long end)
>  {
> -	pgd_t *pgd;
> -	unsigned long addr;
> -
>  	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
>  	    end - start >= parisc_cache_flush_threshold) {
>  		if (vma->vm_mm->context)
> @@ -610,30 +607,12 @@ void flush_cache_range(struct vm_area_struct *vma,
> 
>  	preempt_disable();
>  	if (vma->vm_mm->context == mfsp(3)) {
> -		flush_user_dcache_range_asm(start, end);
> -		if (vma->vm_flags & VM_EXEC)
> -			flush_user_icache_range_asm(start, end);
> -		flush_tlb_range(vma, start, end);
> +		flush_user_cache_tlb(vma, start, end);
>  		preempt_enable();
>  		return;
>  	}
> 
> -	pgd = vma->vm_mm->pgd;
> -	for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) 
{
> -		unsigned long pfn;
> -		pte_t *ptep = get_ptep(pgd, addr);
> -		if (!ptep)
> -			continue;
> -		pfn = pte_pfn(*ptep);
> -		if (pfn_valid(pfn)) {
> -			if (unlikely(vma->vm_mm->context)) {
> -				flush_tlb_page(vma, addr);
> -				__flush_cache_page(vma, addr, 
PFN_PHYS(pfn));
> -			} else {
> -				__purge_cache_page(vma, addr, 
PFN_PHYS(pfn));
> -			}
> -		}
> -	}
> +	flush_cache_pages(vma, vma->vm_mm, vma->vm_start, vma->vm_end);
>  	preempt_enable();
>  }


--nextPart4349407.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYWRTDAAKCRBcpIk+abn8
TvpRAKCfdn5iJ3pAFU32e907eMsxxEW0ogCeMbk4m/6rKgS3W1bHjJD8GCKsLA0=
=ANl6
-----END PGP SIGNATURE-----

--nextPart4349407.LvFx2qVVIh--



