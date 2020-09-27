Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CD127A162
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Sep 2020 16:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgI0OYs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Sep 2020 10:24:48 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:35601 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726149AbgI0OYs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Sep 2020 10:24:48 -0400
X-Greylist: delayed 432 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Sep 2020 10:24:48 EDT
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20200927141735.YCLO6892.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 27 Sep 2020 10:17:35 -0400
Received: from [192.168.2.49] (really [70.53.61.197]) by torspm02.bell.net
          with ESMTP
          id <20200927141735.CIUO16325.torspm02.bell.net@[192.168.2.49]>;
          Sun, 27 Sep 2020 10:17:35 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: v5.8.x stability on parisc
Message-ID: <bd1c6298-db1a-79ab-279b-60daad6bed22@bell.net>
Date:   Sun, 27 Sep 2020 10:17:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=XvWExmN9 c=1 sm=1 tr=0 a=6x1y2OhCX1CAR/Lk3lU3cg==:117 a=6x1y2OhCX1CAR/Lk3lU3cg==:17 a=IkcTkHD0fZMA:10 a=reM5J-MqmosA:10 a=p6DNFGte62J2v5j3AqEA:9 a=FrVjGLf7adc_4jdm:21 a=5BGrVuhFl43365Mp:21 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4wfDZTabOppa7SNfGC5UU4CbJc4Z60lPzVRXZT0JjrJag75m3DUinCrkxMDnKzzCXnnrVONQ/etoAXQdbHPRXRnA0NMeTxdsRJrVh07X4FSVAxjZxJQ7XC jPv/P3yi+55aBJmC6TA1RWC2cGc8E95uCAqdCaifllT+2MndslNVY0pjI+6y9WCPDtVpFLIQaNM35g==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

With this patch collection, I haven't seen any stalls on my rp3440 and c8000 running v5.8.x.  Further,
I haven't had any signing failures on the buildd machine.  The rp3440 (mx3210) has also been successful in
building several packages that failed multiple time on the c8000 buildd.

I think this is due to the three changes at the bottom from Linus.

Regards,
Dave

diff --git a/arch/parisc/include/asm/barrier.h b/arch/parisc/include/asm/barrier.h
index 640d46edf32e..c705decf2bed 100644
--- a/arch/parisc/include/asm/barrier.h
+++ b/arch/parisc/include/asm/barrier.h
@@ -2,11 +2,15 @@
 #ifndef __ASM_BARRIER_H
 #define __ASM_BARRIER_H

+#include <asm/alternative.h>
+
 #ifndef __ASSEMBLY__

 /* The synchronize caches instruction executes as a nop on systems in
    which all memory references are performed in order. */
-#define synchronize_caches() __asm__ __volatile__ ("sync" : : : "memory")
+#define synchronize_caches() asm volatile("sync" \
+	ALTERNATIVE(ALT_COND_NO_SMP, INSN_NOP) \
+	: : : "memory")

 #if defined(CONFIG_SMP)
 #define mb()		do { synchronize_caches(); } while (0)
diff --git a/arch/parisc/include/asm/cmpxchg.h b/arch/parisc/include/asm/cmpxchg.h
index 068958575871..cf5ee9b0b393 100644
--- a/arch/parisc/include/asm/cmpxchg.h
+++ b/arch/parisc/include/asm/cmpxchg.h
@@ -14,22 +14,22 @@
 extern void __xchg_called_with_bad_pointer(void);

 /* __xchg32/64 defined in arch/parisc/lib/bitops.c */
-extern unsigned long __xchg8(char, char *);
-extern unsigned long __xchg32(int, int *);
+extern unsigned long __xchg8(char, volatile char *);
+extern unsigned long __xchg32(int, volatile int *);
 #ifdef CONFIG_64BIT
-extern unsigned long __xchg64(unsigned long, unsigned long *);
+extern unsigned long __xchg64(unsigned long, volatile unsigned long *);
 #endif

 /* optimizer better get rid of switch since size is a constant */
 static inline unsigned long
