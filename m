Return-Path: <linux-parisc+bounces-3797-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8266B0CB28
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 21:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFBDE177793
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 19:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC861DACA7;
	Mon, 21 Jul 2025 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="sdazm3ux"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo002.bell.net (mta-mtl-008.bell.net [209.71.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99D1BD035
	for <linux-parisc@vger.kernel.org>; Mon, 21 Jul 2025 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753127337; cv=none; b=YjqqtLqxsE2pnGHMaGQ23AMw8XMhWdMSOrxJLyHeI4hxhIV3jnFfyEMLSD9CuUVJUBOzgtf4qTab1qBtn/YosjP4YNeQazbJ9gmVrtHIa6LdeXlLRlGq1h6PkYdtXJGv4Y0DEV6MSjhP80mLK/6qLSRRk45Lk14okinhpFuZWsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753127337; c=relaxed/simple;
	bh=gluuCpkgs0wHKFe+oHvNXZue5zkgx1MxSpFdppvpLnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBG1wKq2LbjoBwAy4bPgSI7S3Z2GwV+fmxy6bszlIIK/sYfA73P8h4lneU1fI+C3disLG6HlvEQNSEqvHoNQYKw0jtjWbMGZ3LA1MbI41SxavykU9UTGGezxIM+XHZun8ksIxYrt7yilZXcNvJf0FiEfUVMG0BSb9BlMoGk0M98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=sdazm3ux; arc=none smtp.client-ip=209.71.208.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753127335; 
        bh=lxzzav6wj70djHoceYAEjm1lT3vXjNC7+8PwmkvV6m4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=sdazm3uxI6Eb6kF1guFU9ygxSuZP+NDLaVW5uspBy3rMPKFXSAjtgBQizpFQwA4CnqGVbFzMLlzplCspq/+f1ILbcCGtAWgZMAtdf5GAMnc6FsVETHzd7x/y7Mlvxj1WHwgFZPqHfKirjmInR7oMe+45Od7GCy7X3i7zbYjBe4qCdU6/fO2xX+++Ib1igR/HE4wN1Jm6olj4z0NiJUYvKLn1tIKk9pFUZsLik3Nn2L7yqBwiV/vVxTjAOlwcO5xhdiGoDZo9PTB7S4SiaYJ5J0UzqZGUgApd7fmAnpuiyv+Hw7WY/UjsYqAYTQQvXpFDruIomn9eJwhWFZoCE9KPZQ==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687D27190025D39E
X-RazorGate-Vade: dmFkZTFAscgNekQCHdx2kLRupb2iGQ27EbhgukPJHdS6NSooZfeZxt5G1b2RaVj6MWRXze6/ulaKcA/wCDRaDafWF8yQZprmwIV1VvSF/4ivQIwqlu6LQ8jaDudFcFCENJtxV41FAVTJabH3XzjAggJCarLYnFdgF6y4k6jgd+gQFwAFDV35EOBM9NvNoobLwVOHsuGeND/IvUzHWVVMWF0s42aRjNtOVGCxO4DIKP0gJnH0xwtOA7Bg+3wcyU68CobbefIJUZRXFj/vFjL0QxFZ0WKXB0EadqPET86AtadHHn/bUmZmRaq5jnJSTJ23tk0QsWB0eOt1thcP6w2YuMQ14X/UWmTUdPWFl4TqTuSOIlwIQbIxLgcFbHwU9B9yzSIzBkA0CrdN93LK/QYg0qf2QLbj7UHepwdlDvTnlYdlhcSy3OGXvvVj/4e6uLpDv5BNvXkG8XkhOd22Rf9/+eNDjD0nH5kfd2JqjN4Le6aIeASJUVVcvquBelvQoStxV+OuC7kFe+/X91UvA3KHfrWa6Ss86Ki8fp2CepDfZQws4/bvxk1Q4cAhr9Udp3UT1WiVyWESm3BDZVBxLLu39wHFRtWxRQN1bXL9kmBNCXy05+f5gAhPWp/PSezr2pcaeBQ7ZEo9cu91vdWAaRUjL589yLJOKwbqllFdaXTnz7O9blKT5A
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-mtlrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 687D27190025D39E; Mon, 21 Jul 2025 15:46:06 -0400
Date: Mon, 21 Jul 2025 15:46:05 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: parisc: Revise __get_user() to probe user read access
Message-ID: <aH6Y_adQjjcwIhYI@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xCvmFzm8V1tmmreV"
Content-Disposition: inline


--xCvmFzm8V1tmmreV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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

--xCvmFzm8V1tmmreV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmh+mPwACgkQXb/Nrl8Z
TfF5HQ//fYi7UQoaREDO2e7WL5vjf2rcrnOycHaC9/VcuyRQpI5/9xOPqSn37Doj
0qNa4ujdfwW9wPO3ajyQ+q4UE16H3cdyvbQp4tGcaeq9z90tUqVGIV3mBoM+J9tv
omWOr1hZq5/NcuND1aKAEizd1Qzu+TPKCNjfqaCcaHJ4XKLMh6SnT0X3WV8zZI60
XgGjCWSIbfxnD/IzaOPHviOQbhCfuVuHTRNfRZ/hnwtK7VFISsdS41UNWZibkbMN
7Jv6kvG7Xpe+YPu1+YlVqlA7E33LyrEop1iSz1X4A7Bdng8sHZjjCqjgD6G+KSpy
YnReqwIpnHCa4TZI66hf513WvU6XHOViJUFvfialkboAv00TR65E24TssPqWuS2x
Q7p7VFbZXkcXQgWJKFuLh+iGtJlUA6g0m1gnVwc11Nd3Cf6dpiXzKQTCnD5e+Ktd
hlPFIlBKe3tN1wdDpnDSHRr9weDFv5s1lSyAGmtLiuTO5vvhCMiOouoGtbvjAZP1
pAwsOfOn+Uwfo+q+BK6q8bRWWaK2uwIjHxa3wy8UblGXwf/TPIGok7Ya/pqOcZ0q
G8JSuqJGBxhvjamSvgaZHOHnm5AItF/LIutjEnsF0VO96dFzAzR2IaVVqoU0h+DB
/JRDmZXSM8v2lAZBXm8J6ZY9uSwBA5b43O0RHHpQoqJAv/p57hc=
=o8wy
-----END PGP SIGNATURE-----

--xCvmFzm8V1tmmreV--

