Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94BD5E95C9
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 22:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbiIYUDG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 16:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbiIYUDF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 16:03:05 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-001.bell.net [209.71.212.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36212B182
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 13:03:03 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.58.43]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 631B5D65072A8260
X-CM-Envelope: MS4xfEu6LQD4FtKBCTwfGt/InFMEC4S0vssmFhhviCEoteJbqc58b42mpNcNetnHMn7xZGLKce1sACoKJa3RijrGNJiZQkoxGn1TLePeNS1aa5beTLJ/PP8P
 0w9ml5M4AD6Rky1p58rt9WuQn/8GZJqWa7pX9v39A19h/lnnj6/IGmBGzpTuMcnex62nlVM4J2ky9t/4wtQFarfoTvL3sqd2BCZIuLwJ7ICzt3kLUrayhpqV
 BhqM2S3bBy7QX0zn4gQPwMBckMYiDSw7lKlaIRItE60Zrn+sVmHzWDF6oToGw16U6sf5UTWOB9vxD/1ocwRyuClj77K0xp1LeTMpDgaU2/4=
X-CM-Analysis: v=2.4 cv=XfXqcK15 c=1 sm=1 tr=0 ts=6330b3f2
 a=oiJDitmlNOPgVxj52MZyFw==:117 a=oiJDitmlNOPgVxj52MZyFw==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=wsSHqyXJDPHzzMJlmdcA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (174.95.58.43) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 631B5D65072A8260; Sun, 25 Sep 2022 16:02:58 -0400
Message-ID: <1063fc54-738a-a1b9-fb53-8202287805c7@bell.net>
Date:   Sun, 25 Sep 2022 16:02:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on PA2.0 machines
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YzCkkyktEZFM0svQ@p100>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <YzCkkyktEZFM0svQ@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-09-25 2:57 p.m., Helge Deller wrote:
> +#ifdef CONFIG_PA20
> +#define ALT_COND_PACACHE	ALT_COND_ALWAYS
> +#else
> +#define ALT_COND_PACACHE	ALT_COND_NO_SMP
> +#endif
> +
>   ENTRY_CFI(flush_tlb_all_local)
>   	/*
>   	 * The pitlbe and pdtlbe instructions should only be used to
> @@ -539,15 +545,10 @@ ENTRY_CFI(copy_user_page_asm)
>
>   	/* Purge any old translations */
>
> -#ifdef CONFIG_PA20
> -	pdtlb,l		%r0(%r28)
> -	pdtlb,l		%r0(%r29)
> -#else
>   0:	pdtlb		%r0(%r28)
>   1:	pdtlb		%r0(%r29)
> -	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> -	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
> -#endif
> +	ALTERNATIVE(0b, 0b+4, ALT_COND_PACACHE, INSN_PxTLB)
> +	ALTERNATIVE(1b, 1b+4, ALT_COND_PACACHE, INSN_PxTLB)
This doesn't look correct.  If ALT_COND_PACACHE is defined as ALT_COND_NO_SMP, the pdtlb
instructions will be converted to pdtlb,l instructions when running UP.  These are not supported
on PA 1.1.  When running SMP, we have pdtlb purges.  For these, we need bus serialization.

These also don't look correct:

#define pdtlb(sr, addr) asm volatile("pdtlb 0(%%sr%0,%1)" \
                         ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
                         : : "i"(sr), "r" (addr) : "memory")
#define pitlb(sr, addr) asm volatile("pitlb 0(%%sr%0,%1)" \
                         ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
                         ALTERNATIVE(ALT_COND_NO_SPLIT_TLB, INSN_NOP) \
                         : : "i"(sr), "r" (addr) : "memory")

We only have local purge on PA 2.0 machines.

Dave

-- 
John David Anglin  dave.anglin@bell.net