-__xchg(unsigned long x, __volatile__ void *ptr, int size)
+__xchg(unsigned long x, volatile void *ptr, int size)
 {
 	switch (size) {
 #ifdef CONFIG_64BIT
-	case 8: return __xchg64(x, (unsigned long *) ptr);
+	case 8: return __xchg64(x, (volatile unsigned long *) ptr);
 #endif
-	case 4: return __xchg32((int) x, (int *) ptr);
-	case 1: return __xchg8((char) x, (char *) ptr);
+	case 4: return __xchg32((int) x, (volatile int *) ptr);
+	case 1: return __xchg8((char) x, (volatile char *) ptr);
 	}
 	__xchg_called_with_bad_pointer();
 	return x;
diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index c459f656c8c3..fceb9cf02fb3 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -16,7 +16,7 @@ static inline void
 _futex_spin_lock_irqsave(u32 __user *uaddr, unsigned long int *flags)
 {
 	extern u32 lws_lock_start[];
-	long index = ((long)uaddr & 0xf0) >> 2;
+	long index = ((long)uaddr & 0x3f8) >> 1;
 	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
 	local_irq_save(*flags);
 	arch_spin_lock(s);
@@ -26,7 +26,7 @@ static inline void
 _futex_spin_unlock_irqrestore(u32 __user *uaddr, unsigned long int *flags)
 {
 	extern u32 lws_lock_start[];
-	long index = ((long)uaddr & 0xf0) >> 2;
+	long index = ((long)uaddr & 0x3f8) >> 1;
 	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
 	arch_spin_unlock(s);
 	local_irq_restore(*flags);
diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/asm/ldcw.h
index e080143e79a3..0b182450a2fb 100644
--- a/arch/parisc/include/asm/ldcw.h
+++ b/arch/parisc/include/asm/ldcw.h
@@ -51,6 +51,19 @@
 	__ret;							\
 })

+/* LDCW is strongly ordered and can be used as a memory barrier
+   when a suitably aligned address is available. */
+#ifdef CONFIG_SMP
+#define __ldcw_mb(a) ({						\
+	unsigned __tmp;						\
+	__asm__ __volatile__(__LDCW " 0(%1),%0"			\
+	ALTERNATIVE(ALT_COND_NO_SMP, INSN_NOP)			\
+	: "=r" (__tmp) : "r" (a) : "memory");			\
+})
+#else
+#define __ldcw_mb(a) barrier();
+#endif
+
 #ifdef CONFIG_SMP
 # define __lock_aligned __section(.data..lock_aligned)
 #endif
diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/spinlock.h
index 51b6c47f802f..fa5ee8a45dbd 100644
--- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -10,13 +10,21 @@
 static inline int arch_spin_is_locked(arch_spinlock_t *x)
 {
 	volatile unsigned int *a = __ldcw_align(x);
-	return *a == 0;
+	return READ_ONCE(*a) == 0;
 }

-#define arch_spin_lock(lock) arch_spin_lock_flags(lock, 0)
+static inline void arch_spin_lock(arch_spinlock_t *x)
+{
+	volatile unsigned int *a;
+
+	a = __ldcw_align(x);
+	while (__ldcw(a) == 0)
+		while (*a == 0)
+			continue;
+}

 static inline void arch_spin_lock_flags(arch_spinlock_t *x,
-					 unsigned long flags)
+					unsigned long flags)
 {
 	volatile unsigned int *a;

@@ -25,10 +33,8 @@ static inline void arch_spin_lock_flags(arch_spinlock_t *x,
 		while (*a == 0)
 			if (flags & PSW_SM_I) {
 				local_irq_enable();
-				cpu_relax();
 				local_irq_disable();
-			} else
-				cpu_relax();
+			}
 }
 #define arch_spin_lock_flags arch_spin_lock_flags

@@ -44,12 +50,9 @@ static inline void arch_spin_unlock(arch_spinlock_t *x)
 static inline int arch_spin_trylock(arch_spinlock_t *x)
 {
 	volatile unsigned int *a;
-	int ret;

 	a = __ldcw_align(x);
-        ret = __ldcw(a) != 0;
-
-	return ret;
+	return __ldcw(a) != 0;
 }

 /*
diff --git a/arch/parisc/install.sh b/arch/parisc/install.sh
index 6f68784fea25..056d588befdd 100644
--- a/arch/parisc/install.sh
+++ b/arch/parisc/install.sh
@@ -43,7 +43,7 @@ fi

 # Default install

-if [ "$(basename $2)" = "zImage" ]; then
+if [ "$(basename $2)" = "vmlinuz" ]; then
 # Compressed install
   echo "Installing compressed kernel"
   base=vmlinuz
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 1eedfecc5137..3686f496fd27 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -384,12 +384,12 @@ EXPORT_SYMBOL(flush_kernel_icache_range_asm);
 static unsigned long parisc_cache_flush_threshold __ro_after_init = FLUSH_THRESHOLD;

 #define FLUSH_TLB_THRESHOLD (16*1024) /* 16 KiB minimum TLB threshold */
