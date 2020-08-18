Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3AB247CE2
	for <lists+linux-parisc@lfdr.de>; Tue, 18 Aug 2020 05:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgHRDeM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 17 Aug 2020 23:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgHRDeL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 17 Aug 2020 23:34:11 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38BCC061389
        for <linux-parisc@vger.kernel.org>; Mon, 17 Aug 2020 20:34:10 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e196so20689477ybh.6
        for <linux-parisc@vger.kernel.org>; Mon, 17 Aug 2020 20:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=a7YYy8lx+M1lwt0H42oBuKRhAI8XPjMOyBd5iSoTlYM=;
        b=SSOR0mNLDyT3xJg1LjmS8Zo+OqnR/KXxU+SEaSRkf//102bhRRJGsBf9YT9unQ9jlX
         Fxb/Z/CtPH5gWTnmbrrsbeOWsKVcowCFgGZDYL4hQtwPz0rYixYLzkGP3l9wvQNF6ba6
         pW7Q9VNiwrBldFeb2o6+DQ/JHoiLFJBykU8C5tZGsQDyURXLnynQ/AXUMe5Mep6G2wSo
         NZu2LoJ5e7k4ll4tfH+8tp+NPCKPNYXn0IJhVbtZYFKvFjpjZsl+LWz7T0FKeNSR207I
         t2E0kugOHopYkR1BavkOs1De/h1mQWvBlTR5koFb5aLzN4/TAgqqiL4Z4A1qdSJco+Yn
         Nqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=a7YYy8lx+M1lwt0H42oBuKRhAI8XPjMOyBd5iSoTlYM=;
        b=pfNE1T3Ftu+80tDdmr4kSm2ARYc4Xnlt7MeZdOhH1aGlUp0rPhInJOkDzbBKuhPsXp
         4TOLJYTQk4wY3oiePuZmLuvRanYghmxZelni3VASPEFOuNNJ5i5kd8Ra+Xg20DSJLaod
         rvb0zIT6osTI45bp1942fManPrQ7V4fGvYJgwgdT01qZ4vgPg/DZD3b7I1r9+g7Zf75G
         LNP+o3ci5VLXvej3G4CFN1hpdvppRbd6Y1fGoPV2YalKBYSrdp2ilzA1NHdvggkQE77M
         r3s0JrYRFMyOs6MjgG1Sh3jOL/GJ3zhkSufcgbhnE3bwnK19yqj0tobBfVbkXF2eh26i
         jWsA==
X-Gm-Message-State: AOAM5320TWMyFsn2QwrzLaCifN5t+jaUQ0qfhDkJHtDhIVDD1cq7bxGd
        FFGFYUp12EbwEIfRAGURzYZ57+E=
X-Google-Smtp-Source: ABdhPJzTn7VfMP696BB62kRzckKmSgtBzwuR0Sv6yyr2ROiJlOWOnjyMNEabfbUj7EAGdzuPU2Nr5/Q=
X-Received: by 2002:a25:68c4:: with SMTP id d187mr25797590ybc.515.1597721649958;
 Mon, 17 Aug 2020 20:34:09 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:33:47 -0700
In-Reply-To: <cover.1597720138.git.pcc@google.com>
Message-Id: <691510496a422023a2934d42b068493ed2d60ccc.1597720138.git.pcc@google.com>
Mime-Version: 1.0
References: <cover.1597720138.git.pcc@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v9 2/6] arch: move SA_* definitions to generic headers
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

Most architectures with the exception of alpha, mips, parisc and
sparc use the same values for these flags. Move their definitions into
asm-generic/signal-defs.h and allow the architectures with non-standard
values to override them. Also, document the non-standard flag values
in order to make it easier to add new generic flags in the future.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
View this change in Gerrit: https://linux-review.googlesource.com/q/Ia3849f18b8009bf41faca374e701cdca36974528

 arch/alpha/include/uapi/asm/signal.h   | 14 --------
 arch/arm/include/uapi/asm/signal.h     | 28 ++-------------
 arch/h8300/include/uapi/asm/signal.h   | 24 -------------
 arch/ia64/include/uapi/asm/signal.h    | 24 -------------
 arch/m68k/include/uapi/asm/signal.h    | 24 -------------
 arch/mips/include/uapi/asm/signal.h    | 12 -------
 arch/parisc/include/uapi/asm/signal.h  | 13 -------
 arch/powerpc/include/uapi/asm/signal.h | 24 -------------
 arch/s390/include/uapi/asm/signal.h    | 24 -------------
 arch/sparc/include/uapi/asm/signal.h   |  4 +--
 arch/x86/include/uapi/asm/signal.h     | 24 -------------
 arch/xtensa/include/uapi/asm/signal.h  | 24 -------------
 include/uapi/asm-generic/signal-defs.h | 47 ++++++++++++++++++++++++++
 include/uapi/asm-generic/signal.h      | 29 ----------------
 14 files changed, 51 insertions(+), 264 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/signal.h b/arch/alpha/include/uapi/asm/signal.h
