Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F41352A253
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 14:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346624AbiEQM7D (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 08:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346591AbiEQM6L (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 08:58:11 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160404BBA2
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652792269;
        bh=lOzC3T9WNbp88pp2+nwLssizBwoAFM59sAm4a2NI+NU=;
        h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
        b=hEoCuSw8OUqHPiPvHxZoHrw1HIHZcR3GU8oNHjJlKTCOV8g4tiWGhcwziD6IMnp/T
         QscAlZayY2JjswxH1AIiDqa1voNKJusIhIABY9YXxPOHn24nx50Cxucb15pV4ZOAB8
         laFiH8I8FZBsa7tbKhg2whhNe/lhF+/Xy0Aj1qeE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.173.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQeK-1o0Khn2mlK-00AZdl; Tue, 17
 May 2022 14:57:49 +0200
Message-ID: <241a1eab-e3ae-7420-684b-871bc2be7498@gmx.de>
Date:   Tue, 17 May 2022 14:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] parisc: Unconditionally flush tlb entry in tmpalias
 functions
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <Yn7sA9LCVrYSgWk6@p100>
In-Reply-To: <Yn7sA9LCVrYSgWk6@p100>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ASAhfYQ+NCfG5Lxox06KeNU535td13mLD5Z1hfkXTPHy1fxAr5u
 6Fe0pwtoq7vwAKOKOQcF+MShWdjP25F8xmMclxgKGGgXocUHY9LhWTEXjrJOBHhOmYGbvhQ
 35WL3xP9Ob8CxnJSu7k3x6iMM6GH9yE0FzO7JajPVCIVeZacvaxoUNYelk35Y7D+0IgmEfm
 6yTAUH93OkozlVhB6JigA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jE8qSHGiKTs=:HVS9mrvHSKx2S0EFcNkjgi
 WixiFFN4c286G/ngJeHDWZbZi1n0ao4zc1Jv0PxzRcsOtpYxAsXOeMBbUUFJfqBmjxEYPWg+h
 g69BIn6pOkeeYwv/CMMGaW3rsZwLrO5SGX8fcxeyiTNB3wyfaiCN6vd2h23Y/B9JbQjQ02X3d
 ZagzOYumzDjIv/ywruBmFxPbPKizeo17cmuyekVN/n63QR/fWmni0gYFzlNOmfsPLcaW8b5Q4
 nzB/mz3/6hHnrAT+I168K98aVVXd8rMyGCNlH3X4oQFZlZeB8nJTygR92M2EguiohWy+sl5RT
 spN+UcAEsNndrCO0x7a89zj70NrbcTxboJ8MDzMunHSpWpoYr6NWkFeoD8EfwBsaQTztO7Qtt
 rpHkQRbJvjN9X6qmzbD+qBfImA1HMsUXcFbWtfBqhv43jetAs1vYsoA6uCDhWmZ56EQubQ1L7
 uJyQhsIm9KvhBH2gTx811q/C0OPfF+XolrCY7+XVvUB1e9fljkoxaFGQN8fwvM3PPzlumicAd
 bsDwtJMccNpciS5qjLgX9Zh3efgd4ouqE18YHWkPVpanM752MSsuc/AnwSC86P6sMsXcR3pYb
 2NtyOfGbHQOt1tejQOf774Uw3Etasck/x34lR/hXQAwcWoyxdFtzJWJ4NdGOWpbgi6cVhSwh+
 9yIthfwdGNDAO0XFuZWLwRccyFlqhSLvkE/pW5fyLzTiEAf8h3uSMciV9tJGNNkqeVeqUW2Cs
 gHaFaCSWFnigE/clUEbVG6qzqBEzgx9xctXBSQ+ey8JlXdVeFs+g9C676r10p1zGXuJNhq8ty
 N04QoS2N8bRRyXtDSlcraSPH2Os1aij4biU0SfhoMLC9aOlXLrfMg0PxdpObj2aAMVZDGtdDF
 0vJt5MBbNvJZ4y9562FyjnZqNsYEqIpyL/e4uF8kxRm01lCTqaUCdz42f+MBrBQPDojJhDtAD
 JlxeyGvuitc3Hoah8rB4qIAFuis5oicRx9mlOWlnPcxQh/njq1zGeyEAvHXcMVyTz1dCazz6R
 6DCCw72ZumhLS7FM79LOpFl9wkxhUTHYpRfiy3L+0uHZfJUoYReEH5ILRHpMCbfCNAZccpvzY
 D82R5n9L+6gDs8liREbyRonLHxjCjingjSlVHzzIeseIOTGeaX1j6sx+Q==
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/14/22 01:38, Helge Deller wrote:
> Drop the ALTERNATIVE() instructions in the tmpalias functions for the
> 32-bit kernel.
> Functions which use the tmpalias mappings to flush/copy/invalidate
> congruently mapped memory need to always flush the TLB entry prior
> accessing the newly-to-be mapped memory areas. This is independed if
> it's a SMP kernel or not.  Otherwise the new memory mappings (stored in
> r28 and possibly r23) won't get loaded into the TLB.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org

This patch is contra-productive.
The ALTERNATIVE() replacement will only trigger on PA20 CPUs, in
which case the pdtlb gets replaced by pdtlb,l - which is good because
we use the tmpalias mapping only on the local currently CPU.

Helge

> diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
> index b4c3f01e2399..1cc55e668fe0 100644
> --- a/arch/parisc/kernel/pacache.S
> +++ b/arch/parisc/kernel/pacache.S
> @@ -565,10 +565,8 @@ ENTRY_CFI(copy_user_page_asm)
>  	pdtlb,l		%r0(%r28)
>  	pdtlb,l		%r0(%r29)
>  #else
> -0:	pdtlb		%r0(%r28)
> -1:	pdtlb		%r0(%r29)
> -	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> -	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> +	pdtlb		%r0(%r28)
> +	pdtlb		%r0(%r29)
>  #endif
>
>  #ifdef CONFIG_64BIT
> @@ -705,8 +703,7 @@ ENTRY_CFI(clear_user_page_asm)
>  #ifdef CONFIG_PA20
>  	pdtlb,l		%r0(%r28)
>  #else
> -0:	pdtlb		%r0(%r28)
> -	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> +	pdtlb		%r0(%r28)
>  #endif
>
>  #ifdef CONFIG_64BIT
> @@ -781,8 +778,7 @@ ENTRY_CFI(flush_dcache_page_asm)
>  #ifdef CONFIG_PA20
>  	pdtlb,l		%r0(%r28)
>  #else
> -0:	pdtlb		%r0(%r28)
> -	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> +	pdtlb		%r0(%r28)
>  #endif
>
>  88:	ldil		L%dcache_stride, %r1
> @@ -840,8 +836,7 @@ ENTRY_CFI(purge_dcache_page_asm)
>  #ifdef CONFIG_PA20
>  	pdtlb,l		%r0(%r28)
>  #else
> -0:	pdtlb		%r0(%r28)
> -	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> +	pdtlb		%r0(%r28)
>  #endif
>
>  88:	ldil		L%dcache_stride, %r1
> @@ -904,10 +899,8 @@ ENTRY_CFI(flush_icache_page_asm)
>  1:	pitlb,l         %r0(%sr4,%r28)
>  	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
>  #else
> -0:	pdtlb		%r0(%r28)
> +	pdtlb		%r0(%r28)
>  1:	pitlb           %r0(%sr4,%r28)
> -	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> -	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
>  	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
>  #endif
>

