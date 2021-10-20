Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD4F4352B5
	for <lists+linux-parisc@lfdr.de>; Wed, 20 Oct 2021 20:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhJTSfR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 20 Oct 2021 14:35:17 -0400
Received: from mta-mtl-004.bell.net ([209.71.208.14]:53348 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231183AbhJTSfR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 20 Oct 2021 14:35:17 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C89459093BF300
X-CM-Envelope: MS4xfBEm2ehk3UihAOQCqj264uv4hW071SZp7CVvCRmbDQFSRYHfrDmazh/y2Xngz5jI3ijtCOwG5UILs9nNiq2klUvnf74jpTGnAOuY0K+gq5NZfmsxNlm2
 g3WZcPQJj3NsMH31eREb1n0fXVn5PAJ+z9JS6Xk+dv98UPcap+bd4b4S4RoI2JpX/0a3ri7orbC7HlJebJO0JfxXHSCLzFdVKd9nDTrWUPh0JPMEPxOGE1Lt
 UXVo+dTxkzgYYXYCLA3MkK83B9c9L4SokdDoFrS34h8KfPWOuH9a7wIkNb8Jdhvh28XHcus+Z06VeLj0KWWpCw==
X-CM-Analysis: v=2.4 cv=ENdlb3VC c=1 sm=1 tr=0 ts=617060d7
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=qMZx-IjfqBiTN1jeQT4A:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C89459093BF300; Wed, 20 Oct 2021 14:32:55 -0400
Message-ID: <e8a1f0c9-2af2-baa5-a252-4abbc8d28373@bell.net>
Date:   Wed, 20 Oct 2021 14:32:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: [PATCH] parisc: Don't disable interrupts in cmpxchg and futex
 operations
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
References: <20211015195612.25203-1-svens@stackframe.org>
 <969e8f20-d27c-77cd-62c1-ddb86213ddec@gmx.de>
 <a5030b48-b6bc-639c-5360-0389103c228e@bell.net>
 <ac539330-bdc2-1bba-e2c2-78d29614864f@bell.net>
 <8bef26c2-daee-2a6c-1828-100a5b27e205@gmx.de>
 <28325394-99de-67f4-dcca-b1caf1105df2@bell.net>
 <87o87oxhhf.fsf@x1.stackframe.org>
 <48780780-0f8c-5aa9-d362-a9b9ddeaeedb@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
In-Reply-To: <48780780-0f8c-5aa9-d362-a9b9ddeaeedb@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-10-17 12:30 p.m., Helge Deller wrote:
> It seems the warnings are gone if I remove the irq masking.
> I see the options:
> a) revert the irq masking in syscall.S. Not sure if it really hurts performance.
> b) revert the patch from Sven.
> c) insert code to turn back irq on in the fault handler if we are on the gateway page.
> 
> What is your thought?

After some thought, I believe option a) is the best.  I no longer think interrupts can be
disabled in the futex and cmpxchg operations because of COW breaks.  This not ideal but
I suspect it's the best we can do.

For the cmpxchg operations in syscall.S, we rely on the code to not schedule off the gateway
page.  For the futex, I added code to disable preemption.

So far, I haven't seen the warnings with the attached change but the change is only lightly tested.

Signed-off-by: Dave Anglin <dave.anglin@bell.net>
---
diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index fceb9cf02fb3..c170cbe2c6d6 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -13,35 +13,37 @@
     sixteen four-word locks. */

  static inline void
-_futex_spin_lock_irqsave(u32 __user *uaddr, unsigned long int *flags)
+_futex_spin_lock(u32 __user *uaddr)
  {
  	extern u32 lws_lock_start[];
  	long index = ((long)uaddr & 0x3f8) >> 1;
  	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
-	local_irq_save(*flags);
+	preempt_disable();
  	arch_spin_lock(s);
  }

  static inline void
