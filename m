Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A581DD5B5
	for <lists+linux-parisc@lfdr.de>; Thu, 21 May 2020 20:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgEUSKP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 21 May 2020 14:10:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:34832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728067AbgEUSKP (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 21 May 2020 14:10:15 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E26E8207D3;
        Thu, 21 May 2020 18:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590084614;
        bh=K/dRHe3cqKjVTW9i6mljklAvp3ztrtW6hbyHCm3nVyU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Nf8+RHq4tHZgybmGpD0iWK25G/HkjC/fHaINFmbsTmwyxbfjvQpVLB9/6nMfyCnGO
         ZWrWewT57thTsd+uO6Y7O9T4idAvs/Gu+N+ZEeVU+1uvEwg1pUX/beT4vSOaIHmw6j
         kS9OUM4/qzQvTFBh2md4b5AtLmkGZzRqrQ0D/UGA=
Date:   Thu, 21 May 2020 11:10:13 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     kbuild test robot <lkp@intel.com>
Cc:     Mike Rapoport <rppt@linux.ibm.com>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: [linux-next:master 10668/10701] include/linux/pgtable.h:203:2:
 note: in expansion of macro 'pte_clear'
Message-Id: <20200521111013.4002031df75532cca1f27d46@linux-foundation.org>
In-Reply-To: <202005211742.H2jPhSbF%lkp@intel.com>
References: <202005211742.H2jPhSbF%lkp@intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, 21 May 2020 17:30:52 +0800 kbuild test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: ef03574dee21524cbdbbf2af29fe06a62610570d [10668/10701] mm: introduce include/linux/pgtable.h
> config: parisc-randconfig-r011-20200521 (attached as .config)
> compiler: hppa-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout ef03574dee21524cbdbbf2af29fe06a62610570d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> In file included from include/linux/pgtable.h:6,
> from include/linux/mm.h:95,
> from include/linux/pid_namespace.h:7,
> from include/linux/ptrace.h:10,
> from arch/parisc/kernel/asm-offsets.c:20:
> include/linux/pgtable.h: In function 'pte_clear_not_present_full':
> arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
> 96 |   pte_t old_pte;              |         ^~~~~~~
> arch/parisc/include/asm/pgtable.h:322:34: note: in expansion of macro 'set_pte_at'
> 322 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
> |                                  ^~~~~~~~~~
> >> include/linux/pgtable.h:203:2: note: in expansion of macro 'pte_clear'
> 203 |  pte_clear(mm, address, ptep);
> |  ^~~~~~~~~
> include/linux/pgtable.h: In function '__ptep_modify_prot_commit':
> arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]

I can't reproduce this.  And I can't see anything in -mm whcih would
have triggered this warning.

arch/parisc/include/asm/pgtable.h has

#define set_pte_at(mm, addr, ptep, pteval)			\
	do {							\
		pte_t old_pte;					\
		unsigned long flags;				\
		spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
		old_pte = *ptep;				\
		set_pte(ptep, pteval);				\
		purge_tlb_entries(mm, addr);			\
		spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
	} while (0)

and old_pte has been set-but-not-used for a long time.

Obviously we can fix it, but I'm worried that parisc's set_pte_at() was
previously unused and we've now done something to cause it to be used,
so we're now running previously untested code.


