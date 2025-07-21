Return-Path: <linux-parisc+bounces-3796-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26002B0CB1B
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 21:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C40EB188B951
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 19:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1AB2222BB;
	Mon, 21 Jul 2025 19:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="vYQakZ2A"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-007.bell.net [209.71.212.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF81885A5
	for <linux-parisc@vger.kernel.org>; Mon, 21 Jul 2025 19:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753126949; cv=none; b=GUmCxZSyxKHsW8IG5Plk17ajLoHbHx89gA1ISsavHInGmeRBN22Rk05GbogAZYq5HlG2JC+lcFgXtIe+9zSX0usnGjpV+VY2dd176RAJItSWo8s3x1VmQpXYRfD9llyC91TlolHf9ljd/Lr3TPl438hwklhibZZqMp1Qvzn0k8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753126949; c=relaxed/simple;
	bh=I36GmdexTxBHHIiXwvgbuMiO9mnZgwqSxKxF6ocy8Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WQcEHnPUXQKkfIvX4I/I1L3NaG86uaLlydfR1Z/bbMSHkBhLlwOoMNWwyMOpCbAHpOF2TOBGbSqb4THW3KvEBO10OfpF20V9ZTHBfvo9CIGAYv2jzW87ZY0eQYkejT6VHtqs689HU3BNH+0/bBEG61bu7OetoadMFIlaiZUH3KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=vYQakZ2A; arc=none smtp.client-ip=209.71.212.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753126947; 
        bh=un+1plqor7WFaRuoLN/5nN9wQGU6ecJHKvFA2svWCKo=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=vYQakZ2AKQ8Wnn6PmAwNiEuJxgvx+PVe65okuAn8Jx/NqAD91PIFSIDit9XWv8Je8iICF7Q0pNdWjUZrSld1IU7v2csmNo0qh5zWZ4i+PSn5XguNHkKuYk8NT/NX7QvUnh/MfU3zEnGMdUTDKP0wpvix6v2zxR/TieC/n7ZQFwQimeMLYF7YwEPHx1sizniLHK3iId2aE88jg1vzPk9Gtm08RmvD3U7JxdqeJKo49mPq434KM3qPqZ/ejU9lMbE38NintOemyydQRomGnVJt1oh/4LaoyxtYWQ2KMtsiyHvXwNrJwTQ2zJTeAShBLU6MXf5dTZBcunoJ3Lp87sVbPw==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687A6B9A00656769
X-RazorGate-Vade: dmFkZTEojxxE3UFXmk8EaT1b80rKODYBw87YgXt7rtJUprdlJndMdLDCvIThriWQy20LGkWCsOo17W8mvvYAj1BWVNjDg/hAbRPq88LaW5dwHpPmjrWp4klS8ogQAMGA+hBQHMKOuImMYNvFEAm56otv5aMKqDTRxlRfx9Qae1dgUqMN+YWBAP1MdZrmc1v/UdAoANG/65JOIct5NVd6/h85tdIDhDlkYchIJo5qPurgO8DR9IepyiMKCs83NbyF9hdwQf7/8EUXG2O6152VKEJEm3atX8PEI1zkHlVrB7z6P0dnaj0sSxLCBBd5IhemELASBD0fVwOjFmgfXHIqBFf32YJLUuXoujtx3ImrrA1OUQ8MhBpkiCfCEB6RoupEhxH4xRAOpJ/QkwFxd3x38wyck2JP8CwiDOg2TNvhZznqjpKKzaAx6FFOHJdFr70XqeTbtv5SHNJhSee0kJunMKdpqvi95ImnLeWK+jk0K4xBvHwK0y6gXOjEYb0EnlnYI1ZdQHJeJ8AjDr+WxbvKTJVu560DtCyKq+URAHpCm3nrezPyeJxTd4KorXCFDWVKQ+f+JQFvjDGUjVbpCT9FpJbf3VbOjyvi4jZijYWt9cYndLMkQ2FPsKMT6XZvzhSTKRKDVVqHLbG3RGmkVWz81S7YBdj6Wx/cvqWEK/eJaC/LJEYDqg
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 687A6B9A00656769; Mon, 21 Jul 2025 15:39:28 -0400
Date: Mon, 21 Jul 2025 15:39:26 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Check region is readable by user in
 raw_copy_from_user()
Message-ID: <aH6XbizAdny_XB7e@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YJXDJ416G2yuUv+t"
Content-Disposition: inline


--YJXDJ416G2yuUv+t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

parisc: Check region is readable by user in raw_copy_from_user()

Because of the way the _PAGE_READ is handled in the parisc PTE, an
access interruption is not generated when the kernel reads from a
region where the _PAGE_READ is zero. The current code was written
assuming read access faults would also occur in the kernel.

This change adds user access checks to raw_copy_from_user().  The
prober_user() define checks whether user code has read access to
a virtual address. Note that page faults are not handled in the
exception support for the probe instruction. For this reason, we
precede the probe by a ldb access check.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/include/=
asm/special_insns.h
index 51f40eaf7780..5e8d0b36f1b1 100644
--- a/arch/parisc/include/asm/special_insns.h
+++ b/arch/parisc/include/asm/special_insns.h
@@ -32,6 +32,34 @@
 	pa;						\
 })
