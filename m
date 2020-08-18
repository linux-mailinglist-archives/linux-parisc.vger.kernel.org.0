Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60776247CE1
	for <lists+linux-parisc@lfdr.de>; Tue, 18 Aug 2020 05:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgHRDeL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 17 Aug 2020 23:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgHRDeI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 17 Aug 2020 23:34:08 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7E8C061389
        for <linux-parisc@vger.kernel.org>; Mon, 17 Aug 2020 20:34:08 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id q18so12243078qkq.11
        for <linux-parisc@vger.kernel.org>; Mon, 17 Aug 2020 20:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HhqB7tysGvpvjsu6480OhGk1+/lXC6B0Q4dHLp4XXBg=;
        b=Gl3PH0RaEHU6miVdlzYqEwCn0VhJcTKfA/QNx4OZvz2XQk6KPGa6BX+LGSCmKClnkj
         IS4BfF9TyIUMLYRJxAm6GhJFqpfzl/xYJG4c+j6hSw7alf+X63SXo5k4RNM8tExRYWhF
         lJUB5eahnCzT55UHc9lUTU9ynUbWpW8EhLvCU827bffzrY4irWHIUqcZMBYDtsRsY3ja
         EyZf6qg2ASoaf7mUeQ9SVXVMEaXDeHEsmySVFO8NgrFNyGftL/yXXy7sFL+aWTrl4G0X
         4SI+zS6Vg5KOFkI3sgUtgJ+QV2T+52tnx+aDyV7SEfNJo7nV10hPJ6bUkD48rh8G9/jc
         ylcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HhqB7tysGvpvjsu6480OhGk1+/lXC6B0Q4dHLp4XXBg=;
        b=s2uPR9p1/vbILdjKcnvNi73OReoZuj/C6jtsxyTv0SmVX9sMznaVRzG1n1ruO44pLn
         oeqC/BNJhjWJiYZ9BR9evWRfRok+30Mupy/sVy46Ffg8RScYBSJT4ixOEOCg6Fgj0bIV
         8GLbIrjlNVS0459yszF8I48GIlFeHBBkcy4Q2M8KyqmerEeJCvYNjPQYznoVFUOQ4z7B
         1eA5h+i+zdj7dsRIIfFoKs9Wq1L7yPmmw7gPqG+hDq2GQCWkk0tIRpkdgJZc/qQGuwxG
         F2Sx3uR02H4LJY66Bkdt2iF+Ac6Oy8gdiZgLxCYhn6zuih88ogEpXIileUnUEL81uBEU
         N9+g==
X-Gm-Message-State: AOAM533Rljg8kK4oVslM3+Ow4YbryWG+mV9ImQakABFPXkbTCPfyvX9Y
        N7SnecPZX5Yl8QoWY1ptFBvG5Ps=
X-Google-Smtp-Source: ABdhPJyy0GT7eyrTg5qYOg+WqaT9atEH6ARG8Jn8KWRUOukuE1dfbjFVPFNugvIkdV2rIG97Tka9CSI=
X-Received: by 2002:ad4:5849:: with SMTP id de9mr16907792qvb.22.1597721647293;
 Mon, 17 Aug 2020 20:34:07 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:33:46 -0700
In-Reply-To: <cover.1597720138.git.pcc@google.com>
Message-Id: <efdbcb5fc45a2dbdf1e2363d68ab0f7b5a276980.1597720138.git.pcc@google.com>
Mime-Version: 1.0
References: <cover.1597720138.git.pcc@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v9 1/6] parisc: start using signal-defs.h
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
2.28.0.220.ged08abb693-goog

