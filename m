Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7514ABF88A
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2019 19:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbfIZR55 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Sep 2019 13:57:57 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33450 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbfIZR4V (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:21 -0400
Received: by mail-pl1-f195.google.com with SMTP id d22so1641351pls.0
        for <linux-parisc@vger.kernel.org>; Thu, 26 Sep 2019 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tfsXsrL5x37ZSQucWl8Bh6EyFQTE0kRi9peGDqUDYWM=;
        b=KfnDRarTGgWf60O4C9cF+YzTjYXp+pSkpdzWR7YKNXHXP7TAfTSHAkqA4UoYNAcWUP
         NDUbjKE6AWe2+D+wOTvvlqXbdNAJZsnyYEgw38E2fXR/V8EEz3Xj/vyRfzrhH+es6//f
         V34BpcFgVde9WGbqi6+RYmyV1MCa8QFUww3V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tfsXsrL5x37ZSQucWl8Bh6EyFQTE0kRi9peGDqUDYWM=;
        b=fvL2TSL9jCNQIm2pmBeBgYgjgZCEyH/PQq+N5Iqes6TSwWmM6+FH75es4+t2acdZAY
         LfWGpUUls+5qS9AqJJV0foUyVMEvLVL6L72wpDkiFn09H2hGwyJO/1C5biZJp6JjLwtv
         YE3bjUOxpwe0zYZvIYJEqzy1zteIbztBIDbTmygMiQUe9F1NXxdATv5g+zZiaJ/JRcQS
         jyQn6iphYgO1zwEZVd+ZMxA8Zgt5Em/H1jZea9clpmI+iNaCOvLDySp2zEpRpbKZgRSg
         gxMquY92B4atLADsqXRCgKZp8xWTH4B6HiQagpXulmCif8y9Av1+Dc0GvSbWuZmT5DRQ
         H4gQ==
X-Gm-Message-State: APjAAAVRFSwvg029Wus35+pQB6sPipKCsghwR9yjPuGNQ/sbvq1DP0PG
        RB3kdYuQI9BxXZ9HxJKnFTrmxQ==
X-Google-Smtp-Source: APXvYqxNefsDmg9i8vv1ozpPK1xitEq/TEjXZ0cxntHJv7Z/K7QxcGEiK4QwS+/LuR6Pbs4fqhuAog==
X-Received: by 2002:a17:902:9a92:: with SMTP id w18mr5189269plp.201.1569520580043;
        Thu, 26 Sep 2019 10:56:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f15sm2984785pfd.141.2019.09.26.10.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 10:56:17 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, x86@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/29] alpha: Rename PT_LOAD identifier "kernel" to "text"
Date:   Thu, 26 Sep 2019 10:55:37 -0700
Message-Id: <20190926175602.33098-5-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In preparation for moving NOTES into RO_DATA, this renames the linker
script internal identifier for the PT_LOAD Program Header from "kernel"
to "text" to match other architectures.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/alpha/kernel/vmlinux.lds.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index c4b5ceceab52..781090cacc96 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -8,7 +8,7 @@
 OUTPUT_FORMAT("elf64-alpha")
 OUTPUT_ARCH(alpha)
 ENTRY(__start)
-PHDRS { kernel PT_LOAD; note PT_NOTE; }
+PHDRS { text PT_LOAD; note PT_NOTE; }
 jiffies = jiffies_64;
 SECTIONS
 {
@@ -27,14 +27,14 @@ SECTIONS
 		LOCK_TEXT
 		*(.fixup)
 		*(.gnu.warning)
-	} :kernel
+	} :text
 	swapper_pg_dir = SWAPPER_PGD;
 	_etext = .;	/* End of text section */
 
-	NOTES :kernel :note
+	NOTES :text :note
 	.dummy : {
 		*(.dummy)
-	} :kernel
+	} :text
 
 	RODATA
 	EXCEPTION_TABLE(16)
-- 
2.17.1

