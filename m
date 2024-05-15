Return-Path: <linux-parisc+bounces-1415-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A378C6B89
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2024 19:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29DB21F20F42
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2024 17:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503A43EA7B;
	Wed, 15 May 2024 17:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s9HJpiRk"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DE539FE4
	for <linux-parisc@vger.kernel.org>; Wed, 15 May 2024 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715794427; cv=none; b=cwuF5p0a8uM3indYss04VT3oA7rMWL6WZPhyZuPibT0pjCv0dwzNJM6j1tzdhkhEr6n+wcx65AXDJFrmtO1Bf9ssbGRhoAAcOjW+9dRZLkOury5w1hSd4FvjQxP/RE1SaNceEFlP6BSaK/PBdPzVoUCQPGaJ2pzZMSGeeyG8qWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715794427; c=relaxed/simple;
	bh=BczV/FF4eIzKWVrSkkC8DYFt1QqsMU4CdnShIk6/U3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCcdxwhw9uhcApmNnQRj5NsZcJtJD0ffRij+IeGX24bMAJfiFsEkHew8SErkZoUwDXGck2byiczatIYlo+VvV0zTt3/7dD/tUYXg7Io5cQvwif7z5WwMuCXGdu2UVJRL/GfayhrZUOfPP1BfnrvpQfdnbWV1NAAPbpCz5MmpbbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s9HJpiRk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34f0e55787aso5649994f8f.2
        for <linux-parisc@vger.kernel.org>; Wed, 15 May 2024 10:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715794424; x=1716399224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REXKNTAxo862A8ReBddrMUjz3K+lbyLjZMQEflUAct8=;
        b=s9HJpiRkvmLjvVF7EK6rqcWhZkYTfdp2i6sAc9gf8G1joqcuqe2fWvimC+lsmN3Iyd
         F/cIbxok4h0TDxs92Inlt/2O7VG4Cj+87c3kIDhEPkVtlaA75A2wV+zbyZ28dHNYFFfW
         /jeTm02s5ZuxCBjiLa1zQGr0Bw/smD0d1UnSLujEVLuVuJqK5b+69a0I9Tf81n3wVNdC
         qhhieCMWqWhp8PCF9wYIQmHJnuq47Gk7fK0NsKMua0j/90CLBIpTpGhG++B7aKI/4AzA
         vOydfcGb1+1O9u6VAR213zUoSTE2hjdn0Yg8JN7KyVjWX98U2tJ6uee3uH3TrK0r3ffv
         ChDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715794424; x=1716399224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REXKNTAxo862A8ReBddrMUjz3K+lbyLjZMQEflUAct8=;
        b=AXlBa29yCOO7VH3OTM/CRcuhFy8rCJOrPcMELhE2aESHLw8KGzt2TBOEpOfKCNqWxp
         TtjlTXG2Vjx4Ln8Nyu2nHv14y/51bKm0raYgu9VB/HnUgTqNbn69icHcp9fAsAWj6gmY
         nfqpdoyVVDwY0pglNHxX+Ro32WmmSMET5Q6WmO7g7bJDkWd4fxVAYBjXd2ZcHn+bmSej
         2YZ0jCoPMryD8jKUcgK+muHkpytlYmyNIBbntlTRtjXzKPqvlJ20nFbiGfMRRFiDkQdb
         ZB/1sp2Vcoj08Sw/4ioah41+RSiTuzRhau1UIRzegKI9c1scPMomc9a3Rx6qOFQ0McCm
         cgIg==
X-Forwarded-Encrypted: i=1; AJvYcCWRNJWMMrMDEaoHdmqzGJU07ROKhkrgup0tqEGCf2GiCERUkjucuAxCbMD3/g6j5sOjvygGFDv8XC3iSLl32Nc6LTbF2+otmh33jgzt
X-Gm-Message-State: AOJu0YyL2yJcoyMzJs1EK7MOl2H8ftwG/hPj8oL1mhwH4fuMwxk9bpip
	+HcyLayh5SwbLUdIKsAWMWG0u0ESfM74FDPrNPJbzY2qs1ZRWTU7KW9TRXPdHuxJV/3zjk6+97L
	pt5mkEkgxgJdWUjkZ1ss0C59Baw4WM6NCXPKI
X-Google-Smtp-Source: AGHT+IECmpnR3hqErRAHKi5zZVxQqX+AzRVW0B5FrzgG6JtiQjlGQI3473zUOeMvDrH067XEBa75l4kB51sO6OrPOMs=
X-Received: by 2002:a5d:5351:0:b0:343:e02f:1a46 with SMTP id
 ffacd0b85a97d-3504a62fb12mr13056195f8f.2.1715794423681; Wed, 15 May 2024
 10:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com> <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
 <ZkSUaVx3uCIPkpkJ@localhost.localdomain>
In-Reply-To: <ZkSUaVx3uCIPkpkJ@localhost.localdomain>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Wed, 15 May 2024 10:33:03 -0700
Message-ID: <CAJHvVchGGJkEX=qroW=+N-RJDMDGuxM4xoGe7iOtRu9YcfxEEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker poison errors
To: Oscar Salvador <osalvador@suse.de>
Cc: Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, John Hubbard <jhubbard@nvidia.com>, 
	Liu Shixin <liushixin2@huawei.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 3:54=E2=80=AFAM Oscar Salvador <osalvador@suse.de> =
wrote:
>
> On Wed, May 15, 2024 at 12:41:42PM +0200, Borislav Petkov wrote:
> > On Fri, May 10, 2024 at 11:29:26AM -0700, Axel Rasmussen wrote:
> > > @@ -3938,7 +3938,7 @@ static vm_fault_t handle_pte_marker(struct vm_f=
ault *vmf)
> > >
> > >     /* Higher priority than uffd-wp when data corrupted */
> > >     if (marker & PTE_MARKER_POISONED)
> > > -           return VM_FAULT_HWPOISON;
> > > +           return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SILENT;
> >
> > If you know here that this poisoning should be silent, why do you have
> > to make it all complicated and propagate it into arch code, waste
> > a separate VM_FAULT flag just for that instead of simply returning here
> > a VM_FAULT_COMPLETED or some other innocuous value which would stop
> > processing the fault?
>
> AFAIK, He only wants it to be silent wrt. the arch fault handler not scre=
aming,
> but he still wants to be able to trigger force_sig_mceerr().

Right, the goal is to still have the process get a SIGBUS, but to
avoid the "MCE error" log message. The basic issue is, unprivileged
users can set these markers up, and thereby completely spam up the
log.

Also since this is a process-specific thing, and it's not a real
hardware poison event, it's unclear system admins care at all at a
global level (this is why we didn't want to switch to just
printk_ratelimited for example). Better to let the process handle the
SIGBUS however it likes for its use case (logging a message elsewhere,
etc.).

That said, one thing I'm not sure about is whether or not
VM_FAULT_SIGBUS is a viable alternative (returned for a new PTE marker
type specific to simulated poison). The goal of the simulated poison
feature is to "closely simulate" a real hardware poison event. If you
live migrate a VM from a host with real poisoned memory, to a new
host: you'd want to keep the same behavior if the guest accessed those
addresses again, so as not to confuse the guest about why it suddenly
became "un-poisoned". At a basic level I think VM_FAULT_SIGBUS gives
us what we want (send SIGBUS to the process, don't log about MCEs),
but I'm not confident I know all the differences vs. VM_FAULT_HWPOISON
on all the arches.

>
>
> --
> Oscar Salvador
> SUSE Labs