-static unsigned long parisc_tlb_flush_threshold __ro_after_init = FLUSH_TLB_THRESHOLD;
+static unsigned long parisc_tlb_flush_threshold __ro_after_init = ~0UL;

 void __init parisc_setup_cache_timing(void)
 {
 	unsigned long rangetime, alltime;
-	unsigned long size, start;
+	unsigned long size;
 	unsigned long threshold;

 	alltime = mfctl(16);
@@ -423,14 +423,9 @@ void __init parisc_setup_cache_timing(void)
 		goto set_tlb_threshold;
 	}

-	size = 0;
-	start = (unsigned long) _text;
+	size = (unsigned long)_end - (unsigned long)_text;
 	rangetime = mfctl(16);
-	while (start < (unsigned long) _end) {
-		flush_tlb_kernel_range(start, start + PAGE_SIZE);
-		start += PAGE_SIZE;
-		size += PAGE_SIZE;
-	}
+	flush_tlb_kernel_range((unsigned long)_text, (unsigned long)_end);
 	rangetime = mfctl(16) - rangetime;

 	alltime = mfctl(16);
@@ -445,8 +440,11 @@ void __init parisc_setup_cache_timing(void)
 		threshold/1024);

 set_tlb_threshold:
-	if (threshold > parisc_tlb_flush_threshold)
+	if (threshold > FLUSH_TLB_THRESHOLD)
 		parisc_tlb_flush_threshold = threshold;
+	else
+		parisc_tlb_flush_threshold = FLUSH_TLB_THRESHOLD;
+
 	printk(KERN_INFO "TLB flush threshold set to %lu KiB\n",
 		parisc_tlb_flush_threshold/1024);
 }
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 519f9056fd00..f6f28e41bb5e 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -899,20 +899,20 @@ intr_check_sig:
 	 * Only do signals if we are returning to user space
 	 */
 	LDREG	PT_IASQ0(%r16), %r20
-	cmpib,COND(=),n LINUX_GATEWAY_SPACE, %r20, intr_restore /* backward */
+	cmpib,COND(=),n LINUX_GATEWAY_SPACE, %r20, intr_restore /* forward */
 	LDREG	PT_IASQ1(%r16), %r20
-	cmpib,COND(=),n LINUX_GATEWAY_SPACE, %r20, intr_restore /* backward */
-
-	/* NOTE: We need to enable interrupts if we have to deliver
-	 * signals. We used to do this earlier but it caused kernel
-	 * stack overflows. */
-	ssm     PSW_SM_I, %r0
+	cmpib,COND(=),n LINUX_GATEWAY_SPACE, %r20, intr_restore /* forward */

 	copy	%r0, %r25			/* long in_syscall = 0 */
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif

+	/* NOTE: We need to enable interrupts if we have to deliver
+	 * signals. We used to do this earlier but it caused kernel
+	 * stack overflows. */
+	ssm	PSW_SM_I, %r0
+
 	BL	do_notify_resume,%r2
 	copy	%r16, %r26			/* struct pt_regs *regs */

diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index aa93d775c34d..cd3e5fd39410 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -340,6 +340,19 @@ smp_slave_stext:
 	bv              (%rp)
 	ssm             PSW_SM_W,%r0
 2:
+#endif
+
+#ifdef CONFIG_64BIT
+	/*
+	 *  Enable Wide mode early, in case smp_init_current_idle_task was
+	 *  allocated above 4GB.
+         */
+1:	mfia            %rp             /* clear upper part of pcoq */
+	ldo             2f-1b(%rp),%rp
+	depdi           0,31,32,%rp
+	bv              (%rp)
+	ssm             PSW_SM_W,%r0
+2:
 #endif

 	/*  Initialize the SP - monarch sets up smp_init_current_idle_task */
diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index 81de5e2b391c..c2981401775c 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -289,13 +289,3 @@ os_hpmc_6:
 	b .
 	nop
 	.align 16	/* make function length multiple of 16 bytes */
-.os_hpmc_end:
-
-
-	__INITRODATA
-.globl os_hpmc_size
-	.align 4
-	.type   os_hpmc_size, @object
-	.size   os_hpmc_size, 4
-os_hpmc_size:
-	.word .os_hpmc_end-.os_hpmc
diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index 6e8550fefad6..fcc761b0e11b 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -18,6 +18,8 @@
 #include <linux/kthread.h>
 #include <linux/initrd.h>
 #include <linux/pgtable.h>
+#include <linux/swap.h>
+#include <linux/swapops.h>

 #include <asm/pdc.h>
 #include <asm/pdcpat.h>
@@ -230,6 +232,7 @@ void __init pdc_pdt_init(void)

 		/* mark memory page bad */
 		memblock_reserve(pdt_entry[i] & PAGE_MASK, PAGE_SIZE);
+		num_poisoned_pages_inc();
 	}
 }

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 3ad61a177f5b..322503780db6 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -571,8 +571,8 @@ lws_compare_and_swap:
 	ldil	L%lws_lock_start, %r20
 	ldo	R%lws_lock_start(%r20), %r28

-	/* Extract four bits from r26 and hash lock (Bits 4-7) */
-	extru  %r26, 27, 4, %r20
+	/* Extract eight bits from r26 and hash lock (Bits 3-11) */
+	extru  %r26, 28, 8, %r20

 	/* Find lock to use, the hash is either one of 0 to
 	   15, multiplied by 16 (keep it 16-byte aligned)
@@ -761,8 +761,8 @@ cas2_lock_start:
 	ldil	L%lws_lock_start, %r20
 	ldo	R%lws_lock_start(%r20), %r28

-	/* Extract four bits from r26 and hash lock (Bits 4-7) */
-	extru  %r26, 27, 4, %r20
+	/* Extract eight bits from r26 and hash lock (Bits 3-11) */
+	extru  %r26, 28, 8, %r20

 	/* Find lock to use, the hash is either one of 0 to
 	   15, multiplied by 16 (keep it 16-byte aligned)
@@ -950,7 +950,7 @@ END(sys_call_table64)
 	.align	L1_CACHE_BYTES
 ENTRY(lws_lock_start)
 	/* lws locks */
-	.rept 16
+	.rept 256
 	/* Keep locks aligned at 16-bytes */
 	.word 1
 	.word 0
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 5400e23a77a1..0c3064a927b8 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -799,14 +799,13 @@ void notrace handle_interruption(int code, struct pt_regs *regs)

 void __init initialize_ivt(const void *iva)
 {
-	extern u32 os_hpmc_size;
 	extern const u32 os_hpmc[];

 	int i;
 	u32 check = 0;
 	u32 *ivap;
 	u32 *hpmcp;
-	u32 length, instr;
+	u32 instr;

 	if (strcmp((const char *)iva, "cows can fly"))
 		panic("IVT invalid");
@@ -837,18 +836,14 @@ void __init initialize_ivt(const void *iva)

 	/* Setup IVA and compute checksum for HPMC handler */
 	ivap[6] = (u32)__pa(os_hpmc);
-	length = os_hpmc_size;
-	ivap[7] = length;

 	hpmcp = (u32 *)os_hpmc;

-	for (i=0; i<length/4; i++)
-	    check += *hpmcp++;
-
 	for (i=0; i<8; i++)
 	    check += ivap[i];

 	ivap[5] = -check;
+	pr_info("initialize_ivt: IVA[6] = 0x%08x\n", ivap[6]);
 }
 	

diff --git a/arch/parisc/lib/bitops.c b/arch/parisc/lib/bitops.c
index 2e4d1f05a926..9ac683bf6ae7 100644
--- a/arch/parisc/lib/bitops.c
+++ b/arch/parisc/lib/bitops.c
@@ -18,7 +18,7 @@ arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
 #endif

 #ifdef CONFIG_64BIT
