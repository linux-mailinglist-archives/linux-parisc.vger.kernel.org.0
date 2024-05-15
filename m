Return-Path: <linux-parisc+bounces-1417-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A648C6CBC
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2024 21:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59D0B28156B
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2024 19:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC681591FD;
	Wed, 15 May 2024 19:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NLN3mn1J"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310463BBF6
	for <linux-parisc@vger.kernel.org>; Wed, 15 May 2024 19:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715800798; cv=none; b=uq67kh+kJ6qllmOW4sDV4e05PPkYtLTYNuplF6ZFeMF4f9ZFjA9YgIyRMFEZc+rhzKs+DNWpzhPNNk9At9vAB4jW99U8TGk2JnnJPPS/5qUfaLBBu/Wyo6a38On+0KC2IAgiLRCkZT7fKkxaBqhFyOtlsKVMU+rKPQsvNx3VKFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715800798; c=relaxed/simple;
	bh=eGs7U5U/Usv8Q9Cb5Iad3k8ObVnSouRKrZHuk/yJdnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZlpj6nx3Ajq+XDJ88UTfeABQRZYWgX3LoIBf8pJBTuJ7spVB0BDM/9HFYYapj0Pn4bnHgto67Cs8/uqZUQ7+x/DYipHTrZO/kP/WbtRYZEIdNEq6R+QTDc8IzmoV5T2RM2/1e52Fi96I6TYPOrB70cCyuBpH87T9HxZIDC9b88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NLN3mn1J; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e0933d3b5fso108402321fa.2
        for <linux-parisc@vger.kernel.org>; Wed, 15 May 2024 12:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715800795; x=1716405595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXjROtfQXycrwTZbHgAfwgBM9LbMzawmBcCZtk8pkcY=;
        b=NLN3mn1J6DEe/KeWjewHPvECzo5VJl4X27mS+Z7lYcI/abJI0RRydzpe6NPi9URcc6
         0Qg8D1qExudgVFjoslCwvagwQNpFKo96QLjN3MyPa1J9Auw15xnR8pFJ2RsQchANdgvZ
         nyXGV5lCUbgE5eVA16aFh2HxwmvJ14avbsKy68Kz6giYNrfDTkS/3hmAMm9QfblBVFd7
         pn1/nbOdaeKKzKYe+vO/u0+yW3YLjcAX7HcaNTTSXCrfJF22JIqd+QK/o3CLQZguyLNX
         cxIfFY5M6ag3XvoOWUbsVXb3GYyg7esbPhjeLKzOcZShBgPyHsF+26VtNWHKQ2VfvkTq
         4y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715800795; x=1716405595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXjROtfQXycrwTZbHgAfwgBM9LbMzawmBcCZtk8pkcY=;
        b=lId/Acx4r9uwElpPfqA3Cy5732WoxmpaeOEFtmIZR9AQryPjk0NNcRUdTMYB5OzwUT
         HBAF7wC9hwMl4cyoLI3/ub8/ZdDQ0tVe4q+CWIkCIt3iYsUDK6BBUmedc8EvgfzhfRDu
         eHvGu1mbyQ7gwadkqSUG1ZZBvJltvaI0RiQvWFtiS0XR8CSGOfUL7offgV2X+luVBWjB
         18QMqRK+n/8yry/b8tiL7lYzEypGTGiDYMRVBsPOg/BRIZlWZVqv6L/4KPdmaGHH3kbR
         FfYjd/UNAPqcEKIVGoHSr5wcNISVrXQ67C65OkUNQoWUnpyfNkoRxtd5jFuqVF1yXtgF
         URUA==
X-Forwarded-Encrypted: i=1; AJvYcCXYmEk+veL9t0oe41YhD1LHsecOy2kBqa+ClPbcwEGEv507YfBAJ+I6uqd9x4rVo29H70KDSvTMxML4XcQh6mT6XC46SflfRYT54RkV
X-Gm-Message-State: AOJu0YwPcZEZ5NoIWqyESawbRSRwE0sL3pQXgQZzjTStuObzpDHDR+0P
	PwvmCHtHP9IlrCQJXXv/ths8c6kKgBQLNPHX2q9kaB9ddsfuy+/YrVkzXRxuBNHiwfnXqdB5juy
	Riq2B+rAEhSwp23LeCGTq4BKGtLZEGS9ct2vV
