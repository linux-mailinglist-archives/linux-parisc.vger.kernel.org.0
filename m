Return-Path: <linux-parisc+bounces-3799-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF81B0CB53
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 22:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 728E27A7CC0
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 20:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD2C18858C;
	Mon, 21 Jul 2025 20:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="smvVRQ1x"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-001.bell.net [209.71.212.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A852FEAC6
	for <linux-parisc@vger.kernel.org>; Mon, 21 Jul 2025 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753128386; cv=none; b=mWqjqhSyk683SK/10dc+J+opxYm5evohYUYNUJfPqV9+VoFXVJBhGtr0y+oJfEloQqxytXmM/AkM2UIRR+hEBpkT8YG5qBdzE3zxFEeuK8tqwdlay1wjGSiTe0FQBPFeM9wLFczuLjJSfpw/CuQUVO5mdH+08bkoS+oJu00jBPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753128386; c=relaxed/simple;
	bh=YYuzZi1uToWIxD2wn20Eaa0B392aMc93vuRwJ8NLuYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZxqGdspdPg/Rk0JUvkgXS6U/TonFMJ5eRwCKKeIiAZulyKSHds/MNsHt+0SvsLnirkspM4JTA9TIiiXLUXf9ASy0bw1kE812tCE7+rNWEkLH4pugqPHCr7YTB3AmryFWchQ4AULk9NK9nTIsp4JIjAvsS0VUSMMML2Pah58i3Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=smvVRQ1x; arc=none smtp.client-ip=209.71.212.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753128384; 
        bh=Jf+euRAwF2mELsSAOKpfCqzWGxu5fI+868nX4K4zzKg=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=smvVRQ1x/Vh8pz2EUc7jZD2KmcDQLUdbMnK3gJ2gKSj+CQdkWCuwpXHZtXbYRDgVRvXMyJC3Or4yGMz5fxlXZklVOrwmh8anHN4MsnIJ5nh6EGrrquyvG7Lzl9QVmPxxIuHiccxacWdfnjhEoRAKRoIl4VUq3sVgNvSPJ2S8tOp0KbayFrqj+f07Qjg9LgKoNpnn0O8C/lLV7JXDAfGAbfq19+9gHWLe6nhZoHcbwB8gLcT1kdcuE0LpaVDsYB4HhCekSjog4UURAYzUFfX1UcZaznWfm/ipuHMBfOIqLkkNZFnT0Peiuhjc/h8k4x50c7ruzH8OYIjiOA/sPaCgjA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687A6B9A00662B42
X-RazorGate-Vade: dmFkZTFVRT3LQ87jrghPBSFb4zX/qDCBjZdpAz/DmIz3wz3RkN0sYrVizs7T4+siT/BPStpe0WsXOjBgaVovoyfaT2ZzMYOdhxRPOzVewQtAFSR//dC4CRbCxE7s7cawZoZQm7EywedVLqONHekkMUHRKOzzsl5m6Vg3qzMVJfuaegVlOkNCRgqtES4GP8jspOluTLe5icFlZ4MwiIKg+rLcLE/HEguBM9ykRa7fwUIXfa7k8ku8HDiZcmwsFqszSI890tLn4qcxZJUzoTY2sLhqhHa1gpqXT2JnleZib4k1iHHmjuSen3X6D6CyDmajJYVByrDNoR8COlkQkFLd82e4IcLdMyHyAVPIiEETuoN6nR0BO873QLWnBTfOlhpEmJFO6uuh/aIsmjxA7lN1GrXwh3m4QuMlCWquZp+yMwF5e1QUvvEkhpb513mfbP0iRvtn6yk/3r1k3sUqucAFjiAIP8t8uNalmD+jxvP3o0om+2WxHEJ4yk2aliicj0hFCUKdPXJ2FlaWyPjWktsixbLWee2y1oqA5sJT/5hNXGM/aJejBXuO2/r4TAvnLTVXbL94M5sb3fiLjSob8LlLF2PvV6VBH0qn4o98DPmx8PTcwZzA1VaYd3TWht3/w5+PsrEmDOyjypUkAHamC88hQlaYIyQlfcxF3xISAqCwFNxup+MjGg
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 687A6B9A00662B42; Mon, 21 Jul 2025 16:06:23 -0400
Date: Mon, 21 Jul 2025 16:06:21 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Define and use set_pte_at()
Message-ID: <aH6dvehyIrz0lggg@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="27mrPYFxXsYjvJXo"
Content-Disposition: inline


--27mrPYFxXsYjvJXo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

parisc: Define and use set_pte_at()

When a PTE is changed, we need to flush the PTE. set_pte_at()
was lost in the folio update. PA-RISC version is the same as
the generic version.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pg=
table.h
index 1a86a4370b29..2c139a4dbf4b 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -276,7 +276,7 @@ extern unsigned long *empty_zero_page;
 #define pte_none(x)     (pte_val(x) =3D=3D 0)
 #define pte_present(x)	(pte_val(x) & _PAGE_PRESENT)
 #define pte_user(x)	(pte_val(x) & _PAGE_USER)
-#define pte_clear(mm, addr, xp)  set_pte(xp, __pte(0))
+#define pte_clear(mm, addr, xp) set_pte_at((mm), (addr), (xp), __pte(0))
=20
 #define pmd_flag(x)	(pmd_val(x) & PxD_FLAG_MASK)
 #define pmd_address(x)	((unsigned long)(pmd_val(x) &~ PxD_FLAG_MASK) << Px=
D_VALUE_SHIFT)
@@ -392,6 +392,7 @@ static inline void set_ptes(struct mm_struct *mm, unsig=
ned long addr,
 	}
 }
 #define set_ptes set_ptes
