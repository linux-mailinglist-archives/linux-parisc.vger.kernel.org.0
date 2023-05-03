Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCA36F5B5B
	for <lists+linux-parisc@lfdr.de>; Wed,  3 May 2023 17:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbjECPiB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 May 2023 11:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjECPh6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 May 2023 11:37:58 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1216B6EB3
        for <linux-parisc@vger.kernel.org>; Wed,  3 May 2023 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1683128269; i=deller@gmx.de;
        bh=28R7v3abADI8wGmxRAFQRmDO8WgMq2n5VXD4P+RTJrI=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=R9OnJ0no2PTRsWOgb0/QkD3aT6ufXF3Gx/uLUFkkf/Ra++KvFazX3mOYHiWcZu8ik
         efycmQN1q8Jbx1k1cJ0DcDqhRLtYzdW/XMHN21nbqLbIBpU1mU2sjAQVmBs+nxtfaa
         SfG5UzfFD6Z3udC4ea9YX43B/7E9I2Z7b+tzS/5SX8z/Ui4//JxHkHASWF7Q7O2aM+
         6sNav7Z3LpPgdO0avLEQJaObf2yXteYuRuV0M2TRy3KC1TmDc4FNTvLJmtcpPSE8oo
         1oxxRXuG9xVNi4j7RxtHFlzVU/u01sjmf9Kvhd7lTlxqt//wd1CPy/EYv+gsN+Llwh
         +yZJrCfl22oFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.144.191]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLQxN-1pcHtO0UJn-00ITV4; Wed, 03
 May 2023 17:37:49 +0200
Date:   Wed, 3 May 2023 17:37:47 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Fix argument pointer in real64_call_asm()
Message-ID: <ZFJ/ywb9UrLa/e14@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:HtHpWDEG0TIIB5rp7+YOpKRvtujVimMQ9WgF+VDeJlTg19S2WgO
 c4qDehKoKgv+ckPDeBCa09EIjj3v09R9Z4eK0r2CMHVOLUW9uVPaqp2sIsKdQ8SyTR3NFWy
 TahoGpOw1ZY0YVm/3WO6SsgSbTOQEZvg2d2jmOB7InIBY2Uaab2SvFmsSaXlTimQdYStClh
 tzemUtlE8whfFLCQKvsEQ==
UI-OutboundReport: notjunk:1;M01:P0:g/HhYmRISHQ=;3NXFWOGdHhTk0UdW6vN4CGmLEfm
 icwOrM3hAp5EXtHX55KSmoAbd3GC7i0TNYbySuejzCxNH2iPy7hMT2Jr2q7ZIC/e+kX3UE1NY
 XNIbaIFNndQOScoVcrET/piMr/odsnNPEK2LSb/jjHSx+3sWy9axyQq7sQcUT2t0uN9A9OKo1
 2DqDQ0yKROb5FaAJDbp2uQ0doreOxXstgnv/65Nh3oSqSjWglapaG8/3Ep01cmX2p6iwEp/IZ
 hHwBVvhpJGeicMR5QFwePxjVHiCtborlabS2ciAREPKVXJHaV0a4xtTwqNkR4RL1YzoGRGdGE
 8ZRJrwPjIoMLyoACSJm38sCAZvrNUy7/2Co4Zg+q3avnsWpPiENwxigPEMywDvgx5mKgTYas0
 9WpUfZ+RqBSb+iaKuGGyYa885V0D5FTaFELOXta87JqDm9YN1mFEsfOsNtmt/8lfwvZ2i/tbh
 5fNfsDWq9i7KWV1zDvoz+1b8IBgqfhmuu/GUSaHL/s6wp6jwti4q1J3lzIa1wwCpERs6AoslP
 ua7J4GFh1bU6PMLt8+4hp6Ye/DkYcAwCGxXrijP1sRNTNbK5voqQxVBqfKGN7E+ZbbpqUcVbx
 c3WDtAaUQvBLZIfQGGqxnCQH0yNK/dxJD2GNXBXsodfL2JnmKCWhfSPUc8RYZGF79lxwllwsX
 0gzirr47m6L+5+dMUmMyEn3APQq2pgQyxgJEO6VyU6a8y1vo653gKwaABQoiwTPgC+iIzjM6v
 OTtaF8aOWdyPDMBEQdvK3IW1q6Vp6UGGVUMdyIYG9osITyepidrf6xLj1EQ2OnXNjB6wWe8cQ
 /o91rCJ0QCA1E3SF7bvl8T+ZoGjIUWwj+p6ZBeE0demwpoSqaE6IgoPpZlpjra7cTovNSE387
 a3DlVoR/IKY6BTXLJzR95Tv60ceY9azaeBw01TlH2vlknUMo4mza9K99WbheX6mK6NLAT+XOq
 Wvtx+YB1MOCy3qUvJTXj4TuqIe4=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix the argument pointer (ap) to point to real-mode memory
instead of virtual memory.

It's interesting that this issue hasn't shown up earlier, as this could
have happened with any 64-bit PDC ROM code.

I just noticed it because I suddenly faced a HPMC while trying to execute
the 64-bit STI ROM code of an Visualize-FXe graphics card for the STI
text console.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org>

diff --git a/arch/parisc/kernel/real2.S b/arch/parisc/kernel/real2.S
index 4dc12c4c0980..509d18b8e0e6 100644
=2D-- a/arch/parisc/kernel/real2.S
+++ b/arch/parisc/kernel/real2.S
@@ -235,9 +235,6 @@ ENTRY_CFI(real64_call_asm)
 	/* save fn */
 	copy	%arg2, %r31

-	/* set up the new ap */
-	ldo	64(%arg1), %r29
-
 	/* load up the arg registers from the saved arg area */
 	/* 32-bit calling convention passes first 4 args in registers */
 	ldd	0*REG_SZ(%arg1), %arg0		/* note overwriting arg0 */
@@ -249,7 +246,9 @@ ENTRY_CFI(real64_call_asm)
 	ldd	7*REG_SZ(%arg1), %r19
 	ldd	1*REG_SZ(%arg1), %arg1		/* do this one last! */

+	/* set up real-mode stack and real-mode ap */
 	tophys_r1 %sp
+	ldo	-16(%sp), %r29			/* Reference param save area */

 	b,l	rfi_virt2real,%r2
 	nop
