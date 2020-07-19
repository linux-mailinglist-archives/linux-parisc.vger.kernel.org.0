Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238FE225398
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Jul 2020 21:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgGSTBG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 19 Jul 2020 15:01:06 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:60758 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726009AbgGSTBG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 19 Jul 2020 15:01:06 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20200719190105.GSKU6697.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 19 Jul 2020 15:01:05 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20200719190104.BRLB29322.torspm01.bell.net@[192.168.2.49]>;
          Sun, 19 Jul 2020 15:01:04 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add alternative patching to synchronize_caches define
Message-ID: <b6e3a223-45e1-18ff-2ce0-c511459d0f0c@bell.net>
Date:   Sun, 19 Jul 2020 15:01:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=XvWExmN9 c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=YRsaYXqy0Nc14qJfRmkA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfLc0U3OwkIfXPO+L/jtLVINsstm5VvDh/0GWzTUzXrUVFhurDdJypJLw7Ggi+vWGixY2m5bNoa0sSUjUt+XO1BRfn4Q0rbG1SbCp0RJ0ltR4DKtITqwD yp+FSAPBjIvSereVzlgO9pXfatmD0D8yNYr+y4Ge4VtgqymcjDPo7vilduZQc10GmHRmgjmJDRujJA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This change allows the sync barrier instruction to be patched to a nop.

Signed-off-by: Dave Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/barrier.h b/arch/parisc/include/asm/barrier.h
index dbaaca84f27f..c3f5d567971a 100644
--- a/arch/parisc/include/asm/barrier.h
+++ b/arch/parisc/include/asm/barrier.h
@@ -2,11 +2,15 @@
 #ifndef __ASM_BARRIER_H
 #define __ASM_BARRIER_H

+#include <asm/alternative.h>
+
 #ifndef __ASSEMBLY__

 /* The synchronize caches instruction executes as a nop on systems in
    which all memory references are performed in order. */
-#define synchronize_caches() __asm__ __volatile__ ("sync" : : : "memory")
+#define synchronize_caches() asm volatile("sync" \
+	ALTERNATIVE(ALT_COND_NO_SMP, INSN_NOP) \
+	: : : "memory")

 #if defined(CONFIG_SMP)
 #define mb()		do { synchronize_caches(); } while (0)
