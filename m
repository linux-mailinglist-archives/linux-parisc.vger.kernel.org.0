Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D02BA133C94
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Jan 2020 09:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgAHIEE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Jan 2020 03:04:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26184 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726087AbgAHIEE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Jan 2020 03:04:04 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00883fZC037332
        for <linux-parisc@vger.kernel.org>; Wed, 8 Jan 2020 03:04:02 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2xb8sapvmk-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-parisc@vger.kernel.org>; Wed, 08 Jan 2020 03:03:55 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-parisc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Wed, 8 Jan 2020 08:02:20 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 8 Jan 2020 08:02:13 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 00882CRS50462798
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 8 Jan 2020 08:02:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CE6EDA4062;
        Wed,  8 Jan 2020 08:02:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7922DA405C;
        Wed,  8 Jan 2020 08:02:10 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.56.145])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed,  8 Jan 2020 08:02:10 +0000 (GMT)
Date:   Wed, 8 Jan 2020 10:02:08 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org,
        Meelis Roos <mroos@linux.ee>, Helge Deller <deller@gmx.de>,
        Anatoly Pugachev <matorola@gmail.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greentime Hu <green.hu@gmail.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Jeff Dike <jdike@addtoit.com>,
        John David Anglin <dave.anglin@bell.net>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Mark Salter <msalter@redhat.com>,
        Matt Turner <mattst88@gmail.com>,
        Michal Simek <monstr@monstr.eu>, Peter Rosin <peda@axentia.se>,
        Richard Weinberger <richard@nod.at>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Russell King <linux@armlinux.org.uk>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Sam Creasey <sammy@sammy.net>,
        Vincent Chen <deanbo422@gmail.com>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: new panic in 5.5-rc1 (parisc, kmem_cache_open)
References: <de6b77cc-9c32-23fa-5caf-b6d370792e85@linux.ee>
 <20191209202626.0f2c2112@wim.jer>
 <alpine.LRH.2.02.2001070944280.18122@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2001070944280.18122@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 20010808-0008-0000-0000-000003476CC9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010808-0009-0000-0000-00004A67AFF3
Message-Id: <20200108080208.GA8272@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-08_01:2020-01-07,2020-01-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=773 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001080069
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Jan 07, 2020 at 09:52:20AM -0500, Mikulas Patocka wrote:
> 
> On Mon, 9 Dec 2019, Jeroen Roovers wrote:
> 
> > On Mon, 9 Dec 2019 20:22:17 +0200
> > Meelis Roos <mroos@linux.ee> wrote:
> > 
> > > I tried 5.5-rc1 on RP3440 and got a surprise panic on boot (5.4
> > > worked):
> > 
> > Ah, I was going to reported this, too.
> > 
> > > mem auto-init: stack:off, heap alloc:off, heap free:off
> > > Memory: 12348004K/12580864K available (6438K kernel code, 2148K
> > > rwdata, 954K rodata, 1193K init, 500K bss, 232860K reserved, 0K
> > > cma-reserved)
> > 
> > I see an additional message after this:
> > 
> > random: get_random_u64 called from __kmem_cache_create+0x70/0x660 with
> > crng_init=0
> > 
> > And then the same or similar enough backtrace.
> > 
> > 
> > Regards,
> >      jer
> 
> Hi
> 
> I also have this panic. I bisected it and it is caused by the patch 
> d96885e277b5edcd1e474e8b1579005163f23dbe.

My guess would be that pgd is not populated after the change.
Can you please check if the below hack fixes the crash?


diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index ddca8287d43b..354cf060b67f 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -401,7 +401,7 @@ static void __init map_pages(unsigned long start_vaddr,
 			pmd = (pmd_t *) __pa(pmd);
 		}
 
-		pgd_populate(NULL, pg_dir, __va(pmd));
+		pud_populate(NULL, (pud_t *)pg_dir, __va(pmd));
 #endif
 		pg_dir++;
 
 
> Unfortunatelly, the patch can't be reverted because pre-patch code depends 
> on the file asm-generic/4level-fixup.h that is missing in the 5.5-rc
> branch.
> 
> Mikulas
 
-- 
Sincerely yours,
Mike.

