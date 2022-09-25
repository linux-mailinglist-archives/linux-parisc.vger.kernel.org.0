Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0AED5E93A1
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 16:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbiIYOdL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 10:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbiIYOdK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 10:33:10 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B6B2CDD4
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 07:33:08 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.58.43]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 631B5D6506FAAD89
X-CM-Envelope: MS4xfIFF1ylyGqmsC6lZMENMrQyIFB+pdJ0XuJ6G3Sfkdjfa7Sx4cI0BKF8Yhx6zOtAMe1gJdwJ1UkLgJPf6rROEj6KfHIdASBYb9fuBXJjmr9QLe/MyWaoh
 FBVvT6MT9cP8fcP5Xxmi752YzRAEWz+X4XcvRy04t2dfl4bzPOWEPMQ9FBRfwk8UzzwUjUTm8etllTQgLBMDAuN6GtzQYXaISBHK8tLb2G5G9/BpqNNqzHwV
 +0i5kq8onPdBtycbk3DVtJypcCwqMEKh48y39SJ+6s++oEhQLR+fYnZFfWkB5bhz1zachbVsYD2/W5YaOGx7ZhD/Zp/1N1UsvBtSHaylfYk=
X-CM-Analysis: v=2.4 cv=XfXqcK15 c=1 sm=1 tr=0 ts=633066a1
 a=oiJDitmlNOPgVxj52MZyFw==:117 a=oiJDitmlNOPgVxj52MZyFw==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=sLY9XHGn-ewt85-jKLMA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (174.95.58.43) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 631B5D6506FAAD89; Sun, 25 Sep 2022 10:33:05 -0400
Message-ID: <d195aae3-b76b-1365-6e53-28c6791c77e3@bell.net>
Date:   Sun, 25 Sep 2022 10:33:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on UP machines
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yy/7g0NzOi/igNi7@p100>
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <Yy/7g0NzOi/igNi7@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I believe this change is wrong and will reduce performance.  The TLB setup for a TMPALIAS
flush is local to any given CPU.  So, we should only need a local TLB purge.

A local TLB purge doesn't require locking to serialize PxTLB broadcasts.  It is also  faster than
a global TLB purges

Indeed, the case that might be wrong is the one that uses pdtlb. It potentially needs serialization
on SMP machines.  See comment in pgtable.h.

Dave

On 2022-09-25 2:56 a.m., Helge Deller wrote:
> Limit usage of CPU-local tlb flushes in pacache.S to non-SMP machines.
> On 32-bit kernels this was the case already, with this patch this
> behaviour is used on 64-bit kernels now too.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
> index 9a0018f1f42c..920f6ef5c3e5 100644
> --- a/arch/parisc/kernel/pacache.S
> +++ b/arch/parisc/kernel/pacache.S
> @@ -539,15 +539,10 @@ ENTRY_CFI(copy_user_page_asm)
>
>   	/* Purge any old translations */
>
> -#ifdef CONFIG_PA20
> -	pdtlb,l		%r0(%r28)
> -	pdtlb,l		%r0(%r29)
> -#else
>   0:	pdtlb		%r0(%r28)
>   1:	pdtlb		%r0(%r29)
>   	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
>   	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> -#endif
>
>   #ifdef CONFIG_64BIT
>   	/* PA8x00 CPUs can consume 2 loads or 1 store per cycle.
> @@ -670,12 +665,8 @@ ENTRY_CFI(clear_user_page_asm)
>
>   	/* Purge any old translation */
>
> -#ifdef CONFIG_PA20
> -	pdtlb,l		%r0(%r28)
> -#else
>   0:	pdtlb		%r0(%r28)
>   	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> -#endif
>
>   #ifdef CONFIG_64BIT
>   	ldi		(PAGE_SIZE / 128), %r1
> @@ -736,12 +727,8 @@ ENTRY_CFI(flush_dcache_page_asm)
>
>   	/* Purge any old translation */
>
> -#ifdef CONFIG_PA20
> -	pdtlb,l		%r0(%r28)
> -#else
>   0:	pdtlb		%r0(%r28)
>   	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> -#endif
>
>   88:	ldil		L%dcache_stride, %r1
>   	ldw		R%dcache_stride(%r1), r31
> @@ -785,12 +772,8 @@ ENTRY_CFI(purge_dcache_page_asm)
>
>   	/* Purge any old translation */
>
> -#ifdef CONFIG_PA20
> -	pdtlb,l		%r0(%r28)
> -#else
>   0:	pdtlb		%r0(%r28)
>   	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> -#endif
>
>   88:	ldil		L%dcache_stride, %r1
>   	ldw		R%dcache_stride(%r1), r31
> @@ -837,17 +820,11 @@ ENTRY_CFI(flush_icache_page_asm)
>   	 * have a flat address space, it's not clear which TLB will be
>   	 * used.  So, we purge both entries.  */
>
> -#ifdef CONFIG_PA20
> -	pdtlb,l		%r0(%r28)
> -1:	pitlb,l         %r0(%sr4,%r28)
> -	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
> -#else
>   0:	pdtlb		%r0(%r28)
>   1:	pitlb           %r0(%sr4,%r28)
>   	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
>   	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
>   	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
> -#endif
>
>   88:	ldil		L%icache_stride, %r1
>   	ldw		R%icache_stride(%r1), %r31

-- 
John David Anglin  dave.anglin@bell.net

