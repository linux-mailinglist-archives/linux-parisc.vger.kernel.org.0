Return-Path: <linux-parisc+bounces-3807-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A79B12142
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 17:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F0BD1CC5BC3
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 15:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3194824677E;
	Fri, 25 Jul 2025 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="1tFg4RtF"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo001.bell.net (mta-mtl-008.bell.net [209.71.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3652B9A4
	for <linux-parisc@vger.kernel.org>; Fri, 25 Jul 2025 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753458470; cv=none; b=nbqLrqPhhHCGygFwUZV2EkubWQ6n+rGYJxfmyg4LErIWIg6FNdgsaT359XtbjmCfQU5xi5xFQoUD3cs7l32gfn8aG27nfKX7G0GPw3SEmaq8dzKeY+AR2qCYfsYt1y9RxShRiH52jt1Sou/yIyvgnhXP+bKvmZOiH2s1XASRwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753458470; c=relaxed/simple;
	bh=PXTDHUJsc3tktZe3fp/sbB3DdAjwlwBbmQnwxOI2tXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ug6/oNIVlQl/vOXJSIPVMtV3CPyAGC8nOSa14LuKJcIuHMrb6CVIjI9lRxytGNVmkTggf8jEXl3ZYlFcZoWYonDQ3bCI49Q75/fRZQrjjWkMfAdZ2KBYIuRnUnMzcR/tyjAc1Mgs8OrTxdaqE8jgp96a5gylgo9LDsLyBMC2Qrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=1tFg4RtF; arc=none smtp.client-ip=209.71.208.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753458468; 
        bh=BascKlQNxuEP20OAQxyYjTf77w0WJEWb+I1IjVwT2A8=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=1tFg4RtFd3Z9hjgQE19mOT59j+T7hTg7GcIZwdpf43jvlN2HDadID5aIDJa9ms7pn2i8BLgFN8yKTXtIqgAbPoyLi0enT57Jqr5VS++E0pLzVty04WCf7eIwhY+CNSfQl6vHqQssfvuaf7Qf/RY4Ftjp0fDi1wnpbTlftILX1siuboRHGEuhODkfMZ2iYvcacbYrc2+SneBSfFFe0/CDb0/q3lYPhmlLLfH2Y0aimKv1eYxrZ41toLUhd0gs6zxpof0YaEQq8gekJevsAY1f1B5f0LqsL//S5HsUh3zAhD+QtGdH//dAzyTvxSVb5oqK6T2VvHzdr0lx6ot09BGDzw==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687D26C200C538EE
X-RazorGate-Vade: dmFkZTGTAQwMy4l/DBNi3bxy84DM6YDDcTzhwnqvO/zJ0W26hMfNEygh6hrTr4LsVX6FLn3eyYa2SdjHmA6O4F73uoUMoDbuuXGSum1uzXM5Sh/foKoJtEsYF5BGyKjx3Ut5j9SVKgVQKH9VyTtYLOG56l4bxE9pyy7nGRG6aXAFHkiBvwaI2nOovdXWbkrBE5yeOtPcZ4svyEzdFnrtHiD7kyHPTFZxw1/YX3EV84/nOXetFSrfnjUh0rzJBp8igAAIs/8ayqJCr0QeT7nvaF/XwAJbXr9MjguNr1jLLWYM8uyWzlnH7JrZNtsEiWWalL6S/yFldf3pvyg3YrAtxv7IhybXh5r0fdJuwSAc5Yj2eNw/VGuABB9K4onv8WH8cgXYDvkNTdst9ZLckqp/OVgQiko0oCHba78GuoOqZltSKvZ1yCUYg9WhhK/OuOgzqM13LKOtORbqAnveSUO3JMwzS5cCqV+KFRiqNOVta1WFBKFjaY66U5vGCDzuiBX2kFs54Bs+ve8/gV8DmddNnslEZ5yqjs1eyVDogI5VHGBRDfHTwackG9fPo9+oBLVfPvYJIIVg5YlMpvKQ3Bac7Fr0ChPZJDq/zEhh736+RSJlWKhmXJH1u3z4C25QX7SHadb5bCkzW2oAueHU+iA2UO+w04NJQhjzYY8VDErbg2z1WfFGxg
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-mtlrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 687D26C200C538EE; Fri, 25 Jul 2025 11:47:40 -0400
Date: Fri, 25 Jul 2025 11:47:39 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH v2] parisc: Revise gateway LWS calls to probe user read access
Message-ID: <aIOnG0l0VFFwywTr@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ljK4ySshoX8ZWphK"
Content-Disposition: inline


--ljK4ySshoX8ZWphK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Updated commit message in this version.

Dave
---

parisc: Revise gateway LWS calls to probe user read access

We use load and stbys,e instructions to trigger memory reference
interruptions without writing to memory. Because of the way read
access support is implemented, read access interruptions are only
triggered at privilege levels 2 and 3. The kernel and gateway
page execute at privilege level 0, so this code never triggers
a read access interruption. Thus, it currently possible for user
code to execute a LWS compare and swap operation at an address
that is read protected at privilege level 3.

Fix this by probing read access rights at privilege level 3 and
branching to lws_fault if access isn't allowed.

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

--ljK4ySshoX8ZWphK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmiDpxIACgkQXb/Nrl8Z
TfEQXQ//eSO8DKm7D1igW4UYc9j/4VtGaAsjC8ucr/P1OTIczbNmUzxylD9RiF2h
IX7jiSpVbd6K7os4yQseialTwnQATkavREKbhafdEjMaYiAAuTCvw5aOErGNMFMU
MQselehmTb3w/0g9+/hyBDFbv12PscoKSKLhwE89qS/ZWi7lTGDk+78y+SgLU8o3
v+XRhWW/irG10mznc3JkaHGBDBAE6bJfxa0seeIaYi1jv98Mvwvqtg73457Rzo2s
64mjg8QUudL9rfgeBDqFK7pc/Woa/Q6ZWMeUvm31anF67/3hD/Y0YrtVgui85gQy
YrhGCYF1zWxwvzus1YJI4y31pMbcgQ/C2ZP0Fc3u2VtcIe7s1+K5vtjRGjRb+9wG
8if5pOCv7JgBrn7DGKQwdeYjahUyS39y+09Cl1mB/Tni2TgOCaJ+8MBF1D8X8sor
OeOUIx1HJ7vI9KK2p6/oK6MiaiCLw6GLRflFAdzbP5pTVT4103coQYDEeqBmI9pJ
JSPKXso6omRXSQtsvL9v+j1dMaivlsAgpyEndaIB8QU7PlYUF5MiCvDc4j5UG9IK
xR0vGwDZC6qeN9w3m7njVJ81QoaLzqMnDyWyr4HA7oRNSd80+YyakKIHb23I2s/f
upRYljvkOm9c+TF297JzAQhhVAcG26qmRMGJXwXp1ryqx7Uk9Bs=
=0ZvN
-----END PGP SIGNATURE-----

--ljK4ySshoX8ZWphK--

