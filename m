Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D673227F6A
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Jul 2020 13:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgGUL5C (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Jul 2020 07:57:02 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:52742 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726715AbgGUL5C (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Jul 2020 07:57:02 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20200721115701.COJQ3628.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 21 Jul 2020 07:57:01 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm01.bell.net
          with ESMTP
          id <20200721115701.VIKW130487.mtlspm01.bell.net@[192.168.2.49]>;
          Tue, 21 Jul 2020 07:57:01 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Use ordered store to release TLB lock
Message-ID: <81ff8f16-2ff5-195a-b6d5-d7e3c970d097@bell.net>
Date:   Tue, 21 Jul 2020 07:57:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=I5Mbu+og c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=vnb7Cp-KJIcyRseRx_8A:9 a=07P7QILKgRbsllDL:21 a=5bWP7eyjuhY8FhFe:21 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfPN8AlgZRTqsylDsNMqf6aOo/X0DNtFPpf0lGCsU8NHiwRfhBOMP07rtDly1dmXVHMjOlEY2MROcv6CcdNUFv7mDPSKONFCZ9dmqumQN6YqYvE3MYa6D gsnbX2T258m4qNjTleby+pWg2IeBMQ/q6mV8jNBIT7rTfDr5SpmyI1j+gAzSgws0ce+dZcjUD8qNMw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The LDCW barriers in the tlb_lock and tlb_unlock0 macros can be removed.

In tlb_lock, the barrier isn't needed because there are no prior accesses to be concerned about.

In tlb_unlock0, we replace the LDCW barrier with an ordered store.  This ensures that all prior
accesses are performed before the store is performed.

Signed-off-by: Dave Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 4b484ec7c7da..60b966b29d6c 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -454,7 +454,6 @@
 	nop
 	LDREG		0(\ptp),\pte
 	bb,<,n		\pte,_PAGE_PRESENT_BIT,3f
-	LDCW		0(\tmp),\tmp1
 	b		\fault
 	stw		\spc,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
@@ -464,13 +463,16 @@
 3:
 	.endm

-	/* Release pa_tlb_lock lock without reloading lock address. */
+	/* Release pa_tlb_lock lock without reloading lock address.
+	   Note that the values in the register spc are limited to
+	   NR_SPACE_IDS (262144). Thus, the stw instruction always
+	   stores a nonzero value even when register spc is 64 bits.
+	   We use an ordered store to ensure all prior accesses are
+	   performed prior to releasing the lock. */
 	.macro		tlb_unlock0	spc,tmp,tmp1
 #ifdef CONFIG_SMP
 98:	or,COND(=)	%r0,\spc,%r0
-	LDCW		0(\tmp),\tmp1
-	or,COND(=)	%r0,\spc,%r0
-	stw		\spc,0(\tmp)
+	stw,ma		\spc,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	.endm
