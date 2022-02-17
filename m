Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE354BA324
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Feb 2022 15:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbiBQOj0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Feb 2022 09:39:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241852AbiBQOjX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Feb 2022 09:39:23 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B512944CC
        for <linux-parisc@vger.kernel.org>; Thu, 17 Feb 2022 06:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645108737;
        bh=B1Kgpboq5QyVLDInu15Xxqc6u3TmXGYPQTaM7e9oC2w=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=ZTvU8x1QiQs6cZNbp3th3S/s74kYUHdbGZ7EaCKc7dOkL3pGoCcfLDkNi4YJQNqFy
         hd8G6c/YpxriLPLKozYQ1uXZfyPC35ownmYTJrwNyQHtCDxjfkKCRS9LXauCtXLTjA
         r1JJrf1FH1zgA+ycPTfQhVkh6WyaiuKt2g/yqr54=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.175.13]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU4y-1nswI10FgS-00aSJi; Thu, 17
 Feb 2022 15:38:57 +0100
Message-ID: <f5352468-9a63-6383-96a4-256d36489953@gmx.de>
Date:   Thu, 17 Feb 2022 15:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] parisc: Use constants to encode the space registers
 like PRIV_KERNEL
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20220217121239.158611-1-deller@gmx.de>
 <50db219a-0feb-a3bf-993c-d3039d187c77@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <50db219a-0feb-a3bf-993c-d3039d187c77@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zp+k3UQBO2+lZOx5pqjuWfdp4NtY2Eg3rKWnYRczlg4KlEeXHIl
 SNB0Jn86rwG6u6kYsp0tCU2ugAljCNUyuDM8qSrO+cPzzoBHl4LNXPNu+TfhHn9EEKdO5Bu
 +OlVUOeFyf5nxopx7SyqiZwodiGAa5mLI4GYIH7k2A0AWpXGwcI7scLv+en2BMvgU3iY7G8
 /e4Q2NQJqWRLmKIePl80A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kYtUhMM9Kks=:s4FF0VtWoXhX2Dqx8bTcis
 qxjjdu6Bg60FfIZVwHdFE/NDU1Axuy1+ZoUHwa8knHzU+kQ7KL4NI9BlBXJ0kPAh7pPIIj8D8
 UIzvk6TlEOrOVFyTtwLdSi/kPBaMAlhkckEg7DaDgdoZu3ak06UiQY33Rl46fGjelyNvq9T/A
 UYYdDP6oVMdI1didNooaGCcGwHVZWFTCfCKbmDQKM2Kc5O/VDwlPT2AtZVy3n0X3dfwfhfIw9
 SiDrm8wCvR/bIakin2a/i/8IlDSi4S90pdqUTpqyxS3KzHk9Gs5nn0Y5ig1zjI7tEyW/WJ5Fp
 SUEwaN/rpg41RhPBzW3OyfyX4Gn/iTBRtY60F1iH1zWJiTrK/i8oSZ0IoXWuZsQExw77WFQKZ
 K1F1F8FAaKnTbgWaOiNZ/0XNlookTtfhPmQsBYL+aP22OoZngxZ5GANdNiB4NY308xPozrJFc
 4MGFt1sfy3mQOdIBF/akILg9S5N36ig4jcRXJ1Y0x47ycsk59yIi8UH9i/zSD5aL14FS94ZCB
 J6jm/6zSCKdvRcWdqdFmJ3tR/6S8J9Jm4b5BxMpG2S8ASCa89MaYPgc7fIciTg4gpn0dKo5y4
 fIThgmoKNG5q75YwBiRr+7CyfxuayI+Ic6wuqoXMUMzwIq9JvrU+AWJGsCd0j+rP/wbtMBue7
 EEM4L2LEcBoL1z1boutV1bJJjbET+V9lRFNv/KS6rNDYoDDceUr8eW3QtFqIIPdQ0PWlFMc7g
 vbfQzOXD5uCh96SjffcJEOanYzxG4xAf/ZmGEVWQQD4n3DnkNERadWtM2Hshzk/BV8w8VR4lf
 ENu6xcpmyCeDjHT+d7iOp19VdiaLJF5l3v70AYOjglmhNs4W4tiWrz9ccsWV7orPKYO+jf/x6
 mXk8rCu2HdQ5GqSz6yzo01XDhpgM931C0iP9mndEwmxOGIHe5k7JeRB9WfsVUg1upMcBflgO3
 NZIDWfPtcd1FoJ3bAL4wwzwExbSiIwQ1GXmJ7q8hCycWvBCpPtRy+RJGjGpyEn3bT4QLLBUyE
 ebrcZA40JQ2GoJGxOacxVV5ygBqfzy66vhkojTImEJVVHrnOQQQmyTTb/Q9ahOXSYElhvbrI7
 bK1GHjYTvpi0CM=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/17/22 15:21, John David Anglin wrote:
