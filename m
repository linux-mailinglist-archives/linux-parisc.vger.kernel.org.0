Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34CAF24E58E
	for <lists+linux-parisc@lfdr.de>; Sat, 22 Aug 2020 07:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgHVFKj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 22 Aug 2020 01:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgHVFKh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 22 Aug 2020 01:10:37 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6566AC061573
        for <linux-parisc@vger.kernel.org>; Fri, 21 Aug 2020 22:10:37 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id v22so2748212qkg.15
        for <linux-parisc@vger.kernel.org>; Fri, 21 Aug 2020 22:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=cl1dOHizjUUxeOK/G6Yx8pMhKLxswYaDoiP5E5Ki2ZI=;
        b=EcQNCfobMBTgvdSKJXzeXKgo+o8idLXex9Y4glR0qd81FrN9atCjk3Ah1ot5SXSdjM
         5vHUcFlRVLIWQRRR0BaSdTl5DjJ83Mfep0ZOLLtzW6oTIbnQLlifrMyGKrzWST8VumQz
         5bds43suxbKSTiWTcbgNBIdH8PobI/LRuh079zyHrGE4GsrrDtW2ZcR3mb1ghx8CJTu1
         u9mP6ByL+vpt2EK/gtqBxQrdsbMZLcSh3DaimbccU4bLv2SBkV5B23L1bkSYjURbm8y8
         jM2Z/IUK8bvQXdkj+SgONfvX96bCO90e4R+wlx96TqxOJacQiW30jLOhd10dd1hWWGi+
         xVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cl1dOHizjUUxeOK/G6Yx8pMhKLxswYaDoiP5E5Ki2ZI=;
        b=jqUmKHzXva38JLkinwy+IADzfbxzKhUe6lQmjl80JET0za8R3KE85VH18NIJJdS0Yz
         K7mBiQmtiB7Ka0ZNMzx1FpRWoWpZ/DZRm5UrPdwgkKQ2pyvD72I5+2Dwyx+0gXCV8m59
         fEa+HjcDg4wJiYfdZW+9xPIiMZ8tWDrLqL+L3G/pkp+9qGtmME0imSdbRqEg8zK72KQW
         2cDqajdNMtg5nQ+4CmUhVDGBxjETmvQUHfugmga/gjtUHXDq6H3w9KDzJz/L0G7SGpJl
         9FBNhk46e3Q6DkqI+f+evtv7MM35gQM5bOZcvaHLc6y8lUYAWOCJ3rs1niwiJeZiA5U+
         ytvw==
X-Gm-Message-State: AOAM5313ZK+vC+rd1NsI09XChs9IYXymzfP1QRjlgSXigl4K7xe9r9SX
        PrVifNUZbM//NQUCniCFPKa7VYw=
X-Google-Smtp-Source: ABdhPJxp5JGkMSiy9ZjwpnSs3U4OBWJyENzrXpvHjQ4/g6mv47K0d+cszOCi12D6NglwiRl67wJicdA=
X-Received: from pcc-desktop.svl.corp.google.com ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:ad4:4482:: with SMTP id m2mr5506138qvt.102.1598073036471;
 Fri, 21 Aug 2020 22:10:36 -0700 (PDT)
Date:   Fri, 21 Aug 2020 22:10:15 -0700
In-Reply-To: <cover.1598072840.git.pcc@google.com>
Message-Id: <a360ad2d44d0971f5864033022b53fbdcf105b90.1598072840.git.pcc@google.com>
Mime-Version: 1.0
References: <cover.1598072840.git.pcc@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v10 5/7] signal: deduplicate code dealing with common
 _sigfault fields
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

We're about to add more common _sigfault fields, so deduplicate the
existing code for initializing _sigfault fields in {send,force}_sig_*,
and for copying _sigfault fields in copy_siginfo_to_external32 and
post_copy_siginfo_from_user32, to reduce the number of places that
will need to be updated by upcoming changes.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
View this change in Gerrit: https://linux-review.googlesource.com/q/I4f56174e1b7b2bf4a3c8139e6879cbfd52750a24

 include/linux/signal.h |  13 ++++++
 kernel/signal.c        | 101 ++++++++++++++++-------------------------
 2 files changed, 53 insertions(+), 61 deletions(-)

