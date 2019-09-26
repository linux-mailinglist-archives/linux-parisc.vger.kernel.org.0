Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C30E2BF865
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2019 19:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbfIZR5d (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Sep 2019 13:57:33 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41732 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbfIZR40 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:26 -0400
Received: by mail-pf1-f196.google.com with SMTP id q7so2246409pfh.8
        for <linux-parisc@vger.kernel.org>; Thu, 26 Sep 2019 10:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K0CEaBZVMosV97TjoIjF+mcwc4HOALK07zDqwe2mDqI=;
        b=cOjv9Lo+vz39Kwj3tNQ1hZIX7qRX5TunV9AMlzhmgRNO3OLsvmYaUFZwfI5s/SJwQa
         I+DskMJ10/0uMwX1MQnoM5maR+Y4cLrQRjxFLWMaPwikUQGP0Ek401l21Ew0JMzxiHPz
         UjHA+X4IEv6MK/WxYDP06EebXdp17TVpabeaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K0CEaBZVMosV97TjoIjF+mcwc4HOALK07zDqwe2mDqI=;
        b=e1FD9W+7z7hGkaIFGrYYDHTnapgRMciaLL03BqSArvpu8fy+EIaF2BnUWL6GC6chAb
         I4N0Im6CGUiOP+itrGP0M/cYA/O2cZqkfBHlIejSj80hYYlP2zJKIudIvYjdu04suCRL
         fSxrbABJOpgqwT9tMzHiXre4llGtrhJjc9L0IUm5+Rz19WAt+eOBTP3OR3VOsDIZfYJc
         7Z70HhwzrN61dmu5mLI0Isv9H2keAqqxcPHrNQNcchmEv3oYCsu4gGG8COp3BlA3CjaF
         I4UJ0kQ4FNpInbEW9mAWjVojXpLk9oMxwSjwTZVpVT6EHWr3Jr46spuKe13o+OUeLKGR
         n1Ug==
X-Gm-Message-State: APjAAAXADN4/DJu4Lz6mel//xhn4u+asEze698hWfOzr2UndpTDOrTXv
        +xrpoRj/AQ5UUgqiDWP9QxDUZQ==
X-Google-Smtp-Source: APXvYqw9tlSx7V2cBgpwrKr/ncIUrkORrRwucq8unB98gF58bCh7UQXC9abm6opm6rQlU2K4isyVEw==
X-Received: by 2002:a63:ea07:: with SMTP id c7mr4890360pgi.106.1569520585671;
        Thu, 26 Sep 2019 10:56:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d24sm5032847pfn.86.2019.09.26.10.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 10:56:21 -0700 (PDT)
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
Subject: [PATCH 09/29] vmlinux.lds.h: Move Program Header restoration into NOTES macro
Date:   Thu, 26 Sep 2019 10:55:42 -0700
Message-Id: <20190926175602.33098-10-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In preparation for moving NOTES into RO_DATA, the Program Header
assignment restoration needs to be part of the NOTES macro itself.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/alpha/kernel/vmlinux.lds.S   |  5 +----
 arch/ia64/kernel/vmlinux.lds.S    |  4 +---
 arch/mips/kernel/vmlinux.lds.S    |  3 +--
 arch/powerpc/kernel/vmlinux.lds.S |  4 +---
 arch/s390/kernel/vmlinux.lds.S    |  4 +---
 arch/x86/kernel/vmlinux.lds.S     |  3 +--
 include/asm-generic/vmlinux.lds.h | 13 +++++++++++--
 7 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index 363a60ba7c31..cdfdc91ce64c 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -34,10 +34,7 @@ SECTIONS
 	swapper_pg_dir = SWAPPER_PGD;
 	_etext = .;	/* End of text section */
 
-	NOTES :text :note
-	.dummy : {
-		*(.dummy)
-	} :text
+	NOTES
 
 	RODATA
 	EXCEPTION_TABLE(16)
diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index e034a6a4a444..fdcc992ab360 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -70,9 +70,7 @@ SECTIONS {
 	/*
 	 * Read-only data
 	 */
-	NOTES :text :note       /* put .notes in text and mark in PT_NOTE  */
-	code_continues : {
-	} :text                /* switch back to regular program...  */
+	NOTES
 
 	EXCEPTION_TABLE(16)
 
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 1c95612eb800..6a22f531d815 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -81,8 +81,7 @@ SECTIONS
 		__stop___dbe_table = .;
 	}
 
-	NOTES NOTES_HEADERS
-	.dummy : { *(.dummy) } :text
+	NOTES
 
 	_sdata = .;			/* Start of data section */
 	RODATA
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 7e26e20c8324..4f19d814d592 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -164,9 +164,7 @@ SECTIONS
 #endif
 	EXCEPTION_TABLE(0)
 
-	NOTES :text :note
-	/* Restore program header away from PT_NOTE. */
-	.dummy : { *(.dummy) } :text
+	NOTES
 
 /*
  * Init sections discarded at runtime
diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index 646d939346df..f88eedeb915a 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -52,9 +52,7 @@ SECTIONS
 		_etext = .;		/* End of text section */
 	} :text = 0x0700
 
-	NOTES :text :note
-
-	.dummy : { *(.dummy) } :text
+	NOTES
 
 	RO_DATA_SECTION(PAGE_SIZE)
 
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2e18bf5c1aed..8be25b09c2b7 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -148,8 +148,7 @@ SECTIONS
 		_etext = .;
 	} :text = 0x9090
 
-	NOTES :text :note
-	.dummy : { *(.dummy) } :text
+	NOTES
 
 	EXCEPTION_TABLE(16)
 
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 2cc3ff9ac8c7..6a0a657dfdb4 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -56,10 +56,18 @@
 
 /*
  * Only some architectures want to have the .notes segment visible in
- * a separate PT_NOTE ELF Program Header.
+ * a separate PT_NOTE ELF Program Header. When this happens, it needs
+ * to be visible in both the kernel text's PT_LOAD and the PT_NOTE
+ * Program Headers. In this case, though, the PT_LOAD needs to be made
+ * the default again so that all the following sections don't also end
+ * up in the PT_NOTE Program Header.
  */
 #ifdef EMITS_PT_NOTE
 #define NOTES_HEADERS		:text :note
+#define NOTES_HEADERS_RESTORE	__restore_ph : { *(.__restore_ph) } :text
+#else
+#define NOTES_HEADERS
+#define NOTES_HEADERS_RESTORE
 #endif
 
 /* Align . to a 8 byte boundary equals to maximum function alignment. */
@@ -792,7 +800,8 @@
 		__start_notes = .;					\
 		KEEP(*(.note.*))					\
 		__stop_notes = .;					\
-	}
+	} NOTES_HEADERS							\
+	NOTES_HEADERS_RESTORE
 
 #define INIT_SETUP(initsetup_align)					\
 		. = ALIGN(initsetup_align);				\
-- 
2.17.1

