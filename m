Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD3624E58F
	for <lists+linux-parisc@lfdr.de>; Sat, 22 Aug 2020 07:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgHVFKl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 22 Aug 2020 01:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgHVFKj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 22 Aug 2020 01:10:39 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5B9C061575
        for <linux-parisc@vger.kernel.org>; Fri, 21 Aug 2020 22:10:39 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a75so4371171ybg.15
        for <linux-parisc@vger.kernel.org>; Fri, 21 Aug 2020 22:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=wHvx55AjTih16rxEnDOeidQDF1mPVTq8l4nCtbD1anM=;
        b=Z1PGFM8tza1y2AqJiBvwU4X1lhpoBPfbafrWSyr00WOx4rowRKtGB4zq78KqhoDEn3
         ughBMv+koiv9oH2zI38gLeQFsoy8dQgQr1/EMlyBw8AP+oj7zVw/vQtdqMH2SobxpjRw
         kaLviAXGRagA+Id4ecCilIdtgUCW1tHs4CyvssDuX/oKdoiYFV8FmHxCwAQTd+pCKfJ/
         iPc0OdRgNOB4wNhCPJn3T3eoBMBSuXM91a/LQ1MeTyD6P8WMqgFVGSXNRvdv/e3TSkRe
         Fhm4a2RumNISKFm7UgeJlzmZiPuqIxs2vROnnIXT/4BxTb6jiCf4QWVjfFEYaLS34zmx
         J26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=wHvx55AjTih16rxEnDOeidQDF1mPVTq8l4nCtbD1anM=;
        b=qQP2obVDYz1EdT7yrdB/nKpm0fvjuYjGaTb1tSuET9WOP0VLjGP+NIMkQNWcRiBAav
         1y10475hJrcUhmU45wF9Ju2LPI5JjrIAq76v8enBJQAjE+jClmtE+5xM9Y75PLx20Ahb
         wd4vOb2141e4Ew03onX0uGU6azhc1thUYB3E6/y2m5aebqnbuBrZ99WvKCM59zfgGvKN
         W0ipWPBVRiYy5JmUNVkHeFcCLicJtHKh89H/NdgVqHOJX9KMHyR+YzW+AzuHV7m9GSXJ
         p6Usihf6q6WFjbjCsPfXERPrIKeuFcDASzZ0pD6hCjKL7P4pigpZrhmfQjPwyPK5RACo
         PbgA==
X-Gm-Message-State: AOAM532IGGkEXMsgkG1ah6wZfIlXL7CcwXsNMgcPwVyhzlsZqk4JoL01
        N4tfOBI9NMFju8OaoCxYEXPy9L4=
X-Google-Smtp-Source: ABdhPJze4QHzIgB48d5J0k/zW1HkkbRu0fYARoHJczqodsad8ioR8dLPhcoS9W4mqx5n7/9uwm/Vq9w=
X-Received: from pcc-desktop.svl.corp.google.com ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:a25:6f85:: with SMTP id k127mr7888061ybc.12.1598073038608;
 Fri, 21 Aug 2020 22:10:38 -0700 (PDT)
Date:   Fri, 21 Aug 2020 22:10:16 -0700
In-Reply-To: <cover.1598072840.git.pcc@google.com>
Message-Id: <8a12152d54ea782f47bc55d791b064abe478473e.1598072840.git.pcc@google.com>
Mime-Version: 1.0
References: <cover.1598072840.git.pcc@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v10 6/7] signal: define the field siginfo.si_xflags
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

This field will contain flags that may be used by signal handlers to
determine whether other fields in the _sigfault portion of siginfo are
valid. An example use case is the following patch, which introduces
the si_addr_ignored_bits{,_mask} fields.

A new sigcontext flag, SA_XFLAGS, is introduced in order to allow
a signal handler to require the kernel to set the field (but note
that the field will be set anyway if the kernel supports the flag,
regardless of its value). In combination with the previous patches,
this allows a userspace program to determine whether the kernel will
set the field.

It is possible for an si_xflags-unaware program to cause a signal
handler in an si_xflags-aware program to be called with a provided
siginfo data structure by using one of the following syscalls:

- ptrace(PTRACE_SETSIGINFO)
- pidfd_send_signal
- rt_sigqueueinfo
- rt_tgsigqueueinfo

So we need to prevent the si_xflags-unaware program from causing an
uninitialized read of si_xflags in the si_xflags-aware program when
it uses one of these syscalls.

The last three cases can be handled by observing that each of these
syscalls fails if si_code >= 0, so we define si_xflags to only be
valid if si_code >= 0.

There is no such check on si_code in ptrace(PTRACE_SETSIGINFO), so
we make ptrace(PTRACE_SETSIGINFO) clear the si_xflags field if it
detects that the signal would use the _sigfault layout, and introduce
a new ptrace request type, PTRACE_SETSIGINFO2, that a si_xflags-aware
program may use to opt out of this behavior.

