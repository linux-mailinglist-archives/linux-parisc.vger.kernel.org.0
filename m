Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C78BF11BDB5
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Dec 2019 21:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfLKUQp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 11 Dec 2019 15:16:45 -0500
Received: from mout.gmx.net ([212.227.15.19]:58311 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726568AbfLKUQp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 11 Dec 2019 15:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1576095396;
        bh=A4+O+e4j7Gk/9fT3N6gVGN95lUurmy1AaGPn5nd5myc=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=YkmRjfHRecEb2ggdJQ7xaJwdQnWaKhJJHkwMpbw/9pKZVDI8cysMSKg2F3zat7SLx
         mH7IceF2ZXF5yvXHBKYsrm1Va9HkASYH0JQu9IxICje7/3tbzxKR6q00effWRu6O1u
         6id22v/6ic2wE7boBshuk+VAq626QPkInQKznqOQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.145.213]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wPh-1idDXb2Ryt-007Uxb; Wed, 11
 Dec 2019 21:16:36 +0100
Date:   Wed, 11 Dec 2019 21:16:34 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH][RFC] parisc: Use ldcw,co on uniprocessor machines only
Message-ID: <20191211201634.GA13407@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Provags-ID: V03:K1:VDBp2dtpBqaOkPR1ZlUwICmP3PxAdGbxUvKdImHHoK81KoHy0iO
 Bkorqm9c/zbOE5bf3Ewvq9bkJUGXG1cXtKlrEjLws3l/zGVNmWEhJmnXOQLf/wcx3hPosvI
 zidggR6klJ5ty1PGlwUoBdBgXPngIKpt6Q0e6/FieBLV39hEky+nomRAH0K+NoZHfeflJYs
 h1P8XG/J6D0KTUsTwVuvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dOqrYMb7bzM=:uRj3kdSCGIrD3FuWT82JU2
 0Pm+wxizQy+NDB9oAzlg/SPgI4qqfuytUMp19iaVc7o0QgM/SgfyqxD8cZkYbrxWJ0uXfhcbF
 +Yuy4PqBykXRhbBpYChqANC2qVtcUi+AlBR7ySl82UMXL9NU8hDe69jm+JKjjZKzqbSnzxzmi
 yaqKRg9P+xs0RTWNCg8pJt91cjtFlW4sEwlgiDYFwRAjMyybyZk4v0ilY3f+dBTDhOseB7jbZ
 UyHCLJe9AeCwqblwN7e64L4sNOw2dzSRqLxddS2F4phPLDugi2d0YC/0a9r/yX9Jby9eToAS/
 Nrv2AH4ggaTcE/FY2Y4Ayof57+NxSouGluu1nosW/1BgYgGyeQ4SSUe0aKcJMUJlHtsrQZnrB
 mohk/PstEtWsqTnNOg5WfbdtYMfRlFHwXzXIgyRFPfvQ/0Vq7wtEa5mqWqkzfK7LNhLbnSWS/
 J8URXWd3YJe1cx6MkSxFwnSnKrJNfggRE0ql0YcCkq2wfZfnAKuRHAZj3F32vP9YRAyl0/91l
 rOAVaHj1DJqkG6SOy7FB2FVgNUA8XIj1nI3pD0bh/WGk0ayfisi+SM8nQF5EgUrK2tJBYYDqf
 GMIWOoMH8dlzrIS7vXL+XrU0BI7Al8xNLh3Imr2D31DDT6C6/2v2XjR251FmI+mG74aytRddl
 3hBhhedetixusSDOS3CMY+vkd+eb+QuCBQVIuVb2rFQthhx8hNCrmClDTCkboogFwS69gz3Ix
 A7ZGFhQzSP416RB1fpOTM9rHRe0nMR+RHsaGQYz13vdzE/ObBVB7BhsVYHqZt0Ev6JuFOtwQ0
 so8tvoR5GDf87J6eaSro3f4RY0QlBmurHkcX9japco8oa0eUmxM+um7AwYADbOXAgqo2UHlp+
 7LuswaDWWGvqmmU3c9MUhFQKlldrs00OVvDCcz7mlWyMeCraA0MTVBf3ab420cTxfYDw4dzXQ
 HdfSB/HTZu34/lR7fPRA8z3ICFATpq+nZFGXaNuhVjyCPQy3nQgnaMO8VSp8ZlbTGECzLgWCd
 BVLH+XZvhcRfMmalHWOP0nM8lFQLsawyBjS8Chcj+m4H+tNJFUyNJamZZJ6UMOOOpYAz9w0AZ
 nAIoHeUkqFkHbBirQ7RnM6R1cV4KAOShxeNQy1DCEzV9EfKtaiXeVvByjkjhm556qZyAfQC1h
 hM89voOB+mv784S3HfMDnD1vsTNwWL2jhkeXHDY8Vg/fQGg0ebgfJFV7XdGl0RolFrCZFqqJq
 SAG5OD+xNRLTbkXhQ9GmtjFIEWyCEfzW/+1IHww==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The only atomic operation on parisc is the ldcw instruction, which loads
a 32bit word from an address and replaces it by zero (load and clear
word). This instruction is used to implement kernel internal spinlocks.

Up to now we tried to optimize the ldcw usage by using the coherent
completer of this command, which operates on the cache (instead of
memory) and thus might speed up things, and which was enabled by default
on our 64bit kernel build.

