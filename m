Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30677BF87B
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2019 19:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbfIZR5q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Sep 2019 13:57:46 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46150 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728032AbfIZR4Z (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:25 -0400
Received: by mail-pf1-f196.google.com with SMTP id q5so2223662pfg.13
        for <linux-parisc@vger.kernel.org>; Thu, 26 Sep 2019 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VC2Bmzao7X0NkgB6osdHVMHoKcEQeokPuBQAULnAMEE=;
        b=h2sveAYX3uA/1NDTnSYWWuXYSvlUdaG9aZQBAwdGYVfIjBluySKMZUfy4JB27+8iWL
         C5EhSq87+nJcT0+Ca5wU/iDaeZ8WX6J4clDqF0ZuuVgUhEVA94tdvnWHwFA9bIVlx1cM
         a7693de5zHrwGE51wsBB+Q6I0Q3aQ5nxWanDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VC2Bmzao7X0NkgB6osdHVMHoKcEQeokPuBQAULnAMEE=;
        b=g36nL7g9n2lW49x8HyMWvCTq5Wgz8AR36Q6UBsNyd+bS7iT5oR19D+Ynjea332UVd7
         NceS/5ygGx8ZfaOjj6zK948MMuo1sHDCDao7Ir5jEDjtSH00dI8Ov5WDLd0Tifc1DRGR
         PtHJS+YhSj/0kSIK+k1nhEx4L0cdnizSan5sdORpJzqPC/pTrTRUaDWAHpcV7K7DjR9D
         8Qf0He3rty4QQFmPkiG8CzdyUsvt4C/sj0cjpqU2fQHNqDgfa9R5Bq2j3pDNFdKUCxkR
         TvDkrqR8uA2nardxLFprhDHeh3mc8xjD27C4bUdsJ/wB4sWWEqBUFKA8oaLUxAosArHf
         7r1w==
X-Gm-Message-State: APjAAAXwDqQ2ipNVmbTa+Ny+SoLRv+jzBwx41LAbrPAqaODHXYKwrbb1
        jEaSj2cqAZAh8Nnyjoc7enUIuQ==
X-Google-Smtp-Source: APXvYqx3URWQo+sO/EQWcmMSlPHXmNqT24byGxyOnAx9g17jDBjE8+LmBjBEIagBFZrOvidoBf5ZYw==
X-Received: by 2002:a63:5005:: with SMTP id e5mr4869136pgb.442.1569520585037;
        Thu, 26 Sep 2019 10:56:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z3sm5610456pjd.25.2019.09.26.10.56.18
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
Subject: [PATCH 05/29] ia64: Rename PT_LOAD identifier "code" to "text"
Date:   Thu, 26 Sep 2019 10:55:38 -0700
Message-Id: <20190926175602.33098-6-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In preparation for moving NOTES into RO_DATA, this renames the linker
script internal identifier for the PT_LOAD Program Header from "code"
to "text" to match other architectures.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/ia64/kernel/vmlinux.lds.S | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index 0da58cf8e213..c1067992fcd1 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -13,7 +13,7 @@ ENTRY(phys_start)
 jiffies = jiffies_64;
 
 PHDRS {
-	code   PT_LOAD;
+	text   PT_LOAD;
 	percpu PT_LOAD;
 	data   PT_LOAD;
 	note   PT_NOTE;
@@ -36,7 +36,7 @@ SECTIONS {
 	phys_start = _start - LOAD_OFFSET;
 
 	code : {
-	} :code
+	} :text
 	. = KERNEL_START;
 
 	_text = .;
@@ -68,9 +68,9 @@ SECTIONS {
 	/*
 	 * Read-only data
 	 */
-	NOTES :code :note       /* put .notes in text and mark in PT_NOTE  */
+	NOTES :text :note       /* put .notes in text and mark in PT_NOTE  */
 	code_continues : {
-	} : code               /* switch back to regular program...  */
+	} :text                /* switch back to regular program...  */
 
 	EXCEPTION_TABLE(16)
 
@@ -102,9 +102,9 @@ SECTIONS {
 		__start_unwind = .;
 		*(.IA_64.unwind*)
 		__end_unwind = .;
-	} :code :unwind
+	} :text :unwind
 	code_continues2 : {
-	} : code
+	} :text
 
 	RODATA
 
@@ -224,7 +224,7 @@ SECTIONS {
 	_end = .;
 
 	code : {
-	} :code
+	} :text
 
 	STABS_DEBUG
 	DWARF_DEBUG
-- 
2.17.1

