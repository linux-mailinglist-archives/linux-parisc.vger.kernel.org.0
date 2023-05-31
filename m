Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D53AB7181C8
	for <lists+linux-parisc@lfdr.de>; Wed, 31 May 2023 15:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236493AbjEaN2g (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 May 2023 09:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236359AbjEaN2W (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 May 2023 09:28:22 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5878B129;
        Wed, 31 May 2023 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
        Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:In-Reply-To;
        bh=yL1qo/vb48QdPJDHPVkvS1Zq4+B/eXJGNt78k1EwTE8=; b=DW3puokgt2Sigksg/ERQDTbI5F
        X9p3E/IslASCuC3vUaf+7HAUpBufw+aylakDJDZNkblCqjUoUSTZWxlRcwf5yMkWCMD8tlgdafG0L
        47hUgse3tDg8ztseLhxGtEY8y1bECyX246uQf/3WZj3YyP2oEpMKWBM1NEOVA8CFpM3l5FCrI6Cdz
        n9cfpBSSywRhj6cZ5sUK91yTNWQAOutrtz0Ob/tcDLU+XF2taTda7oKkgDE7N4oNlrp15ideTU32m
        zvLMvVJj1WXNQETpMpEIgBOCL8rD8p7/DMDwGYk2HLj02RY5wKHKFAWoMr7L1y3DrSkoE/x7f5cqR
        2rDatRCA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1q4LrH-007IJX-4Q; Wed, 31 May 2023 13:27:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5DBE1300DDC;
        Wed, 31 May 2023 15:27:21 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
        id A1643243B8571; Wed, 31 May 2023 15:27:16 +0200 (CEST)
Message-ID: <20230531132323.924677086@infradead.org>
User-Agent: quilt/0.66
Date:   Wed, 31 May 2023 15:08:43 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     torvalds@linux-foundation.org
Cc:     corbet@lwn.net, will@kernel.org, peterz@infradead.org,
        boqun.feng@gmail.com, mark.rutland@arm.com,
        catalin.marinas@arm.com, dennis@kernel.org, tj@kernel.org,
        cl@linux.com, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, joro@8bytes.org, suravee.suthikulpanit@amd.com,
        robin.murphy@arm.com, dwmw2@infradead.org,
        baolu.lu@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
        Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org,
        iommu@lists.linux.dev, linux-arch@vger.kernel.org,
        linux-crypto@vger.kernel.org, sfr@canb.auug.org.au,
        mpe@ellerman.id.au, James.Bottomley@hansenpartnership.com,
        deller@gmx.de, linux-parisc@vger.kernel.org
Subject: [PATCH 10/12] slub: Replace cmpxchg_double()
References: <20230531130833.635651916@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
---
 include/linux/slub_def.h |   12 +++-
 mm/slab.h                |   53 +++++++++++++++--
 mm/slub.c                |  139 +++++++++++++++++++++++++++--------------------
 3 files changed, 137 insertions(+), 67 deletions(-)

--- a/include/linux/slub_def.h
+++ b/include/linux/slub_def.h
@@ -39,7 +39,8 @@ enum stat_item {
 	CPU_PARTIAL_FREE,	/* Refill cpu partial on free */
 	CPU_PARTIAL_NODE,	/* Refill cpu partial from node partial */
 	CPU_PARTIAL_DRAIN,	/* Drain cpu partial to node partial */
-	NR_SLUB_STAT_ITEMS };
+	NR_SLUB_STAT_ITEMS
+};
 
 #ifndef CONFIG_SLUB_TINY
 /*
@@ -47,8 +48,13 @@ enum stat_item {
  * with this_cpu_cmpxchg_double() alignment requirements.
  */
 struct kmem_cache_cpu {
-	void **freelist;	/* Pointer to next available object */
-	unsigned long tid;	/* Globally unique transaction id */
+	union {
+		struct {
+			void **freelist;	/* Pointer to next available object */
+			unsigned long tid;	/* Globally unique transaction id */
+		};
+		freelist_aba_t freelist_tid;
+	};
 	struct slab *slab;	/* The slab from which we are allocating */
 #ifdef CONFIG_SLUB_CPU_PARTIAL
 	struct slab *partial;	/* Partially allocated frozen slabs */
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -6,6 +6,38 @@
  */
 void __init kmem_cache_init(void);
 
+#ifdef CONFIG_64BIT
+# ifdef system_has_cmpxchg128
+# define system_has_freelist_aba()	system_has_cmpxchg128()
+# define try_cmpxchg_freelist		try_cmpxchg128
+# endif
+#define this_cpu_try_cmpxchg_freelist	this_cpu_try_cmpxchg128
+typedef u128 freelist_full_t;
+#else /* CONFIG_64BIT */
+# ifdef system_has_cmpxchg64
+# define system_has_freelist_aba()	system_has_cmpxchg64()
+# define try_cmpxchg_freelist		try_cmpxchg64
+# endif
+#define this_cpu_try_cmpxchg_freelist	this_cpu_try_cmpxchg64
+typedef u64 freelist_full_t;
+#endif /* CONFIG_64BIT */
+
+#if defined(system_has_freelist_aba) && !defined(CONFIG_HAVE_ALIGNED_STRUCT_PAGE)
+#undef system_has_freelist_aba
+#endif
+
+/*
+ * Freelist pointer and counter to cmpxchg together, avoids the typical ABA
+ * problems with cmpxchg of just a pointer.
+ */
+typedef union {
+	struct {
+		void *freelist;
+		unsigned long counter;
+	};
+	freelist_full_t full;
+} freelist_aba_t;
+
 /* Reuses the bits in struct page */
 struct slab {
 	unsigned long __page_flags;
@@ -38,14 +70,21 @@ struct slab {
 #endif
 			};
 			/* Double-word boundary */
-			void *freelist;		/* first free object */
 			union {
-				unsigned long counters;
 				struct {
-					unsigned inuse:16;
-					unsigned objects:15;
-					unsigned frozen:1;
+					void *freelist;		/* first free object */
+					union {
+						unsigned long counters;
+						struct {
+							unsigned inuse:16;
+							unsigned objects:15;
+							unsigned frozen:1;
+						};
+					};
 				};
+#ifdef system_has_freelist_aba
+				freelist_aba_t freelist_counter;
+#endif
 			};
 		};
 		struct rcu_head rcu_head;
@@ -72,8 +111,8 @@ SLAB_MATCH(memcg_data, memcg_data);
 #endif
 #undef SLAB_MATCH
 static_assert(sizeof(struct slab) <= sizeof(struct page));
-#if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && defined(CONFIG_SLUB)
-static_assert(IS_ALIGNED(offsetof(struct slab, freelist), 2*sizeof(void *)));
+#if defined(system_has_freelist_aba) && defined(CONFIG_SLUB)
+static_assert(IS_ALIGNED(offsetof(struct slab, freelist), sizeof(freelist_aba_t)));
 #endif
 
 /**
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -292,7 +292,12 @@ static inline bool kmem_cache_has_cpu_pa
 /* Poison object */
 #define __OBJECT_POISON		((slab_flags_t __force)0x80000000U)
 /* Use cmpxchg_double */
+
+#ifdef system_has_freelist_aba
 #define __CMPXCHG_DOUBLE	((slab_flags_t __force)0x40000000U)
+#else
+#define __CMPXCHG_DOUBLE	((slab_flags_t __force)0U)
+#endif
 
 /*
  * Tracking user of a slab.
@@ -512,6 +517,40 @@ static __always_inline void slab_unlock(
 	__bit_spin_unlock(PG_locked, &page->flags);
 }
 
+static inline bool
+__update_freelist_fast(struct slab *slab,
+		      void *freelist_old, unsigned long counters_old,
+		      void *freelist_new, unsigned long counters_new)
+{
+#ifdef system_has_freelist_aba
+	freelist_aba_t old = { .freelist = freelist_old, .counter = counters_old };
+	freelist_aba_t new = { .freelist = freelist_new, .counter = counters_new };
+
+	return try_cmpxchg_freelist(&slab->freelist_counter.full, &old.full, new.full);
+#else
+	return false;
+#endif
+}
+
+static inline bool
+__update_freelist_slow(struct slab *slab,
+		      void *freelist_old, unsigned long counters_old,
+		      void *freelist_new, unsigned long counters_new)
+{
+	bool ret = false;
+
+	slab_lock(slab);
+	if (slab->freelist == freelist_old &&
+	    slab->counters == counters_old) {
+		slab->freelist = freelist_new;
+		slab->counters = counters_new;
+		ret = true;
+	}
+	slab_unlock(slab);
+
+	return ret;
+}
+
 /*
  * Interrupts must be disabled (for the fallback code to work right), typically
  * by an _irqsave() lock variant. On PREEMPT_RT the preempt_disable(), which is
@@ -519,33 +558,25 @@ static __always_inline void slab_unlock(
  * allocation/ free operation in hardirq context. Therefore nothing can
  * interrupt the operation.
  */
-static inline bool __cmpxchg_double_slab(struct kmem_cache *s, struct slab *slab,
+static inline bool __slab_update_freelist(struct kmem_cache *s, struct slab *slab,
 		void *freelist_old, unsigned long counters_old,
 		void *freelist_new, unsigned long counters_new,
 		const char *n)
 {
+	bool ret;
+
 	if (USE_LOCKLESS_FAST_PATH())
 		lockdep_assert_irqs_disabled();
-#if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && \
-    defined(CONFIG_HAVE_ALIGNED_STRUCT_PAGE)
+
 	if (s->flags & __CMPXCHG_DOUBLE) {
-		if (cmpxchg_double(&slab->freelist, &slab->counters,
-				   freelist_old, counters_old,
-				   freelist_new, counters_new))
-			return true;
-	} else
-#endif
-	{
-		slab_lock(slab);
-		if (slab->freelist == freelist_old &&
-					slab->counters == counters_old) {
-			slab->freelist = freelist_new;
-			slab->counters = counters_new;
-			slab_unlock(slab);
-			return true;
-		}
-		slab_unlock(slab);
+		ret = __update_freelist_fast(slab, freelist_old, counters_old,
+				            freelist_new, counters_new);
+	} else {
+		ret = __update_freelist_slow(slab, freelist_old, counters_old,
+				            freelist_new, counters_new);
 	}
+	if (likely(ret))
+		return true;
 
 	cpu_relax();
 	stat(s, CMPXCHG_DOUBLE_FAIL);
@@ -557,36 +588,26 @@ static inline bool __cmpxchg_double_slab
 	return false;
 }
 
-static inline bool cmpxchg_double_slab(struct kmem_cache *s, struct slab *slab,
+static inline bool slab_update_freelist(struct kmem_cache *s, struct slab *slab,
 		void *freelist_old, unsigned long counters_old,
 		void *freelist_new, unsigned long counters_new,
 		const char *n)
 {
-#if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && \
-    defined(CONFIG_HAVE_ALIGNED_STRUCT_PAGE)
+	bool ret;
+
 	if (s->flags & __CMPXCHG_DOUBLE) {
-		if (cmpxchg_double(&slab->freelist, &slab->counters,
-				   freelist_old, counters_old,
-				   freelist_new, counters_new))
-			return true;
-	} else
-#endif
-	{
+		ret = __update_freelist_fast(slab, freelist_old, counters_old,
+				            freelist_new, counters_new);
+	} else {
 		unsigned long flags;
 
 		local_irq_save(flags);
-		slab_lock(slab);
-		if (slab->freelist == freelist_old &&
-					slab->counters == counters_old) {
-			slab->freelist = freelist_new;
-			slab->counters = counters_new;
-			slab_unlock(slab);
-			local_irq_restore(flags);
-			return true;
-		}
-		slab_unlock(slab);
+		ret = __update_freelist_slow(slab, freelist_old, counters_old,
+				            freelist_new, counters_new);
 		local_irq_restore(flags);
 	}
+	if (likely(ret))
+		return true;
 
 	cpu_relax();
 	stat(s, CMPXCHG_DOUBLE_FAIL);
@@ -2228,7 +2249,7 @@ static inline void *acquire_slab(struct
 	VM_BUG_ON(new.frozen);
 	new.frozen = 1;
 
-	if (!__cmpxchg_double_slab(s, slab,
+	if (!__slab_update_freelist(s, slab,
 			freelist, counters,
 			new.freelist, new.counters,
 			"acquire_slab"))
@@ -2554,7 +2575,7 @@ static void deactivate_slab(struct kmem_
 	}
 
 
-	if (!cmpxchg_double_slab(s, slab,
+	if (!slab_update_freelist(s, slab,
 				old.freelist, old.counters,
 				new.freelist, new.counters,
 				"unfreezing slab")) {
@@ -2611,7 +2632,7 @@ static void __unfreeze_partials(struct k
 
 			new.frozen = 0;
 
-		} while (!__cmpxchg_double_slab(s, slab,
+		} while (!__slab_update_freelist(s, slab,
 				old.freelist, old.counters,
 				new.freelist, new.counters,
 				"unfreezing slab"));
@@ -3008,6 +3029,18 @@ static inline bool pfmemalloc_match(stru
 }
 
 #ifndef CONFIG_SLUB_TINY
+static inline bool
+__update_cpu_freelist_fast(struct kmem_cache *s,
+			   void *freelist_old, void *freelist_new,
+			   unsigned long tid)
+{
+	freelist_aba_t old = { .freelist = freelist_old, .counter = tid };
+	freelist_aba_t new = { .freelist = freelist_new, .counter = next_tid(tid) };
+
+	return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid.full,
+					     &old.full, new.full);
+}
+
 /*
  * Check the slab->freelist and either transfer the freelist to the
  * per cpu freelist or deactivate the slab.
@@ -3034,7 +3067,7 @@ static inline void *get_freelist(struct
 		new.inuse = slab->objects;
 		new.frozen = freelist != NULL;
 
-	} while (!__cmpxchg_double_slab(s, slab,
+	} while (!__slab_update_freelist(s, slab,
 		freelist, counters,
 		NULL, new.counters,
 		"get_freelist"));
@@ -3359,11 +3392,7 @@ static __always_inline void *__slab_allo
 		 * against code executing on this cpu *not* from access by
 		 * other cpus.
 		 */
-		if (unlikely(!this_cpu_cmpxchg_double(
-				s->cpu_slab->freelist, s->cpu_slab->tid,
-				object, tid,
-				next_object, next_tid(tid)))) {
-
+		if (unlikely(!__update_cpu_freelist_fast(s, object, next_object, tid))) {
 			note_cmpxchg_failure("slab_alloc", s, tid);
 			goto redo;
 		}
@@ -3631,7 +3660,7 @@ static void __slab_free(struct kmem_cach
 			}
 		}
 
-	} while (!cmpxchg_double_slab(s, slab,
+	} while (!slab_update_freelist(s, slab,
 		prior, counters,
 		head, new.counters,
 		"__slab_free"));
@@ -3736,11 +3765,7 @@ static __always_inline void do_slab_free
 
 		set_freepointer(s, tail_obj, freelist);
 
-		if (unlikely(!this_cpu_cmpxchg_double(
-				s->cpu_slab->freelist, s->cpu_slab->tid,
-				freelist, tid,
-				head, next_tid(tid)))) {
-
+		if (unlikely(!__update_cpu_freelist_fast(s, freelist, head, tid))) {
 			note_cmpxchg_failure("slab_free", s, tid);
 			goto redo;
 		}
@@ -4505,11 +4530,11 @@ static int kmem_cache_open(struct kmem_c
 		}
 	}
 
-#if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && \
-    defined(CONFIG_HAVE_ALIGNED_STRUCT_PAGE)
-	if (system_has_cmpxchg_double() && (s->flags & SLAB_NO_CMPXCHG) == 0)
+#ifdef system_has_freelist_aba
+	if (system_has_freelist_aba() && !(s->flags & SLAB_NO_CMPXCHG)) {
 		/* Enable fast mode */
 		s->flags |= __CMPXCHG_DOUBLE;
+	}
 #endif
 
 	/*


