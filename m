Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E757A728836
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Jun 2023 21:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236802AbjFHTV4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 8 Jun 2023 15:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233740AbjFHTVx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 8 Jun 2023 15:21:53 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27F230DA
        for <linux-parisc@vger.kernel.org>; Thu,  8 Jun 2023 12:21:18 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-565ba53f434so9045647b3.3
        for <linux-parisc@vger.kernel.org>; Thu, 08 Jun 2023 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252072; x=1688844072;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=alKFmwAdxdkIViw1WjkjX/OCKeQtR2IpGs2zcY6rd0M=;
        b=HKd31LqvAwT3pdB9H8RTJjakAJAT9HvglTvKC+OkvKmv5VhsoaZHAtLpo2tFkCpDhK
         eaJn1uAawotb3pLd5xLGg7DzD6kDQrKAHxas7kU/r2KN0gO+8LwEgaLotjlfcSI+ExXP
         OsTJ1O2tfGB1hyPd2BGfO1Hv0XjmUpnPR5LgmonoIasqGq2fAG/aN3V/iTrXbCwGdrUM
         I50yE5ZJKvbdrlam2CeJEmfXKvbJkG9Wl49W11ZHf6B9xR5DJRVBfUy3eWMAtZhLeFU3
         MFev89ALFBnRCYsOlrl0s+V0pK/HvUPQhOTjtpCkmArqzAHuVaF4G3AF2HiTPrlcql5n
         hmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252072; x=1688844072;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alKFmwAdxdkIViw1WjkjX/OCKeQtR2IpGs2zcY6rd0M=;
        b=jhZTSBj/j8DaM+PvfP1iIcUuWNyZ4Kp+ylbU4JeXERlrBn4x8+xt6w72RA9OmBJj00
         6L6pR1xlVCZKdGjoXmDHO79ehj6EKYRuADNBLwQUaySYKBh3AlqJrTNu6YMeeN79Dn8n
         1663PBce3vSQb7ZtgbQOERQsRC5niOKIqIuzgHNB9JyK+24r8hWQN/BDowgd1FzZvYCx
         hsUlrfMqwP+j10iPJ3cOph72+Nh105SxzuTLXkFWEf+t/hIzR5SOJEouXNqSx3wg8j6V
         Dpm5s4+S+LfcdbD+ymDBmlt2OcZMmyKNbxjZi4mD9cVORJQNCfgkVQyQbvxIDGti5D8C
         DO2w==
X-Gm-Message-State: AC+VfDy6kpeFttj3xA/NcocSk3z3Ps5WWJvg3rk/cdSuLcZF0tLyR2Q/
        EZddg9DAbDVao7I1/h3U6FzQIw==
X-Google-Smtp-Source: ACHHUZ6osQDL46P3M+nFsTgwfoyN2ZCBLpMaIBhxVjRNKZnry7+6/FcNKdRpu6hPkSNVLheeDpiVWQ==
X-Received: by 2002:a0d:d98f:0:b0:565:ba4b:aa81 with SMTP id b137-20020a0dd98f000000b00565ba4baa81mr612161ywe.45.1686252072277;
        Thu, 08 Jun 2023 12:21:12 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id f184-20020a0ddcc1000000b00552ccda9bb3sm108635ywe.92.2023.06.08.12.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:21:11 -0700 (PDT)
Date:   Thu, 8 Jun 2023 12:21:07 -0700 (PDT)
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
Subject: [PATCH v2 10/23] parisc/hugetlb: pte_alloc_huge()
 pte_offset_huge()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <7963aeed-f7d2-e0-f3c6-3680c5572444@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
that: to keep balance in future, use the recently added pte_alloc_huge()
instead; with pte_offset_huge() a better name for pte_offset_kernel().

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/parisc/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
index d1d3990b83f6..a8a1a7c1e16e 100644
--- a/arch/parisc/mm/hugetlbpage.c
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -66,7 +66,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (pud) {
 		pmd = pmd_alloc(mm, pud, addr);
 		if (pmd)
-			pte = pte_alloc_map(mm, pmd, addr);
+			pte = pte_alloc_huge(mm, pmd, addr);
 	}
 	return pte;
 }
@@ -90,7 +90,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 			if (!pud_none(*pud)) {
 				pmd = pmd_offset(pud, addr);
 				if (!pmd_none(*pmd))
-					pte = pte_offset_map(pmd, addr);
+					pte = pte_offset_huge(pmd, addr);
 			}
 		}
 	}
-- 
2.35.3