index 74c750bf1c1a..a69dd8d080a8 100644
--- a/arch/alpha/include/uapi/asm/signal.h
+++ b/arch/alpha/include/uapi/asm/signal.h
@@ -60,20 +60,6 @@ typedef unsigned long sigset_t;
 #define SIGRTMIN	32
 #define SIGRTMAX	_NSIG
 
-/*
- * SA_FLAGS values:
- *
- * SA_ONSTACK indicates that a registered stack_t will be used.
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- */
-
 #define SA_ONSTACK	0x00000001
 #define SA_RESTART	0x00000002
 #define SA_NOCLDSTOP	0x00000004
diff --git a/arch/arm/include/uapi/asm/signal.h b/arch/arm/include/uapi/asm/signal.h
index 9b4185ba4f8a..7727f0984d26 100644
--- a/arch/arm/include/uapi/asm/signal.h
+++ b/arch/arm/include/uapi/asm/signal.h
@@ -60,33 +60,11 @@ typedef unsigned long sigset_t;
 #define SIGSWI		32
 
 /*
- * SA_FLAGS values:
- *
- * SA_NOCLDSTOP		flag to turn off SIGCHLD when children stop.
- * SA_NOCLDWAIT		flag on SIGCHLD to inhibit zombies.
- * SA_SIGINFO		deliver the signal with SIGINFO structs
- * SA_THIRTYTWO		delivers the signal in 32-bit mode, even if the task 
- *			is running in 26-bit.
- * SA_ONSTACK		allows alternate signal stacks (see sigaltstack(2)).
- * SA_RESTART		flag to get restarting signals (which were the default long ago)
- * SA_NODEFER		prevents the current signal from being masked in the handler.
- * SA_RESETHAND		clears the handler when the signal is delivered.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
+ * SA_THIRTYTWO historically meant deliver the signal in 32-bit mode, even if
+ * the task is running in 26-bit. But since the kernel no longer supports
+ * 26-bit mode, the flag has no effect.
  */
-#define SA_NOCLDSTOP	0x00000001
-#define SA_NOCLDWAIT	0x00000002
-#define SA_SIGINFO	0x00000004
 #define SA_THIRTYTWO	0x02000000
-#define SA_RESTORER	0x04000000
-#define SA_ONSTACK	0x08000000
-#define SA_RESTART	0x10000000
-#define SA_NODEFER	0x40000000
-#define SA_RESETHAND	0x80000000
-
-#define SA_NOMASK	SA_NODEFER
-#define SA_ONESHOT	SA_RESETHAND
 
 #define MINSIGSTKSZ	2048
 #define SIGSTKSZ	8192
diff --git a/arch/h8300/include/uapi/asm/signal.h b/arch/h8300/include/uapi/asm/signal.h
index e15521037348..2cd0dce2b6a6 100644
--- a/arch/h8300/include/uapi/asm/signal.h
+++ b/arch/h8300/include/uapi/asm/signal.h
@@ -57,30 +57,6 @@ typedef unsigned long sigset_t;
 #define SIGRTMIN	32
 #define SIGRTMAX	_NSIG
 
-/*
- * SA_FLAGS values:
- *
- * SA_ONSTACK indicates that a registered stack_t will be used.
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- */
-#define SA_NOCLDSTOP	0x00000001
-#define SA_NOCLDWAIT	0x00000002 /* not supported yet */
-#define SA_SIGINFO	0x00000004
-#define SA_ONSTACK	0x08000000
-#define SA_RESTART	0x10000000
-#define SA_NODEFER	0x40000000
-#define SA_RESETHAND	0x80000000
-
-#define SA_NOMASK	SA_NODEFER
-#define SA_ONESHOT	SA_RESETHAND
-
 #define SA_RESTORER	0x04000000
 
 #define MINSIGSTKSZ	2048
