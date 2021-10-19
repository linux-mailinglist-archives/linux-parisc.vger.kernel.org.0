Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B324433EB7
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Oct 2021 20:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhJSSuT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Oct 2021 14:50:19 -0400
Received: from outbound5e.eu.mailhop.org ([52.28.168.19]:46249 "EHLO
        outbound5e.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbhJSSuS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Oct 2021 14:50:18 -0400
X-Greylist: delayed 963 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Oct 2021 14:50:18 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1634668322; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=h2fqpFjf5ljb2P+lwztZmUcJfHhXMwQnwCf36+tiO25PRfRJy5IZ57Acb23aVqlhnQp/zk4EG9XOs
         2qtWF2WyYzxGi69x8C1MN7wBxyrAhgf5M4NDAm9Ry0BmiETtrgpCmTPq6b6XFKNE6B87vwqLtAyEBF
         sIfUrISj7P8YmyEm/Tg74kdtjXZlbupEAMZyWImC/ihdg44ZhM5jlA/yWzv1fLc4ByfbWG87yDepzZ
         fNk+No2CSI41SmoZo3iwDhI6Lw60QcfPjXkzjiGivq8qI+3pMADKQdofJswl7RmeHxg4y2gl9YUoUU
         dV+zY/yevAlbcIKAtmDzNS2dONSypgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:dkim-signature:dkim-signature:from;
        bh=PO0k1xL+/efGnR085NfRMjW1YmQC15DyM+IWS7rTASQ=;
        b=c+9VcmhLgeVpHZ8iRS/oBO3lCRFaYRUnHRC+fll2uzzM1siqIsdfLuiF6cpuuJZlt+1bNicAni/Nb
         fvqqDvJR70tEz8xK+hRnKLuAVO0VilvWtlFGElMobbDmp8bFc46AREDaZBXnYpvUu5cS6ip1dRLYGA
         oowpRAxNBF4WUglimf5hv8g9QKRTFcHiZ8cyw/BHsXGWk/oAVMv8aryg23Y32+nPe9pobG1jE39Gm/
         /gxbLAtxrWlfNFHVmyijx3N0yweCHmjbw9yoD6yNhv4vtJ7Mv7i0Bjv69BfNFHe9FNvSfu4xUVVzYq
         9tpEx/pQd9lWukxJByYeoOcHzbGCeGQ==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=PO0k1xL+/efGnR085NfRMjW1YmQC15DyM+IWS7rTASQ=;
        b=WfHtW7Du0oGe++n+6T9e/ipVzEhYzcZr3agAzfeGFS+yM9KQtU7K6VMh5FmafWkVqV2DDdIfyUvqT
         t/Qq38itu6T4aVVAG7kHr+vuOQAQPYpC51YDb8G+kHHc08AcSVHy5I/FonZqq+9Ctv5/Fd6nUYIpip
         5WLQYsJ5dTOTdx9g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=PO0k1xL+/efGnR085NfRMjW1YmQC15DyM+IWS7rTASQ=;
        b=iFfmtuhs6f0OJD3kRQUJmbvj/pZgggWkNqRcI/98R6rc4IycFLt8xv+iZ5c3HA4EfAeUsUtMDFohH
         vwHa+ch/9CPi9E7Aho/XRhl9uvua6V5c4QzLtBRCv6uqJD7cSN4ojFZKY59i175AQlj7wdY+MP0mZr
         o2jC0GHHdwll64nRuj0guRBOKLi1Fto0vNmnb966OrqikySesfDH0NlAgoAjJWSBAaFHVw1ChUfAAV
         xqcR8QNQmFlnsANQ6POMUEJ3LN+n1c9/Yh3odYq4d4F41TtRpgc/QSAtsW3MhvEN16DO9IM1J2RCAl
         Kq2lQkoNGEbZD3rKaxhpqlIrkcnuRuQ==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: d8ebb49c-310a-11ec-a070-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id d8ebb49c-310a-11ec-a070-973b52397bcb;
        Tue, 19 Oct 2021 18:32:00 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by mail.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mctu3-00Bhg0-Gc; Tue, 19 Oct 2021 21:31:59 +0300
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH 1/3] parisc: don't use dereference_function_descriptor() in trace stub
Date:   Tue, 19 Oct 2021 20:31:50 +0200
Message-Id: <20211019183152.26191-2-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019183152.26191-1-svens@stackframe.org>
References: <20211019183152.26191-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

dereference_function_descriptor() calls get_kernel_nofault(),
which itself might call into tracing. This leads to a deadlock.

Instead of reverting back to casts to compare whether there's
a trace function set, just always call the appropriate trace function.
With dynamic ftrace this function shouldn't be called at all
when ftrace is disabled. It adds a function call for the non-dynamic
case, but people concerned about the costs of ftrace should use
dynamic ftrace anyways.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/ftrace.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 0a1e75af5382..f5f467ebf94c 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -58,10 +58,7 @@ void notrace __hot ftrace_function_trampoline(unsigned long parent,
 #endif
 	extern struct ftrace_ops *function_trace_op;
 
-	if (function_trace_op->flags & FTRACE_OPS_FL_ENABLED &&
-	    ftrace_trace_function != ftrace_stub)
-		ftrace_trace_function(self_addr, parent,
-				function_trace_op, fregs);
+	ftrace_trace_function(self_addr, parent, function_trace_op, fregs);
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	if (dereference_function_descriptor(ftrace_graph_return) !=
@@ -101,6 +98,7 @@ int __init ftrace_dyn_arch_init(void)
 }
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
+	ftrace_trace_function = func;
 	return 0;
 }
 
-- 
2.33.0

