Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F71BF81D
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2019 19:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbfIZR4h (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Sep 2019 13:56:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39991 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbfIZR4h (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so1955196pgj.7
        for <linux-parisc@vger.kernel.org>; Thu, 26 Sep 2019 10:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0o22aj+Q2fPal3OzyLNHtFtEJCV1jKXrih1rnY9ZOvQ=;
        b=h2p8CR6CTCVG0EcWBzFZk9M7pS5/grZV7SzSB6Fp/b72sOhC+rJHHanRbr647L3D5O
         3PK+ZsRgr4yUne37ilhSCOXRu+oA9brL1Q3zUBwCc+GNAanTNZBOlRbFkU/6xiHKWXKz
         z9Lk6mr7quDbn6Iv5uFqVP/gtakRm/cG9s24k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0o22aj+Q2fPal3OzyLNHtFtEJCV1jKXrih1rnY9ZOvQ=;
        b=LQtWXvRjRqvabQJ3yVv7ehjm5JmshWfFiaN65dOCkLe9kg11pBUJrQCcRSH50SUT+a
         nyGg5cDxDKJfowVvkBZtWL8oHsDkmk3rcqkx+Jy+4E4OdiIvjcW22X/qlPAhBJJXrliS
         4p3bvJTqEJ5kQNxzieErKUe2OwPw8BynT3BjjtIN16UwQP9RNjmyQLlDMSBLehR/BBjl
         2tkhC20kkzNZnS9TLhpw6E5+nGYJxp0vS+1GVtDqlvXA0jEKUSnSJR53TUozRCyyojzC
         +Nq23a0MTp8UrhIFT/cBp6Q4UWZxz9HxKYkyN5Cxb7iE7uPDT8znyRa3322c9RE3CdAr
         Xz/g==
X-Gm-Message-State: APjAAAUmiz694YtIyhaJH0hUkoOAsEs3xHbc0cYwQDASZNPK9d3OgGyH
        /NPRUu8VmrqU2OETnoMvfTvNhg==
X-Google-Smtp-Source: APXvYqy6S7VpAjQkHoN68ZupzJjzmnjjpPcZsaZVMPIKEdbkFn7g1SNyoioq3hB1BxaJQAQsFZhPUg==
X-Received: by 2002:a62:7a88:: with SMTP id v130mr5261721pfc.184.1569520595802;
        Thu, 26 Sep 2019 10:56:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t68sm6742712pgt.61.2019.09.26.10.56.27
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
Subject: [PATCH 26/29] x86/mm: Remove redundant &s on addresses
Date:   Thu, 26 Sep 2019 10:55:59 -0700
Message-Id: <20190926175602.33098-27-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The &s on addresses are redundant and are better removed to match all
the other similar functions.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/mm/init_64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 26299e9ce6da..e67ddca8b7a8 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1300,9 +1300,9 @@ void mark_rodata_ro(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long rodata_start = PFN_ALIGN(__start_rodata);
-	unsigned long end = (unsigned long) &__end_rodata_hpage_align;
-	unsigned long text_end = PFN_ALIGN(&_etext);
-	unsigned long rodata_end = PFN_ALIGN(&__end_rodata);
+	unsigned long end = (unsigned long)__end_rodata_hpage_align;
+	unsigned long text_end = PFN_ALIGN(_etext);
+	unsigned long rodata_end = PFN_ALIGN(__end_rodata);
 	unsigned long all_end;
 
 	printk(KERN_INFO "Write protecting the kernel read-only data: %luk\n",
-- 
2.17.1

