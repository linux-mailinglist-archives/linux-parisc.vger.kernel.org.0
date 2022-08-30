Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9115A6A5E
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Aug 2022 19:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbiH3R2K (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 30 Aug 2022 13:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbiH3R1j (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 30 Aug 2022 13:27:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73884DFC9;
        Tue, 30 Aug 2022 10:25:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D3504B81D15;
        Tue, 30 Aug 2022 17:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960D7C433D7;
        Tue, 30 Aug 2022 17:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661880234;
        bh=9BUB6F8qHCVRmkkXwqJ9eg/dFaiKKeYVazMEdqCcvko=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e+C3uUTKjJWPEc1Yh3MLWKewRkfwOaz3fOlBmVZ+6bEy5MW1r0kP1ruoQMTk7LvTo
         SY1Ar3z5s/RvImNgHxmswXvFK4Q+WqKNeUFMhy6pJMTItx1EMGdDzitchBhj7GvuUy
         h9oF409pP2vOXt/CHfVrfSt2S7h/aJ5sc364PiVZ9CZ4Gd17dSRig0MDIfx0//e1sl
         0Pb7M8tMqTnrgo5Lj/M/ht+Wx7nKC0Vm1RMmR9UW1b0JAWKZJf/5IMgJKH6/pgsGAs
         9JgJ5VwWJZ1pKk2GHgP+aiH5kj7qEGvVl5XdoOolW6OcFkxe5u4swg7ikkddGdeFOP
         JAl0WPsKZF6Bw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Sasha Levin <sashal@kernel.org>,
        James.Bottomley@HansenPartnership.com, svens@stackframe.org,
        linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 09/16] parisc: Add runtime check to prevent PA2.0 kernels on PA1.x machines
Date:   Tue, 30 Aug 2022 13:23:10 -0400
Message-Id: <20220830172317.581397-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172317.581397-1-sashal@kernel.org>
References: <20220830172317.581397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

[ Upstream commit 591d2108f3abc4db9f9073cae37cf3591fd250d6 ]

If a 32-bit kernel was compiled for PA2.0 CPUs, it won't be able to run
on machines with PA1.x CPUs. Add a check and bail out early if a PA1.x
machine is detected.

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/parisc/kernel/head.S | 43 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index aa93d775c34db..598d0938449da 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -22,7 +22,7 @@
 #include <linux/init.h>
 #include <linux/pgtable.h>
 
-	.level	PA_ASM_LEVEL
+	.level	1.1
 
 	__INITDATA
 ENTRY(boot_args)
@@ -69,6 +69,47 @@ $bss_loop:
 	stw,ma          %arg2,4(%r1)
 	stw,ma          %arg3,4(%r1)
 
+#if !defined(CONFIG_64BIT) && defined(CONFIG_PA20)
+	/* This 32-bit kernel was compiled for PA2.0 CPUs. Check current CPU
+	 * and halt kernel if we detect a PA1.x CPU. */
+	ldi		32,%r10
+	mtctl		%r10,%cr11
+	.level 2.0
+	mfctl,w		%cr11,%r10
+	.level 1.1
+	comib,<>,n	0,%r10,$cpu_ok
+
+	load32		PA(msg1),%arg0
+	ldi		msg1_end-msg1,%arg1
+$iodc_panic:
+	copy		%arg0, %r10
+	copy		%arg1, %r11
+	load32		PA(init_stack),%sp
+#define MEM_CONS 0x3A0
+	ldw		MEM_CONS+32(%r0),%arg0	// HPA
+	ldi		ENTRY_IO_COUT,%arg1
+	ldw		MEM_CONS+36(%r0),%arg2	// SPA
+	ldw		MEM_CONS+8(%r0),%arg3	// layers
+	load32		PA(__bss_start),%r1
+	stw		%r1,-52(%sp)		// arg4
+	stw		%r0,-56(%sp)		// arg5
+	stw		%r10,-60(%sp)		// arg6 = ptr to text
+	stw		%r11,-64(%sp)		// arg7 = len
+	stw		%r0,-68(%sp)		// arg8
+	load32		PA(.iodc_panic_ret), %rp
+	ldw		MEM_CONS+40(%r0),%r1	// ENTRY_IODC
+	bv,n		(%r1)
+.iodc_panic_ret:
+	b .				/* wait endless with ... */
+	or		%r10,%r10,%r10	/* qemu idle sleep */
+msg1:	.ascii "Can't boot kernel which was built for PA8x00 CPUs on this machine.\r\n"
+msg1_end:
+
+$cpu_ok:
+#endif
+
+	.level	PA_ASM_LEVEL
+
 	/* Initialize startup VM. Just map first 16/32 MB of memory */
 	load32		PA(swapper_pg_dir),%r4
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
-- 
2.35.1

