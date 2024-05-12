Return-Path: <linux-parisc+bounces-1401-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EBE8C353F
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2024 08:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 088BF1C20929
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2024 06:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8144EE56C;
	Sun, 12 May 2024 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="geO+6SV9"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mxe.seznam.cz (mxe.seznam.cz [77.75.78.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4604DDD7
	for <linux-parisc@vger.kernel.org>; Sun, 12 May 2024 06:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715497084; cv=none; b=IwuTVaDrm5YgKdA6uHfODDjygD5o2OAXe9HcKjB/rew70Ijdmn8+iFcnq5qwiD6psYfGUn3ST5tF5CgclA/LvZzR4sxzpDE9w2GHx3798aP+aq0r7ySPH6YxP7ry54xFfBjDmpnosmX6d1FdvxqvtMI53BFRyYrlDOdQylnfEb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715497084; c=relaxed/simple;
	bh=cetTH0r6PvkA242Au5nvoR7ubfEex0cSiMwlJshmJhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:References:In-Reply-To:
	 Mime-Version:Content-Type; b=m5nOxJIMwkDUHiuLDcBh/FAvSc/mncnHdtNedKSZkkt5xlwwsVz3zyuGJBofbG8yojFKOYQJ4Hu2FJmmVpZgGVjQUbkYEuRNBdRkAC8PZgIQzfY13hoUIljqpBBG58zVOU7G0aJmD3o14JAwzf9CLVBcWPVgdFgRSq/WqUeFZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b=geO+6SV9; arc=none smtp.client-ip=77.75.78.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Received: from email.seznam.cz
	by smtpc-mxe-584bcb9555-5kz2b
	(smtpc-mxe-584bcb9555-5kz2b [2a02:598:64:8a00::1000:52c])
	id 1a5decaed593b3121a029967;
	Sun, 12 May 2024 08:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
	s=szn20221014; t=1715497070;
	bh=fsSsPOilrIBcEkQ9k3AYwf4YWX6fpzDqMTw2sJSpxqI=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:References:
	 In-Reply-To:Mime-Version:X-Mailer:Content-Type:
	 Content-Transfer-Encoding;
	b=geO+6SV9cpHBfTuKsiF2PUkH6TCMK/zzLdAxIA4EuoKnS2bc7b6gok0zYsOneDqVk
	 +anl5iwIPyWORt0Pxzg/l30DVlKapTaWzP1LpgyqBlHmWzz2rhKC5TST//O4MoX5tK
	 rOdpJbrHH2JnRhCdd3DWE859gQb4NnfRuwchXL63YeiMgBpFQoOb5Vfi+K7JE0VpLo
	 zAWs++WoEDpWodIbTa+bhMtwNpalgHLGkE/hG1n5c68xUV+4ep//HxdI8Rr6VqHyrG
	 HTjlr4mK0gLBJtjC1OwzBHBAjee+8w2eg0W8CF+3RCTo1GiMLVIkiwgaLvXSwfNgn8
	 PuHrwmZmkhPdQ==
Received: from snat-29.cgn.sat-an.net (snat-29.cgn.sat-an.net [176.222.226.29])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Sun, 12 May 2024 08:57:48 +0200 (CEST)
From: <Vidra.Jonas@seznam.cz>
To: <linux-parisc@vger.kernel.org>
Cc: "John David Anglin" <dave@parisc-linux.org>,
	"Helge Deller" <deller@gmx.de>
Subject: =?utf-8?q?Re=3A_=5BPATCH=5D_parisc=3A_Try_to_fix_random_segmentat?=
	=?utf-8?q?ion_faults_in_package_builds?=
Date: Sun, 12 May 2024 08:57:48 +0200 (CEST)
Message-Id: <E1b.NdM}.1zk9vH6PTNN.1cG6Xi@seznam.cz>
References: <Zje6ywzNAltbG3R2@mx3210.localdomain>
	<C4u.NueN.39ikIzqu}iW.1cEpt7@seznam.cz>
	<91563ff7-349b-4815-bcfe-99f8f34b0b16@bell.net>
In-Reply-To: <91563ff7-349b-4815-bcfe-99f8f34b0b16@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (szn-mime-2.1.37)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

---------- Original e-mail ----------
From: John David Anglin
To: linux-parisc@vger.kernel.org
CC: John David Anglin, Helge Deller
Date: 8. 5. 2024 17:23:27
Subject: Re: [PATCH] parisc: Try to fix random segmentation faults in pack=
age builds

> In my opinion, the 6.1.x branch is the most stable branch on parisc.  6.=
6.x and later
> branches have folio changes and haven't had very much testing in build e=
nvironments.
> I did run 6.8.7 and 6.8.8 on rp3440 for some time but I have gone back t=
o a slightly
> modified 6.1.90.

OK, thanks, I'll roll back as well.


>> My machine is affected heavily by the segfaults =E2=80=93 with some ker=
nel
>> configurations, I get several per hour when compiling Gentoo packages=

> That's more than normal although number seems to depend on package.
> At this rate, you wouldn't be able to build gcc.

Well, yeah. :-) The crashes are rarer when using a kernel with many
debugging options turned on, which suggests that it's some kind of a
race condition. Unfortunately, that also means it doesn't manifest when
the program is run under strace or gdb. I build large packages with -j1,=

as the crashes are rarer with a smaller load.

