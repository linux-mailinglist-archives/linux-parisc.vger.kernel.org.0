Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74DD447C804
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Dec 2021 21:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhLUUEz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Dec 2021 15:04:55 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:12784 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232227AbhLUUEz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Dec 2021 15:04:55 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C2292400016716
X-CM-Envelope: MS4xfJg64JlwYxMAi0yNTzzPVpuVb9DBN3a7UhBdQbkaScLLPoEWvUmXlL/4ZYXj87duS/xA+kV8Pbus/zA0VsBv3hRIBvY7cmgRxoVH7ync/+62q1LAHv8w
 UhjKZnbvXBlgyq5a8zQA2TOcRU67Vl5ILv3c5+U9c0g3YGcCH1yYHwxY/ucM5VP29cE+duDUCRNWuJ35lx4yakkIrYEjU4W0L7bRHsGbD2B8FcXEbn3NSoEv
 1XS/yNIDmv1DfkVsum1i3p765NgG0nUoIVsQSdXXttrG3veByNuleLSPd1V+JYSO7+mNTCIhF46G9pT8kuDXn1uHJbpPlNyhpRk6cZgVnSq3a+Cne1j8pwZu
 3Aj0Hb6Z
X-CM-Analysis: v=2.4 cv=WtFIjfTv c=1 sm=1 tr=0 ts=61c23365
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=hbwb_EJG5dVUYnIWg3AA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C2292400016716; Tue, 21 Dec 2021 15:04:53 -0500
Message-ID: <17bb5945-3d04-2eef-5413-7ccde0b3b4b9@bell.net>
Date:   Tue, 21 Dec 2021 15:04:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Define depi_safe macro
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Define depi_safe macro.

The depi instruction is similar to the extru instruction on 64-bit machines. It leaves
the most-significant 32 bits of the target register in an undefined state.  On 64-bit
machines, the macro uses depdi to perform safe deposits in the least-significant 32 bits.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
index 6d13ae236fcb..6369082c6c74 100644
--- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -158,6 +158,16 @@
  #endif
  	.endm

+	/* The depi instruction leaves the most significant 32 bits of the
+	 * target register in an undefined state on PA 2.0 systems. */
+	.macro depi_safe i, p, len, t
+#ifdef CONFIG_64BIT
+	depdi	\i, 32+(\p), \len, \t
+#else
+	depi	\i, \p, \len, \t
+#endif
+	.endm
+
  	/* load 32-bit 'value' into 'reg' compensating for the ldil
  	 * sign-extension when running in wide mode.
  	 * WARNING!! neither 'value' nor 'reg' can be expressions
