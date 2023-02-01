Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2A7686FAD
	for <lists+linux-parisc@lfdr.de>; Wed,  1 Feb 2023 21:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjBAUdi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 Feb 2023 15:33:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBAUdh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 Feb 2023 15:33:37 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737606ACA4
        for <linux-parisc@vger.kernel.org>; Wed,  1 Feb 2023 12:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1675283610; bh=Wf/Vav/xkYTzDcwgz0XtR81PB0yfoWIBycaNFOSD6nY=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=izKveUuMR+BN58EQKDuRTiGYt0wGTqS05HrezIrroNlCq5DywAfRy7qAqHLQ1JOeh
         USLJ+nPq61pXSrIMBeqsiwKIwO0ra5Sd4Hl3PT8NjPJ8dZs41IhL+B9ju+YtJgTvPR
         3eZydlpNZZS6/Z8wW4WwqEiaLHw9xAxYPhy4Ihasl58WSeHiMey8YnZnGYD/0M6GHc
         RmsP9OlXNXR0J2i5ZDpSJnziid6PaTjI5ETsn19Oa8bYZO2sMkkaAViklXDcsCrj9x
         ikmfw58k/RgXuuLKEzz5HzbOlmWnM3GLXBKOxAZujPL4PES7IQaf91CV0Po3lotbHs
         XsLZCBGNQHCxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.144.73]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dwj-1oc8dD0YtR-015Wfz; Wed, 01
 Feb 2023 21:33:30 +0100
Date:   Wed, 1 Feb 2023 21:33:28 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add checks to verify page alignment in cache
Message-ID: <Y9rMmE5+8Nmp3AxC@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:vR7+KJOMEKQB0iPqZ45XYijjLp1F1ZL6xPbtBuMkMRfw5ivAOz7
 PlBVw949CVoXNC3bfu2OZ0OTkbEaN56Fna38+eii31VlW+0Nw2RjvsyUzww74qEgLTC++RR
 Sk+tUjfo8QaaolZDfyKSjNL9f7t0x8TABTceBag3Lt/XfIAlno5x/I49qRixzqmWgCPl3u7
 SN/BoFyIfJ7WKhiJcBsNg==
UI-OutboundReport: notjunk:1;M01:P0:vWMnAIE+ed8=;Ps04vrtFTkclmOHCZ2KC/VXcbao
 TRA8UWPUGKXgK9EMjbRkr8mvqJ3LAh6do7zc9U0nO7h0yTInDvM8H73hA+5n1aUzpZfn/jOrr
 tWUu2UE26eczyVHAhZz3qdO2eSVcBmzmP+EzkMWndl5c9rGYvZVHyk1mIboPd8UrcPjSYeChe
 qXGaj18TsCJrkcI27SetqRXUA8jxj0anypKH4b+6o+F7x0+2jnXvDiHcRWKaECU3w2Brhex7N
 5zFR8YZ08AKC+wywIAgnrLh/YVZWCRDoESwbaYFZmkfQ3gkHLCIx2IJV4KEBb9jOo2FhJD2I1
 YXdtnJnvGpwohe7mYtUJLcy8TyqCtayh4EF/ojvZT4IMBdy8Wi364PSAEWdepfxgXCpfiL6ka
 Xm+Alf6tdJeG9c4B+OS0WUPzHwswxfbgiShHrX5w0Bc7BIAdiQnarMN/VgdsMF/ssH8cCbxTX
 lh4Yv7LcGm4ckBQDma6Y/xVQcmrfLaOrUfkrG8RSPsQnPLypQVv62XLnMzW065Y5TETivmwXC
 s6hMzFSIz84NDsh2YNTeRfaMPmwYNFCsPSk8tslEBHgr18C1YQjmo9rJ2qn5D5pIeak9+vv0I
 CA9GkUQaH40dWaUAiW/1Mz4sEVePbOrf4AxpEjaej0HuwjmWXKT61gZZudBet7DwvoRysaFQ1
 xY3xJZSxl+0a9T++dCFcfZlibf91NKNZCCGNYzHpBNAg83KsR+Unen1wkXBGh7jPjIUvElTTF
 YFY4ZlHJLiynzkTg19Uvowg3/m75xnnlxm27zq0d7/W3Dst3msixPzuBg0Q0dck5aeCIB2PdD
 +ylstvwKJieAn35hV9D2h0x4SCNUUC5SzYz2PdYVhyY3LWkF95x1viU3nMrhNfwsEZdBqVVXL
 CTeNMxDSuyU2GIqLmvpLBCQB/28/vcY0PKx4D4lcKrM/1okIHmoM3KSnSvJoaiTtVXIXNcikN
 GmjxIw==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

functions
Reply-To:

Add checks to ensure that only page-aligned addresses are provided.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/as=
m/cacheflush.h
index 0bdee6724132..ff07c509e04b 100644
=2D-- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -15,6 +15,9 @@ DECLARE_STATIC_KEY_TRUE(parisc_has_cache);
 DECLARE_STATIC_KEY_TRUE(parisc_has_dcache);
 DECLARE_STATIC_KEY_TRUE(parisc_has_icache);

+#define PA_CHECK_PAGE_ALIGNED(addr) \
+	WARN_ON_ONCE((unsigned long)addr & ~PAGE_MASK)
+
 #define flush_cache_dup_mm(mm) flush_cache_mm(mm)

 void flush_user_icache_range_asm(unsigned long, unsigned long);
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 1d3b8bc8a623..595968f708c3 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -317,6 +317,7 @@ __flush_cache_page(struct vm_area_struct *vma, unsigne=
d long vmaddr,
 {
 	if (!static_branch_likely(&parisc_has_cache))
 		return;
+	PA_CHECK_PAGE_ALIGNED(vmaddr);
 	preempt_disable();
 	flush_dcache_page_asm(physaddr, vmaddr);
 	if (vma->vm_flags & VM_EXEC)
@@ -550,6 +551,7 @@ void flush_kernel_dcache_page_addr(const void *addr)
 {
 	unsigned long flags;

+	PA_CHECK_PAGE_ALIGNED(addr);
 	flush_kernel_dcache_page_asm(addr);
 	purge_tlb_start(flags);
 	pdtlb(SR_KERNEL, addr);
@@ -567,8 +569,10 @@ static void flush_cache_page_if_present(struct vm_are=
a_struct *vma,
 	 * a non-access TLB miss. Hopefully, the page has already been
 	 * flushed.
 	 */
-	if (ptep && pte_needs_flush(*ptep))
+	if (ptep && pte_needs_flush(*ptep)) {
+		PA_CHECK_PAGE_ALIGNED(vmaddr);
 		flush_cache_page(vma, vmaddr, pfn);
+	}
 }

 void copy_user_highpage(struct page *to, struct page *from,
@@ -712,6 +716,7 @@ void flush_cache_page(struct vm_area_struct *vma, unsi=
gned long vmaddr, unsigned
 {
 	if (WARN_ON(!pfn_valid(pfn)))
 		return;
+	PA_CHECK_PAGE_ALIGNED(vmaddr);
 	if (parisc_requires_coherency())
 		flush_user_cache_page(vma, vmaddr);
 	else
