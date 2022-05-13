Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 444A6526D94
	for <lists+linux-parisc@lfdr.de>; Sat, 14 May 2022 01:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbiEMXtb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 13 May 2022 19:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiEMXtb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 13 May 2022 19:49:31 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E166B37F0DB
        for <linux-parisc@vger.kernel.org>; Fri, 13 May 2022 16:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652485125;
        bh=pweQQJPZiqbjKV39ncToWiFpy5ZxCoCXUpaM5jUjrpA=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=bYM38lehs2A0ptrRhPl/LB3+Rgv5iXKua/PUJG4a2q4Wk0eF70OPLYPRYJpTDV/zF
         F8l9sZoE1v3eFiu0hQZXup98dRseAoNg+q2woQwmfLMoo67WJChRriFeUNYSMD03yR
         Lpu9sC7mm7VDMS3LpyX1tf3UPsm0Om65KtUDhsRM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.176.141]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1nw0eT2IJM-011yPI; Sat, 14
 May 2022 01:38:45 +0200
Date:   Sat, 14 May 2022 01:38:43 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Unconditionally flush tlb entry in tmpalias functions
Message-ID: <Yn7sA9LCVrYSgWk6@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:uIA0bhlqejLCbA4snNqMc9ecxwYdoYyqSh44EkhGNr89vBGHkjm
 CJk8jxD5rWqCYFOp5+J+GbSKExpK2m3P4CQehKq+m0oLj7tRiRLLRInpTBdfbRVD6XcdmYJ
 6y0zZZd+Hw10KFxxZHhC/p3NZJRm/1h+VXSKgxlTIRU5MNkJdPZoT4zk+Yyy+oOyEOzIhWk
 KFanuwe8x8Il3ueRxNIYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:md5MGsO4O9w=:sXd6SoGu2LjzVkh5izre/a
 tLkSStErvoEOuql3LNt/3g5VhLaMyzOHnuDmO07OKMMTTwfbJIeewMfhzV+FdbEEaq2s7fYjF
 QzT8ejlPJZm0At0/q3N1MKGQDn8uiKj/uUuQRe36HFXyhwdIJYzz3f5AmHxM1UgCFxWmhG+hp
 hYj/5NHsVDLFGF8atUl5A9srsKi10R2oGTCO6o6csALGxYr8BQ/gnbH2lDCJ2NTv/rjGzhbSk
 al25JPNxBA5aQAbHRnZHq13zBRxaycg97O40SVIYuH2D5zjKMlLoWvNtaMr5DvKUh0bLWBHbf
 4dFvCDSjtuxVvrw2HWCxr47L+4fY3Gb4QyPjc8SoCHxX8C60rcz0ka85Mx28Z05apvoatzxuN
 gu5Nd+GrxsjELfzB/I15KJGiCdgORo0JCK78M9rZyinj5+Hp0/+yTst6X5YlUbLSeS2VSN2LM
 kU9s8/geLaXWJGlUYPRtbVxunji/8cV3wbtqj4ut57FeC1xvo+OzMBHmuPHw1093rBnNt0VVY
 lSBwTIZrDWbt++1hTYc3EGLr2lkn3p3mW5GFKdgt8rkxJvVib6/gZ5sV6JjTEgD0VHIVwObpV
 Nhm9UNcjpfT1VJmmt2vrIhkCWNFoYyMssRnvVw7ecKC9DYrUZaR205mLeTav60T8I32c/ZVwz
 VO6d+/wKSZo2oICKrqTQcsHPhZ1UR3hwoiLHzyHExg+tLedIeVw8261DNrhOkYR31cY/v7xBI
 nAqbxfsRUOfFJcMGUv3qOHeJeN41vCohcp13bcPIpOJpSX+LCBjfE3URTTZZEbcR5k04Lmx60
 OsffGdhllv89C9BiUCK1b4NULkpJ64UikwJ4d4HJcmPcHm5rozd1YHuKWhi+itHrpn/2B3qJB
 qm8HWEwBpfqDmuss/BmnGHXSAfWWmq64IN2v9CYlYGiMRTOqQBcBpVZ/LcIq6v7EhPDnLGh5n
 zw3e0JLyfsQMcA/q0Li1Lc7xnuD/hlec6uceEnGB8cZEuS5Aki8pfLZ2F/nnxtH0hu0y9+U5+
 GiG5xMWxZBtjffQLAj4xO/gfgzni+MezMFWxmbKynnYFJrbQypyT7QoZE+zXLHOUddYABNqy+
 5UoFev5qmeNMgvZyuMvO9QYmPFNFzBhS7Gynmp4SSKONTpoyP+N97xrng==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Drop the ALTERNATIVE() instructions in the tmpalias functions for the
32-bit kernel.
Functions which use the tmpalias mappings to flush/copy/invalidate
congruently mapped memory need to always flush the TLB entry prior
accessing the newly-to-be mapped memory areas. This is independed if
it's a SMP kernel or not.  Otherwise the new memory mappings (stored in
r28 and possibly r23) won't get loaded into the TLB.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index b4c3f01e2399..1cc55e668fe0 100644
=2D-- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -565,10 +565,8 @@ ENTRY_CFI(copy_user_page_asm)
 	pdtlb,l		%r0(%r28)
 	pdtlb,l		%r0(%r29)
 #else
-0:	pdtlb		%r0(%r28)
-1:	pdtlb		%r0(%r29)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
+	pdtlb		%r0(%r28)
+	pdtlb		%r0(%r29)
 #endif

 #ifdef CONFIG_64BIT
@@ -705,8 +703,7 @@ ENTRY_CFI(clear_user_page_asm)
 #ifdef CONFIG_PA20
 	pdtlb,l		%r0(%r28)
 #else
-0:	pdtlb		%r0(%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
+	pdtlb		%r0(%r28)
 #endif

 #ifdef CONFIG_64BIT
@@ -781,8 +778,7 @@ ENTRY_CFI(flush_dcache_page_asm)
 #ifdef CONFIG_PA20
 	pdtlb,l		%r0(%r28)
 #else
-0:	pdtlb		%r0(%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
+	pdtlb		%r0(%r28)
 #endif

 88:	ldil		L%dcache_stride, %r1
@@ -840,8 +836,7 @@ ENTRY_CFI(purge_dcache_page_asm)
 #ifdef CONFIG_PA20
 	pdtlb,l		%r0(%r28)
 #else
-0:	pdtlb		%r0(%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
+	pdtlb		%r0(%r28)
 #endif

 88:	ldil		L%dcache_stride, %r1
@@ -904,10 +899,8 @@ ENTRY_CFI(flush_icache_page_asm)
 1:	pitlb,l         %r0(%sr4,%r28)
 	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
 #else
-0:	pdtlb		%r0(%r28)
+	pdtlb		%r0(%r28)
 1:	pitlb           %r0(%sr4,%r28)
-	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
-	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
 #endif

