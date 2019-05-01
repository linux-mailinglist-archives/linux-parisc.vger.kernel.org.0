Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD3D710B3B
	for <lists+linux-parisc@lfdr.de>; Wed,  1 May 2019 18:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfEAQVW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 May 2019 12:21:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42310 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbfEAQVV (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 May 2019 12:21:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 6DC6B308218D;
        Wed,  1 May 2019 16:21:21 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 37B1A413A;
        Wed,  1 May 2019 16:21:21 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x41GLKId027700;
        Wed, 1 May 2019 12:21:20 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x41GLKrY027696;
        Wed, 1 May 2019 12:21:20 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 1 May 2019 12:21:20 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: Re: [PATCH][RFC] parisc: Use per-pagetable spinlock (v2)
In-Reply-To: <383ae5f2-cfa9-784f-2f19-8bcc5ade53a4@gmx.de>
Message-ID: <alpine.LRH.2.02.1905011219190.27284@file01.intranet.prod.int.rdu2.redhat.com>
References: <20190428173431.GA21286@ls3530.dellerweb.de> <alpine.LRH.2.02.1905011021300.6862@file01.intranet.prod.int.rdu2.redhat.com> <383ae5f2-cfa9-784f-2f19-8bcc5ade53a4@gmx.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 01 May 2019 16:21:21 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Wed, 1 May 2019, Helge Deller wrote:

> Hi Mikulas,
> 
> On 01.05.19 16:22, Mikulas Patocka wrote:
> > I tested it on C8000 and confim that it works.
> 
> Thanks for testing!
> 
> By the way, I made you the author of the patch in git:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=f1abe94b271807902d5b286c7216b812645713e2
> 
> In general, there are so many new cool features and patches pending
> in the for-next tree, so I appreciate every kind of testing:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next
> 
> Helge

The new kernel hangs on boot here:

Command line for kernel: 'root=/dev/sda5 console=ttyB0 HOME=/ panic=1 panic_on_oops=1 palo_kernel=2/vmlinux-5.1.0-rc5'
Selected kernel: /vmlinux-5.1.0-rc5 from partition 2
ELF64 executable

Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 153800 mediaptr 0x1000
Segment 1 load 00126000 size 8997176 mediaptr 0x27000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Linux version 5.1.0-rc5 (root@phoebe) (gcc version 8.3.0 (GCC)) #1 SMP Wed May 1 17:55:46 CEST 2019
[    0.000000] CPU0: thread -1, cpu 0, socket 0
[    0.000000] FP[0] enabled: Rev 1 Model 20
[    0.000000] The 64-bit Kernel has started...
[    0.000000] Kernel default page size is 4 KB. Huge pages disabled.
[    0.000000] printk: bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] PAT: Running on cell 0 and location 1.
[    0.000000] PAT: legacy revision 0x24, pat_rev 0x201, pdc_cap 0x132, S-PTLB 0, HPMC_RENDEZ 0.
[    0.000000] model 000089b0 00000491 00000000 00000002 56bbf1abce93405d 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000401
[    0.000000] CPUID vers 20 rev 10 (0x0000028a)
[    0.000000] capabilities 0x35
[    0.000000] model 9000/785/C8000
[    0.000000] product n/a, original product AB629A, S/N: SG51828565
[    0.000000] parisc_cache_init: Only equivalent aliasing supported!
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
[    0.000000]  1) Start 0x0000000100000000 End 0x00000001bfdfffff Size   3070 MB
[    0.000000]  2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
[    0.000000] Total Memory: 7166 MB
[    0.000000] PDT: type PDT_PAT_NEW, size 3000, entries 0, status 0, dbe_loc 0xffffffffffffffff, good_mem 0 MB
[    0.000000] PDT: Firmware reports all memory OK.

Mikulas