But we still see runtime locking problems, so this patch changes it back
to use ldcw for 32- and 64-bit kernels, and live-patches it at runtime
to use the coherent completer when running on a uniprocessor machine.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/alternative.h b/arch/parisc/include/a=
sm/alternative.h
index 0ec54f43d6d2..2667ec07acb9 100644
=2D-- a/arch/parisc/include/asm/alternative.h
+++ b/arch/parisc/include/asm/alternative.h
@@ -11,6 +11,7 @@
 #define ALT_COND_RUN_ON_QEMU	0x20	/* if running on QEMU */

 #define INSN_PxTLB	0x02		/* modify pdtlb, pitlb */
+#define INSN_LDCW_CO	0x03		/* change cc in ldcw to ldcw,co */
 #define INSN_NOP	0x08000240	/* nop */

 #ifndef __ASSEMBLY__
diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index a39250cb7dfc..8d6e76279d80 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -44,8 +44,9 @@

 #define CALLEE_SAVE_FRAME_SIZE (CALLEE_REG_FRAME_SIZE + CALLEE_FLOAT_FRAM=
E_SIZE)

+#define LDCW		ALTERNATIVE(., .+4, ALT_COND_NO_SMP, INSN_LDCW_CO) ! ldcw
+
 #ifdef CONFIG_PA20
-#define LDCW		ldcw,co
 #define BL		b,l
 # ifdef CONFIG_64BIT
 #  define PA_ASM_LEVEL	2.0w
@@ -53,7 +54,6 @@
 #  define PA_ASM_LEVEL	2.0
 # endif
 #else
-#define LDCW		ldcw
 #define BL		bl
 #define PA_ASM_LEVEL	1.1
 #endif
diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/asm/ldcw=
.h
index e080143e79a3..59130b0dbc3e 100644
=2D-- a/arch/parisc/include/asm/ldcw.h
+++ b/arch/parisc/include/asm/ldcw.h
@@ -2,7 +2,8 @@
 #ifndef __PARISC_LDCW_H
 #define __PARISC_LDCW_H

-#ifndef CONFIG_PA20
+#include <asm/alternative.h>
+
 /* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
    and GCC only guarantees 8-byte alignment for stack locals, we can't
    be assured of 16-byte alignment for atomic lock data even if we
@@ -19,22 +20,6 @@
 		& ~(__PA_LDCW_ALIGNMENT - 1);			\
 	(volatile unsigned int *) __ret;			\
 })
-#define __LDCW	"ldcw"
-
-#else /*CONFIG_PA20*/
-/* From: "Jim Hull" <jim.hull of hp.com>
-   I've attached a summary of the change, but basically, for PA 2.0, as
-   long as the ",CO" (coherent operation) completer is specified, then th=
e
-   16-byte alignment requirement for ldcw and ldcd is relaxed, and instea=
d
-   they only require "natural" alignment (4-byte for ldcw, 8-byte for
-   ldcd). */
-
-#define __PA_LDCW_ALIGNMENT	4
-#define __PA_LDCW_ALIGN_ORDER	2
-#define __ldcw_align(a) (&(a)->slock)
-#define __LDCW	"ldcw,co"
-
-#endif /*!CONFIG_PA20*/

 /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.
    We don't explicitly expose that "*a" may be written as reload
@@ -46,7 +31,8 @@
    usually used within code blocks surrounded by memory barriers.  */
 #define __ldcw(a) ({						\
 	unsigned __ret;						\
-	__asm__ __volatile__(__LDCW " 0(%1),%0"			\
+	__asm__ __volatile__("ldcw 0(%1),%0"			\
+		ALTERNATIVE(ALT_COND_NO_SMP, INSN_LDCW_CO)	\
 		: "=3Dr" (__ret) : "r" (a) : "memory");		\
 	__ret;							\
 })
diff --git a/arch/parisc/include/asm/spinlock_types.h b/arch/parisc/includ=
e/asm/spinlock_types.h
index 42979c5704dc..82d2384c3f22 100644
=2D-- a/arch/parisc/include/asm/spinlock_types.h
+++ b/arch/parisc/include/asm/spinlock_types.h
@@ -3,13 +3,8 @@
 #define __ASM_SPINLOCK_TYPES_H

 typedef struct {
-#ifdef CONFIG_PA20
-	volatile unsigned int slock;
-# define __ARCH_SPIN_LOCK_UNLOCKED { 1 }
-#else
 	volatile unsigned int lock[4];
 # define __ARCH_SPIN_LOCK_UNLOCKED	{ { 1, 1, 1, 1 } }
-#endif
 } arch_spinlock_t;

 typedef struct {
diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alterna=
tive.c
index 3c66d5c4d90d..cf83a801cc2a 100644
=2D-- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -69,6 +69,12 @@ void __init_or_module apply_alternatives(struct alt_ins=
tr *start,
 			if (boot_cpu_data.cpu_type >=3D pcxu) /* >=3D pa2.0 ? */
 				replacement |=3D (1 << 10); /* set el bit */
 		}
+		/* Want to replace ldcw by a ldcw,co instruction? */
+		if (replacement =3D=3D INSN_LDCW_CO) {
+			replacement =3D *from;
+			/* set cache-coherent completer bits: */
+			replacement |=3D (0x01 << 10);
+		}

 		/*
 		 * Replace instruction with NOPs?
