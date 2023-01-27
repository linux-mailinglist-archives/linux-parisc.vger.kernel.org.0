Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC4367F08A
	for <lists+linux-parisc@lfdr.de>; Fri, 27 Jan 2023 22:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbjA0Vk0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 27 Jan 2023 16:40:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjA0VkZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 27 Jan 2023 16:40:25 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9462DE7F
        for <linux-parisc@vger.kernel.org>; Fri, 27 Jan 2023 13:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1674855604; bh=x1LPh78rm+2clPihexfJYXIz9tpFHbSUrQE86Xi6f2M=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=NQRX488YeaR+i2jppQXkDtICFVmxJXz54RWRaiB7ZuczMLwRDz7ezzzDkwp5EFv9w
         r5ifvgpn+GUpitlZSPXvl59SosJv//GIy7IjcuBDJPASUVUO5ckQDdIRmgqA0Iu8DH
         Nzn1cFynMf1YqyY53jUcOOHculUiLM8KxyWJzYcsFxK+psxwibidYWWv7FEkebrKtH
         n4MT80S+udUIjBA6PISDv6f4yiLFFRozgzNba9n+sx5hGPcFyshHx6enYFNJJuT4nV
         xRsM6YitecdU6VInF6RLNPR8k+qAi2fD96lU2DKmc7E7BYY+ViO4d+Y8FveSY7oVdT
         lNtvU1uy2r27Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.191.252]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9MpY-1oY8oK18K4-015Fk2; Fri, 27
 Jan 2023 22:40:04 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Matthew Wilcox <willy@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Ira Weiny <ira.weiny@intel.com>,
        "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] parisc: Ensure page-aligned addresses in cache flush and copy functions
Date:   Fri, 27 Jan 2023 22:39:41 +0100
Message-Id: <20230127213941.83967-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Al6OSOlGSFIJwVDfC+jLZMWmFgYGtbifICs+rjgF0T23GrFMpw2
 2sBDs0CA7pQIYpzsKWdGYuqiDWu/wedIIGgMftfeeOOgkPXQjLnnd/5jAcaE67I1w5YCHwP
 paJkb1w6xWSt32r92XJJB1OxDCsb6MNtd1WV0DkvWv86oa9yCpIJL+wf/SaaF0cAwFrM1Xs
 bj00BeAdXMVgKzUNokFFg==
UI-OutboundReport: notjunk:1;M01:P0:msfu4uaHqe0=;sjSshdWp75IaAEkgVkVlG1SWoom
 143VBxXRo21HJ5LtSoihl2cBlbbCq8AlDIQJ+bEEALFHru+Fhl9qik5I5eQHUUCWvM+c5RfSf
 9HG8neGsp9ttXcjmsxhlQd4M4UTAyByrRNT8q5zofrwvNQDDX474Yzs08kNnqcE3SxKMkyo9b
 iey9zM6T1thu+rvG+D87fDOpULnYC2MT2L3i6k/MMYxqH4ofuvZDuV92NAtjS8KQdMazO0B5m
 HALzE0OVoBogm00dQrr+XDGf/34+2QgYUGoQeYBAhapxch4QRQGVFPIS6Ti3jPCkZkowKxDJU
 QuJXEuZblx+ImGGnb/OkGOeKdJj0QzHE21latS1shaX9ntWPq+wspmoUDOdqRfaQpg8lFVERz
 yPRQEUEdsHxMox4QTKYuzRVLqAdH9QrYofcvQ/fsICpXptS4FV4ZnW6k2gxttiVV9TIs/QPvi
 Elp5Nh/sQySRvTdCamAgbt3ZXKld9kan6XzNKhAFkBcvbPrJABvemrr3cO2hFUfqszkgCPQO4
 rpQJm/reOnMBQyck7ggNrftFTOnfQzcbyQHpcenQyhlm2tg+QQX8VnqccV7tMzhgkJfqrVWXO
 QJ1KdKMXSdtAEq09pKCrjzydUDzUSdMag0LELgmOqHdVC1Hkj9tcLjNjlc/r29miB2/WyUlin
 7tAg11dWBw0uCRqrm/X9nxWPKJDx2Eo+QfEr4CEeuYkY/sEV6OakW9kEORn8cuNTkDsnmp3f3
 0xfxZCdtuKRh3vgs/myur8c4FULfS4GeJVp1Bmej5pGbDgvXjgqd+nZ3ZpKKQX+X50Nlq6+Vo
 yBO4Ed22cL+Xw/fLpUPSUIoh8VRb75juUF0GbBzDvLBpLEN9xwO259/SnuehjBErZroetCG7s
 w2YThxQHSV7F1UlvhxPwbAiU9Aq99Yn2ZMCMjWzch+zx+TfqJUoT9bmURnOlMSt3IoOCzgrPb
 Giw60s879A3lfEOwBhwN8M5WEoA=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Matthew Wilcox noticed, that if ARCH_HAS_FLUSH_ON_KUNMAP is defined
