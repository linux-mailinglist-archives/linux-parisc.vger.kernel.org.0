Return-Path: <linux-parisc+bounces-1379-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605038C1994
	for <lists+linux-parisc@lfdr.de>; Fri, 10 May 2024 00:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 849171C2178C
	for <lists+linux-parisc@lfdr.de>; Thu,  9 May 2024 22:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FE2770E0;
	Thu,  9 May 2024 22:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AQ+rQdz7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ABF12DD92
	for <linux-parisc@vger.kernel.org>; Thu,  9 May 2024 22:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294890; cv=none; b=Ryctbbidjx2Z8BW/qvmin++jSdUBHoHDcoZeKZF6Q+B+8Tv9aBL0GgcF6Dp4x4MNwGlWAxxGoiEjtDDM3W5uGNuSzLr5tDPPzLZ+gs5xBa8Y7dFziEbP2AbI8pNianTdljDZgnwK/8p//3ixwIjMgVkl6PBYi3PdrD15MMtgkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294890; c=relaxed/simple;
	bh=3pQ2pM0pNtObEYnZAZ2vpgXGO/JvkW+6q5AWn6pdmPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHrxTPm30p0Bg0LtyHnSXLLWxrzP5hsU1wTNzfsohQ7+kGG2BNjWOjommraiBs/orF1eCQhDXANkV+9R0UZfjVmlCIiJgkZlXeiArD1Ye0GUAIOTBwQnHM85DslOC4DhWUca6YEFQeEmWib9z1POIAtt4KaCd9rpfCIKtM1ylsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AQ+rQdz7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41fc2f7fbb5so7431045e9.1
        for <linux-parisc@vger.kernel.org>; Thu, 09 May 2024 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715294886; x=1715899686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIWDSYU6OuwVNwMdVt3NyqDL4ZMH/MF1rCPe+F0j3bE=;
        b=AQ+rQdz7blSFCviCN7OMSRrL/kuEMFX8gKxUdd1G0Wo4RwuH2950mOhgddCaClrvKO
         2zx6dggk+zGsqZz357yd9cqtCfuk5WAZV8vdrvim5dv0TUw6u5CnLPS/R1tA5eLE5sEP
         Fj4TYbUb+nNX2ntkcLrhhjW/LHH+c+eC6vAD08ZOMUKK5wtM5K2XXAQa0dgBnqF8FInl
         L/FPHtANzfU1NvjNwGowsgby5eHPmd51Gy/kVklAci4Mws24esDQh5DtUJ3wse3/bFXw
         DhvfJ5S3pwofuEWoPKSIUdGrkruEMqGs/2hSxg6hQsLgoYlQRAWCJ8nh51Ymavg9YYEh
         Fi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715294886; x=1715899686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIWDSYU6OuwVNwMdVt3NyqDL4ZMH/MF1rCPe+F0j3bE=;
        b=NBdz1OSTERC3/03rabcKQx4o2aAxjgsdxtn8bYTDzfDxWOskH61K96f7D4RW/iiNmQ
         CcmQKu8ZVJsr/w2eTbMKpqOAT9XRb7DdyL5HY7/Elh95U8H0bROjm2TiSiIxQ8QUDDYX
         GMfzVgWmDcjRLU7eT1fWdc/k5IO4Emimfrs0eJeBJnk5feU9gGZQNPl8E7VI7fyq/7p2
         dHx9sO8GM0DQU1LUwwELneYyQyL/KDNf30kTnO4QP79vH3fzJGb3jVl5ZYW1GJSu6ixA
         HzIGeGYVVGg3ojtrFs6EIrYa72MeZZXZ5jfB9OB9cWf74tUtHe/YcL3Qv+774zXP3dZo
         0Czw==
X-Forwarded-Encrypted: i=1; AJvYcCXEaYpzDbd8xKOE9BzP9xAFyi+9w3fbENww/TPRJo05GIOIE3U+Yih+8bFJR048cr4t9NMAFv5TM+OmR2Mpau8Ip6dETJz8ugHOoC0q
X-Gm-Message-State: AOJu0Yzu34yjYwks+11Bf/CZi5HYg31iEu/Cx4izJhby07OzcIbAhIG3
	qkQ6EBEqme40s8DsAfBJglmCQ5Zr25vpp8en30iUzQddX2t/Ez6DkbqOGvjDnnjmKVrZtEkaFA+
	VO81DOZa5UuNcpgrlFYII2k8Ts2k047Ask/Hl
