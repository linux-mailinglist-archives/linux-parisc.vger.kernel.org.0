Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 268554B7703
	for <lists+linux-parisc@lfdr.de>; Tue, 15 Feb 2022 21:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242516AbiBOT4r (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 15 Feb 2022 14:56:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240057AbiBOT4r (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 15 Feb 2022 14:56:47 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E511AF22
        for <linux-parisc@vger.kernel.org>; Tue, 15 Feb 2022 11:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644954988;
        bh=x989vg5iy1YKa9KkiMqT8mlN4m6rRuJ45DUaGrByiiA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=HSR5iMQ3jkCbGbCgGGhqSrUuniLdiYP0fvoom+jmLmov/XMXjhZN8zBFGQbZ33d84
         1/9PSBucaLCQfYJCtkFRPGtEc3OzfILGBtzeFytCJs9FwpNUSTJVENPs1qHdjoOzT6
         6vvYGh+LL8Gy7WNHR57RxhmgRXuiEbEFfLKNyObo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.185.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wpt-1oHywH2iDZ-012EQN; Tue, 15
 Feb 2022 20:56:28 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Always use the self-extracting kernel feature
Date:   Tue, 15 Feb 2022 20:56:27 +0100
Message-Id: <20220215195627.179576-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jrE0Ts8l4eXuOBe+9zmVOyXpxLZ4WhPGh85q2HmP/tMiRAsSxFc
 IICbu6k94iqZnUTfW5KmnN1a5O9zfhtWvYNdvVW+CN3C8ivoFpRRBGdMfFtNU2hiArrT66Y
 VLOU9/GDucuFNxQd6fErpyaiRa79VqhEBaXhdM/KXU+nZzymKlCaAy3T6KOjRVwsEqOL+B4
 +E7tokQ6cpis+86CSBt7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nb7FfEKKMd8=:QB3JDO6NcUSNyezugZiJuF
 QQfh7BPaG1VWrXyZ/YMUT9Q/aEP7ugBvWIS/ZJEwI5tT3vbtobRzu6MmUI3JhGO0B22/nY+XL
 bBSqAseHXcCTf3rWUOGIcZ97ZqGgMLJujEu8h+BWNzMJB7LW4FrQoWTLMWAuTWpghumxXf4lc
 30zj6yFA8Oqggp4u8hwuRifAms4qX657I140e1Vx8/3Y3ucJveJbwvfhQvVf+n12P1rYJGqZH
 CpWI0CzAvILekuN+c9qwvLiDQs1dmyY5R0RlBgIHSfacgZFsx5JmKkuZCFOCfLmOjfDqed412
 93viabpZFuiARCKJsBvXGujfynzhetaaRilld7mvn74DidEhkEAD4KnshZEj60SVa/znZS3pv
 SCuuim/M0plYrvNS8/uqTjYyqGGLGFYRWTDWf8Z259KQtAPQJJsjHK58qcxK7txSQyqzprqO4
 yrh1sYWZQkNxDwiamDMbrLjP7Fy0tHY1nJwYCUPumpuUXrCXv0wKW3/wm+hBEGJq7t0jVG6xJ
 KeEiO7+QAGkCyWEwOJWMy8Q1dExgw6IxaphuSuuBIKSeREcr6JflUNxn7DobIKWt32Rb9Xk82
 WN1t/YZT9LhQYsSMEM/YDBxZtgC++dL+huDNuRHCxvIbJttd+yj8SvYkP6H1woaCyqokweJBp
 WioF7dinQ2ORAmKolmP/RmE47Iehm011LN241gc+uUbgiLRs8f3z6TRtQBb9b5NqLyt48rAQG
 PtyTdnSQYH/vzRX/G1zsb/VGtzr9Hk/u14tzNf8zgQcW0ZEdQyG9urWqUJ/XZz0c4BLCFLnEh
 vH7iarIHzTMTl2W9LDlQNpnA3fdwB+lDCMf9Q+M88k/j6UVBE2MAd+kah/sY45Ix9zOp+99tN
 UrBWo+5RxVn1H1ilRSyJO0jBBwTO0qJqj3veRUTtc8uocRs66k8zlsdNF/aF6EnNXpzCqQ5U+
 FE+325jBm3SNeJcEkTnjmhahMNVckukXb4c791nOcC1cVs0J4gSP7cZKYCFarVEW0UvrHNS8+
 JY8WgeHiQ+yYhsMHPv2MUu01C5tZw77i5ODV0OtMchmbK6Vh6OkitNlaCoFqXqyOSi6TxYmRv
 DhjxHkTaMIaoxs=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This patch drops the CONFIG_PARISC_SELF_EXTRACT option.

The palo boot loader is able to decompress a kernel which was compressed
with gzip. That possibility was useful when the Linux kernel
self-extracting feature wasn't implemented yet.

Beside the fact that the self-extracting feature offers much better
compression rates, we do support self-extracting kernels already since
kernel v4.14, so now it's really time to get rid of that old option and
always use the self-extractor.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig  | 12 ------------
 arch/parisc/Makefile |  9 ---------
 2 files changed, 21 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index b36d160ee3e8..67003fdfc0cd 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -261,18 +261,6 @@ config PARISC_PAGE_SIZE_64KB

 endchoice

-config PARISC_SELF_EXTRACT
-	bool "Build kernel as self-extracting executable"
-	default y
-	help
-	  Say Y if you want to build the parisc kernel as a kind of
-	  self-extracting executable.
-
-	  If you say N here, the kernel will be compressed with gzip
-	  which can be loaded by the palo bootloader directly too.
-
-	  If you don't know what to do here, say Y.
-
 config SMP
 	bool "Symmetric multi-processing support"
 	help
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 2662eb5e32e4..09e9c5008277 100644
=2D-- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -15,12 +15,8 @@
 # Mike Shaver, Helge Deller and Martin K. Petersen
 #

-ifdef CONFIG_PARISC_SELF_EXTRACT
 boot :=3D arch/parisc/boot
 KBUILD_IMAGE :=3D $(boot)/bzImage
-else
-KBUILD_IMAGE :=3D vmlinuz
-endif

 NM		=3D sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+=3D -D__hppa__=3D1
@@ -167,13 +163,8 @@ Image: vmlinux
 bzImage: vmlinux
 	$(Q)$(MAKE) $(build)=3D$(boot) $(boot)/$@

-ifdef CONFIG_PARISC_SELF_EXTRACT
 vmlinuz: bzImage
 	$(OBJCOPY) $(boot)/bzImage $@
-else
-vmlinuz: vmlinux
-	@$(KGZIP) -cf -9 $< > $@
-endif

 ifeq ($(KBUILD_EXTMOD),)
 # We need to generate vdso-offsets.h before compiling certain files in ke=
rnel/.
=2D-
2.34.1

