Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628DA31956B
	for <lists+linux-parisc@lfdr.de>; Thu, 11 Feb 2021 22:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhBKVwS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 11 Feb 2021 16:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbhBKVwP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 Feb 2021 16:52:15 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C50C061786
        for <linux-parisc@vger.kernel.org>; Thu, 11 Feb 2021 13:51:34 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id r75so7833299oie.11
        for <linux-parisc@vger.kernel.org>; Thu, 11 Feb 2021 13:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=IlmiMOAtlxjI+1k+l2WhuFDxxwOLbRPAS21s102E0Gc=;
        b=oCHuZsM0wH+0v1sfimL7+761EoXD8PNM3ZAlOK6D4059peweOPV13yiWOCvvB8mQOt
         rOvgrQG8sMEQnIEwjQvnnejusVihJeIJY79autW1WGcfutYhm1bNauPsnrMBtI5Wy/sG
         5rSnk9lwys88nF26xZ83RDN8jYzBn5keHklh6if151yLCmnkLWma5JXOzim4zcVxywY4
         T4daUDkwOlRCTN1P2j9LjIadRlUjnECUDx8WAOTJ2TqMX5eVwAqNERzXq/+lLG9zH9Jb
         70O3+cqlbNXQJBlIDwd/w0GXaTsK5ewhb2DlUVhvtfUGrGj5QrfWW5TsEwwcq1DArpHy
         I94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=IlmiMOAtlxjI+1k+l2WhuFDxxwOLbRPAS21s102E0Gc=;
        b=RvZEAzYpaG5bPUqwU+Jg7OAS2T4ifWjLFnndlTzwWWRxiu76QN93n1o9SGot/IiqKm
         NIRzagAdBNIk3sBnEv9z3eGyYVBLF7u6XyMZ34jUts1FPSvEse+D+eg/r7uai24BLpN1
         dBpmLbUsVhIrAD5cBMRjxrxzcYRjesx3wxfGzm/jfIWlgTyVSww3crNwBdUvPp++91rD
         XP+sZHii8jmtajwhlOqAB+UvCkPqZ9mNP+jpZKgWtW+mrCaE0XbFbPMPqfjUM2spfWez
         JiuL+OmshHVBR6htaykVW4e1lAiNifI5/4QlR29dvUB73CMhUoHc7/obgh1bMwA0F3Y/
         U2sQ==
X-Gm-Message-State: AOAM530DY0T5t63pig9Ww8XbvZXDm4/0tcSTUKfk0t6TXP2t1EBrgslh
        DL5Uor2Jkbb3DDNxoEoERkc=
X-Google-Smtp-Source: ABdhPJz/ERSXN/E2b4Xw2xAgDbvd4VT8SHcyv0uPkyx5Rmsm/rgUIYt1IE1iwhion6Iv9t+J8ou+JQ==
X-Received: by 2002:a05:6808:1294:: with SMTP id a20mr4428635oiw.106.1613080293635;
        Thu, 11 Feb 2021 13:51:33 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w124sm1362250oiw.40.2021.02.11.13.51.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 13:51:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 11 Feb 2021 13:51:31 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
Message-ID: <20210211215131.GA127652@roeck-us.net>
References: <e023991b-ba2e-f6da-94fb-0988ad70e717@bell.net>
 <9b9c6446-365f-9ca6-b89f-c330fca11952@bell.net>
 <94210da5-5642-82ef-85ae-688e1c07473d@gmx.de>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
 <20210127211851.GA32689@ls3530.fritz.box>
 <20210210145218.GA50561@roeck-us.net>
 <c7996434-198a-2a57-ac58-18ab6e1faf10@gmx.de>
 <288444d5-811f-db8f-6322-e26425527895@bell.net>
 <20210211012047.GA95605@roeck-us.net>
 <51fe1d4a-a2a0-b202-692f-c3db1843785c@bell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51fe1d4a-a2a0-b202-692f-c3db1843785c@bell.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Feb 11, 2021 at 09:38:25AM -0500, John David Anglin wrote:
