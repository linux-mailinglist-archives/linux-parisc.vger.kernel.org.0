Return-Path: <linux-parisc+bounces-1449-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4EA8D44A3
	for <lists+linux-parisc@lfdr.de>; Thu, 30 May 2024 07:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E93E2B23CB7
	for <lists+linux-parisc@lfdr.de>; Thu, 30 May 2024 05:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A799863CF;
	Thu, 30 May 2024 05:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b="IXZfgg85"
X-Original-To: linux-parisc@vger.kernel.org
Received: from matoro.tk (matoro.tk [104.188.251.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E687C634
	for <linux-parisc@vger.kernel.org>; Thu, 30 May 2024 05:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.188.251.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717045239; cv=none; b=WqRoAKqYJK4pOeGOXvNcx7fRuWBQJJ6mP0zPQVu/V5/EA17kJCRC851B9toxHqMkNhLm8c2vGaQt7X3PVHXmmfnJVLypdyoeOfdisL26NxTHazRxa/33yWtywgFmA7mJJVFf4wIiS2a2Fygv7J7xUGyJJqU674Rg8vHGd/srSdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717045239; c=relaxed/simple;
	bh=8Z2N3TgsnpMP+MA1PzMSnrazMh9QWExhuMCXe0+0lq0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=qoMzC0MvbGFh0gHhLZAHh9H1b0TTt1je96il3+OGZ3/qYwwFvLuCXoKFIpN1YkHlT/1NvPtHYdAG+28zCbjxv4FvK43ectsfXMjwl4TyyRGjIP3I4Vaezfdj+2aWQeY6ntRd708dSDCYW85+VjlSkxR6WnvCs2DHQ0igsM5OOnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk; spf=pass smtp.mailfrom=matoro.tk; dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b=IXZfgg85; arc=none smtp.client-ip=104.188.251.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matoro.tk
DKIM-Signature: a=rsa-sha256; bh=Qc41mZpK93maFtefISbzxtc3GU0hFdvysj8Eij5Y05k=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20240416; t=1717045218; v=1; x=1717477218;
 b=IXZfgg85GuO0ICU6uXmwC8K4bG/O3xWas+ceHas+JOhPJTmqKPacp/hd5BqR4eFXCZ6R7cNe
 dbEYiTJ72avPbykJ4Mi7sRkAVjDjVGVg5oBTfxGvxPagZGiIE2eE6oKj6QqlYIbfzG06elf0pN4
 XwYxQIUEG4I3OlTtL3UZi7u+sg4dNdbd2/bbAnFlALDIlmXtN80DAiCsiphmeVdoKdJVJvV9/Oe
 e+rGdsAs35SyaQhXNTU1a2nOVyYcF/jD6BVcnvRMj60dSweQyvZw3lsLHBNyRhI99s5sjxge/mz
 b50CI4YhG0hNDqN7mYYTaODnCdbTU/yZrs24878ZYm71/El/d3399Kvqy8CV45+w0xYsKTt607e
 YQcr0rW0oJ7E/hdJsw3ynh6wKN/uL/axd3QZydqkC6wjZPgH83w9EvYFDMP/xe7iN/kqIfYYyHf
 FiUDTy6aurLiXHkS0YthSUlSZotYlAICqIN515wQXrtZUNnEjW8CcKiXYpF5tH4CbGQQ15bH7Ow
 cFuhBbHXaKSeruRMgiY4/+NmgF0Mmrj8ZBUNtXmOzXSe2HYgtU74DLOIbWIsBSt0h2rOuQw7lJn
 Kurtal7g4/e8Ne1KTxjl2kPXATewsDL0Gkp4pNL2XN1MAM/hdbUf/PPITHtxs0NziYl3kUcpdaV
 IdgfCp97m3Q=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 084921f1; Thu, 30 May
 2024 01:00:18 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 May 2024 01:00:18 -0400
From: matoro <matoro_mailinglist_kernel@matoro.tk>
To: John David Anglin <dave.anglin@bell.net>
Cc: Vidra.Jonas@seznam.cz, linux-parisc@vger.kernel.org, John David Anglin
 <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Try to fix random segmentation faults in package
 builds
In-Reply-To: <16d8c07c-9fbe-4e81-b1f1-3127ab05410a@bell.net>
References: <Zje6ywzNAltbG3R2@mx3210.localdomain>
 <C4u.NueN.39ikIzqu}iW.1cEpt7@seznam.cz>
 <91563ff7-349b-4815-bcfe-99f8f34b0b16@bell.net>
 <34fdf2250fe166372a15d74d28adc8d2@matoro.tk>
 <e88cebf4-bec6-4247-93ae-39eff59cfc8e@bell.net>
 <88756923-4c3c-41bf-97a8-aab25bc93644@bell.net>
 <28cea8aa7cce7c56bbb8f88067c3f3ba@matoro.tk>
 <16d8c07c-9fbe-4e81-b1f1-3127ab05410a@bell.net>
Message-ID: <7345472b8bfa050ec2b86df5f69f99a4@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-05-29 12:33, John David Anglin wrote:
> On 2024-05-29 11:54 a.m., matoro wrote:
>> On 2024-05-09 13:10, John David Anglin wrote:
>>> On 2024-05-08 4:52 p.m., John David Anglin wrote:
>>>>> with no accompanying stack trace and then the BMC would restart the 
>>>>> whole machine automatically. These were infrequent enough that the 
>>>>> segfaults were the bigger problem, but after applying this patch on top 
>>>>> of 6.8, this changed the dynamic.  It seems to occur during builds with 
>>>>> varying I/O loads.  For example, I was able to build gcc fine, with no 
>>>>> segfaults, but I was unable to build perl, a much smaller build, without 
>>>>> crashing the machine. I did not observe any segfaults over the day or 2 
>>>>> I ran this patch, but that's not an unheard-of stretch of 
>>>>> time even without it, and I am being forced to revert because of the panics.
>>>> Looks like there is a problem with 6.8.  I'll do some testing with it.
>>> So far, I haven't seen any panics with 6.8.9 but I have seen some random 
>>> segmentation faults
>>> in the gcc testsuite.  I looked at one ld fault in some detail. 18 
>>> contiguous words in the  elf_link_hash_entry
>>> struct were zeroed starting with the last word in the bfd_link_hash_entry 
>>> struct causing the fault.
>>> The section pointer was zeroed.
>>> 
>>> 18 words is a rather strange number of words to corrupt and corruption 
>>> doesn't seem related
>>> to object structure.  In any case, it is not page related.
>>> 
>>> It's really hard to tell how this happens.  The corrupt object was at a 
>>> slightly different location
>>> than it is when ld is run under gdb.  Can't duplicate in gdb.
>>> 
>>> Dave
>> 
>> Dave, not sure how much testing you have done with current mainline 
>> kernels, but I've had to temporarily give up on 6.8 and 6.9 for now, as 
>> most heavy builds quickly hit that kernel panic. 6.6 does not seem to have 
>> the problem though.  The patch from this thread does not seem to have made 
>> a difference one way or the other w.r.t. segfaults.
> My latest patch is looking good.  I have 6 days of testing on c8000 (1 GHz 
> PA8800) with 6.8.10 and 6.8.11, and I haven't had any random segmentation
> faults.  System has been building debian packages.  In addition, it has been 
> building and testing gcc.  It's on its third gcc build and check with patch.
> 
> The latest version uses lpa_user() with fallback to page table search in 
> flush_cache_page_if_present() to obtain physical page address.
> It revises copy_to_user_page() and copy_from_user_page() to flush kernel 
> mapping with tmpalias flushes.  copy_from_user_page()
> was missing kernel mapping flush.  flush_cache_vmap() and 
> flush_cache_vunmap() are moved into cache.c.  TLB is now flushed before
> cache flush to inhibit move-in in these routines. flush_cache_vmap() now 
> handles small VM_IOREMAP flushes instead of flushing
> entire cache.  This latter change is an optimization.
> 
> If random faults are still present, I believe we will have to give up trying 
> to optimize flush_cache_mm() and flush_cache_range() and
> flush the whole cache in these routines.
> 
> Some work would be needed to backport my current patch to longterm kernels 
> because of folio changes in 6.8.
> 
> Dave

Thanks a ton Dave, I've applied this on top of 6.9.2 and also think I'm 
seeing improvement!  No panics yet, I have a couple week's worth of package 
testing to catch up on so I'll report if I see anything!