diff --git a/arch/ia64/include/uapi/asm/signal.h b/arch/ia64/include/uapi/asm/signal.h
index aa98ff1b9e22..38166a88e4c9 100644
--- a/arch/ia64/include/uapi/asm/signal.h
+++ b/arch/ia64/include/uapi/asm/signal.h
@@ -53,30 +53,6 @@
 #define SIGRTMIN	32
 #define SIGRTMAX	_NSIG
 
-/*
- * SA_FLAGS values:
- *
- * SA_ONSTACK indicates that a registered stack_t will be used.
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- */
-#define SA_NOCLDSTOP	0x00000001
-#define SA_NOCLDWAIT	0x00000002
-#define SA_SIGINFO	0x00000004
-#define SA_ONSTACK	0x08000000
-#define SA_RESTART	0x10000000
-#define SA_NODEFER	0x40000000
-#define SA_RESETHAND	0x80000000
-
-#define SA_NOMASK	SA_NODEFER
-#define SA_ONESHOT	SA_RESETHAND
-
 #define SA_RESTORER	0x04000000
 
 /*
diff --git a/arch/m68k/include/uapi/asm/signal.h b/arch/m68k/include/uapi/asm/signal.h
index 915cc755a184..4619291df601 100644
--- a/arch/m68k/include/uapi/asm/signal.h
+++ b/arch/m68k/include/uapi/asm/signal.h
@@ -57,30 +57,6 @@ typedef unsigned long sigset_t;
 #define SIGRTMIN	32
 #define SIGRTMAX	_NSIG
 
-/*
- * SA_FLAGS values:
- *
- * SA_ONSTACK indicates that a registered stack_t will be used.
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- */
-#define SA_NOCLDSTOP	0x00000001
-#define SA_NOCLDWAIT	0x00000002
-#define SA_SIGINFO	0x00000004
-#define SA_ONSTACK	0x08000000
-#define SA_RESTART	0x10000000
-#define SA_NODEFER	0x40000000
-#define SA_RESETHAND	0x80000000
-
-#define SA_NOMASK	SA_NODEFER
-#define SA_ONESHOT	SA_RESETHAND
-
 #define MINSIGSTKSZ	2048
 #define SIGSTKSZ	8192
 
diff --git a/arch/mips/include/uapi/asm/signal.h b/arch/mips/include/uapi/asm/signal.h
index 53104b10aae2..e6c78a15cb2f 100644
--- a/arch/mips/include/uapi/asm/signal.h
+++ b/arch/mips/include/uapi/asm/signal.h
@@ -62,18 +62,6 @@ typedef unsigned long old_sigset_t;		/* at least 32 bits */
 #define SIGRTMAX	_NSIG
 
 /*
- * SA_FLAGS values:
- *
- * SA_ONSTACK indicates that a registered stack_t will be used.
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- *
  * SA_RESTORER used to be defined as 0x04000000 but only the O32 ABI ever
  * supported its use and no libc was using it, so the entire sa-restorer
  * functionality was removed with lmo commit 39bffc12c3580ab for 2.5.48
diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/uapi/asm/signal.h
index 92a1c7ea44b4..32ec2e64c6ca 100644
--- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -41,19 +41,6 @@
 #define SIGRTMIN	32
 #define SIGRTMAX	_NSIG /* it's 44 under HP/UX */
 
-/*
- * SA_FLAGS values:
- *
- * SA_ONSTACK indicates that a registered stack_t will be used.
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- */
 #define SA_ONSTACK	0x00000001
 #define SA_RESETHAND	0x00000004
 #define SA_NOCLDSTOP	0x00000008
