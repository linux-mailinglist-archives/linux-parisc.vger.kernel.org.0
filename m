Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2738457239
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Nov 2021 16:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbhKSQAN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Nov 2021 11:00:13 -0500
Received: from mout.gmx.net ([212.227.15.15]:37147 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233489AbhKSQAN (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Nov 2021 11:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637337424;
        bh=1+UL+sZ/CbLegq7AzZBEKxZycUfY0AdqATLwloegG8g=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=V8fDJtWV43RODIJYoJdZpCmtUzKmlwwNc7BOZEJ0luy/8KbhF9o0DCagwxJSEw2Vj
         TzXVAjOs/KcgyhJ9QzloMZAyIdZBttxIGgfD0nL7/ojZ2Z6JAGKBuAHZhn9A/rQU2f
         Sn4WaelEc+2whOnggWg5hRwcscGgCouLPcDxN/oA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.164.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKHm-1mT0ZQ2HVc-00ye3A; Fri, 19
 Nov 2021 16:57:04 +0100
Date:   Fri, 19 Nov 2021 16:56:28 +0100
From:   Helge Deller <deller@gmx.de>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Fix extraction of hash lock bits in syscall.S
Message-ID: <YZfJLEmjAUdY+4OO@ls3530>
References: <df51e873-4576-d4c2-7d86-b607cbb714b4@bell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df51e873-4576-d4c2-7d86-b607cbb714b4@bell.net>
X-Provags-ID: V03:K1:u1wQTupCFDIev3vSBdWZcWM2U4hWoMxhkUhZQ/N5BYV0YRPDu/w
 9K+g/Dg1INeZ4QEiPLC+f6AP58dYRjBgb5Qihq6ejHl8YYjkEOG+7KBtkXdycMLcuWQkZct
 6CqsAXir1Tka86PlJVie4m3EIDjIMkIjO8L41wXdTt8bSEWqx6cE3kKBUT4QAsxrnh3L6ct
 TTeybC6HwrsXgbWyKqxWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wn0aqjNHeKw=:36hOiwkJfjgvDOM4KUH7tW
 2JQDY/G8bYRLjOYr55P+EZ6PIcJJOnfEq1nzUpznbQcxLmeqiJn30u+Hjq7NJzxYK+mNkBRi3
 cm+KeyRVHMfQjDjJtirMY/RKzfnxfmGtZa1COx2yATQhGoLLvOc7xL0C/aMGP1f3Loh4hbQBz
 +b+EfVAdG5je0iLVKZvJZe89c5+IiX6QJ9W1GVW60u4gLV52pp/qd+rVait0QuTMEpSQO2ZTZ
 MhtwPfpMmGz3Mm0LI6YxJmRYPXwFb2i4vhWdP4wagqEV3uKAcDMMhWwZmafYb5VZSbdaJZmCB
 z8xvdQISOp3jOHt4f7a/sO85NG321HpjG+kf9gVsc05TOzaLmjjds2xrCWrDrIojA+s51IhlI
 cuje523PaO3v0E0zBWhX7S+UMA/jQRL30zoWmqAS8evbHcVS0yWPwuCBTwrPKqvyKNxpRAUAR
 nrglGpKMvHICuJOoXXkpSITFZRW7NBDyI6HGv9UoHRJbW3cxGD7HQ3dmdO4sD3p/37SWBiYyU
 RnW5AuORsEgdkNGHz+DWq9SAarzuPH4tjmaK1UIlCJQIDfRdufHzzcCSAMhVRnLzrlinok/IR
 FA54RTaOBGUjPGTPIh6p3YeuyT45GL+8Wz+oDQh/5Mni8mDEzZmCzymvY39/Ek5cQa6kInd//
 64duFxLMFdOg8lhHnoT93DIqWUJQjai7seDsci2pzcjPN7iE7cfpNWHbHHZLMGywENOKHlFEA
 n31A9zDzjQtaCgj0dhzHTLrPNpXQNSwxS/K5snFdWg7slKC7tMAmDlPSSIujJ1IVnAK7sDNRQ
 DM3RAU793Y80mQ/dApCKPwvoDRAWc+xSLnX7u2n9gJUKlCseWZiQFP+n/jkempAEVApCQeifi
 bftATjFWAJqszDGeIBt40DMSNfdjFok67Bug6Gu6WZvesrBH3FUihrHpcCHEuaBgJ9EYy/tpc
 6d1vnZdUDOrHtnrJ9024LiKIEBIeUBKxYPtf/o2vjkCUfT5geiec/KLr0Ad+Ybdbbu9zds/cf
 r/nMuNMyb7UYx5E+dpT4f0Hxrc0WGSI32eU03Wp+xCe/9CmuYZ/QnadbVaaGGJl++vPcLOLp2
 v89rVfv1hDswpo=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* John David Anglin <dave.anglin@bell.net>:
> The extru instruction leaves the most significant 32 bits of the target =
register in an undefined
> state on PA 2.0 systems.  If any of these bits are nonzero, this will br=
eak the calculation of the
> lock pointer.
>
> Fix by using extrd,u instruction on 64-bit kernels.

I wonder if we shouldn't introduce an extru_safe() macro.
The name doesn't matter, but that way we can get rid of the ifdefs and
use it in other places as well, e.g. as seen below.
Thoughs?

Helge

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index 7085df079702..9c5f0fc67400 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -143,6 +143,16 @@
 	extrd,u \r, 63-(\sa), 64-(\sa), \t
 	.endm

+	/* The extru instruction leaves the most significant 32 bits of the
+	 * target register in an undefined state on PA 2.0 systems. */
+	.macro extru_safe r, p, len, t
+#ifdef CONFIG_64BIT
+	extrd,u	\r, 32+(\p), \len, \t
+#else
+	extru	\r, \p, \len, \t
+#endif
+	.endm
+
 	/* load 32-bit 'value' into 'reg' compensating for the ldil
 	 * sign-extension when running in wide mode.
 	 * WARNING!! neither 'value' nor 'reg' can be expressions
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 88c188a965d8..6e9cdb269862 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -366,17 +366,9 @@
 	 */
 	.macro		L2_ptep	pmd,pte,index,va,fault
 #if CONFIG_PGTABLE_LEVELS =3D=3D 3
-	extru		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
+	extru_safe	\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
 #else
-# if defined(CONFIG_64BIT)
-	extrd,u		\va,63-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
-  #else
-  # if PAGE_SIZE > 4096
-	extru		\va,31-ASM_PGDIR_SHIFT,32-ASM_PGDIR_SHIFT,\index
-  # else
-	extru		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
-  # endif
-# endif
+	extru_safe	\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
 #endif
 	dep             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 #if CONFIG_PGTABLE_LEVELS < 3
@@ -386,7 +378,7 @@
 	bb,>=3D,n		\pmd,_PxD_PRESENT_BIT,\fault
 	dep		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
 	SHLREG		\pmd,PxD_VALUE_SHIFT,\pmd
-	extru		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
+	extru_safe	\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
 	dep		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd /* pmd is now pte */
 	.endm
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 4fb3b6a993bf..d2497b339d13 100644
=2D-- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -566,7 +566,7 @@ lws_compare_and_swap:
 	ldo	R%lws_lock_start(%r20), %r28

 	/* Extract eight bits from r26 and hash lock (Bits 3-11) */
-	extru  %r26, 28, 8, %r20
+	extru_safe  %r26, 28, 8, %r20

 	/* Find lock to use, the hash is either one of 0 to
 	   15, multiplied by 16 (keep it 16-byte aligned)
@@ -751,7 +751,7 @@ cas2_lock_start:
 	ldo	R%lws_lock_start(%r20), %r28

 	/* Extract eight bits from r26 and hash lock (Bits 3-11) */
-	extru  %r26, 28, 8, %r20
+	extru_safe  %r26, 28, 8, %r20

 	/* Find lock to use, the hash is either one of 0 to
 	   15, multiplied by 16 (keep it 16-byte aligned)
