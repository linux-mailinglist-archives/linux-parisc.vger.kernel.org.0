Return-Path: <linux-parisc+bounces-105-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E87FE76C
	for <lists+linux-parisc@lfdr.de>; Thu, 30 Nov 2023 03:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44869B20C01
	for <lists+linux-parisc@lfdr.de>; Thu, 30 Nov 2023 02:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B3A38C;
	Thu, 30 Nov 2023 02:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-parisc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF790CC;
	Wed, 29 Nov 2023 18:52:29 -0800 (PST)
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 0CD43406F7;
	Thu, 30 Nov 2023 02:52:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 2F8892000D;
	Thu, 30 Nov 2023 02:52:25 +0000 (UTC)
Message-ID: <81c62af671ebbfad61dd46aa056050a56bf535a2.camel@perches.com>
Subject: Re: [PATCH v3 2/7] kexec_file: print out debugging message if
 required
From: Joe Perches <joe@perches.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org, 
	akpm@linux-foundation.org, nathan@kernel.org
Date: Wed, 29 Nov 2023 18:52:24 -0800
In-Reply-To: <20231130023955.5257-3-bhe@redhat.com>
References: <20231130023955.5257-1-bhe@redhat.com>
	 <20231130023955.5257-3-bhe@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2F8892000D
X-Stat-Signature: gwk7qi3h7jx8h1ywf1jic8xo76gqerwm
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19dPUefOesSFHLQCs3wqOW/oGlv3aC7z+4=
X-HE-Tag: 1701312745-366478
X-HE-Meta: U2FsdGVkX18k/ADXByHc+CtueZc2/kIRg2iYeavR6SwxdbkG44laEheGJWfEZEWXVPPjQNlGsgWVgExQ2v2SkjkkfNjpPwEMSuNPMyCDovT0AEEC3qeJ3Q3CanYRUyaIkLf9UCVzbPHogNji1emX5sy1KMlEpsNMU2L1IT5Ygh0f8/d2RbC7l5Zlkk01sF8weznUFCSh7sTGbvtjt1bjs0D9vOhDdBlZRMDNhbUzmGZ+P97DoYPvnsvnrduPVTPJ/denAd96V06q4DDxaFl1zt06dspwDHAATuNX205GsU5+pYEk/u0vlxrjfS1T3iX3

On Thu, 2023-11-30 at 10:39 +0800, Baoquan He wrote:
> Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> loading related codes.

trivia:

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
[]
> @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *me=
m, int need_kernel_map,
>  		phdr->p_filesz =3D phdr->p_memsz =3D mend - mstart + 1;
>  		phdr->p_align =3D 0;
>  		ehdr->e_phnum++;
> -		pr_debug("Crash PT_LOAD ELF header. phdr=3D%p vaddr=3D0x%llx, paddr=3D=
0x%llx, sz=3D0x%llx e_phnum=3D%d p_offset=3D0x%llx\n",
> -			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> -			ehdr->e_phnum, phdr->p_offset);
> +#ifdef CONFIG_KEXEC_FILE
> +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=3D%p vaddr=3D0x%llx, pad=
dr=3D0x%llx, "
> +			      "sz=3D0x%llx e_phnum=3D%d p_offset=3D0x%llx\n",
> +			      phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> +			      ehdr->e_phnum, phdr->p_offset);
> +#endif

Perhaps run checkpatch and coalesce the format string.


