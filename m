Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB1E9BF8CA
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2019 20:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbfIZSFn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Sep 2019 14:05:43 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46807 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727939AbfIZSFW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Sep 2019 14:05:22 -0400
Received: by mail-pl1-f193.google.com with SMTP id q24so1355232plr.13
        for <linux-parisc@vger.kernel.org>; Thu, 26 Sep 2019 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oto3YJoz+uDS7YkHckkDLPsuLHSJE59Ic1Zvlvk3JIM=;
        b=Yg3+62araTz65OUjSMd7uRtDTc4qLv27ScfzOQEBsjmErC4baR+vactZeQ8EDHTDl3
         4m6/i6nTkUszRwcGPx+4rzXQZxnWhhz2/IpIkxEyLfsUcTwCPuJ3shP5kaVVlXFxeae6
         oJjvZwVhpbm6kHMwMmWob89Fc5KJC8pyBS2O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oto3YJoz+uDS7YkHckkDLPsuLHSJE59Ic1Zvlvk3JIM=;
        b=s0UTGHHO23SK3UEPeHVq5GHdlmbwnIhHiRIhnEhrniPT4ml+JxqWwjx7Pz8dRAaBrN
         LJpWcQXlMHgVFUhSn/UEDxLV2unFcUpoFqNZWrccKXfv80CfxFKAafYmIZ1cTj0DUkWX
         vzapfSbJARyhf2/0MNB+LOMFiRwUVVBCBZQxCLtplJ6oDsUsQRgCNmQJGNMDit6/4Y/i
         5Xs2VJ0wkuBx5uTNGbTq5VVLfwBSZiXifm62+SBNsjNxxaT/6BnIc4EslnMhd6y7poOB
         tjvOe33Xf4ygdTfknem6xPAPDztjTyh6cXE+m26Vd1rUu5ZN1+F9EUYhpxhlZNiUp8Wk
         AYYw==
X-Gm-Message-State: APjAAAXiQb6ZW6UYUVdgf38iHnMSiyAU+UMinLIdiOITXHyH7blFTgnw
        o4SgL01BANQyIDbE5iAn7+mGoQ==
X-Google-Smtp-Source: APXvYqyRIx3xRHb+mNaLLP0zVX1hp9OZQXgJDPhnQfQ+Lb8Ihhv0yx8B8A03PaGE2C0DjuqCQpfKMg==
X-Received: by 2002:a17:902:be0c:: with SMTP id r12mr5340803pls.190.1569521121688;
        Thu, 26 Sep 2019 11:05:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k15sm3366000pfa.65.2019.09.26.11.05.19
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
Subject: [PATCH 23/29] parisc: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 26 Sep 2019 10:55:56 -0700
Message-Id: <20190926175602.33098-24-keescook@chromium.org>
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
 arch/parisc/kernel/vmlinux.lds.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 12b3d7d5e9e4..1dc2f71e62b1 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -19,6 +19,7 @@
 				*(.data..vm0.pte)
 
 #define CC_USING_PATCHABLE_FUNCTION_ENTRY
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	8
 
 #include <asm-generic/vmlinux.lds.h>
 
@@ -129,9 +130,6 @@ SECTIONS
 
 	RO_DATA(8)
 
-	/* RO because of BUILDTIME_EXTABLE_SORT */
-	EXCEPTION_TABLE(8)
-
 	/* unwind info */
 	.PARISC.unwind : {
 		__start___unwind = .;
-- 
2.17.1

