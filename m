Return-Path: <linux-parisc+bounces-132-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E569800884
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Dec 2023 11:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E90BB211E2
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Dec 2023 10:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8020920B29;
	Fri,  1 Dec 2023 10:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lY0s/ikL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D88A10FC;
	Fri,  1 Dec 2023 02:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701427151; x=1732963151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kND13bhhr35acgxOCU8wE4eGgbORidUOksqg08kH6S0=;
  b=lY0s/ikLC2f2srTDuKkZMdD98ImPLGy6eFz1k23zCxqdpj0EfKy9WrQg
   3++opUka+Bm7LSxMlmVoCD0Ei0sdbxcjNxTll7Z9t7ZyP2BvxFbu+pzOw
   64bc2rRuTBXno3NBiVsSS2DUDp/BnZC3PuQdgcvc6ujOW9krclZlu7nFK
   1PcI44WdNvtVUqDdxv8BM2Pjff84LTpknXTCYnjk1xIUcQLYoT1xYwSgf
   8mxFozj6K4opRXBJ9NOSjVpf+OL7eqebP46a0J2jwEpCfTc8ZMP2Tp6ko
   CcM/AQUj4cM8xbdnE6NkVT3XjUvkViIkkyv708WEUHT3xTMnJkrYnxJtu
   w==;
X-CSE-ConnectionGUID: 7PeIiSJ3S3Sf51tB+gQejg==
X-CSE-MsgGUID: 5laFXParRc6ZcUs/oGnMUw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="asc'?scan'208";a="13412417"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Dec 2023 03:39:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Dec 2023 03:38:44 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 1 Dec 2023 03:38:42 -0700
Date: Fri, 1 Dec 2023 10:38:13 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Baoquan He <bhe@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <kexec@lists.infradead.org>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-parisc@vger.kernel.org>, <akpm@linux-foundation.org>,
	<joe@perches.com>, <nathan@kernel.org>
Subject: Re: [PATCH v3 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <20231201-blog-blasphemy-985d2665903c@wendy>
References: <20231130023955.5257-1-bhe@redhat.com>
 <20231130023955.5257-6-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wYVOP/ERUSSrsdpK"
Content-Disposition: inline
In-Reply-To: <20231130023955.5257-6-bhe@redhat.com>

--wYVOP/ERUSSrsdpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 10:39:53AM +0800, Baoquan He wrote:

$subject has a typo in the arch bit :)

> Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> loading related codes.

Commit messages should be understandable in isolation, but this only
explains (part of) what is obvious in the diff. Why is this change
being made?

>=20
> And also remove kexec_image_info() because the content has been printed
> out in generic code.
>=20
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  arch/riscv/kernel/elf_kexec.c     | 11 ++++++-----
>  arch/riscv/kernel/machine_kexec.c | 26 --------------------------
>  2 files changed, 6 insertions(+), 31 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> index e60fbd8660c4..5bd1ec3341fe 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -216,7 +216,6 @@ static void *elf_kexec_load(struct kimage *image, cha=
r *kernel_buf,
>  	if (ret)
>  		goto out;
>  	kernel_start =3D image->start;
> -	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
> =20
>  	/* Add the kernel binary to the image */
>  	ret =3D riscv_kexec_elf_load(image, &ehdr, &elf_info,
> @@ -252,8 +251,8 @@ static void *elf_kexec_load(struct kimage *image, cha=
r *kernel_buf,
>  		image->elf_load_addr =3D kbuf.mem;
>  		image->elf_headers_sz =3D headers_sz;
> =20
> -		pr_debug("Loaded elf core header at 0x%lx bufsz=3D0x%lx memsz=3D0x%lx\=
n",
> -			 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> +		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=3D0x%lx memsz=3D0=
x%lx\n",
> +			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> =20
>  		/* Setup cmdline for kdump kernel case */
>  		modified_cmdline =3D setup_kdump_cmdline(image, cmdline,
> @@ -275,6 +274,8 @@ static void *elf_kexec_load(struct kimage *image, cha=
r *kernel_buf,
>  		pr_err("Error loading purgatory ret=3D%d\n", ret);
>  		goto out;
>  	}
> +	kexec_dprintk("Loaded purgatory at 0x%lx\n", kbuf.mem);
> +
>  	ret =3D kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
>  					     &kernel_start,
>  					     sizeof(kernel_start), 0);
> @@ -293,7 +294,7 @@ static void *elf_kexec_load(struct kimage *image, cha=
r *kernel_buf,
>  		if (ret)
>  			goto out;
>  		initrd_pbase =3D kbuf.mem;

> -		pr_notice("Loaded initrd at 0x%lx\n", initrd_pbase);
> +		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_pbase);

This is not a pr_debug().

>  	}
> =20
>  	/* Add the DTB to the image */
> @@ -318,7 +319,7 @@ static void *elf_kexec_load(struct kimage *image, cha=
r *kernel_buf,
>  	}
>  	/* Cache the fdt buffer address for memory cleanup */
>  	image->arch.fdt =3D fdt;

> -	pr_notice("Loaded device tree at 0x%lx\n", kbuf.mem);
> +	kexec_dprintk("Loaded device tree at 0x%lx\n", kbuf.mem);

Neither is this. Why are they being moved from pr_notice()?

Thanks,
Conor.

>  	goto out;
> =20
>  out_free_fdt:
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machin=
e_kexec.c
> index 2d139b724bc8..ed9cad20c039 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -18,30 +18,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> =20
> -/*
> - * kexec_image_info - Print received image details
> - */
> -static void
> -kexec_image_info(const struct kimage *image)
> -{
> -	unsigned long i;
> -
> -	pr_debug("Kexec image info:\n");
> -	pr_debug("\ttype:        %d\n", image->type);
> -	pr_debug("\tstart:       %lx\n", image->start);
> -	pr_debug("\thead:        %lx\n", image->head);
> -	pr_debug("\tnr_segments: %lu\n", image->nr_segments);
> -
> -	for (i =3D 0; i < image->nr_segments; i++) {
> -		pr_debug("\t    segment[%lu]: %016lx - %016lx", i,
> -			image->segment[i].mem,
> -			image->segment[i].mem + image->segment[i].memsz);
> -		pr_debug("\t\t0x%lx bytes, %lu pages\n",
> -			(unsigned long) image->segment[i].memsz,
> -			(unsigned long) image->segment[i].memsz /  PAGE_SIZE);
> -	}
> -}
> -
>  /*
>   * machine_kexec_prepare - Initialize kexec
>   *
> @@ -60,8 +36,6 @@ machine_kexec_prepare(struct kimage *image)
>  	unsigned int control_code_buffer_sz =3D 0;
>  	int i =3D 0;
> =20
> -	kexec_image_info(image);
> -
>  	/* Find the Flattened Device Tree and save its physical address */
>  	for (i =3D 0; i < image->nr_segments; i++) {
>  		if (image->segment[i].memsz <=3D sizeof(fdt))
> --=20
> 2.41.0
>=20

--wYVOP/ERUSSrsdpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWm3lQAKCRB4tDGHoIJi
0nX0AQCpYcMDvEZkiURX4HuWR6f07qzIgnGA3t5YUQXybVgkdgEA8aFCzMsJ+OAw
e4Eamn2O6nkQzVIqTW2OfkCeXoYouAk=
=MSGD
-----END PGP SIGNATURE-----

--wYVOP/ERUSSrsdpK--

