Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9EDF247CE5
	for <lists+linux-parisc@lfdr.de>; Tue, 18 Aug 2020 05:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgHRDeX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 17 Aug 2020 23:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgHRDeR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 17 Aug 2020 23:34:17 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE2FC061342
        for <linux-parisc@vger.kernel.org>; Mon, 17 Aug 2020 20:34:16 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id x10so20442865ybj.19
        for <linux-parisc@vger.kernel.org>; Mon, 17 Aug 2020 20:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=C50/vuMgqcrA+1VnnzXbJiGS1cNeYwcSIDfO7/hcWOU=;
        b=pqd8wYjiXwYWoRIaID0SosAHj16lSJz/ifWBqNsr2xgMKXXHOVE7Ap/UWvfXQniwA1
         0dtZDa3DobHBdB3i0hDSbaypKY4LELbRfjsd3dgmC9qNy8rcEH101KqlKS0T+f9e3gT0
         BE6FysjxV/pyjEhGnNjzxai6RJCVgjFAAGEMUcNJ3WU7zVFv2rmOfP6vKiZbNIafgICv
         17evJflcuKHCWtXG/8q/X/I6fnTExz7+a+EI3lzMjx7jDBoHS+Rvi0rs+DeFSqx6aQ6R
         aS/eMV/PYT6fnYm+azIra+Ra68MixB4XQyppLElhff46hy0xvn+wWBuGzcg8+O6wXRIl
         a9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=C50/vuMgqcrA+1VnnzXbJiGS1cNeYwcSIDfO7/hcWOU=;
        b=cHDv4+jDjM00PN6GzOAoD9hIIpDhCTpXrq3D0ONnmDyfYONNdz3Mn2Vef0RHD440H9
         z6E2HDokBFsmYsuqwKSdZeg9iCBwYa4i7sAUVrIQofFvCQbaa3LaUAbtT9JG0lxn9bW6
         J1NtZ/6+3dlFzQnuWUGAHceKBGNxVaGGuhbZv0PJSWJGNNnsjUJ+ssagNgrsRZh8O0p8
         yQPdpRcw9rN4kqoEXCejA9ICSrwsD7n9h3RqsNR8S+Q5VkyndftPbsqa0Ds1cxYscT0w
         KAgOav+/hmv36f3JIWGG38j0tVEezPm2fL2FFuB0dRDanK69Wl5JNnU0yaE3ZR2heZKp
         ZnYw==
X-Gm-Message-State: AOAM533k1OAHc/Y4YAe9wtkxRq2Z+NMNXCvwG4v3OwENeF804YBmRaC+
        uaDhNR/CEzqtEnFp4rZrArwfsZI=
X-Google-Smtp-Source: ABdhPJxwQRwAMWNrUOuKqNkI5joprptUVjSLR1d42JMj7BJy46pPo5IKuHr0ukBzS7a6VQiFGT5HBso=
X-Received: by 2002:a25:400e:: with SMTP id n14mr26327126yba.420.1597721654941;
 Mon, 17 Aug 2020 20:34:14 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:33:49 -0700
In-Reply-To: <cover.1597720138.git.pcc@google.com>
Message-Id: <d93b503a926f45e752178bb61f451a426a558260.1597720138.git.pcc@google.com>
Mime-Version: 1.0
References: <cover.1597720138.git.pcc@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v9 4/6] signal: define the SA_UNSUPPORTED bit in sa_flags
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

This bit will never be supported in the uapi. The purpose of this flag
bit is to allow userspace to distinguish an old kernel that does not
clear unknown sa_flags bits from a kernel that supports every flag bit.

In other words, if userspace finds that this bit remains set in
oldact.sa_flags, it means that the kernel cannot be trusted to have
cleared unknown flag bits from sa_flags, so no assumptions about flag
bit support can be made.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
View this change in Gerrit: https://linux-review.googlesource.com/q/Ic2501ad150a3a79c1cf27fb8c99be342e9dffbcb

 include/uapi/asm-generic/signal-defs.h | 7 +++++++
 kernel/signal.c                        | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
index 91000b6b97e0..c30a9c1a77b2 100644
--- a/include/uapi/asm-generic/signal-defs.h
+++ b/include/uapi/asm-generic/signal-defs.h
@@ -13,6 +13,12 @@
  * SA_RESETHAND clears the handler when the signal is delivered.
  * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
  * SA_NODEFER prevents the current signal from being masked in the handler.
+ * SA_UNSUPPORTED is a flag bit that will never be supported. Kernels from
+ * before the introduction of SA_UNSUPPORTED did not clear unknown bits from
+ * sa_flags when read using the oldact argument to sigaction and rt_sigaction,
+ * so this bit allows flag bit support to be detected from userspace while
+ * allowing an old kernel to be distinguished from a kernel that supports every
+ * flag bit.
  *
  * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
  * Unix names RESETHAND and NODEFER respectively.
@@ -42,6 +48,7 @@
  * The following bits are used in architecture-specific SA_* definitions and
  * should be avoided for new generic flags: 3, 4, 5, 6, 7, 8, 9, 16, 24, 25, 26.
  */
+#define SA_UNSUPPORTED	0x00000400
 
 #define SA_NOMASK	SA_NODEFER
 #define SA_ONESHOT	SA_RESETHAND
diff --git a/kernel/signal.c b/kernel/signal.c
index 348b7981f1ff..664a6c31137e 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3984,6 +3984,12 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
 	if (oact)
 		*oact = *k;
 
+	/*
+	 * Make sure that we never accidentally claim to support SA_UNSUPPORTED,
+	 * e.g. by having an architecture use the bit in their uapi.
+	 */
+	BUILD_BUG_ON(SA_UAPI_FLAGS & SA_UNSUPPORTED);
+
 	/*
 	 * Clear unknown flag bits in order to allow userspace to detect missing
 	 * support for flag bits and to allow the kernel to use non-uapi bits
-- 
2.28.0.220.ged08abb693-goog