The worst offender is the `moc` program used in builds of Qt packages,
it crashes a lot.


>> on all four cores. This patch doesn't fix them, though. On the patched=

> Okay.  There are likely multiple problems.  The problem I was trying to =
address is null
> objects in the hash tables used by ld and as.  The symptom is usually a =
null pointer
> dereference after pointer has been loaded from null object.  These occur=
 in multiple
> places in libbfd during hash table traversal.  Typically, a couple would=
 occur in a gcc
> testsuite run.  _objalloc_alloc uses malloc.  One can see the faults on =
the console and
> in the gcc testsuite log.
>
> How these null objects are generated is not known.  It must be a kernel =
issue because
> they don't occur with qemu.  I think the frequency of these faults is re=
duced with the
> patch.  I suspect the objects are zeroed after they are initialized.  In=
 some cases, ld can
> successfully link by ignoring null objects.
>
> The next time I see a fault caused by a null object, I think it would be=
 useful to see if
> we have a full null page.  This might indicate a swap problem.

I did see a full zeroed page at least once, but it's hard to debug.
Also, I'm not sure whether core dumps are reliable in this case =E2=80=93 =
since
this is a kernel bug, the view of memory stored in a core dump might be
different from what the program saw at the time of the crash.


>> kernel, it happened after ~8h of uptime during installation of the
>> perl-core/Test-Simple package. I got no error output from the running=

>> program, but an HPMC was logged to the serial console:
>>
>> [30007.186309] mm/pgtable-generic.c:54: bad pmd 539b0030.
>> <Cpu3> 78000c6203e00000 a0e008c01100b009 CC_PAT_ENCODED_FIELD_WARNING=

>> <Cpu0> e800009800e00000 0000000041093be4 CC_ERR_CHECK_HPMC
>> <Cpu1> e800009801e00000 00000000404ce130 CC_ERR_CHECK_HPMC
>> <Cpu3> 76000c6803e00000 0000000000000520 CC_PAT_DATA_FIELD_WARNING
>> <Cpu0> 37000f7300e00000 84000[30007.188321] Backtrace:
>> [30007.188321] [<00000000404eef9c>] pte_offset_map_nolock+0xe8/0x150
>> [30007.188321] [<00000000404d6784>] __handle_mm_fault+0x138/0x17e8
>> [30007.188321] [<00000000404d8004>] handle_mm_fault+0x1d0/0x3b0
>> [30007.188321] [<00000000401e4c98>] do_page_fault+0x1e4/0x8a0
>> [30007.188321] [<00000000401e95c0>] handle_interruption+0x330/0xe60
>> [30007.188321] [<0000000040295b44>] schedule_tail+0x78/0xe8
>> [30007.188321] [<00000000401e0f6c>] finish_child_return+0x0/0x58
>>
>> A longer excerpt of the logs is attached. The error happened at boot
>> time 30007, the preceding unaligned accesses seem to be unrelated.
> I doubt this HPMC is related to the patch.  In the above, the pmd table =
appears to have
> become corrupted.

I see all kinds of corruption in both kernel space and user space, and I=

assumed they all share the same underlying mechanism, but you're right
that there might be multiple unrelated causes.


>> I don't think it's a hardware error, as HP-UX 11i v1 works flawlessly o=
n
>> the same machine. The errors seem to be more frequent with a heavy IO=

>> load, so it might be system-bus or PCI-bus-related. Using X11 causes
>> lockups rather quickly, but that could be caused by unrelated errors in=

>> the graphics subsystem and/or the Radeon drivers.
> I am not using X11 on my c8000.  I have frame buffer support on. Radeon =
acceleration
> is broken on parisc.

Yeah, accel doesn't work, but unaccelerated graphics works fine. Except
for the crashes, that is.


>> 2. The segfault is sometimes preceded by an unaligned access, which I=

>> believe is also caused by a corrupted machine state rather than by a
>> coding error in the program =E2=80=93 sometimes a bunch of unaligned ac=
cesses
>> show up in the logs just prior to a segfault / lockup, even from
>> unrelated programs such as random bash processes. Sometimes the machine=

>> keeps working afterwards (although I typically reboot it immediately
>> to limit the consequences of potential kernel data structure damage),=

>> sometimes it HPMCs or LPMCs. This is difficult to explain by just a wil=
d
>> zeroed page appearance. But this typically happens when running X11, so=

>> again, it might be caused by another bug, such as the GPU randomly
>> writing to memory via misconfigured DMA.
> There was a bug in the unaligned handler for double word instructions (l=
dd) that was
> recently fixed.  ldd/std are not used in userspace, so this problem didn=
't affect it.

Yes, but this fixes the case when a program has a coding bug, performs
an unaligned access and the kernel has to emulate the load. What I'm
seeing is that sometimes, several programs which usually run just fine
with no unaligned accesses all perform an unaligned access at once,
which seems very weird. I sometimes (but not always) see this on X11
startup.


> We have observed that the faults appear SMP and memory size related.  A =
rp4440 with
> 6 CPUs and 4 GB RAM faulted a lot.  It's mostly a PA8800/PA8900 issue.=

>
> It's months since I had a HPMC or LPMC on rp3440 and c8000.  Stalls stil=
l happen but they
> are rare.

I have 16 GiB of memory and 4 =C3=97 PA8900 @ 1GHz. But I've seen a lot of=

them even with 2 GiB.

