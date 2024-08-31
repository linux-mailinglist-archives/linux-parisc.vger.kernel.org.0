Return-Path: <linux-parisc+bounces-2187-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA796706C
	for <lists+linux-parisc@lfdr.de>; Sat, 31 Aug 2024 11:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C13FD1F23277
	for <lists+linux-parisc@lfdr.de>; Sat, 31 Aug 2024 09:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849F513B797;
	Sat, 31 Aug 2024 09:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXHiVsBr"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1D13AA2D
	for <linux-parisc@vger.kernel.org>; Sat, 31 Aug 2024 09:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725095418; cv=none; b=tWvwhFIS7dvPCRCasLpzG0uFhugsPBsYOD6GmxABWfNczOI/hIgbLqKhgnDVLneXOk0oAnUtlTtuArs2pQX4IhbYs25bFvXYkGlb2BETWA4rSD4+3pXaQac6i9cHwF4+hjvaR+SJLncbFZ53q7LoHR2W5MmeHgjADXPPLQ+gcYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725095418; c=relaxed/simple;
	bh=fNrNHfZdespoeHOkyv0C4r1S4VdYMRbBjtp5KDd56Lk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s95VSqvwhFifK3Z+LmHJAqod66qaOhIM1r36b0qwjK0yIxCbNkgGa9L/zmyKH7hT6N/XLXxDcLjzwulz+F5WWwTfZ+0KR2+aJIYgpvXmSbHlqWZ2EzLZSHBU7Kml2gmKyuGNDh30fsjHVUe8KC2+IHqOWQNNURxr70OjCOuBVuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXHiVsBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A022C4CEC0;
	Sat, 31 Aug 2024 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725095417;
	bh=fNrNHfZdespoeHOkyv0C4r1S4VdYMRbBjtp5KDd56Lk=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=aXHiVsBrODLRYvfC45qtEyUePPLFH9IG5GMnLkyyTDVIwh+eSoM5V7U0GdhKgV9UP
	 zIwCaKMMsDvrhH7kK8sqAKqEJnIXnM8YZT5svk0b3pTf9Fn9CymrTw3Lb2ZKDo21NA
	 SmuWwkBKEEuCsTje4AmoUhf5NNdOEIFHut3LC48qe67vLUyTVrbO3mDjz2fMFQKyLk
	 Jl2pJs8oflqyXbcz4wErnqprzDUE+3QvZXl5tg44XcD+AfWBzfeY3ETsB2sMvgNnS8
	 /F3TQTtGWbPWneIEOXUFoGnr+rNPnpAAqxpvGM0YqZRaiODyI0k1bJIoCrFquCM2YS
	 F5Yt8RmD++YYg==
Date: Sat, 31 Aug 2024 11:10:13 +0200
From: Helge Deller <deller@kernel.org>
To: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
	Linux Parisc <linux-parisc@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	matoro <matoro_mailinglist_kernel@matoro.tk>,
	Sam James <sam@gentoo.org>
Subject: Re: Crash on booth with 6.10
Message-ID: <ZtLd9RUvxaV_SfiX@p100>
References: <096cad5aada514255cd7b0b9dbafc768@matoro.tk>
 <1725041917@msgid.manchmal.in-ulm.de>
 <eeb2389b-7ff9-4ee5-b6c9-73cc716c5a81@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeb2389b-7ff9-4ee5-b6c9-73cc716c5a81@gmx.de>

