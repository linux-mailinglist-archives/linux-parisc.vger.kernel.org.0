Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC2C19EDF5
	for <lists+linux-parisc@lfdr.de>; Sun,  5 Apr 2020 22:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgDEUii (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Apr 2020 16:38:38 -0400
Received: from mout.gmx.net ([212.227.17.20]:56405 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726772AbgDEUii (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Apr 2020 16:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1586119111;
        bh=PnwAz/YhTYc/nLFgkG2da06V+HfFY+O2MGZeky2IlNU=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Q2F9xM803sRZW25v5QGNLhjs33hmPTO0tukcrTVdJPhCNmVSVh5AKpln0eUU13h1w
         oUEqWNFvRUyj/TuyMc71krIRolLkAiEuLBP6Kj/e5dhawcg9gRSmfv/3JlSv/2NZ8X
         FSawrHC1NeHzG3nKNM4xf5c+ZWFzoxSE7UhF1e8U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.149.228]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMuX-1jhPip3RKb-00MITw; Sun, 05
 Apr 2020 22:38:30 +0200
Date:   Sun, 5 Apr 2020 22:38:27 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Rework arch_rw locking functions
Message-ID: <20200405203827.GA24568@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:UO9wApVFYnt11KTeU47UObRl+nrsu7E5ZxUrEHdTnLbtOnS6eAh
 A/HtjT7VA20n2EBuWX4YLNUJ4j0x3me23mtQlhJjBWcz6kFGhC3Oaud695Bqp+tV0HJlze9
 eWM533Ris8FuoUMT/C4+hCBYH4plxFALKklr1dRLXKybalEq2/ZE2m12+xFUD293+/OLa/K
 G0lxh8LmrCusPxw8rmRmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WG/mKSSN104=:L3mYwuCRFfhpqdrnRuL9gi
 BfAhToIsKIw+q0AZY7kE+JI0Yn1NZJS4kF/O7dRiBoK0rSWUOMY4DvEr88zNqy0opGIfUbUSP
 XO1LnodVBkR63tIbri9ILM/+xOBIQ1Bg9FcFkM+JWqi3JzVG5+n+Hcu2ImEv+j05ctK/l6GmR
 dkfwoDiotGC46kd2R+OSXp56AsBnxoT0sv2ByhrizjBbyFNRdCiS7z64WM1lEU8l0zsXdesJw
 6XGZGe/IsciQEnGGJ/t9gbwQgkXwivbXvD55wX9/qS7os1TGTBf/tv1h1/aNpY7t/5xX7g9Z9
 qRPBK1pkgTiR4uEtOpApbH8sy6jKocvDAr4Mv4VIINR27YMAwmBczpPDhRZykIgz9Ubb9z/5V
 bM4MPv1D63QG/3ee2+UAG27AU0QerMsgMS/zH+GiTQ02bmmsAetxBjnktqJg8kbYNeWFjwTFZ
 5v4E3ndi+toI8r4Er3fZUD0Q4/1DaXbixVImvHiAkvSxJ8VpTn+02ZDX65K+G8aM10YxfPPFy
 8bqM8DAgtvtv9fW6gVedHJmd02TT3dunyk8Fye7jqBlw5egDA7S2lBIC3YqTk42zkq4tMEXOj
 p1R3F8XQHQ5WgB5IfMsGOkKQhlHNbrQfy/z0CxXmhfTttnliDULzDnVYwwYWwR+rDV01H/JG/
 2JLe8pBHfsve1Zs/Hp+lENbC/XRnFJNWYeKZmTAnhHNMUWVUGhji8F4KFRrlUDMeCjyToz4Ot
 mxDHy/4Kay010S1GqlYL7RvN9ejYDLlTlTysPWFjLuhzwLNvIL9sxpIV0F6sci6yPccxGW02a
 6mXt2+4fd106f35df1318mGBRzlWDNgfQnuGBpZb0xuZwcQxi1wCqOrhvLywUMabesxTLqMcT
 F68bHwrD+CCKCD/DQ3nlZh2G+GwobV+cpzKlWUj82dehRS8dYOIDQXwajt3R70mQN2lFP6CrW
 6sRhGVFWyIuAT5U//XyESPkqQ0Syv0B7E0xMcpCoBnj8+6k4ut9Ld9e1n7tVkSA0OAty1Xwqf
 wLJmCDOUcAQhv9UxuSnFFv9UZRdh4Vm/q2kb5uZIYjIVsILz+H3Vqwat7uPoZOMsQ5tL6JZnI
 3z5UXhxjtZJkYQ3Oqtux9tu+ZjLutEDE/KJQAPJEnK8SSOoOiHgG9AywsAqvxzqSpYvRdTD3n
 eP2zBRxSNsZzALc1fqOvOmW1YbMgWhP754Gxuwb3I/xHmfxA4hHDZz0NmwiPd6KrN1N2GGSEl
 36CQGYi38AycBl5dy
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Clean up the arch read/write locking functions based on the arc
implemenation. This improves readability of those functions.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/=
spinlock.h
index 51582eacb7ec..70fecb8dc4e2 100644
=2D-- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -67,116 +67,93 @@ static inline int arch_spin_trylock(arch_spinlock_t *=
x)

 /*
  * Read-write spinlocks, allowing multiple readers but only one writer.
- * Linux rwlocks are unfair to writers; they can be starved for an indefi=
nite
- * time by readers.  With care, they can also be taken in interrupt conte=
xt.
+ * Unfair locking as Writers could be starved indefinitely by Reader(s)
  *
- * In the PA-RISC implementation, we have a spinlock and a counter.
- * Readers use the lock to serialise their access to the counter (which
- * records how many readers currently hold the lock).
- * Writers hold the spinlock, preventing any readers or other writers fro=
m
- * grabbing the rwlock.
+ * The spinlock itself is contained in @counter and access to it is
+ * serialized with @lock_mutex.
  */

-/* Note that we have to ensure interrupts are disabled in case we're
- * interrupted by some other code that wants to grab the same read lock *=
/
-static  __inline__ void arch_read_lock(arch_rwlock_t *rw)
+/* 1 - lock taken successfully */
+static inline int arch_read_trylock(arch_rwlock_t *rw)
 {
+	int ret =3D 0;
 	unsigned long flags;
-	local_irq_save(flags);
-	arch_spin_lock_flags(&rw->lock, flags);
-	rw->counter++;
-	arch_spin_unlock(&rw->lock);
-	local_irq_restore(flags);
-}

-/* Note that we have to ensure interrupts are disabled in case we're
- * interrupted by some other code that wants to grab the same read lock *=
/
-static  __inline__ void arch_read_unlock(arch_rwlock_t *rw)
-{
-	unsigned long flags;
 	local_irq_save(flags);
-	arch_spin_lock_flags(&rw->lock, flags);
-	rw->counter--;
-	arch_spin_unlock(&rw->lock);
+	arch_spin_lock(&(rw->lock_mutex));
+
+	/*
+	 * zero means writer holds the lock exclusively, deny Reader.
+	 * Otherwise grant lock to first/subseq reader
+	 */
+	if (rw->counter > 0) {
+		rw->counter--;
+		ret =3D 1;
+	}
+
+	arch_spin_unlock(&(rw->lock_mutex));
 	local_irq_restore(flags);
+
+	return ret;
 }

-/* Note that we have to ensure interrupts are disabled in case we're
- * interrupted by some other code that wants to grab the same read lock *=
/
-static __inline__ int arch_read_trylock(arch_rwlock_t *rw)
+/* 1 - lock taken successfully */
+static inline int arch_write_trylock(arch_rwlock_t *rw)
 {
+	int ret =3D 0;
 	unsigned long flags;
- retry:
+
 	local_irq_save(flags);
-	if (arch_spin_trylock(&rw->lock)) {
-		rw->counter++;
-		arch_spin_unlock(&rw->lock);
-		local_irq_restore(flags);
-		return 1;
+	arch_spin_lock(&(rw->lock_mutex));
+
+	/*
+	 * If reader(s) hold lock (lock < __ARCH_RW_LOCK_UNLOCKED__),
+	 * deny writer. Otherwise if unlocked grant to writer
+	 * Hence the claim that Linux rwlocks are unfair to writers.
+	 * (can be starved for an indefinite time by readers).
+	 */
+	if (rw->counter =3D=3D __ARCH_RW_LOCK_UNLOCKED__) {
+		rw->counter =3D 0;
+		ret =3D 1;
 	}
-
+	arch_spin_unlock(&(rw->lock_mutex));
 	local_irq_restore(flags);
-	/* If write-locked, we fail to acquire the lock */
-	if (rw->counter < 0)
-		return 0;

-	/* Wait until we have a realistic chance at the lock */
-	while (arch_spin_is_locked(&rw->lock) && rw->counter >=3D 0)
+	return ret;
+}
+
+static inline void arch_read_lock(arch_rwlock_t *rw)
+{
+	while (!arch_read_trylock(rw))
 		cpu_relax();
+}

-	goto retry;
+static inline void arch_write_lock(arch_rwlock_t *rw)
+{
+	while (!arch_write_trylock(rw))
+		cpu_relax();
 }

-/* Note that we have to ensure interrupts are disabled in case we're
- * interrupted by some other code that wants to read_trylock() this lock =
*/
-static __inline__ void arch_write_lock(arch_rwlock_t *rw)
+static inline void arch_read_unlock(arch_rwlock_t *rw)
 {
 	unsigned long flags;
-retry:
-	local_irq_save(flags);
-	arch_spin_lock_flags(&rw->lock, flags);
-
-	if (rw->counter !=3D 0) {
-		arch_spin_unlock(&rw->lock);
-		local_irq_restore(flags);
-
-		while (rw->counter !=3D 0)
-			cpu_relax();
-
-		goto retry;
-	}

-	rw->counter =3D -1; /* mark as write-locked */
-	mb();
+	local_irq_save(flags);
+	arch_spin_lock(&(rw->lock_mutex));
+	rw->counter++;
+	arch_spin_unlock(&(rw->lock_mutex));
 	local_irq_restore(flags);
 }

-static __inline__ void arch_write_unlock(arch_rwlock_t *rw)
-{
-	rw->counter =3D 0;
-	arch_spin_unlock(&rw->lock);
-}
-
-/* Note that we have to ensure interrupts are disabled in case we're
- * interrupted by some other code that wants to read_trylock() this lock =
*/
-static __inline__ int arch_write_trylock(arch_rwlock_t *rw)
+static inline void arch_write_unlock(arch_rwlock_t *rw)
 {
 	unsigned long flags;
-	int result =3D 0;

 	local_irq_save(flags);
-	if (arch_spin_trylock(&rw->lock)) {
-		if (rw->counter =3D=3D 0) {
-			rw->counter =3D -1;
-			result =3D 1;
-		} else {
-			/* Read-locked.  Oh well. */
-			arch_spin_unlock(&rw->lock);
-		}
-	}
+	arch_spin_lock(&(rw->lock_mutex));
+	rw->counter =3D __ARCH_RW_LOCK_UNLOCKED__;
+	arch_spin_unlock(&(rw->lock_mutex));
 	local_irq_restore(flags);
-
-	return result;
 }

 #endif /* __ASM_SPINLOCK_H */
diff --git a/arch/parisc/include/asm/spinlock_types.h b/arch/parisc/includ=
e/asm/spinlock_types.h
index 42979c5704dc..ca39ee350c3f 100644
=2D-- a/arch/parisc/include/asm/spinlock_types.h
+++ b/arch/parisc/include/asm/spinlock_types.h
@@ -12,11 +12,19 @@ typedef struct {
 #endif
 } arch_spinlock_t;

+
+/* counter:
+ * Unlocked     : 0x0100_0000
+ * Read lock(s) : 0x00FF_FFFF to 0x01  (Multiple Readers decrement it)
+ * Write lock   : 0x0, but only if prior value is "unlocked" 0x0100_0000
+ */
 typedef struct {
-	arch_spinlock_t lock;
-	volatile int counter;
+	arch_spinlock_t		lock_mutex;
+	volatile unsigned int	counter;
 } arch_rwlock_t;

-#define __ARCH_RW_LOCK_UNLOCKED		{ __ARCH_SPIN_LOCK_UNLOCKED, 0 }
+#define __ARCH_RW_LOCK_UNLOCKED__       0x01000000
+#define __ARCH_RW_LOCK_UNLOCKED         { .lock_mutex =3D __ARCH_SPIN_LOC=
K_UNLOCKED, \
+					.counter =3D __ARCH_RW_LOCK_UNLOCKED__ }

 #endif
