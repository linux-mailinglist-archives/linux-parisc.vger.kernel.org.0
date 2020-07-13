Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD7721DF70
	for <lists+linux-parisc@lfdr.de>; Mon, 13 Jul 2020 20:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729826AbgGMSPe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 13 Jul 2020 14:15:34 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:37278 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729687AbgGMSPe (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 13 Jul 2020 14:15:34 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 6FE74BC09D;
        Mon, 13 Jul 2020 18:15:31 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     James.Bottomley@HansenPartnership.com, deller@gmx.de,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] parisc: Replace HTTP links with HTTPS ones
Date:   Mon, 13 Jul 2020 20:15:25 +0200
Message-Id: <20200713181525.36812-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 arch/parisc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 8e4c3708773d..c2454c153a6c 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -285,7 +285,7 @@ config SMP
 	  On a uniprocessor machine, the kernel will run faster if you say N.
 
 	  See also <file:Documentation/admin-guide/lockup-watchdogs.rst> and the SMP-HOWTO
-	  available at <http://www.tldp.org/docs.html#howto>.
+	  available at <https://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
 
-- 
2.27.0

