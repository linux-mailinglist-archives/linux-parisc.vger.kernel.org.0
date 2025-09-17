Return-Path: <linux-parisc+bounces-4116-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C81B80640
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Sep 2025 17:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC8807B421B
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Sep 2025 04:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1682C223DE8;
	Wed, 17 Sep 2025 04:42:00 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D9A3D987
	for <linux-parisc@vger.kernel.org>; Wed, 17 Sep 2025 04:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758084120; cv=none; b=O8vXafBhRoEa5JJ9JaHNC/e1kkA6c4Zg/pEd5LWlrrq00DZEpXEQyZjztkHhAcvub6nR2mr2He44Cy4lYM5BHpOFZaFrm2/IpIvgOTZlGpJBe0vD4eoGGuXNTFwHmyT8buMybdVAm+QseXFiCsPdRYUGAMH5JEH9b6w6vScReKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758084120; c=relaxed/simple;
	bh=xd7d2NUW4LFcsrr1TKlGL4j6k+dUJ1BPKqq2z/oZa8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCuVkem3L881EuYv9mSNM/s5XirO2NYUBMUKPEsh4A5ttt/W/+ZPEbjVDT/fG8V1Y/El1EOoOScFfEVD6uy4oupHtqi0jDuXzK4zAUoHVqriEcIDaB4xmUU5Y4yNvXNO7F+65mI36V2FjmRr4VzBMHbn4ob99yT9HUHVphaMmk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c45ff70000001609-1d-68ca38860b96
Date: Wed, 17 Sep 2025 13:26:40 +0900
From: Byungchul Park <byungchul@sk.com>
To: David Hildenbrand <david@redhat.com>
Cc: Helge Deller <deller@kernel.org>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux parisc List <linux-parisc@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, kernel_team@skhynix.com
Subject: Re: [PATCH] Fix 32-bit boot failure due inaccurate
 page_pool_page_is_pp()
Message-ID: <20250917042640.GA62248@system.software.com>
References: <aMQ2ZjZNyNwAiUk-@p100>
 <cf235550-f29b-4f22-b5b5-c3e7a576239d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf235550-f29b-4f22-b5b5-c3e7a576239d@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsXC9ZZnkW6bxakMg6XnBC3mrF/DZvF1/S9m
	i8+/DzFb3Fvzn9Xi0akLTBaXDj9icWDz2LSqE0h8msTucWLGbxaP9/uusnl83iQXwBrFZZOS
	mpNZllqkb5fAldHz9RFrwSqhiq23HzM3ML7i62Lk4JAQMJFYOb2ii5ETzHy84gQbiM0ioCrR
	ePYJmM0moC5x48ZPZhBbREBDYlPbBiCbi4NZYAqTxJKfP9lBEsICIRLvXxwFK+IVsJBYeWEd
	K4gtJBAucXvGHEaIuKDEyZlPWEBsZgEdiZ1b77CB3MAsIC2x/B8HRFheonnrbLAxnAJ2Eq8f
	QdwgKqAscWDbcSaQvRICW9gkPm+fxQ5xtKTEwRU3WCYwCs5CsmIWkhWzEFbMQrJiASPLKkah
	zLyy3MTMHBO9jMq8zAq95PzcTYzACFhW+yd6B+OnC8GHGAU4GJV4eBNyT2YIsSaWFVfmHmKU
	4GBWEuFd+uBEhhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFeo2/lKUIC6YklqdmpqQWpRTBZJg5O
	qQbG8oNMQbNY5tXsvnd+d2uaJl/q8QvBXdtupC1/kMd/955P/I033VXaAuWPrXILutRYL97q
	Perw6/k8NiapUv/4pULONy0+S8THTdqysPO87TqNFvUkGbeJfOGXlv6SPPN657lu2TkZz47G
	SVrFq2cGvUpgMt/iKq76U36OtE/N4sYIc82Xi5iUWIozEg21mIuKEwH+2j59fAIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsXC5WfdrNtmcSrD4L+KxZz1a9gsvq7/xWzx
	+fchZovDc0+yWtxb85/V4tGpC0wWlw4/YnFg99i0qpPNY9OnSeweJ2b8ZvF4v+8qm8fiFx+Y
	PD5vkgtgi+KySUnNySxLLdK3S+DK6Pn6iLVglVDF1tuPmRsYX/F1MXJySAiYSDxecYINxGYR
	UJVoPPsEzGYTUJe4ceMnM4gtIqAhsaltA5DNxcEsMIVJYsnPn+wgCWGBEIn3L46CFfEKWEis
	vLCOFcQWEgiXuD1jDiNEXFDi5MwnLCA2s4COxM6td4AWcADZ0hLL/3FAhOUlmrfOBhvDKWAn
	8foRxA2iAsoSB7YdZ5rAyDcLyaRZSCbNQpg0C8mkBYwsqxhFMvPKchMzc0z1irMzKvMyK/SS
	83M3MQLDeVntn4k7GL9cdj/EKMDBqMTDm5B7MkOINbGsuDL3EKMEB7OSCO/SBycyhHhTEiur
	Uovy44tKc1KLDzFKc7AoifN6hacmCAmkJ5akZqemFqQWwWSZODilGhivcR8+myy40pdnc/2e
	dTs/XZ6+vypOrX3zsZs3BTef4u59qsih/0J391WnS27ZMgJXAz61n3vQlrb6TnBdnh9L4pzZ
	X3mPMer9n+9qsPvNkj/fNzTlXXjweqvEmS1zrFu8pWYqpl1bWz+B+43OXtNb8dsKdjrrRUby
	NNvw/ppRV9O/cTdX1vwnSizFGYmGWsxFxYkAlYwuzWMCAAA=
