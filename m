Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69F175E9586
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 20:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiIYS5i (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 14:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbiIYS5f (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 14:57:35 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B332C2ED57
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 11:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664132247;
        bh=3U1GE0QFsDwUqGVumUoWr0qos0U7RXbODDvFj246jSA=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Ji6otRZE96+cVa7XSB2Lu1pVVbrl5tsoh13bO9lM1qbX+vhT0CpkDEqnqwQppu4T6
         +rbWQkIloryNrMzoKUVC02YwapH48dusTkxr9Q24E2IVP5dj8qP7Cln5xDvBQNWJlY
         HYUUXRJB/GRytMwIhLpn0P1CXrYX5c/x1w8ElRoU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.188.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmUHp-1p31wk0U4n-00iQVZ; Sun, 25
 Sep 2022 20:57:27 +0200
Date:   Sun, 25 Sep 2022 20:57:23 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH][RFC] parisc: Use local tlb purges only on PA2.0 machines
Message-ID: <YzCkkyktEZFM0svQ@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:pjAoWATUfG+fTfNcA30E5rvwKZ5K5sPB15mcw4k5T9BIIlQ38XH
 tSTwYBpmFzU3tNt3WMOyPN/tZi+PDKneGLL9YXQZcfMB8OdoorOHTFAP98PD7vxD0qJuvHq
 D3knFJZuDzlWh8GZGKKnuwJoGFFbZGjdUeLcNSsH0zdHxZi8pKizTTZzKbtRz7aWz+TKor7
 0LLKJWd1hrSFlFtxTtykA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lEpEiw0N3F8=:Wu9Lo/qe9j/ft41vH8Dgsg
 BpKM1dPioBzGhkI+WTvb1wXN4EHsI5pfRJ7XtwH7nbFRJgyDpXY6C2tZm0dV2kc92bzXS4cIq
 qQl00Mi1uFrqkeZXWgRMYlqMYi0a2tmB7bYcT/MZs1axhzJkjuIN9wPB/5rd8CQeb88M2SIlj
 KNHn0ZUqC1q3zYtRv+m/ZZvMGUvUwfqUmcV5Xz65XwO7A+Xkfl8lX7auhnrhn8uDB7CaGpr4+
 jXMuM+euEESVXQj+CqVOtvToXG1Z0wJnfMFVRwOCjfGGRTxmdbt1nqepjW0b7W0KmI7x2N6Ag
 LNzaMJWjgFTjhl6NsUSHPPYsdBDBSJGXLevDrpuX+huTdJGyGS9Zrr1S1QsayBrnI91PqdjND
 aQCGWgDyBoDDxZBk+grTvfgy8mvfvVSjr99LPLhUiwtibr9RADhTo/LhV1gwUz1BmNZP7kdXD
 Zp6ZhvUM3yTsgjab2HposgyzuOmrF7U1GipnWb9cZIKTSoinodI6+zTuklKWT8x7K1fb9+Mne
 dU2z3Sn2Q2KRwdSfm53UyB1zUME+oWgQPLvXIm98fJ+vHVfT/dH2eeK7ZIfAKbHA9EyH4gVpV
 ZqlKnYp4C4v67X7F3K0HfhROXOL4kh7MtY9MKkqEtpJtzY/LEsd8wb3WJ05oW2PqKJ0NYaQHg
 oht0388e+7rmKiGTEuWUGazhjCi4TWr7RSHg95CXGd+WTCVW0kybQtdnAYElMJJ6C/PySWIL2
 lqEVsb0tDS2TAwjwnTNl3Jee/vTelYL8Viv4MNpsigzL2lekW1k1n25yO8OGfVX/nALdsTZej
 8xiA9sohPnvzE1p4Bk0jYZEs6bXS1UcfDmJpdwtMonNrl97IvyqcarcD9aGu4v2bVaj5jcYQI
 1wZLtn4WeFcsRJt2K8BYpavuBOY+BceJb4kPLSLq2iATl7aO+OPcvOMzjzUEe6ukVXcL881ay
 CxqjGSpI8y9xBZynEV44rlReuh0Ux4Vd9Vub5TcfH0tQE/hgsF4hHLWqREy1v8mpEmWhtFuH2
 XUsi9VvcxAd6mbD/x3wwiozd1XENsUre/LKwJZVA1q3Zy6i7MPB/YvqCZnFvuEmnbotk99dQ8
 jj/fp9Z0h8+XdM+IMksswoTqDy6Fku+rZd0nAdwsg1uhLd8+M/hGcdBreqAUBjaL/mIZSMWO7
 yvKpN0PdMiIlHyndqjANj9iRbu
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Allow usage of CPU-local tlb purges in pacache.S on PA2.0 machines only.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 9a0018f1f42c..7c23fcb737a9 100644
=2D-- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -31,6 +31,12 @@
 	.section .text.hot
 	.align	16

+#ifdef CONFIG_PA20
+#define ALT_COND_PACACHE	ALT_COND_ALWAYS
+#else
+#define ALT_COND_PACACHE	ALT_COND_NO_SMP
+#endif
+
 ENTRY_CFI(flush_tlb_all_local)
 	/*
 	 * The pitlbe and pdtlbe instructions should only be used to
@@ -539,15 +545,10 @@ ENTRY_CFI(copy_user_page_asm)

 	/* Purge any old translations */

-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-	pdtlb,l		%r0(%r29)
-#else
 0:	pdtlb		%r0(%r28)
 1:	pdtlb		%r0(%r29)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-#endif
+	ALTERNATIVE(0b, 0b+4, ALT_COND_PACACHE, INSN_PxTLB)
+	ALTERNATIVE(1b, 1b+4, ALT_COND_PACACHE, INSN_PxTLB)

 #ifdef CONFIG_64BIT
 	/* PA8x00 CPUs can consume 2 loads or 1 store per cycle.
@@ -670,12 +671,8 @@ ENTRY_CFI(clear_user_page_asm)

 	/* Purge any old translation */

-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-#else
 0:	pdtlb		%r0(%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-#endif
+	ALTERNATIVE(0b, 0b+4, ALT_COND_PACACHE, INSN_PxTLB)

 #ifdef CONFIG_64BIT
 	ldi		(PAGE_SIZE / 128), %r1
@@ -736,12 +733,8 @@ ENTRY_CFI(flush_dcache_page_asm)

 	/* Purge any old translation */

-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-#else
 0:	pdtlb		%r0(%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-#endif
+	ALTERNATIVE(0b, 0b+4, ALT_COND_PACACHE, INSN_PxTLB)

 88:	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), r31
@@ -785,12 +778,8 @@ ENTRY_CFI(purge_dcache_page_asm)

 	/* Purge any old translation */

-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-#else
 0:	pdtlb		%r0(%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-#endif
+	ALTERNATIVE(0b, 0b+4, ALT_COND_PACACHE, INSN_PxTLB)

 88:	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), r31
@@ -837,17 +826,11 @@ ENTRY_CFI(flush_icache_page_asm)
 	 * have a flat address space, it's not clear which TLB will be
 	 * used.  So, we purge both entries.  */

-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-1:	pitlb,l         %r0(%sr4,%r28)
-	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
-#else
 0:	pdtlb		%r0(%r28)
 1:	pitlb           %r0(%sr4,%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
+	ALTERNATIVE(0b, 0b+4, ALT_COND_PACACHE, INSN_PxTLB)
+	ALTERNATIVE(1b, 1b+4, ALT_COND_PACACHE, INSN_PxTLB)
 	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
-#endif

 88:	ldil		L%icache_stride, %r1
 	ldw		R%icache_stride(%r1), %r31
