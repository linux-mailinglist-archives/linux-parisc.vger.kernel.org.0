Return-Path: <linux-parisc+bounces-1368-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6638C0521
	for <lists+linux-parisc@lfdr.de>; Wed,  8 May 2024 21:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A7841C2182B
	for <lists+linux-parisc@lfdr.de>; Wed,  8 May 2024 19:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9A3130A4A;
	Wed,  8 May 2024 19:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b="HmHIWQvt"
X-Original-To: linux-parisc@vger.kernel.org
Received: from matoro.tk (matoro.tk [104.188.251.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782E612CDBC
	for <linux-parisc@vger.kernel.org>; Wed,  8 May 2024 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.188.251.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715196854; cv=none; b=HeCkB95jPVOWjhKBSvqDqbe3uE7WeF7aignNkyWsL7aYY6AAcA+RJePoSvT0ShNJfiNASt+EyQOAOSjxMawE9XU3LiNPU2GfNCW+DBA7/lb/GaWqcNyRHbOmkYKu6oTW3cPqg1WgysysY6DKP2pvBvMIr03/k5TefNAW83hD7s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715196854; c=relaxed/simple;
	bh=3wt2WEB6LegHZI55/4Iesnw5H/sDjymAM9VA2jwnkXc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Ec+IOTFi/y+w4xbgxXNLjbp9D398hxWwak3R0UqmUjPQ1+zT/lEU7vh75irej0dGkJPtpnQYDmOYvpr6FoP+J5y6y63uihiNhY2TfRNNX6Q9MqYNhDOGZHMPmsldrCVqF8klgboHM5mB/oVAf1/54qvBzs/7E9QGbl8uZJsfj/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk; spf=pass smtp.mailfrom=matoro.tk; dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b=HmHIWQvt; arc=none smtp.client-ip=104.188.251.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matoro.tk
DKIM-Signature: a=rsa-sha256; bh=1w9+Ma8Wf8pv0zcDDdDCZ3hD/OlTd+4TD9BPuKKkLTs=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20240416; t=1715195932; v=1; x=1715627932;
 b=HmHIWQvt9+18Nv99ZO9c9nJiTf09Fpj1CmQR9HwRmCSdCq+TGZQeSXdez0z4gPDOH/HEkgyc
 fsY27kOQr/CoDBTV9bEMGJx2tgA7KXbLRjp7Shw4KnmiVX9PLcAm/9++Ze5i6p8V3r++8dGI9Cj
 mR9AjQwDBaBsFy26Hu+cCqyeOzSFsXAm/iQXd4CjvZbbB32SDeGQ7R2fkNk4/hSXEzlFXX3wKeP
 jL12Pf3a+VDEqQ/f414dhbmJPoPSG+6gAiP0KTjHDEOe6VyGnhnLYIcgQHQsXFl/TYYIKLn/I7N
 gGU4yFkGgGCOha/rpwfv75IV7C0DTehRMk5INC0G1VQ5WwUu02zUmPYfMLVEGqjYXehK+zVm23q
 U7RxJi3EvLDXBsTAFnKT8IYgsTY3tEEkXElUHqpRvhUN2a+F2UoZInKeQ61cJlLJqUDnZWlcWxh
 e0hVwlufPOyxUc377S4VOi19lIkCtI6seUEcyouwv9FL1iVoenLgx3POSI8kb1WzDXMG2k23Lq1
 7dSUHPuA0+LoBy6Rv1jQOjFT1eUmXi1jT5ZhUcSPfPKroyOUTKfYHUB/envzt8zIK7fkvWVNh/i
 5bgnvJAPVoty0uMoHtUGr51mwW+Rlp5l9CKtdpPBLiZ76ApVHmCfwMXn+BGJnbnlVbO1zbB36ZQ
 8B/vhL53qGA=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 3561a11f; Wed, 08 May
 2024 15:18:52 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 08 May 2024 15:18:52 -0400
From: matoro <matoro_mailinglist_kernel@matoro.tk>
To: John David Anglin <dave.anglin@bell.net>
Cc: Vidra.Jonas@seznam.cz, linux-parisc@vger.kernel.org, John David Anglin
 <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Try to fix random segmentation faults in package
 builds
In-Reply-To: <91563ff7-349b-4815-bcfe-99f8f34b0b16@bell.net>
References: <Zje6ywzNAltbG3R2@mx3210.localdomain>
 <C4u.NueN.39ikIzqu}iW.1cEpt7@seznam.cz>
 <91563ff7-349b-4815-bcfe-99f8f34b0b16@bell.net>
Message-ID: <34fdf2250fe166372a15d74d28adc8d2@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-05-08 11:23, John David Anglin wrote:
> On 2024-05-08 4:54 a.m., Vidra.Jonas@seznam.cz wrote:
>> ---------- Original e-mail ----------
>> From: John David Anglin
>> To: linux-parisc@vger.kernel.org
>> CC: Helge Deller
>> Date: 5. 5. 2024 19:07:17
>> Subject: [PATCH] parisc: Try to fix random segmentation faults in package 
>> builds
>> 
>>> The majority of random segmentation faults that I have looked at
>>> appear to be memory corruption in memory allocated using mmap and
>>> malloc. This got me thinking that there might be issues with the
>>> parisc implementation of flush_anon_page.
>>> 
>>> [...]
>>> 
>>> Lightly tested on rp3440 and c8000.
>> Hello,
>> 
>> thank you very much for working on the issue and for the patch! I tested
>> it on my C8000 with the 6.8.9 kernel with Gentoo distribution patches.
> Thanks for testing.  Trying to fix these faults is largely guess work.
> 
> In my opinion, the 6.1.x branch is the most stable branch on parisc.  6.6.x 
> and later
> branches have folio changes and haven't had very much testing in build 
> environments.
> I did run 6.8.7 and 6.8.8 on rp3440 for some time but I have gone back to a 
> slightly
> modified 6.1.90.
>> 
>> My machine is affected heavily by the segfaults – with some kernel
>> configurations, I get several per hour when compiling Gentoo packages
> That's more than normal although number seems to depend on package.
> At this rate, you wouldn't be able to build gcc.
>> on all four cores. This patch doesn't fix them, though. On the patched
> Okay.  There are likely multiple problems.  The problem I was trying to 
> address is null
> objects in the hash tables used by ld and as.  The symptom is usually a null 
> pointer
> dereference after pointer has been loaded from null object.  These occur in 
> multiple
> places in libbfd during hash table traversal.  Typically, a couple would 
> occur in a gcc
> testsuite run.  _objalloc_alloc uses malloc.  One can see the faults on the 
> console and
> in the gcc testsuite log.
> 
> How these null objects are generated is not known.  It must be a kernel 
> issue because
> they don't occur with qemu.  I think the frequency of these faults is 
> reduced with the
> patch.  I suspect the objects are zeroed after they are initialized.  In 
> some cases, ld can
> successfully link by ignoring null objects.
> 
> The next time I see a fault caused by a null object, I think it would be 
> useful to see if
> we have a full null page.  This might indicate a swap problem.
> 
> random faults also occur during gcc compilations.  gcc uses mmap to allocate 
> memory.
> 
>> kernel, it happened after ~8h of uptime during installation of the
>> perl-core/Test-Simple package. I got no error output from the running
>> program, but an HPMC was logged to the serial console:
>> 
>> [30007.186309] mm/pgtable-generic.c:54: bad pmd 539b0030.
>> <Cpu3> 78000c6203e00000  a0e008c01100b009  CC_PAT_ENCODED_FIELD_WARNING
>> <Cpu0> e800009800e00000  0000000041093be4  CC_ERR_CHECK_HPMC
>> <Cpu1> e800009801e00000  00000000404ce130  CC_ERR_CHECK_HPMC
>> <Cpu3> 76000c6803e00000  0000000000000520  CC_PAT_DATA_FIELD_WARNING
>> <Cpu0> 37000f7300e00000  84000[30007.188321] Backtrace:
>> [30007.188321]  [<00000000404eef9c>] pte_offset_map_nolock+0xe8/0x150
>> [30007.188321]  [<00000000404d6784>] __handle_mm_fault+0x138/0x17e8
>> [30007.188321]  [<00000000404d8004>] handle_mm_fault+0x1d0/0x3b0
>> [30007.188321]  [<00000000401e4c98>] do_page_fault+0x1e4/0x8a0
>> [30007.188321]  [<00000000401e95c0>] handle_interruption+0x330/0xe60
>> [30007.188321]  [<0000000040295b44>] schedule_tail+0x78/0xe8
>> [30007.188321]  [<00000000401e0f6c>] finish_child_return+0x0/0x58
>> 
>> A longer excerpt of the logs is attached. The error happened at boot
>> time 30007, the preceding unaligned accesses seem to be unrelated.
> I doubt this HPMC is related to the patch.  In the above, the pmd table 
> appears to have
> become corrupted.
>> 
>> The patch didn't apply cleanly, but all hunks succeeded with some
>> offsets and fuzz. This may also be a part of it – I didn't check the
>> code for merge conflicts manually.
> Sorry, the patch was generated against 6.1.90.  This is likely the cause of 
> the offsets
> and fuzz.
>> 
>> If you want me to provide you with more logs (such as the HPMC dumps)
>> or run some experiments, let me know.
>> 
>> 
>> Some speculation about the cause of the errors follows:
>> 
>> I don't think it's a hardware error, as HP-UX 11i v1 works flawlessly on
>> the same machine. The errors seem to be more frequent with a heavy IO
>> load, so it might be system-bus or PCI-bus-related. Using X11 causes
>> lockups rather quickly, but that could be caused by unrelated errors in
>> the graphics subsystem and/or the Radeon drivers.
> I am not using X11 on my c8000.  I have frame buffer support on. Radeon 
> acceleration
> is broken on parisc.
> 
> Maybe there are more problems with debian kernels because of its use of X11.
>> 
>> Limiting the machine to a single socket (2 cores) by disabling the other
>> socket in firmware, or even booting on a single core using a maxcpus=1
>> kernel cmdline option, decreases the error frequency, but doesn't
>> prevent them completely, at least on an (unpatched) 6.1 kernel. So it's
>> probably not an SMP bug. If it's related to cache coherency, it's
>> coherency between the CPUs and bus IO.
>> 
>> The errors typically manifest as a null page access to a very low
>> address, so probably a null pointer dereference. I think the kernel
>> accidentally maps a zeroed page in place of one that the program was
>> using previously, making it load (and subsequently dereference) a null
>> pointer instead of a valid one. There are two problems with this theory,
>> though:
>> 1. It would mean the program could also load zeroed /data/ instead of a
>> zeroed /pointer/, causing data corruption. I never conclusively observed
>> this, although I am getting GCC ICEs from time to time, which could
>> be explained by data corruption.
> GCC catches page faults and no core dump is generated when it ICEs. So, it's 
> harder
> to debug memory issues in gcc.
> 
> I have observed zeroed data multiple times in ld faults.
>> 2. The segfault is sometimes preceded by an unaligned access, which I
>> believe is also caused by a corrupted machine state rather than by a
>> coding error in the program – sometimes a bunch of unaligned accesses
>> show up in the logs just prior to a segfault / lockup, even from
>> unrelated programs such as random bash processes. Sometimes the machine
>> keeps working afterwards (although I typically reboot it immediately
>> to limit the consequences of potential kernel data structure damage),
>> sometimes it HPMCs or LPMCs. This is difficult to explain by just a wild
>> zeroed page appearance. But this typically happens when running X11, so
>> again, it might be caused by another bug, such as the GPU randomly
>> writing to memory via misconfigured DMA.
> There was a bug in the unaligned handler for double word instructions (ldd) 
> that was
> recently fixed.  ldd/std are not used in userspace, so this problem didn't 
> affect it.
> 
> Kernel unaligned faults are not logged, so problems could occur internal to 
> the kernel
> and not be noticed till disaster.  Still, it seems unlikely that an 
> unaligned fault would
> corrupt more than a single word.
> 
> We have observed that the faults appear SMP and memory size related.  A 
> rp4440 with
> 6 CPUs and 4 GB RAM faulted a lot.  It's mostly a PA8800/PA8900 issue.
> 
> It's months since I had a HPMC or LPMC on rp3440 and c8000.  Stalls still 
> happen but they
> are rare.
> 
> Dave

Hi, I also tested this patch on an rp3440 with PA8900.  Unfortunately it 
seems to have exacerbated an existing issue which takes the whole machine 
down.  Occasionally I would get a message:

[ 7497.061892] Kernel panic - not syncing: Kernel Fault

with no accompanying stack trace and then the BMC would restart the whole 
machine automatically.  These were infrequent enough that the segfaults were 
the bigger problem, but after applying this patch on top of 6.8, this changed 
the dynamic.  It seems to occur during builds with varying I/O loads.  For 
example, I was able to build gcc fine, with no segfaults, but I was unable to 
build perl, a much smaller build, without crashing the machine.  I did not 
observe any segfaults over the day or 2 I ran this patch, but that's not an 
unheard-of stretch of time even without it, and I am being forced to revert 
because of the panics.

