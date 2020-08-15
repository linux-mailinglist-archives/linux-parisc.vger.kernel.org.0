Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E38245427
	for <lists+linux-parisc@lfdr.de>; Sun, 16 Aug 2020 00:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgHOWNe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 15 Aug 2020 18:13:34 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:46889 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727994AbgHOWNe (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 15 Aug 2020 18:13:34 -0400
Subject: (bisected) parisc boot crash in post-5.8 git - pgalloc changes
From:   Meelis Roos <mroos@linux.ee>
To:     Mike Rapoport <rppt@linux.ibm.com>
References: <820716ab-0c6d-5154-0789-072b01011313@linux.ee>
Cc:     linux-parisc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Pekka Enberg <penberg@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Joerg Roedel <joro@8bytes.org>, Joerg Roedel <jroedel@suse.de>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
        Stafford Horne <shorne@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <9f2b5ebd-e4a4-0fa1-6cd3-4b9f6892d1ad@linux.ee>
Date:   Sat, 15 Aug 2020 21:35:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <820716ab-0c6d-5154-0789-072b01011313@linux.ee>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> While 5.8.0 worked fine on my HP RP2470 (Gentoo with 10.2.0 kgcc), yesterdays dddcbc139e96 and todays a1d21081a60d crash on boot. I have started bisecting it.

And finished now. I included all CC-s and SOB-s from the commit to this mail - sorry if too broad.

1355c31eeb7ea61a7f2f2937d17cd4e343a6b5af is the first bad commit
commit 1355c31eeb7ea61a7f2f2937d17cd4e343a6b5af
Author: Mike Rapoport <rppt@linux.ibm.com>
Date:   Thu Aug 6 23:22:39 2020 -0700

     asm-generic: pgalloc: provide generic pmd_alloc_one() and pmd_free_one()
     
     For most architectures that support >2 levels of page tables,
     pmd_alloc_one() is a wrapper for __get_free_pages(), sometimes with
     __GFP_ZERO and sometimes followed by memset(0) instead.
     
     More elaborate versions on arm64 and x86 account memory for the user page
     tables and call to pgtable_pmd_page_ctor() as the part of PMD page
     initialization.
     
     Move the arm64 version to include/asm-generic/pgalloc.h and use the
     generic version on several architectures.
     
     The pgtable_pmd_page_ctor() is a NOP when ARCH_ENABLE_SPLIT_PMD_PTLOCK is
     not enabled, so there is no functional change for most architectures
     except of the addition of __GFP_ACCOUNT for allocation of user page
     tables.
     
     The pmd_free() is a wrapper for free_page() in all the cases, so no
     functional change here.
     
     Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
     Reviewed-by: Pekka Enberg <penberg@kernel.org>
     Cc: Matthew Wilcox <willy@infradead.org>
     Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
     Cc: Andy Lutomirski <luto@kernel.org>
     Cc: Arnd Bergmann <arnd@arndb.de>
     Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
     Cc: Joerg Roedel <joro@8bytes.org>
     Cc: Joerg Roedel <jroedel@suse.de>
     Cc: Max Filippov <jcmvbkbc@gmail.com>
     Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
     Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
     Cc: Stafford Horne <shorne@gmail.com>
     Cc: Stephen Rothwell <sfr@canb.auug.org.au>
     Cc: Steven Rostedt <rostedt@goodmis.org>
     Cc: Geert Uytterhoeven <geert@linux-m68k.org>
     Link: http://lkml.kernel.org/r/20200627143453.31835-5-rppt@kernel.org
     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

  arch/alpha/include/asm/pgalloc.h     | 15 +------------
  arch/arm/include/asm/pgalloc.h       | 11 ---------
  arch/arm64/include/asm/pgalloc.h     | 27 +---------------------
  arch/ia64/include/asm/pgalloc.h      | 10 ---------
  arch/mips/include/asm/pgalloc.h      |  8 ++-----
  arch/parisc/include/asm/pgalloc.h    | 11 ++-------
  arch/riscv/include/asm/pgalloc.h     | 13 +----------
  arch/sh/include/asm/pgalloc.h        |  3 +++
  arch/um/include/asm/pgalloc.h        |  8 +------
  arch/um/include/asm/pgtable-3level.h |  3 ---
  arch/um/kernel/mem.c                 | 12 ----------
  arch/x86/include/asm/pgalloc.h       | 26 +---------------------
  include/asm-generic/pgalloc.h        | 43 ++++++++++++++++++++++++++++++++++++
  13 files changed, 55 insertions(+), 135 deletions(-)

> Last output lines from 5.8.0-13161-gdddcbc139e96:
> 
> [    1.150985] 1. Crescendo 750 W2 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5e3, 0x00004 }
> [    1.243570] 2. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
> [    1.243792] 3. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
> [    1.382893] 4. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
> [    1.522243] 5. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
> [    1.660767] 6. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
> [    1.799247] 7. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
> [    1.799500]
> ********** VIRTUAL FRONT PANEL **********
> System Boot detected
> *****************************************
> LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
>         ON       FLASH         OFF       ON         ON
> LED State: There was a system interruption that did not take the system down.
> Check Chassis and Console Logs for error messages.
> 
> processor                 system initialization      1C00
> 
> *****************************************
> 
> ************ EARLY BOOT VFP *************
> End of early boot detected
> *****************************************
> h support not available.
> [    2.639001] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
> 
> ********** VIRTUAL FRONT PANEL **********
> System Boot detected
> *****************************************
> LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
>         ON       FLASH         FLASH     ON         ON
> LED State: System Running.  Unexpected Reboot.  Non-critical Error Detected.
> Check Chassis and Console Logs for error messages.
> 
> processor                 system panic               1B00

-- 
Meelis Roos <mroos@linux.ee>
