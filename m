Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54DE72883C
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Jun 2023 21:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbjFHTXK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 8 Jun 2023 15:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjFHTXJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 8 Jun 2023 15:23:09 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC7A2D70
        for <linux-parisc@vger.kernel.org>; Thu,  8 Jun 2023 12:22:45 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-569386b7861so31293877b3.0
        for <linux-parisc@vger.kernel.org>; Thu, 08 Jun 2023 12:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252164; x=1688844164;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VvuiwGfmHxTbGTIrjZEu2Atjrxfj5l7d/xiFwRLchQg=;
        b=5jRACtmOYl24iPoTbIjNRpyUFAC/FI9lpuvtUNHnC43m7VYioQ/BjHL7bdRB1Sderj
         Ku/HQKtR0qPfeCfubIqZ/AIBxONFw9MhEvcLPL8cbaxLn3mTiR/nWL6P2PCLjm+BwcQW
         0EgQz3QqN/pDsKtdmzyltGWnacSj5IwEptrUle8FLf/akecGFE+OR3UMPvCEsj1BvLU9
         B+ORl75p95EI9Mde8VL9yv1b1t+G7YgfanAmLLFyt7bpvhgPlWiVhcJ7Ue5u8gtJ1wSb
         o7+vcjNZQIk2HsdRh5Pl//khJzNempIfA/Kf3RkDsGtD4+XKnKjXxiMtp0DlEfTwETu/
         3u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252164; x=1688844164;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvuiwGfmHxTbGTIrjZEu2Atjrxfj5l7d/xiFwRLchQg=;
        b=b4EkzuQRttsLMYekSDguEOMsjRbMHlxoK/XeoQkBMx7S1qArLoTQAWsgEfRJYkAdlm
         zIHNI2JEXFOE8taf24ENSLQyjOekNv9IRRl4zOlSLzaVX1r//wxV7jEUvVOQukeBC/Qk
         HTRXSUtfiM5Ef7ZE++K5IlfMCGFns4yRJA5cemOlHjxllWFEu6+5SoLpcHEg+ZvL1edq
         3GbYfgLyoHTdagpP7kIb53cCGXF0+sfmwYw33H1+EQBb41k9Q+8hnLZqnJXM3pF0/snB
         edzTK3RmXYDkMfrPiIBnhdNrZI9a0LrzSveZf9InuRa9+tjsArnmQjqOAswOO0VkqEO2
         erRg==
X-Gm-Message-State: AC+VfDy4jgUUmzX0P0NVzYUbN83SbDYZ73JKI9mrqv3NBRUDcm2oSfBq
        kdIBr3ekgvHz/oaLlND4DjeSvQ==
X-Google-Smtp-Source: ACHHUZ40hyaOIkdH7B5oJObv6N1cySgcI9o6+PKHZNW5ZVazdwvrvX10Wz2CSgkv/8emrW9KOXZU2A==
X-Received: by 2002:a81:a08c:0:b0:569:ef9b:eda with SMTP id x134-20020a81a08c000000b00569ef9b0edamr823988ywg.10.1686252163900;
        Thu, 08 Jun 2023 12:22:43 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n126-20020a817284000000b00561949f713fsm118018ywc.39.2023.06.08.12.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:22:43 -0700 (PDT)
Date:   Thu, 8 Jun 2023 12:22:39 -0700 (PDT)
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
Subject: [PATCH v2 11/23] powerpc: kvmppc_unmap_free_pmd()
 pte_offset_kernel()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <c76aa421-aec3-4cc8-cc61-4130f2e27e1@google.com>
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

kvmppc_unmap_free_pmd() use pte_offset_kernel(), like everywhere else
in book3s_64_mmu_radix.c: instead of pte_offset_map(), which will come
to need a pte_unmap() to balance it.

But note that this is a more complex case than most: see those -EAGAINs
in kvmppc_create_pte(), which is coping with kvmppc races beween page
table and huge entry, of the kind which we are expecting to address
in pte_offset_map() - this might want to be revisited in future.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 461307b89c3a..572707858d65 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -509,7 +509,7 @@ static void kvmppc_unmap_free_pmd(struct kvm *kvm, pmd_t *pmd, bool full,
 		} else {
 			pte_t *pte;
 
-			pte = pte_offset_map(p, 0);
+			pte = pte_offset_kernel(p, 0);
 			kvmppc_unmap_free_pte(kvm, pte, full, lpid);
 			pmd_clear(p);
 		}
-- 
2.35.3

