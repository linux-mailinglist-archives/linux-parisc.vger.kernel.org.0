Return-Path: <linux-parisc+bounces-1410-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 267DD8C64ED
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2024 12:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEC39285CCA
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2024 10:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AB55A788;
	Wed, 15 May 2024 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="osfCs+ZD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7YEKYFmQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="osfCs+ZD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7YEKYFmQ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2EE59154;
	Wed, 15 May 2024 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715768525; cv=none; b=d3gOH7Q8zgyktqx81KxvDgpOCFC/3ZO2LUG8XJ9jlgwb9nTIwvA9772wughf14n9/nvh+mSTS0ebFldQzjotQ8jORSpk0bTbqdLYP1DHhpFf7RNFOUfznLnbBTfsF39g6G5C7iSlDftiCPVnQ83NfQJj7pq+MScFYr5WZvNTEsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715768525; c=relaxed/simple;
	bh=Y8wkBdQIpbarQ9dWlIdQeb/smLJyFN68Qn7A2Lv4Sk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcWe9Mqd+nBWc52TSZcOkqcaCt/cjpT2agrhxHpMXxN1gTCM/VwM/cqoXTWqpJC8OtLvHFVyC+TQs2JE/xBHqzVkCrjEr1YYhR6CNizdqZ8r2YIZRb1Ue4a/uw722NrKqQuH4icIDhjB+LZjOY6sm9ab017yVvu46+SOnI+B5yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=osfCs+ZD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7YEKYFmQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=osfCs+ZD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7YEKYFmQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 479BE2050B;
	Wed, 15 May 2024 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715768522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvnm5h9Dm1o+r/HqlbIr30i3nlCVPpxQO8iGYoJ/oZs=;
	b=osfCs+ZDMySdssvcMGMbx0XH5WEA3dYR8XeMeO2WEbM+zOFp5pXTLthlcyjJwZTiDQaMaO
	VRvf+xfkEhs8CjC/OHJBKTpTgYm96uvH6V9ZSyzJlnHYJlsrwXrmqSJf5ZkE7vsJZRkoRN
	meER9rkMfyaCIwtzhdP0sqoekBwdiSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715768522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvnm5h9Dm1o+r/HqlbIr30i3nlCVPpxQO8iGYoJ/oZs=;
	b=7YEKYFmQ+oTHb7De1VDCZo6Q0SgjUQQpJNuv7sC0p34RRxzmqFebeTGRNwRitQER1MDXDT
	JZD2wQKdQlPdaTBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715768522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvnm5h9Dm1o+r/HqlbIr30i3nlCVPpxQO8iGYoJ/oZs=;
	b=osfCs+ZDMySdssvcMGMbx0XH5WEA3dYR8XeMeO2WEbM+zOFp5pXTLthlcyjJwZTiDQaMaO
	VRvf+xfkEhs8CjC/OHJBKTpTgYm96uvH6V9ZSyzJlnHYJlsrwXrmqSJf5ZkE7vsJZRkoRN
	meER9rkMfyaCIwtzhdP0sqoekBwdiSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715768522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvnm5h9Dm1o+r/HqlbIr30i3nlCVPpxQO8iGYoJ/oZs=;
	b=7YEKYFmQ+oTHb7De1VDCZo6Q0SgjUQQpJNuv7sC0p34RRxzmqFebeTGRNwRitQER1MDXDT
	JZD2wQKdQlPdaTBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9992139B3;
	Wed, 15 May 2024 10:22:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C3aFLsiMRGZzXwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 15 May 2024 10:22:00 +0000
Date: Wed, 15 May 2024 12:21:51 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Peter Xu <peterx@redhat.com>
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
Message-ID: <ZkSMv31Cwx080no7@localhost.localdomain>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <Zj51rEwZeSK4Vr1G@x1n>
 <ZkPJCc5N1Eotpa4u@localhost.localdomain>
 <ZkPY4CSnZWZnxjTa@x1n>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkPY4CSnZWZnxjTa@x1n>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,linux-foundation.org,kernel.org,alien8.de,csgroup.eu,linux.intel.com,redhat.com,zytor.com,gmx.de,hansenpartnership.com,nvidia.com,huawei.com,infradead.org,ellerman.id.au,linux.dev,linux.ibm.com,gmail.com,linutronix.de,vger.kernel.org,kvack.org,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLj6zumtikrrmnnbmzkety5zmd)]

