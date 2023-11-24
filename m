Return-Path: <linux-parisc+bounces-55-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B176A7F6CAE
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 08:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0E411C208DC
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 07:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8D05239;
	Fri, 24 Nov 2023 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-parisc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2258BD5E;
	Thu, 23 Nov 2023 23:16:52 -0800 (PST)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 6CC5C409CB;
	Fri, 24 Nov 2023 07:16:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 8CAE160009;
	Fri, 24 Nov 2023 07:16:47 +0000 (UTC)
Message-ID: <971ed2ceaeeba882d2b4c39015ee5ae5db3f5e82.camel@perches.com>
Subject: Re: [PATCH v2 2/7] kexec_file: print out debugging message if
 required
From: Joe Perches <joe@perches.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org, 
	akpm@linux-foundation.org, nathan@kernel.org, yujie.liu@intel.com
Date: Thu, 23 Nov 2023 23:16:46 -0800
In-Reply-To: <20231124033642.520686-3-bhe@redhat.com>
References: <20231124033642.520686-1-bhe@redhat.com>
	 <20231124033642.520686-3-bhe@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8CAE160009
X-Stat-Signature: r4oqtahenar8h64oxpqpoeo1n6zbhmda
X-Rspamd-Server: rspamout08
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19c0OHTlDrKhb/Xt6M9rvhAh1ufC3tVTnk=
X-HE-Tag: 1700810207-170549
X-HE-Meta: U2FsdGVkX1+zlhNkZ9x3SOlShl6+X96epMaKjfHehHKyBsMtcvgR7F6Ii1tgURKZMXTJ4v77gzWxOCKJjrZ32dyx27aEd7KJtn+JaKan9d1JoOg5vx5spjNriOlsrJsAsKTNWoXgbsaaF0Aw9htJa6iNVZZnaP/omO8ddnk/a1hUgTJ/UY7dIv6hTgWYnyt0dTxqhxdXpQIY0i9zYhv989Np0jXyZefmSBvNLtvm6dtRPbiigZYQ2nQLsoXdSGX2/vxVXndB66Niab3Fp1e04lrREsrM7se2cR96ydP7F6f9OXdC0ttkSA5n1SXD5cD7

On Fri, 2023-11-24 at 11:36 +0800, Baoquan He wrote:
> Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> loading related codes.

trivia for pr_debug -> kexec_dprintk conversions for
the entire patch set:

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
[]
> @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *me=
m, int need_kernel_map,
>  		phdr->p_filesz =3D phdr->p_memsz =3D mend - mstart + 1;
>  		phdr->p_align =3D 0;
>  		ehdr->e_phnum++;
> -		pr_debug("Crash PT_LOAD ELF header. phdr=3D%p vaddr=3D0x%llx, paddr=3D=
0x%llx, sz=3D0x%llx e_phnum=3D%d p_offset=3D0x%llx\n",
> +#ifdef CONFIG_KEXEC_FILE
> +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=3D%p vaddr=3D0x%llx, pad=
dr=3D0x%llx, "
> +			"sz=3D0x%llx e_phnum=3D%d p_offset=3D0x%llx\n",
>  			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
>  			ehdr->e_phnum, phdr->p_offset);

It's good form to rewrap continuation lines to the open parenthesis

> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
[]
> @@ -389,11 +391,12 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, in=
t, initrd_fd,
>  	if (ret)
>  		goto out;
> =20
> +	kexec_dprintk("nr_segments =3D %lu\n", image->nr_segments);
>  	for (i =3D 0; i < image->nr_segments; i++) {
>  		struct kexec_segment *ksegment;
> =20
>  		ksegment =3D &image->segment[i];
> -		pr_debug("Loading segment %d: buf=3D0x%p bufsz=3D0x%zx mem=3D0x%lx mem=
sz=3D0x%zx\n",
> +		kexec_dprintk("segment[%d]: buf=3D0x%p bufsz=3D0x%zx mem=3D0x%lx memsz=
=3D0x%zx\n",
>  			 i, ksegment->buf, ksegment->bufsz, ksegment->mem,
>  			 ksegment->memsz);

here too etc...


