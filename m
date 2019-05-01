Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB4810928
	for <lists+linux-parisc@lfdr.de>; Wed,  1 May 2019 16:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfEAOer (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 May 2019 10:34:47 -0400
Received: from mout.gmx.net ([212.227.17.22]:33279 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbfEAOeq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 May 2019 10:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1556721272;
        bh=hWopnlQ3DEDJVfGl0dqVrPZRs/S8uVWqzaSRoeLHRmM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=OTFnhSCZ61PAGxsBsRWMH48el5ojvzXZ6KvWW864lskfnnv683o15l7fHJPjvUgRe
         ywKevrRKVm2rIDQVVCw/hFcyY/WmsVCawzhs3HJft1wRPVHJVUMwXz3dVR+CsuJXcJ
         LrgZZ1/PuPPV9QfaOuE85yEz9RdaesJSAC/WaNMk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.140.64]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My32F-1gYYVj1vSx-00zTt7; Wed, 01
 May 2019 16:34:32 +0200
Subject: Re: [PATCH][RFC] parisc: Use per-pagetable spinlock (v2)
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
References: <20190428173431.GA21286@ls3530.dellerweb.de>
 <alpine.LRH.2.02.1905011021300.6862@file01.intranet.prod.int.rdu2.redhat.com>
From:   Helge Deller <deller@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=deller@gmx.de; keydata=
 xsBNBFDPIPYBCAC6PdtagIE06GASPWQJtfXiIzvpBaaNbAGgmd3Iv7x+3g039EV7/zJ1do/a
 y9jNEDn29j0/jyd0A9zMzWEmNO4JRwkMd5Z0h6APvlm2D8XhI94r/8stwroXOQ8yBpBcP0yX
 +sqRm2UXgoYWL0KEGbL4XwzpDCCapt+kmarND12oFj30M1xhTjuFe0hkhyNHkLe8g6MC0xNg
 KW3x7B74Rk829TTAtj03KP7oA+dqsp5hPlt/hZO0Lr0kSAxf3kxtaNA7+Z0LLiBqZ1nUerBh
 OdiCasCF82vQ4/y8rUaKotXqdhGwD76YZry9AQ9p6ccqKaYEzWis078Wsj7p0UtHoYDbABEB
 AAHNHEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT7CwJIEEwECADwCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEE9M/0wAvkPPtRU6Boh8nBUbUeOGQFAlrHzIICGQEACgkQh8nB
 UbUeOGT1GAgAt+EeoHB4DbAx+pZoGbBYp6ZY8L6211n8fSi7wiwgM5VppucJ+C+wILoPkqiU
 +ZHKlcWRbttER2oBUvKOt0+yDfAGcoZwHS0P+iO3HtxR81h3bosOCwek+TofDXl+TH/WSQJa
 iaitof6iiPZLygzUmmW+aLSSeIAHBunpBetRpFiep1e5zujCglKagsW78Pq0DnzbWugGe26A
 288JcK2W939bT1lZc22D9NhXXRHfX2QdDdrCQY7UsI6g/dAm1d2ldeFlGleqPMdaaQMcv5+E
 vDOur20qjTlenjnR/TFm9tA1zV+K7ePh+JfwKc6BSbELK4EHv8J8WQJjfTphakYLVM7ATQRQ
 zyD2AQgA2SJJapaLvCKdz83MHiTMbyk8yj2AHsuuXdmB30LzEQXjT3JEqj1mpvcEjXrX1B3h
 +0nLUHPI2Q4XWRazrzsseNMGYqfVIhLsK6zT3URPkEAp7R1JxoSiLoh4qOBdJH6AJHex4CWu
 UaSXX5HLqxKl1sq1tO8rq2+hFxY63zbWINvgT0FUEME27Uik9A5t8l9/dmF0CdxKdmrOvGMw
 T770cTt76xUryzM3fAyjtOEVEglkFtVQNM/BN/dnq4jDE5fikLLs8eaJwsWG9k9wQUMtmLpL
 gRXeFPRRK+IT48xuG8rK0g2NOD8aW5ThTkF4apznZe74M7OWr/VbuZbYW443QQARAQABwsBf
 BBgBAgAJBQJQzyD2AhsMAAoJEIfJwVG1HjhkNTgH/idWz2WjLE8DvTi7LvfybzvnXyx6rWUs
 91tXUdCzLuOtjqWVsqBtSaZynfhAjlbqRlrFZQ8i8jRyJY1IwqgvHP6PO9s+rIxKlfFQtqhl
 kR1KUdhNGtiI90sTpi4aeXVsOyG3572KV3dKeFe47ALU6xE5ZL5U2LGhgQkbjr44I3EhPWc/
 lJ/MgLOPkfIUgjRXt0ZcZEN6pAMPU95+u1N52hmqAOQZvyoyUOJFH1siBMAFRbhgWyv+YE2Y
 ZkAyVDL2WxAedQgD/YCCJ+16yXlGYGNAKlvp07SimS6vBEIXk/3h5Vq4Hwgg0Z8+FRGtYZyD
 KrhlU0uMP9QTB5WAUvxvGy8=
Message-ID: <383ae5f2-cfa9-784f-2f19-8bcc5ade53a4@gmx.de>
Date:   Wed, 1 May 2019 16:34:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1905011021300.6862@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J66lwIfIK0AqDBPSPiETL31CQLEVtPEgc+gDW2e85CcOKz3kKJu
 ubJaZazHv5pr4o/MmTE9sqcZbNuN6h76dnfBooHgdvO5Y6BF/DB2V3VGR6dboAlceSSpAPW
 prY43tpOkbwtOGR7Jfdu2dMBx7qz2kdfI8y1xfnXUtMP2hmfIzEtzbWAGKOvN40SL9WE0U6
 LB46GeazKFB2EtafH3bNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uCioHASf91g=:74UFZ0zX5gZDSp3b1VG8jF
 e0D+tMEn56C0+XHDJOsDzi/V97d9bQ2AiqYkle7A5m24MO7Nimp39AzfA0HVUPZfCUv2B2se8
 NX+TGo8i6U/3vDhBK7wFcxnICzGaDmJ7tZYsH9uM7mgxdYXpAxUePlZZqku/RuP+rdiMBQmmF
 bjhjMqcPfFZ0gJ/3RwADAoJPOKLOjnYjo81tRDBC4iqe49gGYwhiQBYTZ5UREvJ0Xa1++0EdZ
 425XvsRyG1Nu7LyOUCRr4DTXbjOAPaoKODhlPuLQrNZ+Rjdfu62IIZeuYm3aRn+YhREomx1+v
 9LXBLwqq/8hE6bdTAiAuw6VLpMXZNJM+k/MeKjjjMMhQ5a+RKKAAiMpZrWSWcvyEwQ7L3w2Od
 MUWdEMazxgxNCbvvn51d+91P/WnriqckcaTb7R65/llQF/TWH8hHMpn5kqbCSNSj4SIJpBy3m
 KKFEXyHpec9vA4hH5DwFzZ3vcTzWbMRR6WmbjuuQq5D88TNIDhM64+h1JXnMtHxmX5b1uKzel
 1And25K9h6c9aS+KSqhqI/1rYoVXQF75qP5gy1kfEP1h52KHlkY0Rx1x2OS5t5f2xMvmqv1Ii
 +d9EZ2KHgSFQjfVJ0H/xLuC1j1A5iIZlR/j+y5WkupegL7TH9xBSkyB5DKMVEvJSx2U7oBn2N
 /ZIR/c0+Y/9KZm4B9hVSYOqoSFa/z1XSBi9e7BSDrn9UmCUivF+DKU/Gn2srO1vVOtP8snQZL
 3pCOIemDWzrwXQdbmAb63DkoCwuc9wew+2Z0SRNnT1G/EuxoHnXzuuL+TAVNULcMKYgGIB1Ow
 sDZS6mOkWxaa4wuMtEv2jBoPO9x/ejeEOz/xW9x3njPUTOhfIkwiIpultYgdsc4I/rb7/pKwg
 DjBj1Pi84JR1oqqxGooJp92aRgymeCYVskpLwt4TlLp1iodpGklXwecxt5COkD
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Mikulas,

On 01.05.19 16:22, Mikulas Patocka wrote:
> I tested it on C8000 and confim that it works.

Thanks for testing!

By the way, I made you the author of the patch in git:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dfor-next&id=3Df1abe94b271807902d5b286c7216b812645713e2

In general, there are so many new cool features and patches pending
in the for-next tree, so I appreciate every kind of testing:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/lo=
g/?h=3Dfor-next

Helge

> On Sun, 28 Apr 2019, Helge Deller wrote:
>
>> This is a revised patch of the "per-pagetable spinlock patch" from
>> Mikulas, with additional edits from Dave Anglin and myself.
>> I've sucessfully (lightly) tested it on my L3000 (rp5470) machine which=
 is based
>> on the Merced bus and needs TLB flush serialization.
>> Dave has sent an additional patch to fix the hugepages.
>> Please review and test....
>>
>>
>> PA-RISC uses a global spinlock to protect pagetable updates in the TLB
>> fault handlers. When multiple cores are taking TLB faults
>> simultaneously, the cache line containing the spinlock becomes a
>> bottleneck.
>>
>> This patch embeds the spinlock in the top level page directory, so that
>> every process has its own lock. It improves performance by 30% when
>> doing parallel compilations.
>>
>> At least on the N class systems, only one PxTLB inter processor
>> broadcast can be active at any one time on the Merced bus. If a Merced
>> bus is found, this patch serializes the TLB flushes with the
>> pa_tlb_flush_lock spinlock.
>>
>> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/include/asm/hardware.h b/arch/parisc/include/a=
sm/hardware.h
>> index d6e1ed145031..9d3d7737c58b 100644
>> --- a/arch/parisc/include/asm/hardware.h
>> +++ b/arch/parisc/include/asm/hardware.h
>> @@ -120,7 +120,7 @@ extern void get_pci_node_path(struct pci_dev *dev, =
struct hardware_path *path);
>>  extern void init_parisc_bus(void);
>>  extern struct device *hwpath_to_device(struct hardware_path *modpath);
>>  extern void device_to_hwpath(struct device *dev, struct hardware_path =
*path);
>> -
>> +extern int machine_has_merced_bus(void);
>>
>>  /* inventory.c: */
>>  extern void do_memory_inventory(void);
>> diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/as=
m/pgalloc.h
>> index d05c678c77c4..ea75cc966dae 100644
>> --- a/arch/parisc/include/asm/pgalloc.h
>> +++ b/arch/parisc/include/asm/pgalloc.h
>> @@ -41,6 +41,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>>  		__pgd_val_set(*pgd, PxD_FLAG_ATTACHED);
>>  #endif
>>  	}
>> +	spin_lock_init(pgd_spinlock(actual_pgd));
>>  	return actual_pgd;
>>  }
>>
>> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/as=
m/pgtable.h
>> index c7bb74e22436..a39b079e73f2 100644
>> --- a/arch/parisc/include/asm/pgtable.h
>> +++ b/arch/parisc/include/asm/pgtable.h
>> @@ -17,7 +17,7 @@
>>  #include <asm/processor.h>
>>  #include <asm/cache.h>
>>
>> -extern spinlock_t pa_tlb_lock;
>> +static inline spinlock_t *pgd_spinlock(pgd_t *);
>>
>>  /*
>>   * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
>> @@ -34,16 +34,46 @@ extern spinlock_t pa_tlb_lock;
>>   */
>>  #define kern_addr_valid(addr)	(1)
>>
>> -/* Purge data and instruction TLB entries.  Must be called holding
>> - * the pa_tlb_lock.  The TLB purge instructions are slow on SMP
>> - * machines since the purge must be broadcast to all CPUs.
>> +/* This is for the serialization of PxTLB broadcasts. At least on the =
N class
>> + * systems, only one PxTLB inter processor broadcast can be active at =
any one
>> + * time on the Merced bus.
>> +
>> + * PTE updates are protected by locks in the PMD.
>> + */
>> +extern spinlock_t pa_tlb_flush_lock;
>> +extern spinlock_t pa_swapper_pg_lock;
>> +#if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
>> +extern int pa_serialize_tlb_flushes;
>> +#else
>> +#define pa_serialize_tlb_flushes        (0)
>> +#endif
>> +
>> +#define purge_tlb_start(flags)  do { \
>> +	if (pa_serialize_tlb_flushes)	\
>> +		spin_lock_irqsave(&pa_tlb_flush_lock, flags); \
>> +	else \
>> +		local_irq_save(flags);	\
>> +	} while (0)
>> +#define purge_tlb_end(flags)	do { \
>> +	if (pa_serialize_tlb_flushes)	\
>> +		spin_unlock_irqrestore(&pa_tlb_flush_lock, flags); \
>> +	else \
>> +		local_irq_restore(flags); \
>> +	} while (0)
>> +
>> +/* Purge data and instruction TLB entries. The TLB purge instructions
>> + * are slow on SMP machines since the purge must be broadcast to all C=
PUs.
>>   */
>>
>>  static inline void purge_tlb_entries(struct mm_struct *mm, unsigned lo=
ng addr)
>>  {
>> +	unsigned long flags;
>> +
>> +	purge_tlb_start(flags);
>>  	mtsp(mm->context, 1);
>>  	pdtlb(addr);
>>  	pitlb(addr);
>> +	purge_tlb_end(flags);
>>  }
>>
>>  /* Certain architectures need to do special things when PTEs
>> @@ -59,11 +89,11 @@ static inline void purge_tlb_entries(struct mm_stru=
ct *mm, unsigned long addr)
>>  	do {							\
>>  		pte_t old_pte;					\
>>  		unsigned long flags;				\
>> -		spin_lock_irqsave(&pa_tlb_lock, flags);		\
>> +		spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
>>  		old_pte =3D *ptep;				\
>>  		set_pte(ptep, pteval);				\
>>  		purge_tlb_entries(mm, addr);			\
>> -		spin_unlock_irqrestore(&pa_tlb_lock, flags);	\
>> +		spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
>>  	} while (0)
>>
>>  #endif /* !__ASSEMBLY__ */
>> @@ -88,10 +118,10 @@ static inline void purge_tlb_entries(struct mm_str=
uct *mm, unsigned long addr)
>>  #if CONFIG_PGTABLE_LEVELS =3D=3D 3
>>  #define PGD_ORDER	1 /* Number of pages per pgd */
>>  #define PMD_ORDER	1 /* Number of pages per pmd */
>> -#define PGD_ALLOC_ORDER	2 /* first pgd contains pmd */
>> +#define PGD_ALLOC_ORDER	(2 + 1) /* first pgd contains pmd */
>>  #else
>>  #define PGD_ORDER	1 /* Number of pages per pgd */
>> -#define PGD_ALLOC_ORDER	PGD_ORDER
>> +#define PGD_ALLOC_ORDER	(PGD_ORDER + 1)
>>  #endif
>>
>>  /* Definitions for 3rd level (we use PLD here for Page Lower directory
>> @@ -459,6 +489,15 @@ extern void update_mmu_cache(struct vm_area_struct=
 *, unsigned long, pte_t *);
>>  #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
>>  #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
>>
>> +
>> +static inline spinlock_t *pgd_spinlock(pgd_t *pgd)
>> +{
>> +	if (unlikely(pgd =3D=3D swapper_pg_dir))
>> +		return &pa_swapper_pg_lock;
>> +	return (spinlock_t *)((char *)pgd + (PAGE_SIZE << (PGD_ALLOC_ORDER - =
1)));
>> +}
>> +
>> +
>>  static inline int ptep_test_and_clear_young(struct vm_area_struct *vma=
, unsigned long addr, pte_t *ptep)
>>  {
>>  	pte_t pte;
>> @@ -467,15 +506,15 @@ static inline int ptep_test_and_clear_young(struc=
t vm_area_struct *vma, unsigned
>>  	if (!pte_young(*ptep))
>>  		return 0;
>>
>> -	spin_lock_irqsave(&pa_tlb_lock, flags);
>> +	spin_lock_irqsave(pgd_spinlock(vma->vm_mm->pgd), flags);
>>  	pte =3D *ptep;
>>  	if (!pte_young(pte)) {
>> -		spin_unlock_irqrestore(&pa_tlb_lock, flags);
>> +		spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
>>  		return 0;
>>  	}
>>  	set_pte(ptep, pte_mkold(pte));
>>  	purge_tlb_entries(vma->vm_mm, addr);
>> -	spin_unlock_irqrestore(&pa_tlb_lock, flags);
>> +	spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
>>  	return 1;
>>  }
>>
>> @@ -485,11 +524,11 @@ static inline pte_t ptep_get_and_clear(struct mm_=
struct *mm, unsigned long addr,
>>  	pte_t old_pte;
>>  	unsigned long flags;
>>
>> -	spin_lock_irqsave(&pa_tlb_lock, flags);
>> +	spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
>>  	old_pte =3D *ptep;
>>  	set_pte(ptep, __pte(0));
>>  	purge_tlb_entries(mm, addr);
>> -	spin_unlock_irqrestore(&pa_tlb_lock, flags);
>> +	spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
>>
>>  	return old_pte;
>>  }
>> @@ -497,10 +536,10 @@ static inline pte_t ptep_get_and_clear(struct mm_=
struct *mm, unsigned long addr,
>>  static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned l=
ong addr, pte_t *ptep)
>>  {
>>  	unsigned long flags;
>> -	spin_lock_irqsave(&pa_tlb_lock, flags);
>> +	spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
>>  	set_pte(ptep, pte_wrprotect(*ptep));
>>  	purge_tlb_entries(mm, addr);
>> -	spin_unlock_irqrestore(&pa_tlb_lock, flags);
>> +	spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
>>  }
>>
>>  #define pte_same(A,B)	(pte_val(A) =3D=3D pte_val(B))
>> diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/a=
sm/tlbflush.h
>> index 6804374efa66..c5ded01d45be 100644
>> --- a/arch/parisc/include/asm/tlbflush.h
>> +++ b/arch/parisc/include/asm/tlbflush.h
>> @@ -8,21 +8,6 @@
>>  #include <linux/sched.h>
>>  #include <asm/mmu_context.h>
>>
>> -
>> -/* This is for the serialisation of PxTLB broadcasts.  At least on the
>> - * N class systems, only one PxTLB inter processor broadcast can be
>> - * active at any one time on the Merced bus.  This tlb purge
>> - * synchronisation is fairly lightweight and harmless so we activate
>> - * it on all systems not just the N class.
>> -
>> - * It is also used to ensure PTE updates are atomic and consistent
>> - * with the TLB.
>> - */
>> -extern spinlock_t pa_tlb_lock;
>> -
>> -#define purge_tlb_start(flags)	spin_lock_irqsave(&pa_tlb_lock, flags)
>> -#define purge_tlb_end(flags)	spin_unlock_irqrestore(&pa_tlb_lock, flag=
s)
>> -
>>  extern void flush_tlb_all(void);
>>  extern void flush_tlb_all_local(void *);
>>
>> @@ -79,13 +64,6 @@ static inline void flush_tlb_mm(struct mm_struct *mm=
)
>>  static inline void flush_tlb_page(struct vm_area_struct *vma,
>>  	unsigned long addr)
>>  {
>> -	unsigned long flags, sid;
>> -
>> -	sid =3D vma->vm_mm->context;
>> -	purge_tlb_start(flags);
>> -	mtsp(sid, 1);
>> -	pdtlb(addr);
>> -	pitlb(addr);
>> -	purge_tlb_end(flags);
>> +	purge_tlb_entries(vma->vm_mm, addr);
>>  }
>>  #endif
>> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
>> index 804880efa11e..0338561968a4 100644
>> --- a/arch/parisc/kernel/cache.c
>> +++ b/arch/parisc/kernel/cache.c
>> @@ -40,12 +40,19 @@ void purge_dcache_page_asm(unsigned long phys_addr,=
 unsigned long vaddr);
