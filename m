Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3B74443C7
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Nov 2021 15:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhKCOpv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Nov 2021 10:45:51 -0400
Received: from mout.gmx.net ([212.227.15.15]:56181 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230252AbhKCOpv (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Nov 2021 10:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1635950591;
        bh=HkNPPyEflSbITSFCcuducoAesfq8SR6ndHPBSla13Sg=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=C8OnQ2Um2tOwU7DIFPJRyayv0NpbbYyaTCfP0+RXjlo9hgrlAfwrLUT5124i1WciE
         mJ7KgWOVXGsWac9caRCEmDBbHOdvC5HwG1a1LsEBrjEYaN+o/eR8zmzMcFCvm+nvSd
         w7nqRJpqf38XezjAGGZoOBmSXi/+qzVxhnU70ClI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.181.103]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJqD-1mLsoX4AqJ-00nQkj; Wed, 03
 Nov 2021 15:43:11 +0100
Date:   Wed, 3 Nov 2021 15:42:45 +0100
From:   Helge Deller <deller@gmx.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: [PATCH v2] parisc: Don't disable interrupts in cmpxchg and futex
 operations
Message-ID: <YYKf5XA4fVeo/02l@ls3530>
References: <20211015195612.25203-1-svens@stackframe.org>
 <969e8f20-d27c-77cd-62c1-ddb86213ddec@gmx.de>
 <a5030b48-b6bc-639c-5360-0389103c228e@bell.net>
 <ac539330-bdc2-1bba-e2c2-78d29614864f@bell.net>
 <8bef26c2-daee-2a6c-1828-100a5b27e205@gmx.de>
 <28325394-99de-67f4-dcca-b1caf1105df2@bell.net>
 <87o87oxhhf.fsf@x1.stackframe.org>
 <48780780-0f8c-5aa9-d362-a9b9ddeaeedb@gmx.de>
 <e8a1f0c9-2af2-baa5-a252-4abbc8d28373@bell.net>
 <877de734aj.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877de734aj.fsf@x1.stackframe.org>
X-Provags-ID: V03:K1:QuEebL1hzG1fVHcPT7ChYrdOANaFp7DNkkFlfVhaLClE5VoqMmV
 eGK0c5onBS0OiOyiy7dp2RtmWoPorV8z4iGxJc2UGxBj357rqAXZfcCfOueuVpasA6cVWUi
 Y+ffOookMtm8scVIZp7DzrFXZUsO1UgT8mAAp12qcWkW4IKh7AoQbBkUbOzFUfQZ/ePLwUt
 BpQMAawYW6MwcrRai6gAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2Vcth6TQihY=:5hH7xFqA7Alz1TMPEC87Hy
 aA7XSe43ryS0cu3ApCkVvrACG1F78sNp+rCbZXNjUx0QExKYUEe4XVP7lsX9PRJsnfW4O5EoQ
 2A6NlDDe7jrlu0fUbrbC7MHj6KRWiWGTKh8GxDy/oNdKfDXxUzH5plgLakeVlnimOo7SrznQY
 fNzOPXhin50PrLkamkXzX6NUVD+2LhrSj3S6D48rgz5tRM12G8diyyPpt1jcKTERdbulDCssP
 gsyYHbH3XpfBMn9c7pH7Lpbm2NLcoJ//18k8RBNcEZkOyq8r/Bm/msx07vdA1wEPeIHY1J34f
 XWB1cLINiRsnqkJRv+xNC+txO5Lf6FSWtMxF40EWFbMyuA8gZaTp4nEc1XliYjIW2lKhemfoh
 lM0IKFkkl1vZvIlgI9o6ZWKZpv+iyPSbM9ciPJ1PfEDICMmZ6s8OBY4o7s/9qTGGTIIr5WFF5
 zZbnf8+z7rVeoJapnazXWd9ByijaFBl/9okIeox8fO/7PlisAAagzdxFFp6yNK0kc9joXjXao
 72oCsi4qPjmSwBAFlJg4J9a6m8ZHZehgKlXn6DT/uB0CY78lMy7C8l3CCwThmfa5isUIzXbwt
 qpzT3r7e9/p00Tt7quln8hKBY7tT8p30X0mKzQD/Oe0eTNHawgLOeDjmxRGY8v7XfwJJZAa8O
 8DpdwJNeYtiRBax6BDQIjN3fMfN5YCltQc+QJet+IV/BGbNVhoviVADKmZg1YWBTJ+h/UZYv8
 Xcu9W2j3syDXxaG2GHiyE9kAgCn7+dKzCEQRoYgD2VYc9FuqIL43bxh6ts0xHyCzuuz+ThQhZ
 frZfC637NdulejZVCoGcr2dVhqKsgiWuyTi4NuK6T2B16xtr04vrPbZuAXKf/D+LJEKAr07WH
 YUGtRGAOQceeLp4dq75x8aiVyfX4LeGfDreDH0EWdKHFoYjAX7NCOeuaUEPtIWjR4JgJIXv4Y
 XT9/bSZbM9wwayZFNb4eYkA9/H4CMHb0b3I2tC3Lzxr9L1jqJ5d2NrsyTaBOa/KZStqpNuGo6
 jSo9+BNrvZilFFMRf0MuC8n79bRkzIweRNiwkuHJpy41NJZwZDAEXil2oEkYwsGFT+dqZyayP
 qXdLfRvgA0gDOY=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Sven Schnelle <svens@stackframe.org>:
> John David Anglin <dave.anglin@bell.net> writes:
>
> > On 2021-10-17 12:30 p.m., Helge Deller wrote:
> >> It seems the warnings are gone if I remove the irq masking.
> >> I see the options:
> >> a) revert the irq masking in syscall.S. Not sure if it really hurts p=
erformance.
> >> b) revert the patch from Sven.
> >> c) insert code to turn back irq on in the fault handler if we are on =
the gateway page.
> >> What is your thought?
> >
> > After some thought, I believe option a) is the best.  I no longer thin=
k interrupts can be
> > disabled in the futex and cmpxchg operations because of COW breaks.  T=
his not ideal but
> > I suspect it's the best we can do.
> >
> > For the cmpxchg operations in syscall.S, we rely on the code to not sc=
hedule off the gateway
> > page.  For the futex, I added code to disable preemption.
> >
> > So far, I haven't seen the warnings with the attached change but the c=
hange is only lightly tested.
>
> Thanks Dave. I just applied it to my tree and will give it a spin.

