Return-Path: <linux-parisc+bounces-1421-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E12E28C7DA8
	for <lists+linux-parisc@lfdr.de>; Thu, 16 May 2024 22:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84C252834FE
	for <lists+linux-parisc@lfdr.de>; Thu, 16 May 2024 20:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA69157A53;
	Thu, 16 May 2024 20:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zAvTu0zw"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC1156F29
	for <linux-parisc@vger.kernel.org>; Thu, 16 May 2024 20:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715891327; cv=none; b=EArxd4YSSlydlv5DlFLCvNsDQIs6uxy97rA6QBM+Zvul1IM+jBcCkRHgCkJV0jAhkPliVyRYIfuTPQKK2FDi2InCJZb3xUTWMKXjCb8cFWQLsAfqJhFjACrkQ5ixegFEfmeSKlayDJHgudlUIdQs2i+G6O1IdZ4j3Q/spJJD7Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715891327; c=relaxed/simple;
	bh=zdb4DJSVLAVhyLUnRgSpLVG1x3o+SG1M8q+bL9L58nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyykfv6rxsHze8UHUXVVsU8lx6EmSEWnow0Ry9KcrjppR3vKgtXe6dNujho1zeETJVceetneXiipx7hNKm3YK8cTXmF6OOrFvS2ujjHYTz2ynEDT53pgGugtHVl5b1WPdUw5OiEDwOmh0gBUjd/SyDKsudp4GmxCPpZu7MI7+pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zAvTu0zw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-34d8f6cfe5bso6715456f8f.3
        for <linux-parisc@vger.kernel.org>; Thu, 16 May 2024 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715891324; x=1716496124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZSwX2jBcRCBdUFcHdErZ/3QKMz3PjihBzuXDa6XBd8=;
        b=zAvTu0zw1wOw7qNRtdsfIf/JSMc7ahsPeiM6kGGEPARiONEHjc3uLJo8H7c3tsPxQ4
         0T/q255K5OIfErb/gWAFT+Xjef5YGnIrEUa+I+GPCnoORRzPl7P+6lpUAbHPqNFEQ2Gm
         49wp6q910ums1JwXcIckZn2P8ZkK20ZSEdiH+i8QJIemplipgGprZSYng9LT+/rJxli5
         nTq4PdLllY3NDxMf+7ElnTcB6deIMf66JM5cA1QC5ZQtWg2eSYT9bS0C6EqzoTwsWbVi
         2sc0uEVpyN+48PctHguc8RIvjAWm9cA6bZffDkqA8o3uGDLFYU0ukglIXicNMxuHh0aE
         eFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715891324; x=1716496124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZSwX2jBcRCBdUFcHdErZ/3QKMz3PjihBzuXDa6XBd8=;
        b=VY6X6VERUGYvI8zPN1kuY99FDw/MoVBi/ZseFgbbsObXXJAbuuyn7J5iDWROWwJS7f
         IoYQLbHucA0yKixybZ/xcguhtryu0aS4lbglW39TXFltcmZmu+Jf570ZyUnLcmhlb4ow
         pKXAiwdBmNR6yYShPDxE7TIejMd8jwwpQGnEjXPO0JqQ6ewcU5UNoP1W/Blp0VtWcfWQ
         xGUEKqhWsNnhNUxzlWQyOlB04ML+r5wQctIuz/bDx25OMUufr00Vmai5BFOmQIdaEB2i
         mvZHaojsarmcQLJ1BpK3dA/OlwrHbY1NSe08CxwM6361Al2MeVokyx6uWoJcIPCmFciv
         gBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX99ds5MPGVWcTWU5ziDChnf++rx85qCeCBuVRozPzFlk6lGFPkY3PWID8zPtDMCZJDJaJsatQTJfbA37LwI27033n3lUSGW/tPf7n5
X-Gm-Message-State: AOJu0YxxFwgBa0mOqpOIxxTqjcLiAiSYRfxA8vWuRNfLfZgPQW8m1uAu
	KjuRMjLWcPBJJrtl948RojesQLSgJh6/E7lToL5MIK0UzO+P+/m2mt/piTHHTBM8PlfDknUST6G
	EFYmqdmE3sCVFtsmq35Yqy1eIY0lysAivWzOO
