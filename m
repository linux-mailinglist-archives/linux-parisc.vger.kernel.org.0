Return-Path: <linux-parisc+bounces-1371-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C47628C0906
	for <lists+linux-parisc@lfdr.de>; Thu,  9 May 2024 03:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B8E2283620
	for <lists+linux-parisc@lfdr.de>; Thu,  9 May 2024 01:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DBF3F9FC;
	Thu,  9 May 2024 01:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="Y10Cpqas"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo002.bell.net (mta-tor-005.bell.net [209.71.212.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F210A2BB12
	for <linux-parisc@vger.kernel.org>; Thu,  9 May 2024 01:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715217722; cv=none; b=qbK95G6x5++Vlb49HWEBBXNJu/2GZ8ty4pYg/lvcckBy/kZLJC5h81bv9WiffJ/QuGf7NVt3uaj5irKJ9t5PbFOvnMtSSXp1X58QSb5mX8glCr7op3oqMC0d0T/XLgoNAi/Nbu1tvP2mG7yfkQBJWKYSqbcTYmSaxEES7PAsaP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715217722; c=relaxed/simple;
	bh=3OSQGFpvCyHj/ATxXe2Q8ExxDuhOFZyeART4bmrdYi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRejXE6JBntJM7z6Jre+tpvhBdS1zOIDm+KU/ot6D9FFWvYGRIwiS3xxz2P/m6uF4i0t63sVxBQ2INPgo6N+FQEGaYNoL5vk9Pms2Z61PapN8Wlgmk1baHvmPhjZbJZvptafIT/necIo9jM8XX7IUUDdNZo385pBjAPvaVF5Q6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=Y10Cpqas; arc=none smtp.client-ip=209.71.212.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1715217720; 
        bh=pOoVCQeah77nokRL2yGAj4BBOUT+P1ehRv4yB8xbZeA=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=Y10CpqascqW64w6nTEuDVOn1ybAWjWRKq6v/7EnuhipYmqG3sTMLrQuelaVrvDqsG+jRS8aANKTbT/R6kPzzfFM7lzMUZfnC6shnvLsE4qGDpqTuGpw6IHd2TIl/RzpqRlOa+o9e5TC7VXmiqprW6owRcHpJ09OrX4X+Im4kT8nPjq8cwkm9eb8aukxpBOIbjKA8XNPtdkjt3FS99Ra0lhMO4CrBesBvwuqkpRgmLHj9+HO2ZOvwB55QktDd3AkAYXrWdo1rjVLPnhq75ouTIhmx+RebEnrkMBp8619JAPdE/7Rn8fjvzUnZVoiG7HkH0NVnH2JtvkZ3lSn1z9RZLw==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 663BACFB000C0100
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvledrvdefuddggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepjeelffffjeehgffgueehleegfeegueeigedtkeffgeduueetffegffejudekgfeunecukfhppedugedvrdduvdeirddukeekrddvhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddvrdeglegnpdhinhgvthepudegvddruddviedrudekkedrvdehuddpmhgrihhlfhhrohhmpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpnhgspghrtghpthhtohepiedprhgtphhtthhopeggihgurhgrrdflohhnrghssehsvgiinhgrmhdrtgiipdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggrvhgvsehprghrihhstgdqlhhinhhugidrohhrghdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhrtghpthhtoheplhhinhhugidqphgrrhhishgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthhorhhopghm
	rghilhhinhhglhhishhtpghkvghrnhgvlhesmhgrthhorhhordhtkh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.188.251) by cmx-torrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 663BACFB000C0100; Wed, 8 May 2024 21:21:02 -0400
Message-ID: <0cc25dc3-f595-411d-a1c6-7434db94e41b@bell.net>
Date: Wed, 8 May 2024 21:21:03 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: Try to fix random segmentation faults in package
 builds
To: matoro <matoro_mailinglist_kernel@matoro.tk>
Cc: Vidra.Jonas@seznam.cz, linux-parisc@vger.kernel.org,
 John David Anglin <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>
References: <Zje6ywzNAltbG3R2@mx3210.localdomain>
 <C4u.NueN.39ikIzqu}iW.1cEpt7@seznam.cz>
 <91563ff7-349b-4815-bcfe-99f8f34b0b16@bell.net>
 <34fdf2250fe166372a15d74d28adc8d2@matoro.tk>
 <e88cebf4-bec6-4247-93ae-39eff59cfc8e@bell.net>
 <95040beaf3cad58a948c7737f96e7110@matoro.tk>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <95040beaf3cad58a948c7737f96e7110@matoro.tk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-05-08 7:51 p.m., matoro wrote:
