Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC12C484A3A
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jan 2022 22:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232512AbiADVsZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jan 2022 16:48:25 -0500
Received: from mta-mtl-003.bell.net ([209.71.208.13]:26654 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230369AbiADVsY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jan 2022 16:48:24 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61D46CFE0008B91A
X-CM-Envelope: MS4xfPWXKnZFdiUzemPbVkBdsmSuL/Dl1FIEeoRrH6FgmllCNtFpaaUxQ/mUr+8nS3KAxseEelCGQCwVvsb/jLTbJ4E5D2OIkoXv5H+qt+qbm9RovqMsTvEq
 4AdsbqkSi4QCxGrrQ6EIySBUHMJ5TBacfQ1soRGfGanlEGOyEr5Oo3KIWCHFjRe2tZ7lBelQXQNZTn4deq21NoEOZKPLfCN/cDX8pE8t6Wqw8KIUj6+muvs2
 izrErJ/UxfBn1pAZ9p0T0rBKLYujvEWxlDNBKqh/OOtLtRctfCHoukuuAeXHJZzyJrNk6fuSlJYiWtDs+jPBPp2Mi2VROBQ+A8nb2sK3L4ur8hFUhyZqEaiL
 X3EXIlhDMTDljIMr4zuXedAzqrhB4wyqJ1ZtC8MK1yhCLYcICcPmvPgpJ+KWZhRY0YiTHu803S07m1VyE9LtX5fYwJMxzRS+xEpmE363CAWaOVtl9eHs02OD
 AABucCYJ5Kb2RG7dI7Hfp1BzCKQYQRRJ3/yWvoFavvpFbrN35tbWvpqjoW3r+sigbZFIewtO1rwZJhBFLcUYx4Ln+go5xyYpnWq3kF6XGUktCvHsg1/UBmhC
 xPedjCvbq9dVAP2lmQMSPtHGyWmIE/BfwkACY+UhtMuihg==
X-CM-Analysis: v=2.4 cv=WtFIjfTv c=1 sm=1 tr=0 ts=61d4c09c
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=DghFqjY3_ZEA:10 a=FBHGMhGWAAAA:8 a=1WHwxEuC4NPW5ickWkQA:9 a=CjuIK1q_8ugA:10
 a=XffRHO2feUEGSXQ7gTcA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61D46CFE0008B91A; Tue, 4 Jan 2022 16:48:12 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 8A6A1220117; Tue,  4 Jan 2022 21:48:11 +0000 (UTC)
Date:   Tue, 4 Jan 2022 21:48:11 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH v2] parisc: Add lws_atomic_xchg and lws_atomic_store syscalls
Message-ID: <YdTAm5HlEXgyeD+c@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rAH5k2JASXjwPWgH"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--rAH5k2JASXjwPWgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch adds two new LWS routines - lws_atomic_xchg and lws_atomic_store.

These are simpler than the CAS routines.  Currently, we use the CAS
routines for atomic stores.  This is inefficient since it requires
both winning the spinlock and a successful CAS operation.

Change has been tested on c8000 and rp3440.

In v2, I moved the code to disble/enable page faults inside the spinlocks.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 027a43e1930d..1373e5129868 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -90,7 +90,7 @@ ENTRY(linux_gateway_page)
 	/* ADDRESS 0xb0 to 0xb8, lws uses two insns for entry */
 	/* Light-weight-syscall entry must always be located at 0xb0 */
 	/* WARNING: Keep this number updated with table size changes */
-#define __NR_lws_entries (3)
+#define __NR_lws_entries (5)
=20
 lws_entry:
 	gate	lws_start, %r0		/* increase privilege */
@@ -884,6 +884,395 @@ cas2_lock_start:
 	ASM_EXCEPTIONTABLE_ENTRY(20b-linux_gateway_page, 31b-linux_gateway_page)
 #endif
