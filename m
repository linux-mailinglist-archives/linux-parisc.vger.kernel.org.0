Return-Path: <linux-parisc+bounces-3801-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23038B0CBBB
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 22:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE7D53A72C5
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 20:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F54223AB85;
	Mon, 21 Jul 2025 20:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="htroB+//"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo001.bell.net (mta-mtl-007.bell.net [209.71.208.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1042923AE87
	for <linux-parisc@vger.kernel.org>; Mon, 21 Jul 2025 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753129293; cv=none; b=k+lHRkF1KgHnNUyR88NaQTt8tWoBoluP8lzdMFzuDH1d1tfkzh/7darBMMZkrqXT+ZdNM+jGj/1dBrxIsZeVSj1wA/gQPtoPmUXUGySMgdUddJucMpllvMRZmLI7DNLW0EPg5UV+nLwTAMhiIzS6VZSuey9bYeE7OZhKcWkHgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753129293; c=relaxed/simple;
	bh=V6M1sX+nJtwWJuvMypY6dbsRZh2ksqYowrisBevKrjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s5cTPg1bfvU/8/qZmcV32lNOWjv1e/+vlvPZu9VxbHD6OQc9/2ZAGDle70Uf8tX6WO8t5XVXb824xjyW+51OcPrZXZ8RtVKcTc1jaPpC7E7UrwHcTgeeP8zl6C6e7F+SmixM6mOfJssMz6oqJ5y7aY7TMBEG7rlj4aBl2qP8rzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=htroB+//; arc=none smtp.client-ip=209.71.208.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753129291; 
        bh=bE5svEcRKsCT7Xj2oSxVSuEFh4Q7aOSPNtt+GLCcSao=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=htroB+//pW122Aa+nvl/guNhqXugXaB1LnIlDN1AO4Z+0TgzTC/ymGiS6LRf+pFA0zCV6mgde05Op/IfFulEvdPslIOISKJWDDq9Z4c2kb2EWXWFynB7UWm3djIJGaxxCA3Zg2i9cZr3WyDvi6RoIiZTpPW2bnULDFR0q3a8SWPyxPFxctQm3dvwsaMZEzOvX96fH5aGspLQbkJJHv5YQv/MQosQeb4joiwkvpsLWfZTRIKZK5ZKKK7zWf5hB5dAArVNGPGAWECBrXeRk5SU06PpNVG65XXf/esKk+BlncuSb0F1dTo5CA/Pn2F8duQodonKXwyI+wnws3yKK3BSWA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687D26C200333ECB
X-RazorGate-Vade: dmFkZTFGSuyHxwXp9g/U5wwVshXigSRya+nOnVewfTuOnWBhryWYJyMzd2HDM0StaAPDGHHqitJhtPnjnsyLuZl7Zuv/Z5pY58ZwatgXwlBKOM61JjVsySe9mEXPFVpCnGI4a/sduWahz6hE5/Ig5gg/XJjxnpzWoWNojoNS0eWM9A83cMfYDC7/3Gf55xLJxL4QoP6FJZD9/zWdK+9KL2AKj3nvkwxKIhDWFEYJkZreZW3GsC/AhFJXBXeswaRjUeSVPA1TSZJCuQojv0oskwRLNe4zrWiEVBBcY5v41b4hoaJlc8kzMem7w+Eh/y6Oc9ndiVj3Yx3XuHoj028XUyHV5bB6o2/aqQWszxoMwbVB/0Gb8Zx32dmLI9bqWdMS3g14o267doB/c3bOdwltsx7n8zd5VwkBEG6Z3pXPvULwXNlxVj6XA+wpcDpiij4Jl3ssL4nJlLevWrBtlmwhn/KX5vnXR+ii5oy+jaezC3ppuPhYyBP+VZStvhT7KIyEC+cvzrUn5NgneYrOVCVQTuYQs8bVzelAagd6Hx71gqPR4mNpCiUoZVzomYgM3Xhfadnr0rbRYqNK8NRA/1z+l+7UqaEOBU25cz88C8iCpCcn2muFX/4wJhkfKJyNX9IvLt5BUMF8cbIpxOZNUUvt5kMG9J/HvWnFnm4e2FiYlB67jQS+ag
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-mtlrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 687D26C200333ECB; Mon, 21 Jul 2025 16:18:44 -0400
Date: Mon, 21 Jul 2025 16:18:41 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Drop WARN_ON_ONCE() from flush_cache_vmap
Message-ID: <aH6gob3EFxc4_fcw@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fmvfT3GjmPZwbzu"
Content-Disposition: inline


--2fmvfT3GjmPZwbzu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

parisc: Drop WARN_ON_ONCE() from flush_cache_vmap

I have observed warning to occassionally trigger.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index db531e58d70e..37ca484cc495 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -841,7 +841,7 @@ void flush_cache_vmap(unsigned long start, unsigned lon=
g end)
 	}
=20
 	vm =3D find_vm_area((void *)start);
-	if (WARN_ON_ONCE(!vm)) {
+	if (!vm) {
 		flush_cache_all();
 		return;
 	}

--2fmvfT3GjmPZwbzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmh+oKAACgkQXb/Nrl8Z
TfFthhAAiTTMaATKUdN29ph5QpujXwi/jAFSz9pm3F9lHy01BrajDmEE5PncZ121
OZuxwI95aymz0Sq6DSnb8fLElMbvq3+bA2w5e/lBV3Hwycz+ux03XlkGMeS9jk52
5Rf14mG/5PjitccFT8RZ3CZ+kJbNhj9/ZMX2Ut3Lf/clzCg93mMsSi+2CB32FB2Q
N1c1aaPTh7RB+fEzNMcm9oanzo8OTo9s88UlfhY9cJUTKlhJf3SIzPyexpVlC/2V
75yjdkqOi3xyCF1VBt4/Ynrmu3q98mIe4bNiP4IN0OcQNcojdnopKhjE/kogZmWT
pxzSsWhPpEUd9XAy5YwfbianwgkS3wpjWX7SFsZQWdAM/XEX6aniPDl4pafNNnRE
zS3gOrOlaM5+k1Tk5Df5gjMfwTp7MufusTEEUM506s6a7Od2cO8Yd5BpNhrwVY6R
RQeq/RbWZGtmNvJh6vf1uLYMWrncyrZ2bJ4AOY/ZUKPBReu9S+M1QsUx/egVUR0a
Q8oIk8FsX7mrcpbfhAEOsnlOG9AfH5tOnxgRvKNiFKAnC+Kw3qI3FIkrxQsnpJVY
Jj8xenyu2Xofucmok4cBQql8vjj0AA0LVDQy9Ed0iahR/x152LOxvwY+4Fc/Bk6Q
LzInCxzOU5hj/U2XSOD/wIQHE4dSdwKyRCg1KEL9ftjei8BaFRg=
=nF8A
-----END PGP SIGNATURE-----

--2fmvfT3GjmPZwbzu--

