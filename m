Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF03C639845
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Nov 2022 22:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiKZVgc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 26 Nov 2022 16:36:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKZVgb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 26 Nov 2022 16:36:31 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4179815A31
        for <linux-parisc@vger.kernel.org>; Sat, 26 Nov 2022 13:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1669498588; bh=8Pqz5GZcASWHUgvyzpvmBnO9u2bFvDs+KHbSHJPd0Gs=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=hmgho+D6BICPkViER7x8f2oh+KG3+9PV74Xamf8bWqoiry522/q1SsAdexffIw2S0
         FhaCmTcLGJsRHhQXUg4g613IRrU4vRp9F+kyT/I1t6zGB9m9MuHOrC2PKwvwfSCuXI
         9GRJU2EQ+O4hpLuFv04nu/eHrdCF14Zoc3CPFgb8rePIT1/gJ0jVSktXzU6xQcY7t3
         +On5ZpsEoXElul9atCWCsvrPF0eMsQa3U/IWpRoL5f07RZQ0ayZMVJEjIovj1EVNA3
         82T3ODE9RezFXv0AIdFEwbNA2OG/ln+5aSNpa2aYuEotUXVqpRsHIFpkWNnvLC6Nbq
         7qvbQqNxLhi6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.155.181]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHGCo-1pCIOa284e-00DCcE for
 <linux-parisc@vger.kernel.org>; Sat, 26 Nov 2022 22:36:28 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 2/4] parisc: Merge hpmc_iodc_buf and iodc_dbuf buffers
Date:   Sat, 26 Nov 2022 22:36:19 +0100
Message-Id: <20221126213621.363838-2-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221126213621.363838-1-deller@gmx.de>
References: <20221126213621.363838-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bOp/mAqyyCf00Pe/LmW2+zJgAr44pBGeHgXmBmQo0qgUkvDk6TP
 zQYQRR7MuKlVE4noS6mOTaGBpKW8O93Yl6QfNhxnm6H6uyH6cYyUBofC50ZE/LLS6LLVncI
 Jb9Ctf96J7U6XG50K9UOVR4oSrHSps6brX/z/PH3sM+mwpJy/V21ls2/kl6oFJJRRWlxE6V
 OOr4QTdqpp0Bm2eunyOKQ==
UI-OutboundReport: notjunk:1;M01:P0:IdDRobh6pgA=;gZaWQx+LMhlNlOFhg97gLpEqkXx
 pYrfC0muUN+hruMwlwxF6pwxz1KTGu8dfInNRtp945C2Z/QM1V1DKV3nJRM7RbzSYbpQK0WnH
 RDVmPXFf3C4mfFO/OEr3EjGbNwFS3AFP7vy1wiysgmgdHoITFpuNqjsv6bOybL/IMOvfXlwWM
 Mt7b/2KDack+A3oWTGMToiheZqC6LSaDTqA4ZSPA1Xh5sbwTeGdop37xEEGU/jTf7j0tPZUpm
 19IVzzCNdkoyP+PM3viGC7lnprv2MEtSRIBN5lUwMhiF8EYAh2Hqx8js4B9T7nP9BHXWKW5RQ
 60PNpGPvys5JfuQndcqqu/C9LF1f5b2unguPHw9fv0qQ2P8RFzKbmp+Lhm191c4eMFcDJj85H
 2QyVjIQ332jP7sWzSxMdX0xXHT5ES9oAuZNXJnZGqzuQapzpdyx84pT4vqk3ww9ioymaIE7l6
 aj/PWCtLC6+kwdT4yHYURh8BMSIAsyVKCFKknWro+HYFQokajat98lyj79nyTLCJE9RTq2tbG
 CzNu5wZvyFmZraxNG7c0U2yrUcMRuijvW8Ta4ytP5G7rTfI1IBX1DNFHuuGGovhgt4tmUL/a6
 fv83xEkWUjvADH0pwu8jDIs/nG1CwYzglZyb6M13pFMinbmQio4zEdBXoaZ++2U/U050z2jEB
 AMJrhDExNq7AN74AVIfXXbY7zp+LfIuGFsXJ8xclVw4+FZtWS5FE8KtzRIfN/IVV5qAoR1Zyy
 t5l5HPyRFNZ2/ha63apsbAp/gwLY0CkFQuOxI5ombAlz1IxuQf9FBlGHDHuEp83WAapKOtNLX
 neCtR0fj/y6HghvQ46H9YmvViW77k7zk8ogZK6ICPh/i4iRrum71KZ3KMN9nSRLWx4eK9wwd3
 EpMwu6NFSjbES4Uer/P1SKCFzxHxU5px6vJTcrBsIZ6H6kvs8n/ZUuLqFpdN2iP3Z/HEaSyBP
 Os2qJSeEQ6uHP49KFNFWjK6PeVI=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The HPMC handler can share the IODC buffer with the various firmware
calls.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/hpmc.S | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index eb2e4bd67035..1dc85e963a17 100644
=2D-- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -44,15 +44,11 @@
 	 */

 	.import toc_stack,data
+	.import iodc_dbuf,data
 #define hpmc_stack	toc_stack	/* re-use the TOC stack */
-
+#define hpmc_iodc_buf	iodc_dbuf	/* re-use IODC buffer from firmware.c */
 #define HPMC_IODC_BUF_SIZE 0x8000

-	__PAGE_ALIGNED_BSS
-	.align 4096
-hpmc_iodc_buf:
-	.block HPMC_IODC_BUF_SIZE
-
 	.section .bss
 	.align 8
 hpmc_raddr:
=2D-
2.38.1