* Helge Deller <deller@gmx.de>:
> On 8/30/24 20:18, Christoph Biedl wrote:
> > matoro wrote...
> > 
> > > Hi all, just bumped to the newest mainline starting with 6.10.2 and
> > > immediately ran into a crash on boot.  Fully reproducible, reverting back to
> > > last known good (6.9.8) resolves the issue.  Any clue what's going on here?
> > > I can provide full boot logs, start bisecting, etc if needed...
> > 
> > (...)
> > [   12.383562] sd 1:0:5:0: [sda] Attached SCSI disk
> > [   12.397737] Freeing unused kernel image (initmem) memory: 3072K
> > [   12.406839] Backtrace:
> > [   12.409235]  [<1116535c>] kernel_init+0x80/0x1d4
> > [   12.413911]  [<1040201c>] ret_from_kernel_thread+0x1c/0x24
> > [   12.419448]
> > [   12.422487] Kernel Fault: Code=26 (Data memory access rights trap) at addr 113c5f90
> > [   12.430172] CPU: 0 PID: 1 Comm: swapper Not tainted 6.10.7 #1
> > [   12.435958] Hardware name: 9000/785/C3600
> > [   12.439997]
> > [   12.506373] IASQ: 00000000 00000000 IAOQ: 10599508 1059950c
> > [   12.511980]  IIR: 0f941288    ISR: 00000000  IOR: 113c5f90
> > [   12.517495]  CPU:        0   CR30: 12892d00 CR31: 11111111
> > [   12.523016]  ORIG_R28: 55555555
> > [   12.526185]  IAOQ[0]: jump_label_init_ro+0x98/0xe4
> > [   12.531014]  IAOQ[1]: jump_label_init_ro+0x9c/0xe4
> > [   12.535872]  RP(r2): jump_label_init_ro+0x3c/0xe4
> > [   12.540610] Backtrace:
> > [   12.543000]  [<1116535c>] kernel_init+0x80/0x1d4
> > [   12.547654]  [<1040201c>] ret_from_kernel_thread+0x1c/0x24
> > [   12.553319]
> > [   12.557345] Kernel panic - not syncing: Kernel Fault
> > 
> > .config is attached, I can dig more in the next days.
> 
> I can reproduce.
> 
> The crash happens, because in kernel/jump_label.c: jump_label_init_ro(),
> this static key is accessed but gives a segfault, because this area is already read-only:
> mm/usercopy.c:static DEFINE_STATIC_KEY_FALSE_RO(bypass_usercopy_checks);
> 
> This is the only static key in this parisc kernel which is marked with __ro_after_init.
> The area is marked read-only in free_initmem() [in arch/parisc/mm/init.c],
> which happens before mark_readonly().

The same issue can be reproduced with git head (CONFIG_HARDENED_USERCOPY=y and
CONFIG_JUMP_LABEL=y).

Basically on parisc we write-protect the read-only data section too early.
The patch below fixes it for me.

Maturo, Christoph: Can you please test the patch and report back?

Helge


[PATCH] parisc: Delay write-protection until mark_rodata_ro() call

Do not write protect the data section earlier than before mark_rodata_ro() is
called.  This fixes a boot issue on parisc which was triggered by commit
91a1d97ef482 ("jump_label,module: Don't alloc static_key_mod for
__ro_after_init keys"). That commit may modify static keys contents in the
__ro_after_init section at bootup, so this section needs to be writable at
least until mark_rodata_ro() is called.

Fixes: 91a1d97ef482 ("jump_label,module: Don't alloc static_key_mod for __ro_after_init keys")
Reported-by: matoro <matoro_mailinglist_kernel@matoro.tk>
Reported-by: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 34d91cb8b259..6ffc6d99cb27 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -459,7 +459,6 @@ void free_initmem(void)
 	unsigned long kernel_end  = (unsigned long)&_end;
 
 	/* Remap kernel text and data, but do not touch init section yet. */
-	kernel_set_to_readonly = true;
 	map_pages(init_end, __pa(init_end), kernel_end - init_end,
 		  PAGE_KERNEL, 0);
 
@@ -493,11 +492,18 @@ void free_initmem(void)
 #ifdef CONFIG_STRICT_KERNEL_RWX
 void mark_rodata_ro(void)
 {
-	/* rodata memory was already mapped with KERNEL_RO access rights by
-           pagetable_init() and map_pages(). No need to do additional stuff here */
-	unsigned long roai_size = __end_ro_after_init - __start_ro_after_init;
+	unsigned long start = (unsigned long) &__start_rodata;
+	unsigned long end = (unsigned long) &__end_rodata;
+
+	printk(KERN_INFO "Write protecting the kernel read-only data: %luk\n",
+	       (end - start) >> 10);
+
+	kernel_set_to_readonly = true;
+	map_pages(start, __pa(start), end - start, PAGE_KERNEL, 0);
 
-	pr_info("Write protected read-only-after-init data: %luk\n", roai_size >> 10);
+	/* force the kernel to see the new page table entries */
+	flush_cache_all();
+	flush_tlb_all();
 }
 #endif
 

