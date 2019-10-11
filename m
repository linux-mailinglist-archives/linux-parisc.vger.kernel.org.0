Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0F8ED352E
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2019 02:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbfJKAGW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Oct 2019 20:06:22 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44533 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbfJKAGW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Oct 2019 20:06:22 -0400
Received: by mail-pg1-f196.google.com with SMTP id e10so696930pgd.11
        for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2019 17:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7dmckIaKuL5uoyVhYLyxQgvD7laB8s0ddXfS7YNycCU=;
        b=Zkm/RKe8e+Liv+qZ7ZPm9kwWeSr+NIaspEW7t3lmnI5dNpUpSo6dTzux6vNvY1O0iZ
         mXmbpcaYzINbphQms11pCzDFWcPo5ulCRYCfFRW5DOq8KNnHUZoPg9cYONZAaxdOzKmE
         WYECp/MY1nFT0o4uteh9HzWwnmK7DhrJcJDFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7dmckIaKuL5uoyVhYLyxQgvD7laB8s0ddXfS7YNycCU=;
        b=G4d0arMHR4Voeu2BNmRhAq8fbFy+nbsVlCq/RpRcAePHUvwJr00Oj0/JvGDBvThTSQ
         h8A5FHmLE9Q5ceWHO0q9WpoZHTKNY+Ax+jWqHbk7pe+kfOpioK2i7Ea3N8Byrdxwlcr5
         j4kfvkftNNj2/faVtqGniEXNwo0+6xpx8yUUqlPiDHHUzFV+IDkjmWnZ3GxU3RCoSs1K
         ZAbe4zk02hO/ad/tAURgWmtBB+L4llBlcUoWqZgpgmfBsncVGVobMP22PL7IuXcJ3EhO
         x7d1LFWUrebrpviG67bQOO1kJjEF6Hlw0idUkEEI1Wa5nHd2dWtS2lLT+2+pXLIhK7qb
         CbXw==
X-Gm-Message-State: APjAAAXo3kq8029oCnf5Slai89RC3t6l71889is0gGzPBD8a5Kea4S4Z
        4vjSecmSI75sEsZwm4OIwnxiQA==
X-Google-Smtp-Source: APXvYqy8lBsu/lNnf25rns+8k/zkBM8oQHwDv9L6rfwj03NX/IG4fGJ+vORVfGqdbtbZOe/1C8n/Lw==
X-Received: by 2002:a63:554b:: with SMTP id f11mr13613094pgm.151.1570752381593;
        Thu, 10 Oct 2019 17:06:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o42sm12777771pjo.32.2019.10.10.17.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:06:20 -0700 (PDT)
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
Subject: [PATCH v2 02/29] powerpc: Remove PT_NOTE workaround
Date:   Thu, 10 Oct 2019 17:05:42 -0700
Message-Id: <20191011000609.29728-3-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In preparation for moving NOTES into RO_DATA, remove the PT_NOTE
workaround since the kernel requires at least gcc 4.6 now.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kernel/vmlinux.lds.S | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 81e672654789..a3c8492b2b19 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -20,20 +20,6 @@ ENTRY(_stext)
 PHDRS {
 	kernel PT_LOAD FLAGS(7); /* RWX */
 	note PT_NOTE FLAGS(0);
-	dummy PT_NOTE FLAGS(0);
-
-	/* binutils < 2.18 has a bug that makes it misbehave when taking an
-	   ELF file with all segments at load address 0 as input.  This
-	   happens when running "strip" on vmlinux, because of the AT() magic
-	   in this linker script.  People using GCC >= 4.2 won't run into
-	   this problem, because the "build-id" support will put some data
-	   into the "notes" segment (at a non-zero load address).
-
-	   To work around this, we force some data into both the "dummy"
-	   segment and the kernel segment, so the dummy segment will get a
-	   non-zero load address.  It's not enough to always create the
-	   "notes" segment, since if nothing gets assigned to it, its load
-	   address will be zero.  */
 }
 
 #ifdef CONFIG_PPC64
@@ -178,14 +164,8 @@ SECTIONS
 	EXCEPTION_TABLE(0)
 
 	NOTES :kernel :note
-
-	/* The dummy segment contents for the bug workaround mentioned above
-	   near PHDRS.  */
-	.dummy : AT(ADDR(.dummy) - LOAD_OFFSET) {
-		LONG(0)
-		LONG(0)
-		LONG(0)
-	} :kernel :dummy
+	/* Restore program header away from PT_NOTE. */
+	.dummy : { *(.dummy) } :kernel
 
 /*
  * Init sections discarded at runtime
-- 
2.17.1

