Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAB44D54C2
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Mar 2022 23:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343936AbiCJWpG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Mar 2022 17:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344442AbiCJWpF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Mar 2022 17:45:05 -0500
X-Greylist: delayed 3602 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Mar 2022 14:44:00 PST
Received: from outbound5f.eu.mailhop.org (outbound5f.eu.mailhop.org [3.127.8.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841BC1959DE
        for <linux-parisc@vger.kernel.org>; Thu, 10 Mar 2022 14:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646945870; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=RpyoNRrNA5VrxFDEeJmdk91HtISSDB66Hi6glLKfzmu6Qe8jFUzT0276q2DS0FchqqTUl7zIvcP4J
         +1DBVp78wv1+qfJbcBK+c2OSnAovLugb9qG+7plBWaExRqs6dKbezjm6yQPjKu8eosHJTqbG1MhbDx
         SIzFVXAwCnfV0zsGvMVrqZrwJtWVEnAJFL7FYB/+EMSKfZNk4+iwrw8cC6ILGcEnMZIArjNbYzkdgx
         Z2HMKv3YD2KQSK4U7kDedEtMxDHdYnKKYWRbIJv/MrqDZaeAAQ1z6SoD3/CDBUGS6+AKsPQvgzLj+Z
         lrrmFlT2ghy3M8XCQiq57TPIZ0Wh3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:dkim-signature:dkim-signature:from;
        bh=CFyOTT2WX1fnGZAikv3tjBmM0BfHbrM9gtdS9f+cyzc=;
        b=mYCu00/rAbZAIPDOtRqXHQL53jWXq/nxELcyqZlnlLrKTl21PO2CGQtKRLPYzja1k1rysN6f5WIy0
         ChXZXlSNN7Sn3zkVn+JjsB2BUuGL4bO6xBFttHfatsT6ecQZjRQyHTPnoS6b9HPkhaIzTZmHolusqS
         vVi6lN3TBm4PLO7RJSwPbhqz9wtmL3xwa15VysiwQYrIG2rdb1eREMGPYo5HW+qhAzScIU6xqwfzZ3
         gjrojoTQ7sqGZRb7IZWdDYLrRnCGT5qkEe/cA+Cl4mu3no4jNCAezuB3FOZ88MGdMYe5lWq7ujwGdo
         FOwokSz8SSK2TuinQ3n+vkYLNhVsbKQ==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=130.180.31.158;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=CFyOTT2WX1fnGZAikv3tjBmM0BfHbrM9gtdS9f+cyzc=;
        b=lgdk7iznVcwG1dRXbRHw94R+6XAZiiOKBfiex+rm+WEQui2Ds5zkCyWNzTJ1Cu23lKW8/d1loKYPz
         VdifqQGc8aG9zC7DPxk4PFvyRx/ZXfHSXkD1NUXJYm6wY8TAx2IW2sCDfXZDuOvnX9ctxGanPW5Xik
         3TXFTlSh6aNlDyP4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=CFyOTT2WX1fnGZAikv3tjBmM0BfHbrM9gtdS9f+cyzc=;
        b=K/RnmfkewdIrlX81huygjBFvu0yDoVAyqFq+VbkLPpY7NfrJVFRpEvyB0alVhu8snz0VKqIDp1NvN
         KU4fHADYXY72sfE5YoYX+1VHY4u2NNmkTD3j4eG4jsx2UZbxFd8t+I6zSNbKO5VDZyIZTI1e0yiQdN
         PSh0vuMh7Lp4DonkZ86BQYs9r7hAdfS5rGHh6fjm9m7v5V6IZfrn4HDoSfEAyNoJb+gHStamXy5cWx
         ERAuMt0LW5TJ8EpaY8V1K14UnEsSHsb3wmuGFw9rpZ3+mLxTeoIzFzYIXCYniu0oHutrskU4kpy7Xr
         VkBPdhtg2SM2HpzBadcrd6LRnMPk1+g==
X-Originating-IP: 130.180.31.158
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: bb28bfe0-a0b4-11ec-a079-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (ip-130-180-031-158.um40.pools.vodafone-ip.de [130.180.31.158])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id bb28bfe0-a0b4-11ec-a079-973b52397bcb;
        Thu, 10 Mar 2022 20:57:45 +0000 (UTC)
Received: from ip-109-193-149-228.um39.pools.vodafone-ip.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1nSPqy-0000e9-LQ; Thu, 10 Mar 2022 21:57:44 +0100
From:   Sven Schnelle <svens@stackframe.org>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
        Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Fix non-access data TLB cache flush faults
References: <Yij4pmK8Yjt7Wh1A@mx3210.localdomain>
Date:   Thu, 10 Mar 2022 21:57:42 +0100
In-Reply-To: <Yij4pmK8Yjt7Wh1A@mx3210.localdomain> (John David Anglin's
        message of "Wed, 9 Mar 2022 18:57:42 +0000")
Message-ID: <87fsnp34qh.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Dave,

John David Anglin <dave.anglin@bell.net> writes:

> When a page is not present, we get non-access data TLB faults from
> the fdc and fic instructions in flush_user_dcache_range_asm and
> flush_user_icache_range_asm. When these occur, the cache line is
> not invalidated and potentially we get memory corruption. The
> problem was hidden by the nullification of the flush instructions.
>
> These faults also affect performance. With pa8800/pa8900 processors,
> there will be 32 faults per 4 KB page since the cache line is 128
> bytes.  The will be more faults with earlier processors.
>
> The problem is fixed by using flush_cache_pages(). It does the flush
> using a tmp alias mapping.
>
> The flush_cache_pages() call in flush_cache_range() flushed too
> large a range.
>  
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> ---
>
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index 94150b91c96f..e439b53b0f62 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -558,15 +558,6 @@ static void flush_cache_pages(struct vm_area_struct *vma, struct mm_struct *mm,
>  	}
>  }
>  
> -static void flush_user_cache_tlb(struct vm_area_struct *vma,
> -				 unsigned long start, unsigned long end)
> -{
> -	flush_user_dcache_range_asm(start, end);
> -	if (vma->vm_flags & VM_EXEC)
> -		flush_user_icache_range_asm(start, end);
> -	flush_tlb_range(vma, start, end);
> -}
> -
>  void flush_cache_mm(struct mm_struct *mm)
>  {
>  	struct vm_area_struct *vma;
> @@ -582,13 +573,6 @@ void flush_cache_mm(struct mm_struct *mm)
>  	}
>  
>  	preempt_disable();
> -	if (mm->context == mfsp(3)) {
> -		for (vma = mm->mmap; vma; vma = vma->vm_next)
> -			flush_user_cache_tlb(vma, vma->vm_start, vma->vm_end);
> -		preempt_enable();
> -		return;
> -	}
> -
>  	for (vma = mm->mmap; vma; vma = vma->vm_next)
>  		flush_cache_pages(vma, mm, vma->vm_start, vma->vm_end);
>  	preempt_enable();
> @@ -606,13 +590,7 @@ void flush_cache_range(struct vm_area_struct *vma,
>  	}
>  
>  	preempt_disable();
> -	if (vma->vm_mm->context == mfsp(3)) {
> -		flush_user_cache_tlb(vma, start, end);
> -		preempt_enable();
> -		return;
> -	}
> -
> -	flush_cache_pages(vma, vma->vm_mm, vma->vm_start, vma->vm_end);
> +	flush_cache_pages(vma, vma->vm_mm, start, end);
>  	preempt_enable();
>  }
>  

I think the preempt_enable()/disable() calls are no longer
required. I've added them to fix a bug when the kernel is preempted
after the mm->context / mfsp(3) compare but as that is now removed
this shouldn't be required anymore.
