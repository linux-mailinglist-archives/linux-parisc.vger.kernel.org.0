Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E5945611A
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Nov 2021 18:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbhKRRGy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 18 Nov 2021 12:06:54 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:17272 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S233833AbhKRRGx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 18 Nov 2021 12:06:53 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C893820C27919F
X-CM-Envelope: MS4xfOhN0l5zU5o/Y85H8cgtioZmBaTMdomW88AY8yNqxUZbAusaGhGa+i4aUFg6+qwq/eiCb5EcfEEDjbSCmMTWjbnIL0XweweRQLv2G2kHRdSyXkZFkaWX
 4wWGOV1Mig1vBYin+/euJhI3J/C0hl2uk4YmEIohPZdC3Jkr3NJ+gj0+TOjDrRx44TafTSxDQzqxg81DtKKdsJ3S+pie0vFJeRX/UKsY6HTIrCCj5p3flPqw
 5jC9w0glVkOfR7OJ2ls7z8gaeJf1U/Gp3NBO7v839XOXMTeN9CuhStcgl8/RVHhomAHR/OkfF09AS4ZtRtMyb19pyQz0zIhDi8bKKwLdKSo=
X-CM-Analysis: v=2.4 cv=Z6GPoFdA c=1 sm=1 tr=0 ts=61968777
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=Kwnc-WHG4ZdyuC3YzfUA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C893820C27919F; Thu, 18 Nov 2021 12:03:51 -0500
Message-ID: <df51e873-4576-d4c2-7d86-b607cbb714b4@bell.net>
Date:   Thu, 18 Nov 2021 12:03:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix extraction of hash lock bits in syscall.S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The extru instruction leaves the most significant 32 bits of the target register in an undefined
state on PA 2.0 systems.  If any of these bits are nonzero, this will break the calculation of the
lock pointer.

Fix by using extrd,u instruction on 64-bit kernels.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 3f24a0af1e04..3f70528622eb 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -572,7 +572,11 @@ lws_compare_and_swap:
  	ldo	R%lws_lock_start(%r20), %r28

  	/* Extract eight bits from r26 and hash lock (Bits 3-11) */
+#ifdef CONFIG_64BIT
+	extrd,u  %r26, 60, 8, %r20
+#else
  	extru  %r26, 28, 8, %r20
+#endif

  	/* Find lock to use, the hash is either one of 0 to
  	   15, multiplied by 16 (keep it 16-byte aligned)
@@ -762,7 +761,11 @@ cas2_lock_start:
  	ldo	R%lws_lock_start(%r20), %r28

  	/* Extract eight bits from r26 and hash lock (Bits 3-11) */
+#ifdef CONFIG_64BIT
+	extrd,u  %r26, 60, 8, %r20
+#else
  	extru  %r26, 28, 8, %r20
+#endif

  	/* Find lock to use, the hash is either one of 0 to
  	   15, multiplied by 16 (keep it 16-byte aligned)