On Tue, May 14, 2024 at 03:34:24PM -0600, Peter Xu wrote:
> The question is whether we can't.
> 
> Now we reserved a swp entry just for hwpoison and it makes sense only
> because we cached the poisoned pfn inside.  My long standing question is
> why do we ever need that pfn after all.  If we don't need the pfn, we
> simply need a bit in the pgtable entry saying that it's poisoned, if
> accessed we should kill the process using sigbus.
> 
> I used to comment on this before, the only path that uses that pfn is
> check_hwpoisoned_entry(), which was introduced in:
> 
> commit a3f5d80ea401ac857f2910e28b15f35b2cf902f4
> Author: Naoya Horiguchi <nao.horiguchi@gmail.com>
> Date:   Mon Jun 28 19:43:14 2021 -0700
> 
>     mm,hwpoison: send SIGBUS with error virutal address
>     
>     Now an action required MCE in already hwpoisoned address surely sends a
>     SIGBUS to current process, but the SIGBUS doesn't convey error virtual
>     address.  That's not optimal for hwpoison-aware applications.
>     
>     To fix the issue, make memory_failure() call kill_accessing_process(),
>     that does pagetable walk to find the error virtual address.  It could find
>     multiple virtual addresses for the same error page, and it seems hard to
>     tell which virtual address is correct one.  But that's rare and sending
>     incorrect virtual address could be better than no address.  So let's
>     report the first found virtual address for now.
> 
> So this time I read more on this and Naoya explained why - it's only used
> so far to dump the VA of the poisoned entry.

Well, not really dumped, but we just pass the VA down the chain to the
signal handler.

But on the question whether we need the pfn encoded, I am not sure
actually.
check_hwpoisoned_entry() checks whether the pfn where the pte sits is
the same as the hwpoisoned one, so we know if the process has to be
killed.

Now, could we get away with using pte_page() instead of pte_pfn() in there, and
passing the hwpoisoned page instead ot the pfn?
I am trying to think of the implications, then we should not need the
encoded pfn?


> However what confused me is, if an entry is poisoned already logically we
> dump that message in the fault handler not memory_failure(), which is:
> 
> MCE: Killing uffd-unit-tests:650 due to hardware memory corruption fault at 7f3589d7e000
> 
> So perhaps we're trying to also dump that when the MCEs (points to the same
> pfn) are only generated concurrently?  I donno much on hwpoison so I cannot
> tell, there's also implication where it's only triggered if
> MF_ACTION_REQUIRED.  But I think it means hwpoison may work without pfn
> encoded, but I don't know the implication to lose that dmesg line.

Not necesarily concurrently, but simply if for any reason the page could
not have been unmapped.
Let us say you have ProcessA and ProcessB mapping the same page.
We get an MCE for that page but we could not unmapped it, at least not
from all processes (maybe just ProcessA).

memory-failure code will mark it as hwpoison, now ProcessA faults it in
and gets killed because we see that the page is hwpoisoned in the fault
path, so we sill send VM_FAULT_HWPOISON all the way down till you see
the:

"MCE: Killing uffd-unit-tests:650 due to hardware memory corruption
fault at 7f3589d7e000" from e.g: arch/x86/mm/fault.c:do_sigbus()

Now, ProcessB still has the page mapped, so upon re-accessing it,
it will trigger a new MCE event. memory-failure code will see that this
page has already been marked as hwpoisoned, but since we failed to
unmap it (otherwise no one should be re-accessing it), it goes: "ok,
let's just kill everybody who has this page mapped".


> We used to not dump error for swapin error.  Note that here what I am
> saying is not that Axel is doing things wrong, but it's just that logically
> swapin error (as pte marker) can also be with !QUIET, so my final point is
> we may want to avoid having the assumption that "pte marker should always
> be QUITE", because I want to make it clear that pte marker can used in any
> form, so itself shouldn't imply anything..

I think it would make more sense if we have a separate marker for swapin
errors?
I mean, deep down, they do not mean the same as poison, right?

Then you can choose which events get to be silent because you do not
care, and which ones need to scream loud.
I think swapin errors belong to the latter. At least I a heads-up why a
process is getting killed is appreciated, IMHO.
 

-- 
Oscar Salvador
SUSE Labs

