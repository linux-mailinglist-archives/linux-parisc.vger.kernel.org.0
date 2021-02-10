Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD92D31697B
	for <lists+linux-parisc@lfdr.de>; Wed, 10 Feb 2021 15:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhBJOxG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 10 Feb 2021 09:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbhBJOxC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 Feb 2021 09:53:02 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C076C061574
        for <linux-parisc@vger.kernel.org>; Wed, 10 Feb 2021 06:52:21 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id r21so1967712otk.13
        for <linux-parisc@vger.kernel.org>; Wed, 10 Feb 2021 06:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LFRcONvDIu1PjZRoDFkoJrPTd/9xwCBKQJClE1ABa5E=;
        b=BfNElpOqpABseQC/VSHnyIIZbqNggzch0mwAc7H8XXMr181in2FPkfHASs3hKNa58Q
         yyurlP0zKQSGipLICVTRmeWMlSnpRKfOxGd0SiYj0/I5xPuk9A/zaflrqE87ZHmPr8aw
         2XfnZdogsvGQp0b1g/pfHlFlnBraHujJJV3bv/ydOcNMOgS749LpqE5ZWkpFDZ6ed/Kq
         n/t12mBrGpyiKXBxczSuujpEFBPe6dZ6jrzRIa2stN/ov2brRsGOgLw2REqD/xPBTTh9
         MV3EvSxtuc60fEpyJT9+AvM/2Lh3Rm2xxyq87qPG+zU8QaTP01ZyrE2eRbfYOUTCZsCY
         o4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=LFRcONvDIu1PjZRoDFkoJrPTd/9xwCBKQJClE1ABa5E=;
        b=oFFsPltVB4BzQSAjBGjt7tIE+prLb3A79h4OSLX/FMnMrzlBvtqtbM/JPCTsMSrfQI
         vTU+jn+vEMiyiGjXImhvbcbAr+Zua1LMZW09vUvpGhkZeOcQGBO1KbiZPd1wfoSpQhMQ
         U7YE2WVDVuYiVz44cuccXqrdNqvWQfF1AbnDQrQ0jscsLXWp+S5rKgOLmJoOcrwAu5IU
         fpug/QoKrQBYXIDbOOZWh84z+925rDSuhASk4NL892fpX6NCDPRYWEw/OMVoKLXNOn9B
         IjAC+NYlHhzxq9/A1cXMbYXg8MN/0VUkMdOAaLT0d+fWKfNX2dsOytMBNgE+SKiWRYxN
         WBPg==
X-Gm-Message-State: AOAM531JUm2Yf2s+0wIzaeuSduKGE5wpLPF4utdwjQsk5T5Njyn5s78N
        8aJD5+XJtQ5Taxpqrb/IuqUZuPweoK4=
X-Google-Smtp-Source: ABdhPJwxVohBLVLe7akOM5kRpBpIDWATNy2QErrpQc+oUrFylTGD3uvtYBlKsPlE2f0LOQse1XjpLg==
X-Received: by 2002:a9d:2948:: with SMTP id d66mr2297945otb.94.1612968740751;
        Wed, 10 Feb 2021 06:52:20 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e6sm413578otl.63.2021.02.10.06.52.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 06:52:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 10 Feb 2021 06:52:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Helge Deller <deller@gmx.de>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
Message-ID: <20210210145218.GA50561@roeck-us.net>
References: <2786b971-254a-ae07-ea24-38e57bd29892@bell.net>
 <d4751664-6627-920e-9c44-7f9b7e287431@bell.net>
 <6fb36e0e-62f5-68c7-92ec-c6dd16841813@bell.net>
 <44ee7e09-90e7-0766-f0e4-bde2d3cdc2ec@bell.net>
 <5100eb80-975f-d77d-846a-5aabc25d0f95@bell.net>
 <e023991b-ba2e-f6da-94fb-0988ad70e717@bell.net>
 <9b9c6446-365f-9ca6-b89f-c330fca11952@bell.net>
 <94210da5-5642-82ef-85ae-688e1c07473d@gmx.de>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
 <20210127211851.GA32689@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127211851.GA32689@ls3530.fritz.box>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Jan 27, 2021 at 10:18:51PM +0100, Helge Deller wrote:
> On parisc a spinlock is stored in the next page behind the pgd which
> protects against parallel accesses to the pgd. That's why one additional
> page (PGD_ALLOC_ORDER) is allocated for the pgd.
> 
> Matthew Wilcox suggested that we instead should use a pointer in the
> struct page table for this spinlock and noted, that the comments for the
> PGD_ORDER and PMD_ORDER defines were wrong.
> 
> Both suggestions are addressed in this patch. The pgd spinlock
> (parisc_pgd_lock) is stored in the struct page table. In
> switch_mm_irqs_off() the physical address of this lock is loaded into
> cr28 (tr4) and the pgd into cr25, so that the fault handlers can
> directly access the lock.
> 
> The currently implemened Hybrid L2/L3 page table scheme (where the pmd
> is adjacent to the pgd) is dropped now too.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
> Signed-off-by: Helge Deller <deller@gmx.de>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>

