Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603244BB41E
	for <lists+linux-parisc@lfdr.de>; Fri, 18 Feb 2022 09:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbiBRIZv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 18 Feb 2022 03:25:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232538AbiBRIZt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 18 Feb 2022 03:25:49 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6201A23E5FB
        for <linux-parisc@vger.kernel.org>; Fri, 18 Feb 2022 00:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645172723;
        bh=tEUtSWuwoaDiN+IsjoOhrxMnA4tI+3f66HSLU14lblo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=XCkqIq0eyaCkG4kvRBkJ58QaF30T5Wc2lywQTpXGUGW9Jqa/eCknstAZwL4t6zUHO
         30m4wCh0DizCDOPPVJBJbgoDBv9MJ7oMaYnj9MW9NofzJGxkrN5XHMenVuZi/TbjuU
         3AxHsFuf/lIHNj/xPbP5RjPlq8kPqQhi3Q7SM2zI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.159.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvcG-1npipX0nB2-00UuMr; Fri, 18
 Feb 2022 09:25:23 +0100
Date:   Fri, 18 Feb 2022 09:25:20 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Fix fldd and fstd unaligned handlers on 32-bit kernel
Message-ID: <Yg9X8N/FN+GHvNuK@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:vAwGEFZBvLKFTw05xxnn79HSHpDuyEjRsI5L+mWyFaoLI9/TAsf
 /LQFct3L9TCIxSsd22+pq3n2nzJUWhl33OpnvURTreBFQPHm2LPnSlqBxDS8KAK+vFsW6d/
 WXAfEMeiNIZ6xs7uQFFsfard53pwFxZGvYH+5q21GiUo/C3Vq1GNdenICMb4o9sYn4M76AR
 l580d5t3rd2CVf2EJSPvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eFnAgGdharU=:zs4V4w4QvECWloM+FsqmI8
 u6ef5i1h/aBrSGmaACtrZJmGk/vNCV/95lgOH2Aespxq2AXKX0tIPAu5sbjw7arRI8c0dcOih
 VFScSqFqSEjsCTmUczZ9WcdvZq9mZjDqN9KrBhBHERkrVoWJpPDnKxOwaxpWPJO3ix6rOBwG9
 DhIvX7stCV4yOcI8WVy5mxFurtH5YdGzND6Qb5B0aF8Vf2Z2Hqpsg+9NAsMIwPypCyznq7j6d
 mLdz/10ykk3xTwOnMAIKrPChFCouwPBZbp6WlKN0PjiIdrTodYgTO36hemegsEMVNwSgxntpg
 //JK1AFcOKVP0RNn+lqo9/2AWYSk4NDGuvusJ+wsukET2vd6PQRqtnhJIB5SNZS+uSV3j5lGk
 QvvsA+TmYP1EquJAulkQzUWC0epGSev4iBh3daFtnWKlIL1GnlDR0u83WpNb0TM32db4UMaZM
 xtOktyw05bKzdEAf0dl6BPIOwJ8XWj8aEeVGVFWuHNwgts1g5AItg8GiYo8T9cQThlKyESsCO
 f27dRZntf6U3nQGj0q12pa8BwZj+6QwW5+WDEqnxPaZ0KA9ChZzsq4iSbGpX/Ok6eVY9xcp17
 NUzsHpmkIscyqlRb5A9rfGoSPJjHSNVN8ilcLUdVU1cvydwbWNMUWwv0jim0wnXVbTyR1VgP0
 lTNtmnrGt2AgZSlNc6+XphwWVDFYOoFyG2GpclrbK05IHk79sJHC3uGhjdHZtqiITQarZgEBR
 6pLuQIRqZ0KXevWQFUf7PsvdKVS51kBc1xkGSbZ0BklVArVISUGzcvGo2mPEygkBu1renQoga
 REoxkdzTHKZl5QQ1ZekiHmAAK6uXKpCMP0makRYp/I156U6GdI1mxG6QPVarKK4n2nR3BKTjF
 Ci2098m3ABcjkwgsFBSta83gCqcs8gMw1hkuGcUUp2VIajkCveuuzFRKZ4WeCOwviDp3nXCuH
 +NpvsYEbm4O+aGsjIRIdXvbWrVaVa3Nsvh0B1iqQ6GPGGPtmy7Hv4SvEfcgP7zvIu0jPJT1Qn
 2LrBmt8Vblrv26bw1Radbf3N+zajdYDMsCnNFP4jecD9fWQK+3GO8vuBHBR7ufDpqcgW4i7Fm
 D2oD5FzU4afdjg=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Usually the kernel provides fixup routines to emulate the fldd and fstd
floating-point instructions if they load or store 8-byte from/to a not
natuarally aligned memory location.

On a 32-bit kernel I noticed that those unaligned handlers didn't worked and
instead the application got a SEGV.
While checking the code I found two problems:

First, the OPCODE_FLDD_L and OPCODE_FSTD_L cases were ifdef'ed out by the
CONFIG_PA20 option, and as such those weren't built on a pure 32-bit kernel.
This is now fixed by moving the CONFIG_PA20 #ifdef to prevent the compilation
of OPCODE_LDD_L and OPCODE_FSTD_L only, and handling the fldd and fstd
instructions.

The second problem are two bugs in the 32-bit inline assembly code, where the
wrong registers where used. The calculation of the natural alignment used %2
(vall) instead of %3 (ior), and the first word was stored back to address %1
(valh) instead of %3 (ior).

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned.c
index 237d20dd5622..a238b7fe8908 100644
--- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -397,7 +397,7 @@ static int emulate_std(struct pt_regs *regs, int frreg, int flop)
 	__asm__ __volatile__ (
 "	mtsp	%4, %%sr1\n"
 "	zdep	%2, 29, 2, %%r19\n"
-"	dep	%%r0, 31, 2, %2\n"
+"	dep	%%r0, 31, 2, %3\n"
 "	mtsar	%%r19\n"
 "	zvdepi	-2, 32, %%r19\n"
 "1:	ldw	0(%%sr1,%3),%%r20\n"
@@ -409,7 +409,7 @@ static int emulate_std(struct pt_regs *regs, int frreg, int flop)
 "	andcm	%%r21, %%r19, %%r21\n"
 "	or	%1, %%r20, %1\n"
 "	or	%2, %%r21, %2\n"
-"3:	stw	%1,0(%%sr1,%1)\n"
+"3:	stw	%1,0(%%sr1,%3)\n"
 "4:	stw	%%r1,4(%%sr1,%3)\n"
 "5:	stw	%2,8(%%sr1,%3)\n"
 "	copy	%%r0, %0\n"
@@ -596,7 +596,6 @@ void handle_unaligned(struct pt_regs *regs)
 		ret = ERR_NOTHANDLED;	/* "undefined", but lets kill them. */
 		break;
 	}
-#ifdef CONFIG_PA20
 	switch (regs->iir & OPCODE2_MASK)
 	{
 	case OPCODE_FLDD_L:
@@ -607,14 +606,15 @@ void handle_unaligned(struct pt_regs *regs)
 		flop=1;
 		ret = emulate_std(regs, R2(regs->iir),1);
 		break;
+#ifdef CONFIG_PA20
 	case OPCODE_LDD_L:
 		ret = emulate_ldd(regs, R2(regs->iir),0);
 		break;
 	case OPCODE_STD_L:
 		ret = emulate_std(regs, R2(regs->iir),0);
 		break;
-	}
 #endif
+	}
 	switch (regs->iir & OPCODE3_MASK)
 	{
 	case OPCODE_FLDW_L:
