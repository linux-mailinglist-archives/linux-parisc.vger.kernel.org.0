Return-Path: <linux-parisc+bounces-138-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9689F802D70
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Dec 2023 09:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B7D91F210CA
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Dec 2023 08:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF37E565;
	Mon,  4 Dec 2023 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JUUvZTY8"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9701713
	for <linux-parisc@vger.kernel.org>; Mon,  4 Dec 2023 00:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701679401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNLdrMB2tgHHf0igk8Wyh8lratwDZ12KyFRCSXbkkjQ=;
	b=JUUvZTY8tovLBQrNwxQxXQ3BQKuXv1eJw26+H9TZDH0qA4a18QWpc/2rhY5mYu2CZeVAa7
	EyVL/MtvBoRMjTiSRvY23OEzNj2KJvWYJmIADJiPl18x4ivtfZV3AxAiNOFxamCN56sMOi
	Z7yk7jAF/G/1SxdblMp2asi/y8W7dBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-S3KQUAwxNAKg8YP9LTNJfQ-1; Mon, 04 Dec 2023 03:43:18 -0500
X-MC-Unique: S3KQUAwxNAKg8YP9LTNJfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC51685A5B5;
	Mon,  4 Dec 2023 08:43:17 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF09C36E2;
	Mon,  4 Dec 2023 08:43:08 +0000 (UTC)
Date: Mon, 4 Dec 2023 16:43:05 +0800
From: Baoquan He <bhe@redhat.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	nathan@kernel.org
Subject: Re: [PATCH v3 2/7] kexec_file: print out debugging message if
 required
Message-ID: <ZW2RGdFFsO1yIaZm@MiWiFi-R3L-srv>
References: <20231130023955.5257-1-bhe@redhat.com>
 <20231130023955.5257-3-bhe@redhat.com>
 <81c62af671ebbfad61dd46aa056050a56bf535a2.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81c62af671ebbfad61dd46aa056050a56bf535a2.camel@perches.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

On 11/29/23 at 06:52pm, Joe Perches wrote:
> On Thu, 2023-11-30 at 10:39 +0800, Baoquan He wrote:
> > Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > loading related codes.
> 
> trivia:
> 
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> []
> > @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
> >  		phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
> >  		phdr->p_align = 0;
> >  		ehdr->e_phnum++;
> > -		pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> > -			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> > -			ehdr->e_phnum, phdr->p_offset);
> > +#ifdef CONFIG_KEXEC_FILE
> > +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, "
> > +			      "sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> > +			      phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> > +			      ehdr->e_phnum, phdr->p_offset);
> > +#endif
> 
> Perhaps run checkpatch and coalesce the format string.

Sorry for being late to reply, this comment was missed.

I broke it into two because it's a too long line and not friendly for
reading. I did notice there's such line breaking code. I can change it
if it's not suggested. Thanks for careful checking.


