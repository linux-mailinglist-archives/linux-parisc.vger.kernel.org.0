Return-Path: <linux-parisc+bounces-507-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D11850676
	for <lists+linux-parisc@lfdr.de>; Sat, 10 Feb 2024 22:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 699562854C2
	for <lists+linux-parisc@lfdr.de>; Sat, 10 Feb 2024 21:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627F85F85F;
	Sat, 10 Feb 2024 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="184hUcn1";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="X8Y+hd7g";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="JbkbT0pd"
X-Original-To: linux-parisc@vger.kernel.org
Received: from e2i605.smtp2go.com (e2i605.smtp2go.com [103.2.142.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AC05FBBE
	for <linux-parisc@vger.kernel.org>; Sat, 10 Feb 2024 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707600201; cv=none; b=m20JNxyz557H0Dg56+s648Ad9/hk2C7wrQDwliIgKCcjDq8ZGcaCpmu0wMEfrbY68gnqgTydgIIWGmkN/zNwcm2Ln8HKcX4nIbXlUoXklOA+JE5lorWJ2vpujYyEi/k/Rxzj9+1yQKHHvRywgBGtRVKzUpzYLKJDRjC1XPV2NRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707600201; c=relaxed/simple;
	bh=I1g56Qbu1U7xe3c1QV1JroAnkemuPw2aHxort9pD/Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G473Aa4AHbeQiPFkPFReLWVWnfymBYmOk+1RZ3dw90G3jwLZFPwsP1FKf8ActmUpIWDEPxxAaTl6BoxMSDF/x1/oOZOgRWpbYBj13nY7fRq4Hwq0jC8FrjTb9Z+t1w5ua0m6EQAsZ9nMoxoslrVYSYsQ5J0CGY3kn9YPlmICR+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=184hUcn1; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=X8Y+hd7g; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=JbkbT0pd; arc=none smtp.client-ip=103.2.142.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1707601096; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe; bh=2Fq96AF5MB0+kJ+KJdOs/5ZldIf6fpvtRLYffLd24+I=; b=184hUcn1
	m9QoTIvxA9JToik2CoFEtFWxvtCq+8uULMCcRw9xHxgCnmZMDcvyjDr/2SDtw0lsI3NU7lLrrqUOK
	kaWosGY40K1JU5tA3VQTYsMNj0ovhM3fdz/h4Vii2ZSfJCj9vdNWWxPzB799H9ajXQhzgXqxJDvhV
	VqZ559eALuPH6GshWZCH2wFSlLBSbI1ILja6r60tnMPH8SvEY+sNamFfqRC4e2PjMjioFClQ95+0v
	AWpXsEyflp6OhtKIUJP50OiTw56cCFy469QBI2BtaDWh9tGPYGc1bJFvCx1qKPQDZIcJHizPbgaal
	JdryPMI8XDnfj6K8wxLZYt7vRQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1707600196; h=from : subject :
 to : message-id : date;
 bh=2Fq96AF5MB0+kJ+KJdOs/5ZldIf6fpvtRLYffLd24+I=;
 b=X8Y+hd7gPKkmoC31ibEqPPvkmND6K1y33SSzdDnmx9VZBH5t8smEQ3aWdy3CjiUzJwRCY
 dheqvecfhi3jNBkAWjnx/lQfE37HVSGmUHfaVMb1Miqe8JFFtVi2NI/gvnhmTMvwFCNAdaF
 t1NIzE0xJtMn5XHhxnRoBFZr0253kv5t3K82LXcBABnSBpPBwYTEQ0ay7ad5j20hfOIuqYb
 NUmusE3DvPeesNBJPDJaqAa+g0qhl+fJFe4CwmOceplDKGvJ2NLgcnWddL40tNyRvvWmRQw
 Tr2sQjDQ+kd+TbKtuJr0Oy7c9bSEkPphyuASoDdL1cCr9LORR5CqRhTxkz8w==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rYulD-qt4Fr1-Lp; Sat, 10 Feb 2024 21:19:46 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rYulD-4XnyKn-0Z; Sat, 10 Feb 2024 21:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1707599972; bh=I1g56Qbu1U7xe3c1QV1JroAnkemuPw2aHxort9pD/Wc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JbkbT0pdaP8BnvXh9tpxj+YS6okGmBmnNGsrfdhfV9EoSpDF5F4uOHaMJ+xMqzgij
 GHorn8ZRP9m/80ivs1VHZsgnANVVzW1lsFOxlplnJSNro9J6nuH834VWmTQkPGt9Is
 yHwwg6G/9TmIg3PL7q7Lo4tsSP4IC66lViSJVPGw=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 9DE743E9DC; Sat, 10 Feb 2024 22:19:32 +0100 (CET)
Date: Sat, 10 Feb 2024 22:19:32 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Zhang Bingwu <xtex@envs.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Zhang Bingwu <xtexchooser@duck.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: Abort make on install failures
Message-ID: <ZcfoZKJHkdEh5JmV@fjasle.eu>
References: <20240210074601.5363-1-xtex@envs.net>
 <20240210074601.5363-2-xtex@envs.net>
 <ZcdP7CC+OMbp5ZMi@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="enK6rDCtE6qVMuuk"
Content-Disposition: inline
In-Reply-To: <ZcdP7CC+OMbp5ZMi@shell.armlinux.org.uk>
X-Smtpcorp-Track: 1rYI_D4bnyKn0Z.xzhw1gNhddBAT
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sd7ZiAHDp8
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>


--enK6rDCtE6qVMuuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 10:29:00AM +0000 Russell King (Oracle) wrote:
> On Sat, Feb 10, 2024 at 03:46:00PM +0800, Zhang Bingwu wrote:
> > From: Zhang Bingwu <xtexchooser@duck.com>
> >=20
> > Setting '-e' flag tells shells to exit with error exit code immediately
> > after any of commands fails, and causes make(1) to regard recipes as
> > failed.
> >=20
> > Before this, make will still continue to succeed even after the
> > installation failed, for example, for insufficient permission or
> > directory does not exist.
> >
> > Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>
> > ---

Thanks for fixing!

[...]
> > diff --git a/arch/arm/boot/install.sh b/arch/arm/boot/install.sh
> > index 9ec11fac7d8d..34e2c6e31fd1 100755
> > --- a/arch/arm/boot/install.sh
> > +++ b/arch/arm/boot/install.sh
> > @@ -17,6 +17,8 @@
> >  #   $3 - kernel map file
> >  #   $4 - default install path (blank if root directory)
> > =20
> > +set -e
> > +
>=20
> What about #!/bin/sh -e on the first line, which is the more normal way
> to do this for an entire script?

are you sure?  I can find many more occurrences of 'set -e' than the
shebang version in the Linux tree, especially in the kbuild scripts, thus
it's bike-shedding, isn't it?

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Kind regards,
Nicolas

--enK6rDCtE6qVMuuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmXH6FkACgkQB1IKcBYm
Emmflg//QV42IFPNYuHOXGOMGBjwhOcPS5a63Ery8+rM164QOh4y8GFFm70Ti5Wd
s5wSWvSTxw+riHznvjEkrzi/KrHEMIWsy6HRRBdrzwpiytGb7QCnUT1LtSteBeNe
JPtcZ5MGz0W4HIUA4cj46FxFGpR+DjnrGk2FoXd/BSwhYq0asA1muUHQ0YwN3ksS
b86PM8Y/JgAbCGeA9qF+uZGaSFjU9cl4LQj14E7IPYrp9ZeDgYY3eC6vNPJ+64zD
Jipvq0pg5G9MrN92hNXw/VVn4pGrquNcIqFQwGypcZIb2YrKOLEtPBctEqZkYNfd
TGngv5bUFvUwllm9o/VpflR1XOx1auN2AJQux6l1ca41dhH/tKkFCrDU7V5Xxc6J
3VBC9QeZuVuh5AETrC9whYVFSIvoQvH5NHRV6ffqA6AGjXQJNsNNsUuwVnhliaDh
vqNO7OJm2ZoZmlBjNCGI1LsjNateOOY7mzk1Fsz9pl0OyhkDjjDoT56rTcC+Ykz9
HSceveMepuVG/vTNMEwXIGAaG3p+7+/mj4QrwE9TAWCRs/ASCnaMYJUkPmJLfuXD
tOP59blzBvkY5HAmDHMdl4AIFtM9rjm/JQORwYT2tB+MfdyZxCWWJPz7mjs6ykAy
JF9090FJh3puL9bw721bvpb75ptKyBxpuvQsas2SspCCtT1DidQ=
=NJcH
-----END PGP SIGNATURE-----

--enK6rDCtE6qVMuuk--

