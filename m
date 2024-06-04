Return-Path: <linux-parisc+bounces-1476-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA78FB697
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2024 17:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 872C61C22593
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2024 15:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA9213D2B6;
	Tue,  4 Jun 2024 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b="aYNOychQ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from matoro.tk (matoro.tk [104.188.251.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06CB8BF7
	for <linux-parisc@vger.kernel.org>; Tue,  4 Jun 2024 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.188.251.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513688; cv=none; b=VJJc7zoaai61WXFiMCYQNGE6lZB1XCIc/ynSEFT3ZZncz4+IwgeMT8lZJ4VgyMdNUMJ1SGSdyEMav4MLedVFrqjB8Evt/1aohSuASqe2PR1LplMabpmfWSOSy7ULi9vwMUDSs1ISL9mQekh5C7/dPh6KTN7K48+4NQLe5xhVNP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513688; c=relaxed/simple;
	bh=jJYL4kqjFfD6Z5Yagptutl7tUwdJHKcmoRoWC2yH8lY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lX92V90K/90IaD5J66bDz1oqq8Fdbe6Hnk3sGAtXPUqOKBcWHGSwhMzaDRQGED5/86GL9ZMDkbF+ecbMIZir7tebev9kEShADQMvxEfc+FXz+9sVNtIfJNsgm9uv31tyySDi45yTIf6JMa7UFt/ML5YcfuEMB/TiFQYHIp2gteU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk; spf=pass smtp.mailfrom=matoro.tk; dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b=aYNOychQ; arc=none smtp.client-ip=104.188.251.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matoro.tk
DKIM-Signature: a=rsa-sha256; bh=3JH8izjNjuYVHGeWeNwqj80Vgl9oCdKRHIdLVgpGJ2g=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20240416; t=1717513648; v=1; x=1717945648;
 b=aYNOychQZBgKIfFDqzY0DvkkzJADkAkpyzcb2ZazekKmdmvXjXBeUwXAxxYiqORidMjTit/W
 EvUEnqyYrvG39/cuvAe/y8Jptw1lP/swoZE6G02kX0n7C9ZCoROGnttJdfRI+lie/zchJDvQfPE
 E+FJI3UMlAEdkWLgemcVXc8Xl4Q6BfESaORymeD5fdxqdgNlApHP7stRp05vQ2xTexELK/mqaKj
 hW4SDdBcBXIlTqhBLRmkMUdsbNJ4hfap7fJpZSbU4kO4D9auD+mNxQ+4InnsKBXfdyTR4iRcdTt
 Xe2iGb2Uttue/MAEChWUy/UhhqoZhbHV/JHJZD3uB+GSWIlrqH1t/tfmQ8Ys90ij5okbtvaaqd1
 5J2TN4GBuDhxlWcKV2VUfREfnw1VEVoJsjavqT6ZHpWu182mGVHvwSYwOdkBynOKDhmtecTNhD4
 AG1bX29AiQFITwaugsBS9pb6QOd6Mbkfo8md/dj3i7Jy2fSQe83uEuXPzXGLmalXnT4yDSjb5rN
 ODFFYLu/qt8SP2CpBNz0IaXAMJmj7E6D29MkFCmOnMf5+nLua+AOk9XXCtIvbIvwmKTbUO6RTSD
 Yf8kMA5o8bIMptPBW0l/WWZ1eRYocI/yg5s82Rb+roP90/VSMXZZAcvonCu0Y8EAkf5d7ffGqJr
 1V1LJ8SFMFY=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 12593053; Tue, 04 Jun
 2024 11:07:28 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 04 Jun 2024 11:07:27 -0400
From: matoro <matoro_mailinglist_kernel@matoro.tk>
To: John David Anglin <dave.anglin@bell.net>
Cc: Vidra.Jonas@seznam.cz, linux-parisc@vger.kernel.org, John David Anglin
 <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Try to fix random segmentation faults in package
 builds
In-Reply-To: <7345472b8bfa050ec2b86df5f69f99a4@matoro.tk>
References: <Zje6ywzNAltbG3R2@mx3210.localdomain>
 <C4u.NueN.39ikIzqu}iW.1cEpt7@seznam.cz>
 <91563ff7-349b-4815-bcfe-99f8f34b0b16@bell.net>
 <34fdf2250fe166372a15d74d28adc8d2@matoro.tk>
 <e88cebf4-bec6-4247-93ae-39eff59cfc8e@bell.net>
 <88756923-4c3c-41bf-97a8-aab25bc93644@bell.net>
 <28cea8aa7cce7c56bbb8f88067c3f3ba@matoro.tk>
 <16d8c07c-9fbe-4e81-b1f1-3127ab05410a@bell.net>
 <7345472b8bfa050ec2b86df5f69f99a4@matoro.tk>
