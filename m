Return-Path: <linux-parisc+bounces-1431-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 883778CC836
	for <lists+linux-parisc@lfdr.de>; Wed, 22 May 2024 23:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D680AB21000
	for <lists+linux-parisc@lfdr.de>; Wed, 22 May 2024 21:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2921C7F483;
	Wed, 22 May 2024 21:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q6zkypWr"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A3E7AE5D
	for <linux-parisc@vger.kernel.org>; Wed, 22 May 2024 21:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716414380; cv=none; b=fgztLXQYOXh0pe0UqnVn4ZTTBsw1de1+mTs5CqUNtatMpuTxXN/KUpDWwdyAO8GPBCw9MxJaU+DuHsAGBF1yaYEEMu1hTsFm9o3uTAGySwLyJUFnwE7T1Q3F5VxoVDYYZjwCQFn6N4vj8LzxrOhaAOyOTaZhCiDVN4w8heDYKEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716414380; c=relaxed/simple;
	bh=9D+mCskmlHmPyPr1Z1l0AHlbE/4D1ysyOinW+4Cz95U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCLd+DJZ07p5qCNeH53aiEOmuHw+pZFI8AT2kIB1jzTQcIxUiEXwMRDgqMUltXNbt6C2sAOrAzPdwSXhdp6zjik2K0JsvDEKtVyjwoLpLdfeZnF1D4mnerIhtUlynCGm5ExypDFsJz6S/PiiZIopnVGqbPpbg4qm7pGmOajYjn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q6zkypWr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716414377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0IPOkswwA/TJ9xaHowV/cvfG1H4kLvnXT+ET0mPfmoA=;
	b=Q6zkypWrLByt8VdI/TmX8Ci4YnjIxgXSfDqvlxTVgpJCqQPmyfQfjLfJYDfuQ2deZ46anz
	WACELr531OEhfE8+8jrUVcwgSyxfts9nakVrVo9bO0qpJlQn+qCJhg+seXeRTGQioyI7pn
	jY+dVVExxL3fKygyX1FDv9o6W541khg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-GHT_a4HKML6WBddTtKKM-Q-1; Wed, 22 May 2024 17:46:15 -0400
X-MC-Unique: GHT_a4HKML6WBddTtKKM-Q-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6a358dbd9d1so23706276d6.2
        for <linux-parisc@vger.kernel.org>; Wed, 22 May 2024 14:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716414375; x=1717019175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IPOkswwA/TJ9xaHowV/cvfG1H4kLvnXT+ET0mPfmoA=;
        b=WuqtzD9VC/n/PqNzzFXFIst0O1RqEW16loLszgdd3DWbV97ECpLoNQYb1VNa9NAmzL
         qqA1RHaGZLy5eDRAvKRKY87RaYVk0uxchLmfNwSHOROoq+isGcks/fC3fXqCFKTHS9v6
         jPlTcQ5Hv7ZZ5G6wquO3nu7SUfHB2TKyZmRQJIVi77NOuJlYDu9+zntqlh4tQgtHGQ7R
         WL5i2ulzWZWekMo5lngNhCXn8Nhox++Nlavmb0y/gzY4e4dnYdCVIGqguOEIB0iYjk27
         +/x16kRzZEzhT6skhxA1/fe2rQE7b+fR9NWNyELqDiHMQy1v+Yo9RUjcRKLn8/GnM3mP
         KmGg==
X-Forwarded-Encrypted: i=1; AJvYcCUVam674QDg1EFX/REh+PxUyM4qVNsN8g7RvSbCdcvVFlXfVV7h1ztRXemOCZBS6s++kywpS688GYe4en+/2/Yi94YqcxOGt0zvc/gM
X-Gm-Message-State: AOJu0YztMuaZ/+MqElB66uR1xKNDtHkWjyUXI3fnZ7X5ePPrvKbIjgKR
	uCS6c98cyRUwy0F2Y0ApzsyOdpJTpkOJuJyFPL1hoZvkvXaQ8gx5yW/4jAyg85pHStsqbFqalLD
	kJxYwLerxzeD81o8Ow6E1Gj3K5U4U+Cz+4a1WQHnXnwhPpMbqtjElOJWiumA2YQ==
X-Received: by 2002:a05:6214:3004:b0:69b:1c6d:9a64 with SMTP id 6a1803df08f44-6ab80920651mr35047056d6.4.1716414374695;
        Wed, 22 May 2024 14:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrpao2OsvBu8SGwX0VKGUdrFoO4tAR8Hf7zdwQnywyhHnT3+AiYwuxl3MoZyQZWINIE7Uy4g==
X-Received: by 2002:a05:6214:3004:b0:69b:1c6d:9a64 with SMTP id 6a1803df08f44-6ab80920651mr35046606d6.4.1716414373600;
        Wed, 22 May 2024 14:46:13 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1cd266sm136827696d6.80.2024.05.22.14.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 14:46:13 -0700 (PDT)
Date: Wed, 22 May 2024 17:46:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: Axel Rasmussen <axelrasmussen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Liu Shixin <liushixin2@huawei.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <Zk5noUEYI4lknyJy@x1n>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <Zj51rEwZeSK4Vr1G@x1n>
 <ZkPJCc5N1Eotpa4u@localhost.localdomain>
 <ZkPY4CSnZWZnxjTa@x1n>
 <ZkSMv31Cwx080no7@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZkSMv31Cwx080no7@localhost.localdomain>