X-Google-Smtp-Source: AGHT+IHSs0PnvLr7K65U0pIJasei0dLnQZzcKZVqtNdpsde/9sHa0rl6+tv66pbq/0+Y0GTi9KV6Q72LZ1sl+YrcQZc=
X-Received: by 2002:a05:6000:280d:b0:351:b2db:d7d2 with SMTP id
 ffacd0b85a97d-351b2dbd889mr9447250f8f.27.1715891324087; Thu, 16 May 2024
 13:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com> <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
 <ZkSUaVx3uCIPkpkJ@localhost.localdomain> <CAJHvVchGGJkEX=qroW=+N-RJDMDGuxM4xoGe7iOtRu9YcfxEEw@mail.gmail.com>
 <20240515183222.GCZkT_tvEffgYtah4T@fat_crate.local> <CAJHvVcj+YBpLbjLy+M+b8K7fj0XvFSZLpsuY-RbCCn9ouV1WjQ@mail.gmail.com>
 <20240515201831.GDZkUYlybfejSh79ix@fat_crate.local>
In-Reply-To: <20240515201831.GDZkUYlybfejSh79ix@fat_crate.local>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Thu, 16 May 2024 13:28:04 -0700
Message-ID: <CAJHvVchVA4B8DCW=yUGQ6jg1sYXiMX2B-cWziyR3KiTkYNkX-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker poison errors
To: Borislav Petkov <bp@alien8.de>
Cc: Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
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

On Wed, May 15, 2024 at 1:19=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Wed, May 15, 2024 at 12:19:16PM -0700, Axel Rasmussen wrote:
> > An unprivileged process can allocate a VMA, use the userfaultfd API to
> > install one of these PTE markers, and then register a no-op SIGBUS
> > handler. Now it can access that address in a tight loop,
>
> Maybe the userfaultfd should not allow this, I dunno. You made me look
> at this thing and to me it all sounds weird. One thread does page fault
> handling for the other and that helps with live migration somehow. OMG,
> whaaat?
>
> Maybe I don't understand it and probably never will...
>
> But, for example, membarrier used do to a stupid thing of allowing one
> thread to hammer another with an IPI storm. Bad bad idea. So it got
> fixed.
>
> All I'm saying is, if unprivileged processes can do crap, they should be
> prevented from doing crap. Like ratelimiting the pagefaults or whatnot.
>
> One of the recovery action strategies from memory poison is, well, you
> kill the process. If you can detect the hammering process which
> installed that page marker, you kill it. Problem solved.
>
> But again, this userfaultfd thing sounds really weird so I could very
> well be way wrong.
>
> > Even in a non-contrived / non-malicious case, use of this API could
> > have similar effects. If nothing else, the log message can be
> > confusing to administrators: they state that an MCE occurred, whereas
> > with the simulated poison API, this is not the case; it isn't a "real"
> > MCE / hardware error.
>
> Yeah, I read that part in
>
> Documentation/admin-guide/mm/userfaultfd.rst
>
> Simulated poison huh? Another WTF.
>
> > In the KVM use case, the host can't just allocate a new page, because
> > it doesn't know what the guest might have had stored there. Best we
>
> Ok, let's think of real hw poison.
>
> When doing the recovery, you don't care what's stored there because as
> far as the hardware is concerned, if you consume that poison the *whole*
> machine might go down.
>
> So you lose the page. Plain and simple. And the guest can go visit the
> bureau of complaints and grievances.
>
> Still better than killing the guest or even the whole host with other
> guests running on it.
>
> > can do is propagate the poison into the guest, and let the guest OS
> > deal with it as it sees fit, and mark the page poisoned on the host.
>
> You mark the page as poison on the host and you yank it from under the
> guest. That physical frame is gone and the faster all the actors
> involved understand that, the better.
>
> > I don't disagree the guest *shouldn't* reaccess it in this case. :)
> > But if it did, it should get another poison event just as you say.
>
> Yes, it shouldn't. Look at memory_failure(). This will kill whole
> processes if it has to, depending on what the page is used for.
>
> > And, live migration between physical hosts should be transparent to
> > the guest. So if the guest gets a poison, and then we live migrate it,
>
> So if I were to design this, I'd do it this way:
>
> 0. guest gets hw poison injected
>
> 1. it runs memory_failure() and it kills the processes using the page.
>
> 2. page is marked poisoned on the host so no other guest gets it.
>
> That's it. No second accesses whatsoever. At least this is how it works
> on baremetal.

I agree with almost all of the above. But one point is, I don't think
we can trust the guest to be reasonable. :)

Public cloud provider customers might run some OS other than Linux, or
an old / buggy kernel, or one with out-of-tree patches which make it
do who knows what. There can also be users who are actively malicious.

Some customers may try to do fancy "poison recovery" where they can
avoid killing the in-guest process when a poison event occurs. These
implementations can be buggy :) and unintentionally reaccess.


>
> This hw poisoning emulation is just silly and unnecessary.
>
> But again, I probably am missing some aspects. It all just sounded
> really weird to me that's why I thought I should ask what's behind all
> that.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

