Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E29318304
	for <lists+linux-parisc@lfdr.de>; Thu, 11 Feb 2021 02:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhBKBVc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 10 Feb 2021 20:21:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhBKBVa (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 Feb 2021 20:21:30 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789ABC061574
        for <linux-parisc@vger.kernel.org>; Wed, 10 Feb 2021 17:20:50 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id e5so3721477otb.11
        for <linux-parisc@vger.kernel.org>; Wed, 10 Feb 2021 17:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DD37qRnf4DwdYGKUaX/gk8Tf6ZAUloQD5i3A7juKncQ=;
        b=BZadq0qbQKSruBSo82Mgr70yUceh4JJly1Z0LSbrEGWLoEEb19WedMc6KecOi4iWNl
         sY6gRw5ajBaWcm3LFWuZB40MuBY7X6S4YoAGExM1vXEapEdxI8uhvragdMEq8XK3FqF/
         AYovt1EhD63jYDE1bRTmY5S8rpiWDIL7sQsReggqbG5XLh6PmJkYccBNN6IDrlmmJzO7
         X7SnbBksl9dAHmEE7kNxr4lEBJZZwe7UgaGAHLDwyvfJEDSyS6nft1Y1pCiwLKNv3Vbf
         B44fIacPOH8pHXqAohf1SB9rj0IWPG54Pb6XzWG43HOJnEDTERvxo3z3BHr96bLOc2XR
         6K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=DD37qRnf4DwdYGKUaX/gk8Tf6ZAUloQD5i3A7juKncQ=;
        b=AjOLfDA1CYwdLoK/GJVq7YZzhCAKx+6qMwvDat2c5xjBIQd9I8e7ckdaXewqwnJrse
         lgOfUWgwu75hKvreMOLx9d7jo49Syh3zNWHiCFQ43x4CHBl4HxOstrjBbqVrEEWh1X2y
         kclyplAnFvrAMgygoZym9TyaOmDu2kmmdfqH77NkVSvw97jvqaVW9bcYWDtWTlzzn+ki
         WqZppAtBSCH0o+NCqSNMcXbu6hgd404gP0RbnjlZmZIKKVnDUWc1IpDnAYjgAK0Mcl28
         qVg82lOGt9T7RLcT+gXuvuyJ1oE4NaIU15+LsQLru3AT9OiDlPvQBcFsyYpa5xWnLNLi
         94hg==
X-Gm-Message-State: AOAM533+jAgmkSw2cXxvPAXBPI8q74/xbstE9J0c+QzWOJA906cWx+4W
        FTFzOcVA/Cg5MVYdFVnj9b8=
X-Google-Smtp-Source: ABdhPJygXqnJQ6JryvnQGxYXlpf5+dWPWNHI83vjcs6EeHH6JZH2Dy227EotfLdVq1jDBHnoI7W5xQ==
X-Received: by 2002:a9d:6ac3:: with SMTP id m3mr4216334otq.52.1613006449648;
        Wed, 10 Feb 2021 17:20:49 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a20sm333650otl.33.2021.02.10.17.20.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 17:20:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 10 Feb 2021 17:20:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
Message-ID: <20210211012047.GA95605@roeck-us.net>
References: <44ee7e09-90e7-0766-f0e4-bde2d3cdc2ec@bell.net>
 <5100eb80-975f-d77d-846a-5aabc25d0f95@bell.net>
 <e023991b-ba2e-f6da-94fb-0988ad70e717@bell.net>
 <9b9c6446-365f-9ca6-b89f-c330fca11952@bell.net>
 <94210da5-5642-82ef-85ae-688e1c07473d@gmx.de>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
 <20210127211851.GA32689@ls3530.fritz.box>
 <20210210145218.GA50561@roeck-us.net>
 <c7996434-198a-2a57-ac58-18ab6e1faf10@gmx.de>
 <288444d5-811f-db8f-6322-e26425527895@bell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <288444d5-811f-db8f-6322-e26425527895@bell.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Feb 10, 2021 at 01:57:42PM -0500, John David Anglin wrote:
> On 2021-02-10 12:23 p.m., Helge Deller wrote:
> > On 2/10/21 3:52 PM, Guenter Roeck wrote:
> >> On Wed, Jan 27, 2021 at 10:18:51PM +0100, Helge Deller wrote:
> >>> On parisc a spinlock is stored in the next page behind the pgd which
> >>> protects against parallel accesses to the pgd. That's why one additional
> >>> page (PGD_ALLOC_ORDER) is allocated for the pgd.
> >>>
> >>> Matthew Wilcox suggested that we instead should use a pointer in the
> >>> struct page table for this spinlock and noted, that the comments for the
> >>> PGD_ORDER and PMD_ORDER defines were wrong.
> >>>
> >>> Both suggestions are addressed in this patch. The pgd spinlock
> >>> (parisc_pgd_lock) is stored in the struct page table. In
> >>> switch_mm_irqs_off() the physical address of this lock is loaded into
> >>> cr28 (tr4) and the pgd into cr25, so that the fault handlers can
> >>> directly access the lock.
> >>>
> >>> The currently implemened Hybrid L2/L3 page table scheme (where the pmd
> >>> is adjacent to the pgd) is dropped now too.
> >>>
> >>> Suggested-by: Matthew Wilcox <willy@infradead.org>
> >>> Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
> >>> Signed-off-by: Helge Deller <deller@gmx.de>
> >>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> >>
> >> This patch results in:
> >>
> >> BUG: spinlock recursion on CPU#0, swapper/0/1
> >>   lock: 0x12226d14, .magic: dead4ead, .owner: swapper/0/1, .owner_cpu: 0
> >> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc7-next-20210209-32bit #1
> >> Hardware name: 9000/778/B160L
> >> Backtrace:
> >>   [<1019f9bc>] show_stack+0x34/0x48
> >>   [<10a65278>] dump_stack+0x94/0x114
> >>   [<10219f4c>] spin_dump+0x8c/0xb8
> >>   [<1021a0b4>] do_raw_spin_lock+0xdc/0x108
> >>   [<10a7367c>] _raw_spin_lock_irqsave+0x30/0x48
> >>   [<102bf41c>] handle_mm_fault+0x5e8/0xdb0
> >>   [<102b813c>] __get_user_pages.part.0+0x1b0/0x3d4
> >>   [<102b8900>] __get_user_pages_remote+0x134/0x34c
> >>   [<102b8b80>] get_user_pages_remote+0x68/0x90
> >>   [<102fccb0>] get_arg_page+0x94/0xd8
> >>   [<102fdd84>] copy_string_kernel+0xc4/0x234
> >>   [<102fe70c>] kernel_execve+0xcc/0x1a4
> >>   [<10a58d94>] run_init_process+0xbc/0xe0
> >>   [<10a70d50>] kernel_init+0x98/0x13c
> >>   [<1019a01c>] ret_from_kernel_thread+0x1c/0x24
> >>
> >> when trying to boot parisc/hppa images in qemu. Reverting this patch fixes
> >> the problem.
> >
> > True, I can reproduce the problem.
> > With CONFIG_DEBUG_SPINLOCK=y you get the backtrace above.
> > With  CONFIG_DEBUG_SPINLOCK=n it just hangs.
> > Happenes with 32-bit kernel with SMP kernel, even if only one virtual CPU is started.
> Which is quite puzzling since most spin locks are optimized in this case case.  Strikes me we
> have a lock that's not initialized.
> 
> It's not obvious how this relates to the patch.  get_arg_page() calls get_user_pages_remote() with

The fact that reverting it fixes the problem is a good indication
that the problem does relate to this patch.

As for how - no idea. That is not my area of expertise.

Thanks,
Guenter