-unsigned long __xchg64(unsigned long x, unsigned long *ptr)
+unsigned long __xchg64(unsigned long x, volatile unsigned long *ptr)
 {
 	unsigned long temp, flags;

@@ -30,7 +30,7 @@ unsigned long __xchg64(unsigned long x, unsigned long *ptr)
 }
 #endif

-unsigned long __xchg32(int x, int *ptr)
+unsigned long __xchg32(int x, volatile int *ptr)
 {
 	unsigned long flags;
 	long temp;
@@ -43,7 +43,7 @@ unsigned long __xchg32(int x, int *ptr)
 }


-unsigned long __xchg8(char x, char *ptr)
+unsigned long __xchg8(char x, volatile char *ptr)
 {
 	unsigned long flags;
 	long temp;
diff --git a/include/linux/list.h b/include/linux/list.h
index aff44d34f4e4..0d0d17a10d25 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -282,6 +282,24 @@ static inline int list_empty(const struct list_head *head)
 	return READ_ONCE(head->next) == head;
 }

+/**
+ * list_del_init_careful - deletes entry from list and reinitialize it.
+ * @entry: the element to delete from the list.
+ *
+ * This is the same as list_del_init(), except designed to be used
+ * together with list_empty_careful() in a way to guarantee ordering
+ * of other memory operations.
+ *
+ * Any memory operations done before a list_del_init_careful() are
+ * guaranteed to be visible after a list_empty_careful() test.
+ */
+static inline void list_del_init_careful(struct list_head *entry)
+{
+	__list_del_entry(entry);
+	entry->prev = entry;
+	smp_store_release(&entry->next, entry);
+}
+
 /**
  * list_empty_careful - tests whether a list is empty and not being modified
  * @head: the list to test
@@ -297,7 +315,7 @@ static inline int list_empty(const struct list_head *head)
  */
 static inline int list_empty_careful(const struct list_head *head)
 {
-	struct list_head *next = head->next;
+	struct list_head *next = smp_load_acquire(&head->next);
 	return (next == head) && (next == head->prev);
 }

diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index ba059fbfc53a..01f5d3020589 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -389,7 +389,7 @@ int autoremove_wake_function(struct wait_queue_entry *wq_entry, unsigned mode, i
 	int ret = default_wake_function(wq_entry, mode, sync, key);

 	if (ret)
-		list_del_init(&wq_entry->entry);
+		list_del_init_careful(&wq_entry->entry);

 	return ret;
 }
