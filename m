Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156C224E58D
	for <lists+linux-parisc@lfdr.de>; Sat, 22 Aug 2020 07:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgHVFKg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 22 Aug 2020 01:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgHVFKf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 22 Aug 2020 01:10:35 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0573C061573
        for <linux-parisc@vger.kernel.org>; Fri, 21 Aug 2020 22:10:35 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id p138so4368901yba.12
        for <linux-parisc@vger.kernel.org>; Fri, 21 Aug 2020 22:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=CzaiCCk/tmQkpna8t+AyN0umynxVPZ5p6jzvAHIDwfM=;
        b=UIW9wmXbGVYHKhqDEhlWmDGB2IbEOJy2m5Fo34kXuErLfcyHhXUXjI2Y0XI4jCK3Ww
         4djx8hkdnRzXAGt8c16ie49T+PLMhahp8BSI77dlPWNYMd7UnoUq6gmigxbDpZHIPL3j
         FieAez4T06FYbEYgb7+trkkJLLduc7/IkS6W+bfIQza+HUXYnvKPv7SYH75lkN14yAqY
         zSIOuyovSjCmwnJAtxkwuSbaE6K3cX2V95X5mIP8OLJQGD6WS2ZcqZKINr2xbwD8Y0f8
         DNWueg7Fj4gaTQOQXXodTfglaTu55cG2KsBTSVBS1T8MoKLdJzSrFeniS2IetyLxNMtZ
         PszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=CzaiCCk/tmQkpna8t+AyN0umynxVPZ5p6jzvAHIDwfM=;
        b=iC9qLdZNOi+SOuzwYOayzRN8V9adpJ+sMAWCoQJfVjzSehv9aOwE7KBLGd2SvbCin9
         gnuTSlEwjFoxy8utMWAubTHTv/5NOoBph0hy4Q0lQuWN9U7/J367qNfhi07oPscpQ9HD
         zzXtkP19QfS0KlsnkeLvu7kiaU9JvcnhA26U3uje0ItGInYFYY/4yGkl+XoP6VaGR3VH
         eXGH5rsJHP6YyFOfdALC2EEBb7hJqHirj/aMVTnOnAWR4IdBdTb5MXA1LhOyzxZt/G1S
         Z1HaDSmQepcq+NBU4tXRTVmUrKogh6T6y7UtTh6OvGiJdrCR8nwZt9Dz47WmMe2zBwPp
         C6Rg==
X-Gm-Message-State: AOAM5309ydSMsfDlhf1l26/0oRm9wIrvBvd2vyImz9dTgTlkDSGQWYy6
        HXFEp5LzRDb71TnLm0pukY7oifY=
X-Google-Smtp-Source: ABdhPJzaeCeqahBEnR0P2M1+fMOk/d5exsENSGbXZeWp0bdqm2nfSWcG4vji5MvvlfxeI1VJ8DoQadk=
X-Received: from pcc-desktop.svl.corp.google.com ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:a25:d946:: with SMTP id q67mr7305852ybg.517.1598073034645;
 Fri, 21 Aug 2020 22:10:34 -0700 (PDT)
Date:   Fri, 21 Aug 2020 22:10:14 -0700
In-Reply-To: <cover.1598072840.git.pcc@google.com>
Message-Id: <f37a8b86c53be4cc440a73be4123e0419deefe5f.1598072840.git.pcc@google.com>
Mime-Version: 1.0
References: <cover.1598072840.git.pcc@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v10 4/7] signal: define the SA_UNSUPPORTED bit in sa_flags
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
index 319628058a53..e853cbe8722d 100644
--- a/include/uapi/asm-generic/signal-defs.h
+++ b/include/uapi/asm-generic/signal-defs.h
@@ -14,6 +14,12 @@
  * SA_RESTART flag to get restarting signals (which were the default long ago)
  * SA_NODEFER prevents the current signal from being masked in the handler.
  * SA_RESETHAND clears the handler when the signal is delivered.
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
 #ifndef SA_RESETHAND
 #define SA_RESETHAND	0x80000000
 #endif
+#define SA_UNSUPPORTED	0x00000400
 
 #define SA_NOMASK	SA_NODEFER
 #define SA_ONESHOT	SA_RESETHAND
diff --git a/kernel/signal.c b/kernel/signal.c
index f802c82c7bcc..c80e70bde11d 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3984,6 +3984,12 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
 	if (oact)
 		*oact = *k;
 
+	/*
+	 * Make sure that we never accidentally claim to support SA_UNSUPPORTED,
+	 * e.g. by having an architecture use the bit in their uapi.
+	 */
+	BUILD_BUG_ON(UAPI_SA_FLAGS & SA_UNSUPPORTED);
+
 	/*
 	 * Clear unknown flag bits in order to allow userspace to detect missing
 	 * support for flag bits and to allow the kernel to use non-uapi bits
-- 
2.28.0.297.g1956fa8f8d-goog

