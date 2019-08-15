Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF088F605
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Aug 2019 22:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732898AbfHOUxe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 15 Aug 2019 16:53:34 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45992 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732575AbfHOUxe (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 15 Aug 2019 16:53:34 -0400
Received: by mail-qt1-f195.google.com with SMTP id k13so3779841qtm.12
        for <linux-parisc@vger.kernel.org>; Thu, 15 Aug 2019 13:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JSpVZiPBrGYAUGx+Ea3a4Y0npIYaRGCqHD40eUQBGCU=;
        b=HYBnUyoVPsBJvVkswIQnogJxrcbVs8FykxsadpD+OBBcZSLXZY31yp6SetRVZSo3gw
         pXzFGNahpp430zsf6TO5hgqAge4ytAHZkg3cz+qsLurhE/NR2LeM/v5U35AorKka9gOm
         F0/agF8rX0XtBCdT4/DrAcB6EFxp+zi7TzRss7TkheyzTzqRpE6DOQzim91W1HXcSLOE
         wbTK2OuQvyTNEOSMn5Q8UkH9VBs/SMEVMpdybq9m9vQdnq1OEvPmmwCNhZn9WugTWoTF
         SFcCB60AjKm8JKJrM2UOHkhWHNhcfq764HCA8eZz6beZKGzsZJxEXd1W7upwpenkYYWx
         fjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JSpVZiPBrGYAUGx+Ea3a4Y0npIYaRGCqHD40eUQBGCU=;
        b=RlCC47fJogujFjXAcse4LsjvHVBXrRtCwQuH9TAAPGfjpj6PzcNWc9PdveUQWz2du8
         W8Z5bCkuFT/rI46NtYzViCOVtEuOiFrEXyTgTaFPsg5rcRcyi6M3CHlnSvvtOpa7KOsr
         zHyzYwurv5VOmVAv9MZMelDotYddsXMa97Cuvx54CB85H3kPLJvmAUnEy3RII1UYruXg
         W+N01/6aGUQZpQSv+j0eCUmJEZtNItetCoTSUyiGAi2m7wUYc/xMcqk/PSJCjFHO2hht
         pUAatSQUJQqGvDWOfel2E0tFTrvhzooHw3sRGfmN6KnKSY7nLEziCl0SRejKHtuOuQYg
         MzBA==
X-Gm-Message-State: APjAAAXfrkrPwn1DH18edAL91J3f/meFvJ/viyQqkHtJKfK6CYoYDeTe
        AbgjBQoJ7xsllg5qjpVmP7GEWg==
X-Google-Smtp-Source: APXvYqzbXNyNwRv677yBKxMuVBmtR2yPqIKJwxHbRYZPkBY8ioVL+BuHkgNtj5ndJuuFzEJngE7PkQ==
X-Received: by 2002:a0c:b0ef:: with SMTP id p44mr4599552qvc.27.1565902413583;
        Thu, 15 Aug 2019 13:53:33 -0700 (PDT)
Received: from ovpn-122-72.rdu2.redhat.com (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id x3sm1991828qkl.71.2019.08.15.13.53.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 13:53:33 -0700 (PDT)
From:   Qian Cai <cai@lca.pw>
To:     akpm@linux-foundation.org
Cc:     James.Bottomley@HansenPartnership.com, deller@gmx.de,
        linux@roeck-us.net, kirill.shutemov@linux.intel.com,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qian Cai <cai@lca.pw>
Subject: [PATCH] parisc: fix compilation errrors
Date:   Thu, 15 Aug 2019 16:53:05 -0400
Message-Id: <20190815205305.1382-1-cai@lca.pw>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The commit 0cfaee2af3a0 ("include/asm-generic/5level-fixup.h: fix
variable 'p4d' set but not used") converted a few functions from macros
to static inline, which causes parisc to complain,

In file included from ./include/asm-generic/4level-fixup.h:38:0,
                 from ./arch/parisc/include/asm/pgtable.h:5,
                 from ./arch/parisc/include/asm/io.h:6,
                 from ./include/linux/io.h:13,
                 from sound/core/memory.c:9:
./include/asm-generic/5level-fixup.h:14:18: error: unknown type name
'pgd_t'; did you mean 'pid_t'?
 #define p4d_t    pgd_t
                  ^
./include/asm-generic/5level-fixup.h:24:28: note: in expansion of macro
'p4d_t'
 static inline int p4d_none(p4d_t p4d)
                            ^~~~~

It is because "4level-fixup.h" is included before "asm/page.h" where
"pgd_t" is defined.

Fixes: 0cfaee2af3a0 ("include/asm-generic/5level-fixup.h: fix variable 'p4d' set but not used")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/parisc/include/asm/pgtable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index a39b079e73f2..6d58c1739b42 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -2,6 +2,7 @@
 #ifndef _PARISC_PGTABLE_H
 #define _PARISC_PGTABLE_H
 
+#include <asm/page.h>
 #include <asm-generic/4level-fixup.h>
 
 #include <asm/fixmap.h>
@@ -98,8 +99,6 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 
 #endif /* !__ASSEMBLY__ */
 
-#include <asm/page.h>
-
 #define pte_ERROR(e) \
 	printk("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
-- 
2.20.1 (Apple Git-117)

