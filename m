Return-Path: <linux-parisc+bounces-3809-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B3B12345
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 19:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB9B3AE75F
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 17:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4F4246764;
	Fri, 25 Jul 2025 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="W1ghMhyy"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo001.bell.net (mta-mtl-003.bell.net [209.71.208.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170051E1DEC
	for <linux-parisc@vger.kernel.org>; Fri, 25 Jul 2025 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753465903; cv=none; b=K3H/KLDaXDcpSJhYK05dg70q3oNJjLWW8mnzmSd8HMLUfRXoAsN+Qc8ZtHfkNMkrV4lmA798yNbeA02aeO1AflF4+Bcd4oJgv9TBZh5QL0CiVYKYn6GKgLROYWV6RgTL4YV2X5ivDMyn1a9pCwlP0Mfy2MRr3Guq6ed3affkO3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753465903; c=relaxed/simple;
	bh=qXCSNoNhe54UCsqkBPP3r/blPYW7sdYN5c92qItpklY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPGrua9Z4KJAJINOhfm2HHKDuJ8FxPIMMq01Yn0+Ul/keA8b8tf616F+WRUYh93eihH6w088l6UV3yA/X8VWQ4glIsjcSwbHuV/0/o3EY/aFsQJDSxHq1q8x0ls9T7JFrVP6ZacYtSGeGhTwn8hPSdKt44PDk3rbERoIrqsPsDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=W1ghMhyy; arc=none smtp.client-ip=209.71.208.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753465901; 
        bh=VP0Zs198A/u4U2dQRPGGlqD4Wgu6diSiXkfHHxuFoPU=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=W1ghMhyy/7XIsB9b+jw54apoMHwOGKYawtPIhocaTnI/60AIpjdbbbcCdr93XYDmXIfy/98z0QfHJbYi7G7lnjMueZRDVc1OH65jiBpRUG1psDsLYcpw2ZCMI55JNYwzjWRo/1jUzivy5iAaABddFIrqaAqT1mjDZXwM1XZUhHaJ5EcH1fWs4BDo/uPov8s7uzdy9yca2A0Nu2RJQa6se3XzK6G7rDJrQGHXPojTLLBFjUvhFQmqhGKQ0mH+zu4nPR6ruEVtwIL5JDQYBWOC/3iAWda5bbAiTxqsF0cdYgiLsFXvc9lxtt7oMIEFSNouG/gAbIJSpmh86JMp4NpLYg==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687D26C200C9A557
X-RazorGate-Vade: dmFkZTEcroA5skHw28rNQ1XgxNpuqgtwQFEfja9Pasw2XiP0SnrGdZip1MQPlOtxjqXATlxVTYAkMo6prBy/pd+xR1eUNwiY0/yqTXPW/V4tTJwvw8F4WIWh28CyUOpI8u7awx3rZDqDdutqpeGI10aFwIL44D6zBApGalwkSgzcqUaNTOI6JrWrowgfnt4v1C9XhX/H72VfG1fBcRuG+NPBDl+U39SyogfWPVlYAWEzWmapoUYky3jDzzvGJNC6gHEjcIdGUCtyWLunc3XVVS+ZFcVsfB+f3Eq5Wyj8bkHd5VnAaGV9/iZdArpe++aZw1MXdwXseHkxKidWQG/3BMsQQBJAGnOzgjWltqYDje914J4YHY07xfNEOWTx7XCj4aQjFK0I5fseUvLHVf0vZ/5HteiXjkH5N8nYwogc10wJ94rYyZg09gbD2v5Mf1WkaKwuq5ixX66fZ00uweAHCf+0Isi2j+0g3YzK8CObR0fNO+HDWdEbfnv6YRDmoPzXxgYvsf0NgE7ueDmAkar+lgFaN1Pq70hX3T/3B+CEK48R1Zz+iLbhZXT985iDsbuq1TG+6/6mtDMw/EhQMJ7jHRtCMHDd1vjVAYujqlW5V8uS1ezGvwYFeH7/mLOg3w8iyC3IDTuiacqXJZB0bN56/wnoALgRpHGY4RpFqym1oz0Y0OdP1w
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-mtlrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 687D26C200C9A557; Fri, 25 Jul 2025 13:51:33 -0400
Date: Fri, 25 Jul 2025 13:51:32 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH v2] parisc: Revise __get_user() to probe user read access
Message-ID: <aIPEJOOMJQtuW49u@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XhoPfg8nApHUqWQf"
Content-Disposition: inline


--XhoPfg8nApHUqWQf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

parisc: Revise __get_user() to probe user read access

Because of the way read access support is implemented, read access
interruptions are only triggered at privilege levels 2 and 3. The
kernel executes at privilege level 0, so __get_user() never triggers
a read access interruption (code 26). Thus, it is currently possible
for user code to access a read protected address via a system call.

Fix this by probing read access rights at privilege level 3 and
setting __gu_err to -EFAULT (-14) if access isn't allowed.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/ua=
ccess.h
index 88d0ae5769dd..f610bda1466a 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -42,9 +42,23 @@
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

--XhoPfg8nApHUqWQf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmiDxBkACgkQXb/Nrl8Z
TfGU8RAAhT3aeMNalkBoG3LoOcvYh+FgNHR9zOZ7bL2BupkYHZWtpwUN9HyTysKP
epcKjew0QOBixbGMRGBA1KZ/9zTvwiyuqqwNKjNgAs3DbBNsPTgwagHN+Jjp8YGs
D5vOL6Fs+/amGIA8KTwQTGNu4thvZHLfVXeyWJQGBF6qEgsFVbMvfpbkl2ZMLOC+
60xJei/T2+KGkzBauhYhEl7+dgXP7feE93M9e00xYKl6nmXxbeUCs9M5SUb9EhD4
TIPeNM8nyvu2Yvch2e+031j8YRlBA8ZJEwp4lNYt7rOc7DxA4bR0UfV7kjb03QWi
fTyq4H97KiJaGP+67Ja9I0WHAyGihCe0fPZ7GAkbnFVeauB5EQF7h5eCB61UIY1C
Ft49LxwSvZRyhdhmsdFdYsrt/yS6B+umFJ3LiofOXuGqZImStqjsCH+wj6TaDxKZ
4yK826c3H23Yj905yZrIuRJ2CE5qH+vDoXisVXoBsgNQB3NNv5P/i+owIs8/1gbk
I9spweggx+E20GxJo7nllDbQDK/683C5E0Yy65LVyFHi5hmWURUSnN060xsyNDc5
S1IFP7BZkonFsLHQjAH2f/yJsD3zqyDgLf14U5bRxUoiyB14z8jjGECcJ9knAemm
euBZ9yQV+XY+p213f5P84HDElYZOlVskMAH40B1Liae+v4A9D4E=
=ti6c
-----END PGP SIGNATURE-----

--XhoPfg8nApHUqWQf--