Message-ID: <52c0dfa7e2054d883bd66da7ab2e68b8@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-05-30 01:00, matoro wrote:
> On 2024-05-29 12:33, John David Anglin wrote:
>> On 2024-05-29 11:54 a.m., matoro wrote:
>>> On 2024-05-09 13:10, John David Anglin wrote:
>>>> On 2024-05-08 4:52 p.m., John David Anglin wrote:
>>>>>> with no accompanying stack trace and then the BMC would restart the 
>>>>>> whole machine automatically. These were infrequent enough that the 
>>>>>> segfaults were the bigger problem, but after applying this patch on top 
>>>>>> of 6.8, this changed the dynamic.  It seems to occur during builds with 
>>>>>> varying I/O loads.  For example, I was able to build gcc fine, with no 
>>>>>> segfaults, but I was unable to build perl, a much smaller build, 
>>>>>> without crashing the machine. I did not observe any segfaults over the 
>>>>>> day or 2 I ran this patch, but that's not an unheard-of stretch of 
>>>>>> time even without it, and I am being forced to revert because of the panics.
>>>>> Looks like there is a problem with 6.8.  I'll do some testing with it.
>>>> So far, I haven't seen any panics with 6.8.9 but I have seen some random 
>>>> segmentation faults
>>>> in the gcc testsuite.  I looked at one ld fault in some detail. 18 
>>>> contiguous words in the  elf_link_hash_entry
>>>> struct were zeroed starting with the last word in the bfd_link_hash_entry 
>>>> struct causing the fault.
>>>> The section pointer was zeroed.
>>>> 
>>>> 18 words is a rather strange number of words to corrupt and corruption 
>>>> doesn't seem related
>>>> to object structure.  In any case, it is not page related.
>>>> 
>>>> It's really hard to tell how this happens.  The corrupt object was at a 
>>>> slightly different location
>>>> than it is when ld is run under gdb.  Can't duplicate in gdb.
>>>> 
>>>> Dave
>>> 
>>> Dave, not sure how much testing you have done with current mainline 
>>> kernels, but I've had to temporarily give up on 6.8 and 6.9 for now, as 
>>> most heavy builds quickly hit that kernel panic. 6.6 does not seem to have 
>>> the problem though.  The patch from this thread does not seem to have made 
>>> a difference one way or the other w.r.t. segfaults.
>> My latest patch is looking good.  I have 6 days of testing on c8000 (1 GHz 
>> PA8800) with 6.8.10 and 6.8.11, and I haven't had any random segmentation
>> faults.  System has been building debian packages.  In addition, it has 
>> been building and testing gcc.  It's on its third gcc build and check with 
>> patch.
>> 
>> The latest version uses lpa_user() with fallback to page table search in 
>> flush_cache_page_if_present() to obtain physical page address.
>> It revises copy_to_user_page() and copy_from_user_page() to flush kernel 
>> mapping with tmpalias flushes.  copy_from_user_page()
>> was missing kernel mapping flush.  flush_cache_vmap() and 
>> flush_cache_vunmap() are moved into cache.c.  TLB is now flushed before
>> cache flush to inhibit move-in in these routines. flush_cache_vmap() now 
>> handles small VM_IOREMAP flushes instead of flushing
>> entire cache.  This latter change is an optimization.
>> 
>> If random faults are still present, I believe we will have to give up 
>> trying to optimize flush_cache_mm() and flush_cache_range() and
>> flush the whole cache in these routines.
>> 
>> Some work would be needed to backport my current patch to longterm kernels 
>> because of folio changes in 6.8.
>> 
>> Dave
> 
> Thanks a ton Dave, I've applied this on top of 6.9.2 and also think I'm 
> seeing improvement!  No panics yet, I have a couple week's worth of package 
> testing to catch up on so I'll report if I see anything!

I've seen a few warnings in my dmesg while testing, although I didn't see any 
immediately corresponding failures.  Any danger?

