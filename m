Return-Path: <linux-parisc+bounces-1780-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C492A6B0
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Jul 2024 18:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6C0C1F22614
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Jul 2024 16:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C81145A08;
	Mon,  8 Jul 2024 16:00:35 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926C979FD
	for <linux-parisc@vger.kernel.org>; Mon,  8 Jul 2024 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454435; cv=none; b=dDi+ZKO7LEke/YQpETHUlKtkd4SCqw+ZeQe076WhdNhUny/uCkIwJgOhAjHy5izuV7oyCGnJE+uQrbsoiFCTpEE/YESwIQ/1YnUb9OGgKpAUu9R8PjS55nGqHND47RYhlZd30scAKbSX2gyFWPcCDM1xFnVuGl6uZuldLbQjyIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454435; c=relaxed/simple;
	bh=ZdKjp5U//Kgv3dUGypkShqKU/5OsAzyoIC5ZLRzmmVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aabaZxGZ4p0qvVmzmtwW1D4Pk/ePHn9tDmLPFTSbNBHsna8vLQOJa2/qhi4cSzCh5Pq9ughG53zx5TyD8u4HYJmw14c+y5TpCRd7JocoIdYB9QxeojKgqzWb+7T6P0JDX1IUmTy8IuTrX8pZubexdU9jGMFfPnxkyQ9NWkq3QcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Florian Weimer <fweimer@redhat.com>, Helge Deller <deller@kernel.org>,
 John David Anglin <dave.anglin@bell.net>, libc-alpha@sourceware.org,
 linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] hppa: Wire up cacheflush syscall
Date: Mon, 08 Jul 2024 18:00:25 +0200
Message-ID: <2572286.PYKUYFuaPT@kona>
Organization: Gentoo Linux
In-Reply-To: <a6a933be-9795-4614-a925-25049736d3c1@gmx.de>
References:
 <Zos8gVaGUcuaaNaI@carbonx1> <877cdwfgi9.fsf@oldenburg.str.redhat.com>
 <a6a933be-9795-4614-a925-25049736d3c1@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart22947367.EfDdHjke4D";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart22947367.EfDdHjke4D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Cc: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] hppa: Wire up cacheflush syscall
Date: Mon, 08 Jul 2024 18:00:25 +0200
Message-ID: <2572286.PYKUYFuaPT@kona>
Organization: Gentoo Linux
In-Reply-To: <a6a933be-9795-4614-a925-25049736d3c1@gmx.de>
MIME-Version: 1.0

Am Montag, 8. Juli 2024, 10:58:35 CEST schrieb Helge Deller:
> On 7/8/24 10:13, Florian Weimer wrote:
> > * Helge Deller:
> >
> >> diff --git a/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h b/sysdeps/uni=
x/sysv/linux/hppa/sys/cachectl.h
> >> new file mode 100644
> >> index 0000000000..16e47d1329
> >> --- /dev/null
> >> +++ b/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h
> >> @@ -0,0 +1,36 @@
> >
> >> +#ifndef _SYS_CACHECTL_H
> >> +#define _SYS_CACHECTL_H 1
> >> +
> >> +#include <features.h>
> >> +
> >> +/* Get the kernel definition for the op bits.  */
> >> +#include <asm/cachectl.h>
> >
> > This makes this header (<sys/cachectl.h>) unusable with older kernel
> > headers.  I think it also results in a test failure with older headers.
> > Is this a problem?
>=20
> hppa lives in debian unstable, so basically you should always use
> the latest kernel & kernel headers when upgrading glibc.

Ahem.
https://www.gentoo.org/downloads/#hppa

> So, personally I think it's ok to ask people to upgrade.
> Dave, any opinion on this?
>=20
> > In similar cases, we use LINUX_VERSION_CODE checks (for older compilers)
> > and __has_include to support backports.
>=20
> I'd prefer to not add additional checks.
> Another (maybe easier) possibility is to simply backport the kernel asm/c=
achectl.h
> file (just the header, not the implementation, so the syscall will return=
 -ENOSYS on
> older kernels):
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dc6d96328fecdda16e12f3b3c33f3677f4bcef89f
>=20
> Helge
>=20


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart22947367.EfDdHjke4D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmaMDRlfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEZE
MTlFNkQzMUIxOTJFRTREQzYzRUFEM0RDMkIxNjIxNUVENTQxMkEACgkQ3CsWIV7V
QSq/gBAAixEOiaCF9liH4UqOQz+DlUHeiX5/uReC9Z86eYC53BCPM+Wqbf78lxYQ
usVjTrQHSb98WJwzFvO27qpkhWH9jzulbSu5wCjUBfqPHAOhVJqq9n0DFv9dTH6Q
beFBjauYKtQ91rUyC+HZhVJq3kMt5R+98kzEW8pcaSs460XPsedW5E8Q8vlcnP8G
W/4Z+6LV7h20x+rQH1W0jDNmZsKwvVlexN/CG6mZp+nwFYIlent0B/qaOuLYdDKf
ArsL2w9r3LIfr4T2QsevyEQP6H9q775mb2weO1ueIeS4WKiWeZrvQ0LLwYskapy3
T5asNLyDm/pWG9tpJAWblVscYMaVC/IkNpLtl9OMyo/4t7IbpgsLO77xf2JYcU+m
4OA5UlOZFtXADahCnm9Y8lxJKPp8KKG/Q2oPawgtRbW8DSfbkr9iZAiAvjupR4i9
PYO1g2VJOmy4PIkc6O3vbvbIZhKDQKn7oOVrRRGeYqSlyHgiNRJyVzjU/OoxLVvr
0+HXszTsRBMHP/fGfBHf77jsDEjWSctzLKfrAnSXgNRVwzsFzw3K6LmHAvWONM1W
VRrmNnFh0oOD74KwP0n3LsZjaLShDscTR0QeP+bqetksO+VHLboGzrMo+7ckVhHU
zx7XTm+R6VEJt0cuZ3uIkvxLmeZGgcHSM8IMY3K7DtOPKJTjY/E=
=b8OF
-----END PGP SIGNATURE-----

--nextPart22947367.EfDdHjke4D--




