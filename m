Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD16B203F7C
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Jun 2020 20:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730083AbgFVSwf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 Jun 2020 14:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730030AbgFVSwe (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 Jun 2020 14:52:34 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E94EC061573
        for <linux-parisc@vger.kernel.org>; Mon, 22 Jun 2020 11:52:34 -0700 (PDT)
Received: (qmail 15819 invoked from network); 22 Jun 2020 18:51:20 -0000
Received: from p548d50f5.dip0.t-ipconnect.de ([::ffff:84.141.80.245]:54954 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Mon, 22 Jun 2020 20:51:20 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: [PATCH 2/2] parisc: make the log level string for register dumps const
Date:   Mon, 22 Jun 2020 20:52:32 +0200
Message-ID: <1832606.jW6VkoSIHO@daneel.sf-tec.de>
In-Reply-To: <5385100.WkMxZrnbov@daneel.sf-tec.de>
References: <5385100.WkMxZrnbov@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Date: Mon, 22 Jun 2020 20:47:50 +0200

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 arch/parisc/kernel/traps.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index e6a0bfdf5c26..8e46428be70a 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -75,7 +75,7 @@ static int printbinary(char *buf, unsigned long x, int nbits)
 		lvl, f, (x), (x+3), (r)[(x)+0], (r)[(x)+1],		\
 		(r)[(x)+2], (r)[(x)+3])
 
-static void print_gr(char *level, struct pt_regs *regs)
+static void print_gr(const char *level, struct pt_regs *regs)
 {
 	int i;
 	char buf[64];
@@ -88,7 +88,7 @@ static void print_gr(char *level, struct pt_regs *regs)
 		PRINTREGS(level, regs->gr, "r", RFMT, i);
 }
 
-static void print_fr(char *level, struct pt_regs *regs)
+static void print_fr(const char *level, struct pt_regs *regs)
 {
 	int i;
 	char buf[64];
@@ -116,7 +116,7 @@ static void print_fr(char *level, struct pt_regs *regs)
 void show_regs(struct pt_regs *regs)
 {
 	int i, user;
-	char *level;
+	const char *level;
 	unsigned long cr30, cr31;
 
 	user = user_mode(regs);
-- 
2.26.2