> On 2021-02-10 8:20 p.m., Guenter Roeck wrote:
> > On Wed, Feb 10, 2021 at 01:57:42PM -0500, John David Anglin wrote:
> >> On 2021-02-10 12:23 p.m., Helge Deller wrote:
> >>> On 2/10/21 3:52 PM, Guenter Roeck wrote:
> >>>> On Wed, Jan 27, 2021 at 10:18:51PM +0100, Helge Deller wrote:
> >>>>> On parisc a spinlock is stored in the next page behind the pgd which
> >>>>> protects against parallel accesses to the pgd. That's why one additional
> >>>>> page (PGD_ALLOC_ORDER) is allocated for the pgd.
> >>>>>
> >>>>> Matthew Wilcox suggested that we instead should use a pointer in the
> >>>>> struct page table for this spinlock and noted, that the comments for the
> >>>>> PGD_ORDER and PMD_ORDER defines were wrong.
> >>>>>
> >>>>> Both suggestions are addressed in this patch. The pgd spinlock
> >>>>> (parisc_pgd_lock) is stored in the struct page table. In
> >>>>> switch_mm_irqs_off() the physical address of this lock is loaded into
> >>>>> cr28 (tr4) and the pgd into cr25, so that the fault handlers can
> >>>>> directly access the lock.
> >>>>>
> >>>>> The currently implemened Hybrid L2/L3 page table scheme (where the pmd
> >>>>> is adjacent to the pgd) is dropped now too.
> >>>>>
> >>>>> Suggested-by: Matthew Wilcox <willy@infradead.org>
> >>>>> Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
> >>>>> Signed-off-by: Helge Deller <deller@gmx.de>
> >>>>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> >>>> This patch results in:
> >>>>
> >>>> BUG: spinlock recursion on CPU#0, swapper/0/1
> >>>>   lock: 0x12226d14, .magic: dead4ead, .owner: swapper/0/1, .owner_cpu: 0
> >>>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc7-next-20210209-32bit #1
> >>>> Hardware name: 9000/778/B160L
> >>>> Backtrace:
> >>>>   [<1019f9bc>] show_stack+0x34/0x48
> >>>>   [<10a65278>] dump_stack+0x94/0x114
> >>>>   [<10219f4c>] spin_dump+0x8c/0xb8
> >>>>   [<1021a0b4>] do_raw_spin_lock+0xdc/0x108
> >>>>   [<10a7367c>] _raw_spin_lock_irqsave+0x30/0x48
> >>>>   [<102bf41c>] handle_mm_fault+0x5e8/0xdb0
> >>>>   [<102b813c>] __get_user_pages.part.0+0x1b0/0x3d4
> >>>>   [<102b8900>] __get_user_pages_remote+0x134/0x34c
> >>>>   [<102b8b80>] get_user_pages_remote+0x68/0x90
> >>>>   [<102fccb0>] get_arg_page+0x94/0xd8
> >>>>   [<102fdd84>] copy_string_kernel+0xc4/0x234
> >>>>   [<102fe70c>] kernel_execve+0xcc/0x1a4
> >>>>   [<10a58d94>] run_init_process+0xbc/0xe0
> >>>>   [<10a70d50>] kernel_init+0x98/0x13c
> >>>>   [<1019a01c>] ret_from_kernel_thread+0x1c/0x24
> >>>>
> >>>> when trying to boot parisc/hppa images in qemu. Reverting this patch fixes
> >>>> the problem.
> >>> True, I can reproduce the problem.
> >>> With CONFIG_DEBUG_SPINLOCK=y you get the backtrace above.
> >>> With  CONFIG_DEBUG_SPINLOCK=n it just hangs.
> >>> Happenes with 32-bit kernel with SMP kernel, even if only one virtual CPU is started.
> >> Which is quite puzzling since most spin locks are optimized in this case case.  Strikes me we
> >> have a lock that's not initialized.
> >>
> >> It's not obvious how this relates to the patch.  get_arg_page() calls get_user_pages_remote() with
> > The fact that reverting it fixes the problem is a good indication
> > that the problem does relate to this patch.
> >
> > As for how - no idea. That is not my area of expertise.
> I built Helge's for-next tree both with CONFIG_DEBUG_SPINLOCK=y and CONFIG_DEBUG_SPINLOCK=n.  Both
> builds work fine on c8000.
> 
> The only thing that might have changed in the patch is the alignment of the lock used for page table updates.
> Qemu only support PA 1.x instructions.  The ldcw instruction needs 16-byte alignment on real hardware and
> there is code to dynamically align lock pointers to 16-byte alignment.  The c8000 supports PA 2.0 instructions
> and the ldcw,co instruction only needs 4-byte alignment.  Perhaps there is an issue with the dynamic alignment
> of the lock pointer or the lock initialization in the PA 1.x build for qemu.
> 

The first lock is acquired in mm/memory.c from line 3565:

        vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
                        &vmf->ptl);

The second (recursive) lock is acquired from line 3587 in the same
function:

        set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);

Source code lines are from next-20210211. I confirmed with debug code
that the lock address passed to do_raw_spin_lock() is the same in both
calls.

Guenter
