Return-Path: <linux-parisc+bounces-3419-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 817ACA5F35B
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 12:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 256E218920CD
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 11:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBD3268C4B;
	Thu, 13 Mar 2025 11:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JyLiy12g"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB9268694
	for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866315; cv=none; b=kk/FBVljt1vq7n4DTWydkUQ/O4Yy+jMfZyX6AVNeF8sUQotAJB3q0uQOI2y+/786cuqNtfUTRE4/RjxUzsUwaVSHgWMA8k6iKvtTV+QVXaxaeebiJJO2bl3A3vKkTocv6Hwe6C/EnqJY+1BeJZlrFnmdsAvPt9LG4nI0n73YjBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866315; c=relaxed/simple;
	bh=liO3eLVl1wJXmy8vDx1YCNgXVebD8YdGrdwAIJcfcmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=Ga7wJJmlo3xXMijM5/bZtzvDIrKRmVWlYz+q/Pib0L8KEu3c7ezOQfKY8mWLduhARQ8nYP9XsZWusqaNppU3yi//T89eqdXKVFE9yBQCx9VcpWJcffRAVxpHR4yvqGSvQMdmIHblAEcQQXrpXX63JMQv+ug4NRWQRYmJBTYk/eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JyLiy12g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GROr3WSjkuWJZb5whyX7QQnwj0kVrCWo4LNK5GIabXk=;
	b=JyLiy12gdDlGLNB9fthIUmeT3xCiEx6GuMFO5YOWJNgtG4XOW66oajMUS9bftGunoARL+s
	UpfsIomTJuPDb13cDqUR5rVD3SDxrJrfRhVw54RyJYakuUW8/qZDGqO94pOCg3gaVQiS/i
	4BCX9ztnkeqEs3dtTr30fn78Eg2Voqg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-E6vxRU2FNYGljIQ-FPSIlQ-1; Thu, 13 Mar 2025 07:44:46 -0400
X-MC-Unique: E6vxRU2FNYGljIQ-FPSIlQ-1
X-Mimecast-MFC-AGG-ID: E6vxRU2FNYGljIQ-FPSIlQ_1741866285
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so5868445e9.2
        for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866285; x=1742471085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GROr3WSjkuWJZb5whyX7QQnwj0kVrCWo4LNK5GIabXk=;
        b=d+fqhvt0fgykf5+AxLuZeWOizXTle/UDOXjrWGNaTkfWfW9yvMRkyHgGtXfY4hShN6
         Ojq/ESwhxMVFRhV3zCL94pdFkQoqFAGzSePde93+pOoLK9n8MIqymSn3l7zANOMTXwFV
         uhy1Cwom0uICLVH0NsCmMJXhwMQrg3XWwwv+VyXVjX4aSJcs7sBigDjLq/sNtXAWI+vq
         FwXU6AV+k626CAJUeMgLzfFQWfOvJCiDJs81DaHF1x9qYHSVhcPOfgpnHsttorovr/ma
         iNybqJsRAflfkat/5FSoq5w7Y7ZiQ20UPg7S68ATBlG2QAIbJZNWSfw74D5A/fibTtMm
         svSA==
X-Forwarded-Encrypted: i=1; AJvYcCX7+MjTCWyxWhmFzTh1PIkATlgMkt/k3Uwxj9461OUnYXYt0eg+CC17KaQ/4WiQCaX4OIb3VAvQrEocjRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdRrnjv4XPVaaEIgPt9i53pYEP0n1VMY4/dI8ZPwP/8Uo8oxTL
	dHjig1AVtBJ9A1PXIPwxkwq1WgjzFw/fvPi2GdCiW4lIPNL5sYUIBSoK+fPU39nNh7OTNAFu9bP
	z5TT6qTmLucX4Sq2tEQCo0YlxDTHG4jgh3KXDMgtnO7Dw3/zYn+gcYTg3turbgg==
X-Gm-Gg: ASbGncsGOPnos3Cb3fso+Dk4r/xrb3ACiupTd1UJpqSFofSyCgZIKQsdVKMJLrbXCm/
	4GW+KFtQjEJudgstDQfecmJjHgOGD2h/L6NIecaKAFrWtib8F3KreV7TBJfBmoX3uWw8VjI/vai
	zSKMfQEnKE1T/KxwkO/SaJ2Hwje/NCC45G1YZtDT/PCuZlK56p1De5jazkQQ/6gzshxqxUZQLyf
	c/o3lS59NhFJBcxH3XsC6xily2S/L4bZsrw3mV/lXnToNWGvNImdATns+hEWQi503UYJJxemVR2
	pmPssyP1LBjbOskDtiFb
X-Received: by 2002:a05:600c:5493:b0:43c:fb8e:aec0 with SMTP id 5b1f17b1804b1-43d01bd21e2mr95038695e9.1.1741866284840;
        Thu, 13 Mar 2025 04:44:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmAbVJJ3Axf7J+/aQFhSVgbztnHuV0D3aaCUWl74kfxPn81ZspK5wVSFqWrESjIWmYzw2aJw==
X-Received: by 2002:a05:600c:5493:b0:43c:fb8e:aec0 with SMTP id 5b1f17b1804b1-43d01bd21e2mr95038375e9.1.1741866284399;
        Thu, 13 Mar 2025 04:44:44 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:43 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 07/14] arm64: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:22 +0000
Message-Id: <20250313114329.284104-8-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/arm64/include/asm/asm-bug.h | 27 ++++++++++++++++++---------
 arch/arm64/include/asm/bug.h     |  8 +++++++-
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..bf0a5ba81611 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -8,37 +8,46 @@
 #include <asm/brk-imm.h>
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
-#define __BUGVERBOSE_LOCATION(file, line)			\
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)	.long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif
+
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
+#define __BUGVERBOSE_LOCATION(file, func, line)		\
 		.pushsection .rodata.str,"aMS",@progbits,1;	\
 	14472:	.string file;					\
 		.popsection;					\
 								\
 		.long 14472b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
 #else
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
 
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY(flags, func)			\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
+_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)		\
 		.short flags; 				\
 		.align 2;				\
 		.popsection;				\
 	14471:
 #else
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #endif
 
-#define ASM_BUG_FLAGS(flags)				\
-	__BUG_ENTRY(flags)				\
+#define ASM_BUG_FLAGS(flags, func)			\
+	__BUG_ENTRY(flags, func)			\
 	brk	BUG_BRK_IMM
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
 
 #endif /* __ASM_ASM_BUG_H */
diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
index 28be048db3f6..044c5e24a17d 100644
--- a/arch/arm64/include/asm/bug.h
+++ b/arch/arm64/include/asm/bug.h
@@ -11,8 +11,14 @@
 
 #include <asm/asm-bug.h>
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)				\
-	asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
+	asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
 
 #define BUG() do {					\
 	__BUG_FLAGS(0);					\
-- 
2.34.1