Sven, did you had some outcome?

I've cleaned up Daves patch and applied it to my for-next tree:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dfor-next&id=3Db7cd8a368c986abf184e609772b083f43e5d522d
together with this patch from Sven ("parisc: don't enable irqs
unconditionally in handle_interruption()"):
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dfor-next&id=3D493f84fcb3a791350ffaa2fa2984a0815a924e39

When not applying to master branch from Linus, this patch is needed as wel=
l:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D1030d681319b43869e0d5b568b9d0226652d1a6f

All is in my for-next tree.
Testing seems that those are OK and I don't see any
"BUG: using __this_cpu_add() in preemptible [00000000] code" warnings
any more.

Any objections if I push those patches to Linus soon?

Helge


=46rom 381599d3eb726623948c6b4adb2ea49a7359232b Mon Sep 17 00:00:00 2001
From: Dave Anglin <dave.anglin@bell.net>
Date: Wed, 3 Nov 2021 12:49:32 +0100
Subject: [PATCH] parisc: Don't disable interrupts in cmpxchg and futex
 operations

I no longer think interrupts can be disabled in the futex and cmpxchg
operations because of COW breaks.  This not ideal but I suspect it's the
best we can do.

For the cmpxchg operations in syscall.S, we rely on the code to not
schedule off the gateway page.  For the futex, I added code to disable
preemption.

So far, I haven't seen the warnings with the attached change but the
change is only lightly tested.

Signed-off-by: Dave Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/fut=
ex.h
index fceb9cf02fb3..05fe92453b29 100644
=2D-- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -13,35 +13,34 @@
    sixteen four-word locks. */

 static inline void
-_futex_spin_lock_irqsave(u32 __user *uaddr, unsigned long int *flags)
+_futex_spin_lock(u32 __user *uaddr)
 {
 	extern u32 lws_lock_start[];
 	long index =3D ((long)uaddr & 0x3f8) >> 1;
 	arch_spinlock_t *s =3D (arch_spinlock_t *)&lws_lock_start[index];
-	local_irq_save(*flags);
+	preempt_disable();
 	arch_spin_lock(s);
 }

 static inline void
-_futex_spin_unlock_irqrestore(u32 __user *uaddr, unsigned long int *flags=
)
+_futex_spin_unlock(u32 __user *uaddr)
 {
 	extern u32 lws_lock_start[];
 	long index =3D ((long)uaddr & 0x3f8) >> 1;
 	arch_spinlock_t *s =3D (arch_spinlock_t *)&lws_lock_start[index];
 	arch_spin_unlock(s);
-	local_irq_restore(*flags);
+	preempt_enable();
 }

 static inline int
 arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uad=
dr)
 {
-	unsigned long int flags;
 	int oldval, ret;
 	u32 tmp;

-	_futex_spin_lock_irqsave(uaddr, &flags);
-
 	ret =3D -EFAULT;
+
+	_futex_spin_lock(uaddr);
 	if (unlikely(get_user(oldval, uaddr) !=3D 0))
 		goto out_pagefault_enable;

@@ -72,7 +71,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval=
, u32 __user *uaddr)
 		ret =3D -EFAULT;

 out_pagefault_enable:
-	_futex_spin_unlock_irqrestore(uaddr, &flags);
+	_futex_spin_unlock(uaddr);

 	if (!ret)
 		*oval =3D oldval;
@@ -85,7 +84,6 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uad=
dr,
 			      u32 oldval, u32 newval)
 {
 	u32 val;
-	unsigned long flags;

 	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
 	 * our gateway page, and causes no end of trouble...
@@ -102,19 +100,19 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user =
*uaddr,
 	 * address. This should scale to a couple of CPUs.
 	 */

-	_futex_spin_lock_irqsave(uaddr, &flags);
+	_futex_spin_lock(uaddr);
 	if (unlikely(get_user(val, uaddr) !=3D 0)) {
-		_futex_spin_unlock_irqrestore(uaddr, &flags);
+		_futex_spin_unlock(uaddr);
 		return -EFAULT;
 	}

 	if (val =3D=3D oldval && unlikely(put_user(newval, uaddr) !=3D 0)) {
-		_futex_spin_unlock_irqrestore(uaddr, &flags);
+		_futex_spin_unlock(uaddr);
 		return -EFAULT;
 	}

 	*uval =3D val;
-	_futex_spin_unlock_irqrestore(uaddr, &flags);
+	_futex_spin_unlock(uaddr);

 	return 0;
 }
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 3f24a0af1e04..5b8feeeedf40 100644
=2D-- a/arch/parisc/kernel/syscall.S
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
