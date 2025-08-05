Return-Path: <linux-parisc+bounces-3839-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C40B1B7C3
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Aug 2025 17:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701B33A7463
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Aug 2025 15:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E462264D5;
	Tue,  5 Aug 2025 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="F8YVPkdX"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-001.bell.net [209.71.212.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043DD255E20
	for <linux-parisc@vger.kernel.org>; Tue,  5 Aug 2025 15:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754408796; cv=none; b=gDNI3GNh20Ik/0DBs3clHoxZe/1+nqxljl+2zuSq51dWpYoXxq4ev6T/HS6qtJ5IHvr856OJ66XUANTEX/0R5VdaUl0T2Zay3IZipJxkPKPXnl4zWyh4boSZmlFJm/aHfFsClHlpZpr91Cp73NLOI4gvops3ODGB6qZsgzFqsW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754408796; c=relaxed/simple;
	bh=v9NXLIT80+6LHN6SgETGqs4AULmNKV2qP7A0VN4GDek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DmE7SLz6nGWPTBvCQNMddiDnQn8DHQQCLZbAr0YT9LkbGX4k84BsHpns7uUaAVUTuCOqzegdcQoL8ObatnAhUPMjzNI11Fkz9BMzqjmdst16qf48XeH+0TJ6zYmBJCfILUq4PliCIyWtoztWdhqZ2WA3fQI/a+evBgsSwuNZFpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=F8YVPkdX; arc=none smtp.client-ip=209.71.212.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1754408795; 
        bh=cet8DLvhLKeIIng0Ur0pn4daHlywhtH20po7m3vA/4Y=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=F8YVPkdX4B2KNLbQFiQ24d4MAk//Gr+S7eGv3r1pDSZ/pC8rUNnccxqnjvj2svfQ7NmJ8cEDHuuEyhStfcCQOCFVfo7yuK2uXqTbSvMIAKujU548vIygv1aXYNF9TAO+GL0BeHHk1Sss9kHvjFxpDLrSLoua36QkoKCfzyZ7c5eoMuc1tZ4pHEjulJv9/f8h4GIg2px1HHqFEiy0LtYL4G406ghZloMYS1sCxm0CumSi/grg/8NrYaLoc7T4RetkxNuVXIrcy/1NCUWJ34p4T4YHyLN2g4Y+PZTw71DGvVINXE69J4OvsLE7D+mMwnmxKUPNurayPl1ADvHX5BnzDA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687F0CD101805B2D
X-RazorGate-Vade: dmFkZTGV6dLAKmhVGnrjo241Es4JGIQ7XsqJIK7jFl25Evgkft9b0hHWDnQyr9X9hrPIRpTa6xqaCQxk71Tt5jhmx7gzGfhafAO2kweNOairqn9glztW1FRlHY6KgrqgCs4brZKm1viZ6mYVN6KAbL681d4oSuNJ8pfo9EPDO9xPyGL4NntNs4jkrXnyC0HkVLyw+nGQitKdoOMKA47nXacketkuU/g9+h6LwFCi26H9tt/rApEcCUPMz+uAEcFMDQ9i9YuuTuDdvud+PLUjIRMPjyrnd47GtFX4jUA9t6e/GmRtNjD2eAaQB79KnApfbieb3eJvWu7X6VcfHGI/IL1n/+PRt+EjS1CqTtle8K+wAX1z/+78TwsDQ6UWZ13wGIkjO4/58sihPVSSq6h7rTEc/Qp3/lF3dDaW5B90wADG5Fh2fZY0ySLcHYAKBja4GZhmJJFu2I/meMnQco+okY4RXrv9Z7oH9UNMITHhTaicAZfzaFGiDusMmfDj+SuBThb/ibXvyCqaKzdlpEoXqsat+R8VN04zyBMdpyqUdzO/KitmPmMSyrWlVTehj8beLnCVqbYeuZUEF32Hha1HUG/Aswta/QGzNSAQjbyfluyuHKwVBCZkeB+/q3fq8T6TbZ10D9xfaIWG6mKNU7eyVEBVW9x+aXYxkgJUzq33DfJLm9BExg
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 687F0CD101805B2D; Tue, 5 Aug 2025 11:35:31 -0400
Date: Tue, 5 Aug 2025 11:35:30 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Remove spurious if statement from
 raw_copy_from_user()
Message-ID: <aJIkwlhMtY3aIqn7@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IeY9DcBPeRtVrDlh"
Content-Disposition: inline


--IeY9DcBPeRtVrDlh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

parisc: Remove spurious if statement from raw_copy_from_user()

Accidently introduced in commit 91428ca9320e.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 69d65ffab312..03165c82dfdb 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -41,7 +41,6 @@ unsigned long raw_copy_from_user(void *dst, const void __=
user *src,
 	mtsp(get_kernel_space(), SR_TEMP2);
=20
 	/* Check region is user accessible */
-	if (start)
 	while (start < end) {
 		if (!prober_user(SR_TEMP1, start)) {
 			newlen =3D (start - (unsigned long) src);

--IeY9DcBPeRtVrDlh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmiSJLoACgkQXb/Nrl8Z
TfE+3w//dnn4u5SO4c86QrdTpumX7lPTJz9E4nhimHndtJ6gn/7VZnb8W9lAEDos
hqMr5oTJFWAH868rwdd68WVOjogaj8SG+7eQRuR3+/N2uU4IvzW/lQjee+aHK9t+
J/3AE0TaGBCswatxw/HWPQClG8C13GpEqnleSuP3yttcLIeOfNSLUbEEyG/3ybdI
mdULvGS2UEf+nsfy8lWzNXaeJV+RuvGefQBrYUmRSRWbNcZVvlx/0K444F9hdeoz
bEeu5U1D/q2XkS2n0zGENQw/Dm43j5SQintkrCctWaB5FKmbCsqM44CRJ6O/cZiD
hfkSrG5ttY/Apx5iKDHLP6D4reDpD6wh862GeK0zIOhYKjtsPsQ0/h0SwTqSCRb+
f+k+5BNCFge0sx4OdHinUyHJgbzRricQQ7Jnvir7dLKw6MsU8KuRFUAG+MAlXznY
umoNu7CjzUZ+Sobtc0NdJcthTdWrGVWpuVl7fqHVErmdWFHafv8jrDZ1pbPi1U6h
yvct/MEGW3rvyRdO8Wc4/DYczbEhHhZBM1/gneR9g+2uRlco71y24PW1sLbish/2
CLgX7yJGBOzAD5zCma5RHamMxpTIRykbEHo6mnOav1hCGTZGOSvWKrwBpjtDsS5Q
ZqDYiMotv+oGyd43CPEDFBBTBe405AAHI8PuBawM7dM3HDfEkqA=
=cZQs
-----END PGP SIGNATURE-----

--IeY9DcBPeRtVrDlh--

