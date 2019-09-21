Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23F23B9F68
	for <lists+linux-parisc@lfdr.de>; Sat, 21 Sep 2019 20:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbfIUShR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 21 Sep 2019 14:37:17 -0400
Received: from mout.gmx.net ([212.227.17.21]:48825 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727819AbfIUShR (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 21 Sep 2019 14:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1569091014;
        bh=hqjvwzppDjGKd8U3eKNJx7a7V9OG0RblxlxY+UuLw7g=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Uu+i3aQWKZR3yq2eFY3ISNuqxb/biQkQRmoTjMyRRpAF8WD0fgs9F0N+uZG7QZQ3w
         v+aklsm/RFLYwsfZqG/K3IaFSFBYKKFsx4BLOF6gZ5ohXYg8v9mRALX3ndHO8kN4/S
         X8rMt4DGO8iWlqbXmxd+rttZg13jvVbhqQh69CXk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.133]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCfJ-1igjNX0v6P-00VAUu; Sat, 21
 Sep 2019 20:36:54 +0200
Subject: Re: [PATCH] kexec-tools: add support for PARISC architecture
To:     Sven Schnelle <svens@stackframe.org>,
        Simon Horman <horms@verge.net.au>
Cc:     kexec@lists.infradead.org, linux-parisc@vger.kernel.org
References: <20190919182624.8543-1-svens@stackframe.org>
From:   Helge Deller <deller@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=deller@gmx.de; keydata=
 xsBNBFDPIPYBCAC6PdtagIE06GASPWQJtfXiIzvpBaaNbAGgmd3Iv7x+3g039EV7/zJ1do/a
 y9jNEDn29j0/jyd0A9zMzWEmNO4JRwkMd5Z0h6APvlm2D8XhI94r/8stwroXOQ8yBpBcP0yX
 +sqRm2UXgoYWL0KEGbL4XwzpDCCapt+kmarND12oFj30M1xhTjuFe0hkhyNHkLe8g6MC0xNg
 KW3x7B74Rk829TTAtj03KP7oA+dqsp5hPlt/hZO0Lr0kSAxf3kxtaNA7+Z0LLiBqZ1nUerBh
 OdiCasCF82vQ4/y8rUaKotXqdhGwD76YZry9AQ9p6ccqKaYEzWis078Wsj7p0UtHoYDbABEB
 AAHNHEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT7CwJIEEwECADwCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEE9M/0wAvkPPtRU6Boh8nBUbUeOGQFAlrHzIICGQEACgkQh8nB
 UbUeOGT1GAgAt+EeoHB4DbAx+pZoGbBYp6ZY8L6211n8fSi7wiwgM5VppucJ+C+wILoPkqiU
 +ZHKlcWRbttER2oBUvKOt0+yDfAGcoZwHS0P+iO3HtxR81h3bosOCwek+TofDXl+TH/WSQJa
 iaitof6iiPZLygzUmmW+aLSSeIAHBunpBetRpFiep1e5zujCglKagsW78Pq0DnzbWugGe26A
 288JcK2W939bT1lZc22D9NhXXRHfX2QdDdrCQY7UsI6g/dAm1d2ldeFlGleqPMdaaQMcv5+E
 vDOur20qjTlenjnR/TFm9tA1zV+K7ePh+JfwKc6BSbELK4EHv8J8WQJjfTphakYLVM7ATQRQ
 zyD2AQgA2SJJapaLvCKdz83MHiTMbyk8yj2AHsuuXdmB30LzEQXjT3JEqj1mpvcEjXrX1B3h
 +0nLUHPI2Q4XWRazrzsseNMGYqfVIhLsK6zT3URPkEAp7R1JxoSiLoh4qOBdJH6AJHex4CWu
 UaSXX5HLqxKl1sq1tO8rq2+hFxY63zbWINvgT0FUEME27Uik9A5t8l9/dmF0CdxKdmrOvGMw
 T770cTt76xUryzM3fAyjtOEVEglkFtVQNM/BN/dnq4jDE5fikLLs8eaJwsWG9k9wQUMtmLpL
 gRXeFPRRK+IT48xuG8rK0g2NOD8aW5ThTkF4apznZe74M7OWr/VbuZbYW443QQARAQABwsBf
 BBgBAgAJBQJQzyD2AhsMAAoJEIfJwVG1HjhkNTgH/idWz2WjLE8DvTi7LvfybzvnXyx6rWUs
 91tXUdCzLuOtjqWVsqBtSaZynfhAjlbqRlrFZQ8i8jRyJY1IwqgvHP6PO9s+rIxKlfFQtqhl
 kR1KUdhNGtiI90sTpi4aeXVsOyG3572KV3dKeFe47ALU6xE5ZL5U2LGhgQkbjr44I3EhPWc/
 lJ/MgLOPkfIUgjRXt0ZcZEN6pAMPU95+u1N52hmqAOQZvyoyUOJFH1siBMAFRbhgWyv+YE2Y
 ZkAyVDL2WxAedQgD/YCCJ+16yXlGYGNAKlvp07SimS6vBEIXk/3h5Vq4Hwgg0Z8+FRGtYZyD
 KrhlU0uMP9QTB5WAUvxvGy8=
Message-ID: <7250dbc3-9d6d-5971-216a-f164a6933f28@gmx.de>
Date:   Sat, 21 Sep 2019 20:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919182624.8543-1-svens@stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZbuE/dwVb3eh3YAOhzbZ7WAVkKHl/MB2KF111qUCWmv4xEKM+tZ
 c78YAF0HxD6GWfss/oz+F4d6S/xi/ni9LzU/AHHo4sqC9O4CGWyQnWYoX6nV7DRoXO6/uae
 g8rS6vqcEQz8q3Fnm/uPKinBDtQPOu5iiODpqAMvl1W/kFEn0reuirEN6npGbExUlUPW4dQ
 kM7mzux/lH4p6dZf3CLdA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XbOb0A9t7JY=:QYla5JS0aW8ou96MqDJRc/
 zruRH2FBwlksrUwVd9EqZAkrhQiY5K2aEGaAqJRgf23MEst2rZYyjKiQP7dWM1QzdXKkfYrOa
 ncI7TmrjHIRY0p8XaMsT1IJI0fk8Lrt2VfRCrpqSNdC76DQiAXQGDNbFXBPCO14TCKyjjLdAt
 3+ANBQNjlIJOFy8FLrqH0apYjo8zaxgup694T89EXqPb+GiEesWmXsOIAP+4mUJeZoITBsugl
 F7WODeVNMtfRle7M0JGaUO/BGV2emWGb2lElLIWOScWsXOwpzaXPYmnq2U/p/zk0VfJdX+0Nt
 n/gCRBYJShGkSZ62L+AaBZPx9qS4BrXxAapsejJd6kbvfc7taX22+mw/oLGHHPYnKXxVVRiiB
 3ZRtNUiHIokiGOsqpiRE2gSNHhtWDkLCVDs9vjl+Saf5oVDoLpdOUf6NByMp/R9UUuwO3tNqt
 Pl9w9ZGk3NaY7hhX0/iVdJnNtp7rfimjnmKV795tVvlyHobmfYDJTTYArtXJfnUVJsJvPuh4h
 GrjFSaehxaX4GFXyPDtwyyLc9UfJ0SJJ2Yfi3UZdc/TAmJE18+ikNJEp1WU2HpOyv7isuEm2i
 dA9KJPUjTAy8SHWyVQG6u+K/KNa9mY5bFj3KNk+K5XTRVx1/FmpYREeqxP3Qe0PfzyYbPXJn5
 PKjYtuQetjJXUjATXDQB0nAsIrbHr/n21+NBB7MqAYjVodRD3xX1K33wXfvcyimDgTz6mrFWx
 n38Zyh6q/FqYkHuVJoBnS9VwRP0RPxEUyH9skIKT2De8z53DJFAQ8Q7qHZCKbYZS8i5zCLdxk
 7KQY8Svsu2zIRmZeDaHbmx17q0BpZvrSI9xao6Szj6H4XJUssxL/aDYAD97rkeXkbyjZR2qct
 HDAvARoVJzsNLxkMrXG9MS+dj3EUmPxRF+vMMHxZQNZEV809ygxU1EWb94IXLh4nOb0IM8N0q
 a+G64z1WV4rdvLGT32fhuJnFXI8DiC/VRVl7GE5o4YY1gtA6ZDrvPEWJUkl7xHeyQO9vVZhap
 DU31NPj9GG4HRMWMuAHbvUaQj/t/ggwEkOVXlpQTTKwgIeNBxhjISEWtxGDV1T6lhEzM77gNI
 TYNuvy/DFAV74NylYea7XpjaHbFORWgGfFz9abKwW5MkK//q/fw6J7eZZHNBh2rLZkA7EDvOF
 z1tVnL4y0nE6i8CWpIDKDmpitpxbq/i/O6mLchhfjqTwRuYE5lXJMQ8SxJVlaI6w8oIgZMkXg
 fx39ywIFy4It7UVM6ZCHjcYPzmDDDLQlP2dvz0fYfplU7s6NWWq1NNIzMGnI=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 19.09.19 20:26, Sven Schnelle wrote:
> This patch adds support for the parisc Architecture. kexec support
> for parisc is included with linux-5.4.
>
> Signed-off-by: Sven Schnelle <svens@stackframe.org>

Tested-by: Helge Deller <deller@gmx.de>

> ---
>  configure.ac                           |   3 +
>  kexec/Makefile                         |   1 +
>  kexec/arch/hppa/Makefile               |  13 ++
>  kexec/arch/hppa/include/arch/options.h |  32 +++++
>  kexec/arch/hppa/kexec-elf-hppa.c       | 159 +++++++++++++++++++++++++
>  kexec/arch/hppa/kexec-elf-rel-hppa.c   |  37 ++++++
>  kexec/arch/hppa/kexec-hppa.c           | 148 +++++++++++++++++++++++
>  kexec/arch/hppa/kexec-hppa.h           |   9 ++
>  kexec/kexec-syscall.h                  |   4 +
>  9 files changed, 406 insertions(+)
>  create mode 100644 kexec/arch/hppa/Makefile
>  create mode 100644 kexec/arch/hppa/include/arch/options.h
>  create mode 100644 kexec/arch/hppa/kexec-elf-hppa.c
>  create mode 100644 kexec/arch/hppa/kexec-elf-rel-hppa.c
>  create mode 100644 kexec/arch/hppa/kexec-hppa.c
>  create mode 100644 kexec/arch/hppa/kexec-hppa.h
>
> diff --git a/configure.ac b/configure.ac
> index 8474f7d..f025823 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -55,6 +55,9 @@ case $target_cpu in
>  	ia64|x86_64|alpha|m68k )
>  		ARCH=3D"$target_cpu"
>  		;;
> +	hppa*)
> +		ARCH=3D"hppa"
> +		;;
>  	* )
>  		AC_MSG_ERROR([unsupported architecture $target_cpu])
>  		;;
> diff --git a/kexec/Makefile b/kexec/Makefile
> index 4db84d8..8e3e9ea 100644
> --- a/kexec/Makefile
> +++ b/kexec/Makefile
> @@ -92,6 +92,7 @@ include $(srcdir)/kexec/arch/ppc64/Makefile
>  include $(srcdir)/kexec/arch/s390/Makefile
>  include $(srcdir)/kexec/arch/sh/Makefile
>  include $(srcdir)/kexec/arch/x86_64/Makefile
> +include $(srcdir)/kexec/arch/hppa/Makefile
>
>  KEXEC_SRCS +=3D $($(ARCH)_KEXEC_SRCS)
>
> diff --git a/kexec/arch/hppa/Makefile b/kexec/arch/hppa/Makefile
> new file mode 100644
> index 0000000..e98f6da
> --- /dev/null
> +++ b/kexec/arch/hppa/Makefile
> @@ -0,0 +1,13 @@
> +#
> +# kexec hppa (linux booting linux)
> +#
> +hppa_KEXEC_SRCS =3D  kexec/arch/hppa/kexec-hppa.c
> +hppa_KEXEC_SRCS +=3D kexec/arch/hppa/kexec-elf-hppa.c
> +hppa_KEXEC_SRCS +=3D kexec/arch/hppa/kexec-elf-rel-hppa.c
> +
> +hppa_ADD_SEGMENT =3D
> +hppa_VIRT_TO_PHYS =3D
> +
> +dist +=3D kexec/arch/hppa/Makefile $(hppa_KEXEC_SRCS)			\
> +	kexec/arch/hppa/kexec-hppa.h					\
> +	kexec/arch/hppa/include/arch/options.h
> diff --git a/kexec/arch/hppa/include/arch/options.h b/kexec/arch/hppa/in=
clude/arch/options.h
> new file mode 100644
> index 0000000..a936140
> --- /dev/null
> +++ b/kexec/arch/hppa/include/arch/options.h
> @@ -0,0 +1,32 @@
> +#ifndef KEXEC_ARCH_HPPA_OPTIONS_H
> +#define KEXEC_ARCH_HPPA_OPTIONS_H
> +
> +#define OPT_ARCH_MAX   (OPT_MAX+0)
> +
> +#define KEXEC_ARCH_OPTIONS \
> +	KEXEC_OPTIONS
> +
> +#define KEXEC_ARCH_OPT_STR KEXEC_OPT_STR ""
> +
> +#define KEXEC_ALL_OPTIONS \
> +	KEXEC_ARCH_OPTIONS \
> +	{ "command-line",	1, 0, OPT_APPEND },		\
> +	{ "reuse-cmdline",	0, 0, OPT_REUSE_CMDLINE },	\
> +	{ "append",		1, 0, OPT_APPEND },		\
> +	{ "initrd",		1, 0, OPT_RAMDISK },		\
> +	{ "ramdisk",		1, 0, OPT_RAMDISK },
> +
> +
> +#define KEXEC_ALL_OPT_STR KEXEC_ARCH_OPT_STR "a:r:s:"
> +
> +/* See the other architectures for details of these; HPPA has no
> + * loader-specific options yet.
> + */
> +#define OPT_ARCH_MAX       (OPT_MAX+0)
> +
> +#define OPT_APPEND		(OPT_ARCH_MAX+0)
> +#define OPT_REUSE_CMDLINE	(OPT_ARCH_MAX+1)
> +#define OPT_RAMDISK		(OPT_ARCH_MAX+2)
> +
> +#define MAX_MEMORY_RANGES 16
> +#endif /* KEXEC_ARCH_HPPA_OPTIONS_H */
> diff --git a/kexec/arch/hppa/kexec-elf-hppa.c b/kexec/arch/hppa/kexec-el=
f-hppa.c
> new file mode 100644
> index 0000000..d3ef0e9
> --- /dev/null
> +++ b/kexec/arch/hppa/kexec-elf-hppa.c
> @@ -0,0 +1,159 @@
> +/*
> + * kexec-elf-hppa.c - kexec Elf loader for hppa
> + *
> + * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
> + *
> + * This source code is licensed under the GNU General Public License,
> + * Version 2.  See the file COPYING for more details.
> +*/
> +
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <getopt.h>
> +#include <elf.h>
> +#include <boot/elf_boot.h>
> +#include <ip_checksum.h>
> +#include "../../kexec.h"
> +#include "../../kexec-elf.h"
> +#include "../../kexec-syscall.h"
> +#include "kexec-hppa.h"
> +#include <arch/options.h>
> +
> +#define PAGE_SIZE	4096
> +
> +extern unsigned long phys_offset;
> +
> +int elf_hppa_probe(const char *buf, off_t len)
> +{
> +	struct mem_ehdr ehdr;
> +	int result;
> +	result =3D build_elf_exec_info(buf, len, &ehdr, 0);
> +	if (result < 0)
> +		goto out;
> +
> +	phys_offset =3D ehdr.e_entry & 0xf0000000;
> +	/* Verify the architecuture specific bits */
> +	if (ehdr.e_machine !=3D EM_PARISC) {
> +		/* for a different architecture */
> +		fprintf(stderr, "Not for this architecture.\n");
> +		result =3D -1;
> +		goto out;
> +	}
> +	result =3D 0;
> + out:
> +	free_elf_info(&ehdr);
> +	return result;
> +}
> +
> +void elf_hppa_usage(void)
> +{
> +	printf("    --command-line=3DSTRING Set the kernel command line to STR=
ING\n"
> +	       "    --append=3DSTRING       Set the kernel command line to STR=
ING\n"
> +	       "    --reuse-cmdline       Use kernel command line from running=
 system.\n"
> +	       "    --ramdisk=3DFILE        Use FILE as the kernel's initial r=
amdisk.\n"
> +	       "    --initrd=3DFILE         Use FILE as the kernel's initial r=
amdisk.\n"
> +	       );
> +}
> +
> +int elf_hppa_load(int argc, char **argv, const char *buf, off_t len,
> +	struct kexec_info *info)
> +{
> +	struct mem_ehdr ehdr;
> +	char *cmdline =3D NULL, *ramdisk =3D NULL;
> +	int opt, result, i;
> +	unsigned long ramdisk_addr =3D 0;
> +	off_t ramdisk_size =3D 0;
> +
> +	static const struct option options[] =3D {
> +		KEXEC_ALL_OPTIONS
> +		{ 0,                    0, NULL, 0 },
> +	};
> +
> +	static const char short_options[] =3D KEXEC_ALL_OPT_STR "d";
> +
> +	while ((opt =3D getopt_long(argc, argv, short_options, options, 0)) !=
=3D
> +		-1) {
> +		switch (opt) {
> +		default:
> +			/* Ignore core options */
> +			if (opt < OPT_ARCH_MAX)
> +				break;
> +		case OPT_APPEND:
> +			cmdline =3D strdup(optarg);
> +			break;
> +		case OPT_REUSE_CMDLINE:
> +			cmdline =3D get_command_line();
> +			break;
> +		case OPT_RAMDISK:
> +			ramdisk =3D optarg;
> +			break;
> +		}
> +	}
> +
> +	if (info->file_mode) {
> +		if (cmdline) {
> +			info->command_line =3D cmdline;
> +			info->command_line_len =3D strlen(cmdline) + 1;
> +		}
> +
> +		if (ramdisk) {
> +			info->initrd_fd =3D open(ramdisk, O_RDONLY);
> +			if (info->initrd_fd =3D=3D -1) {
> +				fprintf(stderr, "Could not open initrd file "
> +					"%s:%s\n", ramdisk, strerror(errno));
> +				return -1;
> +			}
> +		}
> +		return 0;
> +	}
> +
> +	result =3D build_elf_exec_info(buf, len, &ehdr, 0);
> +	if (result < 0)
> +		die("ELF exec parse failed\n");
> +
> +	/* Fixup PT_LOAD segments that include the ELF header (offset zero) */
> +	for (i =3D 0; i < ehdr.e_phnum; i++) {
> +		struct mem_phdr *phdr;
> +		phdr =3D &ehdr.e_phdr[i];
> +		if (phdr->p_type !=3D PT_LOAD || phdr->p_offset)
> +			continue;
> +
> +		dbgprintf("Removing ELF header from segment %d\n", i);
> +		phdr->p_paddr +=3D PAGE_SIZE;
> +		phdr->p_vaddr +=3D PAGE_SIZE;
> +		phdr->p_filesz -=3D PAGE_SIZE;
> +		phdr->p_memsz -=3D PAGE_SIZE;
> +		phdr->p_offset +=3D PAGE_SIZE;
> +		phdr->p_data +=3D PAGE_SIZE;
> +	}
> +
> +	/* Load the ELF data */
> +	result =3D elf_exec_load(&ehdr, info);
> +	if (result < 0)
> +		die("ELF exec load failed\n");
> +
> +	info->entry =3D (void *)virt_to_phys(ehdr.e_entry);
> +
> +
> +	/* Load ramdisk */
> +	if (ramdisk) {
> +		void *initrd =3D slurp_decompress_file(ramdisk, &ramdisk_size);
> +		/* Store ramdisk at top of first memory chunk */
> +		ramdisk_addr =3D _ALIGN_DOWN(info->memory_range[0].end -
> +					   ramdisk_size + 1, PAGE_SIZE);
> +		if (!buf)
> +			die("Ramdisk load failed\n");
> +		add_buffer(info, initrd, ramdisk_size, ramdisk_size,
> +			   PAGE_SIZE, ramdisk_addr, info->memory_range[0].end,
> +			   1);
> +	}
> +
> +	return 0;
> +}
> diff --git a/kexec/arch/hppa/kexec-elf-rel-hppa.c b/kexec/arch/hppa/kexe=
c-elf-rel-hppa.c
> new file mode 100644
> index 0000000..661b67b
> --- /dev/null
> +++ b/kexec/arch/hppa/kexec-elf-rel-hppa.c
> @@ -0,0 +1,37 @@
> +/*
> + * kexec-elf-rel-hppa.c - kexec Elf relocation routines
> + *
> + * Copyright (C) 2019 Sven Schnelle <svens@stackframe.org>
> + *
> + * This source code is licensed under the GNU General Public License,
> + * Version 2.  See the file COPYING for more details.
> +*/
> +
> +#include <stdio.h>
> +#include <elf.h>
> +#include "../../kexec.h"
> +#include "../../kexec-elf.h"
> +
> +int machine_verify_elf_rel(struct mem_ehdr *ehdr)
> +{
> +	if (ehdr->ei_data !=3D ELFDATA2MSB)
> +		return 0;
> +	if (ehdr->e_machine !=3D EM_PARISC)
> +		return 0;
> +	return 1;
> +}
> +
> +void machine_apply_elf_rel(struct mem_ehdr *UNUSED(ehdr),
> +			   struct mem_sym *UNUSED(sym),
> +			   unsigned long r_type,
> +			   void *UNUSED(location),
> +			   unsigned long UNUSED(address),
> +			   unsigned long UNUSED(value))
> +{
> +	switch (r_type) {
> +	default:
> +		die("Unknown rela relocation: %lu\n", r_type);
> +		break;
> +	}
> +	return;
> +}
> diff --git a/kexec/arch/hppa/kexec-hppa.c b/kexec/arch/hppa/kexec-hppa.c
> new file mode 100644
> index 0000000..77c9739
> --- /dev/null
> +++ b/kexec/arch/hppa/kexec-hppa.c
> @@ -0,0 +1,148 @@
> +/*
> + * kexec-hppa.c - kexec for hppa
> + *
> + * Copyright (C) 2019 Sven Schnelle <svens@stackframe.org>
> + *
> + * This source code is licensed under the GNU General Public License,
> + * Version 2.  See the file COPYING for more details.
> + */
> +
> +#include <stddef.h>
> +#include <stdio.h>
> +#include <errno.h>
> +#include <stdint.h>
> +#include <string.h>
> +#include <getopt.h>
> +#include "../../kexec.h"
> +#include "../../kexec-syscall.h"
> +#include "kexec-hppa.h"
> +#include <arch/options.h>
> +
> +#define SYSTEM_RAM "System RAM\n"
> +#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> +
> +static struct memory_range memory_range[MAX_MEMORY_RANGES];
> +unsigned long phys_offset;
> +
> +/* Return a sorted list of available memory ranges. */
> +int get_memory_ranges(struct memory_range **range, int *ranges,
> +		unsigned long UNUSED(kexec_flags))
> +{
> +	const char *iomem =3D proc_iomem();
> +	int memory_ranges =3D 0;
> +	char line[512];
> +	FILE *fp;
> +
> +	fp =3D fopen(iomem, "r");
> +
> +	if (!fp) {
> +		fprintf(stderr, "Cannot open %s: %s\n",
> +			iomem, strerror(errno));
> +		return -1;
> +	}
> +
> +	while(fgets(line, sizeof(line), fp) !=3D 0) {
> +		unsigned long long start, end;
> +		char *str;
> +		int type;
> +		int consumed;
> +		int count;
> +
> +
> +		count =3D sscanf(line, "%llx-%llx : %n", &start, &end, &consumed);
> +
> +		if (count !=3D 2)
> +			continue;
> +
> +		str =3D line + consumed;
> +
> +		if (memcmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)) =3D=3D 0) {
> +			type =3D RANGE_RAM;
> +		} else if (memcmp(str, "reserved\n", 9) =3D=3D 0) {
> +			type =3D RANGE_RESERVED;
> +		} else {
> +			continue;
> +		}
> +
> +		memory_range[memory_ranges].start =3D start;
> +		memory_range[memory_ranges].end =3D end;
> +		memory_range[memory_ranges].type =3D type;
> +		if (++memory_ranges >=3D MAX_MEMORY_RANGES)
> +			break;
> +	}
> +	fclose(fp);
> +	*range =3D memory_range;
> +	*ranges =3D memory_ranges;
> +
> +	dbgprint_mem_range("MEMORY RANGES", *range, *ranges);
> +	return 0;
> +}
> +
> +struct file_type file_type[] =3D {
> +	{"elf-hppa", elf_hppa_probe, elf_hppa_load, elf_hppa_usage},
> +};
> +int file_types =3D ARRAY_SIZE(file_type);
> +
> +void arch_usage(void)
> +{
> +}
> +
> +int arch_process_options(int argc, char **argv)
> +{
> +	static const struct option options[] =3D {
> +		KEXEC_ALL_OPTIONS
> +		{ 0,			0, NULL, 0 },
> +	};
> +	static const char short_options[] =3D KEXEC_ALL_OPT_STR;
> +	int opt;
> +
> +	opterr =3D 0; /* Don't complain about unrecognized options here */
> +	while ((opt =3D getopt_long(argc, argv, short_options, options, 0)) !=
=3D
> +		-1) {
> +		switch (opt) {
> +		default:
> +			break;
> +		}
> +	}
> +	/* Reset getopt for the next pass; called in other source modules */
> +	opterr =3D 1;
> +	optind =3D 1;
> +	return 0;
> +}
> +
> +const struct arch_map_entry arches[] =3D {
> +	{ "parisc64", KEXEC_ARCH_HPPA },
> +	{ "parisc", KEXEC_ARCH_HPPA },
> +	{ NULL, 0 },
> +};
> +
> +int arch_compat_trampoline(struct kexec_info *UNUSED(info))
> +{
> +	return 0;
> +}
> +
> +void arch_update_purgatory(struct kexec_info *UNUSED(info))
> +{
> +}
> +
> +int is_crashkernel_mem_reserved(void)
> +{
> +	return 0;
> +}
> +
> +int get_crash_kernel_load_range(uint64_t *start, uint64_t *end)
> +{
> +	/* Crash kernel region size is not exposed by the system */
> +	return -1;
> +}
> +
> +void add_segment(struct kexec_info *info, const void *buf, size_t bufsz=
,
> +	unsigned long base, size_t memsz)
> +{
> +	add_segment_phys_virt(info, buf, bufsz, base, memsz, 1);
> +}
> +
> +unsigned long virt_to_phys(unsigned long addr)
> +{
> +	return addr - phys_offset;
> +}
> diff --git a/kexec/arch/hppa/kexec-hppa.h b/kexec/arch/hppa/kexec-hppa.h
> new file mode 100644
> index 0000000..485e5b6
> --- /dev/null
> +++ b/kexec/arch/hppa/kexec-hppa.h
> @@ -0,0 +1,9 @@
> +#ifndef KEXEC_HPPA_H
> +#define KEXEC_HPPA_H
> +
> +int elf_hppa_probe(const char *buf, off_t len);
> +int elf_hppa_load(int argc, char **argv, const char *buf, off_t len,
> +		  struct kexec_info *info);
> +void elf_hppa_usage(void);
> +
> +#endif /* KEXEC_HPPA_H */
> diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
> index 92d51d3..bea29d4 100644
> --- a/kexec/kexec-syscall.h
> +++ b/kexec/kexec-syscall.h
> @@ -74,6 +74,9 @@
>  #ifdef __aarch64__
>  #define __NR_kexec_file_load	294
>  #endif
> +#ifdef __hppa__
> +#define __NR_kexec_file_load	355
> +#endif
>
>  #ifndef __NR_kexec_file_load
>  /* system call not available for the arch */
> @@ -119,6 +122,7 @@ static inline long kexec_file_load(int kernel_fd, in=
t initrd_fd,
>  #define KEXEC_ARCH_DEFAULT ( 0 << 16)
>  #define KEXEC_ARCH_386     ( 3 << 16)
>  #define KEXEC_ARCH_68K     ( 4 << 16)
> +#define KEXEC_ARCH_HPPA    (15 << 16)
>  #define KEXEC_ARCH_X86_64  (62 << 16)
>  #define KEXEC_ARCH_PPC     (20 << 16)
>  #define KEXEC_ARCH_PPC64   (21 << 16)
>