X-Google-Smtp-Source: AGHT+IEsh1fgFOZ5mQCmTXHCQZJjsjH7zDpAl9YdV3FVukl1MJHO71DKDwXJtDNtSkwq75f+AarVWw4jtJy3Fg3K69Q=
X-Received: by 2002:a2e:a591:0:b0:2e2:9416:a649 with SMTP id
 38308e7fff4ca-2e5205c3760mr118614971fa.53.1715800795037; Wed, 15 May 2024
 12:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com> <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
 <ZkSUaVx3uCIPkpkJ@localhost.localdomain> <CAJHvVchGGJkEX=qroW=+N-RJDMDGuxM4xoGe7iOtRu9YcfxEEw@mail.gmail.com>
 <20240515183222.GCZkT_tvEffgYtah4T@fat_crate.local>
In-Reply-To: <20240515183222.GCZkT_tvEffgYtah4T@fat_crate.local>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Wed, 15 May 2024 12:19:16 -0700
Message-ID: <CAJHvVcj+YBpLbjLy+M+b8K7fj0XvFSZLpsuY-RbCCn9ouV1WjQ@mail.gmail.com>
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

On Wed, May 15, 2024 at 11:33=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Wed, May 15, 2024 at 10:33:03AM -0700, Axel Rasmussen wrote:
> > Right, the goal is to still have the process get a SIGBUS, but to
> > avoid the "MCE error" log message. The basic issue is, unprivileged
> > users can set these markers up, and thereby completely spam up the
> > log.
>
> What is the real attack scenario you want to protect against?
>
> Or is this something hypothetical?

An unprivileged process can allocate a VMA, use the userfaultfd API to
install one of these PTE markers, and then register a no-op SIGBUS
handler. Now it can access that address in a tight loop, generating a
huge number of kernel log messages. This can e.g. bog down the system,
or at least drown out other important log messages.

For example the userfaultfd selftest does something similar to this to
test that the API works properly. :)

Even in a non-contrived / non-malicious case, use of this API could
have similar effects. If nothing else, the log message can be
confusing to administrators: they state that an MCE occurred, whereas
with the simulated poison API, this is not the case; it isn't a "real"
MCE / hardware error.

>
> > That said, one thing I'm not sure about is whether or not
> > VM_FAULT_SIGBUS is a viable alternative (returned for a new PTE marker
> > type specific to simulated poison). The goal of the simulated poison
> > feature is to "closely simulate" a real hardware poison event. If you
> > live migrate a VM from a host with real poisoned memory, to a new
> > host: you'd want to keep the same behavior if the guest accessed those
> > addresses again, so as not to confuse the guest about why it suddenly
> > became "un-poisoned".
>
> Well, the recovery action is to poison the page and the process should
> be resilient enough and allocate a new, clean page which doesn't trigger
> hw poison hopefully, if possible.
>
> It doesn't make a whole lotta sense if poison "remains". Hardware poison
> you don't want to touch a second time either - otherwise you might
> consume that poison and die.

In the KVM use case, the host can't just allocate a new page, because
it doesn't know what the guest might have had stored there. Best we
can do is propagate the poison into the guest, and let the guest OS
deal with it as it sees fit, and mark the page poisoned on the host. I
don't disagree the guest *shouldn't* reaccess it in this case. :) But
if it did, it should get another poison event just as you say.

And, live migration between physical hosts should be transparent to
the guest. So if the guest gets a poison, and then we live migrate it,
and then it accesses that address again, it should likewise get
another poison event, just as before. Even though the underlying
physical memory is *not* poisoned on the new host machine.

So the use case is, after live migration, we install one of these PTE
markers to simulate a poison event in case the address is accessed
again. But since it isn't *really* a hardware error on the new host,
no reason to spam the host kernel log when / if this occurs.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

