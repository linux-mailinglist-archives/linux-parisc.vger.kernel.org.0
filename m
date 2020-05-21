Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FF11DD66D
	for <lists+linux-parisc@lfdr.de>; Thu, 21 May 2020 20:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729615AbgEUS7N (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 21 May 2020 14:59:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19342 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729603AbgEUS7M (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 21 May 2020 14:59:12 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04LIWmD1019230;
        Thu, 21 May 2020 14:59:05 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 312wsmdu6k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 May 2020 14:59:05 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04LIikW1052367;
        Thu, 21 May 2020 14:59:04 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com with ESMTP id 312wsmdu5t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 May 2020 14:59:04 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04LIt2oa010167;
        Thu, 21 May 2020 18:59:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma02fra.de.ibm.com with ESMTP id 313x2j2k5j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 May 2020 18:59:02 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 04LIvl5U58982802
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 May 2020 18:57:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2124B42041;
        Thu, 21 May 2020 18:59:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3D9924203F;
        Thu, 21 May 2020 18:58:59 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.204.51])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 21 May 2020 18:58:59 +0000 (GMT)
Date:   Thu, 21 May 2020 21:58:57 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: [linux-next:master 10668/10701] include/linux/pgtable.h:203:2:
 note: in expansion of macro 'pte_clear'
Message-ID: <20200521185857.GV1059226@linux.ibm.com>
References: <202005211742.H2jPhSbF%lkp@intel.com>
 <20200521111013.4002031df75532cca1f27d46@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521111013.4002031df75532cca1f27d46@linux-foundation.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-21_12:2020-05-21,2020-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 cotscore=-2147483648 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005210134
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, May 21, 2020 at 11:10:13AM -0700, Andrew Morton wrote:
> On Thu, 21 May 2020 17:30:52 +0800 kbuild test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> > commit: ef03574dee21524cbdbbf2af29fe06a62610570d [10668/10701] mm: introduce include/linux/pgtable.h
> > config: parisc-randconfig-r011-20200521 (attached as .config)
> > compiler: hppa-linux-gcc (GCC) 9.3.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout ef03574dee21524cbdbbf2af29fe06a62610570d
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc 
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> > 
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > In file included from include/linux/pgtable.h:6,
> > from include/linux/mm.h:95,
> > from include/linux/pid_namespace.h:7,
> > from include/linux/ptrace.h:10,
> > from arch/parisc/kernel/asm-offsets.c:20:
> > include/linux/pgtable.h: In function 'pte_clear_not_present_full':
> > arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
> > 96 |   pte_t old_pte;              |         ^~~~~~~
> > arch/parisc/include/asm/pgtable.h:322:34: note: in expansion of macro 'set_pte_at'
> > 322 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
> > |                                  ^~~~~~~~~~
> > >> include/linux/pgtable.h:203:2: note: in expansion of macro 'pte_clear'
> > 203 |  pte_clear(mm, address, ptep);
> > |  ^~~~~~~~~
> > include/linux/pgtable.h: In function '__ptep_modify_prot_commit':
> > arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
> 
> I can't reproduce this.  And I can't see anything in -mm whcih would
> have triggered this warning.
> 
> arch/parisc/include/asm/pgtable.h has
> 
> #define set_pte_at(mm, addr, ptep, pteval)			\
> 	do {							\
> 		pte_t old_pte;					\
> 		unsigned long flags;				\
> 		spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
> 		old_pte = *ptep;				\
> 		set_pte(ptep, pteval);				\
> 		purge_tlb_entries(mm, addr);			\
> 		spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
> 	} while (0)
> 
> and old_pte has been set-but-not-used for a long time.
> 
> Obviously we can fix it, but I'm worried that parisc's set_pte_at() was
> previously unused and we've now done something to cause it to be used,
> so we're now running previously untested code.
 
I can reporduce it with

make W=1 ARCH=parisc CROSS_COMPILE=/opt/gcc-8.1.0-nolibc/hppa-linux/bin/hppa-linux-

on both the v5.7-rc6 and linux-next.

The only difference in the header names:

--- build-master.log	2020-05-21 21:44:03.064168815 +0300
+++ build-next.log	2020-05-21 21:44:52.372330747 +0300
@@ -2,25 +2,26 @@
   GEN     Makefile
   CALL    scripts/atomic/check-atomics.sh
   CC      arch/parisc/kernel/asm-offsets.s
-In file included from include/linux/mm.h:95,
+In file included from include/linux/pgtable.h:6,
+                 from include/linux/mm.h:31,
                  from include/linux/pid_namespace.h:7,
                  from include/linux/ptrace.h:10,
                  from arch/parisc/kernel/asm-offsets.c:20:
-include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
+include/linux/pgtable.h: In function 'pte_clear_not_present_full':
 arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
    pte_t old_pte;     \
          ^~~~~~~
 arch/parisc/include/asm/pgtable.h:322:34: note: in expansion of macro 'set_pte_at'
  #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
                                   ^~~~~~~~~~
...

I think moving asm-generic/pgtable.h to linux/pgtable.h triggered the
"new warning" notification.

And the fix is obviously:

From 6de5f02d11fef8894836168c3e7bede05916d02d Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Thu, 21 May 2020 21:49:01 +0300
Subject: [PATCH] parisc: set_pte_at: remove unused old_pte variable.

kbuild test robot complains about unused variable old_pte in set_pte_at()
macro:

arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
96 |   pte_t old_pte;              |         ^~~~~~~
arch/parisc/include/asm/pgtable.h:322:34: note: in expansion of macro 'set_pte_at'
322 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))

Remove the old_pte variable.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/parisc/include/asm/pgtable.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 097d19007f2e..75cf84070fc9 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -93,10 +93,8 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 
 #define set_pte_at(mm, addr, ptep, pteval)			\
 	do {							\
-		pte_t old_pte;					\
 		unsigned long flags;				\
 		spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
-		old_pte = *ptep;				\
 		set_pte(ptep, pteval);				\
 		purge_tlb_entries(mm, addr);			\
 		spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
-- 
2.26.2


-- 
Sincerely yours,
Mike.