(which is the case for PA-RISC), __kunmap_local() calls
kunmap_flush_on_unmap(), which may call the parisc flush functions with
a non-page-aligned address and thus the page might not be fully flushed.

To prevent similiar cases, page-align any given address in the
following parisc low-level calls:
- clear_page_asm(),
- copy_page_asm(),
- copy_user_page_asm(),
- clear_user_page_asm(),
- flush_kernel_dcache_page_asm(),
- purge_kernel_dcache_page_asm() and
- flush_kernel_icache_page()

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Fabio M. De Francesco <fmdefrancesco@gmail.com>
=2D--
 arch/parisc/kernel/pacache.S | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 9a0018f1f42c..b59c55fc35e9 100644
=2D-- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -310,6 +310,8 @@ ENDPROC_CFI(flush_data_cache_local)
 /* Clear page using kernel mapping.  */

 ENTRY_CFI(clear_page_asm)
+	depi_safe	0, 31,PAGE_SHIFT, %r26	/* Clear any offset bits */
+
 #ifdef CONFIG_64BIT

 	/* Unroll the loop.  */
@@ -373,6 +375,9 @@ ENDPROC_CFI(clear_page_asm)
 /* Copy page using kernel mapping.  */

 ENTRY_CFI(copy_page_asm)
+	depi_safe	0, 31,PAGE_SHIFT, %r26	/* Clear any offset bits */
+	depi_safe	0, 31,PAGE_SHIFT, %r25	/* Clear any offset bits */
+
 #ifdef CONFIG_64BIT
 	/* PA8x00 CPUs can consume 2 loads or 1 store per cycle.
 	 * Unroll the loop by hand and arrange insn appropriately.
@@ -525,6 +530,9 @@ ENDPROC_CFI(copy_page_asm)
 	 */

 ENTRY_CFI(copy_user_page_asm)
+	depi_safe	0, 31,PAGE_SHIFT, %r26	/* Clear any offset bits */
+	depi_safe	0, 31,PAGE_SHIFT, %r25	/* Clear any offset bits */
+
 	/* Convert virtual `to' and `from' addresses to physical addresses.
 	   Move `from' physical address to non shadowed register.  */
 	ldil		L%(__PAGE_OFFSET), %r1
@@ -662,6 +670,7 @@ ENTRY_CFI(copy_user_page_asm)
 ENDPROC_CFI(copy_user_page_asm)

 ENTRY_CFI(clear_user_page_asm)
+	depi_safe	0, 31,PAGE_SHIFT, %r26			/* Clear any offset bits */
 	tophys_r1	%r26

 	ldil		L%(TMPALIAS_MAP_START), %r28
@@ -889,6 +898,7 @@ ENDPROC_CFI(flush_icache_page_asm)
 ENTRY_CFI(flush_kernel_dcache_page_asm)
 88:	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), %r23
+	depi_safe	0, 31,PAGE_SHIFT, %r26		/* Clear any offset bits */

 #ifdef CONFIG_64BIT
 	depdi,z		1, 63-PAGE_SHIFT,1, %r25
@@ -925,6 +935,7 @@ ENDPROC_CFI(flush_kernel_dcache_page_asm)
 ENTRY_CFI(purge_kernel_dcache_page_asm)
 88:	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), %r23
+	depi_safe	0, 31,PAGE_SHIFT, %r26		/* Clear any offset bits */

 #ifdef CONFIG_64BIT
 	depdi,z		1, 63-PAGE_SHIFT,1, %r25
@@ -1125,6 +1136,7 @@ ENDPROC_CFI(flush_user_icache_range_asm)
 ENTRY_CFI(flush_kernel_icache_page)
 88:	ldil		L%icache_stride, %r1
 	ldw		R%icache_stride(%r1), %r23
+	depi_safe	0, 31,PAGE_SHIFT, %r26		/* Clear any offset bits */

 #ifdef CONFIG_64BIT
 	depdi,z		1, 63-PAGE_SHIFT,1, %r25
=2D-
2.38.1

