Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77630319686
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Feb 2021 00:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhBKXYt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 11 Feb 2021 18:24:49 -0500
Received: from mout.gmx.net ([212.227.15.15]:52893 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229553AbhBKXYr (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1613085767;
        bh=34D83rRhkMD+z/vu3kSIaZOhTn3gLgyFgEUVU5S3whI=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=FUim1cyDJKvx4jbo0dhu+YRmBqFQMgc1RmN6JGUEopnRUa6sa5s0JCEMGn+MSBk6K
         FjpuR1D6vDQ3a4p/k13CIDADxhhlm1QcrF0BVWgAo/nFrqN0v0pAwvLXlAVm61QnfE
         nuvKrDb1hjL6N9oXsBd9X/egQ/1zJrKJDsDUCnWo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.147.159]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJqD-1lfELV38mB-00nU8s; Fri, 12
 Feb 2021 00:22:46 +0100
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-parisc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>
References: <94210da5-5642-82ef-85ae-688e1c07473d@gmx.de>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
 <20210127211851.GA32689@ls3530.fritz.box>
 <20210210145218.GA50561@roeck-us.net>
 <c7996434-198a-2a57-ac58-18ab6e1faf10@gmx.de>
 <288444d5-811f-db8f-6322-e26425527895@bell.net>
 <20210211012047.GA95605@roeck-us.net>
 <51fe1d4a-a2a0-b202-692f-c3db1843785c@bell.net>
 <20210211215131.GA127652@roeck-us.net>
 <06b31cea-61ce-a3a2-8abe-48aa5ab9dafb@bell.net> <YCW6RF/JiD/ezW3q@ls3530>
From:   Helge Deller <deller@gmx.de>
Message-ID: <7c092fef-9074-28bb-fb47-ebc8c259f61d@gmx.de>
Date:   Fri, 12 Feb 2021 00:22:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCW6RF/JiD/ezW3q@ls3530>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:njcBCPvKRIK3MzLNQ1O1w7GTMz1mk1l+JJmu0Wv6FpEXfE/puDC
 OJ1V+Ed44zskbjmdgMUmzLdxtexC7NpoSsJIgYyom0+rVwAksQjM2X6cYpKOM6F4fKuCfq6
 T3FSbyEAxngAoIO9O85UaHrRj+CItvxVZjwxqLVS82QfANCdeWjTLioMzU0EKTGTKR878A/
 pit70sxwGb1UYUt1oxZBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YfXz3xSOYLI=:oFD5YhrBJz50ceirqZ6UmK
 UCKzoIMCK3Fo3zarmSYxKICR9R2ZrneVTVjCHbENfATDalyPPFypxM7UkxNVDhnsXuLbt65FW
 GOSpHumTvELLnlBC8vgnA67ZENZBxp8UZiXWc/ynxP2jxtUapBayZp7Koe3vydWEsCB2tsa+v
 1mSxiiqHAMzqRwEog8NUM1vyBCQvwl9EeOYq43DYnW2NadON6Gn2GTbGdQQ6tlslSHyFawnXB
 Um3kmAdGZIp6bIWFJbrxDBrpJdi7VKXnU9mwesu18gez4nz7sYgFOP4+8oKrKjePoSGMQN7UY
 nPNONnNoMtefR2q9HJJUFcGshnW92zw/sBT3fgaVEtYuNXtk8v/Vek3SSl4HFJeK/1ThJsVOw
 BU8ifM5VVSKt/jp2L91iQ7Pnx/glkgsIBGWPiCXEmzze18myAhRDMuGlfTA3D2YpanJAfyShV
 SjwS2Dz9T5dJz393mZMYHxtOxiRCcIYtv6woXfW3lwnHywFf1j1ZiL6UPnyQWfk9SuxLZdmBX
 vHYPZKA0Ws9niFIHa7FzE17s56RqauI1bf31Pv+gIM7ZspkzYLU4j37T3mVvTIQTJioKD22uT
 MdOB9TIAW8GPJYtbkaBD++WTwAicd/2a/wmQHtuxILK2N0HcBalw8INjYyydAaWTc+gucZz2W
 M2s4JM9khxMwCsBhkX14Rz2Sxpz3VUub/qKTeGsPDwRX8dbN1i9N48OwHkC5zU7vs/7Xijg5I
 YNL4whd/FfQ/JKWmNKlKHEqkeRAdljFsJUmQBHND0KriEiNGyJIoXn0mYZp6YkJh7I6Qus87Z
 ipSjZogmBLvDO/hsN5xgRp12UKLZxNuHg4sg4c0igUV86b0NjGC2S4PK0t3IAwB+4AMysEcnk
 Sb1S5+Ik/J46snunXmzw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/12/21 12:14 AM, Helge Deller wrote:
> * John David Anglin <dave.anglin@bell.net>:
>> On 2021-02-11 4:51 p.m., Guenter Roeck wrote:
>>> On Thu, Feb 11, 2021 at 09:38:25AM -0500, John David Anglin wrote:
>>>> On 2021-02-10 8:20 p.m., Guenter Roeck wrote:
>>>>> On Wed, Feb 10, 2021 at 01:57:42PM -0500, John David Anglin wrote:
>>>>>> On 2021-02-10 12:23 p.m., Helge Deller wrote:
>>>>>>> On 2/10/21 3:52 PM, Guenter Roeck wrote:
>>>>>>>> On Wed, Jan 27, 2021 at 10:18:51PM +0100, Helge Deller wrote:
>>>>>>>>> On parisc a spinlock is stored in the next page behind the pgd w=
hich
>>>>>>>>> protects against parallel accesses to the pgd. That's why one ad=
ditional
>>>>>>>>> page (PGD_ALLOC_ORDER) is allocated for the pgd.
>>>>>>>>>
>>>>>>>>> Matthew Wilcox suggested that we instead should use a pointer in=
 the
>>>>>>>>> struct page table for this spinlock and noted, that the comments=
 for the
>>>>>>>>> PGD_ORDER and PMD_ORDER defines were wrong.
>>>>>>>>>
>>>>>>>>> Both suggestions are addressed in this patch. The pgd spinlock
>>>>>>>>> (parisc_pgd_lock) is stored in the struct page table. In
>>>>>>>>> switch_mm_irqs_off() the physical address of this lock is loaded=
 into
>>>>>>>>> cr28 (tr4) and the pgd into cr25, so that the fault handlers can
>>>>>>>>> directly access the lock.
>>>>>>>>>
>>>>>>>>> The currently implemened Hybrid L2/L3 page table scheme (where t=
he pmd
>>>>>>>>> is adjacent to the pgd) is dropped now too.
>>>>>>>>>
>>>>>>>>> Suggested-by: Matthew Wilcox <willy@infradead.org>
>>>>>>>>> Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
>>>>>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>>>>>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>>>>>>>> This patch results in:
>>>>>>>>
>>>>>>>> BUG: spinlock recursion on CPU#0, swapper/0/1
>>>>>>>>  =A0 lock: 0x12226d14, .magic: dead4ead, .owner: swapper/0/1, .ow=
ner_cpu: 0
>>>>>>>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc7-next-2021020=
9-32bit #1
>>>>>>>> Hardware name: 9000/778/B160L
>>>>>>>> Backtrace:
>>>>>>>>  =A0 [<1019f9bc>] show_stack+0x34/0x48
>>>>>>>>  =A0 [<10a65278>] dump_stack+0x94/0x114
>>>>>>>>  =A0 [<10219f4c>] spin_dump+0x8c/0xb8
>>>>>>>>  =A0 [<1021a0b4>] do_raw_spin_lock+0xdc/0x108
>>>>>>>>  =A0 [<10a7367c>] _raw_spin_lock_irqsave+0x30/0x48
>>>>>>>>  =A0 [<102bf41c>] handle_mm_fault+0x5e8/0xdb0
>>>>>>>>  =A0 [<102b813c>] __get_user_pages.part.0+0x1b0/0x3d4
>>>>>>>>  =A0 [<102b8900>] __get_user_pages_remote+0x134/0x34c
>>>>>>>>  =A0 [<102b8b80>] get_user_pages_remote+0x68/0x90
>>>>>>>>  =A0 [<102fccb0>] get_arg_page+0x94/0xd8
>>>>>>>>  =A0 [<102fdd84>] copy_string_kernel+0xc4/0x234
>>>>>>>>  =A0 [<102fe70c>] kernel_execve+0xcc/0x1a4
>>>>>>>>  =A0 [<10a58d94>] run_init_process+0xbc/0xe0
>>>>>>>>  =A0 [<10a70d50>] kernel_init+0x98/0x13c
>>>>>>>>  =A0 [<1019a01c>] ret_from_kernel_thread+0x1c/0x24
>>>>>>>>
>>>>>>>> when trying to boot parisc/hppa images in qemu. Reverting this pa=
tch fixes
>>>>>>>> the problem.
>>>>>>> True, I can reproduce the problem.
>>>>>>> With CONFIG_DEBUG_SPINLOCK=3Dy you get the backtrace above.
>>>>>>> With=A0 CONFIG_DEBUG_SPINLOCK=3Dn it just hangs.
>>>>>>> Happenes with 32-bit kernel with SMP kernel, even if only one virt=
ual CPU is started.
>>>>>> Which is quite puzzling since most spin locks are optimized in this=
 case case.=A0 Strikes me we
>>>>>> have a lock that's not initialized.
>>>>>>
>>>>>> It's not obvious how this relates to the patch.=A0 get_arg_page() c=
alls get_user_pages_remote() with
>>>>> The fact that reverting it fixes the problem is a good indication
>>>>> that the problem does relate to this patch.
>>>>>
>>>>> As for how - no idea. That is not my area of expertise.
>>>> I built Helge's for-next tree both with CONFIG_DEBUG_SPINLOCK=3Dy and=
 CONFIG_DEBUG_SPINLOCK=3Dn.=A0 Both
>>>> builds work fine on c8000.
>>>>
>>>> The only thing that might have changed in the patch is the alignment =
of the lock used for page table updates.
>>>> Qemu only support PA 1.x instructions.=A0 The ldcw instruction needs =
16-byte alignment on real hardware and
>>>> there is code to dynamically align lock pointers to 16-byte alignment=
.=A0 The c8000 supports PA 2.0 instructions
>>>> and the ldcw,co instruction only needs 4-byte alignment.=A0 Perhaps t=
here is an issue with the dynamic alignment
>>>> of the lock pointer or the lock initialization in the PA 1.x build fo=
r qemu.
>>>>
>>> The first lock is acquired in mm/memory.c from line 3565:
>>>
>>>          vmf->pte =3D pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->a=
ddress,
>>>                          &vmf->ptl);
>>>
>>> The second (recursive) lock is acquired from line 3587 in the same
>>> function:
>>>
>>>          set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
>>>
>>> Source code lines are from next-20210211. I confirmed with debug code
>>> that the lock address passed to do_raw_spin_lock() is the same in both
>>> calls.
>> Thanks Guenter.=A0 I assume this is with v15 of the patch?
>
> Yes, happens with latest version too.
>
>> It looks as if we might not need the ptl lock in set_pte_at() and proba=
bly elsewhere.
>
> Just removing the locks from set_pte_at() didn't solved it.
> After removing the others too, it works.
> Patch is attached below.
> I added a memory-barrier to set_pte() too.
>
>> But I'm still puzzled as to why this doesn't happen when different lock=
s are used as in your
>> report with the earlier patch.
>
> I think it happened earlier too. Would need to test though.
>
> Helge
>
> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm=
/pgtable.h
> index 2e1873cd4877..2c68010d896a 100644
> --- a/arch/parisc/include/asm/pgtable.h
> +++ b/arch/parisc/include/asm/pgtable.h
> @@ -82,17 +82,14 @@ static inline void purge_tlb_entries(struct mm_struc=
t *mm, unsigned long addr)
>    */
>   #define set_pte(pteptr, pteval)                                 \
>           do{                                                     \
> -                *(pteptr) =3D (pteval);                           \
> +		*(pteptr) =3D (pteval);				\
> +		mb();						\

Actually, this should be barrier() instead of mb().
mb() is overkill on SMP.

Helge



>           } while(0)
>
>   #define set_pte_at(mm, addr, ptep, pteval)			\
>   	do {							\
> -		unsigned long flags;				\
> -		spinlock_t *pgd_lock =3D &(mm)->page_table_lock;	\
> -		spin_lock_irqsave(pgd_lock, flags);		\
>   		set_pte(ptep, pteval);				\
>   		purge_tlb_entries(mm, addr);			\
> -		spin_unlock_irqrestore(pgd_lock, flags);	\
>   	} while (0)
>
>   #endif /* !__ASSEMBLY__ */
> @@ -431,22 +428,15 @@ extern void update_mmu_cache(struct vm_area_struct=
 *, unsigned long, pte_t *);