X-CFilter-Loop: Reflected

On Fri, Sep 12, 2025 at 05:49:15PM +0200, David Hildenbrand wrote:
> On 12.09.25 17:04, Helge Deller wrote:
> > Commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them when
> > destroying the pool") changed PP_MAGIC_MASK from 0xFFFFFFFC to 0xc000007c on
> > 32-bit platforms.
> > 
> > The function page_pool_page_is_pp() uses PP_MAGIC_MASK to identify page pool
> > pages, but the remaining bits are not sufficient to unambiguously identify
> > such pages any longer.
> > 
> > So page_pool_page_is_pp() now sometimes wrongly reports pages as page pool
> > pages and as such triggers a kernel BUG as it believes it found a page pool
> > leak.
> > 
> > There are patches upcoming where page_pool_page_is_pp() will not depend on
> > PP_MAGIC_MASK and instead use page flags to identify page pool pages. Until
> > those patches are merged, the easiest temporary fix is to disable the check
> > on 32-bit platforms.
> > 
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Toke Høiland-Jørgensen <toke@redhat.com>
> > Cc: Linux Memory Management List <linux-mm@kvack.org>
> > Cc: Linux parisc List <linux-parisc@vger.kernel.org>
> > Cc: <stable@vger.kernel.org> # v6.15+
> > Signed-off-by: Helge Deller <deller@gmx.de>
> > Link: https://www.spinics.net/lists/kernel/msg5849623.html
> > Fixes: ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them when destroying the pool")
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 1ae97a0b8ec7..f3822ae70a81 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -4190,7 +4190,7 @@ int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
> >    */
> >   #define PP_MAGIC_MASK ~(PP_DMA_INDEX_MASK | 0x3UL)
> > 
> > -#ifdef CONFIG_PAGE_POOL
> > +#if defined(CONFIG_PAGE_POOL) && defined(CONFIG_64BIT)
> >   static inline bool page_pool_page_is_pp(const struct page *page)
> >   {
> >       treturn (page->pp_magic & PP_MAGIC_MASK) == PP_SIGNATURE;
> > 
> 
> As a temporary fix this LGTM.

Sure.  As a temporary fix, why not.

I need to start the work replacing page_pool_page_is_pp() with using
page type again tho.

	Byungchul

> But I want to hear other opinions.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 
> --
> Cheers
> 
> David / dhildenb
> 