diff --git a/mm/filemap.c b/mm/filemap.c
index 385759c4ce4b..239d156a38ea 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1002,6 +1002,7 @@ struct wait_page_queue {

 static int wake_page_function(wait_queue_entry_t *wait, unsigned mode, int sync, void *arg)
 {
+	int ret;
 	struct wait_page_key *key = arg;
 	struct wait_page_queue *wait_page
 		= container_of(wait, struct wait_page_queue, wait);
@@ -1013,18 +1014,35 @@ static int wake_page_function(wait_queue_entry_t *wait, unsigned mode, int sync,
 	if (wait_page->bit_nr != key->bit_nr)
 		return 0;

+	/* Stop walking if it's locked */
+	if (wait->flags & WQ_FLAG_EXCLUSIVE) {
+		if (test_and_set_bit(key->bit_nr, &key->page->flags))
+			return -1;
+	} else {
+		if (test_bit(key->bit_nr, &key->page->flags))
+			return -1;
+	}
+
 	/*
-	 * Stop walking if it's locked.
-	 * Is this safe if put_and_wait_on_page_locked() is in use?
-	 * Yes: the waker must hold a reference to this page, and if PG_locked
-	 * has now already been set by another task, that task must also hold
-	 * a reference to the *same usage* of this page; so there is no need
-	 * to walk on to wake even the put_and_wait_on_page_locked() callers.
+	 * Let the waiter know we have done the page flag
+	 * handling for it (and the return value lets the
+	 * wakeup logic count exclusive wakeup events).
 	 */
-	if (test_bit(key->bit_nr, &key->page->flags))
-		return -1;
+	ret = (wait->flags & WQ_FLAG_EXCLUSIVE) != 0;
+	wait->flags |= WQ_FLAG_WOKEN;
+	wake_up_state(wait->private, mode);

-	return autoremove_wake_function(wait, mode, sync, key);
+	/*
+	 * Ok, we have successfully done what we're waiting for,
+	 * and we can unconditionally remove the wait entry.
+	 *
+	 * Note that this has to be the absolute last thing we do,
+	 * since after list_del_init(&wait->entry) the wait entry
+	 * might be de-allocated and the process might even have
+	 * exited.
+	 */
+	list_del_init_careful(&wait->entry);
+	return ret;
 }

 static void wake_up_page_bit(struct page *page, int bit_nr)
@@ -1103,16 +1121,22 @@ enum behavior {
 			 */
 };

+static inline int trylock_page_bit_common(struct page *page, int bit_nr,
+	enum behavior behavior)
+{
+	return behavior == EXCLUSIVE ?
+		!test_and_set_bit(bit_nr, &page->flags) :
+		!test_bit(bit_nr, &page->flags);
+}
+
 static inline int wait_on_page_bit_common(wait_queue_head_t *q,
 	struct page *page, int bit_nr, int state, enum behavior behavior)
 {
 	struct wait_page_queue wait_page;
 	wait_queue_entry_t *wait = &wait_page.wait;
-	bool bit_is_set;
 	bool thrashing = false;
 	bool delayacct = false;
 	unsigned long pflags;
-	int ret = 0;

 	if (bit_nr == PG_locked &&
 	    !PageUptodate(page) && PageWorkingset(page)) {
@@ -1130,48 +1154,44 @@ static inline int wait_on_page_bit_common(wait_queue_head_t *q,
 	wait_page.page = page;
 	wait_page.bit_nr = bit_nr;

-	for (;;) {
-		spin_lock_irq(&q->lock);
+	/*
+	 * Add ourselves to the wait queue.
+	 *
+	 * NOTE! This is where we also check the page
+	 * state synchronously the last time to see that
+	 * somebody didn't just clear the bit. Do the
+	 * SetPageWaiters() before that to let anybody
+	 * we just miss know they need to wake us up.
+	 */
+	spin_lock_irq(&q->lock);
+	SetPageWaiters(page);
+	if (!trylock_page_bit_common(page, bit_nr, behavior))
+		__add_wait_queue_entry_tail(q, wait);
+	else
+		wait->flags |= WQ_FLAG_WOKEN;
+	spin_unlock_irq(&q->lock);

-		if (likely(list_empty(&wait->entry))) {
-			__add_wait_queue_entry_tail(q, wait);
-			SetPageWaiters(page);
-		}
+	/*
+	 * From now on, all the logic will be based on
+	 * whether the wait entry is on the queue or not,
+	 * and the page bit testing (and setting) will be
+	 * done by the wake function, not us.
+	 *
+	 * We can drop our reference to the page.
+	 */
+	if (behavior == DROP)
+		put_page(page);

+	for (;;) {
 		set_current_state(state);

-		spin_unlock_irq(&q->lock);
-
-		bit_is_set = test_bit(bit_nr, &page->flags);
-		if (behavior == DROP)
-			put_page(page);
-
-		if (likely(bit_is_set))
-			io_schedule();
-
-		if (behavior == EXCLUSIVE) {
-			if (!test_and_set_bit_lock(bit_nr, &page->flags))
-				break;
-		} else if (behavior == SHARED) {
-			if (!test_bit(bit_nr, &page->flags))
-				break;
-		}
-
-		if (signal_pending_state(state, current)) {
-			ret = -EINTR;
+		if (signal_pending_state(state, current))
 			break;
-		}

-		if (behavior == DROP) {
-			/*
-			 * We can no longer safely access page->flags:
-			 * even if CONFIG_MEMORY_HOTREMOVE is not enabled,
-			 * there is a risk of waiting forever on a page reused
-			 * for something that keeps it locked indefinitely.
-			 * But best check for -EINTR above before breaking.
-			 */
+		if (wait->flags & WQ_FLAG_WOKEN)
 			break;
-		}
+
+		io_schedule();
 	}

 	finish_wait(q, wait);
@@ -1190,7 +1210,7 @@ static inline int wait_on_page_bit_common(wait_queue_head_t *q,
 	 * bother with signals either.
 	 */

-	return ret;
+	return wait->flags & WQ_FLAG_WOKEN ? 0 : -EINTR;
 }

 void wait_on_page_bit(struct page *page, int bit_nr)