It is also possible for the kernel to inject a signal specified to
use _sigfault by calling force_sig (e.g. there are numerous calls to
force_sig(SIGSEGV)). In this case si_code is set to SI_KERNEL and the
_kill union member is used, so document that si_code must be < SI_KERNEL.

Ideally this field could have just been named si_flags, but that
name was already taken by ia64, so a different name was chosen.

Alternatively, we may consider making ia64's si_flags a generic field
and having it appear at the end of _sigfault (in the same place as
this patch has si_xflags) on non-ia64, keeping it in the same place
on ia64. ia64's si_flags is a 32-bit field with only one flag bit
allocated, so we would have 31 bits to use if we do this.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
View this change in Gerrit: https://linux-review.googlesource.com/q/Ide155ce29366c3eab2a944ae4c51205982e5b8b2

v10:
- make the new field compatible with the various ways
  that a siginfo can be injected from another process
- eliminate some duplication by adding a refactoring patch
  before this one

 arch/powerpc/platforms/powernv/vas-fault.c |  1 +
 arch/x86/kernel/signal_compat.c            |  4 +--
 include/linux/compat.h                     |  2 ++
 include/linux/signal_types.h               |  2 +-
 include/uapi/asm-generic/siginfo.h         |  4 +++
 include/uapi/asm-generic/signal-defs.h     |  4 +++
 include/uapi/linux/ptrace.h                |  2 ++
 kernel/ptrace.c                            | 29 ++++++++++++++++++++++
 kernel/signal.c                            |  3 +++
 9 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 3d21fce254b7..3bbb335561f5 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -154,6 +154,7 @@ static void update_csb(struct vas_window *window,
 	info.si_errno = EFAULT;
 	info.si_code = SEGV_MAPERR;
 	info.si_addr = csb_addr;
+	info.si_xflags = 0;
 
 	/*
 	 * process will be polling on csb.flags after request is sent to
diff --git a/arch/x86/kernel/signal_compat.c b/arch/x86/kernel/signal_compat.c
index c599013ae8cb..6b99f0c8a068 100644
--- a/arch/x86/kernel/signal_compat.c
+++ b/arch/x86/kernel/signal_compat.c
@@ -121,8 +121,8 @@ static inline void signal_compat_build_tests(void)
 #endif
 
 	CHECK_CSI_OFFSET(_sigfault);
-	CHECK_CSI_SIZE  (_sigfault, 4*sizeof(int));
-	CHECK_SI_SIZE   (_sigfault, 8*sizeof(int));
+	CHECK_CSI_SIZE  (_sigfault, 8*sizeof(int));
+	CHECK_SI_SIZE   (_sigfault, 16*sizeof(int));
 
 	BUILD_BUG_ON(offsetof(siginfo_t, si_addr) != 0x10);
 	BUILD_BUG_ON(offsetof(compat_siginfo_t, si_addr) != 0x0C);
diff --git a/include/linux/compat.h b/include/linux/compat.h
index d38c4d7e83bd..55d4228dfd88 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -231,7 +231,9 @@ typedef struct compat_siginfo {
 					char _dummy_pkey[__COMPAT_ADDR_BND_PKEY_PAD];
 					u32 _pkey;
 				} _addr_pkey;
+				compat_uptr_t _pad[6];
 			};
+			compat_uptr_t _xflags;
 		} _sigfault;
 
 		/* SIGPOLL */
diff --git a/include/linux/signal_types.h b/include/linux/signal_types.h
index a7887ad84d36..75ca861d982a 100644
--- a/include/linux/signal_types.h
+++ b/include/linux/signal_types.h
@@ -78,6 +78,6 @@ struct ksignal {
 
 #define UAPI_SA_FLAGS                                                          \
 	(SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
-	 SA_NODEFER | SA_RESETHAND | __ARCH_UAPI_SA_FLAGS)
+	 SA_NODEFER | SA_RESETHAND | SA_XFLAGS | __ARCH_UAPI_SA_FLAGS)
 
 #endif /* _LINUX_SIGNAL_TYPES_H */
diff --git a/include/uapi/asm-generic/siginfo.h b/include/uapi/asm-generic/siginfo.h
index cb3d6c267181..1fbd88d64f38 100644
--- a/include/uapi/asm-generic/siginfo.h
+++ b/include/uapi/asm-generic/siginfo.h
@@ -91,7 +91,9 @@ union __sifields {
 				char _dummy_pkey[__ADDR_BND_PKEY_PAD];
 				__u32 _pkey;
 			} _addr_pkey;
+			void *_pad[6];
 		};
+		unsigned long _xflags;
 	} _sigfault;
 
 	/* SIGPOLL */
