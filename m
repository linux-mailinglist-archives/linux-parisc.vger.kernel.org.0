Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480DB247CE3
	for <lists+linux-parisc@lfdr.de>; Tue, 18 Aug 2020 05:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgHRDeO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 17 Aug 2020 23:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgHRDeN (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 17 Aug 2020 23:34:13 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D72C061389
        for <linux-parisc@vger.kernel.org>; Mon, 17 Aug 2020 20:34:13 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id y30so12352824qvy.9
        for <linux-parisc@vger.kernel.org>; Mon, 17 Aug 2020 20:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=oo0pTnrmudx+T/LZl7NKgvvgOx2ScFEDi+Ld6DsnEYA=;
        b=E5eLUZXKyZdZt5jZAeoIi5h5DON/gzFXveM5r/58ZtdTNUuZDKrrote/usrHwVrim1
         OYIo2wDOqpk6qPNwMjWuxuI3oWu6k3/bsMGUb1OqOJ/bFEsO61t1lnTdsyvFrXyrRCjO
         7dyZedvX0CTmvV3AlMAFCxb6ewv6ZTZUPZLkcP0gVsbMD84niwyheiNgZ0Hgk8IThVhi
         7+bjpktzi3FHhOlVCblmOw6r1A9gGEhGtMWp/AXW18IuimKCf5zUmfqmMIdphvBn88RC
         x1L0+mfX6T77uy4/EHB6ojrE5wcYu3TCSCKTJrVEtQJZ9TFIKhrWCRlImW3L8Hd3eLQg
         64Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=oo0pTnrmudx+T/LZl7NKgvvgOx2ScFEDi+Ld6DsnEYA=;
        b=gudauDfMoJGR4Ik+Cx4u85pJSowYjJ9g1Q6MHllNPrGt5vPoxBVBkxH6hNFD6XLCxC
         O3tEAlyTiqerjUcN0O2Mn7hUCDURIP/HkUjCK6JRZUly54AyMD4qx+GJRT0YCIlFtIxf
         Bzstrd/qOAMYxw0BTSd1PRtBxKbsM4GSLfODOJuGca8EoSe5Y6zz/i8+U5IWk3gfegUO
         FEsgK1qGvaNn4cJOuHifovtdkC+0oeOt3LZmsPOXeoAYHE+Z+h6fdnuo/t7qqWTNU93Q
         XsE0Eh6rrCt+sRQnGKRPI9h8M43oF9QNJzUlNV6cA8kHESjng2Xc59OvruXzKWOBaZrN
         wyHA==
X-Gm-Message-State: AOAM531NNLiBrTV6nFmdTHE7GlKidVNyQt74WrBpdwnYTusGRSsglBsb
        RJ0MtUMLfxPcskbCvwZvL6B+uaQ=
X-Google-Smtp-Source: ABdhPJwhRbaVy+KijVusyRCHgYhWLEP0EPv8B3cwxnf1KrzAsJjfpA4cLEJBYmdYxx032wAIClhDk74=
X-Received: by 2002:a05:6214:184b:: with SMTP id d11mr17407724qvy.21.1597721652412;
 Mon, 17 Aug 2020 20:34:12 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:33:48 -0700
In-Reply-To: <cover.1597720138.git.pcc@google.com>
Message-Id: <68bd2d6544fb17bbe2fb90862e28ec38e079549a.1597720138.git.pcc@google.com>
Mime-Version: 1.0
References: <cover.1597720138.git.pcc@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v9 3/6] signal: clear non-uapi flag bits when
 passing/returning sa_flags
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

This allows userspace to detect missing support for flag bits and
allows the kernel to use non-uapi bits internally, as we are already
doing in arch/x86 for two flag bits. Now that this change is in
place, we no longer need the code in arch/x86 that was hiding these
bits from userspace, so remove it.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
View this change in Gerrit: https://linux-review.googlesource.com/q/I35aab6f5be932505d90f3b3450c083b4db1eca86

 arch/arm/include/asm/signal.h    |  4 ++++
 arch/parisc/include/asm/signal.h |  4 ++++
 arch/x86/kernel/signal_compat.c  |  7 -------
 include/linux/signal_types.h     | 12 ++++++++++++
 kernel/signal.c                  | 10 ++++++++++
 5 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
