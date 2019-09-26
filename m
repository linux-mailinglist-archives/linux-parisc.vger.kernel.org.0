Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8B7CBF804
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2019 19:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbfIZR4T (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Sep 2019 13:56:19 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40643 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbfIZR4T (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:19 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so2252244pfb.7
        for <linux-parisc@vger.kernel.org>; Thu, 26 Sep 2019 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=twBnW9003cRUVrvl7rna64y+l4pXeTWwCidRvKd4upQ=;
        b=CqN1lXbzhTBvyldWDeFFG0HQSt646TlwSvqceNpapyoRiUWQ5YqqN4cPwhtdyRn8hE
         PVXIyXkZUO4laSWWNvkw5iINx8LA8erBgYyntG+Tsm/SabZpT1rGUewt5++Krmp2ifoS
         gGD+zS0suOHck11+UV+BUipLiBtMBQgjj951s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=twBnW9003cRUVrvl7rna64y+l4pXeTWwCidRvKd4upQ=;
        b=bScppMAcbRjH3xtMfv3Zn7LCSAPw0qqchNlKLaiMvE2VO12n5CfvctrQjpU0BA9ASM
         Nnf6gXSW+B9j1qgM33WELZLn6IhIKy0IGnLfczZlG4GMfpe0C7oUiSXwE6/fuCWrYi/X
         +kqTUjdeFKJX0rsz5sgn9R0asT1sd8U6r/6QmdBKgZYbYlTLo0av1wvJi6IsByJAa/5t
         4IXDsrv/21b2k5ITGWOiI/EVM8R7qynBwZdrlxyWS+gRyhcxT1tO5HCO+hTech/knuHI
         qbRpQmxQwDqo3vsjqj8PDmC7ygLKKjv3POmStvBj1nPmenlcC3ClGhCbA60OGLAtUE+E
         Wmww==
X-Gm-Message-State: APjAAAW3v0mWtV8zepgl8dTY8WwPXpV8utwBdHOcZ46/YfoiYFgphIgs
        ZIhvmp06SnFqshUqXL2XrVbK8w==
X-Google-Smtp-Source: APXvYqz5sqYBOjfwv1yAIr8+Vv2yIfMOshUTCRUhztJ4ypNIaY8nP1T7DvlPeRwIyHth9hoCfN4Y8A==
X-Received: by 2002:a63:cf4e:: with SMTP id b14mr4713210pgj.109.1569520578734;
        Thu, 26 Sep 2019 10:56:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k184sm5172900pge.57.2019.09.26.10.56.16
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
Subject: [PATCH 03/29] powerpc: Rename PT_LOAD identifier "kernel" to "text"
Date:   Thu, 26 Sep 2019 10:55:36 -0700
Message-Id: <20190926175602.33098-4-keescook@chromium.org>
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
 arch/powerpc/kernel/vmlinux.lds.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index a3c8492b2b19..e184a63aa5b0 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -18,7 +18,7 @@
 ENTRY(_stext)
 
 PHDRS {
-	kernel PT_LOAD FLAGS(7); /* RWX */
+	text PT_LOAD FLAGS(7); /* RWX */
 	note PT_NOTE FLAGS(0);
 }
 
@@ -63,7 +63,7 @@ SECTIONS
 #else /* !CONFIG_PPC64 */
 		HEAD_TEXT
 #endif
-	} :kernel
+	} :text
 
 	__head_end = .;
 
@@ -112,7 +112,7 @@ SECTIONS
 		__got2_end = .;
 #endif /* CONFIG_PPC32 */
 
-	} :kernel
+	} :text
 
 	. = ALIGN(ETEXT_ALIGN_SIZE);
 	_etext = .;
@@ -163,9 +163,9 @@ SECTIONS
 #endif
 	EXCEPTION_TABLE(0)
 
-	NOTES :kernel :note
+	NOTES :text :note
 	/* Restore program header away from PT_NOTE. */
-	.dummy : { *(.dummy) } :kernel
+	.dummy : { *(.dummy) } :text
 
 /*
  * Init sections discarded at runtime
@@ -180,7 +180,7 @@ SECTIONS
 #ifdef CONFIG_PPC64
 		*(.tramp.ftrace.init);
 #endif
-	} :kernel
+	} :text
 
 	/* .exit.text is discarded at runtime, not link time,
 	 * to deal with references from __bug_table
-- 
2.17.1

