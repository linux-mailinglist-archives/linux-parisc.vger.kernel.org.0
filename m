Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797442C5475
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Nov 2020 14:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389604AbgKZNGM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Nov 2020 08:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388478AbgKZNGM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Nov 2020 08:06:12 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF5EC0613D4
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2020 05:06:10 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id o24so2266355ljj.6
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2020 05:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bVFZ7zN3T8DBgVewvDGk0wYV7GNvIyTSelX8oIl5Vig=;
        b=LgG//u/34TpLxyTHZbq9vwY+kjvNUtJv+MwE1ueoc7pw86GZFr31qkif4PZNVWX/JN
         HBiJ4VIiRNC93muQSHrf/NIvANpDNrbjQmUiDIEd/Lha+Ra1/pbff6gGvGsZ8cTnd3F3
         5FxJtyS9PJjtC4BT8HEhnx3wY7E8BWJsBWe8sHB+bZpbcWJWvcsR66GlVb+AHcCI9ilY
         lnjE+T2f4rSXb2KWLaAWShyqpDe/+9VitPuotJQkvhYZ8Ma3KKKYHUINkIZxziZF8cxQ
         0RVfbXZQGwcFJN4zZZC3Ogp3jth78f83mrne/dW+8RGcikKlOn4wIQns8sYlptm3oAcR
         6K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bVFZ7zN3T8DBgVewvDGk0wYV7GNvIyTSelX8oIl5Vig=;
        b=qID4wNvfbm2kGaDjubtjE3MkxKFFrMKF3TCfKBbFvcMM0sBT32lDXtmUbYW5Dtfz7X
         3khDao9GyeCTPsiJ60z8i6BIAq7Fme7js8w+XfSmMG53nMUI2HJfOLbRRCoqFOzWjCp3
         kCqpbISXyvRJvg3NEcn61Sdb9y104JYKiJo8MCrLtQpEil2T29l22OzSATTbWK3gmu95
         pSHgIUKL5LXItuYl5mBQsyVC0VbSIVbX8NMKy9d1vPxWdH6fRG4ZcsqX2+eNo5N2ilp5
         g4VVdxEmxo7MWkOwHI1WKHiRpb2Y1P4po5AiU1vMuixYBRbg9xttdPpuNmec2LYM2Kck
         Fg5A==
X-Gm-Message-State: AOAM532xEoew1LjFOG8gFaakF4IHLTMXpPN8Tbj1sWOoQ3z/74cr947l
        7y4jOZ/MbourOIQ6BIp4ErAH6A==
X-Google-Smtp-Source: ABdhPJxsVDYPFnvi2vlq4Pg/9g20/x12UCBE5N/DxHXzvPkj+rd/JfvAo7+DrV7B50REOa0hSj+vTw==
X-Received: by 2002:a2e:95d4:: with SMTP id y20mr1189753ljh.74.1606395968935;
        Thu, 26 Nov 2020 05:06:08 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id a16sm310574lfg.16.2020.11.26.05.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:06:08 -0800 (PST)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     James.Bottomley@HansenPartnership.com, deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] parisc: signal: remove _SA_SIGGFAULT
Date:   Thu, 26 Nov 2020 14:06:06 +0100
Message-Id: <20201126130606.2290438-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When building tinyconfig on parisc the following error shows up:

/tmp/kernel/signal.c: In function 'do_sigaction':
/tmp/arch/parisc/include/asm/signal.h:24:30: error: '_SA_SIGGFAULT' undeclared (first use in this function); did you mean 'SIL_FAULT'?
 #define __ARCH_UAPI_SA_FLAGS _SA_SIGGFAULT
                              ^~~~~~~~~~~~~

The changes in the two individual patches listed in 'Fixes' below are
OK.  Remove the _SA_SIGGFAULT define since PH-UX isn't going to be
supported according to commit 41f5a81c07cd ("parisc: Drop HP-UX specific
fcntl and signal flags").

Fixes: 23acdc76f179 ("signal: clear non-uapi flag bits when passing/returning sa_flags")
Fixes: 41f5a81c07cd ("parisc: Drop HP-UX specific fcntl and signal flags")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/parisc/include/asm/signal.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
index 30dd1e43ef88..715c96ba2ec8 100644
--- a/arch/parisc/include/asm/signal.h
+++ b/arch/parisc/include/asm/signal.h
@@ -21,8 +21,6 @@ typedef struct {
 	unsigned long sig[_NSIG_WORDS];
 } sigset_t;
 
-#define __ARCH_UAPI_SA_FLAGS	_SA_SIGGFAULT
-
 #include <asm/sigcontext.h>
 
 #endif /* !__ASSEMBLY */
-- 
2.29.2