=20
+
+	/***************************************************
+		LWS atomic exchange.
+
+		%r26 - Exchange address
+		%r25 - Size of the variable (0/1/2/3 for 8/16/32/64 bit)
+		%r24 - Address of new value
+		%r23 - Address of old value
+		%r28 - Return non-zero on failure
+		%r21 - Kernel error code
+
+		%r21 returns the following error codes:
+		EAGAIN - CAS is busy, ldcw failed, try again.
+		EFAULT - Read or write failed.
+
+		If EAGAIN is returned, %r28 indicates the busy reason:
+		r28 =3D=3D 1 - CAS is busy. lock contended.
+		r28 =3D=3D 2 - CAS is busy. ldcw failed.
+		r28 =3D=3D 3 - CAS is busy. page fault.
+
+		Scratch: r20, r1
+
+	****************************************************/
+
+lws_atomic_xchg:
+#ifdef CONFIG_64BIT
+	/* Wide mode user process? */
+	bb,<,n	%sp, 31, atomic_xchg_begin
+
+	/* Clip the input registers for 32-bit processes. We don't
+	   need to clip %r23 as we only use it for word operations */
+	depdi	0, 31, 32, %r26
+	depdi	0, 31, 32, %r25
+	depdi	0, 31, 32, %r24
+	depdi	0, 31, 32, %r23
+#endif
+
+atomic_xchg_begin:
+	/* Check the validity of the size pointer */
+	subi,>>=3D 3, %r25, %r0
+	b,n	lws_exit_nosys
+
+	/* Jump to the functions which will load the old and new values into
+	   registers depending on the their size */
+	shlw	%r25, 2, %r1
+	blr	%r1, %r0
+	nop
+
+	/* Perform exception checks */
+
+	/* 8-bit exchange */
+1:	ldb	0(%r24), %r20
+	copy	%r23, %r20
+	depi_safe	0, 31, 2, %r20
+	b	atomic_xchg_start
+2:	stbys,e	%r0, 0(%r20)
+	nop
+	nop
+	nop
+
+	/* 16-bit exchange */
+3:	ldh	0(%r24), %r20
+	copy	%r23, %r20
+	depi_safe	0, 31, 2, %r20
+	b	atomic_xchg_start
+4:	stbys,e	%r0, 0(%r20)
+	nop
+	nop
+	nop
+
+	/* 32-bit exchange */
+5:	ldw	0(%r24), %r20
+	b	atomic_xchg_start
+6:	stbys,e	%r0, 0(%r23)
+	nop
+	nop
+	nop
+	nop
+	nop
+
+	/* 64-bit exchange */
+#ifdef CONFIG_64BIT
+7:	ldd	0(%r24), %r20
+8:	stdby,e	%r0, 0(%r23)
+#else
+7:	ldw	0(%r24), %r20
+8:	ldw	4(%r24), %r20
+	copy	%r23, %r20
+	depi_safe	0, 31, 2, %r20
+9:	stbys,e	%r0, 0(%r20)
+10:	stbys,e	%r0, 4(%r20)
+#endif
+
+atomic_xchg_start:
+	/* Trigger memory reference interruptions without writing to memory */
+	copy	%r26, %r28
+	depi_safe	0, 31, 2, %r28
+11:	ldw	0(%r28), %r1
+12:	stbys,e	%r0, 0(%r28)
+
+	/* Calculate 8-bit hash index from virtual address */
+	extru_safe  %r26, 27, 8, %r20
+
+	/* Load start of lock table */
+	ldil	L%lws_lock_start, %r28
+	ldo	R%lws_lock_start(%r28), %r28
+
+	/* Find lock to use, the hash index is one of 0 to
+	   255, multiplied by 16 (keep it 16-byte aligned)
+	   and add to the lock table offset. */
+	shlw	%r20, 4, %r20
+	add	%r20, %r28, %r20
+
+	rsm	PSW_SM_I, %r0			/* Disable interrupts */
+
+	/* Try to acquire the lock */
+	LDCW	0(%sr2,%r20), %r28
+	comclr,<>	%r0, %r28, %r0
+	b,n	lws_wouldblock
+
+	/* Disable page faults to prevent sleeping in critical region */
+	lws_pagefault_disable	%r21,%r28
+
+	/* NOTES:
+		This all works because intr_do_signal
+		and schedule both check the return iasq
+		and see that we are on the kernel page
+		so this process is never scheduled off
+		or is ever sent any signal of any sort,
+		thus it is wholly atomic from userspace's
+		perspective
+	*/
+
+	/* Jump to the correct function */
+	blr	%r1, %r0
+	/* Set %r28 as non-zero for now */
+	ldo	1(%r0),%r28
+
+	/* 8-bit exchange */
+14:	ldb	0(%r26), %r1
+15:	stb	%r1, 0(%r23)
+15:	ldb	0(%r24), %r1
+17:	stb	%r1, 0(%r26)
+	b	lws_exit_noerror
+	copy	%r0, %r28
+	nop
+	nop
+
+	/* 16-bit exchange */
+18:	ldh	0(%r26), %r1
+19:	sth	%r1, 0(%r23)
+20:	ldh	0(%r24), %r1
+21:	sth	%r1, 0(%r26)
+	b	lws_exit_noerror
+	copy	%r0, %r28
+	nop
+	nop
+
+	/* 32-bit exchange */
+22:	ldw	0(%r26), %r1
+23:	stw	%r1, 0(%r23)
+24:	ldw	0(%r24), %r1
+25:	stw	%r1, 0(%r26)
+	b	lws_exit_noerror
+	copy	%r0, %r28
+	nop
+	nop
+
+	/* 64-bit exchange */
+#ifdef CONFIG_64BIT
+26:	ldd	0(%r26), %r1
+27:	std	%r1, 0(%r23)
+28:	ldd	0(%r24), %r1
+29:	std	%r1, 0(%r26)
+#else
+26:	flddx	0(%r26), %fr4
+27:	fstdx	%fr4, 0(%r23)
+28:	flddx	0(%r24), %fr4
+29:	fstdx	%fr4, 0(%r26)
+#endif
+	b	lws_exit_noerror
+	copy	%r0, %r28
+
+	/* A fault occurred on load or stbys,e store */
+30:	b,n	lws_fault
+	ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(3b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(5b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(6b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(7b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(8b-linux_gateway_page, 30b-linux_gateway_page)
+#ifndef CONFIG_64BIT
+	ASM_EXCEPTIONTABLE_ENTRY(9b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(10b-linux_gateway_page, 30b-linux_gateway_page)
+#endif
+
+	ASM_EXCEPTIONTABLE_ENTRY(11b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(12b-linux_gateway_page, 30b-linux_gateway_page)
+
+	/* A page fault occurred in critical region */
+31:	b,n	lws_pagefault
+	ASM_EXCEPTIONTABLE_ENTRY(14b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(15b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(16b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(17b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(18b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(19b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(20b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(21b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(22b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(23b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(24b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(25b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(26b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(27b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(28b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(29b-linux_gateway_page, 31b-linux_gateway_page)
+
+	/***************************************************
+		LWS atomic store.
+
+		%r26 - Address to store
+		%r25 - Size of the variable (0/1/2/3 for 8/16/32/64 bit)
+		%r24 - Address of value to store
+		%r28 - Return non-zero on failure
+		%r21 - Kernel error code
+
+		%r21 returns the following error codes:
+		EAGAIN - CAS is busy, ldcw failed, try again.
+		EFAULT - Read or write failed.
+
+		If EAGAIN is returned, %r28 indicates the busy reason:
+		r28 =3D=3D 1 - CAS is busy. lock contended.
+		r28 =3D=3D 2 - CAS is busy. ldcw failed.
+		r28 =3D=3D 3 - CAS is busy. page fault.
+
+		Scratch: r20, r1
+
+	****************************************************/
+
+lws_atomic_store:
+#ifdef CONFIG_64BIT
+	/* Wide mode user process? */
+	bb,<,n	%sp, 31, atomic_store_begin
+
+	/* Clip the input registers for 32-bit processes. We don't
+	   need to clip %r23 as we only use it for word operations */
+	depdi	0, 31, 32, %r26
+	depdi	0, 31, 32, %r25
+	depdi	0, 31, 32, %r24
+#endif
+
+atomic_store_begin:
+	/* Check the validity of the size pointer */
+	subi,>>=3D 3, %r25, %r0
+	b,n	lws_exit_nosys
+
+	shlw	%r25, 1, %r1
+	blr	%r1, %r0
+	nop
+
+	/* Perform exception checks */
+
+	/* 8-bit store */
+1:	ldb	0(%r24), %r20
+	b,n	atomic_store_start
+	nop
+	nop
+
+	/* 16-bit store */
+2:	ldh	0(%r24), %r20
+	b,n	atomic_store_start
+	nop
+	nop
+
+	/* 32-bit store */
+3:	ldw	0(%r24), %r20
+	b,n	atomic_store_start
+	nop
+	nop
+
+	/* 64-bit store */
+#ifdef CONFIG_64BIT
+4:	ldd	0(%r24), %r20
+#else
+4:	ldw	0(%r24), %r20
+5:	ldw	4(%r24), %r20
+#endif
+
+atomic_store_start:
+	/* Trigger memory reference interruptions without writing to memory */
+	copy	%r26, %r28
+	depi_safe	0, 31, 2, %r28
+6:	ldw	0(%r28), %r1
+7:	stbys,e	%r0, 0(%r28)
+
+	/* Calculate 8-bit hash index from virtual address */
+	extru_safe  %r26, 27, 8, %r20
+
+	/* Load start of lock table */
+	ldil	L%lws_lock_start, %r28
+	ldo	R%lws_lock_start(%r28), %r28
+
+	/* Find lock to use, the hash index is one of 0 to
+	   255, multiplied by 16 (keep it 16-byte aligned)
+	   and add to the lock table offset. */
+	shlw	%r20, 4, %r20
+	add	%r20, %r28, %r20
+
+	rsm	PSW_SM_I, %r0			/* Disable interrupts */
+
+	/* Try to acquire the lock */
+	LDCW	0(%sr2,%r20), %r28
+	comclr,<>	%r0, %r28, %r0
+	b,n	lws_wouldblock
+
+	/* Disable page faults to prevent sleeping in critical region */
+	lws_pagefault_disable	%r21,%r28
+
+	/* NOTES:
+		This all works because intr_do_signal
+		and schedule both check the return iasq
+		and see that we are on the kernel page
+		so this process is never scheduled off
+		or is ever sent any signal of any sort,
+		thus it is wholly atomic from userspace's
+		perspective
+	*/
+
+	/* Jump to the correct function */
+	blr	%r1, %r0
+	/* Set %r28 as non-zero for now */
+	ldo	1(%r0),%r28
+
+	/* 8-bit store */
+9:	ldb	0(%r24), %r1
+10:	stb	%r1, 0(%r26)
+	b	lws_exit_noerror
+	copy	%r0, %r28
+
+	/* 16-bit store */
+11:	ldh	0(%r24), %r1
+12:	sth	%r1, 0(%r26)
+	b	lws_exit_noerror
+	copy	%r0, %r28
+
+	/* 32-bit store */
+13:	ldw	0(%r24), %r1
+14:	stw	%r1, 0(%r26)
+	b	lws_exit_noerror
+	copy	%r0, %r28
+
+	/* 64-bit store */
+#ifdef CONFIG_64BIT
+15:	ldd	0(%r24), %r1
+16:	std	%r1, 0(%r26)
+#else
+15:	flddx	0(%r24), %fr4
+16:	fstdx	%fr4, 0(%r26)
+#endif
+	b	lws_exit_noerror
+	copy	%r0, %r28
+
+	/* A fault occurred on load or stbys,e store */
+30:	b,n	lws_fault
+	ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(3b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 30b-linux_gateway_page)
+#ifndef CONFIG_64BIT
+	ASM_EXCEPTIONTABLE_ENTRY(5b-linux_gateway_page, 30b-linux_gateway_page)
+#endif
+
+	ASM_EXCEPTIONTABLE_ENTRY(6b-linux_gateway_page, 30b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(7b-linux_gateway_page, 30b-linux_gateway_page)
+
+	/* A page fault occurred in critical region */
+31:	b,n	lws_pagefault
+	ASM_EXCEPTIONTABLE_ENTRY(9b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(10b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(11b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(12b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(13b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(14b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(15b-linux_gateway_page, 31b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(16b-linux_gateway_page, 31b-linux_gateway_page)
+
 	/* Make sure nothing else is placed on this page */
 	.align PAGE_SIZE
 END(linux_gateway_page)
@@ -903,6 +1292,8 @@ ENTRY(lws_table)
 	LWS_ENTRY(compare_and_swap32)		/* 0 - ELF32 Atomic 32bit CAS */
 	LWS_ENTRY(compare_and_swap64)		/* 1 - ELF64 Atomic 32bit CAS */
 	LWS_ENTRY(compare_and_swap_2)		/* 2 - Atomic 64bit CAS */
+	LWS_ENTRY(atomic_xchg)			/* 3 - Atomic Exchange */
+	LWS_ENTRY(atomic_store)			/* 4 - Atomic Store */
 END(lws_table)
 	/* End of lws table */
=20

--rAH5k2JASXjwPWgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmHUwJoACgkQXb/Nrl8Z
TfG3mBAApQgNxd5FroKzzuxt4PazU8e/LY1FV9Wrg685Adn2KTqXxTVu5A6kcD7p
S0YXeUgXU4AXcfXA3fLSAUIDpgJCnC/n07GpaLd8uI75CpuI1zwD/t9XJIOfzdMC
IhSQC0pldwJYEjXAe5iiI4pdHj5HPMWp7WMjibeDpLlFy65QQXHTmO7ll8AFidoZ
pMslLuVU8ZW0+ooDWp46BQow1E5UlO5K87UK1VS05gbBBWpABAQELYvu5pYdMCSh
54Hdn+ukOtcheBF2DlPJa874azaoEl3p3GV6uw5UTLD9x/lN/hGuSkvWYgdo0rhr
0skH79DKn7O2h/tQlqnFYSeeb/4xvTUW4XZeGLRTZKtEDXwiVC+7mFdTfeb/1ida
YDevk1tH33/+SISsL8mL/YydvrwnNHA4tCGrtKAda4cFeQaPHhQCiwSuxMcpYpdx
WLjesL8hHGRRx1RFl0Jz6HZoXyUXlCjbsTj7fBtDNjIffOe/D17xDJ3bR8utY9i7
uXKD5E3uCyoALxfUwf8J5LvtLSWpad5XnXCuLlwCjgJeRQJTcp/FMFTBYEA47s1Y
zJtSZZgfq9km8gSoJaEGubk+oQ6GNNOaTGLFdQQwoVW7cFq05neP3Ntlod4ACT1T
0hllLq/lz4f2azGoWpKKr9ywTpwqG7T5zjmxACIqPwgHP+tze/o=
=9I39
-----END PGP SIGNATURE-----

--rAH5k2JASXjwPWgH--