[Sun Jun  2 18:46:29 2024] ------------[ cut here ]------------
[Sun Jun  2 18:46:29 2024] WARNING: CPU: 0 PID: 26808 at 
arch/parisc/kernel/cache.c:624 flush_cache_page_if_present+0x1a4/0x330
[Sun Jun  2 18:46:29 2024] Modules linked in: raw_diag tcp_diag inet_diag 
netlink_diag unix_diag nfnetlink overlay loop nfsv4 dns_resolver nfs
lockd grace sunrpc netfs autofs4 binfmt_misc sr_mod ohci_pci cdrom ehci_pci 
ohci_hcd ehci_hcd tg3 pata_cmd64x usbcore ipmi_si hwmon usb_common
libata libphy ipmi_devintf nls_base ipmi_msghandler
[Sun Jun  2 18:46:29 2024] CPU: 0 PID: 26808 Comm: bash Tainted: G        W   
        6.9.3-gentoo-parisc64 #1
[Sun Jun  2 18:46:29 2024] Hardware name: 9000/800/rp3440

[Sun Jun  2 18:46:29 2024]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[Sun Jun  2 18:46:29 2024] PSW: 00001000000001101111100100001111 Tainted: G   
      W
[Sun Jun  2 18:46:29 2024] r00-03  000000ff0806f90f 000000004106b280 
00000000402090bc 000000005160c6a0
[Sun Jun  2 18:46:29 2024] r04-07  0000000040f99a80 00000000f96da000 
00000001659a2360 000000000800000f
[Sun Jun  2 18:46:29 2024] r08-11  0000000c0063f89c 0000000000000000 
000000004ce09e9c 000000005160c5a8
[Sun Jun  2 18:46:29 2024] r12-15  000000004ce09eb0 00000000414ebd70 
0000000041687768 0000000041646830
[Sun Jun  2 18:46:29 2024] r16-19  00000000516333c0 0000000001200000 
00000001c36be780 0000000000000003
[Sun Jun  2 18:46:29 2024] r20-23  0000000000001a46 000000000f584000 
ffffffffc0000000 000000000000000f
[Sun Jun  2 18:46:29 2024] r24-27  0000000000000000 000000000800000f 
000000004ce09ea0 0000000040f99a80
[Sun Jun  2 18:46:29 2024] r28-31  0000000000000000 000000005160c720 
000000005160c750 0000000000000000
[Sun Jun  2 18:46:29 2024] sr00-03  00000000052be800 00000000052be800 
0000000000000000 00000000052be800
[Sun Jun  2 18:46:29 2024] sr04-07  0000000000000000 0000000000000000 
0000000000000000 0000000000000000

[Sun Jun  2 18:46:29 2024] IASQ: 0000000000000000 0000000000000000 IAOQ: 
0000000040209104 0000000040209108
[Sun Jun  2 18:46:29 2024]  IIR: 03ffe01f    ISR: 0000000010240000  IOR: 
0000003382609ea0
[Sun Jun  2 18:46:29 2024]  CPU:        0   CR30: 00000000516333c0 CR31: 
fffffff0f0e05ee0
[Sun Jun  2 18:46:29 2024]  ORIG_R28: 000000005160c7b0
[Sun Jun  2 18:46:29 2024]  IAOQ[0]: flush_cache_page_if_present+0x1a4/0x330
[Sun Jun  2 18:46:29 2024]  IAOQ[1]: flush_cache_page_if_present+0x1a8/0x330
[Sun Jun  2 18:46:29 2024]  RP(r2): flush_cache_page_if_present+0x15c/0x330
[Sun Jun  2 18:46:29 2024] Backtrace:
[Sun Jun  2 18:46:29 2024]  [<000000004020afb8>] flush_cache_mm+0x1a8/0x1c8
[Sun Jun  2 18:46:29 2024]  [<000000004023cf3c>] copy_mm+0x2a8/0xfd0
[Sun Jun  2 18:46:29 2024]  [<0000000040241040>] copy_process+0x1684/0x26e8
[Sun Jun  2 18:46:29 2024]  [<0000000040242218>] kernel_clone+0xcc/0x754
[Sun Jun  2 18:46:29 2024]  [<0000000040242908>] __do_sys_clone+0x68/0x80
[Sun Jun  2 18:46:29 2024]  [<0000000040242d14>] sys_clone+0x30/0x60
[Sun Jun  2 18:46:29 2024]  [<0000000040203fbc>] syscall_exit+0x0/0x10

[Sun Jun  2 18:46:29 2024] ---[ end trace 0000000000000000 ]---