This patch results in:

BUG: spinlock recursion on CPU#0, swapper/0/1
 lock: 0x12226d14, .magic: dead4ead, .owner: swapper/0/1, .owner_cpu: 0
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc7-next-20210209-32bit #1
Hardware name: 9000/778/B160L
Backtrace:
 [<1019f9bc>] show_stack+0x34/0x48
 [<10a65278>] dump_stack+0x94/0x114
 [<10219f4c>] spin_dump+0x8c/0xb8
 [<1021a0b4>] do_raw_spin_lock+0xdc/0x108
 [<10a7367c>] _raw_spin_lock_irqsave+0x30/0x48
 [<102bf41c>] handle_mm_fault+0x5e8/0xdb0
 [<102b813c>] __get_user_pages.part.0+0x1b0/0x3d4
 [<102b8900>] __get_user_pages_remote+0x134/0x34c
 [<102b8b80>] get_user_pages_remote+0x68/0x90
 [<102fccb0>] get_arg_page+0x94/0xd8
 [<102fdd84>] copy_string_kernel+0xc4/0x234
 [<102fe70c>] kernel_execve+0xcc/0x1a4
 [<10a58d94>] run_init_process+0xbc/0xe0
 [<10a70d50>] kernel_init+0x98/0x13c
 [<1019a01c>] ret_from_kernel_thread+0x1c/0x24

when trying to boot parisc/hppa images in qemu. Reverting this patch fixes
the problem.

Bitsect log attached.

Guenter

---
# bad: [a4bfd8d46ac357c12529e4eebb6c89502b03ecc9] Add linux-next specific files for 20210209
# good: [92bf22614b21a2706f4993b278017e437f7785b3] Linux 5.11-rc7
git bisect start 'HEAD' 'v5.11-rc7'
# bad: [a8eb921ba7e8e77d994a1c6c69c8ef08456ecf53] Merge remote-tracking branch 'crypto/master'
git bisect bad a8eb921ba7e8e77d994a1c6c69c8ef08456ecf53
# bad: [b68df186dae8ae890df08059bb068b78252b053a] Merge remote-tracking branch 'hid/for-next'
git bisect bad b68df186dae8ae890df08059bb068b78252b053a
# good: [323c9f6fb99b033883b404ecbc811e7b283a60b3] Merge remote-tracking branch 'sunxi/sunxi/for-next'
git bisect good 323c9f6fb99b033883b404ecbc811e7b283a60b3
# bad: [9d40a7a579a5c51fad0d734a4ed39e39b858fca2] Merge remote-tracking branch 'btrfs/for-next'
git bisect bad 9d40a7a579a5c51fad0d734a4ed39e39b858fca2
# bad: [afe0c3efe88f6c295542fd336d5f604115e9184f] Merge remote-tracking branch 'powerpc/next'
git bisect bad afe0c3efe88f6c295542fd336d5f604115e9184f
# good: [c276186556ed2ce6d30da69ce275234a7df85b09] Merge remote-tracking branch 'mips/mips-next'
git bisect good c276186556ed2ce6d30da69ce275234a7df85b09
# good: [755d664174463791489dddf34c33308b61de68c3] powerpc: DebugException remove args
git bisect good 755d664174463791489dddf34c33308b61de68c3
# good: [26418b36a11f2eaf2556aa8cefe86132907e311f] powerpc/64s/radix: refactor TLB flush type selection
git bisect good 26418b36a11f2eaf2556aa8cefe86132907e311f
# bad: [d7bbb31642d2bd4aa5aad3595061a5e96c32d91d] Merge remote-tracking branch 'parisc-hd/for-next'
git bisect bad d7bbb31642d2bd4aa5aad3595061a5e96c32d91d
# good: [2261352157a932717ec08b9dd18d1bfbb7c37c52] Merge remote-tracking branch 'openrisc/or1k-5.11-fixes' into or1k-5.12-updates
git bisect good 2261352157a932717ec08b9dd18d1bfbb7c37c52
# good: [3c92b9eed3ae088ade3688fb356a90926c1c8ee4] Merge remote-tracking branch 'openrisc/for-next'
git bisect good 3c92b9eed3ae088ade3688fb356a90926c1c8ee4
# good: [accb4993d2ee6b644a3d01851cf2fb2c1e0813a6] parisc: Fix IVT checksum calculation wrt HPMC
git bisect good accb4993d2ee6b644a3d01851cf2fb2c1e0813a6
# bad: [4add5f175b1e4e71c06493f9a2c52490d2ea4365] parisc: Optimize per-pagetable spinlocks
git bisect bad 4add5f175b1e4e71c06493f9a2c52490d2ea4365
# good: [0d2d3836dd0a597e514e6231fbf2ae3944f5d38c] parisc: Bump 64-bit IRQ stack size to 64 KB
git bisect good 0d2d3836dd0a597e514e6231fbf2ae3944f5d38c
# first bad commit: [4add5f175b1e4e71c06493f9a2c52490d2ea4365] parisc: Optimize per-pagetable spinlocks
