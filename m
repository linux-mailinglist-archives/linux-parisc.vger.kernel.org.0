Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F91742731C
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Oct 2021 23:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhJHVha (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 8 Oct 2021 17:37:30 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:45490 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbhJHVha (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 8 Oct 2021 17:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Type:MIME-Version:Message-ID:In-Reply-To
        :Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DkxB14yK1l8IBiEwtV4LYiS7ZJ2FQ3C7dEruoAxr6fU=; b=rkgtDrMcSo6gUlCTlcH1YTvkBf
        2tGzCSdSnx6EQ1ngOT10st6EGubOW4TjZpaYbG8p8sA5PlHZR63KBY6/ROHYBHL3Kr5rq8ehjmJiB
        YgWoyO4iwFITXpehILLv0e/gbd5EWyz5QhTZIwKxOjQaj6dFRDrnv4Gbroonod0RJ/3M=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by smtp.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mYxWf-0007Iq-9V; Fri, 08 Oct 2021 23:35:33 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/4] parisc: disable preemption during local tlb flush
References: <20211008204825.6229-1-svens@stackframe.org>
        <20211008204825.6229-2-svens@stackframe.org>
Date:   Fri, 08 Oct 2021 23:35:32 +0200
In-Reply-To: <20211008204825.6229-2-svens@stackframe.org> (Sven Schnelle's
        message of "Fri, 8 Oct 2021 22:48:23 +0200")
Message-ID: <87tuhrjj2z.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Sven Schnelle <svens@stackframe.org> writes:

> flush_cache_mm() fetches %sr3 via mtsp(3). If it matches mm->context,
> it flushes caches and the TLB. However, the TLB is cpu-local, so if the
> code gets preempted shortly after the mtsp(), and later resumed on another
> CPU, the wrong TLB is flushed.
>
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>  arch/parisc/kernel/cache.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index 39e02227e231..90656c49bc07 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -558,6 +558,7 @@ void flush_cache_mm(struct mm_struct *mm)
>  		return;
>  	}
>  
> +	preempt_disable();
>  	if (mm->context == mfsp(3)) {
>  		for (vma = mm->mmap; vma; vma = vma->vm_next) {
>  			flush_user_dcache_range_asm(vma->vm_start, vma->vm_end);
> @@ -565,8 +566,10 @@ void flush_cache_mm(struct mm_struct *mm)
>  				flush_user_icache_range_asm(vma->vm_start, vma->vm_end);
>  			flush_tlb_range(vma, vma->vm_start, vma->vm_end);
>  		}
> +		preempt_enable();
>  		return;
>  	}
> +	preempt_enable();
>  
>  	pgd = mm->pgd;
>  	for (vma = mm->mmap; vma; vma = vma->vm_next) {

I noticed that flush_cache_range() has the same problem. Helge, let me
know whether i should send a v2 with an additional patch, or a single
follow up patch. Both functions also look very similar, so i think
best would be to combine the code of these two functions.