index 65530a042009..d1070a783993 100644
--- a/arch/arm/include/asm/signal.h
+++ b/arch/arm/include/asm/signal.h
@@ -17,6 +17,10 @@ typedef struct {
 	unsigned long sig[_NSIG_WORDS];
 } sigset_t;
 
+#define SA_UAPI_FLAGS                                                          \
+	(SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_THIRTYTWO |             \
+	 SA_RESTORER | SA_ONSTACK | SA_RESTART | SA_NODEFER | SA_RESETHAND)
+
 #define __ARCH_HAS_SA_RESTORER
 
 #include <asm/sigcontext.h>
diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
index 715c96ba2ec8..ad06e14f6e8a 100644
--- a/arch/parisc/include/asm/signal.h
+++ b/arch/parisc/include/asm/signal.h
@@ -21,6 +21,10 @@ typedef struct {
 	unsigned long sig[_NSIG_WORDS];
 } sigset_t;
 
+#define SA_UAPI_FLAGS                                                          \
+	(SA_ONSTACK | SA_RESETHAND | SA_NOCLDSTOP | SA_SIGINFO | SA_NODEFER |  \
+	 SA_RESTART | SA_NOCLDWAIT | _SA_SIGGFAULT)
+
 #include <asm/sigcontext.h>
 
 #endif /* !__ASSEMBLY */
diff --git a/arch/x86/kernel/signal_compat.c b/arch/x86/kernel/signal_compat.c
index 9ccbf0576cd0..c599013ae8cb 100644
--- a/arch/x86/kernel/signal_compat.c
+++ b/arch/x86/kernel/signal_compat.c
@@ -165,16 +165,9 @@ void sigaction_compat_abi(struct k_sigaction *act, struct k_sigaction *oact)
 {
 	signal_compat_build_tests();
 
-	/* Don't leak in-kernel non-uapi flags to user-space */
-	if (oact)
-		oact->sa.sa_flags &= ~(SA_IA32_ABI | SA_X32_ABI);
-
 	if (!act)
 		return;
 
-	/* Don't let flags to be set from userspace */
-	act->sa.sa_flags &= ~(SA_IA32_ABI | SA_X32_ABI);
-
 	if (in_ia32_syscall())
 		act->sa.sa_flags |= SA_IA32_ABI;
 	if (in_x32_syscall())
diff --git a/include/linux/signal_types.h b/include/linux/signal_types.h
index f8a90ae9c6ec..e792f29b5846 100644
--- a/include/linux/signal_types.h
+++ b/include/linux/signal_types.h
@@ -68,4 +68,16 @@ struct ksignal {
 	int sig;
 };
 
+#ifndef SA_UAPI_FLAGS
+#ifdef SA_RESTORER
+#define SA_UAPI_FLAGS                                                          \
+	(SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
+	 SA_NODEFER | SA_RESETHAND | SA_RESTORER)
+#else
+#define SA_UAPI_FLAGS                                                          \
+	(SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
+	 SA_NODEFER | SA_RESETHAND)
+#endif
+#endif
+
 #endif /* _LINUX_SIGNAL_TYPES_H */
diff --git a/kernel/signal.c b/kernel/signal.c
index 42b67d2cea37..348b7981f1ff 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3984,6 +3984,16 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
 	if (oact)
 		*oact = *k;
 
+	/*
+	 * Clear unknown flag bits in order to allow userspace to detect missing
+	 * support for flag bits and to allow the kernel to use non-uapi bits
+	 * internally.
+	 */
+	if (act)
+		act->sa.sa_flags &= SA_UAPI_FLAGS;
+	if (oact)
+		oact->sa.sa_flags &= SA_UAPI_FLAGS;
+
 	sigaction_compat_abi(act, oact);
 
 	if (act) {
-- 
2.28.0.220.ged08abb693-goog

