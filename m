Return-Path: <linux-parisc+bounces-140-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D25708039DC
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Dec 2023 17:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6123A2810D1
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Dec 2023 16:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8132D62F;
	Mon,  4 Dec 2023 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N346Pnds"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB422C87D
	for <linux-parisc@vger.kernel.org>; Mon,  4 Dec 2023 16:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970F3C433C7;
	Mon,  4 Dec 2023 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701706490;
	bh=SwEWkG/uCW/5Tacu2wjWGIOYBAsWvLMMutQ89lrq+CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N346Pndsdr5C3wi2upjUoGzHZNenjnIGD4awErFqjGNAAdRyPnZdWSK8JGYpdoecv
	 j/BmEMplNLzOiX8xkbp2i6KKX0XN590J9vy+PaNwoTjR4Ks9XfnMLlbAT89oOXWGaJ
	 C/MzQOdwR1dBxtaOl5bhVKKCBLT20JGnqv+04pxBF3G/hop5GCe7OCL4WfZiTTCK9c
	 AMVvchAGsdLiSHvA1gqpPpFayD2mU0+vw31B0dcDkFVFh3fGD4X8/MV354FPbcqm3y
	 XYVBD6GcYW35X7iBaNISLOsOy2/da0trz/ZBL950aRavFOcNHgIxCOpcT/3+f2oqvy
	 2njAfgN4yL/+g==
Date: Mon, 4 Dec 2023 16:14:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	joe@perches.com, nathan@kernel.org
Subject: Re: [PATCH v3 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <20231204-liftoff-enclosure-d3e3daf0ab6e@spud>
References: <20231130023955.5257-1-bhe@redhat.com>
 <20231130023955.5257-6-bhe@redhat.com>
 <20231201-blog-blasphemy-985d2665903c@wendy>
 <ZW3yXWJ7rTrtZzyg@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rDkxBxq3zHBt7ZDu"
Content-Disposition: inline
In-Reply-To: <ZW3yXWJ7rTrtZzyg@MiWiFi-R3L-srv>


--rDkxBxq3zHBt7ZDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 11:38:05PM +0800, Baoquan He wrote:
> On 12/01/23 at 10:38am, Conor Dooley wrote:
> > On Thu, Nov 30, 2023 at 10:39:53AM +0800, Baoquan He wrote:
> >=20
> > $subject has a typo in the arch bit :)
>=20
> Indeed, will fix if need report. Thanks for careful checking.
>=20
> >=20
> > > Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > > loading related codes.
> >=20
> > Commit messages should be understandable in isolation, but this only
> > explains (part of) what is obvious in the diff. Why is this change
> > being made?
>=20
> The purpose has been detailedly described in cover letter and patch 1
> log. Andrew has picked these patches into his tree and grabbed the cover
> letter log into the relevant commit for people's later checking. All
> these seven patches will be present in mainline together. This is common
> way when posting patch series? Please let me know if I misunderstand
> anything.

Each patch having a commit message that explains why a change is being
made is the expectation. It is especially useful to explain the why
here, since it is not just a mechanical conversion of pr_debug()s as the
commit message suggests.

> >=20
> > >=20
> > > And also remove kexec_image_info() because the content has been print=
ed
> > > out in generic code.
> > >=20
> > > Signed-off-by: Baoquan He <bhe@redhat.com>
> > > ---
> > >  arch/riscv/kernel/elf_kexec.c     | 11 ++++++-----
> > >  arch/riscv/kernel/machine_kexec.c | 26 --------------------------
> > >  2 files changed, 6 insertions(+), 31 deletions(-)
> > >=20
> > > diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_ke=
xec.c
> > > index e60fbd8660c4..5bd1ec3341fe 100644
> > > --- a/arch/riscv/kernel/elf_kexec.c
> > > +++ b/arch/riscv/kernel/elf_kexec.c
> > > @@ -216,7 +216,6 @@ static void *elf_kexec_load(struct kimage *image,=
 char *kernel_buf,
> > >  	if (ret)
> > >  		goto out;
> > >  	kernel_start =3D image->start;
> > > -	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
> > > =20
> > >  	/* Add the kernel binary to the image */
> > >  	ret =3D riscv_kexec_elf_load(image, &ehdr, &elf_info,
> > > @@ -252,8 +251,8 @@ static void *elf_kexec_load(struct kimage *image,=
 char *kernel_buf,
> > >  		image->elf_load_addr =3D kbuf.mem;
> > >  		image->elf_headers_sz =3D headers_sz;
> > > =20
> > > -		pr_debug("Loaded elf core header at 0x%lx bufsz=3D0x%lx memsz=3D0x=
%lx\n",
> > > -			 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> > > +		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=3D0x%lx memsz=
=3D0x%lx\n",
> > > +			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> > > =20
> > >  		/* Setup cmdline for kdump kernel case */
> > >  		modified_cmdline =3D setup_kdump_cmdline(image, cmdline,
> > > @@ -275,6 +274,8 @@ static void *elf_kexec_load(struct kimage *image,=
 char *kernel_buf,
> > >  		pr_err("Error loading purgatory ret=3D%d\n", ret);
> > >  		goto out;
> > >  	}
> > > +	kexec_dprintk("Loaded purgatory at 0x%lx\n", kbuf.mem);
> > > +
> > >  	ret =3D kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
> > >  					     &kernel_start,
> > >  					     sizeof(kernel_start), 0);
> > > @@ -293,7 +294,7 @@ static void *elf_kexec_load(struct kimage *image,=
 char *kernel_buf,
> > >  		if (ret)
> > >  			goto out;
> > >  		initrd_pbase =3D kbuf.mem;
> >=20
> > > -		pr_notice("Loaded initrd at 0x%lx\n", initrd_pbase);
> > > +		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_pbase);
> >=20
> > This is not a pr_debug().
> >=20
> > >  	}
> > > =20
> > >  	/* Add the DTB to the image */
> > > @@ -318,7 +319,7 @@ static void *elf_kexec_load(struct kimage *image,=
 char *kernel_buf,
> > >  	}
> > >  	/* Cache the fdt buffer address for memory cleanup */
> > >  	image->arch.fdt =3D fdt;
> >=20
> > > -	pr_notice("Loaded device tree at 0x%lx\n", kbuf.mem);
> > > +	kexec_dprintk("Loaded device tree at 0x%lx\n", kbuf.mem);
> >=20
> > Neither is this. Why are they being moved from pr_notice()?
>=20
> You are right.=20
>=20
> While always printing out the loaded location of purgatory and
> device tree doesn't make sense. It will be confusing when users
> see these even when they do normal kexec/kdump loading. It should be
> changed to pr_debug().
>=20
> Which way do you suggest?
> 1) change it back to pr_debug(), fix it in another patch;
> 2) keep it as is in the patch;

Personally I think it is fine to change them all in one patch, but the
rationale for converting pr_notice() to your new debug infrastructure
needs to be in the commit message.

Thanks,
Conor.

--rDkxBxq3zHBt7ZDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW369QAKCRB4tDGHoIJi
0nMJAP4uVUovqQeQ+fYVKmAG4c00oB2z4haO+u5+2U2Cf9yrYwD/f9u0S9FMCfzY
i2AY9z+9fRLSvxY457Xg9s0W3YULlwE=
=OJ5C
-----END PGP SIGNATURE-----

--rDkxBxq3zHBt7ZDu--

