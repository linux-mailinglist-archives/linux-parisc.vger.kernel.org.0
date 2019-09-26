Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1DF0BF8BF
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2019 20:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbfIZSFi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Sep 2019 14:05:38 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36674 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728080AbfIZSFX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Sep 2019 14:05:23 -0400
Received: by mail-pl1-f194.google.com with SMTP id f19so1640498plr.3
        for <linux-parisc@vger.kernel.org>; Thu, 26 Sep 2019 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=l1/coTYTe+wj6TaniwTTIjxs1/tlAJ4ZBZ+k2HAUhoc=;
        b=ZT90Hlbgza5mA13/d6UGS0pzfZxLKfXWME64PvV9Xl8CYO2kbvJSsEXc4JwWRHrHWB
         InrMjw1u0CbOHhrlMXR26Z9Pb5c7tAJ8jH6LE/YESZsEJSUAo4/QiXnuUcayFxkX0Me0
         dj1EzZmZAVOcOsMHTRIfYk2DcenQKhga/VkuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=l1/coTYTe+wj6TaniwTTIjxs1/tlAJ4ZBZ+k2HAUhoc=;
        b=dv0XmG4uk8C1bLqrJQ2fr5r1JcC0ZQ/ZnEz+TMHMQ3PWyoWHhzQAmOb/8ze7vAci3K
         tnd+y0phVNnioTik5rMA8ooz9MNmBpM/NDOrjlacdQd+HarG2SzhfXdQ+735pfiunrOK
         5x35OvlbYhjLUG3drkHWmu28aD0tl26ZFysNvOx7rMiKP7BY3a2dJwfdIW3HwV9rk+wR
         B/yvkm5C7c9agSiAVBJYycr4QVBWKn5WB8lpRRh4sURMgTLnilmD3HTcApnwb/hULO5j
         wx772HYf2kQQ4aSQE4lNxCleXDooP7/ppld2/wDkYuMBOVXZNVTmazK/VqwIvoR3ZUTI
         fqJA==
X-Gm-Message-State: APjAAAUzUzZyIOAcTQCQujvWmIxQp6LJSdQXnHO7sWL+diHS0BOf8uKb
        u8lKzHHllAymBh7WULvbUxszzQ==
X-Google-Smtp-Source: APXvYqwfZ1Op5CLpaniFH9tifhvJSxbOiM4V28ay34Ix7SESkioQ0yE1zEBFSFMDhs1Uhrrf1XeYJQ==
X-Received: by 2002:a17:902:ff0e:: with SMTP id f14mr5388358plj.325.1569521122967;
        Thu, 26 Sep 2019 11:05:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b69sm3327625pfb.132.2019.09.26.11.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 11:05:20 -0700 (PDT)
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
Subject: [PATCH 15/29] x86: Actually use _etext for end of text segment
Date:   Thu, 26 Sep 2019 10:55:48 -0700
Message-Id: <20190926175602.33098-16-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Various calculations are using the end of the exception table (which
does not need to be executable) as the end of the text segment. Instead,
in preparation for moving the exception table into RO_DATA, move _etext
after the exception table and update the calculations.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/include/asm/sections.h | 1 -
 arch/x86/kernel/vmlinux.lds.S   | 7 +++----
 arch/x86/mm/init_64.c           | 6 +++---
 arch/x86/mm/pti.c               | 2 +-
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/sections.h b/arch/x86/include/asm/sections.h
index 71b32f2570ab..036c360910c5 100644
--- a/arch/x86/include/asm/sections.h
+++ b/arch/x86/include/asm/sections.h
@@ -6,7 +6,6 @@
 #include <asm/extable.h>
 
 extern char __brk_base[], __brk_limit[];
-extern struct exception_table_entry __stop___ex_table[];
 extern char __end_rodata_aligned[];
 
 #if defined(CONFIG_X86_64)
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 41362e90142d..a1a758e25b2b 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -143,15 +143,14 @@ SECTIONS
 		*(.text.__x86.indirect_thunk)
 		__indirect_thunk_end = .;
 #endif
-
-		/* End of text section */
-		_etext = .;
 	} :text = 0x9090
 
 	EXCEPTION_TABLE(16)
 
-	/* .text should occupy whole number of pages */
+	/* End of text section, which should occupy whole number of pages */
+	_etext = .;
 	. = ALIGN(PAGE_SIZE);
+
 	X86_ALIGN_RODATA_BEGIN
 	RO_DATA(PAGE_SIZE)
 	X86_ALIGN_RODATA_END
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index a6b5c653727b..26299e9ce6da 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1263,7 +1263,7 @@ int kernel_set_to_readonly;
 void set_kernel_text_rw(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
-	unsigned long end = PFN_ALIGN(__stop___ex_table);
+	unsigned long end = PFN_ALIGN(_etext);
 
 	if (!kernel_set_to_readonly)
 		return;
@@ -1282,7 +1282,7 @@ void set_kernel_text_rw(void)
 void set_kernel_text_ro(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
-	unsigned long end = PFN_ALIGN(__stop___ex_table);
+	unsigned long end = PFN_ALIGN(_etext);
 
 	if (!kernel_set_to_readonly)
 		return;
@@ -1301,7 +1301,7 @@ void mark_rodata_ro(void)
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long rodata_start = PFN_ALIGN(__start_rodata);
 	unsigned long end = (unsigned long) &__end_rodata_hpage_align;
-	unsigned long text_end = PFN_ALIGN(&__stop___ex_table);
+	unsigned long text_end = PFN_ALIGN(&_etext);
 	unsigned long rodata_end = PFN_ALIGN(&__end_rodata);
 	unsigned long all_end;
 
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index b196524759ec..bd3404fd9d80 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -572,7 +572,7 @@ static void pti_clone_kernel_text(void)
 	 */
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long end_clone  = (unsigned long)__end_rodata_aligned;
-	unsigned long end_global = PFN_ALIGN((unsigned long)__stop___ex_table);
+	unsigned long end_global = PFN_ALIGN((unsigned long)_etext);
 
 	if (!pti_kernel_image_global_ok())
 		return;
-- 
2.17.1

