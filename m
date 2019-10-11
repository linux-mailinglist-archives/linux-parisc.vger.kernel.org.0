Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7651AD359F
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2019 02:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbfJKAMy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Oct 2019 20:12:54 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37977 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfJKAMx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Oct 2019 20:12:53 -0400
Received: by mail-pg1-f195.google.com with SMTP id x10so4699985pgi.5
        for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2019 17:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C4qrRt1wPf/MBbE+aHUnjpKB3JMiaG6wbnmkvfoIFU0=;
        b=UICOc5TKza9BTCIUokRpRXRixWvfiu//j+nLFORdk7UGk/JwyzBWx+ycolyJCZr/Zj
         USYjJEh9S6rYvbkeSR5dqh4t0wO42rK96mEpNN2uDcZMnixq8tbOTsEogIYGcWgVfWSY
         D4i8QsjQVcM0qjRwO2F5cvKbTZ8BLcWZFx7T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C4qrRt1wPf/MBbE+aHUnjpKB3JMiaG6wbnmkvfoIFU0=;
        b=ZvTQn+AZY4zwJVPY5QQpGxy1/Hp6YUtbawleGj52XpgKrcEUM1Q0ip7nFdDzmeMOTO
         hBoJCA9a3SzEYVYSyqK87TSQozv6XpkZIPmLNZJueP9jM6nO8I4WETsjBIq4zUv4dErA
         roQ3EPqb+LICtGKtQ9m0fLoqNV6RC4ThRu0vQBnLQXCCMK5G8ug1agwOimdlL5s+ZB65
         Jfhla6gzzlPsNSJnkFTUNBuJJzcHMManBwKWhzmHXqZpV31vSldqkNwBNHSOWFJTmomB
         weDH/Gus/4bYSpOyHtqrusHvQonqMC8jyDo2c6R6kCpWb9l2E7XbpeTPK3DNoML8UgH6
         cKGg==
X-Gm-Message-State: APjAAAVfdpuFZHxpbNyuP9Z3L36l3uEtd158xJM7XtkcU1RgmoWYDmD4
        S2XxgL+/6/rdpVzfzMhCFjYPSQ==
X-Google-Smtp-Source: APXvYqwliD8aT2m8D5BS3pRkZKxejc1RX6nlHmvajkiWktD94kckhfSBhz7/A5hJ2lTUaMfRy1yv0g==
X-Received: by 2002:a62:e206:: with SMTP id a6mr13749471pfi.245.1570752773224;
        Thu, 10 Oct 2019 17:12:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w2sm7937638pfn.57.2019.10.10.17.12.51
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
Subject: [PATCH v2 17/29] alpha: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 10 Oct 2019 17:05:57 -0700
Message-Id: <20191011000609.29728-18-keescook@chromium.org>
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
 arch/alpha/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index edc45f45523b..bc6f727278fd 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 #define EMITS_PT_NOTE
+#define RO_EXCEPTION_TABLE_ALIGN	16
 
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/thread_info.h>
@@ -35,7 +36,6 @@ SECTIONS
 	_etext = .;	/* End of text section */
 
 	RO_DATA(4096)
-	EXCEPTION_TABLE(16)
 
 	/* Will be freed after init */
 	__init_begin = ALIGN(PAGE_SIZE);
-- 
2.17.1

