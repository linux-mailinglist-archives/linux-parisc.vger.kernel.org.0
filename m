Return-Path: <linux-parisc+bounces-3802-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB396B0CBBA
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 22:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 064567B0885
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 20:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5346227E8F;
	Mon, 21 Jul 2025 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="SKMKwMH4"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo002.bell.net (mta-mtl-005.bell.net [209.71.208.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B645219CC28
	for <linux-parisc@vger.kernel.org>; Mon, 21 Jul 2025 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753129309; cv=none; b=h7qw7BXUQSQ3x6QoZkhbU85eF/tK5K5M7BzPWX5P40rYNZSaz4dOwZKlKJnmLATMBbuanNpz0kmrUOePSa6MIZoSl/WekI8tjU/8Jg+h+HeSQS6c8BbIk4c943oGC0AD6SI78lEvet90L1fSrU3bFeol8p39hyrZVeibmLRh+qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753129309; c=relaxed/simple;
	bh=5KbcHrTGoqy4d3ZLXf3W/udwUHeVSa+XBKUJjoiFYWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ka5PzIar+NGAvfiBVMrLfjPfG4oG1DgxYcs8hk5vUzSpd+CaURcwLxFKBOwqHiTKD9ZgTN37NgzQ0WOi5qNLlqhREB3VQafRAyyqeMPgIyH5cinw8he9/xwm2DVS973+dOth+3dmQdRJl3sVZrYUayM/f7mcAKx5K/ShmJXXciA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=SKMKwMH4; arc=none smtp.client-ip=209.71.208.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753129307; 
        bh=UIpn/xhk6FKdH5HaqlpZB+NM7b/3q4bpcXiDsuVCm1E=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=SKMKwMH4Z6YNIrgg/Rx5tJ5l7hD+30J35JLdL5FcqY4NLifn0HKMfnUKMosUNqsQSzjnwuxO0zSY35a2p2QmmiFAep0NKlFR7cQxUzLkstqJsWhbIa8Zud1CegVzOFw2zLtrJHKgWnwq3HZQG23UI1ivJVHi6IyMFXjhiJ5HZ9XtxnYNj2ejJnQq+79pm4ABA3b6/SIdg2jQqM3JgCK/UqYYUNL3L9W8GmXwsuMQo2IfFARQOPWuJoP2VIsfMa6VWtqaVcNsMnR9gF8Fk/FRMvXn4E8FupgdmYlFR5W343M1etcP+YPYqg/P3vCnqoMJjyr9U6UwrqLF2R8aK9Z5jQ==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687D27190026A68B
X-RazorGate-Vade: dmFkZTF4TqCwc/8XNu/fS1yKiGfTZp9mJrv/1Q1jMAxfwlpMJv9yHciL+7IjHzvCwsGlSQQq4qslPCAMXFxyVqLGe6MssosBlzo00a4s1RD0zYmlrHb7a29QjsHsBjUDElr+SaVn4AKiY9gl6dQWE349I06SavEsavyrRqzFEbS6n0RnertK6glS1MovKu/EymasG/y/vpG87UCW+dUAtZk2L9ocDmpDEK6g6LOa6hPq/cFFjjelcNqKCg7MXyXNFhBTH9oR87C8edLdiPHVCk30gxtJdAbf/drTnWtTmo8U3ZmaxVKq5lwz79Fgce2pE5d5m2di3vXhhs76JlIi/GhH/AdQNd5cxoMA0ym6Di0sD/RxbsrJ23KxmndEvrDkz8zZMIjSI83MqNdjNgg1lWRjJMD4hQI/D49DLcizO5tmpPnbTkumt4FeeUVj1kWA8v5ckH7iJRBTF90pPxQJScO8/gYGKqqm76AP/3JTNcGa9tADnHwamhvxVRxULM9/TN767fhhB9SuUzUOiC1QwgSQ571y0nJhNK7Nzq73PH2dk2E4FSG+3j3xjUsrDncQeqq//PAu62sS4InE/9rrPIEYPlcipe54+qj7Z/kRU2n3AraL1ov9FiNfmOrTkTK2eu34IAdBemFEZG9ffrSWqARKs0Wbf9bVx+QQE5WQPgF4q8LSpw
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-mtlrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 687D27190026A68B; Mon, 21 Jul 2025 16:21:46 -0400
Date: Mon, 21 Jul 2025 16:21:45 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Revise __get_user() to probe user read access
Message-ID: <aH6hWUwJnN43a02u@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ANu+9gB1uli0jy6+"
Content-Disposition: inline


--ANu+9gB1uli0jy6+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Resend for patchworks.

parisc: Revise __get_user() to probe user read access

This change adds __probe_user_internal() define to probe user read access.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/ua=
ccess.h
index 88d0ae5769dd..6fabf38eae64 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -42,9 +42,25 @@
 	__gu_err;					\
 })
=20
-#define __get_user(val, ptr)				\
-({							\
-	__get_user_internal(SR_USER, val, ptr);	\
+#define __probe_user_internal(sr, error, ptr)			\
+({								\
+	__asm__("\tproberi (%%sr%1,%2),3,%0\n"			\
+		"\tcmpiclr,=3D 1,%0,%0\n"				\
+		"\tldi -14,%0\n"				\
+		: "=3Dr"(error)					\
+		: "i"(sr), "r"(ptr));				\
+								\
+	error;							\
+})
+
+#define __get_user(val, ptr)					\
+({								\
+	register long __gu_err;					\
+								\
+	__gu_err =3D __get_user_internal(SR_USER, val, ptr);	\
+	if (likely(!__gu_err))					\
+		__probe_user_internal(SR_USER, __gu_err, ptr);	\
+	__gu_err;						\
 })
=20
 #define __get_user_asm(sr, val, ldx, ptr)		\

--ANu+9gB1uli0jy6+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmh+oVgACgkQXb/Nrl8Z
TfGaQBAArZUVATI4vY2DxHJcWlQRvfbgoM1t3qRzC4yf+IULpTeq1kQaYSMZkKLU
HYtCdyGobEX298q8ljp/QeFJmzGSHrGrgB69QZ2IIXCJAM4stw0osSzJDszHQGOX
xhzG7oYr9BZmE0gPJZd36MKtbCIACki813yaJsDyPxR+pjM7SK/ih2WTbwHQe2NJ
dacqQ9unNzpr46jQBsQiMDZkjomVq8LxmBmZPNUJthLtoHdb5hSM1kGFGMB7E51s
bj0OQzmg0vzzRhBlOA+uDzolfYtlr5YnE2O/cNtIOwjyh11eCahL8pMSUefKBB5f
SwAQBbVY38sRMRkTvpjxOrxMi73bYVlw5iB5WWHDKAAwEwbrY2Mg8o362v3mmzRG
8ZlLb4uRAKWvicpNbf592LY+nUIOF1SebGv4GqZIHV9/yyfIx6NB0m+gIKb4IHhN
SQTH5n8W3VkDFlYHK2Rr5tjOmMbndl0jfbGtX5xNVY6jS3skBFiX6HJ2oQGInUEE
52G5bjqDSgBySgM2dU4kf+y+2LjcBVFdggZp9jV0vVQifFlEbH6BWRwMk83NEnGI
tuab4wfptMA1MS147ZCNx01jypzvHCRBPCf5FbMHW5TOdDj8DCTnIXMGR4iMtnYu
q2gJE1JrONTfA3RA1Zqd5nW5Md/UtASwsmlWgDIIelw1/C3R5CY=
=sodK
-----END PGP SIGNATURE-----

--ANu+9gB1uli0jy6+--