diff --git a/arch/powerpc/include/uapi/asm/signal.h b/arch/powerpc/include/uapi/asm/signal.h
index 85b0a7aa43e7..04873dd311c2 100644
--- a/arch/powerpc/include/uapi/asm/signal.h
+++ b/arch/powerpc/include/uapi/asm/signal.h
@@ -60,30 +60,6 @@ typedef struct {
 #define SIGRTMIN	32
 #define SIGRTMAX	_NSIG
 
-/*
- * SA_FLAGS values:
- *
- * SA_ONSTACK is not currently supported, but will allow sigaltstack(2).
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- */
-#define SA_NOCLDSTOP	0x00000001U
-#define SA_NOCLDWAIT	0x00000002U
-#define SA_SIGINFO	0x00000004U
-#define SA_ONSTACK	0x08000000U
-#define SA_RESTART	0x10000000U
-#define SA_NODEFER	0x40000000U
-#define SA_RESETHAND	0x80000000U
-
-#define SA_NOMASK	SA_NODEFER
-#define SA_ONESHOT	SA_RESETHAND
-
 #define SA_RESTORER	0x04000000U
 
 #define MINSIGSTKSZ	2048
diff --git a/arch/s390/include/uapi/asm/signal.h b/arch/s390/include/uapi/asm/signal.h
index 9a14a611ed82..0189f326aac5 100644
--- a/arch/s390/include/uapi/asm/signal.h
+++ b/arch/s390/include/uapi/asm/signal.h
@@ -65,30 +65,6 @@ typedef unsigned long sigset_t;
 #define SIGRTMIN        32
 #define SIGRTMAX        _NSIG
 
-/*
- * SA_FLAGS values:
- *
- * SA_ONSTACK indicates that a registered stack_t will be used.
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- */
-#define SA_NOCLDSTOP    0x00000001
-#define SA_NOCLDWAIT    0x00000002
-#define SA_SIGINFO      0x00000004
-#define SA_ONSTACK      0x08000000
-#define SA_RESTART      0x10000000
-#define SA_NODEFER      0x40000000
-#define SA_RESETHAND    0x80000000
-
-#define SA_NOMASK       SA_NODEFER
-#define SA_ONESHOT      SA_RESETHAND
-
 #define SA_RESTORER     0x04000000
 
 #define MINSIGSTKSZ     2048
diff --git a/arch/sparc/include/uapi/asm/signal.h b/arch/sparc/include/uapi/asm/signal.h
index ff9505923b9a..53758d53ac0e 100644
--- a/arch/sparc/include/uapi/asm/signal.h
+++ b/arch/sparc/include/uapi/asm/signal.h
@@ -137,13 +137,11 @@ struct sigstack {
 #define SA_STACK	_SV_SSTACK
 #define SA_ONSTACK	_SV_SSTACK
 #define SA_RESTART	_SV_INTR
-#define SA_ONESHOT	_SV_RESET
+#define SA_RESETHAND	_SV_RESET
 #define SA_NODEFER	0x20u
 #define SA_NOCLDWAIT    0x100u
 #define SA_SIGINFO      0x200u
 
-#define SA_NOMASK	SA_NODEFER
-
 #define SIG_BLOCK          0x01	/* for blocking signals */
 #define SIG_UNBLOCK        0x02	/* for unblocking signals */
 #define SIG_SETMASK        0x04	/* for setting the signal mask */
diff --git a/arch/x86/include/uapi/asm/signal.h b/arch/x86/include/uapi/asm/signal.h
index e5745d593dc7..164a22a72984 100644
--- a/arch/x86/include/uapi/asm/signal.h
+++ b/arch/x86/include/uapi/asm/signal.h
@@ -62,30 +62,6 @@ typedef unsigned long sigset_t;
 #define SIGRTMIN	32
 #define SIGRTMAX	_NSIG
 
-/*
- * SA_FLAGS values:
- *
- * SA_ONSTACK indicates that a registered stack_t will be used.
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- */
-#define SA_NOCLDSTOP	0x00000001u
-#define SA_NOCLDWAIT	0x00000002u
-#define SA_SIGINFO	0x00000004u
-#define SA_ONSTACK	0x08000000u
-#define SA_RESTART	0x10000000u
-#define SA_NODEFER	0x40000000u
-#define SA_RESETHAND	0x80000000u
-
-#define SA_NOMASK	SA_NODEFER
-#define SA_ONESHOT	SA_RESETHAND
-
 #define SA_RESTORER	0x04000000
 
 #define MINSIGSTKSZ	2048
diff --git a/arch/xtensa/include/uapi/asm/signal.h b/arch/xtensa/include/uapi/asm/signal.h
index 005dec5bfde4..79ddabaa4e5d 100644
--- a/arch/xtensa/include/uapi/asm/signal.h
+++ b/arch/xtensa/include/uapi/asm/signal.h
@@ -72,30 +72,6 @@ typedef struct {
 #define SIGRTMIN	32
 #define SIGRTMAX	(_NSIG-1)
 
-/*
- * SA_FLAGS values:
- *
- * SA_ONSTACK indicates that a registered stack_t will be used.
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- */
-#define SA_NOCLDSTOP	0x00000001
-#define SA_NOCLDWAIT	0x00000002 /* not supported yet */
-#define SA_SIGINFO	0x00000004
-#define SA_ONSTACK	0x08000000
-#define SA_RESTART	0x10000000
-#define SA_NODEFER	0x40000000
-#define SA_RESETHAND	0x80000000
-
-#define SA_NOMASK	SA_NODEFER
-#define SA_ONESHOT	SA_RESETHAND
-
 #define SA_RESTORER	0x04000000
 
 #define MINSIGSTKSZ	2048
diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
index ecdf6312bfa5..91000b6b97e0 100644
--- a/include/uapi/asm-generic/signal-defs.h
+++ b/include/uapi/asm-generic/signal-defs.h
@@ -4,6 +4,53 @@
 
 #include <linux/compiler.h>
 
+/*
+ * SA_FLAGS values:
+ *
+ * SA_ONSTACK indicates that a registered stack_t will be used.
+ * SA_RESTART flag to get restarting signals (which were the default long ago)
+ * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
+ * SA_RESETHAND clears the handler when the signal is delivered.
+ * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
+ * SA_NODEFER prevents the current signal from being masked in the handler.
+ *
+ * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
+ * Unix names RESETHAND and NODEFER respectively.
+ */
+#ifndef SA_NOCLDSTOP
+#define SA_NOCLDSTOP	0x00000001
+#endif
+#ifndef SA_NOCLDWAIT
+#define SA_NOCLDWAIT	0x00000002
+#endif
+#ifndef SA_SIGINFO
+#define SA_SIGINFO	0x00000004
+#endif
+#ifndef SA_ONSTACK
+#define SA_ONSTACK	0x08000000
+#endif
+#ifndef SA_RESTART
+#define SA_RESTART	0x10000000
+#endif
+#ifndef SA_NODEFER
+#define SA_NODEFER	0x40000000
+#endif
+#ifndef SA_RESETHAND
+#define SA_RESETHAND	0x80000000
+#endif
+/*
+ * The following bits are used in architecture-specific SA_* definitions and
+ * should be avoided for new generic flags: 3, 4, 5, 6, 7, 8, 9, 16, 24, 25, 26.
+ */
+
+#define SA_NOMASK	SA_NODEFER
+#define SA_ONESHOT	SA_RESETHAND
+
+/*
+ * New architectures should not define the obsolete
+ *	SA_RESTORER	0x04000000
+ */
+
 #ifndef SIG_BLOCK
 #define SIG_BLOCK          0	/* for blocking signals */
 #endif
diff --git a/include/uapi/asm-generic/signal.h b/include/uapi/asm-generic/signal.h
index 5c716a952cbe..f634822906e4 100644
--- a/include/uapi/asm-generic/signal.h
+++ b/include/uapi/asm-generic/signal.h
@@ -52,35 +52,6 @@
 #define SIGRTMAX	_NSIG
 #endif
 
-/*
- * SA_FLAGS values:
- *
- * SA_ONSTACK indicates that a registered stack_t will be used.
- * SA_RESTART flag to get restarting signals (which were the default long ago)
- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
- * SA_RESETHAND clears the handler when the signal is delivered.
- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
- * SA_NODEFER prevents the current signal from being masked in the handler.
- *
- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
- * Unix names RESETHAND and NODEFER respectively.
- */
-#define SA_NOCLDSTOP	0x00000001
-#define SA_NOCLDWAIT	0x00000002
-#define SA_SIGINFO	0x00000004
-#define SA_ONSTACK	0x08000000
-#define SA_RESTART	0x10000000
-#define SA_NODEFER	0x40000000
-#define SA_RESETHAND	0x80000000
-
-#define SA_NOMASK	SA_NODEFER
-#define SA_ONESHOT	SA_RESETHAND
-
-/*
- * New architectures should not define the obsolete
- *	SA_RESTORER	0x04000000
- */
-
 #if !defined MINSIGSTKSZ || !defined SIGSTKSZ
 #define MINSIGSTKSZ	2048
 #define SIGSTKSZ	8192
-- 
2.28.0.220.ged08abb693-goog