>   static inline int ptep_test_and_clear_young(struct vm_area_struct *vma=
, unsigned long addr, pte_t *ptep)
>   {
>   	pte_t pte;
> -	unsigned long flags;
> -	spinlock_t *pgd_lock;
>
>   	if (!pte_young(*ptep))
>   		return 0;
>
> -	pgd_lock =3D &vma->vm_mm->page_table_lock;
> -	spin_lock_irqsave(pgd_lock, flags);
>   	pte =3D *ptep;
>   	if (!pte_young(pte)) {
> -		spin_unlock_irqrestore(pgd_lock, flags);
>   		return 0;
>   	}
> -	set_pte(ptep, pte_mkold(pte));
> -	purge_tlb_entries(vma->vm_mm, addr);
> -	spin_unlock_irqrestore(pgd_lock, flags);
> +	set_pte_at(vma->vm_mm, addr, ptep, pte_mkold(pte));
>   	return 1;
>   }
>
> @@ -454,29 +444,16 @@ struct mm_struct;
>   static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned =
long addr, pte_t *ptep)
>   {
>   	pte_t old_pte;
> -	unsigned long flags;
> -	spinlock_t *pgd_lock;
>
> -	pgd_lock =3D &mm->page_table_lock;
> -	spin_lock_irqsave(pgd_lock, flags);
>   	old_pte =3D *ptep;
> -	set_pte(ptep, __pte(0));
> -	purge_tlb_entries(mm, addr);
> -	spin_unlock_irqrestore(pgd_lock, flags);
> +	set_pte_at(mm, addr, ptep, __pte(0));
>
>   	return old_pte;
>   }
>
>   static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned l=
ong addr, pte_t *ptep)
>   {
> -	unsigned long flags;
> -	spinlock_t *pgd_lock;
> -
> -	pgd_lock =3D &mm->page_table_lock;
> -	spin_lock_irqsave(pgd_lock, flags);
> -	set_pte(ptep, pte_wrprotect(*ptep));
> -	purge_tlb_entries(mm, addr);
> -	spin_unlock_irqrestore(pgd_lock, flags);
> +	set_pte_at(mm, addr, ptep, pte_wrprotect(*ptep));
>   }
>
>   #define pte_same(A,B)	(pte_val(A) =3D=3D pte_val(B))
>

