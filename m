Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6AC17A6A5E
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Sep 2023 20:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjISSBN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Sep 2023 14:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjISSBN (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Sep 2023 14:01:13 -0400
X-Greylist: delayed 557 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Sep 2023 11:01:04 PDT
Received: from dellerweb.de (dellerweb.de [173.249.48.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE448F
        for <linux-parisc@vger.kernel.org>; Tue, 19 Sep 2023 11:01:04 -0700 (PDT)
Received: from mx3210.localdomain (unknown [142.126.114.79])
        by dellerweb.de (Postfix) with ESMTPSA id 3F66616002C7;
        Tue, 19 Sep 2023 19:51:42 +0200 (CEST)
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id A71CD22012C; Tue, 19 Sep 2023 17:51:40 +0000 (UTC)
Date:   Tue, 19 Sep 2023 17:51:40 +0000
From:   John David Anglin <dave@parisc-linux.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Restore __ldcw_align for PA-RISC 2.0 processors
Message-ID: <ZQnfrGKvvIs0KLvf@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kEg3rbyX83ptW6t4"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--kEg3rbyX83ptW6t4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Back in 2005, Kyle McMartin removed the 16-byte alignment for ldcw
semaphores on PA 2.0 machines (CONFIG_PA20). This broke spinlocks
on pre PA8800 processors. The main symptom was random faults in
mmap'd memory (e.g., gcc compilations, etc).

Unfortunately, the errata for this ldcw change is lost.

The issue is the 16-byte alignment required for ldcw semaphore
instructions can only reduced to natural alignment when the ldcw
operation can be handled coherently in cache. Only PA8800 and
PA8900 processors actually support doing the operation in cache.

Aligning the spinlock dynamically adds two integer instructions
to each spinlock.

Tested on rp3440, c8000 and a500.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/asm/ldcw.h
index 6d28b5514699..ee9e071859b2 100644
--- a/arch/parisc/include/asm/ldcw.h
+++ b/arch/parisc/include/asm/ldcw.h
@@ -2,39 +2,42 @@
 #ifndef __PARISC_LDCW_H
 #define __PARISC_LDCW_H
=20
-#ifndef CONFIG_PA20
 /* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
    and GCC only guarantees 8-byte alignment for stack locals, we can't
    be assured of 16-byte alignment for atomic lock data even if we
    specify "__attribute ((aligned(16)))" in the type declaration.  So,
    we use a struct containing an array of four ints for the atomic lock
    type and dynamically select the 16-byte aligned int from the array
-   for the semaphore.  */
+   for the semaphore. */
+
+/* From: "Jim Hull" <jim.hull of hp.com>
+   I've attached a summary of the change, but basically, for PA 2.0, as
+   long as the ",CO" (coherent operation) completer is implemented, then t=
he
+   16-byte alignment requirement for ldcw and ldcd is relaxed, and instead
+   they only require "natural" alignment (4-byte for ldcw, 8-byte for
+   ldcd).
+
+   Although the cache control hint is accepted by all PA 2.0 processors,
+   it is only implemented on PA8800/PA8900 CPUs. Prior PA8X00 CPUs still
+   require 16-byte alignment. If the address is unaligned, the operation
+   of the instruction is undefined. The ldcw instruction does not generate
+   unaligned data reference traps so misaligned accesses are not detected.
+   This hid the problem for years. So, restore the 16-byte alignment dropp=
ed
+   by Kyle McMartin in "Remove __ldcw_align for PA-RISC 2.0 processors". */
=20
 #define __PA_LDCW_ALIGNMENT	16
-#define __PA_LDCW_ALIGN_ORDER	4
 #define __ldcw_align(a) ({					\
 	unsigned long __ret =3D (unsigned long) &(a)->lock[0];	\
 	__ret =3D (__ret + __PA_LDCW_ALIGNMENT - 1)		\
 		& ~(__PA_LDCW_ALIGNMENT - 1);			\
 	(volatile unsigned int *) __ret;			\
 })
-#define __LDCW	"ldcw"
=20
-#else /*CONFIG_PA20*/
-/* From: "Jim Hull" <jim.hull of hp.com>
-   I've attached a summary of the change, but basically, for PA 2.0, as
-   long as the ",CO" (coherent operation) completer is specified, then the
-   16-byte alignment requirement for ldcw and ldcd is relaxed, and instead
-   they only require "natural" alignment (4-byte for ldcw, 8-byte for
-   ldcd). */
-
-#define __PA_LDCW_ALIGNMENT	4
-#define __PA_LDCW_ALIGN_ORDER	2
-#define __ldcw_align(a) (&(a)->slock)
+#ifdef CONFIG_PA20
 #define __LDCW	"ldcw,co"
-
-#endif /*!CONFIG_PA20*/
+#else
+#define __LDCW	"ldcw"
+#endif
=20
 /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.
    We don't explicitly expose that "*a" may be written as reload
diff --git a/arch/parisc/include/asm/spinlock_types.h b/arch/parisc/include=
/asm/spinlock_types.h
index efd06a897c6a..7b986b09dba8 100644
--- a/arch/parisc/include/asm/spinlock_types.h
+++ b/arch/parisc/include/asm/spinlock_types.h
@@ -9,15 +9,10 @@
 #ifndef __ASSEMBLY__
=20
 typedef struct {
-#ifdef CONFIG_PA20
-	volatile unsigned int slock;
-# define __ARCH_SPIN_LOCK_UNLOCKED { __ARCH_SPIN_LOCK_UNLOCKED_VAL }
-#else
 	volatile unsigned int lock[4];
 # define __ARCH_SPIN_LOCK_UNLOCKED	\
 	{ { __ARCH_SPIN_LOCK_UNLOCKED_VAL, __ARCH_SPIN_LOCK_UNLOCKED_VAL, \
 	    __ARCH_SPIN_LOCK_UNLOCKED_VAL, __ARCH_SPIN_LOCK_UNLOCKED_VAL } }
-#endif
 } arch_spinlock_t;
=20
=20

--kEg3rbyX83ptW6t4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmUJ36UACgkQXb/Nrl8Z
TfHaxw/9FghmSaAo2977k4w4veBNfOPR5rgOjwRE6g8QhPF3UXAZP1SXSHXYDzNt
S5JrcpbZv8JMLpH3pRJOFoWcowZEy6XDyeKg+TxC7GZSfHEp6Awi0MTX+MDCviFZ
hiM7sYucenhIJojZZrwsgjlXBYrVLdSeI012kQN1FO/x39c//i5M8e1TAiHftwb8
94R+2PoznYocEI+acr9mn7rVUb2BihnRnZ9z6BW/MP6NCVKGgrqsjDscfMoTbc0U
hS7Hxhion7S6Xwyu4zuetANxziUCcs9p3cgdBFqfvpPlxNlGN8n0lSUeykqchrHy
0pk/U/AwV4FBAr5Gsgt+BJcfvctqlgfTHkRcrHeNct/c7cRjOE3zAD0Et6ajzcgU
Annm68PEq9OKNUqBzypfLGFvGNFnPfMzJ1Qylc9i1kKxLc9MTP/Z4qIDcymkj9C4
HvdwJCrZDyj55MAdw6aYeplUo8WfbWIvcj9xKYb7fiPl+T8d9WDHFQdmzSA5CPqx
ZXf5HRtchL6U50xUhPVsl/+sFmwWz3uJ1LrqdSc0DCoX4c1v8py0LLlfhNVxjAjA
4dIqHQv2qHS0jVgVSvns6G1e1xX4RnoJweR+Yb1igXzp0dpXUrlou6hfz2TWfZzg
noFcRxqI8oyKVEYbpVPEnbFXlkEdSEmDx6N+f4rqtaUw1tbuwhk=
=91XF
-----END PGP SIGNATURE-----

--kEg3rbyX83ptW6t4--
