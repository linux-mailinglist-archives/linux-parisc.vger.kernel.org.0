Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A1C44591D
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 18:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbhKDSAU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 14:00:20 -0400
Received: from mta-tor-002.bell.net ([209.71.212.29]:53628 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S233913AbhKDSAT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 14:00:19 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C886880A65C025
X-CM-Envelope: MS4xfG90f36aBqkVEwThfUDb7QcUZanxwQuOokiKUlR0KA2B3N+Z9dD93FFsyQZF/ZvQ2KPUAoS3WMWVCwBB3CLXrymuecZR9s3rqNLt0Aggnn7qN9O1hm+b
 csoT53gZG4uXPw64etgUJTPxQJk65pVpmzuJKzGUOpvOB4re40uKxD6dYsoEXj80lBS8ekzJsPVHlk00h2KCoRw9FfQqSiIK+pQ98RtdbwLyzGkKERi53OTv
 7zoL7KQS+EOtERj0d0KnjUV4BJ/4Zu+9eY9OUdYatiDNsy/sDGaSbDtHj4pFsMRMO2H62IRxQOVflbCFbIr34TA+YOFTLesrP6LWIWT/m7N5OEgme0spNiEw
 wm5vCY6N
X-CM-Analysis: v=2.4 cv=Udwy9IeN c=1 sm=1 tr=0 ts=61841f0f
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=nuaP51dSbY9Pe_BCDNMA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C886880A65C025; Thu, 4 Nov 2021 13:57:35 -0400
Message-ID: <a3568fd4-79be-798e-3078-60b187ddaea7@bell.net>
Date:   Thu, 4 Nov 2021 13:57:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] parisc: Fix code/instruction patching on PA1.x machines
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Sven Schnelle <svens@stackframe.org>
References: <YX8HK7ZZZhjRQzcr@ls3530>
 <91b3d125-18ae-e10f-3000-1b17a43a156f@bell.net>
 <cf2c5fa8-5b98-50b7-00ef-0e86df918e8e@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <cf2c5fa8-5b98-50b7-00ef-0e86df918e8e@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-03 5:08 p.m., Helge Deller wrote:
> Hi Dave,
> 
> On 11/3/21 21:12, John David Anglin wrote:
>> I think the real problem is that neither flush_kernel_vmap_range() or
>> invalidate_kernel_vmap_range() flush the icache.  They only operate
>> on the data cache. flush_icache_range will flush both caches.
> Yes.
> But we write the new instructions to a congruently memory are (same
> physical memory like the kernel code), then flush/invalidate the
> D-Cache, and finally flush the I-cache of kernel code memory.
> See last function call of __patch_text_multiple().
> 
> So, logically I think it should work (and it does on PA2.x).

I still believe it is incorrect to use invalidate_kernel_vmap_range() to flush the writes in
__patch_text_multiple() to memory.  Both the PA 1.1 and 2.0 architecture documents state that
it is implementation dependent whether pdc writes back dirty lines to memory at priority 0.
If the writes are not flushed to memory, the patch won't install.

> 
> Or do you mean to flush the I-Cache of both mappings?

I reviewed the flush operations in __patch_text_multiple().  I believe the current code is more or
less correct, but not optimal.  I believe the final call to flush_icache_range() is unnecessary.  We
can also eliminate one range flush in the calls to make sure we don't have any aliases in the cache.
See change attached below.

The big problem with __patch_text_multiple() is can only patch code that the patch code doesn't depend
on.  This line in __patch_text_multiple() will cause a TLB fault on the first execution after a new
patch_map is setup. We do alternative patching to the TLB handler when ALT_COND_NO_SMP is true.  For
example,

         .macro          ptl_lock        spc,ptp,pte,tmp,tmp1,fault
#ifdef CONFIG_TLB_PTLOCK
98:     cmpib,COND(=),n 0,\spc,2f
         get_ptl         \tmp
1:      LDCW            0(\tmp),\tmp1
         cmpib,COND(=)   0,\tmp1,1b
         nop
         LDREG           0(\ptp),\pte
         bb,<,n          \pte,_PAGE_PRESENT_BIT,3f
         b               \fault
         stw             \spc,0(\tmp)
99:     ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
#endif
2:      LDREG           0(\ptp),\pte
         bb,>=,n         \pte,_PAGE_PRESENT_BIT,\fault
3:
         .endm

If the region being patched spans a page boundary, we will get a TLB fault with partially patched TLB
code.  I suspect something like this is the real issue with the fixmap code.

Maybe this could be avoided by patching in a "b,n 99f" instruction at 98b.  That would avoid patching
in multiple nop instructions.

Dave

> 
> Helge
> 
> 
>>
>> Dave
>>
>> On 2021-10-31 5:14 p.m., Helge Deller wrote:
>>> On PA1.x machines it's not sufficient to just flush the data and
>>> instruction caches when we have written new instruction codes into the
>>> parallel mapped memory segment, but we really need to invalidate (purge)
>>> the cache too. Otherwise the processor will still execute the old
>>> instructions which are still in the data/instruction cache.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> Fixes: 4e87ace902cf ("parisc: add support for patching multiple words")
>>> Cc: stable@vger.kernel.org # v5.3+
>>>
>>> diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
>>> index 80a0ab372802..8cbb7e1d5a2b 100644
>>> --- a/arch/parisc/kernel/patch.c
>>> +++ b/arch/parisc/kernel/patch.c
>>> @@ -81,7 +81,7 @@ void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int len)
>>>                 * We're crossing a page boundary, so
>>>                 * need to remap
>>>                 */
>>> -            flush_kernel_vmap_range((void *)fixmap,
>>> +            invalidate_kernel_vmap_range((void *)fixmap,
>>>                            (p-fixmap) * sizeof(*p));
>>>                if (mapped)
>>>                    patch_unmap(FIX_TEXT_POKE0, &flags);
>>> @@ -90,9 +90,10 @@ void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int len)
>>>            }
>>>        }
>>>
>>> -    flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
>>> +    invalidate_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
>>>        if (mapped)
>>>            patch_unmap(FIX_TEXT_POKE0, &flags);
>>> +    invalidate_kernel_vmap_range((void *)start, end - start);
>>>        flush_icache_range(start, end);
> 

---
diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
index 80a0ab372802..799795bc4210 100644
--- a/arch/parisc/kernel/patch.c
+++ b/arch/parisc/kernel/patch.c
@@ -67,8 +67,8 @@ void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int len)
  	int mapped;

  	/* Make sure we don't have any aliases in cache */
-	flush_kernel_vmap_range(addr, len);
  	flush_icache_range(start, end);
+	flush_tlb_kernel_range(start, end);

  	p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &flags, &mapped);

@@ -93,7 +93,6 @@ void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int len)
  	flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
  	if (mapped)
  		patch_unmap(FIX_TEXT_POKE0, &flags);
-	flush_icache_range(start, end);
  }

  void __kprobes __patch_text(void *addr, u32 insn)
