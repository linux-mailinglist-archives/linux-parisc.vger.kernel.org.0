Return-Path: <linux-parisc+bounces-139-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411A8038FA
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Dec 2023 16:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8AD4B20B13
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Dec 2023 15:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747862C1BD;
	Mon,  4 Dec 2023 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V7tXFai2"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB50CA
	for <linux-parisc@vger.kernel.org>; Mon,  4 Dec 2023 07:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701704297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=seX/SDI/jMTwPP8d5rMNciSYOZJKlVgmv/OT9coCj5g=;
	b=V7tXFai2ZFuwNkJtaNZbQ5UxaEItWrYl+ugwZoTieksVsLtj+P3pav5KwKY6QlNjlLc/C4
	CPrd2+UyrT35GvTaLm22VKcBk2p0/C7ust4snJVQN40A1aGnWYGCuo38QwdkmAXkIjoBvE
	5R/FgOu5d3pFqzf2TalllWeaUvCzBXs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-BwYS5IDnOmyxJYurhDYIqw-1; Mon, 04 Dec 2023 10:38:10 -0500
X-MC-Unique: BwYS5IDnOmyxJYurhDYIqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C350811E88;
	Mon,  4 Dec 2023 15:38:09 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B081E1C060AE;
	Mon,  4 Dec 2023 15:38:08 +0000 (UTC)
Date: Mon, 4 Dec 2023 23:38:05 +0800
From: Baoquan He <bhe@redhat.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	joe@perches.com, nathan@kernel.org
Subject: Re: [PATCH v3 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <ZW3yXWJ7rTrtZzyg@MiWiFi-R3L-srv>
References: <20231130023955.5257-1-bhe@redhat.com>
 <20231130023955.5257-6-bhe@redhat.com>
 <20231201-blog-blasphemy-985d2665903c@wendy>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201-blog-blasphemy-985d2665903c@wendy>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

On 12/01/23 at 10:38am, Conor Dooley wrote:
> On Thu, Nov 30, 2023 at 10:39:53AM +0800, Baoquan He wrote:
> 
> $subject has a typo in the arch bit :)

Indeed, will fix if need report. Thanks for careful checking.

> 
> > Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > loading related codes.
> 
> Commit messages should be understandable in isolation, but this only
> explains (part of) what is obvious in the diff. Why is this change
> being made?

The purpose has been detailedly described in cover letter and patch 1
log. Andrew has picked these patches into his tree and grabbed the cover
letter log into the relevant commit for people's later checking. All
these seven patches will be present in mainline together. This is common
way when posting patch series? Please let me know if I misunderstand
anything.
> 
> > 
> > And also remove kexec_image_info() because the content has been printed
> > out in generic code.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  arch/riscv/kernel/elf_kexec.c     | 11 ++++++-----
> >  arch/riscv/kernel/machine_kexec.c | 26 --------------------------
> >  2 files changed, 6 insertions(+), 31 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> > index e60fbd8660c4..5bd1ec3341fe 100644
> > --- a/arch/riscv/kernel/elf_kexec.c
> > +++ b/arch/riscv/kernel/elf_kexec.c
> > @@ -216,7 +216,6 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> >  	if (ret)
> >  		goto out;
> >  	kernel_start = image->start;
> > -	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
> >  
> >  	/* Add the kernel binary to the image */
> >  	ret = riscv_kexec_elf_load(image, &ehdr, &elf_info,
> > @@ -252,8 +251,8 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> >  		image->elf_load_addr = kbuf.mem;
> >  		image->elf_headers_sz = headers_sz;
> >  
> > -		pr_debug("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
> > -			 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> > +		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
> > +			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> >  
> >  		/* Setup cmdline for kdump kernel case */
> >  		modified_cmdline = setup_kdump_cmdline(image, cmdline,
> > @@ -275,6 +274,8 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> >  		pr_err("Error loading purgatory ret=%d\n", ret);
> >  		goto out;
> >  	}
> > +	kexec_dprintk("Loaded purgatory at 0x%lx\n", kbuf.mem);
> > +
> >  	ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
> >  					     &kernel_start,
> >  					     sizeof(kernel_start), 0);
> > @@ -293,7 +294,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> >  		if (ret)
> >  			goto out;
> >  		initrd_pbase = kbuf.mem;
> 
> > -		pr_notice("Loaded initrd at 0x%lx\n", initrd_pbase);
> > +		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_pbase);
> 
> This is not a pr_debug().
> 
> >  	}
> >  
> >  	/* Add the DTB to the image */
> > @@ -318,7 +319,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> >  	}
> >  	/* Cache the fdt buffer address for memory cleanup */
> >  	image->arch.fdt = fdt;
> 
> > -	pr_notice("Loaded device tree at 0x%lx\n", kbuf.mem);
> > +	kexec_dprintk("Loaded device tree at 0x%lx\n", kbuf.mem);
> 
> Neither is this. Why are they being moved from pr_notice()?

You are right. 

While always printing out the loaded location of purgatory and
device tree doesn't make sense. It will be confusing when users
see these even when they do normal kexec/kdump loading. It should be
changed to pr_debug().

Which way do you suggest?
1) change it back to pr_debug(), fix it in another patch;
2) keep it as is in the patch;

Thanks
Baoquan


