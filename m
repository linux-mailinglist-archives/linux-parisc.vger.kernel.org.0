Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73E5433EB8
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Oct 2021 20:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbhJSSuW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Oct 2021 14:50:22 -0400
Received: from outbound5b.eu.mailhop.org ([3.125.66.160]:32529 "EHLO
        outbound5b.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbhJSSuV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Oct 2021 14:50:21 -0400
X-Greylist: delayed 901 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Oct 2021 14:50:21 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1634668323; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=ue3O4VzICoNyoEjm3A6r+WqwUJwGrGemWNHmm52qyaK6iBFKJA3KIoYiwdmxbdEojtxGPDiroS91i
         aDjib24M+WkdwOVNo16ARS3Tetus5Nwgm4u6tGXPflzgyuGa8VlVrqIjsuGvZpajtV1ZP2UTq3LDQv
         ioQOc0Eu13Ab7mV9ANA6ba3j4MAieqCceQ9+JPpgbTg+l7U2L8kwQj+6dEWpBMPxsJ5Me3paPWZgAb
         LFciMKyVm3EnLKZupZ2FwvUtVHvX3hD7HqJva0CWubydckyfaivvYkcdbV6etb+5S3v9x88+cg6ajx
         0NQ/NcLJR7xPaC+YOynOOlHe6ghYLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:dkim-signature:dkim-signature:from;
        bh=SxWaIFxqU+QGiEZVh4PPqqGfnSxL+ZmvCOXjeo2LSfE=;
        b=ZAL2Aqix5hjNpzoWQHW9RzwFUmrAC7v9wkJzCtLx3iUoO1drWe2lpGMf90kI7qUam4z6fsDxlSAu1
         vE7YNRx3TWPhFwJiY7VcPvqts0s+c7FseCWRnRual7MZL+bG/ibwrDKMt9pxhWkAARoyKuyvMXHsXu
         v8dpdXCgdHLzt3WGfQ9b0NtyPYTbXCYuz68MW6nJ/YEo+GTP03C2/XJYziKEJoTo0Hih50gL/DD0nr
         j22a45w6wSMXsg/zxWBCJaZM19GF10OuGRF6E4e1/IhkShG4AGwIDBIAgAkxtPa/dlJsgR3TFmg1/0
         CVykJGCrl4IjSwEoeQNnm7+07VZDPag==
ARC-Authentication-Results: i=1; outbound3.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=SxWaIFxqU+QGiEZVh4PPqqGfnSxL+ZmvCOXjeo2LSfE=;
        b=sbpK519dulPy1blmoAWWpdWqMHaH9jCnWRBQymkrne0fp5MKrcl2J37IghI/X8PXWKeOQDCIR6+16
         uMFqDZU16g/nz3QlhuX80VBC1ZrVO9oETVhXIuqkU19f5lCD6Y/8jsYqF+nIPBYUY1FviHA3bpbPSv
         IpewCpP/hQgbXQl0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=SxWaIFxqU+QGiEZVh4PPqqGfnSxL+ZmvCOXjeo2LSfE=;
        b=OeDLkUQYozgSRWZJzfbFocyn3YwJ9ZYQGhcej5Zins4Aw3HIKwEuyMH1xsxfFxQ6QgxCfmG/FlI9K
         XeDc+PsUbrFdukWvFmYYxkBFicQ1IAz2ysiOkYz+NOd3nLB5sH0buJczMnjpLF2991aZuIKYDFBVWu
         zirEQyABLfR7ND7pwkMqL4HUYYS5fyGzBqzQwkATrNDxJlYpzmjJMmVIOj63PukeKq2QZrqul87KZz
         Tb8Hkd8bX1hmIc23Y4MEbZoyDU0y/AcIHs9vHbY0CnmdLex1f8L6W8LXjggDln+vphezZ757eJC1sE
         tij0TEYfWalH2RJbf33WrYuGubFzvEQ==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: d980fabe-310a-11ec-a40e-d17a12b91375
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound3.eu.mailhop.org (Halon) with ESMTPSA
        id d980fabe-310a-11ec-a40e-d17a12b91375;
        Tue, 19 Oct 2021 18:32:01 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by mail.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mctu4-00Bhg0-7n; Tue, 19 Oct 2021 21:32:00 +0300
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH 2/3] parisc/ftrace: use static key to enable function graph
Date:   Tue, 19 Oct 2021 20:31:51 +0200
Message-Id: <20211019183152.26191-3-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019183152.26191-1-svens@stackframe.org>
References: <20211019183152.26191-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Instead of comparing function descriptors add a static branch
so the condition gets patched during runtime.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/ftrace.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index f5f467ebf94c..7a2de664242a 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -23,6 +23,7 @@
 
 #define __hot __section(".text.hot")
 
+static DEFINE_STATIC_KEY_FALSE(ftrace_graph_enabled);
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 /*
  * Hook the return address and push it in the stack of return addrs
@@ -61,9 +62,7 @@ void notrace __hot ftrace_function_trampoline(unsigned long parent,
 	ftrace_trace_function(self_addr, parent, function_trace_op, fregs);
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	if (dereference_function_descriptor(ftrace_graph_return) !=
-	    dereference_function_descriptor(ftrace_stub) ||
-	    ftrace_graph_entry != ftrace_graph_entry_stub) {
+	if (static_branch_unlikely(&ftrace_graph_enabled)) {
 		unsigned long *parent_rp;
 
 		/* calculate pointer to %rp in stack */
@@ -81,11 +80,13 @@ void notrace __hot ftrace_function_trampoline(unsigned long parent,
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 int ftrace_enable_ftrace_graph_caller(void)
 {
+	static_key_enable(&ftrace_graph_enabled.key);
 	return 0;
 }
 
 int ftrace_disable_ftrace_graph_caller(void)
 {
+	static_key_disable(&ftrace_graph_enabled.key);
 	return 0;
 }
 #endif
-- 
2.33.0

