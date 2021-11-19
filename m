Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BF34577B8
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Nov 2021 21:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhKSUaw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Nov 2021 15:30:52 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:10368 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229879AbhKSUaw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Nov 2021 15:30:52 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197756C000AC1B1
X-CM-Envelope: MS4xfImwhiIVUmSr6lg4Mw47mV65NZVExqOY1r1PztgBOBHCKCROqw19J+5GFtEBH9qwxXuAlNqo4A5ruPzb4xKb5X+vTMZ1RWtDYjQkaXFMyL2hBePm2VrX
 cK6VHtetkh7m1d5w2/HCp/YBPQiTbPnbSLdjjPNVSonO2FcA/DFrylRdjRs6249nJ7X8IH9GB358TT6C7AemqbIZFFCZkJ7u13egHRY6t2vq4TWIcTbGk3vO
 5OaM91Irp0i2Cbsb1FFY7ut1b7ER4AcHExmrHqamtF7NEy5kaZY3T35W0IS/cG8FYxacq0WJ5xT3E7jtK3+GDTryz9MalIjp+tS/Pflvjio=
X-CM-Analysis: v=2.4 cv=WtFIjfTv c=1 sm=1 tr=0 ts=619808c2
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=znblFtJjrKCuOqAew1MA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197756C000AC1B1; Fri, 19 Nov 2021 15:27:46 -0500
Message-ID: <8125f9ae-e0ff-e3d7-f9d0-7315131fbda8@bell.net>
Date:   Fri, 19 Nov 2021 15:27:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] parisc: Fix extraction of hash lock bits in syscall.S
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <df51e873-4576-d4c2-7d86-b607cbb714b4@bell.net>
 <YZfJLEmjAUdY+4OO@ls3530>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <YZfJLEmjAUdY+4OO@ls3530>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-19 10:56 a.m., Helge Deller wrote:
> * John David Anglin<dave.anglin@bell.net>:
>> The extru instruction leaves the most significant 32 bits of the target register in an undefined
>> state on PA 2.0 systems.  If any of these bits are nonzero, this will break the calculation of the
>> lock pointer.
>>
>> Fix by using extrd,u instruction on 64-bit kernels.
> I wonder if we shouldn't introduce an extru_safe() macro.
> The name doesn't matter, but that way we can get rid of the ifdefs and
> use it in other places as well, e.g. as seen below.
> Thoughs?
Seems like a good idea.

Only question is this hunk

@@ -366,17 +366,9 @@
       */
      .macro        L2_ptep    pmd,pte,index,va,fault
  #if CONFIG_PGTABLE_LEVELS == 3
-    extru        \va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
+    extru_safe    \va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
  #else
-# if defined(CONFIG_64BIT)
-    extrd,u        \va,63-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
-  #else
-  # if PAGE_SIZE > 4096
-    extru        \va,31-ASM_PGDIR_SHIFT,32-ASM_PGDIR_SHIFT,\index
-  # else
-    extru        \va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
-  # endif
-# endif
+    extru_safe    \va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
  #endif
      dep             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
  #if CONFIG_PGTABLE_LEVELS < 3

where we lose the PAGE_SIZE > 4096 shift.

Dave

-- 
John David Anglin  dave.anglin@bell.net

