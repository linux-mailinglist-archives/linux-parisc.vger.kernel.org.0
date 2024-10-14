Return-Path: <linux-parisc+bounces-2698-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF61C99D634
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Oct 2024 20:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D5DD2836FF
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Oct 2024 18:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01A91C9B81;
	Mon, 14 Oct 2024 18:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YH7gdCz0"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19351C8787
	for <linux-parisc@vger.kernel.org>; Mon, 14 Oct 2024 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728929708; cv=none; b=JElE5oOPddy0RvtKiEPA4e4UYlr2dFojfR3uK9zryItCY7yy2rGjc0189/zbGxsi1aKKBvRgB/XbngJWhKBnJ6PQ+k5wqpkbpsp0juP+qG4sE84105J47CplMLdd+X/BqbrkMYKXOK5HTs22aI8/2AF9zB43uVrxlTPwAuFmGFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728929708; c=relaxed/simple;
	bh=psGXUzJuH/L2z1/iTd15xLLLmgcDkiy//BOohqm6suo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rj70Up/aj2113jHbWg7nXEsnevdFOvfb/Tqi7dVBdeyRejgwv7ORMf5S8SSfRLKamYoGPecXN2v1tTGPz3XO7Y6qcBmTMYbg6HT3vTlfktx8xLPL5vQmenmRU9GiLt4jqVtHKQ8pSnxTVlM5PVZ6ia/DN5YP38c4FDTh5PyYFGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YH7gdCz0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c93e9e701fso23281a12.1
        for <linux-parisc@vger.kernel.org>; Mon, 14 Oct 2024 11:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728929705; x=1729534505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNEJX4kqr9odUybTaFkTf23XVWJozLbeDB372EuR6j4=;
        b=YH7gdCz0u4YI7kKWrwOV7823Ry8mfVTaUBgfPXEYBaTHPRQVL4alo8053TNv7BmVcI
         O/ZhyIYjT4oh0Z8SEpTUgW/RikaUwDAmlJbt39BpAypJ4Ac5lzEtEdKf7H4e9aXEoLoo
         xSPNnR5rK27S2rV86xpMuay0ksO6lHTdMM1qXQ3B8I3gpc3pfbKwHfTQ7LLLGdGGRQ+M
         m3tjbAOTqBBSSWZk7WSddcJ+ZpLXT7GzleWVLp93/OtO4jNzr0cYvHH9jtKaM2oTUNZO
         t4cUK2w5vTPHg4bm8oOypZIf3QV9IASfaoWuZB8D6AKOp93KCXidIUGsi9R5J9uInIof
         eBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728929705; x=1729534505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNEJX4kqr9odUybTaFkTf23XVWJozLbeDB372EuR6j4=;
        b=Wm8e0Uhi8g32iEBXENzMgVYz9xrmTDSNvzqiCtPvKvCCds80pFNDLpvwUaui8rloUy
         pUuf/eM4Pzf+1+ukGONUh8kVvZKoU0uuIC9XnaSEph9iePsQXBMq7wL5ijKyYeJpcxkF
         r9TvzkBiM6v3yoeCIzHO+JDbH6IzrC02N7D40l6hoK5sAOe3NObMYjhg4IFBMpngdu8f
         cxJLD+XxuTnAqFz4NTmNwkCl3VbuecjazTXtWMkb1xGGC+zhKZwjdszKjVHXrGE5jJL2
         byGl3mLaMWRPEsevUeffASNzYS9cJplg21AhmOcCoDpXutt1eh8VHTiyPrZC29FSFa2Z
         nKSg==
X-Forwarded-Encrypted: i=1; AJvYcCVgSI5UMa8F2k4iPmI3yLzLNSHNDjDKIRSzMYECa7p38SWMhNg3/m4EnikEhC14HAH6pL4nL0VN0qN/rXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyQ4oPUGUt3hlvZZOqQJ0u8BBdWYPR6fkqvuTOAG7QUWiH6mwd
	WZ1QiGiXJfYp5f8s4VhYdpr+llP5bOE6lBKAVHfESdWiWQZoEqLzDn7Qn/vozOj+WzWfb5m683f
	yXKIW3tzArj8tUiDQ1P5vAYmB4OTF+8xrSzXY
X-Google-Smtp-Source: AGHT+IEbkDzR+ThZoGvgYtCS7Y5gwEV3PkXHeMMP5MKP0m0Oi8H/8Bb2XOPnZQdihqJsksuw7ZM7VJ44A8HdzyHg+Ps=
X-Received: by 2002:a05:6402:26c1:b0:5c2:5641:af79 with SMTP id
 4fb4d7f45d1cf-5c95b0bd39amr402722a12.0.1728929704710; Mon, 14 Oct 2024
 11:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727440966.git.lorenzo.stoakes@oracle.com>
 <a578ee9bb656234d3a19bf9e97c3012378d31a19.1727440966.git.lorenzo.stoakes@oracle.com>
 <CAG48ez3ursoL-f=mYpV79Do18XPPt+MPPHNUBv6uFE1GhpOwSA@mail.gmail.com>
 <868739d2-0869-462f-ac86-1a8d1dccb0a4@lucifer.local> <CAG48ez3vqbqyWb4bLdpqSUnhwqGo2OQetecNhEGPdCGDr94nbQ@mail.gmail.com>
 <b483187b-5caa-4581-86b1-895184301cbb@lucifer.local>
