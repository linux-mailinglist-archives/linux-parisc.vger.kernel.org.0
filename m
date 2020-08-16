Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D438245684
	for <lists+linux-parisc@lfdr.de>; Sun, 16 Aug 2020 09:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgHPHfS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 16 Aug 2020 03:35:18 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18204 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726850AbgHPHfS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 16 Aug 2020 03:35:18 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07G7VoCQ030236;
        Sun, 16 Aug 2020 03:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=MX7iGW7xp0QzVf03SPnzdpcgjzbnv8xL9gPkcoWqR9M=;
 b=dulUFZCiyPmyEO/zRFhPZ6WWl1CehrtyWjejUDhtxm8vymnfkxpGftevIz4FZGlmu1ii
 srIuEL+hxIHtCfi3wm/7mk3UJY6HLzAgMpf20hwe8WkysqdhTu+RC4bT+IkyZHR3w1NQ
 El+0Xqs3nbzEhq63fcjRjOdoH4pRBECIpsSmjfJlg++0pC/HO2P6FPg5U1VwIo9FBQ7h
 mIZJjOpxxl2rD8zDG+1SWCn+tFoqrqjgbAl9hP1PU8Kopr14bjIu5swzuilZ8dL0eeLI
 ExK91KGbVcvvvFJxu0I2dLtZK77wGdIDIsqw+gkwMUSg4rXMcIlNL2s3yDAmfcFJ/AiJ 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32y05agck3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 03:34:15 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07G7YF7g036786;
        Sun, 16 Aug 2020 03:34:15 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32y05agcjf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 03:34:15 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07G7UV5Q015784;
        Sun, 16 Aug 2020 07:34:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com ([9.149.109.196])
        by ppma05fra.de.ibm.com with ESMTP id 32x7b80mn3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 07:34:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07G7YA9S29622616
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 16 Aug 2020 07:34:10 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4B6024204D;
        Sun, 16 Aug 2020 07:34:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 607FC42047;
        Sun, 16 Aug 2020 07:34:08 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.34.219])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Sun, 16 Aug 2020 07:34:08 +0000 (GMT)
Date:   Sun, 16 Aug 2020 10:34:06 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Pekka Enberg <penberg@kernel.org>,
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
Subject: Re: (bisected) parisc boot crash in post-5.8 git - pgalloc changes
Message-ID: <20200816073406.GD969206@linux.ibm.com>
References: <820716ab-0c6d-5154-0789-072b01011313@linux.ee>
 <9f2b5ebd-e4a4-0fa1-6cd3-4b9f6892d1ad@linux.ee>
 <20200815184200.GA17456@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200815184200.GA17456@casper.infradead.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-16_01:2020-08-14,2020-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 malwarescore=0 mlxscore=0 suspectscore=5 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008160058
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Sat, Aug 15, 2020 at 07:42:00PM +0100, Matthew Wilcox wrote:
> On Sat, Aug 15, 2020 at 09:35:05PM +0300, Meelis Roos wrote:
> > > While 5.8.0 worked fine on my HP RP2470 (Gentoo with 10.2.0 kgcc), yesterdays dddcbc139e96 and todays a1d21081a60d crash on boot. I have started bisecting it.
> > 
> > And finished now. I included all CC-s and SOB-s from the commit to this mail - sorry if too broad.
> > 
> > 1355c31eeb7ea61a7f2f2937d17cd4e343a6b5af is the first bad commit
> 
> yes, I see the problem.
> 
> arch/parisc/include/asm/pgtable.h:#define PMD_ORDER     1 /* Number of pages per pmd */
> 
> -static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
> -{
> -       pmd_t *pmd = (pmd_t *)__get_free_pages(GFP_KERNEL, PMD_ORDER);
> 
> +       page = alloc_pages(gfp, 0);
> 
> So I think the quick fix is to restore the parisc pmd_alloc_one and define
> __HAVE_ARCH_PMD_ALLOC_ONE.  I wasn't following this series too closely,
> so I shan't propose a patch, but leave it up to Mike.  I'd probably miss
> some subtlety.

You are right, I've missed that parisc has PMD_ORDER != 0 and the
simplest fix would be to revert changes to parisc pmd_alloc_one().

Meelis, can you please try the below patch:

diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
index cc7ecc2ef55d..a6482b2ce0ea 100644
--- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -10,6 +10,7 @@
 
 #include <asm/cache.h>
 
+#define __HAVE_ARCH_PMD_ALLOC_ONE
 #define __HAVE_ARCH_PMD_FREE
 #define __HAVE_ARCH_PGD_FREE
 #include <asm-generic/pgalloc.h>
@@ -67,6 +68,11 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 			(__u32)(__pa((unsigned long)pmd) >> PxD_VALUE_SHIFT)));
 }
 
+static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
+{
+	return (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
+}
+
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
 	if (pmd_flag(*pmd) & PxD_FLAG_ATTACHED) {

-- 
Sincerely yours,
Mike.