> On 2022-02-17 7:12 a.m., Helge Deller wrote:
>> Instead of hardcoding various space registers, use the space register
>> constants. Introduce PRIV_TEMP1 and PRIV_TEMP2 for %sr1 and %sr2.

> I'm not sure I like using the privilege defines for space registers.=C2=
=A0 Wouldn't it be
> better to define SR_KERNEL, SR_TMP1, etc?

Agreed, I will change it.

Helge

>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>> =C2=A0 arch/parisc/include/asm/assembly.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 7 +++++--
>> =C2=A0 arch/parisc/include/asm/cache.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 11 ++++-------
>> =C2=A0 arch/parisc/include/asm/mmu_context.h=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 arch/parisc/include/asm/pgtable.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 6 +++---
>> =C2=A0 arch/parisc/include/asm/special_insns.h |=C2=A0 4 ++--
>> =C2=A0 arch/parisc/kernel/cache.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++----
>> =C2=A0 arch/parisc/kernel/pci-dma.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>> =C2=A0 arch/parisc/lib/memcpy.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 ++++++++--------
>> =C2=A0 8 files changed, 29 insertions(+), 29 deletions(-)
>>
>> diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/a=
sm/assembly.h
>> index 6369082c6c74..a9b4c7c790db 100644
>> --- a/arch/parisc/include/asm/assembly.h
>> +++ b/arch/parisc/include/asm/assembly.h
>> @@ -43,9 +43,12 @@
>> =C2=A0 #define PA_ASM_LEVEL=C2=A0=C2=A0=C2=A0 1.1
>> =C2=A0 #endif
>>
>> -/* Privilege level field in the rightmost two bits of the IA queues */
>> -#define PRIV_USER=C2=A0=C2=A0=C2=A0 3
>> +/* Various space registers used in the kernel, additionally used to en=
code the
>> + * privilege level field in the rightmost two bits of the IA queues. *=
/
>> =C2=A0 #define PRIV_KERNEL=C2=A0=C2=A0=C2=A0 0
>> +#define PRIV_TEMP1=C2=A0=C2=A0=C2=A0 1
>> +#define PRIV_TEMP2=C2=A0=C2=A0=C2=A0 2
>> +#define PRIV_USER=C2=A0=C2=A0=C2=A0 3
>>
>> =C2=A0 #ifdef __ASSEMBLY__
>>
>> diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/=
cache.h
>> index d53e9e27dba0..5032e758594e 100644
>> --- a/arch/parisc/include/asm/cache.h
>> +++ b/arch/parisc/include/asm/cache.h
>> @@ -39,16 +39,13 @@ extern int icache_stride;
>> =C2=A0 extern struct pdc_cache_info cache_info;
>> =C2=A0 void parisc_setup_cache_timing(void);
>>
>> -#define pdtlb(addr)=C2=A0=C2=A0=C2=A0 asm volatile("pdtlb 0(%%sr1,%0)"=
 \
>> +#define pdtlb(sr, addr)=C2=A0=C2=A0=C2=A0 asm volatile("pdtlb 0(%%sr%0=
,%1)" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=
 "r" (addr) : "memory")
>> -#define pitlb(addr)=C2=A0=C2=A0=C2=A0 asm volatile("pitlb 0(%%sr1,%0)"=
 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=
 "i"(sr), "r" (addr) : "memory")
>> +#define pitlb(sr, addr)=C2=A0=C2=A0=C2=A0 asm volatile("pitlb 0(%%sr%0=
,%1)" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ALTERNATIVE(ALT_COND_NO_SPLIT_TLB, INSN_NOP) \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=
 "r" (addr) : "memory")
>> -#define pdtlb_kernel(addr)=C2=A0 asm volatile("pdtlb 0(%0)"=C2=A0=C2=
=A0 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALT=
ERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=
 "r" (addr) : "memory")
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=
 "i"(sr), "r" (addr) : "memory")
>>
>> =C2=A0 #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
>> diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/includ=
e/asm/mmu_context.h
>> index 726257648d9f..eaf29632c3ce 100644
>> --- a/arch/parisc/include/asm/mmu_context.h
>> +++ b/arch/parisc/include/asm/mmu_context.h
>> @@ -43,7 +43,7 @@ static inline unsigned long __space_to_prot(mm_contex=
t_t context)
>>
>> =C2=A0 static inline void load_context(mm_context_t context)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 mtsp(context, 3);
>> +=C2=A0=C2=A0=C2=A0 mtsp(context, PRIV_USER);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtctl(__space_to_prot(context), 8);
>> =C2=A0 }
>>
>> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/as=
m/pgtable.h
>> index 3e7cf882639f..fac6babb1e68 100644
>> --- a/arch/parisc/include/asm/pgtable.h
>> +++ b/arch/parisc/include/asm/pgtable.h
>> @@ -70,9 +70,9 @@ static inline void purge_tlb_entries(struct mm_struct=
 *mm, unsigned long addr)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_tlb_start(flags);
>> -=C2=A0=C2=A0=C2=A0 mtsp(mm->context, 1);
>> -=C2=A0=C2=A0=C2=A0 pdtlb(addr);
>> -=C2=A0=C2=A0=C2=A0 pitlb(addr);
>> +=C2=A0=C2=A0=C2=A0 mtsp(mm->context, PRIV_TEMP1);
>> +=C2=A0=C2=A0=C2=A0 pdtlb(PRIV_TEMP1, addr);
>> +=C2=A0=C2=A0=C2=A0 pitlb(PRIV_TEMP1, addr);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_tlb_end(flags);
>> =C2=A0 }
>>
>> diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/incl=
ude/asm/special_insns.h
>> index 16ee41e77174..41b3ddbd344c 100644
>> --- a/arch/parisc/include/asm/special_insns.h
>> +++ b/arch/parisc/include/asm/special_insns.h
>> @@ -55,8 +55,8 @@ static inline void set_eiem(unsigned long val)
>> =C2=A0 #define mfsp(reg)=C2=A0=C2=A0=C2=A0 ({=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long cr;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __asm__ __volatile__(=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mfsp " #reg ",%0" :=C2=A0=
=C2=A0=C2=A0 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=3Dr" (cr)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mfsp %%sr%1,%0"=C2=A0=C2=
=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (cr) : "i"(reg)=C2=
=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 );=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cr;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0 })
>> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
>> index 94150b91c96f..00ed9d57198c 100644
>> --- a/arch/parisc/kernel/cache.c
>> +++ b/arch/parisc/kernel/cache.c
>> @@ -457,7 +457,7 @@ void flush_kernel_dcache_page_addr(void *addr)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush_kernel_dcache_page_asm(addr);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_tlb_start(flags);
>> -=C2=A0=C2=A0=C2=A0 pdtlb_kernel(addr);
>> +=C2=A0=C2=A0=C2=A0 pdtlb(PRIV_KERNEL, addr);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_tlb_end(flags);
>> =C2=A0 }
>> =C2=A0 EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
>> @@ -496,9 +496,9 @@ int __flush_tlb_range(unsigned long sid, unsigned l=
ong start,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 but cause a purge requ=
est to be broadcast to other TLBs.=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (start < end) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_tlb_start(=
flags);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtsp(sid, 1);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdtlb(start);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pitlb(start);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtsp(sid, PRIV_TEMP1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdtlb(PRIV_TEMP1, start);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pitlb(PRIV_TEMP1, start);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_tlb_end(fl=
ags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start +=3D PAGE_=
SIZE;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.=
c
>> index 36a57aa38e87..7f9b05d36789 100644
>> --- a/arch/parisc/kernel/pci-dma.c
>> +++ b/arch/parisc/kernel/pci-dma.c
>> @@ -91,7 +91,7 @@ static inline int map_pte_uncached(pte_t * pte,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 printk(KERN_ERR "map_pte_uncached: page already exists\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_tlb_start(=
flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_pte(pte, __m=
k_pte(*paddr_ptr, PAGE_KERNEL_UNC));
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdtlb_kernel(orig_vaddr);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdtlb(PRIV_KERNEL, orig_vad=
dr);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_tlb_end(fl=
ags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vaddr +=3D PAGE_=
SIZE;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 orig_vaddr +=3D =
PAGE_SIZE;
>> @@ -175,7 +175,7 @@ static inline void unmap_uncached_pte(pmd_t * pmd, =
unsigned long vaddr,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_clear(&init_=
mm, vaddr, pte);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_tlb_start(=
flags);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdtlb_kernel(orig_vaddr);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdtlb(PRIV_KERNEL, orig_vad=
dr);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_tlb_end(fl=
ags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vaddr +=3D PAGE_=
SIZE;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 orig_vaddr +=3D =
PAGE_SIZE;
>> diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
>> index ea70a0e08321..a32695eb56fa 100644
>> --- a/arch/parisc/lib/memcpy.c
>> +++ b/arch/parisc/lib/memcpy.c
>> @@ -13,8 +13,8 @@
>> =C2=A0 #include <linux/compiler.h>
>> =C2=A0 #include <linux/uaccess.h>
>>
>> -#define get_user_space() (uaccess_kernel() ? 0 : mfsp(3))
>> -#define get_kernel_space() (0)
>> +#define get_user_space()=C2=A0=C2=A0=C2=A0 mfsp(PRIV_USER)
>> +#define get_kernel_space()=C2=A0=C2=A0=C2=A0 PRIV_KERNEL
>>
>> =C2=A0 /* Returns 0 for success, otherwise, returns number of bytes not=
 transferred. */