> On 2024-05-08 16:52, John David Anglin wrote:
>> On 2024-05-08 3:18 p.m., matoro wrote:
>>> On 2024-05-08 11:23, John David Anglin wrote:
>>>> On 2024-05-08 4:54 a.m., Vidra.Jonas@seznam.cz wrote:
>>>>> ---------- Original e-mail ----------
>>>>> From: John David Anglin
>>>>> To: linux-parisc@vger.kernel.org
>>>>> CC: Helge Deller
>>>>> Date: 5. 5. 2024 19:07:17
>>>>> Subject: [PATCH] parisc: Try to fix random segmentation faults in package builds
>>>>>
>>>>>> The majority of random segmentation faults that I have looked at
>>>>>> appear to be memory corruption in memory allocated using mmap and
>>>>>> malloc. This got me thinking that there might be issues with the
>>>>>> parisc implementation of flush_anon_page.
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>> Lightly tested on rp3440 and c8000.
>>>>> Hello,
>>>>>
>>>>> thank you very much for working on the issue and for the patch! I tested
>>>>> it on my C8000 with the 6.8.9 kernel with Gentoo distribution patches.
>>>> Thanks for testing.  Trying to fix these faults is largely guess work.
>>>>
>>>> In my opinion, the 6.1.x branch is the most stable branch on parisc.  6.6.x and later
>>>> branches have folio changes and haven't had very much testing in build environments.
>>>> I did run 6.8.7 and 6.8.8 on rp3440 for some time but I have gone back to a slightly
>>>> modified 6.1.90.
>>>>>
>>>>> My machine is affected heavily by the segfaults – with some kernel
>>>>> configurations, I get several per hour when compiling Gentoo packages
>>>> That's more than normal although number seems to depend on package.
>>>> At this rate, you wouldn't be able to build gcc.
>>>>> on all four cores. This patch doesn't fix them, though. On the patched
>>>> Okay.  There are likely multiple problems.  The problem I was trying to address is null
>>>> objects in the hash tables used by ld and as.  The symptom is usually a null pointer
>>>> dereference after pointer has been loaded from null object. These occur in multiple
>>>> places in libbfd during hash table traversal.  Typically, a couple would occur in a gcc
>>>> testsuite run.  _objalloc_alloc uses malloc.  One can see the faults on the console and
>>>> in the gcc testsuite log.
>>>>
>>>> How these null objects are generated is not known.  It must be a kernel issue because
>>>> they don't occur with qemu.  I think the frequency of these faults is reduced with the
>>>> patch.  I suspect the objects are zeroed after they are initialized.  In some cases, ld can
>>>> successfully link by ignoring null objects.
>>>>
>>>> The next time I see a fault caused by a null object, I think it would be useful to see if
>>>> we have a full null page.  This might indicate a swap problem.
>>>>
>>>> random faults also occur during gcc compilations.  gcc uses mmap to allocate memory.
>>>>
>>>>> kernel, it happened after ~8h of uptime during installation of the
>>>>> perl-core/Test-Simple package. I got no error output from the running
>>>>> program, but an HPMC was logged to the serial console:
>>>>>
>>>>> [30007.186309] mm/pgtable-generic.c:54: bad pmd 539b0030.
>>>>> <Cpu3> 78000c6203e00000  a0e008c01100b009 CC_PAT_ENCODED_FIELD_WARNING
>>>>> <Cpu0> e800009800e00000  0000000041093be4 CC_ERR_CHECK_HPMC
>>>>> <Cpu1> e800009801e00000  00000000404ce130 CC_ERR_CHECK_HPMC
>>>>> <Cpu3> 76000c6803e00000  0000000000000520 CC_PAT_DATA_FIELD_WARNING
>>>>> <Cpu0> 37000f7300e00000  84000[30007.188321] Backtrace:
>>>>> [30007.188321]  [<00000000404eef9c>] pte_offset_map_nolock+0xe8/0x150
>>>>> [30007.188321]  [<00000000404d6784>] __handle_mm_fault+0x138/0x17e8
>>>>> [30007.188321]  [<00000000404d8004>] handle_mm_fault+0x1d0/0x3b0
>>>>> [30007.188321]  [<00000000401e4c98>] do_page_fault+0x1e4/0x8a0
>>>>> [30007.188321]  [<00000000401e95c0>] handle_interruption+0x330/0xe60
>>>>> [30007.188321]  [<0000000040295b44>] schedule_tail+0x78/0xe8
>>>>> [30007.188321]  [<00000000401e0f6c>] finish_child_return+0x0/0x58
>>>>>
>>>>> A longer excerpt of the logs is attached. The error happened at boot
>>>>> time 30007, the preceding unaligned accesses seem to be unrelated.
>>>> I doubt this HPMC is related to the patch.  In the above, the pmd table appears to have
>>>> become corrupted.
>>>>>
>>>>> The patch didn't apply cleanly, but all hunks succeeded with some
>>>>> offsets and fuzz. This may also be a part of it – I didn't check the
>>>>> code for merge conflicts manually.
>>>> Sorry, the patch was generated against 6.1.90.  This is likely the cause of the offsets
>>>> and fuzz.
>>>>>
>>>>> If you want me to provide you with more logs (such as the HPMC dumps)
>>>>> or run some experiments, let me know.
>>>>>
>>>>>
>>>>> Some speculation about the cause of the errors follows:
>>>>>
>>>>> I don't think it's a hardware error, as HP-UX 11i v1 works flawlessly on
>>>>> the same machine. The errors seem to be more frequent with a heavy IO
>>>>> load, so it might be system-bus or PCI-bus-related. Using X11 causes
>>>>> lockups rather quickly, but that could be caused by unrelated errors in
>>>>> the graphics subsystem and/or the Radeon drivers.
>>>> I am not using X11 on my c8000.  I have frame buffer support on. Radeon acceleration
>>>> is broken on parisc.
>>>>
>>>> Maybe there are more problems with debian kernels because of its use of X11.
>>>>>
>>>>> Limiting the machine to a single socket (2 cores) by disabling the other
>>>>> socket in firmware, or even booting on a single core using a maxcpus=1
>>>>> kernel cmdline option, decreases the error frequency, but doesn't
>>>>> prevent them completely, at least on an (unpatched) 6.1 kernel. So it's
>>>>> probably not an SMP bug. If it's related to cache coherency, it's
>>>>> coherency between the CPUs and bus IO.
>>>>>
>>>>> The errors typically manifest as a null page access to a very low
>>>>> address, so probably a null pointer dereference. I think the kernel
>>>>> accidentally maps a zeroed page in place of one that the program was
>>>>> using previously, making it load (and subsequently dereference) a null
>>>>> pointer instead of a valid one. There are two problems with this theory,
>>>>> though:
>>>>> 1. It would mean the program could also load zeroed /data/ instead of a
>>>>> zeroed /pointer/, causing data corruption. I never conclusively observed
>>>>> this, although I am getting GCC ICEs from time to time, which could
>>>>> be explained by data corruption.
>>>> GCC catches page faults and no core dump is generated when it ICEs. So, it's harder
>>>> to debug memory issues in gcc.
>>>>
>>>> I have observed zeroed data multiple times in ld faults.
>>>>> 2. The segfault is sometimes preceded by an unaligned access, which I
>>>>> believe is also caused by a corrupted machine state rather than by a
>>>>> coding error in the program – sometimes a bunch of unaligned accesses
>>>>> show up in the logs just prior to a segfault / lockup, even from
>>>>> unrelated programs such as random bash processes. Sometimes the machine
>>>>> keeps working afterwards (although I typically reboot it immediately
>>>>> to limit the consequences of potential kernel data structure damage),
>>>>> sometimes it HPMCs or LPMCs. This is difficult to explain by just a wild
>>>>> zeroed page appearance. But this typically happens when running X11, so
>>>>> again, it might be caused by another bug, such as the GPU randomly
>>>>> writing to memory via misconfigured DMA.
>>>> There was a bug in the unaligned handler for double word instructions (ldd) that was
>>>> recently fixed.  ldd/std are not used in userspace, so this problem didn't affect it.
>>>>
>>>> Kernel unaligned faults are not logged, so problems could occur internal to the kernel
>>>> and not be noticed till disaster.  Still, it seems unlikely that an unaligned fault would
>>>> corrupt more than a single word.
>>>>
>>>> We have observed that the faults appear SMP and memory size related.  A rp4440 with
>>>> 6 CPUs and 4 GB RAM faulted a lot.  It's mostly a PA8800/PA8900 issue.
>>>>
>>>> It's months since I had a HPMC or LPMC on rp3440 and c8000. Stalls still happen but they
>>>> are rare.
>>>>
>>>> Dave
>>>
>>> Hi, I also tested this patch on an rp3440 with PA8900. Unfortunately it seems to have exacerbated an existing issue which takes the whole 
>>> machine down.  Occasionally I would get a message:
>>>
>>> [ 7497.061892] Kernel panic - not syncing: Kernel Fault
>>>
>>> with no accompanying stack trace and then the BMC would restart the whole machine automatically.  These were infrequent enough that the 
>>> segfaults were the bigger problem, but after applying this patch on top of 6.8, this changed the dynamic.  It seems to occur during builds 
>>> with varying I/O loads.  For example, I was able to build gcc fine, with no segfaults, but I was unable to build perl, a much smaller build, 
>>> without crashing the machine.  I did not observe any segfaults over the day or 2 I ran this patch, but that's not an unheard-of stretch of 
>>> time even without it, and I am being forced to revert because of the panics.
>> Looks like there is a problem with 6.8.  I'll do some testing with it.
>>
>> I haven't had any panics with 6.1 on rp3440 or c8000.
>>
>> Trying a debian perl-5.38.2 build.
>>
>> Dave
>
> Oops, seems after reverting this patch I ran into the exact same problem.
It was hard to understand how the patch could cause a kernel crash. The only significant change
is adding the purge_kernel_dcache_page_addr call in flush_anon_page.  It uses the pdc instruction
to invalidate the kernel mapping.  Assuming pdc is actually implemented as described in the architecture
book, it doesn't write back to memory at priority 0.  It just invalidates the addressed cache line.

My 6.8.9 build is still going after 2 hours and 42 minutes...

>
> First the failing package is actually perl XS-Parse-Keyword, not the actual perl interpreter.  Didn't have serial console hooked up to check 
> it exactly.  And secondly it did the exact same thing even without the patch, on kernel 6.8.9, so that's definitely not the problem.  I'm 
> going to try checking some older kernels to see if I can identify any that aren't susceptible to this crash. Luckily this package build seems 
> to be pretty reliably triggering it.
That's a good find.

libxs-parse-keyword-perl just built a couple of hours ago on sap rp4440.  At last email, it was running 6.1.

Dave

-- 
John David Anglin  dave.anglin@bell.net