=20
+/**
+ * prober_user() - Probe user read access
+ * @sr:		Space regster.
+ * @va:		Virtual address.
+ *
+ * Return: Non-zero if address is accessible.
+ *
+ * Due to the way _PAGE_READ is handled in TLB entries, we need
+ * a special check to determine whether a user address is accessible.
+ * The ldb instruction does the initial access check. If it is
+ * successful, the probe instruction checks user access rights.
+ */
+#define prober_user(sr, va)	({			\
+	unsigned long read_allowed;			\
+	__asm__ __volatile__(				\
+		"copy %%r0,%0\n"			\
+		"8:\tldb 0(%%sr%1,%2),%%r0\n"		\
+		"\tproberi (%%sr%1,%2),3,%0\n"		\
+		"9:\n"					\
+		ASM_EXCEPTIONTABLE_ENTRY(8b, 9b,	\
+				"or %%r0,%%r0,%%r0")	\
+		: "=3D&r" (read_allowed)			\
+		: "i" (sr), "r" (va)			\
+		: "memory"				\
+	);						\
+	read_allowed;					\
+})
+
 #define CR_EIEM 15	/* External Interrupt Enable Mask */
 #define CR_CR16 16	/* CR16 Interval Timer */
 #define CR_EIRR 23	/* External Interrupt Request Register */
diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 5fc0c852c84c..69d65ffab312 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/compiler.h>
 #include <linux/uaccess.h>
+#include <linux/mm.h>
=20
 #define get_user_space()	mfsp(SR_USER)
 #define get_kernel_space()	SR_KERNEL
@@ -32,9 +33,25 @@ EXPORT_SYMBOL(raw_copy_to_user);
 unsigned long raw_copy_from_user(void *dst, const void __user *src,
 			       unsigned long len)
 {
+	unsigned long start =3D (unsigned long) src;
+	unsigned long end =3D start + len;
+	unsigned long newlen =3D len;
+
 	mtsp(get_user_space(), SR_TEMP1);
 	mtsp(get_kernel_space(), SR_TEMP2);
-	return pa_memcpy(dst, (void __force *)src, len);
+
+	/* Check region is user accessible */
+	if (start)
+	while (start < end) {
+		if (!prober_user(SR_TEMP1, start)) {
+			newlen =3D (start - (unsigned long) src);
+			break;
+		}
+		start +=3D PAGE_SIZE;
+		/* align to page boundry which may have different permission */
+		start =3D PAGE_ALIGN_DOWN(start);
+	}
+	return len - newlen + pa_memcpy(dst, (void __force *)src, newlen);
 }
 EXPORT_SYMBOL(raw_copy_from_user);
=20

--YJXDJ416G2yuUv+t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmh+l2YACgkQXb/Nrl8Z
TfHsug//QU+XFl/j3ItknSBtu1LPD1t1vBh1lhvq6zAE4pZN8Gr/Enph10jP0Icy
8uGquu/17Qdi6IFrrb9b8XUNob9Zvd2Y9dN6u1H1sCL46fneUbGsxDuFkKiTqFD3
XNKPZ3DRWoAoDjoJn1FjT4G2HnsJaXt4tCNslbXV5IHsYM0P4wyvl7PNfHZUf0Rz
WxHSLZeibgx3ZW51QTwNf5195Bpm2H8d+SUrCQxYMmGVS6TylBM6Zezqct10yjDC
aSK2rhzaWDLhAQ1fV0ERJ3yXgfape0EYkcbJxAfHv2Qmmjea01rPndX0HbngZu+P
Wdqyb/ix6SW1IzeVubE9kyakFzS7Daj+AhaleF4LHX5qvS4rGumk0pHHrFrIx9xb
cCeaLyMFyFK2KNCXeQ1Z9zd98nznwDg7QTknzKE4K3G4QTYPMRJBh25yKpFVGJPU
Q4AETR6BFthseLyzu8iuuA7gViB7JJhuJEe2SSb0f2kO6HkndnhTZomEV0pb8WQE
agsAwAu7jPGfRhcknYIbvcYv+/cBRMpE3RJNyksKI79xHvumsdoXuvW51qnJyjUR
qfu5A74vB0pIwFCzdGmPrs+EnJ0aUA9sZ6xDzz5aJUnX1h+OAUwCp9StbeFQjchm
KAhaM6u3UFkA2PYl4Y3rGJdY1mti5RE605/24DnW7NblGghC1lM=
=Tp/j
-----END PGP SIGNATURE-----

--YJXDJ416G2yuUv+t--