diff --git a/include/linux/signal.h b/include/linux/signal.h
index 6bb1a3f0258c..3edbf54493ee 100644
--- a/include/linux/signal.h
+++ b/include/linux/signal.h
@@ -50,6 +50,19 @@ enum siginfo_layout {
 
 enum siginfo_layout siginfo_layout(unsigned sig, int si_code);
 
+static inline bool siginfo_layout_is_fault(enum siginfo_layout layout)
+{
+	switch (layout) {
+	case SIL_FAULT:
+	case SIL_FAULT_MCEERR:
+	case SIL_FAULT_BNDERR:
+	case SIL_FAULT_PKUERR:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /*
  * Define some primitives to manipulate sigset_t.
  */
diff --git a/kernel/signal.c b/kernel/signal.c
index c80e70bde11d..4ee9dc03f20f 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1649,6 +1649,15 @@ void force_sigsegv(int sig)
 	force_sig(SIGSEGV);
 }
 
+static void set_sigfault_common_fields(struct kernel_siginfo *info, int sig,
+				       int code, void __user *addr)
+{
+	info->si_signo = sig;
+	info->si_errno = 0;
+	info->si_code = code;
+	info->si_addr = addr;
+}
+
 int force_sig_fault_to_task(int sig, int code, void __user *addr
 	___ARCH_SI_TRAPNO(int trapno)
 	___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
@@ -1657,10 +1666,7 @@ int force_sig_fault_to_task(int sig, int code, void __user *addr
 	struct kernel_siginfo info;
 
 	clear_siginfo(&info);
-	info.si_signo = sig;
-	info.si_errno = 0;
-	info.si_code  = code;
-	info.si_addr  = addr;
+	set_sigfault_common_fields(&info, sig, code, addr);
 #ifdef __ARCH_SI_TRAPNO
 	info.si_trapno = trapno;
 #endif
@@ -1689,10 +1695,7 @@ int send_sig_fault(int sig, int code, void __user *addr
 	struct kernel_siginfo info;
 
 	clear_siginfo(&info);
-	info.si_signo = sig;
-	info.si_errno = 0;
-	info.si_code  = code;
-	info.si_addr  = addr;
+	set_sigfault_common_fields(&info, sig, code, addr);
 #ifdef __ARCH_SI_TRAPNO
 	info.si_trapno = trapno;
 #endif
@@ -1710,10 +1713,7 @@ int force_sig_mceerr(int code, void __user *addr, short lsb)
 
 	WARN_ON((code != BUS_MCEERR_AO) && (code != BUS_MCEERR_AR));
 	clear_siginfo(&info);
-	info.si_signo = SIGBUS;
-	info.si_errno = 0;
-	info.si_code = code;
-	info.si_addr = addr;
+	set_sigfault_common_fields(&info, SIGBUS, code, addr);
 	info.si_addr_lsb = lsb;
 	return force_sig_info(&info);
 }
@@ -1724,10 +1724,7 @@ int send_sig_mceerr(int code, void __user *addr, short lsb, struct task_struct *
 
 	WARN_ON((code != BUS_MCEERR_AO) && (code != BUS_MCEERR_AR));
 	clear_siginfo(&info);
-	info.si_signo = SIGBUS;
-	info.si_errno = 0;
-	info.si_code = code;
-	info.si_addr = addr;
+	set_sigfault_common_fields(&info, SIGBUS, code, addr);
 	info.si_addr_lsb = lsb;
 	return send_sig_info(info.si_signo, &info, t);
 }
@@ -1738,10 +1735,7 @@ int force_sig_bnderr(void __user *addr, void __user *lower, void __user *upper)
 	struct kernel_siginfo info;
 
 	clear_siginfo(&info);
-	info.si_signo = SIGSEGV;
-	info.si_errno = 0;
-	info.si_code  = SEGV_BNDERR;
-	info.si_addr  = addr;
+	set_sigfault_common_fields(&info, SIGSEGV, SEGV_BNDERR, addr);
 	info.si_lower = lower;
 	info.si_upper = upper;
 	return force_sig_info(&info);
@@ -1753,10 +1747,7 @@ int force_sig_pkuerr(void __user *addr, u32 pkey)
 	struct kernel_siginfo info;
 
 	clear_siginfo(&info);
-	info.si_signo = SIGSEGV;
-	info.si_errno = 0;
-	info.si_code  = SEGV_PKUERR;
-	info.si_addr  = addr;
+	set_sigfault_common_fields(&info, SIGSEGV, SEGV_PKUERR, addr);
 	info.si_pkey  = pkey;
 	return force_sig_info(&info);
 }
@@ -1770,10 +1761,8 @@ int force_sig_ptrace_errno_trap(int errno, void __user *addr)
 	struct kernel_siginfo info;
 
 	clear_siginfo(&info);
-	info.si_signo = SIGTRAP;
+	set_sigfault_common_fields(&info, SIGTRAP, TRAP_HWBKPT, addr);
 	info.si_errno = errno;
-	info.si_code  = TRAP_HWBKPT;
-	info.si_addr  = addr;
 	return force_sig_info(&info);
 }
 
@@ -3266,12 +3255,23 @@ int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from)
 void copy_siginfo_to_external32(struct compat_siginfo *to,
 		const struct kernel_siginfo *from)
 {
+	enum siginfo_layout layout =
+		siginfo_layout(from->si_signo, from->si_code);
+
 	memset(to, 0, sizeof(*to));
 
 	to->si_signo = from->si_signo;
 	to->si_errno = from->si_errno;
 	to->si_code  = from->si_code;
-	switch(siginfo_layout(from->si_signo, from->si_code)) {
+
+	if (siginfo_layout_is_fault(layout)) {
+		to->si_addr = ptr_to_compat(from->si_addr);
+#ifdef __ARCH_SI_TRAPNO
+		to->si_trapno = from->si_trapno;
+#endif
+	}
+
+	switch (layout) {
 	case SIL_KILL:
 		to->si_pid = from->si_pid;
 		to->si_uid = from->si_uid;
@@ -3286,31 +3286,15 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
 		to->si_fd   = from->si_fd;
 		break;
 	case SIL_FAULT:
-		to->si_addr = ptr_to_compat(from->si_addr);
-#ifdef __ARCH_SI_TRAPNO
-		to->si_trapno = from->si_trapno;
-#endif
 		break;
 	case SIL_FAULT_MCEERR:
-		to->si_addr = ptr_to_compat(from->si_addr);
-#ifdef __ARCH_SI_TRAPNO
-		to->si_trapno = from->si_trapno;
-#endif
 		to->si_addr_lsb = from->si_addr_lsb;
 		break;
 	case SIL_FAULT_BNDERR:
-		to->si_addr = ptr_to_compat(from->si_addr);
-#ifdef __ARCH_SI_TRAPNO
-		to->si_trapno = from->si_trapno;
-#endif
 		to->si_lower = ptr_to_compat(from->si_lower);
 		to->si_upper = ptr_to_compat(from->si_upper);
 		break;
 	case SIL_FAULT_PKUERR:
-		to->si_addr = ptr_to_compat(from->si_addr);
-#ifdef __ARCH_SI_TRAPNO
-		to->si_trapno = from->si_trapno;
-#endif
 		to->si_pkey = from->si_pkey;
 		break;
 	case SIL_CHLD:
@@ -3347,11 +3331,22 @@ int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
 static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
 					 const struct compat_siginfo *from)
 {
+	enum siginfo_layout layout =
+		siginfo_layout(from->si_signo, from->si_code);
+
 	clear_siginfo(to);
 	to->si_signo = from->si_signo;
 	to->si_errno = from->si_errno;
 	to->si_code  = from->si_code;
-	switch(siginfo_layout(from->si_signo, from->si_code)) {
+
+	if (siginfo_layout_is_fault(layout)) {
+		to->si_addr = compat_ptr(from->si_addr);
+#ifdef __ARCH_SI_TRAPNO
+		to->si_trapno = from->si_trapno;
+#endif
+	}
+
+	switch (layout) {
 	case SIL_KILL:
 		to->si_pid = from->si_pid;
 		to->si_uid = from->si_uid;
@@ -3366,31 +3361,15 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
 		to->si_fd   = from->si_fd;
 		break;
 	case SIL_FAULT:
-		to->si_addr = compat_ptr(from->si_addr);
-#ifdef __ARCH_SI_TRAPNO
-		to->si_trapno = from->si_trapno;
-#endif
 		break;
 	case SIL_FAULT_MCEERR:
-		to->si_addr = compat_ptr(from->si_addr);
-#ifdef __ARCH_SI_TRAPNO
-		to->si_trapno = from->si_trapno;
-#endif
 		to->si_addr_lsb = from->si_addr_lsb;
 		break;
 	case SIL_FAULT_BNDERR:
-		to->si_addr = compat_ptr(from->si_addr);
-#ifdef __ARCH_SI_TRAPNO
-		to->si_trapno = from->si_trapno;
-#endif
 		to->si_lower = compat_ptr(from->si_lower);
 		to->si_upper = compat_ptr(from->si_upper);
 		break;
 	case SIL_FAULT_PKUERR:
-		to->si_addr = compat_ptr(from->si_addr);
-#ifdef __ARCH_SI_TRAPNO
-		to->si_trapno = from->si_trapno;
-#endif
 		to->si_pkey = from->si_pkey;
 		break;
 	case SIL_CHLD:
-- 
2.28.0.297.g1956fa8f8d-goog