>> =C2=A0 extern unsigned long pa_memcpy(void *dst, const void *src,
>> @@ -23,8 +23,8 @@ extern unsigned long pa_memcpy(void *dst, const void =
*src,
>> =C2=A0 unsigned long raw_copy_to_user(void __user *dst, const void *src=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long len)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 mtsp(get_kernel_space(), 1);
>> -=C2=A0=C2=A0=C2=A0 mtsp(get_user_space(), 2);
>> +=C2=A0=C2=A0=C2=A0 mtsp(get_kernel_space(), PRIV_TEMP1);
>> +=C2=A0=C2=A0=C2=A0 mtsp(get_user_space(), PRIV_TEMP2);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return pa_memcpy((void __force *)dst, sr=
c, len);
>> =C2=A0 }
>> =C2=A0 EXPORT_SYMBOL(raw_copy_to_user);
>> @@ -32,16 +32,16 @@ EXPORT_SYMBOL(raw_copy_to_user);
>> =C2=A0 unsigned long raw_copy_from_user(void *dst, const void __user *s=
rc,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long len)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 mtsp(get_user_space(), 1);
>> -=C2=A0=C2=A0=C2=A0 mtsp(get_kernel_space(), 2);
>> +=C2=A0=C2=A0=C2=A0 mtsp(get_user_space(), PRIV_TEMP1);
>> +=C2=A0=C2=A0=C2=A0 mtsp(get_kernel_space(), PRIV_TEMP2);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return pa_memcpy(dst, (void __force *)sr=
c, len);
>> =C2=A0 }
>> =C2=A0 EXPORT_SYMBOL(raw_copy_from_user);
>>
>> =C2=A0 void * memcpy(void * dst,const void *src, size_t count)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 mtsp(get_kernel_space(), 1);
>> -=C2=A0=C2=A0=C2=A0 mtsp(get_kernel_space(), 2);
>> +=C2=A0=C2=A0=C2=A0 mtsp(get_kernel_space(), PRIV_TEMP1);
>> +=C2=A0=C2=A0=C2=A0 mtsp(get_kernel_space(), PRIV_TEMP2);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pa_memcpy(dst, src, count);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dst;
>> =C2=A0 }
>> --
>> 2.34.1
>>
>
>

