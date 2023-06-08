Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC5F27287E5
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Jun 2023 21:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236862AbjFHTOr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 8 Jun 2023 15:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236869AbjFHTOc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 8 Jun 2023 15:14:32 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE29930E6
        for <linux-parisc@vger.kernel.org>; Thu,  8 Jun 2023 12:13:33 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6b2bdca0884so32419a34.2
        for <linux-parisc@vger.kernel.org>; Thu, 08 Jun 2023 12:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251598; x=1688843598;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H3hlbyYK7pDzwaZxcFIBlWQ9GVphTFdOhlIQXeLYhe0=;
        b=dJgo7fXPVEPfP5aOx2rlF6fhL0MOp6kKeclo0mcv4zTOiWrzHWntcp0lBZsfoj54Se
         XolJoU7BuSvwRUfmeldzR5qRMBOJZmJVG9boQPdpvF4oDnjII17h4IF7WTHJDAtPgKTK
         wCc48eCwjyNX1CCKOKbCJn6rCHbIrfq0gOAhHT/Cld5PzM9jgz6HhRaRcDPho1O+ftQz
         NYl5ZbGuf+ZDQqB6/nkOeRBoiE7Z3JRWHBfKCJGlqU4xYE9mQ0/j0JkL0Hi8bff5nmw2
         hyNF+dGcaX/VDgXb0gWmoFHLFIjjowl5ieph5brNA6Ro0AVROhwI1SIjSa8mT9DDlpOJ
         kD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251598; x=1688843598;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3hlbyYK7pDzwaZxcFIBlWQ9GVphTFdOhlIQXeLYhe0=;
        b=QahK6oBdCY2WGjHG5o9vzFiP/BjNeIsTShITtAFavgvIvq66Wa0AUWkW1POl46xP4F
         rhBb3Es5f0PgItfx4Nu+NvusBB+Fw3XXpuSj85Y9eUXn8YtdVnlbbFj4/rUfigNBMOQq
         bgRlL2+jJ6db16w5pi786Obw9lJJ5ed9Ipda9izIfkjx3TxqznQbLb3TSBGlDrW8Y7vB
         D5rT3APNmZ0pgg9M3NmBDqAL3815qt00aOGP1ypP+62mgMJ1pOYDKLKtNy5qG6lRgY2Q
         8YWPtNLIZRHa+VuYgpnQ3+iQRGbp1HT21Aw3ogl/LMqkDs8jwcT/lyO0Ec/LC+iESzH9
         gIYA==
X-Gm-Message-State: AC+VfDx4cmS7UZkyzsTNXcXqiO/mn72Ao8vu+qDEorD6GpVvvGa0lz2U
        GCtcTTj3Fwfx6gwgR9lFauVCgg==
X-Google-Smtp-Source: ACHHUZ7k4j5F178ZxkLqaj/gNdJycBqILZgmndfFTMZvJsxEKmjnaCgTvlswNo/GmMXGG825y1l48g==
X-Received: by 2002:a9d:7849:0:b0:6b2:a879:406a with SMTP id c9-20020a9d7849000000b006b2a879406amr5080795otm.18.1686251597829;
        Thu, 08 Jun 2023 12:13:17 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d188-20020a2568c5000000b00b9def138173sm449426ybc.1.2023.06.08.12.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:13:17 -0700 (PDT)
Date:   Thu, 8 Jun 2023 12:13:13 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Andrew Morton <akpm@linux-foundation.org>
cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 03/23] arm64/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <5849464-7191-40c5-c55f-fba9c3802e5d@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
that: to keep balance in future, use the recently added pte_alloc_huge()
instead; with pte_offset_huge() a better name for pte_offset_kernel().

Signed-off-by: Hugh Dickins <hughd@google.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 95364e8bdc19..21716c940682 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -307,14 +307,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			return NULL;
 
 		WARN_ON(addr & (sz - 1));
-		/*
-		 * Note that if this code were ever ported to the
-		 * 32-bit arm platform then it will cause trouble in
-		 * the case where CONFIG_HIGHPTE is set, since there
-		 * will be no pte_unmap() to correspond with this
-		 * pte_alloc_map().
-		 */
-		ptep = pte_alloc_map(mm, pmdp, addr);
+		ptep = pte_alloc_huge(mm, pmdp, addr);
 	} else if (sz == PMD_SIZE) {
 		if (want_pmd_share(vma, addr) && pud_none(READ_ONCE(*pudp)))
 			ptep = huge_pmd_share(mm, vma, addr, pudp);
@@ -366,7 +359,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		return (pte_t *)pmdp;
 
 	if (sz == CONT_PTE_SIZE)
-		return pte_offset_kernel(pmdp, (addr & CONT_PTE_MASK));
+		return pte_offset_huge(pmdp, (addr & CONT_PTE_MASK));
 
 	return NULL;
 }
-- 
2.35.3