On Wed, May 15, 2024 at 12:21:51PM +0200, Oscar Salvador wrote:
> On Tue, May 14, 2024 at 03:34:24PM -0600, Peter Xu wrote:
> > The question is whether we can't.
> > 
> > Now we reserved a swp entry just for hwpoison and it makes sense only
> > because we cached the poisoned pfn inside.  My long standing question is
> > why do we ever need that pfn after all.  If we don't need the pfn, we
> > simply need a bit in the pgtable entry saying that it's poisoned, if
> > accessed we should kill the process using sigbus.
> > 
> > I used to comment on this before, the only path that uses that pfn is
> > check_hwpoisoned_entry(), which was introduced in:
> > 
> > commit a3f5d80ea401ac857f2910e28b15f35b2cf902f4
> > Author: Naoya Horiguchi <nao.horiguchi@gmail.com>
> > Date:   Mon Jun 28 19:43:14 2021 -0700
> > 
> >     mm,hwpoison: send SIGBUS with error virutal address
> >     
> >     Now an action required MCE in already hwpoisoned address surely sends a
> >     SIGBUS to current process, but the SIGBUS doesn't convey error virtual
> >     address.  That's not optimal for hwpoison-aware applications.
> >     
> >     To fix the issue, make memory_failure() call kill_accessing_process(),
> >     that does pagetable walk to find the error virtual address.  It could find
> >     multiple virtual addresses for the same error page, and it seems hard to
> >     tell which virtual address is correct one.  But that's rare and sending
> >     incorrect virtual address could be better than no address.  So let's
> >     report the first found virtual address for now.
> > 
> > So this time I read more on this and Naoya explained why - it's only used
> > so far to dump the VA of the poisoned entry.
> 
> Well, not really dumped, but we just pass the VA down the chain to the
> signal handler.
> 
> But on the question whether we need the pfn encoded, I am not sure
> actually.
> check_hwpoisoned_entry() checks whether the pfn where the pte sits is
> the same as the hwpoisoned one, so we know if the process has to be
> killed.
> 
> Now, could we get away with using pte_page() instead of pte_pfn() in there, and
> passing the hwpoisoned page instead ot the pfn?
> I am trying to think of the implications, then we should not need the
> encoded pfn?

I sincerely don't know; we need help from someone know better on hwpoison,
maybe.

It's at least not needed in fault paths, afaiu.

> 
> > However what confused me is, if an entry is poisoned already logically we
> > dump that message in the fault handler not memory_failure(), which is:
> > 
> > MCE: Killing uffd-unit-tests:650 due to hardware memory corruption fault at 7f3589d7e000
> > 
> > So perhaps we're trying to also dump that when the MCEs (points to the same
> > pfn) are only generated concurrently?  I donno much on hwpoison so I cannot
> > tell, there's also implication where it's only triggered if
> > MF_ACTION_REQUIRED.  But I think it means hwpoison may work without pfn
> > encoded, but I don't know the implication to lose that dmesg line.
> 
> Not necesarily concurrently, but simply if for any reason the page could
> not have been unmapped.
> Let us say you have ProcessA and ProcessB mapping the same page.
> We get an MCE for that page but we could not unmapped it, at least not
> from all processes (maybe just ProcessA).
> 
> memory-failure code will mark it as hwpoison, now ProcessA faults it in
> and gets killed because we see that the page is hwpoisoned in the fault
> path, so we sill send VM_FAULT_HWPOISON all the way down till you see
> the:
> 
> "MCE: Killing uffd-unit-tests:650 due to hardware memory corruption
> fault at 7f3589d7e000" from e.g: arch/x86/mm/fault.c:do_sigbus()
> 
> Now, ProcessB still has the page mapped, so upon re-accessing it,
> it will trigger a new MCE event. memory-failure code will see that this

The question is why accessing that hwpoison entry from ProcB triggers an
MCE.  Logically that's a swap entry and it should generate a page fault
rather than MCE.  Then in the pgfault hanlder we don't need that encoded
pfn as we have vmf->address.

> page has already been marked as hwpoisoned, but since we failed to
> unmap it (otherwise no one should be re-accessing it), it goes: "ok,
> let's just kill everybody who has this page mapped".
> 
> 
> > We used to not dump error for swapin error.  Note that here what I am
> > saying is not that Axel is doing things wrong, but it's just that logically
> > swapin error (as pte marker) can also be with !QUIET, so my final point is
> > we may want to avoid having the assumption that "pte marker should always
> > be QUITE", because I want to make it clear that pte marker can used in any
> > form, so itself shouldn't imply anything..
> 
> I think it would make more sense if we have a separate marker for swapin
> errors?
> I mean, deep down, they do not mean the same as poison, right?
> 
> Then you can choose which events get to be silent because you do not
> care, and which ones need to scream loud.
> I think swapin errors belong to the latter. At least I a heads-up why a
> process is getting killed is appreciated, IMHO.

Right it can be separate, and that was the plan IIRC. But maybe an overkill
for now if nobody cared, and we can wait until someone really cares about
that.  After all adding a dmesg line for such event is much easier than
removing one..

Thanks,

-- 
Peter Xu