In-Reply-To: <b483187b-5caa-4581-86b1-895184301cbb@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Mon, 14 Oct 2024 20:14:26 +0200
Message-ID: <CAG48ez0pCasCQ_=ALog7nseKnGci0o0LyQehV42J==gNAiXBVg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] mm: madvise: implement lightweight guard page mechanism
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Paul E . McKenney" <paulmck@kernel.org>, 
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Muchun Song <muchun.song@linux.dev>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-arch@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, Vlastimil Babka <vbabka@suze.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 7:02=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Mon, Oct 14, 2024 at 05:56:50PM +0200, Jann Horn wrote:
> > On Mon, Oct 14, 2024 at 1:09=E2=80=AFPM Lorenzo Stoakes <lorenzo.stoake=
s@oracle.com> wrote:
> > > On Fri, Oct 11, 2024 at 08:11:36PM +0200, Jann Horn wrote:
> > > > On Fri, Sep 27, 2024 at 2:51=E2=80=AFPM Lorenzo Stoakes <lorenzo.st=
oakes@oracle.com> wrote:
> > > By being optimistic and simply having the user having to handle loopi=
ng
> > > which seems reasonable (again, it's weird if you're installing poison
> > > markers and another thread could be racing you) we avoid all of that.
> >
> > I guess one case in which that could happen legitimately is if you
> > race a MADV_POISON on the area 0x1ff000-0x200100 (first page is
> > populated, second page is not, pmd entry corresponding to 0x200000 is
> > clear) with a page fault at 0x200200? So you could have a scenario
> > like:
> >
> > 1. MADV_POISON starts walk_page_range()
> > 2. MADV_POISON sees non-zero, non-poison PTE at 0x1ff000, stops the wal=
k
> > 3. MADV_POISON does zap_page_range_single()
> > 4. pagefault at 0x200200 happens and populates with a hugepage
> > 5. MADV_POISON enters walk_page_range()
> > 6. MADV_POISON splits the THP
> > 7. MADV_POISON sees a populated PTE
>
> You really shouldn't be seeing page faults in the range you are setting u=
p
> poison markers for _at all_ :) it's something you'd do ahead of time.

But that's not what happens in my example - the address where the
fault happens (0x200200) *is not* in the address range that
MADV_POISON is called on (0x1ff000-0x200100). The fault and the
MADV_POISON are in different 4KiB pages. What causes the conflict is
that the fault and the MADV_POISON overlap the same *2MiB region*
(both are in the region 0x200000-0x400000), and so THP stuff can
effectively cause "page faults in the range you are setting up poison
markers for".

> But of course it's possible some scenario could arise like that, that's
> what the EAGAIN is for.
>
> I just really don't want to get into a realm of trying to prove absolutel=
y
> under all circumstances that we can't go on forever in a loop like that.

We can have a bailout on signal_pending() or something like that, and
a cond_resched(). Then as far as I know, it won't really make a
difference in behavior whether the loop is in the kernel or in
userspace code that's following what the manpage tells it to do -
either way, the program will loop until it either finishes its work or
is interrupted by a signal, and either way it can get preempted.
(Well, except under PREEMPT_NONE, but that is basically asking for
long scheduling delays.)

And we do have other codepaths that have to loop endlessly if they
keep racing with page table updates the wrong way, though I guess
those loops are not going to always scan over a large address range
over and over again...

Maybe something like this would be good enough, and mirror what you'd
otherwise tell userspace to do?


@@ -1598,6 +1598,7 @@ int do_madvise(struct mm_struct *mm, unsigned
long start, size_t len_in, int beh
                return madvise_inject_error(behavior, start, start + len_in=
);
 #endif

+retry:
        write =3D madvise_need_mmap_write(behavior);
        if (write) {
                if (mmap_write_lock_killable(mm))
@@ -1627,6 +1628,12 @@ int do_madvise(struct mm_struct *mm, unsigned
long start, size_t len_in, int beh
        else
                mmap_read_unlock(mm);

+       if (error =3D=3D <<<some special value>>>) {
+               if (!signal_pending(current))
+                       goto retry;
+               error =3D -ERESTARTNOINTR;
+       }
+
        return error;
 }

Buuut, heh, actually, I just realized: You could even omit this and
simply replace -EINTR with -ERESTARTNOINTR in your code as the error
value, and then the kernel would automatically go back into the
syscall for you after going through signal handing and such, without
userspace noticing.
https://lore.kernel.org/all/20121206220955.GZ4939@ZenIV.linux.org.uk/
has some explanation on how this works. Basically it tells the
architecture's syscall entry code to move the userspace instruction
pointer back to the syscall instruction, so as soon as execution
returns to userspace, the first userspace instruction that executes
will immediately re-do the syscall. That might be the easiest way,
even if it is maybe a *little* bit of an API abuse to use this thing
without having a pending signal...


> If you drop the lock for contention then you up the risk of that, it just
> feels dangerous.
>
> A userland program can however live with a 'if EAGAIN try again' situatio=
n.
>
> An alternative approach to this might be to try to take the VMA lock, but
> given the fraught situation with locking elsewhere I wonder if we should.
>
> Also, you have to be realy unlucky with timing for this to happen, even i=
n
> the scenario you mention (where you'd have to be unlucky with alignment
> too), unless you're _heavily_ page faulting in the range, either way a
> userland loop checking EAGAIN doesn't seem unreasonable.

Yes, we could do -EINTR and document that for userspace, and as long
as everyone using this properly reads the documentation, it will be
fine. Though I imagine that from the userspace programmer perspective
that's a weird API design - as in, if this error code always means I
have to try again, why can't the kernel do that internally. It's kind
of leaking an implementation detail into the UAPI.

