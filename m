Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9A1D3566
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2019 02:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfJKAND (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Oct 2019 20:13:03 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39900 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727757AbfJKAND (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Oct 2019 20:13:03 -0400
Received: by mail-pf1-f196.google.com with SMTP id v4so4954787pff.6
        for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2019 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8/x+eaVk+ss1aFRFRC2BuuTBFLP58LLEcIBPNJoL2cs=;
        b=fp0EZsT2tyBJy4pMM0BrQdWNH3jIqPiiR0OFuPR3KKp9NlEmrHQgmL/ZBNM1hxDEVj
         gMnsWemWjREXcL9c9lek/rM89s9e/l7HiEkBH/KqKwR6byArefKYaaiKWxjJgqllWaPD
         6nPt+boxm7/SK9xvW9TYHnHh28YvJaU9w+77g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8/x+eaVk+ss1aFRFRC2BuuTBFLP58LLEcIBPNJoL2cs=;
        b=OtCIkNYzPPpihQjT6iLrFZUMT1qXjCvwqlsbKte1Njo5iWkv4JNmYzRkF4THmq1n3g
         v6164vapMSS9lMdL27pcKlNt3SZShLcLUEhMf988PmRaWdAUewEmAAq6Q3rQv67fAlNt
         LruOndI315MHzQTRXRAAZUTrU7167nc1JWWO2cJmJLyObOj2ulE/33ppDH1bpnoiou/L
         hNlWRXIN7+r29hF3HSx0w2MCpuX2OpU4ZCOuRaaFTKjLnLQcnhbxUJ52185AO8o4W7eL
         KZPk0SHgaQj0JbGsx7/GXi9ZRoD6o/pPZ9OkgE1qISGt6hHp/LuZ96wTbiSeIxzvzlX6
         Kgww==
X-Gm-Message-State: APjAAAUe/q3Da3YMp2B5O9oAvHmXWJDvn6i1blA/QThbr1nBQq9HYFu1
        Mr8KlrPF2OcgU9wNyRbiCPLhng==
X-Google-Smtp-Source: APXvYqzYV7Ta2O1ssdo06WBxZ2tymf8EVzlYCRiZUZ2NeL/vJyas9bBJT97ICY4x4F39C1qUjsxcog==
X-Received: by 2002:a63:2350:: with SMTP id u16mr1550233pgm.103.1570752782606;
        Thu, 10 Oct 2019 17:13:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q36sm7238812pgb.34.2019.10.10.17.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:12:56 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, x86@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 26/29] x86/mm: Remove redundant &s on addresses
Date:   Thu, 10 Oct 2019 17:06:06 -0700
Message-Id: <20191011000609.29728-27-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The &s on addresses are redundant. Remove them to match all the other
similar functions.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/mm/init_64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 26299e9ce6da..e67ddca8b7a8 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1300,9 +1300,9 @@ void mark_rodata_ro(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long rodata_start = PFN_ALIGN(__start_rodata);
-	unsigned long end = (unsigned long) &__end_rodata_hpage_align;
-	unsigned long text_end = PFN_ALIGN(&_etext);
-	unsigned long rodata_end = PFN_ALIGN(&__end_rodata);
+	unsigned long end = (unsigned long)__end_rodata_hpage_align;
+	unsigned long text_end = PFN_ALIGN(_etext);
+	unsigned long rodata_end = PFN_ALIGN(__end_rodata);
 	unsigned long all_end;
 
 	printk(KERN_INFO "Write protecting the kernel read-only data: %luk\n",
-- 
2.17.1