-_futex_spin_unlock_irqrestore(u32 __user *uaddr, unsigned long int *flags)
+_futex_spin_unlock(u32 __user *uaddr)
  {
  	extern u32 lws_lock_start[];
  	long index = ((long)uaddr & 0x3f8) >> 1;
  	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
  	arch_spin_unlock(s);
-	local_irq_restore(*flags);
+	preempt_enable();
  }

  static inline int
  arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
  {
-	unsigned long int flags;
  	int oldval, ret;
  	u32 tmp;

-	_futex_spin_lock_irqsave(uaddr, &flags);
-
  	ret = -EFAULT;
+	if (unlikely(get_user(oldval, uaddr) != 0))
+		goto out_pagefault_enable;
+
+	_futex_spin_lock(uaddr);
+
  	if (unlikely(get_user(oldval, uaddr) != 0))
  		goto out_pagefault_enable;

@@ -72,7 +74,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
  		ret = -EFAULT;

  out_pagefault_enable:
-	_futex_spin_unlock_irqrestore(uaddr, &flags);
+	_futex_spin_unlock(uaddr);

  	if (!ret)
  		*oval = oldval;
@@ -85,7 +87,6 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
  			      u32 oldval, u32 newval)
  {
  	u32 val;
-	unsigned long flags;

  	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
  	 * our gateway page, and causes no end of trouble...
@@ -102,19 +103,19 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
  	 * address. This should scale to a couple of CPUs.
  	 */

-	_futex_spin_lock_irqsave(uaddr, &flags);
+	_futex_spin_lock(uaddr);
  	if (unlikely(get_user(val, uaddr) != 0)) {
-		_futex_spin_unlock_irqrestore(uaddr, &flags);
+		_futex_spin_unlock(uaddr);
  		return -EFAULT;
  	}

  	if (val == oldval && unlikely(put_user(newval, uaddr) != 0)) {
-		_futex_spin_unlock_irqrestore(uaddr, &flags);
+		_futex_spin_unlock(uaddr);
  		return -EFAULT;
  	}

  	*uval = val;
-	_futex_spin_unlock_irqrestore(uaddr, &flags);
+	_futex_spin_unlock(uaddr);

  	return 0;
  }
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 3f24a0af1e04..5b8feeeedf40 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -603,13 +603,11 @@ cas_nocontend:
  # endif
  /* ENABLE_LWS_DEBUG */

-	rsm	PSW_SM_I, %r0				/* Disable interrupts */
  	/* COW breaks can cause contention on UP systems */
  	LDCW	0(%sr2,%r20), %r28			/* Try to acquire the lock */
  	cmpb,<>,n	%r0, %r28, cas_action		/* Did we get it? */
  cas_wouldblock:
  	ldo	2(%r0), %r28				/* 2nd case */
-	ssm	PSW_SM_I, %r0
  	b	lws_exit				/* Contended... */
  	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */

@@ -645,8 +643,6 @@ cas_action:
  	/* Clear thread register indicator */
  	stw	%r0, 4(%sr2,%r20)
  #endif
-	/* Enable interrupts */
-	ssm	PSW_SM_I, %r0
  	/* Return to userspace, set no error */
  	b	lws_exit
  	copy	%r0, %r21
@@ -658,7 +654,6 @@ cas_action:
  #if ENABLE_LWS_DEBUG
  	stw	%r0, 4(%sr2,%r20)
  #endif
-	ssm	PSW_SM_I, %r0
  	b	lws_exit
  	ldo	-EFAULT(%r0),%r21	/* set errno */
  	nop
@@ -770,13 +765,11 @@ cas2_lock_start:
  	shlw	%r20, 4, %r20
  	add	%r20, %r28, %r20

-	rsm	PSW_SM_I, %r0			/* Disable interrupts */
  	/* COW breaks can cause contention on UP systems */
  	LDCW	0(%sr2,%r20), %r28		/* Try to acquire the lock */
  	cmpb,<>,n	%r0, %r28, cas2_action	/* Did we get it? */
  cas2_wouldblock:
  	ldo	2(%r0), %r28			/* 2nd case */
-	ssm	PSW_SM_I, %r0
  	b	lws_exit			/* Contended... */
  	ldo	-EAGAIN(%r0), %r21		/* Spin in userspace */

@@ -856,8 +849,6 @@ cas2_action:
  cas2_end:
  	/* Free lock */
  	stw,ma	%r20, 0(%sr2,%r20)
-	/* Enable interrupts */
-	ssm	PSW_SM_I, %r0
  	/* Return to userspace, set no error */
  	b	lws_exit
  	copy	%r0, %r21
@@ -866,7 +857,6 @@ cas2_end:
  	/* Error occurred on load or store */
  	/* Free lock */
  	stw,ma	%r20, 0(%sr2,%r20)
-	ssm	PSW_SM_I, %r0
  	ldo	1(%r0),%r28
  	b	lws_exit
  	ldo	-EFAULT(%r0),%r21	/* set errno */
