Return-Path: <linux-parisc+bounces-3806-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED153B1107F
	for <lists+linux-parisc@lfdr.de>; Thu, 24 Jul 2025 19:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED3A11CC7C5D
	for <lists+linux-parisc@lfdr.de>; Thu, 24 Jul 2025 17:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EECA1F8937;
	Thu, 24 Jul 2025 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="LFg6NtxP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-007.bell.net [209.71.212.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D41B4F0A
	for <linux-parisc@vger.kernel.org>; Thu, 24 Jul 2025 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753379270; cv=none; b=eGGY1UeZUXkBmr7lavstM/LT3Xe6a2+7x3UX45SHQYk0KefB5thV+cHrK8TN92sQpCjoLSx/FBPMvCeMfb8PURie04E108uNtT8iMD2NgSLVGx0VXSBNu3kRA64QWxvoq8NA1Xwpu97R9BLlGh1Fyz2OmI0qC7PB5upcwyZRKHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753379270; c=relaxed/simple;
	bh=Nuet/B3U+mXWZI2AVwNuuRUfYwLB6B45PLZ0R6XkhY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=te5tBeJPdFcr66WV9w8tVV3CzbYh5JpxvDrRNv7fFXqAYbv70b/7eD8E6mRSHlCgRyiiaSmOzLpiKf2lcxBbP/uP4+WQfOf0Nyz0EIB70n7H9gOWES7YtZHw1ugh+cv0BHtfjeU3z8b4EAjJqcr9+mjkKEdxvrZk9tVJXjfzbeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=LFg6NtxP; arc=none smtp.client-ip=209.71.212.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753379268; 
        bh=+FEsRSyGMYthJOZLrAJaGb39uPq8NRbnkr02cm7hBDs=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=LFg6NtxPDaNenP8C+DBMePzE6DuLcqo17jr4Ea6di0OzU/XaK++KRXSpNEGsqSklXLFSax7PjasU/6Qn1eUMA2MlnHV5NwRSHM7wxSoqOAdf0hDYyYd7enmQeEdqKH4xzYGIF9ywmlUECw0geY8U4CR11NbuomBbjKkKJCLeEBmFVAZz89EXgIGlhVflRx14XTrlaHA6bKbC0PPQcrfP5rPjCO+6m0VH0NfIQnyJU00Vy1Ih90kDGU2AoDu4bOtOkZX2KQYCnrsxHaZ4Hy0i0RMSqp9D1u9A3rE07GViEhqND4ZS+ZAW7gDbMmORhh9qt5azhsEO++Uogj6NUP+81w==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687F0CD1004D9A98
X-RazorGate-Vade: dmFkZTEPk6KrHgLClv+wLwp3FDTHU3E5vPLX2epMVhJRWjIS6NsBQ6UUgx9wJmlzGpgJBZThRUElLwTwcPLPlE8AtPKgY+abHjCOtvZNhSKdhBTJtBX0c3sTmaIAKRvN04pika/IzDcKGi/Lrgu5SCaovRo5O1ghm0QzxDeUWa9GelVagMXI+hm1vX9fEyIzpZI8yPo2p5cwaN6YLC7q8hx90c+zgTaEt+mhs+3OF5wYsMawzAoVxAVBxS/bncfnYhoLMcHobH7GB5D7SUfqTD4h17QIsjflroSpj0mmALOqXjul9HTPMuam99siPr1OorbQKht2cowUgloBG3D0ig7n2DCMRpag67LaAcjLq7jjow4LMk+Y7LU6VTd+nlx9Ny1N6rzKTMLuKSh+tbrHDCBMMXBITamjzq6jdIzMl+17Vfn6r4lY5xLphJ+SFhDiH4/om5Ia2KJOrKx6hpP/v5Jn4RDRuiEFH0qmXBR9as8C7pDIOWJl8IIVYncbnqTzVeO7zOI+YCU4mUDCTZkzDHF/jCxFmvbwFs6V/1uTRfB4eXrk7XoWHwijg7TKwawgJLuQkBNCJQ/MqERqMO2hQSt10+5vOXN/Bp1CUkT5lu+djCIn1UHgnwJHVmoxDFG/AMbDXSwhmSrsJW4DNQOPw/xpkALdEmfveH+h/lnZ6M+wNoskcQ
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 687F0CD1004D9A98; Thu, 24 Jul 2025 13:47:41 -0400
Date: Thu, 24 Jul 2025 13:47:40 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: {PATCH] parisc: Revise gateway LWS calls to probe user read access
Message-ID: <aIJxvJMDzv-UE9gv@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O9NmRe+AfKyq0A5I"
Content-Disposition: inline


--O9NmRe+AfKyq0A5I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

parisc: Revise gateway LWS calls to probe user read access

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 0fa81bf1466b..4a9d7a08ecf9 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -613,6 +613,9 @@ lws_compare_and_swap32:
 lws_compare_and_swap:
 	/* Trigger memory reference interruptions without writing to memory */
 1:	ldw	0(%r26), %r28