>>  void flush_icache_page_asm(unsigned long phys_addr, unsigned long vadd=
r);
>>
>>
>> -/* On some machines (e.g. ones with the Merced bus), there can be
>> +/* On some machines (i.e., ones with the Merced bus), there can be
>>   * only a single PxTLB broadcast at a time; this must be guaranteed
>> - * by software.  We put a spinlock around all TLB flushes  to
>> - * ensure this.
>> + * by software. We need a spinlock around all TLB flushes to ensure
>> + * this.
>>   */
>> -DEFINE_SPINLOCK(pa_tlb_lock);
>> +DEFINE_SPINLOCK(pa_tlb_flush_lock);
>> +
>> +/* Swapper page setup lock. */
>> +DEFINE_SPINLOCK(pa_swapper_pg_lock);
>> +
>> +#if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
>> +int pa_serialize_tlb_flushes __read_mostly;
>> +#endif
>>
>>  struct pdc_cache_info cache_info __read_mostly;
>>  #ifndef CONFIG_PA20
>> diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.=
c
>> index 5eb979d04b90..15e7b3be7b6b 100644
>> --- a/arch/parisc/kernel/drivers.c
>> +++ b/arch/parisc/kernel/drivers.c
>> @@ -38,6 +38,7 @@
>>  #include <asm/io.h>
>>  #include <asm/pdc.h>
>>  #include <asm/parisc-device.h>
>> +#include <asm/ropes.h>
>>
>>  /* See comments in include/asm-parisc/pci.h */
>>  const struct dma_map_ops *hppa_dma_ops __read_mostly;
>> @@ -257,6 +258,30 @@ static struct parisc_device *find_device_by_addr(u=
nsigned long hpa)
>>  	return ret ? d.dev : NULL;
>>  }
>>
>> +static int __init is_IKE_device(struct device *dev, void *data)
>> +{
>> +	struct parisc_device *pdev =3D to_parisc_device(dev);
>> +
>> +	if (!check_dev(dev))
>> +		return 0;
>> +	if (pdev->id.hw_type !=3D HPHW_BCPORT)
>> +		return 0;
>> +	if (IS_IKE(pdev) ||
>> +		(pdev->id.hversion =3D=3D REO_MERCED_PORT) ||
>> +		(pdev->id.hversion =3D=3D REOG_MERCED_PORT)) {
>> +			return 1;
>> +	}
>> +	return 0;
>> +}
>> +
>> +int __init machine_has_merced_bus(void)
>> +{
>> +	int ret;
>> +
>> +	ret =3D for_each_padev(is_IKE_device, NULL);
>> +	return ret ? 1 : 0;
>> +}
>> +
>>  /**
>>   * find_pa_parent_type - Find a parent of a specific type
>>   * @dev: The device to start searching from
>> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
>> index 5796524a3137..a1fc04570ade 100644
>> --- a/arch/parisc/kernel/entry.S
>> +++ b/arch/parisc/kernel/entry.S
>> @@ -50,12 +50,8 @@
>>
>>  	.import		pa_tlb_lock,data
>>  	.macro  load_pa_tlb_lock reg
>> -#if __PA_LDCW_ALIGNMENT > 4
>> -	load32	PA(pa_tlb_lock) + __PA_LDCW_ALIGNMENT-1, \reg
>> -	depi	0,31,__PA_LDCW_ALIGN_ORDER, \reg
>> -#else
>> -	load32	PA(pa_tlb_lock), \reg
>> -#endif
>> +	mfctl		%cr25,\reg
>> +	addil		L%(PAGE_SIZE << (PGD_ALLOC_ORDER - 1)),\reg
>>  	.endm
>>
>>  	/* space_to_prot macro creates a prot id from a space id */
>> diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/invent=
ory.c
>> index 35d05fdd7483..6f2d611347a1 100644
>> --- a/arch/parisc/kernel/inventory.c
>> +++ b/arch/parisc/kernel/inventory.c
>> @@ -31,6 +31,7 @@
>>  #include <asm/processor.h>
>>  #include <asm/page.h>
>>  #include <asm/parisc-device.h>
>> +#include <asm/tlbflush.h>
>>
>>  /*
>>  ** Debug options
>> @@ -638,4 +639,10 @@ void __init do_device_inventory(void)
>>  	}
>>  	printk(KERN_INFO "Found devices:\n");
>>  	print_parisc_devices();
>> +
>> +#if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
>> +	pa_serialize_tlb_flushes =3D machine_has_merced_bus();
>> +	if (pa_serialize_tlb_flushes)
>> +		pr_info("Merced bus found: Enable PxTLB serialization.\n");
>> +#endif
>>  }
>> diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
>> index d908058d05c1..e05cb2a5c16d 100644
>> --- a/arch/parisc/kernel/setup.c
>> +++ b/arch/parisc/kernel/setup.c
>> @@ -343,6 +343,12 @@ static int __init parisc_init(void)
>>  			boot_cpu_data.cpu_hz / 1000000,
>>  			boot_cpu_data.cpu_hz % 1000000	);
>>
>> +#if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
>> +	/* Don't serialize TLB flushes if we run on one CPU only. */
>> +	if (num_online_cpus() =3D=3D 1)
>> +		pa_serialize_tlb_flushes =3D 0;
>> +#endif
>> +
>>  	apply_alternatives_all();
>>  	parisc_setup_cache_timing();
>>

