Return-Path: <linux-parisc+bounces-3808-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAA4B1217B
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 18:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAD417B150E
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 16:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4672BB17;
	Fri, 25 Jul 2025 16:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="2ozczpVo"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo002.bell.net (mta-mtl-001.bell.net [209.71.208.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54D2EF290
	for <linux-parisc@vger.kernel.org>; Fri, 25 Jul 2025 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753459944; cv=none; b=duAiok9dS6ni9V+/eDBVDijugIrR/MupAQOgvYSAlpe+vvpr79QMiYT1Wa0ODRVIvYYP96gPK+Cxq6ttb4SbUW3JK7QvVbLlMlxPGHjufb055eC0y2GDYP49hbC5M9h5n75xHsG06AYiANjsBHpizi/itgws1YkxP5rvrchUfPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753459944; c=relaxed/simple;
	bh=wSH2yiXuREj86Q7zUbkkIB4iNdZsTpZeP0s6fX+yDNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=chp1pzmF82qWHfJXUAo5/IRmwI+0MpUKF3hg1nE7zXlf5KwRMxXYBWaXqE7TadrbdePQMLr6p9IVzmevwB7ohekT1afndT9E2bf7uzcZ53i0+y1bEy9HJJLb+FVORcdO4dgLnVz2qQGfp+UW/KwAVO4NpqJXsyXgPD2+MWJT0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=2ozczpVo; arc=none smtp.client-ip=209.71.208.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753459943; 
        bh=N6X0BfM9VWj9/0Np/aw7HbCx8ncrs15qvrbhrcKmAW8=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=2ozczpVoUkcWCBymfJjkozI4NXGA46TLxMXEEER6KXQzEJQ1TFWR+zCCeEMmlJmbegFIbVfQxeoUsdwbo3xO6rPS/OQBpxJAg8D1lDS5Nua1hO+tJM9MNqvNPpbLbVv45ULw1O4QVEFllsNYM1yxENsL9zJY9dlA/FH63R8s1Q/KBjPJWWyP9f7UPwTb3mH8GPEMsTt+vdazDAadZfgIVlLjgRWGfQFnefFyLDSt7KXP3AWBGpyoLl1HgLaNh/KYBFiAsANDTV9CPHswwkOPTwalnA0rTL09alMtj/+yOGOH4elXkWjtBRnwpCezkbttjDt/1BrKSJKucback1RJPw==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687D27190085E14F
X-RazorGate-Vade: dmFkZTExr9suV6/+MFOgqs1Z2oQWazM0CnNHvyVz58zuDyM7fz9FW+5MO/EYmAdQ/OtW6NGCpSv1bmjs+l6EKYIgMegjtShwRlvntaBR8rw57l9PE+SN+Ix933f6JZbQiRtP5S4kElB7TnrWGQdBVNASp72AlG6C1It9+q3r0KMwiKd02j9qAqoAHuUtNS/JH94v2L1HhsOYOev1ez9wF64XqshS06Xi4+Q+OezJXbySa3L3sULdPvu8F7JXQwpGjXuJK0w4WCcSCXez/3AIMRQ+zyNGfUrpHhGE676SNWsiGWQouQbBwUbKEFG9chiEkXNZY9k3FaOs2325FKQXcOHvdlArPBxDSCFjtEdl5VgyzFiUq9oxr0He98DHt+fh17sUFCWwfIsXGy/FHEp+56PqKg4f9v0YSt7t1AccP7RQ3JmHnG2LPHV9r0qP5d0akaSL0IleqAuKjSIgQF9nU3wkqpD9PVyh1jCoML/lU0lMOMX7femSAhEeWqLa9NJ9CsXNORrp5RDRZ4Aets64Bg80f4BAMiBjcYqFRpQeEZqmhxFwct+ZELIi0quAhjTxFCALMuVSJoFwhSFIdKzw/FodRgOZPESjxKbyGuXkI+Amwsg/eryV3q541YRMaKNbFjND7zjXsA6uPsmu3CvgnP/iMiDSCNNXstN5hcltCiSlFWCMGw
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-mtlrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 687D27190085E14F; Fri, 25 Jul 2025 12:12:16 -0400
Date: Fri, 25 Jul 2025 12:12:14 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH v3] parisc: Revise gateway LWS calls to probe user read access
Message-ID: <aIOs3toL13kNy_to@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yxlDoHcsTanuRRRa"
Content-Disposition: inline


--yxlDoHcsTanuRRRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

parisc: Revise gateway LWS calls to probe user read access

We use load and stbys,e instructions to trigger memory reference
interruptions without writing to memory. Because of the way read
access support is implemented, read access interruptions are only
triggered at privilege levels 2 and 3. The kernel and gateway
page execute at privilege level 0, so this code never triggers
a read access interruption. Thus, it is currently possible for
user code to execute a LWS compare and swap operation at an
address that is read protected at privilege level 3.

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

--yxlDoHcsTanuRRRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmiDrNgACgkQXb/Nrl8Z
TfEX0BAAoxQ3SYpgjMHwq+H15jb51rS8ciy8nAp01laEm92tW7aA6hhnfDWFdxOV
OHBtup1H6fczKXDvWcYGERLvMOASB2y78MuONfOfgxaDqIUuA6klP3V19BNYZP9y
e4rIZg99Vccc/0+UrxQl3lAO/bnUo8oy1CP3mGT4S0taejevi+UFMWaqug528hms
jEdo+ERYZ/ByyrILMNdhAtovHa3YyHrw4e4ANsZwaeO2Bw+8KCvTkmY82gxUbEsh
OpIFYiFMkmm99E9GgCnzK+oEFE5tsIArV3KjT70UL9r3hwEnQaG47Q/9cndjoQ5i
4U4YoKImIbYAHRzenVPXkWXkTiBkdLf4HcHkYO1/1RNiJgb9JjNYCWBtxlj0kMuh
iY6fJBgqADSu1QtMcC0wUTBsPF7vfgqc5gygjpoL37VKTWhe0MbT0Mph/Jn36Zc4
hiXtaoKWWIskLQiT8b1Z9VC/BbmecMlI7cF46ONNrFT3yIkjdb4TWsIkAdI4Z6HD
b2Fjg/E+mzkd6/WyA1xCJc9oybueRhdfG3J3iO+UxrhItPWt8loXJHciGGhd+bC8
0DfKDAzCz6Nf2i0wV2P+cmymVFBXDPOqp7Qiu5Y9nDSwrknDFkD/9XLJsFUCHXm+
gRKysAtIVs1y/C74SNw60cZT/IxxMLQm8d1BBvUSt5uSzJqjwcQ=
=Toit
-----END PGP SIGNATURE-----

--yxlDoHcsTanuRRRa--

