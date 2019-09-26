Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04407BF834
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2019 19:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbfIZR4z (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Sep 2019 13:56:55 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33233 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728178AbfIZR4d (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:33 -0400
Received: by mail-pg1-f196.google.com with SMTP id i30so1989187pgl.0
        for <linux-parisc@vger.kernel.org>; Thu, 26 Sep 2019 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HjFHv9xxIhK5RJeBiuSF34CW9EFCi2H1cUI0osZb25Q=;
        b=KPMZBnze/A/QVrsTLF2KGN3ebdUhyckFs45P2jOghM70xqivIFR9hfivXkVt5CbeNY
         IE1kSylnyZRNl8HDUTfbWj8AKjNJnMw62zdeR5tu6VCLH496t+W13oMohTiMGaZ6p79Z
         3c4uLS8nqL5lvrbWSW4400GI1UZ1nPH1jjAIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HjFHv9xxIhK5RJeBiuSF34CW9EFCi2H1cUI0osZb25Q=;
        b=RE0cUu9DS6o7YeZIwqh/gfBYLmwYMIHTDTfy+k14PdN9wMyZFq0gWUe2KFb5ZeUuv4
         igDJEO8pHdOtHtswEOVRD8rDBQRonX66FZ9vRAOSEmo4GK63/FvJipS8GHHjks7RfX47
         OgpSN7wZTExd7qtHPh48ElBgRSb92LGKMtgvlg/Juo9wECbmn44luPzYT5WM/1Jmi9ok
         ursBcp7e9CgJZscnufCf0F+Qt3vJR8gb86CP+PVCHyZ9VCYqvMkzCpCIXuqxKdzvdhSj
         V4O1tYeG/stqTsk5msJFSPDABxvfumX8Swn5k3uh07bNwVXmeGiZdkDqvBOOYb5zISA8
         /IQw==
X-Gm-Message-State: APjAAAX9cQdtaaI3kyt8zZ2pVGA1a2xzTf19HT48UaqScO5qeCxgkAox
        QEh9hSOsnbj+DwfgSYNCEXyvjw==
X-Google-Smtp-Source: APXvYqyFMbRLlIoK6p9J6QIn/93x5dhozlYQ0YGx3wABZc+vZZjpU1J4N8nao/7zNkR46rXeo7ym8w==
X-Received: by 2002:a62:19c7:: with SMTP id 190mr5160181pfz.105.1569520591920;
        Thu, 26 Sep 2019 10:56:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f89sm3068052pje.20.2019.09.26.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
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
Subject: [PATCH 20/29] h8300: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 26 Sep 2019 10:55:53 -0700
Message-Id: <20190926175602.33098-21-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The EXCEPTION_TABLE is read-only, so collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/h8300/kernel/vmlinux.lds.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/h8300/kernel/vmlinux.lds.S b/arch/h8300/kernel/vmlinux.lds.S
index 2ac7bdcd2fe0..aba90398b774 100644
--- a/arch/h8300/kernel/vmlinux.lds.S
+++ b/arch/h8300/kernel/vmlinux.lds.S
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -37,7 +40,6 @@ SECTIONS
 #endif
 	_etext = . ;
 	}
-	EXCEPTION_TABLE(16)
 	RO_DATA(4)
 	ROMEND = .;
 #if defined(CONFIG_ROMKERNEL)
-- 
2.17.1

