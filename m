Return-Path: <linux-parisc+bounces-215-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD48F8108B3
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Dec 2023 04:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78E921F21175
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Dec 2023 03:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD3C6138;
	Wed, 13 Dec 2023 03:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dx0fNPtR"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42219B0
	for <linux-parisc@vger.kernel.org>; Tue, 12 Dec 2023 19:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702437797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kJBrP/wuvom17BSUXW0NG0A84o2uJgCWtjNkzp2u12s=;
	b=Dx0fNPtR7HcD2tznpS6HQrDWNi87tgak0hcVRYvaQtxgoTtF1yLbxZrcsWu1EaNzj4QrVW
	SSSW5po8eCSzj/oTaM9at9+TZDNxf11rNxLkYp8Nf0eRLdqeSXZsaVVIiw47LHW7RgEi4R
	elcbGnAdWeojmXIOKLuI19jCCHvtHsI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-qho-sWqZPYqtExHysk5vCA-1; Tue,
 12 Dec 2023 22:23:11 -0500
X-MC-Unique: qho-sWqZPYqtExHysk5vCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F9A43C29A62;
	Wed, 13 Dec 2023 03:23:10 +0000 (UTC)
Received: from localhost (unknown [10.72.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 519BB2026D66;
	Wed, 13 Dec 2023 03:23:09 +0000 (UTC)
Date: Wed, 13 Dec 2023 11:23:06 +0800
From: Baoquan He <bhe@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	joe@perches.com, nathan@kernel.org
Subject: Re: [PATCH v3 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <ZXkjmrWOH1dLbHGB@MiWiFi-R3L-srv>
References: <20231130023955.5257-1-bhe@redhat.com>
 <20231130023955.5257-6-bhe@redhat.com>
 <20231201-blog-blasphemy-985d2665903c@wendy>
 <ZW3yXWJ7rTrtZzyg@MiWiFi-R3L-srv>
 <20231204-liftoff-enclosure-d3e3daf0ab6e@spud>
 <ZXCVUD9cCYEShrrj@MiWiFi-R3L-srv>
 <20231206-pasta-embassy-c7250740b16c@spud>
 <ZXECHg37DRZ9BQsP@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXECHg37DRZ9BQsP@MiWiFi-R3L-srv>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On 12/07/23 at 07:22am, Baoquan He wrote:
> On 12/06/23 at 04:54pm, Conor Dooley wrote:
> > On Wed, Dec 06, 2023 at 11:37:52PM +0800, Baoquan He wrote:
> > > On 12/04/23 at 04:14pm, Conor Dooley wrote:
> > > > On Mon, Dec 04, 2023 at 11:38:05PM +0800, Baoquan He wrote:
> > > > > On 12/01/23 at 10:38am, Conor Dooley wrote:
> > > > > > On Thu, Nov 30, 2023 at 10:39:53AM +0800, Baoquan He wrote:
> > > > > > 
> > > > > > $subject has a typo in the arch bit :)
> > > > > 
> > > > > Indeed, will fix if need report. Thanks for careful checking.
> > > > > 
> > > > > > 
> > > > > > > Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > > > > > > loading related codes.
> > > > > > 
> > > > > > Commit messages should be understandable in isolation, but this only
> > > > > > explains (part of) what is obvious in the diff. Why is this change
> > > > > > being made?
> > > > > 
> > > > > The purpose has been detailedly described in cover letter and patch 1
> > > > > log. Andrew has picked these patches into his tree and grabbed the cover
> > > > > letter log into the relevant commit for people's later checking. All
> > > > > these seven patches will be present in mainline together. This is common
> > > > > way when posting patch series? Please let me know if I misunderstand
> > > > > anything.
> > > > 
> > > > Each patch having a commit message that explains why a change is being
> > > > made is the expectation. It is especially useful to explain the why
> > > > here, since it is not just a mechanical conversion of pr_debug()s as the
> > > > commit message suggests.
> > > 
> > > Sounds reasonable. I rephrase the patch 3 log as below, do you think
> > > it's OK to you?
> > 
> > Yes, but with one comment.
> > 
> > > 
> > > I will also adjust patch logs on other ARCH once this one is done.
> > > Thanks.
> > > 
> > > =============================
> > > Subject: [PATCH v3 5/7] kexec_file, ricv: print out debugging message if required
> > > 
> > > Then when specifying '-d' for kexec_file_load interface, loaded
> > > locations of kernel/initrd/cmdline etc can be printed out to help debug.
> > > 
> > > Here replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > > loading related codes.
> > > 
> > 
> > > And also replace pr_notice() with kexec_dprintk() in elf_kexec_load()
> > > because it's make sense to always print out loaded location of purgatory
>               ~
> > > and device tree even though users don't expect the message.
> 
> Fixed typo:
> ==========
> 
> And also replace pr_notice() with kexec_dprintk() in elf_kexec_load()
> because it doesn't make sense to always print out loaded location of
> purgatory and device tree even though users don't expect the message.

I will post v4 to include these suggested changes, please add comments
if there's any concern. Thanks for reviewing.

> 
> > 
> > This seems to contradict what you said in your earlier mail, about
> > moving these from notice to debug. I think you missed a negation in your
> > new version of the commit message. What you said in response to me seems
> > like a more complete explanation anyway:
> 
> Ah, I made mistake when typing, these printing is only for debugging,
> so always printing out them is not suggested.
> 
> > 	always printing out the loaded location of purgatory and
> > 	device tree doesn't make sense. It will be confusing when users
> > 	see these even when they do normal kexec/kdump loading.
> > 
> > Thanks,
> > Conor.
> > 
> > > And also remove kexec_image_info() because the content has been printed
> > > out in generic code.
> > > 
> > > ============================
> > > 
> > > > 
> > > > > > 
> > > > > > > 
> > > > > > > And also remove kexec_image_info() because the content has been printed
> > > > > > > out in generic code.
> > > > > > > 
> > > > > > > Signed-off-by: Baoquan He <bhe@redhat.com>
> > > > > > > ---
> > > > > > >  arch/riscv/kernel/elf_kexec.c     | 11 ++++++-----
> > > > > > >  arch/riscv/kernel/machine_kexec.c | 26 --------------------------
> > > > > > >  2 files changed, 6 insertions(+), 31 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> > > > > > > index e60fbd8660c4..5bd1ec3341fe 100644
> > > > > > > --- a/arch/riscv/kernel/elf_kexec.c
> > > > > > > +++ b/arch/riscv/kernel/elf_kexec.c
> > > > > > > @@ -216,7 +216,6 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> > > > > > >  	if (ret)
> > > > > > >  		goto out;
> > > > > > >  	kernel_start = image->start;
> > > > > > > -	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
> > > > > > >  
> > > > > > >  	/* Add the kernel binary to the image */
> > > > > > >  	ret = riscv_kexec_elf_load(image, &ehdr, &elf_info,
> > > > > > > @@ -252,8 +251,8 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> > > > > > >  		image->elf_load_addr = kbuf.mem;
> > > > > > >  		image->elf_headers_sz = headers_sz;
> > > > > > >  
> > > > > > > -		pr_debug("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
> > > > > > > -			 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> > > > > > > +		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
> > > > > > > +			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> > > > > > >  
> > > > > > >  		/* Setup cmdline for kdump kernel case */
> > > > > > >  		modified_cmdline = setup_kdump_cmdline(image, cmdline,
> > > > > > > @@ -275,6 +274,8 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> > > > > > >  		pr_err("Error loading purgatory ret=%d\n", ret);
> > > > > > >  		goto out;
> > > > > > >  	}
> > > > > > > +	kexec_dprintk("Loaded purgatory at 0x%lx\n", kbuf.mem);
> > > > > > > +
> > > > > > >  	ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
> > > > > > >  					     &kernel_start,
> > > > > > >  					     sizeof(kernel_start), 0);
> > > > > > > @@ -293,7 +294,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> > > > > > >  		if (ret)
> > > > > > >  			goto out;
> > > > > > >  		initrd_pbase = kbuf.mem;
> > > > > > 
> > > > > > > -		pr_notice("Loaded initrd at 0x%lx\n", initrd_pbase);
> > > > > > > +		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_pbase);
> > > > > > 
> > > > > > This is not a pr_debug().
> > > > > > 
> > > > > > >  	}
> > > > > > >  
> > > > > > >  	/* Add the DTB to the image */
> > > > > > > @@ -318,7 +319,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> > > > > > >  	}
> > > > > > >  	/* Cache the fdt buffer address for memory cleanup */
> > > > > > >  	image->arch.fdt = fdt;
> > > > > > 
> > > > > > > -	pr_notice("Loaded device tree at 0x%lx\n", kbuf.mem);
> > > > > > > +	kexec_dprintk("Loaded device tree at 0x%lx\n", kbuf.mem);
> > > > > > 
> > > > > > Neither is this. Why are they being moved from pr_notice()?
> > > > > 
> > > > > You are right. 
> > > > > 
> > > > > While always printing out the loaded location of purgatory and
> > > > > device tree doesn't make sense. It will be confusing when users
> > > > > see these even when they do normal kexec/kdump loading. It should be
> > > > > changed to pr_debug().
> > > > > 
> > > > > Which way do you suggest?
> > > > > 1) change it back to pr_debug(), fix it in another patch;
> > > > > 2) keep it as is in the patch;
> > > > 
> > > > Personally I think it is fine to change them all in one patch, but the
> > > > rationale for converting pr_notice() to your new debug infrastructure
> > > > needs to be in the commit message.
> > > 
> > > Sure, sounds good to me. I have changed the patch log to reflect this as
> > > you suggested, please help check. Thanks again.
> > > 
> 
> 


