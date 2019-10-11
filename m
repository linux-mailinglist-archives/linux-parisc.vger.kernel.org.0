Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB82D359D
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2019 02:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfJKANj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Oct 2019 20:13:39 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39018 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727515AbfJKAMy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Oct 2019 20:12:54 -0400
Received: by mail-pg1-f195.google.com with SMTP id e1so4703097pgj.6
        for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2019 17:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aXC4EKkSKWAzbgJ5UkNW5ASNd77O0uNGfoVDwB8PV7o=;
        b=QKMy1WMIao8eo2h9Q1TmJ+NvwxmYIJS5BiRFvnKXyWnyHt2NVU1sSJRyaYkSK0bnTI
         3g26hGi2M+7oPqpQxxO8mfA0+ckl3W/NOZq89OJYBy8zqpl256YQ/kRKmZl3wcK/Al8o
         WR97u6SnuI6udJBDDM4eXoslNY2BMQS6h8HHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aXC4EKkSKWAzbgJ5UkNW5ASNd77O0uNGfoVDwB8PV7o=;
        b=McjJz9qjqYOY3C9VSClNUQW22P0glPhfqxmSGR0AFUhGSuindecPJOAkTM/q6SP1s0
         iSWzt3j34XpICWX+KUZrW31u/BRMagQH8zLLdQmFpIxJmUrXlNhcea6VKJjmvggLnuhF
         1lLWhKPQlilem2nV9NkEtpPjfjkNZZlvmXwFmd8N5NWGSg2g0APuFfi5LnWgqLRkxubF
         ajc2GURX4FjH+D8EaRakkXFZIbjU6TwERkR2r/smjO+uLocX3tzMQuy8OpMusMj4PtzS
         Cl+SlHJKOAuuMN5yCncuxusGsKGBK9nAL9b7OlyIJL1Wi61VaF2mBupG9t7IOyomarAZ
         eTZQ==
X-Gm-Message-State: APjAAAXb+boNY57Lbok4WzX6deE0xCMokUkzUMQmaMhdmKSOCoAWgIbh
        U1U3rw7dPW0n7Acjn1i53NOJew==
X-Google-Smtp-Source: APXvYqwyN8mvkbsH6LAVRfjY92v44FJMaCqPYldcWqY2MvbBlNQ7Douul4dniL7y8RNurjH2A60mLg==
X-Received: by 2002:a17:90a:1617:: with SMTP id n23mr14581628pja.75.1570752773811;
        Thu, 10 Oct 2019 17:12:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w10sm5837436pjq.3.2019.10.10.17.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:12:52 -0700 (PDT)
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
Subject: [PATCH v2 25/29] xtensa: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 10 Oct 2019 17:06:05 -0700
Message-Id: <20191011000609.29728-26-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/xtensa/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index bdbd7c4056c1..0043d5858f14 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -14,6 +14,8 @@
  * Joe Taylor <joe@tensilica.com, joetylr@yahoo.com>
  */
 
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -130,7 +132,6 @@ SECTIONS
 
   .fixup   : { *(.fixup) }
 
-  EXCEPTION_TABLE(16)
   /* Data section */
 
   _sdata = .;
-- 
2.17.1

