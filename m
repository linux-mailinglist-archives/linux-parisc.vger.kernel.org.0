Return-Path: <linux-parisc+bounces-3411-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7585A5F325
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 12:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB73C178401
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 11:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055F726A0B7;
	Thu, 13 Mar 2025 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A5htqcQc"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608326A089
	for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866292; cv=none; b=suymhSx1/rFlQEuRIcYgic0bMZxvInBotYCwDBbygNX9pburrDuU0Lb+SUUtkH4sD1MDHW3kMdxAnj1mxWe4K2N/7yMDYABy5uHBLH5KedFN7lDuMqZnLFkShteCU4j0WFP5zhzAaMmEUo9QizWnBE7sWhnJ+Ol7RrYXahTYCzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866292; c=relaxed/simple;
	bh=5fLDKvq7QfjMD1rpic/O5Jy44W9yZO5UGhmiIAM5Nww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=FKOv+mViThzfWmIN7y8oVlBa7ixlkpHhdNghrZzfuzCuVZgNQziiN3dzTbbXO5nvA8pkyPXtIhOiPjwudYl3m0+w7OUAZz2hg8XlhmgzNCz+j4dmrYqpTBghvGDdW9GpRgugTaaWknLQbp+N/hlC74ArtzsdTsckyy0Ru9NpQG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A5htqcQc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=;
	b=A5htqcQc6oydg+nK9KB33vri8Bs/8uV8rNSSccmtczrHPIPeGjYeR7tOipxfhOzdnCoSNG
	EtECwVEnw3T5nS168z0hPVAQCFnuJfTq4cG6uaDJFx/iZ2zN0dWPkZsPSyqFUSx8GfwN10
	fjk6w89idfvNRut5ZFj6dZ+k637Wtfg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-pwcXVK8DPbWgA9cHWotmLQ-1; Thu, 13 Mar 2025 07:44:48 -0400
X-MC-Unique: pwcXVK8DPbWgA9cHWotmLQ-1
X-Mimecast-MFC-AGG-ID: pwcXVK8DPbWgA9cHWotmLQ_1741866287
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so6438055e9.2
        for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866287; x=1742471087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=;
        b=MLhlT4uWGVxi+YMjJzNgHzoGr8HXu59TzTII0Iolz5/T72YoosrfFXFFN7UGJnBw7p
         MCfjFH4nRl4OpmCWI9N5qM3ub0t+L3pY4RIYNfwouf95AGNh4qlaGne0VVuQYI2VLW0z
         TToQ/uLWnjxYagZFK34EjCLgjlgLkcssDfmba3wDv8CFogHzwvBSPcgomgOknelxf9K6
         xFKu1RTVM2akDsVoyxjW89xFhsHhqC+sstvZxvlKL9GRxS4MIAj3Uu9cVdqrLDlxwlxB
         u/F9X4IjvPVHRG7/p/aXOVt++fBm4zY+1Hyzkr4M3vf97Z7/TjQ9XSipeATmZXFN9h+p
         8Okg==
X-Forwarded-Encrypted: i=1; AJvYcCWpLnRHZulIXBIjyQXqIPk83KJmD37y3SjOnMJdbvK0M2JL+HP2ZuR2EMcZsqJYF2K+q10gYztW/Flstv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKsf4q8vM00BH7nwwb0N6SChSqSxDKzYYts7TaAiRx3qumWHzZ
	YMpICiMv10pgF+o0V7mhsH/0IhBUBoWw33fsWD86NdLFvRo7JAFZ17sn4bWp/woJ4qkaSLqZwvC
	LW1ACpgMd0Q41hjfpqRbErhUbKcNH/kZ5XKceOceCzGZVh6RMUE7byfwfSgpptw==
X-Gm-Gg: ASbGncvg8dsyjAl/56Ak+1vjeg3uDX7SSnbOCCRT+tqaKuiKRziU7XJSswcbB/ISM5d
	TQzuZjY0UnIpd7VXKqB0f1CyPbesU8zhMHn0NUbaD2/EERXj/aqVbjPEEIliW9IRBJmrBo2tdxo
	QAddme1kyJOgThRya9v6nUzrqoQ5Dycdf0QBF/GRzv6xuMYdv2rlEse5l7I2yHw5wVCXWGfjUIc
	qSjDP/c/WEsNo5zKmcnpD7SsfWvacUNg4hh1KUqHKQL6/GmFAh4gejFF/764FnzeBHaKCjshboJ
	bCkQI/mvbShvEIOK46hn
X-Received: by 2002:a05:600c:3512:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43cfe154338mr111255115e9.9.1741866287290;
        Thu, 13 Mar 2025 04:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDgHdaZ1G01z8VuKBQ3BfPMVXgqQ5rvdTXEZ7bpTSjr+Dr16GZrLUPpD2KPNpGCET/hDHX7g==
X-Received: by 2002:a05:600c:3512:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43cfe154338mr111254865e9.9.1741866286869;
        Thu, 13 Mar 2025 04:44:46 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:45 -0700 (PDT)
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
	Huacai Chen <chenhuacai@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 08/14] loongarch: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:23 +0000
Message-Id: <20250313114329.284104-9-acarmina@redhat.com>
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/loongarch/include/asm/bug.h | 42 ++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index f6f254f2c5db..b79ff6696ce6 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -3,49 +3,65 @@
 #define __ASM_BUG_H
 
 #include <asm/break.h>
+#include <kunit/bug.h>
 #include <linux/stringify.h>
 #include <linux/objtool.h>
 
 #ifndef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #else
-#define __BUGVERBOSE_LOCATION(file, line)			\
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)  .long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
+#define __BUGVERBOSE_LOCATION(file, func, line)			\
 		.pushsection .rodata.str, "aMS", @progbits, 1;	\
 	10002:	.string file;					\
 		.popsection;					\
 								\
 		.long 10002b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifndef CONFIG_GENERIC_BUG
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #else
-#define __BUG_ENTRY(flags) 					\
+#define __BUG_ENTRY(flags, func)				\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
+		_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)	\
 		.short flags; 					\
 		.popsection;					\
 	10001:
 #endif
 
-#define ASM_BUG_FLAGS(flags)					\
-	__BUG_ENTRY(flags)					\
+#define ASM_BUG_FLAGS(flags, func)				\
+	__BUG_ENTRY(flags, func)				\
 	break		BRK_BUG;
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
+
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC    __func__
+#else
+# define __BUG_FUNC    NULL
+#endif
 
-#define __BUG_FLAGS(flags, extra)					\
-	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))		\
-			     extra);
+#define __BUG_FLAGS(flags, extra)				\
+	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags, %0)) \
+			     extra : : "i" (__BUG_FUNC) );
 
 #define __WARN_FLAGS(flags)					\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
+	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
+		__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.34.1


