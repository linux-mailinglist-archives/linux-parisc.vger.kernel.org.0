Return-Path: <linux-parisc+bounces-3798-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8706FB0CB3E
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 22:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5CF1898EC5
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 20:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15851223323;
	Mon, 21 Jul 2025 20:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="PTAczEuJ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-007.bell.net [209.71.212.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29E219995E
	for <linux-parisc@vger.kernel.org>; Mon, 21 Jul 2025 20:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753128149; cv=none; b=kKpw7gTowz+1v8kSTssNufIAYdgMLGkekSqCv5oYfsDWp8F7MprONiPcwDHjljofza9kT9HnqI16BiGd1QbHlpF04CQqXNyTuoHvmv60T5PRFyZg5uO8wf3pmBuxP9ac2TBNBMbV++eE6E5Jm2APAIT1bibXr2Urs72WZ0/P8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753128149; c=relaxed/simple;
	bh=7C1FWh1mWIHj3Fn7d1rcUiMWFondlTJvPecmCeg4oYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pKIRnxMxQwA4aFqyjAmI9dvZ7casuCCkKEXFrytuazj25vqru3iQvNFfd09xHfutAg0TLwQU3OlEIF3Cj5M1m5VACqsArZV7va7aNJUCfifKw3QwskAX/KiB/apH9xm5rzYTUchGHjKiDIYAKYZpRPPDc6le9KoR+BOeZESuqrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=PTAczEuJ; arc=none smtp.client-ip=209.71.212.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753128147; 
        bh=dX4Qlru0jg/Lg8bbmvv0lVUgNZjQfZ1UX/sEunxsk3U=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=PTAczEuJ4Gijj/0KDyoMexTpZOjSfIpkOPFXU5PqkuUkeJo/5Uf2pAm0usSvf+HVbBoAffRyvfVJv4dd/KyhqZMJ3vqdvlnucGluDB6ooPWrR8WY58apejQcplAdObO2huaxKwka0yrJ48tSB/wyxnuNc6qwnnK7tZnGTqt65n8bWU0E4AkjFFrSBlX/4FH0W8xH5thKL8VrGMTQpyhN8KBv2zUmrZVNUhBcyT0NzPr2ipVfo3e0hQmJ7oK9+2K+258rm+ed9ngccGouNg4UXgNH1HhTd30g6WHZ7Hu1ZcXKel47X1kSZ/rPbedOn3ygJ9r5DKEde7NKSdNIAFmoSQ==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687A6B9A0065DB38
X-RazorGate-Vade: dmFkZTEqw/totUwGDDkw9QxyLPYBMmnjkgEh65IkleCcj0zDU4oukEq0SykGJZ7NpQJIrsWLFE3hD9FgJhJazuYO/dZ+dOhA03Hh2zZl0bzX0PyJc2OUl/tNt/87xnLdLMcIvUnkd/GlCMYplVf2fxHLwxu9OBRUuftP9+OfGnd9nfB+aDf/WpJbGgI9cvx+7EJzddqN0loHxHHx7hcNoxlFZ2lcu51lxhPF8i9Ohov26LsyE2VyNHWBjpEoT7TTB1K065BANBeCXL2VSyeBS5gEC8EfjcCdWVJ0TN13EiHSpueWuHgiTA1wxBoVfw1z/61NIn41wpioDafsT+hPL13gp286ngZTGM9E4HbbCEV2U0Aqpl39KYQKJkzrnjtioT0dQDZLZbIknHNky3EF8SAhjWpg5O+LWLqNF/3k4J0sEewLpgFaKWaK/QQroVU3lzc9OLPZCIGnH8VYUc610yYx0RPoU/xljedM3ahFfWg1DoP3b2v/6wlYr99OyeIYOVSoKuaVKJON6kFORq/Ej30HbqpG80oCIPMTbaLtJSxlBXS1yTp+jyG6MUMwgXg/TkXfMz4qvIvQhLZX5DZG6gghIO6LvJyYoseaVoIgEjKkOq6U4WdtK4SckR4YRg6o056xKwBhdOSzWP2KwVt/GVQ9CoIUfjrngG/7zvPvQ1BVuT8wAQ
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 687A6B9A0065DB38; Mon, 21 Jul 2025 15:56:06 -0400
Date: Mon, 21 Jul 2025 15:56:04 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Rename pte_needs_flush() to pte_needs_cache_flush()
 in cache.c
Message-ID: <aH6bVNpekyds0YtF@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7JDzrXrRdxp76WHc"
Content-Disposition: inline


--7JDzrXrRdxp76WHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

parisc: Rename pte_needs_flush() to pte_needs_cache_flush() in cache.c

The local name used in cache.c conflicts the declaration in
include/asm-generic/tlb.h.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index db531e58d70e..37ca484cc495 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -429,7 +429,7 @@ static inline pte_t *get_ptep(struct mm_struct *mm, uns=
igned long addr)
 	return ptep;
 }
=20
-static inline bool pte_needs_flush(pte_t pte)
+static inline bool pte_needs_cache_flush(pte_t pte)
 {
 	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_NO_CACHE))
 		=3D=3D (_PAGE_PRESENT | _PAGE_ACCESSED);
@@ -630,7 +630,7 @@ static void flush_cache_page_if_present(struct vm_area_=
struct *vma,
 	ptep =3D get_ptep(vma->vm_mm, vmaddr);
 	if (ptep) {
 		pte =3D ptep_get(ptep);
-		needs_flush =3D pte_needs_flush(pte);
+		needs_flush =3D pte_needs_cache_flush(pte);
 		pte_unmap(ptep);
 	}
 	if (needs_flush)

--7JDzrXrRdxp76WHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmh+m1MACgkQXb/Nrl8Z
TfHToQ//b54NhViwSfy6H9Xc+LgIK2DKWlc5Ozt7VLHlZrMLeSFHbx90hMsg27I7
4PWO2FBcSvBUoVlhHpS+5VKnv0+c06/9ZFf1YEDgOlk4Ek7MvvoGSoFWGNFdvaKd
PyryUXIaPRHtSw6kEfr8zatl1saJ7Qyd9HNn7ky4d1ujpceUogFRT7aWwoChSBsW
5iPegYKTipPgoG8hzx5vah7bb3xB1eigGOb8Vl5SqbbX6OsJfVh4NCHm933KUG8k
V9nlqFaBWXMjsdCK+xuYvTEho+1GVDB5p0ICilZ86Ky/PZIrVkUcuoNwglOGB8qL
w1pkMCDw6jIpmeg6583VqL/rQFuMNTAmuUJHFVmxLlLVrYUpOdPkWyQWI7ckIgaW
M26QoMzmXqkR8W+QedETgTHRcE/DtBhmJXYu0lyyYFVhMOBu+BlFS+VG42tjenvm
ySmTeZ8yJdIS4ydMmZlVgIReRMAWxoEyJufsfQgwlUmo6sX0KjCsjVHTQlLN96Vz
HeiyBniSaXIWMK7s38Gmihg0OTN0qQ4aIADroBGFGIUbEArhGR5i8pTrSI4LHHXW
PCmIy1apUrcKo59gEM1uhSJS3rxXIXTC7MGgAB63EpOUOxSIJ87O8b0uNEZHmUb0
WHPg+QSxKZOBJ0APHApYl0SnfULMwnDdCWdeTdMH1SMCq56OTDo=
=4Abv
-----END PGP SIGNATURE-----

--7JDzrXrRdxp76WHc--