+#define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
=20
 /* Used for deferring calls to flush_dcache_page() */
=20
@@ -456,7 +457,7 @@ static inline int ptep_test_and_clear_young(struct vm_a=
rea_struct *vma, unsigned
 	if (!pte_young(pte)) {
 		return 0;
 	}
-	set_pte(ptep, pte_mkold(pte));
+	set_pte_at(vma->vm_mm, addr, ptep, pte_mkold(pte));
 	return 1;
 }
=20
@@ -466,7 +467,7 @@ pte_t ptep_clear_flush(struct vm_area_struct *vma, unsi=
gned long addr, pte_t *pt
 struct mm_struct;
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long =
addr, pte_t *ptep)
 {
-	set_pte(ptep, pte_wrprotect(*ptep));
+	set_pte_at(mm, addr, ptep, pte_wrprotect(*ptep));
 }
=20
 #define pte_same(A,B)	(pte_val(A) =3D=3D pte_val(B))

--27mrPYFxXsYjvJXo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmh+nbYACgkQXb/Nrl8Z
TfFWFQ/7BlmMAODD2MP2K7DwSbduFvLJOx9/r0VCPAxI9XvqoAvy5mQqcbBvn2cV
EsuAcwYOLS6G2mX8czGjb51Q36c14tQGC/L/f0FCF9boX4QUmQFeyp/PyC6/lyJx
vJim2dKhctYjghmXqqiwb6YKjBBqH28D+fnPLpWEe21XvGOSzBGcBkoWoHWK+GwY
c4B/ZQZ6BDpNT7rRZREgk9jdURWTBx1W/yFmbNWm7q7xF7S5HPuw/s6+gBwf00CM
tK4MX0CopkqIfFeLF6HXKkCs0Wz2+5GnYEvERhQ0mOXm1vG2VA9fxiWjDVxTJWfN
CPhVBptqKO1xPetI+A9gDUXytQD+tnnejb8NWUyMiV7GzxrtUf4538Enr1cx3Pm3
tIzhWLiP0YL+MyEV+9eLgJATZOb7Man0Pes5nHFjV/B3NGkU49wYjsFa7wCbf6+q
FgGzcZ8kbsjH2RfhNBL+/r1h+m0pjjapbpC4PZjc0ru58sg/9yZNZO3WMds8hbHk
RszTDkLc3tZnHU90QjVXESPCUBgh59DQpOssShTPTlaPgCiOz6/qwDxmy/yz5sgX
Zq0/zuZWH9erjApSelH/NDjzbmJcFOfEhuZqh6PuhnskS5GMOpSnVl68pCo+w3ZJ
DLOPryCRIxOf9EwLQ06gVlz0s+ia7A84mc7U7AKu6nZHhznUFMM=
=Hbcj
-----END PGP SIGNATURE-----

--27mrPYFxXsYjvJXo--

