Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35D947D4C4
	for <lists+linux-parisc@lfdr.de>; Wed, 22 Dec 2021 17:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhLVQBk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 22 Dec 2021 11:01:40 -0500
Received: from mta-mtl-002.bell.net ([209.71.208.12]:14402 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229436AbhLVQBj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 22 Dec 2021 11:01:39 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C30F240007CEE1
X-CM-Envelope: MS4xfHUDvU5gSEvgHyMQPO8SXSvWbngUi2U9Nc3/m4KzHavsQW1oEyqAqH5aVz1fXbk/zIUEgq+anQr2WOf3u8oMIJvoby7Vbys47nS3PIc5KTqF9CfHu4Sc
 OYLymHSFojmH4p+NyxUFrCYNYwKQVrH+C518oYiF3yddBm7Lbvk7xCT7IYcwCDfCcW2Fp47uW9qZfInqizGB1jJr2Vnn7j/EGFeexrBT+YTHrsEeeHRLdgZE
 pS94zH9W1NJMeuxYFg6GQdA+57SLcvn7ickgEiMjy1CB3GmKmdBOMvtK9ddEbamlxezCjoz0WE2UHB3SQNzwvtS6CEJN73Y+Qyqw7Q2qnqGjIeceKEn4A1ca
 pqQfsXJ3iWkpvScCyJKbnq37Iv1GviLwiNhNALShViCfrNRmmhqpmi3yDcYV3tnkffOFz9NNsWwj5YgsZbxYIGJApzG7LO4jyjt0aCA77UDQF5AkI5YmbKbY
 NnFFxco6STUIvp89rR7u/4JzxHhs+wnQrdDoTplzwjI272X+jR962adpt42a2GyF6RjRQCcs+efSuM1FlNTyiP7ziMtRayn+Lvi3MBm+xvq56EixCBxyHsUd
 cBtTR8o2rAp2JPb9dzlir91zJ+PflIChDUduAC3jnDuarA==
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61c34bdc
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IOMw9HtfNCkA:10 a=FBHGMhGWAAAA:8 a=cczP2MuSm3RsJyjoF0MA:9 a=CjuIK1q_8ugA:10
 a=icv3GNutqaUzW7vLzk4A:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C30F240007CEE1; Wed, 22 Dec 2021 11:01:32 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id B73D6220117; Wed, 22 Dec 2021 16:01:31 +0000 (UTC)
Date:   Wed, 22 Dec 2021 16:01:31 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James.Bottomley@hansenpartnership.com
Subject: [PATCH] parisc: Fix lpa and lpa_user defines
Message-ID: <YcNL29hOucQ4gavI@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+7LbDbs4w0HFVrra"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--+7LbDbs4w0HFVrra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

While working on the rewrite to the light-weight syscall and futex code,
I experimented with using a hash index based on the user physical address
of atomic variable. This exposed two problems with the lpa and lpa_user
defines.

Because of the copy instruction, the pa argument needs to be an early
clobber argument. This prevents gcc from allocating the va and pa
arguments to the same register.

Secondly, the lpa instruction can cause a page fault so we need to
catch exceptions.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/include/=
asm/special_insns.h
index a303ae9a77f4..0493cbf70012 100644
--- a/arch/parisc/include/asm/special_insns.h
+++ b/arch/parisc/include/asm/special_insns.h
@@ -2,26 +2,30 @@
 #ifndef __PARISC_SPECIAL_INSNS_H
 #define __PARISC_SPECIAL_INSNS_H
=20
-#define lpa(va)	({			\
-	unsigned long pa;		\
-	__asm__ __volatile__(		\
-		"copy %%r0,%0\n\t"	\
-		"lpa %%r0(%1),%0"	\
-		: "=3Dr" (pa)		\
-		: "r" (va)		\
-		: "memory"		\
-	);				\
-	pa;				\
+#define lpa(va)	({					\
+	unsigned long pa;				\
+	__asm__ __volatile__(				\
+		"copy %%r0,%0\n"			\
+		"9998:\tlpa %%r0(%1),%0\n"		\
+		"9999:\n"				\
+		ASM_EXCEPTIONTABLE_ENTRY(9998b, 9999b)	\
+		: "=3D&r" (pa)				\
+		: "r" (va)				\
+		: "memory"				\
+	);						\
+	pa;						\
 })
=20
-#define lpa_user(va)	({		\
-	unsigned long pa;		\
-	__asm__ __volatile__(		\
-		"copy %%r0,%0\n\t"	\
-		"lpa %%r0(%%sr3,%1),%0"	\
-		: "=3Dr" (pa)		\
-		: "r" (va)		\
-		: "memory"		\
+#define lpa_user(va)	({				\
+	unsigned long pa;				\
+	__asm__ __volatile__(				\
+		"copy %%r0,%0\n"			\
+		"9998:\tlpa %%r0(%%sr3,%1),%0\n"	\
+		"9999:\n"				\
+		ASM_EXCEPTIONTABLE_ENTRY(9998b, 9999b)	\
+		: "=3D&r" (pa)				\
+		: "r" (va)				\
+		: "memory"				\
 	);				\
 	pa;				\
 })


--+7LbDbs4w0HFVrra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmHDS9MACgkQXb/Nrl8Z
TfHoNxAAqlTnKBD9jQVGDYDbQpY4pGiLejQAgMoYnn27wxNid38aCdrxMOvZEbTW
StH70OQFzX4j6eZ78YG0TBO8IKTla9df9EDfM6DN6fpSDZVoPqCznc7Y2OBrc4vR
wVKN7jEbSDocDJihHLxAk91/AeqkPOr56hVSkqxKNorj9DzMl/j6ZOxbK60Wc6jB
IP563FLIyzfPGbZLc0orkFoChSc7GItElt2NljH8WYK7FADf3BNcHak/1WHfPMGH
7Tf0YrxiJQ1yQpkGUKTibgJAIy6/LzpYg7UR5p+H4PItkTp6jUYfRGSvuPd1AtMM
TQlfZilXQVWH4detG1BcUnqcLm+873HhNfhG+3Hk1vuynFTiZJeQa/vZBTsixyCj
DFwQKwW7gClkoYPiAeWmOZq3oNtqZ/Z15K5Yo06vg0taSD+uObwtmSA74NOUEhPI
6BEPrrsUQ1uPPiXaScon45hSV2rqobSItdBmDkXH6PiZsPlm/ZuLPP8wtcuNEM0K
7/nbYS3w5IV4zdZdKYY9eGXqBhkgEfbeYIGz0CUkLI3aU3QXyUQ68kMXBUGstlHw
qMWtFdEUAKdefPq4NebDE67WUuDInZuI33gjId66yLQDisWzi84M3KkLgIX/ce4J
VrUYN1kZV8YjAlNIerHrLALJLSb3xRgreGlAOvL3cY7tx4rD0n4=
=Ij3G
-----END PGP SIGNATURE-----

--+7LbDbs4w0HFVrra--