X-Google-Smtp-Source: AGHT+IGJ/kKXUorUaZZLbLqtiS22JS9DgQC8DqDR6SQS2KcbUYgiLFSj2QMhwsrOQuNMZTIT+bZq0i18Q89RY9Bdtlc=
X-Received: by 2002:a5d:5f4e:0:b0:350:4da3:db43 with SMTP id
 ffacd0b85a97d-3504da3dde7mr436361f8f.35.1715294886227; Thu, 09 May 2024
 15:48:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509203907.504891-1-axelrasmussen@google.com>
 <20240509203907.504891-2-axelrasmussen@google.com> <d04a838b-848d-405d-9317-40282cd58c36@nvidia.com>
In-Reply-To: <d04a838b-848d-405d-9317-40282cd58c36@nvidia.com>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Thu, 9 May 2024 15:47:29 -0700
Message-ID: <CAJHvVciOwHNFBfhQhaQLwaby0VojNNw6Mx1kJ38dgc4cQgEksA@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch/fault: don't print logs for simulated poison errors
To: John Hubbard <jhubbard@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Liu Shixin <liushixin2@huawei.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Muchun Song <muchun.song@linux.dev>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 2:30=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> On 5/9/24 1:39 PM, Axel Rasmussen wrote:
> > For real MCEs, various architectures print log messages when poisoned
> > memory is accessed (which results in a SIGBUS). These messages can be
> > important for users to understand the issue.
> >
> > On the other hand, we have the userfaultfd UFFDIO_POISON operation,
> > which can "simulate" memory poisoning. That particular process will get
> > SIGBUS on access to the memory, but this effect is tied to an MM, rathe=
r
> > than being global like a real poison event. So, we don't want to log
> > about this case to the global kernel log; instead, let the process
> > itself log or whatever else it wants to do. This avoids spamming the
> > kernel log, and avoids e.g. drowning out real events with simulated
> > ones.
> >
> > To identify this situation, add a new VM_FAULT_HWPOISON_SIM flag. This
> > is expected to be set *in addition to* one of the existing
> > VM_FAULT_HWPOISON or VM_FAULT_HWPOISON_LARGE flags (which are mutually
> > exclusive).
> >
> > Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
> > ---
> >   arch/parisc/mm/fault.c   | 7 +++++--
> >   arch/powerpc/mm/fault.c  | 6 ++++--
> >   arch/x86/mm/fault.c      | 6 ++++--
> >   include/linux/mm_types.h | 5 +++++
> >   mm/hugetlb.c             | 3 ++-
> >   mm/memory.c              | 2 +-
> >   6 files changed, 21 insertions(+), 8 deletions(-)
> >
>
> This completely fixes the uffd-unit-test behavior, I just did a quick
> test run to be sure as well.
>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Thanks John!

And, no problem about the other patch, they aren't functionally
dependent, I just hoped to save Andrew dealing with the small merge
conflict. :) I'll base a v2 on mm-unstable directly and that should
clear everything up.

