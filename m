Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3B207CD41
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 21:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfGaTzy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 15:55:54 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:55327 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbfGaTzy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 15:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
        bh=uNCIFY+Fos7ldk8ZT6u1s9j01q1f5HoG/hPDEkocXcw=; b=o8nnLTNut/evlvRWfvDFBe+ahq
        8Pp03AmzkcIIM0pDc4gRlz2Gzvkxcxp4gcqhmPHe15SWaJ/6ATKkWuNsogn/2UaHvvK28Z7RyQEFk
        qVxuxyjRKOIxr02Q62it9IMy9M/P8MgN++FRuUvgmH0ZsHFJt8RbBjn8c0bBza1YYY44=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hsuhU-0000qI-AZ; Wed, 31 Jul 2019 21:55:52 +0200
Date:   Wed, 31 Jul 2019 21:55:50 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: strip debug information when building compressed
 images
Message-ID: <20190731195550.GC23520@t470p.stackframe.org>
References: <20190731171923.24155-1-svens@stackframe.org>
 <20190731192835.GA14352@ls3530.fritz.box>
 <20190731193601.GA26551@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190731193601.GA26551@ls3530.fritz.box>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Wed, Jul 31, 2019 at 09:36:01PM +0200, Helge Deller wrote:
> * Helge Deller <deller@gmx.de>:
> > * Sven Schnelle <svens@stackframe.org>:
> > > When compiling the kernel with debug information i got the following =
error:
> > >
> > > hppa-linux-gnu-ld: section .text LMA [0000000000e78000,0000000000e7b4=
1f] overlaps section .rodata.compressed LMA [00000000000e0078,00000000015ad=
43d]
> > > make[3]: *** [/home/svens/parisc-linux/src/arch/parisc/boot/compresse=
d/Makefile:28: arch/parisc/boot/compressed/vmlinux] Error 1
> > > make[2]: *** [/home/svens/parisc-linux/src/arch/parisc/boot/Makefile:=
17: arch/parisc/boot/compressed/vmlinux] Error 2
> > > make[2]: Target 'arch/parisc/boot/bzImage' not remade because of erro=
rs.
> > >
> > > While this might also be fixed by adjusting the linker script, i thin=
k we
> > > should strip the debug information when generating the compressed ima=
ge. This
> > > reduces the size of vmlinuz/lifimage from ~69MB to 6.6MB when full de=
bug
> > > information is enabled.
> >
> > I think keeping debug info is good.
> > Can you test this patch instead?
> > It converts a 141MB vmlinux boot file (with debug info) to a 32M vmlinu=
z for me.
> >
> > Ideally I would prefer something like
> >   . =3D MIN_OR_HIGHER_THAN_CURRENT_ADDR((SZ_end - SZparisc_kernel_start=
 + KERNEL_BINARY_TEXT_START));
> > to avoid the ifdef, but I'm missing the linker script expert knowledge.=
=2E.
>=20
> Here is an updated patch without ifdefs:
> Helge
>=20
> diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boot=
/compressed/vmlinux.lds.S
> index bfd7872739a3..2ac3a643f2eb 100644
> --- a/arch/parisc/boot/compressed/vmlinux.lds.S
> +++ b/arch/parisc/boot/compressed/vmlinux.lds.S
> @@ -48,8 +48,8 @@ SECTIONS
>  		*(.rodata.compressed)
>  	}
>=20
> -	/* bootloader code and data starts behind area of extracted kernel */
> -	. =3D (SZ_end - SZparisc_kernel_start + KERNEL_BINARY_TEXT_START);
> +	/* bootloader code and data starts at least behind area of extracted ke=
rnel */
> +	. =3D MAX(ABSOLUTE(.), (SZ_end - SZparisc_kernel_start + KERNEL_BINARY_=
TEXT_START));
>=20
>  	/* align on next page boundary */
>  	. =3D ALIGN(4096);

With full debug and a 64 Bit Build i get now (vmlinux is 128M):

  LD      vmlinux
  SORTEX  vmlinux
  SYSMAP  System.map
/sbin/palo -f ./palo.conf
palo version 2.00 http://www.parisc-linux.org - Mon, 01 Jan 2018 21:07:58 +=
0100
uncompressing Linux kernel.................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E...........
Decompression error:=20
uncompressed image too long - wouldn't fit into destination
vmlinuz is not a recognizable executable (ELF32 or ELF64)
make[1]: *** [arch/parisc/Makefile:130: lifimage] Error 2
make[1]: Leaving directory '/home/svens/parisc-linux/build64'
make: *** [Makefile:179: sub-make] Error 2

