Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A469EE985C
	for <lists+linux-parisc@lfdr.de>; Wed, 30 Oct 2019 09:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfJ3ImC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 30 Oct 2019 04:42:02 -0400
Received: from shroom.duncanthrax.net ([178.63.180.169]:35663 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfJ3ImC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 30 Oct 2019 04:42:02 -0400
X-Greylist: delayed 1480 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Oct 2019 04:42:01 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q7flo/vt5kOBvsxMEtLaInJ1buzKjnE/pVNdCqdSHvQ=; b=YILlSJ2JdniLhpMPs6u90ybol3
        wdUyiO97hg3vvDBcU7BcwZR6Pn8GggvCPM0DhWv9Kf59AlfRh3I69VYmj6/vDcJJux8oGObXzUGXw
        vqUFQ+MTyOS0mfx00su1GzbFJT7ZyTVhSrSh3/5/wFiPodMCK7N7PW7t8+6vvgIRaWjs=;
Received: from [91.217.168.176] (helo=x280.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.90_1)
        (envelope-from <svens@stackframe.org>)
        id 1iPjAO-0003gH-C7; Wed, 30 Oct 2019 09:17:20 +0100
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: fix frame pointer in ftrace_regs_caller()
Date:   Wed, 30 Oct 2019 09:17:18 +0100
Message-Id: <20191030081718.9445-1-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The current code in ftrace_regs_caller() doesn't assign
%r3 to contain the address of the current frame. This
is hidden if the kernel is compiled with FRAME_POINTER,
but without it just crashes because it tries to dereference
an arbitrary address. Fix this by always setting %r3 to the
current stack frame.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 1d1d748c227f..b96d74496977 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -2125,7 +2125,7 @@ ftrace_regs_caller:
 	copy	%rp, %r26
 	LDREG	-FTRACE_FRAME_SIZE-PT_SZ_ALGN(%sp), %r25
 	ldo	-8(%r25), %r25
-	copy	%r3, %arg2
+	ldo	-FTRACE_FRAME_SIZE(%r1), %arg2
 	b,l	ftrace_function_trampoline, %rp
 	copy	%r1, %arg3 /* struct pt_regs */
 
-- 
2.23.0

