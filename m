Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC6A203F7A
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Jun 2020 20:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbgFVSvu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 Jun 2020 14:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730030AbgFVSvu (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 Jun 2020 14:51:50 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288B5C061573
        for <linux-parisc@vger.kernel.org>; Mon, 22 Jun 2020 11:51:50 -0700 (PDT)
Received: (qmail 15753 invoked from network); 22 Jun 2020 18:50:36 -0000
Received: from p548d50f5.dip0.t-ipconnect.de ([::ffff:84.141.80.245]:54952 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Mon, 22 Jun 2020 20:50:36 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: [PATCH 1/2] parisc: avoid needless empty lines inside register dump
Date:   Mon, 22 Jun 2020 20:51:46 +0200
Message-ID: <5385100.WkMxZrnbov@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Date: Sat, 20 Jun 2020 23:03:51 +0200

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 arch/parisc/kernel/traps.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 5400e23a77a1..e6a0bfdf5c26 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -80,7 +80,6 @@ static void print_gr(char *level, struct pt_regs *regs)
 	int i;
 	char buf[64];
 
-	printk("%s\n", level);
 	printk("%s     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI\n", level);
 	printbinary(buf, regs->gr[0], 32);
 	printk("%sPSW: %s %s\n", level, buf, print_tainted());
@@ -105,11 +104,9 @@ static void print_fr(char *level, struct pt_regs *regs)
 		      "fldd 0(%1),%%fr0	\n\t"
 		      : "=m" (s) : "r" (&s) : "r0");
 
-	printk("%s\n", level);
 	printk("%s      VZOUICununcqcqcqcqcqcrmunTDVZOUI\n", level);
 	printbinary(buf, s.sw[0], 32);
-	printk("%sFPSR: %s\n", level, buf);
-	printk("%sFPER1: %08x\n", level, s.sw[1]);
+	printk("%sFPSR: %s FPER1: %08x\n", level, buf, s.sw[1]);
 
 	/* here we'll print fr0 again, tho it'll be meaningless */
 	for (i = 0; i < 32; i += 4)
@@ -137,7 +134,6 @@ void show_regs(struct pt_regs *regs)
 
 	cr30 = mfctl(30);
 	cr31 = mfctl(31);
-	printk("%s\n", level);
 	printk("%sIASQ: " RFMT " " RFMT " IAOQ: " RFMT " " RFMT "\n",
 	       level, regs->iasq[0], regs->iasq[1], regs->iaoq[0], regs->iaoq[1]);
 	printk("%s IIR: %08lx    ISR: " RFMT "  IOR: " RFMT "\n",
-- 
2.26.2




