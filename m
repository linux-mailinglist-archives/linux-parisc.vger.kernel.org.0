Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41DBA108F5
	for <lists+linux-parisc@lfdr.de>; Wed,  1 May 2019 16:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfEAOWf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 May 2019 10:22:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45950 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbfEAOWe (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 May 2019 10:22:34 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 326DB30832C3;
        Wed,  1 May 2019 14:22:34 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id DDACD18501;
        Wed,  1 May 2019 14:22:33 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x41EMXHX007335;
        Wed, 1 May 2019 10:22:33 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x41EMWZl007331;
        Wed, 1 May 2019 10:22:33 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 1 May 2019 10:22:32 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: Re: [PATCH][RFC] parisc: Use per-pagetable spinlock (v2)
In-Reply-To: <20190428173431.GA21286@ls3530.dellerweb.de>
Message-ID: <alpine.LRH.2.02.1905011021300.6862@file01.intranet.prod.int.rdu2.redhat.com>
References: <20190428173431.GA21286@ls3530.dellerweb.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 01 May 2019 14:22:34 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi

I tested it on C8000 and confim that it works.

Mikulas


On Sun, 28 Apr 2019, Helge Deller wrote:

> This is a revised patch of the "per-pagetable spinlock patch" from
> Mikulas, with additional edits from Dave Anglin and myself.
> I've sucessfully (lightly) tested it on my L3000 (rp5470) machine which is based
> on the Merced bus and needs TLB flush serialization.
> Dave has sent an additional patch to fix the hugepages.
> Please review and test....
> 
> 
> PA-RISC uses a global spinlock to protect pagetable updates in the TLB
> fault handlers. When multiple cores are taking TLB faults
> simultaneously, the cache line containing the spinlock becomes a
> bottleneck.
> 
> This patch embeds the spinlock in the top level page directory, so that
> every process has its own lock. It improves performance by 30% when
> doing parallel compilations.
> 
> At least on the N class systems, only one PxTLB inter processor
> broadcast can be active at any one time on the Merced bus. If a Merced
> bus is found, this patch serializes the TLB flushes with the
> pa_tlb_flush_lock spinlock.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/include/asm/hardware.h b/arch/parisc/include/asm/hardware.h
> index d6e1ed145031..9d3d7737c58b 100644
> --- a/arch/parisc/include/asm/hardware.h
> +++ b/arch/parisc/include/asm/hardware.h
> @@ -120,7 +120,7 @@ extern void get_pci_node_path(struct pci_dev *dev, struct hardware_path *path);
>  extern void init_parisc_bus(void);
>  extern struct device *hwpath_to_device(struct hardware_path *modpath);
>  extern void device_to_hwpath(struct device *dev, struct hardware_path *path);
> -
> +extern int machine_has_merced_bus(void);
> 
>  /* inventory.c: */
>  extern void do_memory_inventory(void);
> diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
> index d05c678c77c4..ea75cc966dae 100644
> --- a/arch/parisc/include/asm/pgalloc.h
> +++ b/arch/parisc/include/asm/pgalloc.h
> @@ -41,6 +41,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  		__pgd_val_set(*pgd, PxD_FLAG_ATTACHED);
>  #endif
>  	}
> +	spin_lock_init(pgd_spinlock(actual_pgd));
>  	return actual_pgd;
>  }
> 
> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
> index c7bb74e22436..a39b079e73f2 100644
> --- a/arch/parisc/include/asm/pgtable.h
> +++ b/arch/parisc/include/asm/pgtable.h
> @@ -17,7 +17,7 @@
>  #include <asm/processor.h>
>  #include <asm/cache.h>
> 
> -extern spinlock_t pa_tlb_lock;
> +static inline spinlock_t *pgd_spinlock(pgd_t *);
> 
>  /*
>   * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
> @@ -34,16 +34,46 @@ extern spinlock_t pa_tlb_lock;
>   */
>  #define kern_addr_valid(addr)	(1)
> 
> -/* Purge data and instruction TLB entries.  Must be called holding
> - * the pa_tlb_lock.  The TLB purge instructions are slow on SMP
> - * machines since the purge must be broadcast to all CPUs.
> +/* This is for the serialization of PxTLB broadcasts. At least on the N class
> + * systems, only one PxTLB inter processor broadcast can be active at any one
> + * time on the Merced bus.
> +
> + * PTE updates are protected by locks in the PMD.
> + */
> +extern spinlock_t pa_tlb_flush_lock;
> +extern spinlock_t pa_swapper_pg_lock;
> +#if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
> +extern int pa_serialize_tlb_flushes;
> +#else
> +#define pa_serialize_tlb_flushes        (0)
> +#endif
> +
> +#define purge_tlb_start(flags)  do { \
> +	if (pa_serialize_tlb_flushes)	\
> +		spin_lock_irqsave(&pa_tlb_flush_lock, flags); \
> +	else \
> +		local_irq_save(flags);	\
> +	} while (0)
> +#define purge_tlb_end(flags)	do { \
> +	if (pa_serialize_tlb_flushes)	\
> +		spin_unlock_irqrestore(&pa_tlb_flush_lock, flags); \
> +	else \
> +		local_irq_restore(flags); \
> +	} while (0)
> +
> +/* Purge data and instruction TLB entries. The TLB purge instructions
> + * are slow on SMP machines since the purge must be broadcast to all CPUs.
>   */
> 
>  static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
>  {
> +	unsigned long flags;
> +
> +	purge_tlb_start(flags);
>  	mtsp(mm->context, 1);
>  	pdtlb(addr);
>  	pitlb(addr);
> +	purge_tlb_end(flags);
>  }
> 
>  /* Certain architectures need to do special things when PTEs
> @@ -59,11 +89,11 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
>  	do {							\
>  		pte_t old_pte;					\
>  		unsigned long flags;				\
> -		spin_lock_irqsave(&pa_tlb_lock, flags);		\
> +		spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
>  		old_pte = *ptep;				\
>  		set_pte(ptep, pteval);				\
>  		purge_tlb_entries(mm, addr);			\
> -		spin_unlock_irqrestore(&pa_tlb_lock, flags);	\
> +		spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
>  	} while (0)
> 
>  #endif /* !__ASSEMBLY__ */
> @@ -88,10 +118,10 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
>  #if CONFIG_PGTABLE_LEVELS == 3
>  #define PGD_ORDER	1 /* Number of pages per pgd */
>  #define PMD_ORDER	1 /* Number of pages per pmd */
> -#define PGD_ALLOC_ORDER	2 /* first pgd contains pmd */
> +#define PGD_ALLOC_ORDER	(2 + 1) /* first pgd contains pmd */
>  #else
>  #define PGD_ORDER	1 /* Number of pages per pgd */
> -#define PGD_ALLOC_ORDER	PGD_ORDER
> +#define PGD_ALLOC_ORDER	(PGD_ORDER + 1)
>  #endif
> 
>  /* Definitions for 3rd level (we use PLD here for Page Lower directory
> @@ -459,6 +489,15 @@ extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t *);
>  #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
> 
> +
> +static inline spinlock_t *pgd_spinlock(pgd_t *pgd)
> +{
> +	if (unlikely(pgd == swapper_pg_dir))
> +		return &pa_swapper_pg_lock;
> +	return (spinlock_t *)((char *)pgd + (PAGE_SIZE << (PGD_ALLOC_ORDER - 1)));
> +}
> +
> +
>  static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
>  {
>  	pte_t pte;
> @@ -467,15 +506,15 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned
>  	if (!pte_young(*ptep))
>  		return 0;
> 
> -	spin_lock_irqsave(&pa_tlb_lock, flags);
> +	spin_lock_irqsave(pgd_spinlock(vma->vm_mm->pgd), flags);
>  	pte = *ptep;
>  	if (!pte_young(pte)) {
> -		spin_unlock_irqrestore(&pa_tlb_lock, flags);
> +		spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
>  		return 0;
>  	}
>  	set_pte(ptep, pte_mkold(pte));
>  	purge_tlb_entries(vma->vm_mm, addr);
> -	spin_unlock_irqrestore(&pa_tlb_lock, flags);
> +	spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
>  	return 1;
>  }
> 
> @@ -485,11 +524,11 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>  	pte_t old_pte;
>  	unsigned long flags;
> 
> -	spin_lock_irqsave(&pa_tlb_lock, flags);
> +	spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
>  	old_pte = *ptep;
>  	set_pte(ptep, __pte(0));
>  	purge_tlb_entries(mm, addr);
> -	spin_unlock_irqrestore(&pa_tlb_lock, flags);
> +	spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
> 
>  	return old_pte;
>  }
> @@ -497,10 +536,10 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>  static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
>  {
>  	unsigned long flags;
> -	spin_lock_irqsave(&pa_tlb_lock, flags);
> +	spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
>  	set_pte(ptep, pte_wrprotect(*ptep));
>  	purge_tlb_entries(mm, addr);
> -	spin_unlock_irqrestore(&pa_tlb_lock, flags);
> +	spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
>  }
> 
>  #define pte_same(A,B)	(pte_val(A) == pte_val(B))
> diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
> index 6804374efa66..c5ded01d45be 100644
> --- a/arch/parisc/include/asm/tlbflush.h
> +++ b/arch/parisc/include/asm/tlbflush.h
> @@ -8,21 +8,6 @@
>  #include <linux/sched.h>
>  #include <asm/mmu_context.h>
> 
> -
> -/* This is for the serialisation of PxTLB broadcasts.  At least on the
> - * N class systems, only one PxTLB inter processor broadcast can be
> - * active at any one time on the Merced bus.  This tlb purge
> - * synchronisation is fairly lightweight and harmless so we activate
> - * it on all systems not just the N class.
> -
> - * It is also used to ensure PTE updates are atomic and consistent
> - * with the TLB.
> - */
> -extern spinlock_t pa_tlb_lock;
> -
> -#define purge_tlb_start(flags)	spin_lock_irqsave(&pa_tlb_lock, flags)
> -#define purge_tlb_end(flags)	spin_unlock_irqrestore(&pa_tlb_lock, flags)
> -
>  extern void flush_tlb_all(void);
>  extern void flush_tlb_all_local(void *);
> 
> @@ -79,13 +64,6 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>  static inline void flush_tlb_page(struct vm_area_struct *vma,
>  	unsigned long addr)
>  {
> -	unsigned long flags, sid;
> -
> -	sid = vma->vm_mm->context;
> -	purge_tlb_start(flags);
> -	mtsp(sid, 1);
> -	pdtlb(addr);
> -	pitlb(addr);
> -	purge_tlb_end(flags);
> +	purge_tlb_entries(vma->vm_mm, addr);
>  }
>  #endif
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index 804880efa11e..0338561968a4 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -40,12 +40,19 @@ void purge_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
>  void flush_icache_page_asm(unsigned long phys_addr, unsigned long vaddr);
> 
> 
> -/* On some machines (e.g. ones with the Merced bus), there can be
> +/* On some machines (i.e., ones with the Merced bus), there can be
>   * only a single PxTLB broadcast at a time; this must be guaranteed
> - * by software.  We put a spinlock around all TLB flushes  to
> - * ensure this.
> + * by software. We need a spinlock around all TLB flushes to ensure
> + * this.
>   */
> -DEFINE_SPINLOCK(pa_tlb_lock);
> +DEFINE_SPINLOCK(pa_tlb_flush_lock);
> +
> +/* Swapper page setup lock. */
> +DEFINE_SPINLOCK(pa_swapper_pg_lock);
> +
> +#if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
> +int pa_serialize_tlb_flushes __read_mostly;
> +#endif
> 
>  struct pdc_cache_info cache_info __read_mostly;
>  #ifndef CONFIG_PA20
> diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
> index 5eb979d04b90..15e7b3be7b6b 100644
> --- a/arch/parisc/kernel/drivers.c
> +++ b/arch/parisc/kernel/drivers.c
> @@ -38,6 +38,7 @@
>  #include <asm/io.h>
>  #include <asm/pdc.h>
>  #include <asm/parisc-device.h>
> +#include <asm/ropes.h>
> 
>  /* See comments in include/asm-parisc/pci.h */
>  const struct dma_map_ops *hppa_dma_ops __read_mostly;
> @@ -257,6 +258,30 @@ static struct parisc_device *find_device_by_addr(unsigned long hpa)
>  	return ret ? d.dev : NULL;
>  }
> 
> +static int __init is_IKE_device(struct device *dev, void *data)
> +{
> +	struct parisc_device *pdev = to_parisc_device(dev);
> +
> +	if (!check_dev(dev))
> +		return 0;
> +	if (pdev->id.hw_type != HPHW_BCPORT)
> +		return 0;
> +	if (IS_IKE(pdev) ||
> +		(pdev->id.hversion == REO_MERCED_PORT) ||
> +		(pdev->id.hversion == REOG_MERCED_PORT)) {
> +			return 1;
> +	}
> +	return 0;
> +}
> +
> +int __init machine_has_merced_bus(void)
> +{
> +	int ret;
> +
> +	ret = for_each_padev(is_IKE_device, NULL);
> +	return ret ? 1 : 0;
> +}
> +
>  /**
>   * find_pa_parent_type - Find a parent of a specific type
>   * @dev: The device to start searching from
> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
> index 5796524a3137..a1fc04570ade 100644
> --- a/arch/parisc/kernel/entry.S
> +++ b/arch/parisc/kernel/entry.S
> @@ -50,12 +50,8 @@
> 
>  	.import		pa_tlb_lock,data
>  	.macro  load_pa_tlb_lock reg
> -#if __PA_LDCW_ALIGNMENT > 4
> -	load32	PA(pa_tlb_lock) + __PA_LDCW_ALIGNMENT-1, \reg
> -	depi	0,31,__PA_LDCW_ALIGN_ORDER, \reg
> -#else
> -	load32	PA(pa_tlb_lock), \reg
> -#endif
> +	mfctl		%cr25,\reg
> +	addil		L%(PAGE_SIZE << (PGD_ALLOC_ORDER - 1)),\reg
>  	.endm
> 
>  	/* space_to_prot macro creates a prot id from a space id */
> diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory.c
> index 35d05fdd7483..6f2d611347a1 100644
> --- a/arch/parisc/kernel/inventory.c
> +++ b/arch/parisc/kernel/inventory.c
> @@ -31,6 +31,7 @@
>  #include <asm/processor.h>
>  #include <asm/page.h>
>  #include <asm/parisc-device.h>
> +#include <asm/tlbflush.h>
> 
>  /*
>  ** Debug options
> @@ -638,4 +639,10 @@ void __init do_device_inventory(void)
>  	}
>  	printk(KERN_INFO "Found devices:\n");
>  	print_parisc_devices();
> +
> +#if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
> +	pa_serialize_tlb_flushes = machine_has_merced_bus();
> +	if (pa_serialize_tlb_flushes)
> +		pr_info("Merced bus found: Enable PxTLB serialization.\n");
> +#endif
>  }
> diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
> index d908058d05c1..e05cb2a5c16d 100644
> --- a/arch/parisc/kernel/setup.c
> +++ b/arch/parisc/kernel/setup.c
> @@ -343,6 +343,12 @@ static int __init parisc_init(void)
>  			boot_cpu_data.cpu_hz / 1000000,
>  			boot_cpu_data.cpu_hz % 1000000	);
> 
> +#if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
> +	/* Don't serialize TLB flushes if we run on one CPU only. */
> +	if (num_online_cpus() == 1)
> +		pa_serialize_tlb_flushes = 0;
> +#endif
> +
>  	apply_alternatives_all();
>  	parisc_setup_cache_timing();
> 
