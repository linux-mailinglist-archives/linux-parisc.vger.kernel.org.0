Return-Path: <linux-parisc+bounces-3795-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC90B0CAEB
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 21:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6732516501F
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 19:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2EF2AD0F;
	Mon, 21 Jul 2025 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="GqwPuQpB"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo001.bell.net (mta-mtl-007.bell.net [209.71.208.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F372F32
	for <linux-parisc@vger.kernel.org>; Mon, 21 Jul 2025 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753125393; cv=none; b=a0C6FJ2cysLTBW7TAWHXO1PdBUjnC8chTHzClerAGAXFHyxeoqN2nvUSMcZ4UkvugTUvN/dAZVHzfI97dY7TSjs9IAlSykUNZ6EK0cRMMc9eGwO/ncEYKGyiT740gb7PV6GKVweZyXQqL8RZNtuUcYAbvBSeiV4HVYyfhlfIllM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753125393; c=relaxed/simple;
	bh=SndjvEtC0EbVUcPOZbn2mnV7oiYKyphhMGevsmTCOrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kL3fX1/Nw1vhVBsH/wzMQMDVbQXatFMD4KU6p1ivAjyrw3ttqI2sNGp3wtv5ukw86E3gMmR7FO0j5ANE0cOj6Sw4yY/udELcW7afPEQ2OXJqJK5BqQzgFanbimKRRb4dX0FTtvWMy5itVugI6IME11vkWdtyFL9mlY6o0rNWnZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=GqwPuQpB; arc=none smtp.client-ip=209.71.208.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753125391; 
        bh=5y1jAxIPjKBShkB1/hWzC9zdVSNdxye7NziF/jsOma4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=GqwPuQpBXWTxay0qGaS7fNtOy2g8+CszpZV6kyahYy9joxsRDTW2aBaFiUPOXF+KuKbOnekjAUux/O4JY+eTG9V38edjA59hBwKL0jncQ7QRPKQJswGDKV2ttJZYV0AFfFG/m5z7TzMCbLgITQOLf0ZzykOvTm9cEzVxtIrSmHq/ccVNb8C3Bkh6qIWhnfoX86V1mpe2PPM/qhMNUV/pulhi0FWaz8Z5+TVcrFmLiI5JPk7qNSaN2zVbg41WJF203xz0jNe1r9odcATVVZtkIzb+lc0Wj8WlnKCxesYtfV6V9LaWFU6XHaxO+69qBh1gluAlc05JSXZnOlvC9MZIeA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687D26C20030EA27
X-RazorGate-Vade: dmFkZTFLSenzu6cAqpKi6Oi88N1YYsu3GRAdMlaYn8qWr/jmmga9kzG2RCHxUUcjGXeai89Jk7Jh7Yyqy8yv2uszxGhvW1w0/U2D6pNd7UqTgf28H0pXGC5IY3AaEJTT/J5FzB5lCKWanes+QQCagkNFEmJ+qFhaICyGxOlVrILFtM8lQ/scz68r1df6XqBdAmokzQEiNKBR4azIybOj9UBcdPo8J0Lxu5z+vdcDegeRruD5LlLvLJ7p9R+TMLInhEmW5r1zE76dCg0K4ZXZ2xuFRbtkRn44DpQT1u9Woc6Fjy12VhBTHg2uT1E49vIiIr690Pk1pi+auXqcn9J3pDi9ewkOpE5UKDwNfpUAkfAdNmrKM0rD4ihNEr+x4Ytmxzxo6BvIUQXP7ghWG3x9wBGXE4wYiUOyHgSpdwLnZ1ShcAB5zW7QmHeAtEA7PVYC4ttJrZ6eqPI98FYK5GALmR7DLNe4vSAsddE4FbNFZWyphrdG9XjrGoiD4LJPj2ZBrIjbnlsl3VWfV7f1HYzHk+ZQvv4/Xu3QK+eEdHpE8JeAJ+OIjiTfg0V4lLBUOM8n+1aC/cG/PkUxQ1GBC+zCE/tE+UCuu9RQzg3013E5UJHnOOB2cnUltjbqHHxbuzdbde4smv/FTPB4oO5S5mZy26rSjo/j6qU+DGezzanYHoCjZh0CqA
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-mtlrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 687D26C20030EA27; Mon, 21 Jul 2025 15:13:44 -0400
Date: Mon, 21 Jul 2025 15:13:42 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Update comments in make_insert_tlb
Message-ID: <aH6RZvx5qxp2bfKI@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XtWV4BlMIQdUAgvB"
Content-Disposition: inline


--XtWV4BlMIQdUAgvB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

parisc: Update comments in make_insert_tlb

The following testcase exposed a problem with our read access checks
in get_user() and raw_copy_from_user():

#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <sys/mman.h>
#include <sys/types.h>

int main(int argc, char **argv)
{
  unsigned long page_size =3D sysconf(_SC_PAGESIZE);
  char *p =3D malloc(3 * page_size);
  char *p_aligned;

  /* initialize memory region. If not initialized, write syscall below will=
 correctly return EFAULT. */
  if (1)
	memset(p, 'X', 3 * page_size);

  p_aligned =3D (char *) ((((uintptr_t) p) + (2*page_size - 1)) & ~(page_si=
ze - 1));
  /* Drop PROT_READ protection. Kernel and userspace should fault when acce=
ssing that memory region */
  mprotect(p_aligned, page_size, PROT_NONE);

  /* the following write() should return EFAULT, since PROT_READ was droppe=
d by previous mprotect() */
  int ret =3D write(2, p_aligned, 1);
  if (!ret || errno !=3D EFAULT)
	printf("\n FAILURE: write() did not returned expected EFAULT value\n");

  return 0;
}

Because of the way _PAGE_READ is handled, kernel code never generates
a read access fault when it access a page as the kernel privilege level
is always less than PL1 in the PTE.

This patch reworks the comments in the make_insert_tlb macro to try
to make this clearer.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index ea57bcc21dc5..f4bf61a34701 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -499,6 +499,12 @@
 	 * this happens is quite subtle, read below */
 	.macro		make_insert_tlb	spc,pte,prot,tmp
 	space_to_prot   \spc \prot        /* create prot id from space */
+
+#if _PAGE_SPECIAL_BIT =3D=3D _PAGE_DMB_BIT
+	/* need to drop DMB bit, as it's used as SPECIAL flag */
+	depi		0,_PAGE_SPECIAL_BIT,1,\pte
+#endif
+
 	/* The following is the real subtlety.  This is depositing
 	 * T <-> _PAGE_REFTRAP
 	 * D <-> _PAGE_DIRTY
@@ -511,17 +517,18 @@
 	 * Finally, _PAGE_READ goes in the top bit of PL1 (so we
 	 * trigger an access rights trap in user space if the user
 	 * tries to read an unreadable page */
-#if _PAGE_SPECIAL_BIT =3D=3D _PAGE_DMB_BIT
-	/* need to drop DMB bit, as it's used as SPECIAL flag */
-	depi		0,_PAGE_SPECIAL_BIT,1,\pte
-#endif
 	depd            \pte,8,7,\prot
=20
 	/* PAGE_USER indicates the page can be read with user privileges,
 	 * so deposit X1|11 to PL1|PL2 (remember the upper bit of PL1
-	 * contains _PAGE_READ) */
+	 * contains _PAGE_READ). While the kernel can't directly write
+	 * user pages which have _PAGE_WRITE zero, it can read pages
+	 * which have _PAGE_READ zero (PL <=3D PL1). Thus, the kernel
+	 * exception fault handler doesn't trigger when reading pages
+	 * that aren't user read accessible */
 	extrd,u,*=3D      \pte,_PAGE_USER_BIT+32,1,%r0
 	depdi		7,11,3,\prot
+
 	/* If we're a gateway page, drop PL2 back to zero for promotion
 	 * to kernel privilege (so we can execute the page as kernel).
 	 * Any privilege promotion page always denys read and write */

--XtWV4BlMIQdUAgvB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmh+kV4ACgkQXb/Nrl8Z
TfF71A/+LGdeleIGhIrRh/nKgjx5BdEIML2Rm4NmpZErbm3a7QDgAam+YXQiys4Y
+CZQ3X89rDa3XHS7rn50sQW8yMBiCJLmGfJhMTQs4EbkXEfU9yzIi8PsnkNouFhv
tTO9s21N2yMdFwL8GJjPrRn3qjwbFWkMh9ducoyjWWNgz/E16voOLG6kzdV0sAKf
CpotUl7j9tIWCTfTlHYVvtUstJHTkFWVPzeX2HHfVeCyc5al3VDuCMPeMg4ijDt+
MwQWN/nasjndqBR31cvCjVaXTATUs/WUiB9DNXEvX8UVsJfuSZ0AfeOLn5bNfAMC
HcO3cGA7Me52FZxZS0Cx8MOgqRiKgAdQD6lZjh7ThqqBWQ7gaZqYDXhMhxcAEgUh
tba+vsvjkt8Pz1/awr3bwXi5/B4Hq9HQhxc5Vfjcv3w0oTYJZBsvUIjBO8ALhp7l
9oi6DzGekmIwCWuErPmRIkEm65AdkAXfTwY/mSNxfHlHzkJz2CZRvmvMqn1aBeqK
IRJXtYeZsNEVkWeLAYmJBpobKPphV4mVYaYHqpv93J2mrMIzyTQZ+X4ZbjM+pjiG
/VzpmGOzDzSVquYi7nf+LI7CgfCLiXEJDDfFuNhmjDx1OF7QvJOz774gK7UH9OkZ
lzliMOqSMR4k3N5ci/tgVlZf6ifZiovipRItR7qbxmw49vvt5lU=
=8mhO
-----END PGP SIGNATURE-----

--XtWV4BlMIQdUAgvB--

