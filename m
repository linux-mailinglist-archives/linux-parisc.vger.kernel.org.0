Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 159DD5E914A
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 08:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiIYG4Q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 02:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiIYG4P (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 02:56:15 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ABF2AC6E
        for <linux-parisc@vger.kernel.org>; Sat, 24 Sep 2022 23:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664088966;
        bh=7IFfmzR7aXZ1Yhpt8kJ8Pu2b5UsesJ49N53B9H4dMr8=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=P0Uffb6iS0lVjJFYbk6usSO0nAbJ/6k0opeAcUDJx4s3yNGxTUD1J2BjzhvgtJY35
         9ZacmYGdh/qp+cswUcNikdCWBAwy5ZmiFJBD4jw9sRfeFMHj+iHpoFS1GzOze+0SQK
         DlbLR3kRmdWuzJLMY+DbY2kUVs+RsCZRyg4jvO70=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNY8-1pBPG93vVo-00ZNm3; Sun, 25
 Sep 2022 08:56:06 +0200
Date:   Sun, 25 Sep 2022 08:56:03 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH][RFC] parisc: Use local tlb purges only on UP machines
Message-ID: <Yy/7g0NzOi/igNi7@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:KyuCB9FNlA1aeB7IOBUG2gBpwsEUCEydanrOW6Z2B2L1RDmm5iP
 Q/OSHCNAV7Bu8Zn+FTu/OqNVF7zpw/MnLWjwexIfwzPxCdG5jyhSnG6/hIMkUJs3zc1qd65
 sAuhW/k3TuSQRUk3cMd1lnqFpxnhYwF9IX6KX50ojRAaS0rPos9kDlnfRsF9fuHFXiXx0Xh
 V/fVlnv1RvATGg8psOCmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3wBFdumgIG4=:ePtQPoAWb3eQTCRZJNJ1ae
 WDR8xcz0BgUGb7sJBH+AiXzLaUeaXFPrRNOTPQZv7chdgFUqtH6MBAO8YtmghVPKJxlAutVlP
 xo/IhWBPukfexDugprKE2O2kHR+eRLC+wJUjP6dt8aWCshdoXX034fJRHz4rXYEwIadiwVuK9
 mJC7yVqaUn6hCKzHq7uod9ogff+av+4CczPZ8wc8CUC9RTcHErw1tb7ncN57F3nMz9161QWp/
 tCv7916bwSyOZHzd+Z/CZ6mFZEIwXhHk+w4JMdcr7AJMbeHmFcsqBPmn7wudv/f5bi45SM7Am
 vg/yZgpbaX6xOyD3d698maBVa4JOQE3GK8U6N2pXgeRX0GGH5Ib+vU/eVU2vXJIkDKdZi7hi6
 b8DSEm4yL9lN47n7EYUyXYnIgYoL4J1L68zr8cLj4PTTkD0oq8fEBm41fBeCstUm+L+7PG8Bt
 475+X714abHyMxJCtdGEnPI4dM4vpaQouViFITAr2vMcPeg8P80KUj/Ghmh3b70mUzxZouc/e
 RGOiWikiIX1o5U1sCX9cWovhE/D+Vl3Q7sVbRD1IKZEopsAjwfNbZ9f2QDSorAt+3ui+ZWkKD
 8DHV+cMBAj6U8htpcDDYsePsHKMyFbXWBSgM7bTnndb5IQQyZ0pLTJcPEATiIPNP8vDHs7iTt
 BA2K/8wn071YxDpmHvjqFWx1A4w1JKbT+MecTfAd2drCsXItarjpTCmMwfJtCzOmWDoZ//nPo
 tpMXZhR6eJbnUeQyG6Zy05isWqY89ydjBitdSar6Q6zHJCD776PcfMVRXbQeLulInD+x5oV0y
 oarh9+dr6OEu6o5o/tqRgmrVIvxzMK8Ix1eIv9LL0aabcwk/iRYC9giaWOcIPo4ATbAUXycnA
 VFwqU96D160wm/09u6zmQSjOCOx4N4l7t5ihHtnT+sW9HLLDey2V5Nv/DMacPaqNTC3NerQVj
 gJv8nZsIDYOARS7LwO0jDGvK9bMYxfXHzX9c8rccocOUiplHvv+mMYNLyUd3chRYj/W/HyNYn
 tEeLFjfF9duZxKAtbuLq1877uC7Zqhc6z5HLeXm5ELMaqk4mnVAxx7DVmUbovXg6kMCmIiosv
 HrGuRl1k5kUo/iJTlGl1wiq4x3VdA/9r+1IIfwPCQtyp+BrYAmSVj1BTROH5O9xI86OF2fOZ/
 NCbCYCNw70IILzkUnTwEe2J3yP
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Limit usage of CPU-local tlb flushes in pacache.S to non-SMP machines.
On 32-bit kernels this was the case already, with this patch this
behaviour is used on 64-bit kernels now too.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 9a0018f1f42c..920f6ef5c3e5 100644
=2D-- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -539,15 +539,10 @@ ENTRY_CFI(copy_user_page_asm)

 	/* Purge any old translations */

-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-	pdtlb,l		%r0(%r29)
-#else
 0:	pdtlb		%r0(%r28)
 1:	pdtlb		%r0(%r29)
 	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-#endif

 #ifdef CONFIG_64BIT
 	/* PA8x00 CPUs can consume 2 loads or 1 store per cycle.
@@ -670,12 +665,8 @@ ENTRY_CFI(clear_user_page_asm)

 	/* Purge any old translation */

-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-#else
 0:	pdtlb		%r0(%r28)
 	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-#endif

 #ifdef CONFIG_64BIT
 	ldi		(PAGE_SIZE / 128), %r1
@@ -736,12 +727,8 @@ ENTRY_CFI(flush_dcache_page_asm)

 	/* Purge any old translation */

-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-#else
 0:	pdtlb		%r0(%r28)
 	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-#endif

 88:	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), r31
@@ -785,12 +772,8 @@ ENTRY_CFI(purge_dcache_page_asm)

 	/* Purge any old translation */

-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-#else
 0:	pdtlb		%r0(%r28)
 	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-#endif

 88:	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), r31
@@ -837,17 +820,11 @@ ENTRY_CFI(flush_icache_page_asm)
 	 * have a flat address space, it's not clear which TLB will be
 	 * used.  So, we purge both entries.  */

-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-1:	pitlb,l         %r0(%sr4,%r28)
-	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
-#else
 0:	pdtlb		%r0(%r28)
 1:	pitlb           %r0(%sr4,%r28)
 	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
-#endif

 88:	ldil		L%icache_stride, %r1
 	ldw		R%icache_stride(%r1), %r31
