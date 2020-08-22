Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59DA24E58A
	for <lists+linux-parisc@lfdr.de>; Sat, 22 Aug 2020 07:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgHVFKa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 22 Aug 2020 01:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgHVFK3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 22 Aug 2020 01:10:29 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92667C061573
        for <linux-parisc@vger.kernel.org>; Fri, 21 Aug 2020 22:10:29 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id u189so4341423ybg.17
        for <linux-parisc@vger.kernel.org>; Fri, 21 Aug 2020 22:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=dHvj1iKs0moCQmfMOLtWQThMXTt6DvaOrave3mL0FWI=;
        b=Zl8VQ73fPg2962wC3F6UIc9LACbeVCWJ376aaapfi4hIwdD84ENJv6DWi6qpZ4ZtQO
         eU8s8LO0KZ1gWzqLJZuRpo+2ZsVwBTnmn5Bl8DbAFtIezRO+bPIRfOuutWTzHoPveZQR
         a5ymC1qkkU8A6rE26nLCbg9lqDmbAEuyd83uCKzOtimh9AY/JFvIKVTGxqaeXoUJChIg
         P/n2iP39TkMbOz2M2+CWTczJhweP0+TnXuuuMIEOnB4xVSc1CHhbOZLd0Ow36iHt71aC
         k942fBvVrtBeDs2Q7VfDuun8NCldVnDMSSYor952JYgulamWsqWRpFLkhuWZ0pjO80+V
         VCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dHvj1iKs0moCQmfMOLtWQThMXTt6DvaOrave3mL0FWI=;
        b=JRE2xGIclhc/cw+BuBxgCt0pwgHakuYoXKqjA0YZMfA7MAgtOEwaneQAmdvzUK83DV
         yPmllsNnxd7LcI60PCVKk5Np1Lt7djD/CdgMy6dGfZIAUSwbt8rmaPqM95/3cYWup+2g
         k+KcIgKh8xL0wTQ1kjkKNmEFNAN0gejWy7AiRGw63W65l6fwpzeKcHwaCys02tdx8g85
         W/5Dg0kevlBWjzpkPUqq+PiTBCsafg3SOq/cKdh6WUH5Nr7wbipSy/1tLC7kGTr0MsB7
         yl3/DupT5D3by1NzkN0fXUB78TTcFM4xZuEc8LG1lD/JvO1fCMYnyf+LpzcxhG4KDpjr
         gJZA==
X-Gm-Message-State: AOAM531Iq/uLSmygl8TvD0e4U5cIw/YDSIlCc3AKVIApFqIiS9CVA8Zb
        Cdw1n8XHxoEMsioNe8rqFJjCRQ8=
X-Google-Smtp-Source: ABdhPJyMMY0gYwn76duYMa/vKZXGobx29XUIVwrXBZ+xukoOdJnb98lTpXhY6/UMFaPwasVrHGlJMsQ=
X-Received: from pcc-desktop.svl.corp.google.com ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:a25:7a42:: with SMTP id v63mr7972338ybc.4.1598073028810;
 Fri, 21 Aug 2020 22:10:28 -0700 (PDT)
Date:   Fri, 21 Aug 2020 22:10:11 -0700
In-Reply-To: <cover.1598072840.git.pcc@google.com>
Message-Id: <efdbcb5fc45a2dbdf1e2363d68ab0f7b5a276980.1598072840.git.pcc@google.com>
Mime-Version: 1.0
References: <cover.1598072840.git.pcc@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v10 1/7] parisc: start using signal-defs.h
From:   Peter Collingbourne <pcc@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     Peter Collingbourne <pcc@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Richard Henderson <rth@twiddle.net>,
        linux-parisc@vger.kernel.org,
        David Spickett <david.spickett@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

We currently include signal-defs.h on all architectures except parisc.
Make parisc fall in line. This will make maintenance easier once the
flag bits are moved here.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
View this change in Gerrit: https://linux-review.googlesource.com/q/If03a5135fb514fe96548fb74610e6c3586a04064

 arch/parisc/include/uapi/asm/signal.h  | 9 +--------
 include/uapi/asm-generic/signal-defs.h | 6 ++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/uapi/asm/signal.h
index d38563a394f2..92a1c7ea44b4 100644
--- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -69,14 +69,7 @@
 #define MINSIGSTKSZ	2048
 #define SIGSTKSZ	8192
 
-
-#define SIG_BLOCK          0	/* for blocking signals */
-#define SIG_UNBLOCK        1	/* for unblocking signals */
-#define SIG_SETMASK        2	/* for setting the signal mask */
-
-#define SIG_DFL	((__sighandler_t)0)	/* default signal handling */
-#define SIG_IGN	((__sighandler_t)1)	/* ignore signal */
-#define SIG_ERR	((__sighandler_t)-1)	/* error return from signal */
+#include <asm/signal-defs.h>
 
 # ifndef __ASSEMBLY__
 
diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
index e9304c95ceea..ecdf6312bfa5 100644
--- a/include/uapi/asm-generic/signal-defs.h
+++ b/include/uapi/asm-generic/signal-defs.h
@@ -15,8 +15,14 @@
 #endif
 
 #ifndef __ASSEMBLY__
+#ifndef __hppa__
+/*
+ * These have a special definition on parisc, see:
+ * arch/parisc/include/uapi/asm/signal.h
+ */
 typedef void __signalfn_t(int);
 typedef __signalfn_t __user *__sighandler_t;
+#endif
 
 typedef void __restorefn_t(void);
 typedef __restorefn_t __user *__sigrestore_t;
-- 
2.28.0.297.g1956fa8f8d-goog

