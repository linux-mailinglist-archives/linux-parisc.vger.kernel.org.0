Return-Path: <linux-parisc+bounces-56-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D83897F6E71
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 09:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9123E281412
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 08:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4184C46A8;
	Fri, 24 Nov 2023 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F4thSS2t"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDAEAD
	for <linux-parisc@vger.kernel.org>; Fri, 24 Nov 2023 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700815242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TtiruDUnh8gIdyydjQh1DSHosPodlSxaPwJiylzKhys=;
	b=F4thSS2tcNtsIBSxb9UmTsg3yRymx+/UJCKri+bf7PDNdTsrFVTGYat4Kn77z5JOxiam0s
	a27ws93ho2CgCRVvB3YuQI2hOneCVtzak+GqCtBWaS4vhscs8D+/U4ryTCuol2+UGVg75B
	X9AQVfI9XFDorHL7e3GwNOXY0uunD2M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-QXyK2TnoOxKNhbHg3BDyOw-1; Fri, 24 Nov 2023 03:40:39 -0500
X-MC-Unique: QXyK2TnoOxKNhbHg3BDyOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98B7D828CEA;
	Fri, 24 Nov 2023 08:40:38 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D59C0112130A;
	Fri, 24 Nov 2023 08:40:36 +0000 (UTC)
Date: Fri, 24 Nov 2023 16:40:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	nathan@kernel.org, yujie.liu@intel.com
Subject: Re: [PATCH v2 2/7] kexec_file: print out debugging message if
 required
Message-ID: <ZWBhgfhFONEYcJZf@MiWiFi-R3L-srv>
References: <20231124033642.520686-1-bhe@redhat.com>
 <20231124033642.520686-3-bhe@redhat.com>
 <971ed2ceaeeba882d2b4c39015ee5ae5db3f5e82.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <971ed2ceaeeba882d2b4c39015ee5ae5db3f5e82.camel@perches.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

On 11/23/23 at 11:16pm, Joe Perches wrote:
> On Fri, 2023-11-24 at 11:36 +0800, Baoquan He wrote:
> > Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > loading related codes.
> 
> trivia for pr_debug -> kexec_dprintk conversions for
> the entire patch set:

OK, will check all patchset and adjust the indendation, thanks.

> 
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> []
> > @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
> >  		phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
> >  		phdr->p_align = 0;
> >  		ehdr->e_phnum++;
> > -		pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> > +#ifdef CONFIG_KEXEC_FILE
> > +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, "
> > +			"sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> >  			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> >  			ehdr->e_phnum, phdr->p_offset);
> 
> It's good form to rewrap continuation lines to the open parenthesis
> 
> > diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> []
> > @@ -389,11 +391,12 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
> >  	if (ret)
> >  		goto out;
> >  
> > +	kexec_dprintk("nr_segments = %lu\n", image->nr_segments);
> >  	for (i = 0; i < image->nr_segments; i++) {
> >  		struct kexec_segment *ksegment;
> >  
> >  		ksegment = &image->segment[i];
> > -		pr_debug("Loading segment %d: buf=0x%p bufsz=0x%zx mem=0x%lx memsz=0x%zx\n",
> > +		kexec_dprintk("segment[%d]: buf=0x%p bufsz=0x%zx mem=0x%lx memsz=0x%zx\n",
> >  			 i, ksegment->buf, ksegment->bufsz, ksegment->mem,
> >  			 ksegment->memsz);
> 
> here too etc...
> 


