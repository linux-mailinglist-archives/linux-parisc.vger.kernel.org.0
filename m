Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07A7B75A618
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Jul 2023 08:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjGTGOm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Jul 2023 02:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGTGOl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Jul 2023 02:14:41 -0400
Received: from mail.208.org (unknown [183.242.55.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069B51BF2
        for <linux-parisc@vger.kernel.org>; Wed, 19 Jul 2023 23:14:40 -0700 (PDT)
Received: from mail.208.org (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTP id 4R62TM23HNzBRDsC
        for <linux-parisc@vger.kernel.org>; Thu, 20 Jul 2023 14:14:31 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :references:in-reply-to:subject:to:from:date:mime-version; s=
        dkim; t=1689833671; x=1692425672; bh=w3v9O7PDvXx7Qe/e1kGiSv9Vyxz
        Kb3Lhw+34HqlCzWg=; b=pWZ9WepDr5HDygFc4ZlRhrmzfQO7/P2trW0Mou/DkLf
        //oO+6Wyt8JZvKPAjxEMpmi+o0uEyQBgm4YTJmH2iDUzHEKtbiSxKEN0NX9jTfZK
        Blac5rHEGn4+FTwkgFEJbWrYbD3UmYfqUSFrlus8Icgp+Ej84HnF1dcBDAhnA9xh
        3lvxrPRHfrXy5f2S1hLZtstSAatR6jV8G0SjYWyTav6/ifdmFT9h0BgEqH+T0Kg3
        if0huvNL2/vt4HZ55FtN4zcyr+FPLu8hEXIOZxZWpDXX+HYgLmy6ihFEX//jh2nS
        lXREFFjLvq7LRxYRMR0SRxN21szFkcLvI0m1IaFUjdw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
        by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id BEwpH1daCD-e for <linux-parisc@vger.kernel.org>;
        Thu, 20 Jul 2023 14:14:31 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTPSA id 4R62TL6Sz5zBR1P6;
        Thu, 20 Jul 2023 14:14:30 +0800 (CST)
MIME-Version: 1.0
Date:   Thu, 20 Jul 2023 14:14:30 +0800
From:   hanyu001@208suo.com
To:     James.Bottomley@HansenPartnership.com, deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] parisc: kernel:  "foo * bar" should be "foo *bar"
In-Reply-To: <tencent_2E6F87E6BC1B92D422B02265685D90AFAD06@qq.com>
References: <tencent_2E6F87E6BC1B92D422B02265685D90AFAD06@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <dbc24737ba923daee7d3b948cc028dc3@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RDNS_NONE,SPF_HELO_FAIL,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This patch fixes the checkpatch.pl error

./arch/parisc/kernel/sys_parisc32.c:29: ERROR: "foo * bar" should be 
"foo *bar"

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/parisc/kernel/sys_parisc32.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/sys_parisc32.c 
b/arch/parisc/kernel/sys_parisc32.c
index 2a12a54..abe87d2 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -26,7 +26,7 @@ asmlinkage long sys32_unimplemented(int r26, int r25, 
int r24, int r23,

  asmlinkage long sys32_fanotify_mark(compat_int_t fanotify_fd, 
compat_uint_t flags,
      compat_uint_t mask0, compat_uint_t mask1, compat_int_t dfd,
-    const char  __user * pathname)
+    const char  __user *pathname)
  {
      return sys_fanotify_mark(fanotify_fd, flags,
              ((__u64)mask1 << 32) | mask0,