+	proberi	(%r26), 3, %r28
+	comb,=3D,n	%r28, %r0, lws_fault /* backwards, likely not taken */
+	nop
 2:	stbys,e	%r0, 0(%r26)
=20
 	/* Calculate 8-bit hash index from virtual address */
@@ -767,6 +770,9 @@ cas2_lock_start:
 	copy	%r26, %r28
 	depi_safe	0, 31, 2, %r28
 10:	ldw	0(%r28), %r1
+	proberi	(%r28), 3, %r1
+	comb,=3D,n	%r1, %r0, lws_fault /* backwards, likely not taken */
+	nop
 11:	stbys,e	%r0, 0(%r28)
=20
 	/* Calculate 8-bit hash index from virtual address */
@@ -951,41 +957,47 @@ atomic_xchg_begin:
=20
 	/* 8-bit exchange */
 1:	ldb	0(%r24), %r20
+	proberi	(%r24), 3, %r20
+	comb,=3D,n	%r20, %r0, lws_fault /* backwards, likely not taken */
+	nop
 	copy	%r23, %r20
 	depi_safe	0, 31, 2, %r20
 	b	atomic_xchg_start
 2:	stbys,e	%r0, 0(%r20)
-	nop
-	nop
-	nop
=20
 	/* 16-bit exchange */
 3:	ldh	0(%r24), %r20
+	proberi	(%r24), 3, %r20
+	comb,=3D,n	%r20, %r0, lws_fault /* backwards, likely not taken */
+	nop
 	copy	%r23, %r20
 	depi_safe	0, 31, 2, %r20
 	b	atomic_xchg_start
 4:	stbys,e	%r0, 0(%r20)
-	nop
-	nop
-	nop
=20
 	/* 32-bit exchange */
 5:	ldw	0(%r24), %r20
+	proberi	(%r24), 3, %r20
+	comb,=3D,n	%r20, %r0, lws_fault /* backwards, likely not taken */
+	nop
 	b	atomic_xchg_start
 6:	stbys,e	%r0, 0(%r23)
 	nop
 	nop
-	nop
-	nop
-	nop
=20
 	/* 64-bit exchange */
 #ifdef CONFIG_64BIT
 7:	ldd	0(%r24), %r20
+	proberi	(%r24), 3, %r20
+	comb,=3D,n	%r20, %r0, lws_fault /* backwards, likely not taken */
+	nop
 8:	stdby,e	%r0, 0(%r23)
 #else
 7:	ldw	0(%r24), %r20
 8:	ldw	4(%r24), %r20
+	proberi	(%r24), 3, %r20
+	comb,=3D,n	%r20, %r0, lws_fault /* backwards, likely not taken */
+	nop
 	copy	%r23, %r20
 	depi_safe	0, 31, 2, %r20
 9:	stbys,e	%r0, 0(%r20)

--O9NmRe+AfKyq0A5I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmiCcbQACgkQXb/Nrl8Z
TfFLdxAAlQ0GhjiJ/EE7no91Y3dLKuXvrVM6BvpmA3EwVLJ/7Ru7BgaqE6jQl5JG
wCgveDWWNHHGP7mZ5FMaaw0gu5pAwqb4T/tqd1nsemFOD2ZGBRDUN8v/iytqrESY
dK3EJBtF0krzEuTCyTG9DktU/1mt6rzAPs6J7qFCHJNfn1MUZ/MwXmASNNrqRj24
5hBzwewm09loffbRhjKmPlPcT/jXb5W4RmOLqRyHgGugtJfVzzjAu7zxH1dHd4zV
SEax9dLjq/tXaGHZFyWAxBwE79B65EHS49NdMroVj0VOFB6hY+SKou/QoUWnYfHs
9q27/5SGySvUyV6ZMK1jE9c69kx55M0iaOhVXco9SQqrJ8Js94p5U1aEWGCd3Bkg
juexirlYYusJLy1JY2IPpJcJSlE6pMmtJpXxB/EzD7+LNFoo59MEccZ3gdJdLTIp
Vkb26kR0AdMeqJLNUC/j1bK1Eq6ZCdItdWanbM4ZcrW2A4Z7c4+lrUgxdu0/ZJ8K
J+BzKmwsBIvyTR7hO1vYY6N01FvV3dNBWTrmfCVul9JLuog24vhBSd2EQzkAxwuA
eN/gVfcOV4LdjewIRh4foOneWrTCw9PQDABiT4zDt268Up365B2pC6zmqhWr+7qh
Tw3k6o+kz8BnNfsKMqJd5wZGC38BZuFZZszQQ1aQH2rOcsujG8Y=
=CByQ
-----END PGP SIGNATURE-----

--O9NmRe+AfKyq0A5I--

