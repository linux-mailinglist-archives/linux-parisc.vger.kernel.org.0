Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0134BA2E3
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Feb 2022 15:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbiBQOXU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Feb 2022 09:23:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbiBQOXS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Feb 2022 09:23:18 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Feb 2022 06:23:02 PST
Received: from cmx-torrgo002.bell.net (mta-tor-002.bell.net [209.71.212.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0BE022B1673
        for <linux-parisc@vger.kernel.org>; Thu, 17 Feb 2022 06:23:01 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 620DCC7300088D0D
X-CM-Envelope: MS4xfA+cZuO4SGrMdMphKV4gNHz/80Om+6itJlWsQv5kbd0fbRptAZVAhnqb0wV5eWGZ6lOGVrziaBW3R4tOgJtWXwv6XOfLH2EyEmOYc4DWKLfv+JI8Fdh8
 HOpbukFVkhrr6i6+3r6reclQXxAHvvijDiHxxD+2XxAz2drmklAns+ab9JwIRTZ83w3FxdvngrCGjdlcztAtWGd/fFceRyutbpANo/sHNfhGP0KbfpAoNJEM
 lZTGng/6uE+C/SG99fYjZUAW0GDJWfAiLGK+VbgIcvPtAG668W5RiXlN+J6ZnVgqDHiqJh6pAiswG+aPMnmq2gwi0uCQt6TymDrL24SLjDA=
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=620e5a05
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=27vKT-wJJz1veEmEOk8A:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 620DCC7300088D0D; Thu, 17 Feb 2022 09:21:57 -0500
Message-ID: <50db219a-0feb-a3bf-993c-d3039d187c77@bell.net>
Date:   Thu, 17 Feb 2022 09:21:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] parisc: Use constants to encode the space registers
 like PRIV_KERNEL
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20220217121239.158611-1-deller@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <20220217121239.158611-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-02-17 7:12 a.m., Helge Deller wrote:
> Instead of hardcoding various space registers, use the space register
> constants. Introduce PRIV_TEMP1 and PRIV_TEMP2 for %sr1 and %sr2.
I'm not sure I like using the privilege defines for space registers.  Wouldn't it be
better to define SR_KERNEL, SR_TMP1, etc?
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   arch/parisc/include/asm/assembly.h      |  7 +++++--
>   arch/parisc/include/asm/cache.h         | 11 ++++-------
>   arch/parisc/include/asm/mmu_context.h   |  2 +-
>   arch/parisc/include/asm/pgtable.h       |  6 +++---
>   arch/parisc/include/asm/special_insns.h |  4 ++--
>   arch/parisc/kernel/cache.c              |  8 ++++----
>   arch/parisc/kernel/pci-dma.c            |  4 ++--
>   arch/parisc/lib/memcpy.c                | 16 ++++++++--------
>   8 files changed, 29 insertions(+), 29 deletions(-)
>
> diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
> index 6369082c6c74..a9b4c7c790db 100644
> --- a/arch/parisc/include/asm/assembly.h
> +++ b/arch/parisc/include/asm/assembly.h
> @@ -43,9 +43,12 @@
>   #define PA_ASM_LEVEL	1.1
>   #endif
>
> -/* Privilege level field in the rightmost two bits of the IA queues */
> -#define PRIV_USER	3
> +/* Various space registers used in the kernel, additionally used to encode the
> + * privilege level field in the rightmost two bits of the IA queues. */
>   #define PRIV_KERNEL	0
> +#define PRIV_TEMP1	1
> +#define PRIV_TEMP2	2
> +#define PRIV_USER	3
>
>   #ifdef __ASSEMBLY__
>
> diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cache.h
> index d53e9e27dba0..5032e758594e 100644
> --- a/arch/parisc/include/asm/cache.h
> +++ b/arch/parisc/include/asm/cache.h
> @@ -39,16 +39,13 @@ extern int icache_stride;
>   extern struct pdc_cache_info cache_info;
>   void parisc_setup_cache_timing(void);
>
> -#define pdtlb(addr)	asm volatile("pdtlb 0(%%sr1,%0)" \
> +#define pdtlb(sr, addr)	asm volatile("pdtlb 0(%%sr%0,%1)" \
>   			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
> -			: : "r" (addr) : "memory")
> -#define pitlb(addr)	asm volatile("pitlb 0(%%sr1,%0)" \
> +			: : "i"(sr), "r" (addr) : "memory")
> +#define pitlb(sr, addr)	asm volatile("pitlb 0(%%sr%0,%1)" \
>   			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
>   			ALTERNATIVE(ALT_COND_NO_SPLIT_TLB, INSN_NOP) \
> -			: : "r" (addr) : "memory")
> -#define pdtlb_kernel(addr)  asm volatile("pdtlb 0(%0)"   \
> -			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
> -			: : "r" (addr) : "memory")
> +			: : "i"(sr), "r" (addr) : "memory")
>
>   #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
>   			ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
> diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/asm/mmu_context.h
> index 726257648d9f..eaf29632c3ce 100644
> --- a/arch/parisc/include/asm/mmu_context.h
> +++ b/arch/parisc/include/asm/mmu_context.h
> @@ -43,7 +43,7 @@ static inline unsigned long __space_to_prot(mm_context_t context)
>
>   static inline void load_context(mm_context_t context)
>   {
> -	mtsp(context, 3);
> +	mtsp(context, PRIV_USER);
>   	mtctl(__space_to_prot(context), 8);
>   }
>
> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
> index 3e7cf882639f..fac6babb1e68 100644
> --- a/arch/parisc/include/asm/pgtable.h
> +++ b/arch/parisc/include/asm/pgtable.h
> @@ -70,9 +70,9 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
>   	unsigned long flags;
>
>   	purge_tlb_start(flags);
> -	mtsp(mm->context, 1);
> -	pdtlb(addr);
> -	pitlb(addr);
> +	mtsp(mm->context, PRIV_TEMP1);
> +	pdtlb(PRIV_TEMP1, addr);
> +	pitlb(PRIV_TEMP1, addr);
>   	purge_tlb_end(flags);
>   }
>
> diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/include/asm/special_insns.h
> index 16ee41e77174..41b3ddbd344c 100644
> --- a/arch/parisc/include/asm/special_insns.h
> +++ b/arch/parisc/include/asm/special_insns.h
> @@ -55,8 +55,8 @@ static inline void set_eiem(unsigned long val)
>   #define mfsp(reg)	({		\
>   	unsigned long cr;		\
>   	__asm__ __volatile__(		\
> -		"mfsp " #reg ",%0" :	\
> -		 "=r" (cr)		\
> +		"mfsp %%sr%1,%0"	\
> +		: "=r" (cr) : "i"(reg)	\
>   	);				\
>   	cr;				\
>   })
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index 94150b91c96f..00ed9d57198c 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -457,7 +457,7 @@ void flush_kernel_dcache_page_addr(void *addr)
>
>   	flush_kernel_dcache_page_asm(addr);
>   	purge_tlb_start(flags);
> -	pdtlb_kernel(addr);
> +	pdtlb(PRIV_KERNEL, addr);
>   	purge_tlb_end(flags);
>   }
>   EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
> @@ -496,9 +496,9 @@ int __flush_tlb_range(unsigned long sid, unsigned long start,
>   	   but cause a purge request to be broadcast to other TLBs.  */
>   	while (start < end) {
>   		purge_tlb_start(flags);
> -		mtsp(sid, 1);
> -		pdtlb(start);
> -		pitlb(start);
> +		mtsp(sid, PRIV_TEMP1);
> +		pdtlb(PRIV_TEMP1, start);
> +		pitlb(PRIV_TEMP1, start);
>   		purge_tlb_end(flags);
>   		start += PAGE_SIZE;
>   	}
> diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
> index 36a57aa38e87..7f9b05d36789 100644
> --- a/arch/parisc/kernel/pci-dma.c
> +++ b/arch/parisc/kernel/pci-dma.c
> @@ -91,7 +91,7 @@ static inline int map_pte_uncached(pte_t * pte,
>   			printk(KERN_ERR "map_pte_uncached: page already exists\n");
>   		purge_tlb_start(flags);
>   		set_pte(pte, __mk_pte(*paddr_ptr, PAGE_KERNEL_UNC));
> -		pdtlb_kernel(orig_vaddr);
> +		pdtlb(PRIV_KERNEL, orig_vaddr);
>   		purge_tlb_end(flags);
>   		vaddr += PAGE_SIZE;
>   		orig_vaddr += PAGE_SIZE;
> @@ -175,7 +175,7 @@ static inline void unmap_uncached_pte(pmd_t * pmd, unsigned long vaddr,
>
>   		pte_clear(&init_mm, vaddr, pte);
>   		purge_tlb_start(flags);
> -		pdtlb_kernel(orig_vaddr);
> +		pdtlb(PRIV_KERNEL, orig_vaddr);
>   		purge_tlb_end(flags);
>   		vaddr += PAGE_SIZE;
>   		orig_vaddr += PAGE_SIZE;
> diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
> index ea70a0e08321..a32695eb56fa 100644
> --- a/arch/parisc/lib/memcpy.c
> +++ b/arch/parisc/lib/memcpy.c
> @@ -13,8 +13,8 @@
>   #include <linux/compiler.h>
>   #include <linux/uaccess.h>
>
> -#define get_user_space() (uaccess_kernel() ? 0 : mfsp(3))
> -#define get_kernel_space() (0)
> +#define get_user_space()	mfsp(PRIV_USER)
> +#define get_kernel_space()	PRIV_KERNEL
>
>   /* Returns 0 for success, otherwise, returns number of bytes not transferred. */
>   extern unsigned long pa_memcpy(void *dst, const void *src,
> @@ -23,8 +23,8 @@ extern unsigned long pa_memcpy(void *dst, const void *src,
>   unsigned long raw_copy_to_user(void __user *dst, const void *src,
>   			       unsigned long len)
>   {
> -	mtsp(get_kernel_space(), 1);
> -	mtsp(get_user_space(), 2);
> +	mtsp(get_kernel_space(), PRIV_TEMP1);
> +	mtsp(get_user_space(), PRIV_TEMP2);
>   	return pa_memcpy((void __force *)dst, src, len);
>   }
>   EXPORT_SYMBOL(raw_copy_to_user);
> @@ -32,16 +32,16 @@ EXPORT_SYMBOL(raw_copy_to_user);
>   unsigned long raw_copy_from_user(void *dst, const void __user *src,
>   			       unsigned long len)
>   {
> -	mtsp(get_user_space(), 1);
> -	mtsp(get_kernel_space(), 2);
> +	mtsp(get_user_space(), PRIV_TEMP1);
> +	mtsp(get_kernel_space(), PRIV_TEMP2);
>   	return pa_memcpy(dst, (void __force *)src, len);
>   }
>   EXPORT_SYMBOL(raw_copy_from_user);
>
>   void * memcpy(void * dst,const void *src, size_t count)
>   {
> -	mtsp(get_kernel_space(), 1);
> -	mtsp(get_kernel_space(), 2);
> +	mtsp(get_kernel_space(), PRIV_TEMP1);
> +	mtsp(get_kernel_space(), PRIV_TEMP2);
>   	pa_memcpy(dst, src, count);
>   	return dst;
>   }
> --
> 2.34.1
>


-- 
John David Anglin  dave.anglin@bell.net

