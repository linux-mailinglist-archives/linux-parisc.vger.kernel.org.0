Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEF3DBF84F
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Sep 2019 19:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbfIZR5K (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Sep 2019 13:57:10 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37581 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbfIZR43 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:29 -0400
Received: by mail-pg1-f193.google.com with SMTP id c17so1970028pgg.4
        for <linux-parisc@vger.kernel.org>; Thu, 26 Sep 2019 10:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sVPOVPq0jGnDyk9BlFn1nbib25butANPcZ2psxH1XQk=;
        b=odBS6czNjAFbywCHRPpPNeXtF6OPc2mmJ7PZLPLZJwd6gvLuxf+a4qKWHGXqogA0yi
         p2vEtxVP/XOxYN9zPFrI5aP6IZ37YGa0bwxcd1Y/fvdWegAkmT28yuhfe+dV29/aNHth
         17TyUbj6jzLSgZ65Pr6zSq3TqTL6Z/E1LQYkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sVPOVPq0jGnDyk9BlFn1nbib25butANPcZ2psxH1XQk=;
        b=cH70GTjxhSpLzy2ShsIKOv20xGFcQnxQGSIkSt+pCVdp3MTR99PWHNPPuiwFHafydD
         2Grk1MbysAQmlcwrNSqhW2M5y8xZm/9glAR/Vxq7V19CGAjJ6VGsaRVii+P8mDJ9Lf4N
         0rZtdgXs7iQYrAFC+L7V4bJhlFBmuHdOWAXwvTn+lI+QVb1SMZvoj7E8j822FkwLZn24
         UhFueqNCJyWeik3HavQYrGQYQuQMAFx7jkR1UHNvV9e2XHWjI/p5H5d+gBMj+pL5qqgz
         bIUgmZfhnuKhqLsH1u+ec5q1WNq0a6Fx+jCfVO7mExqeZKSrLlY/0MY32+hN9YAZWBLi
         yi9w==
X-Gm-Message-State: APjAAAWneeRuJ/S6b5sgDaBbrIruiU9Zze/khEDQ9vFhdI2G+7HLg799
        s0yNb+l5iARZYJZTzvDJ9jly2g==
X-Google-Smtp-Source: APXvYqxubPgpOdgeHae/TiPTi3EhrP4iQjDpvLFArEZMN+uNbmRmza3nNTs+U0Mb+pu60jodhZwxMA==
X-Received: by 2002:a17:90a:2481:: with SMTP id i1mr4939410pje.77.1569520587801;
        Thu, 26 Sep 2019 10:56:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v19sm3224270pff.46.2019.09.26.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 10:56:26 -0700 (PDT)
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
Subject: [PATCH 18/29] arm64: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 26 Sep 2019 10:55:51 -0700
Message-Id: <20190926175602.33098-19-keescook@chromium.org>
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
 arch/arm64/kernel/vmlinux.lds.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 81d94e371c95..c6ba2eee0ee8 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -5,6 +5,8 @@
  * Written by Martin Mares <mj@atrey.karlin.mff.cuni.cz>
  */
 
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	8
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/cache.h>
 #include <asm/kernel-pgtable.h>
@@ -135,8 +137,8 @@ SECTIONS
 	. = ALIGN(SEGMENT_ALIGN);
 	_etext = .;			/* End of text section */
 
-	RO_DATA(PAGE_SIZE)		/* everything from this point to     */
-	EXCEPTION_TABLE(8)		/* __init_begin will be marked RO NX */
+	/* everything from this point to __init_begin will be marked RO NX */
+	RO_DATA(PAGE_SIZE)
 
 	. = ALIGN(PAGE_SIZE);
 	idmap_pg_dir = .;
-- 
2.17.1