>
> thanks,
> --
> John Hubbard
> NVIDIA
>
>
> > diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> > index c39de84e98b0..e5370bcadf27 100644
> > --- a/arch/parisc/mm/fault.c
> > +++ b/arch/parisc/mm/fault.c
> > @@ -400,9 +400,12 @@ void do_page_fault(struct pt_regs *regs, unsigned =
long code,
> >   #ifdef CONFIG_MEMORY_FAILURE
> >               if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) =
{
> >                       unsigned int lsb =3D 0;
> > -                     printk(KERN_ERR
> > +
> > +                     if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> > +                             pr_err(
> >       "MCE: Killing %s:%d due to hardware memory corruption fault at %0=
8lx\n",
> > -                     tsk->comm, tsk->pid, address);
> > +                             tsk->comm, tsk->pid, address);
> > +                     }
> >                       /*
> >                        * Either small page or large page may be poisone=
d.
> >                        * In other words, VM_FAULT_HWPOISON_LARGE and
> > diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> > index 53335ae21a40..ac5e8a3c7fba 100644
> > --- a/arch/powerpc/mm/fault.c
> > +++ b/arch/powerpc/mm/fault.c
> > @@ -140,8 +140,10 @@ static int do_sigbus(struct pt_regs *regs, unsigne=
d long address,
> >       if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
> >               unsigned int lsb =3D 0; /* shutup gcc */
> >
> > -             pr_err("MCE: Killing %s:%d due to hardware memory corrupt=
ion fault at %lx\n",
> > -                     current->comm, current->pid, address);
> > +             if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> > +                     pr_err("MCE: Killing %s:%d due to hardware memory=
 corruption fault at %lx\n",
> > +                             current->comm, current->pid, address);
> > +             }
> >
> >               if (fault & VM_FAULT_HWPOISON_LARGE)
> >                       lsb =3D hstate_index_to_shift(VM_FAULT_GET_HINDEX=
(fault));
> > diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> > index e4f3c7721f45..16d077a3ad14 100644
> > --- a/arch/x86/mm/fault.c
> > +++ b/arch/x86/mm/fault.c
> > @@ -928,9 +928,11 @@ do_sigbus(struct pt_regs *regs, unsigned long erro=
r_code, unsigned long address,
> >               struct task_struct *tsk =3D current;
> >               unsigned lsb =3D 0;
> >
> > -             pr_err_ratelimited(
> > +             if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> > +                     pr_err_ratelimited(
> >       "MCE: Killing %s:%d due to hardware memory corruption fault at %l=
x\n",
> > -                     tsk->comm, tsk->pid, address);
> > +                             tsk->comm, tsk->pid, address);
> > +             }
> >               if (fault & VM_FAULT_HWPOISON_LARGE)
> >                       lsb =3D hstate_index_to_shift(VM_FAULT_GET_HINDEX=
(fault));
> >               if (fault & VM_FAULT_HWPOISON)
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 5240bd7bca33..7f8fc3efc5b2 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -1226,6 +1226,9 @@ typedef __bitwise unsigned int vm_fault_t;
> >    * @VM_FAULT_HWPOISON_LARGE:        Hit poisoned large page. Index en=
coded
> >    *                          in upper bits
> >    * @VM_FAULT_SIGSEGV:               segmentation fault
> > + * @VM_FAULT_HWPOISON_SIM    Hit poisoned, PTE marker; this indicates =
a
> > + *                           simulated poison (e.g. via usefaultfd's

I'll also fix this small typo in a v2. :P

> > + *                              UFFDIO_POISON), not a "real" hwerror.
> >    * @VM_FAULT_NOPAGE:                ->fault installed the pte, not re=
turn page
> >    * @VM_FAULT_LOCKED:                ->fault locked the returned page
> >    * @VM_FAULT_RETRY:         ->fault blocked, must retry
> > @@ -1245,6 +1248,7 @@ enum vm_fault_reason {
> >       VM_FAULT_HWPOISON       =3D (__force vm_fault_t)0x000010,
> >       VM_FAULT_HWPOISON_LARGE =3D (__force vm_fault_t)0x000020,
> >       VM_FAULT_SIGSEGV        =3D (__force vm_fault_t)0x000040,
> > +     VM_FAULT_HWPOISON_SIM   =3D (__force vm_fault_t)0x000080,
> >       VM_FAULT_NOPAGE         =3D (__force vm_fault_t)0x000100,
> >       VM_FAULT_LOCKED         =3D (__force vm_fault_t)0x000200,
> >       VM_FAULT_RETRY          =3D (__force vm_fault_t)0x000400,
> > @@ -1270,6 +1274,7 @@ enum vm_fault_reason {
> >       { VM_FAULT_HWPOISON,            "HWPOISON" },   \
> >       { VM_FAULT_HWPOISON_LARGE,      "HWPOISON_LARGE" },     \
> >       { VM_FAULT_SIGSEGV,             "SIGSEGV" },    \
> > +     { VM_FAULT_HWPOISON_SIM,        "HWPOISON_SIM" },       \
> >       { VM_FAULT_NOPAGE,              "NOPAGE" },     \
> >       { VM_FAULT_LOCKED,              "LOCKED" },     \
> >       { VM_FAULT_RETRY,               "RETRY" },      \
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 65456230cc71..2b4e0173e806 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -6485,7 +6485,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, st=
ruct vm_area_struct *vma,
> >                               pte_marker_get(pte_to_swp_entry(entry));
> >
> >                       if (marker & PTE_MARKER_POISONED) {
> > -                             ret =3D VM_FAULT_HWPOISON_LARGE |
> > +                             ret =3D VM_FAULT_HWPOISON_SIM |
> > +                                   VM_FAULT_HWPOISON_LARGE |
> >                                     VM_FAULT_SET_HINDEX(hstate_index(h)=
);
> >                               goto out_mutex;
> >                       }
> > diff --git a/mm/memory.c b/mm/memory.c
> > index d2155ced45f8..29a833b996ae 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -3910,7 +3910,7 @@ static vm_fault_t handle_pte_marker(struct vm_fau=
lt *vmf)
> >
> >       /* Higher priority than uffd-wp when data corrupted */
> >       if (marker & PTE_MARKER_POISONED)
> > -             return VM_FAULT_HWPOISON;
> > +             return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SIM;
> >
> >       if (pte_marker_entry_uffd_wp(entry))
> >               return pte_marker_handle_uffd_wp(vmf);
>
>