@@ -152,6 +154,8 @@ typedef struct siginfo {
 #define si_trapno	_sifields._sigfault._trapno
 #endif
 #define si_addr_lsb	_sifields._sigfault._addr_lsb
+/* si_xflags is only valid if 0 <= si_code < SI_KERNEL */
+#define si_xflags	_sifields._sigfault._xflags
 #define si_lower	_sifields._sigfault._addr_bnd._lower
 #define si_upper	_sifields._sigfault._addr_bnd._upper
 #define si_pkey		_sifields._sigfault._addr_pkey._pkey
diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
index e853cbe8722d..bdbe1fe7a779 100644
--- a/include/uapi/asm-generic/signal-defs.h
+++ b/include/uapi/asm-generic/signal-defs.h
@@ -20,6 +20,9 @@
  * so this bit allows flag bit support to be detected from userspace while
  * allowing an old kernel to be distinguished from a kernel that supports every
  * flag bit.
+ * SA_XFLAGS indicates that the signal handler requires the siginfo.si_xflags
+ * field to be valid. Note that if the kernel supports SA_XFLAGS, the field will
+ * be valid regardless of the value of this flag.
  *
  * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
  * Unix names RESETHAND and NODEFER respectively.
@@ -49,6 +52,7 @@
 #define SA_RESETHAND	0x80000000
 #endif
 #define SA_UNSUPPORTED	0x00000400
+#define SA_XFLAGS	0x00000800
 
 #define SA_NOMASK	SA_NODEFER
 #define SA_ONESHOT	SA_RESETHAND
diff --git a/include/uapi/linux/ptrace.h b/include/uapi/linux/ptrace.h
index a71b6e3b03eb..de5ebd5b0fae 100644
--- a/include/uapi/linux/ptrace.h
+++ b/include/uapi/linux/ptrace.h
@@ -101,6 +101,8 @@ struct ptrace_syscall_info {
 	};
 };
 
+#define PTRACE_SETSIGINFO2	0x420f
+
 /*
  * These values are stored in task->ptrace_message
  * by tracehook_report_syscall_* to describe the current syscall-stop.
diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index 43d6179508d6..11ee5e2d65ff 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -1038,6 +1038,20 @@ int ptrace_request(struct task_struct *child, long request,
 		break;
 
 	case PTRACE_SETSIGINFO:
+		ret = copy_siginfo_from_user(&siginfo, datavp);
+		if (!ret) {
+			/*
+                         * Assume that the caller is unaware of si_xflags, so
+                         * fill it in if we're using a layout that requires it.
+                         */
+			if (siginfo_layout_is_fault(siginfo_layout(
+				    siginfo.si_signo, siginfo.si_code)))
+				siginfo.si_xflags = 0;
+			ret = ptrace_setsiginfo(child, &siginfo);
+                }
+		break;
+
+	case PTRACE_SETSIGINFO2:
 		ret = copy_siginfo_from_user(&siginfo, datavp);
 		if (!ret)
 			ret = ptrace_setsiginfo(child, &siginfo);
@@ -1347,6 +1361,21 @@ int compat_ptrace_request(struct task_struct *child, compat_long_t request,
 		break;
 
 	case PTRACE_SETSIGINFO:
+		ret = copy_siginfo_from_user32(
+			&siginfo, (struct compat_siginfo __user *) datap);
+		if (!ret) {
+			/*
+                         * Assume that the caller is unaware of si_xflags, so
+                         * fill it in if we're using a layout that requires it.
+                         */
+			if (siginfo_layout_is_fault(siginfo_layout(
+				    siginfo.si_signo, siginfo.si_code)))
+				siginfo.si_xflags = 0;
+			ret = ptrace_setsiginfo(child, &siginfo);
+                }
+		break;
+
+	case PTRACE_SETSIGINFO2:
 		ret = copy_siginfo_from_user32(
 			&siginfo, (struct compat_siginfo __user *) datap);
 		if (!ret)
diff --git a/kernel/signal.c b/kernel/signal.c
index 4ee9dc03f20f..4259903b95cb 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1656,6 +1656,7 @@ static void set_sigfault_common_fields(struct kernel_siginfo *info, int sig,
 	info->si_errno = 0;
 	info->si_code = code;
 	info->si_addr = addr;
+	info->si_xflags = 0;
 }
 
 int force_sig_fault_to_task(int sig, int code, void __user *addr
@@ -3269,6 +3270,7 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
 #ifdef __ARCH_SI_TRAPNO
 		to->si_trapno = from->si_trapno;
 #endif
+		to->si_xflags = from->si_xflags;
 	}
 
 	switch (layout) {
@@ -3344,6 +3346,7 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
 #ifdef __ARCH_SI_TRAPNO
 		to->si_trapno = from->si_trapno;
 #endif
+		to->si_xflags = from->si_xflags;
 	}
 
 	switch (layout) {
-- 
2.28.0.297.g1956fa8f8d-goog

