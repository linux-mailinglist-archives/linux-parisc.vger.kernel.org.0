Return-Path: <linux-parisc+bounces-3412-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D76A5F34E
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 12:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B2403BFA52
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 11:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEF426A0DC;
	Thu, 13 Mar 2025 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UhzjzNNl"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676A266EF8
	for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866295; cv=none; b=JafhFRMjtK19EbaviTtb9AKbJv1G93x91ueMsN8VM4DePMOsuBs3g3bbvo4CVHzv48hOvF8tt60GQcCojbGLGvPDM9p1Z5YuXXv5ljaU2+TqrTGALBeMhzNXJIggqvjfMKSk1jD/V5ipHW+fXiD4qQ9mJnVnn0R0BCTey0jKC/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866295; c=relaxed/simple;
	bh=0aizeDhwWkFKZsPeHlQzOAxiwKdPV8X3HwIBD/FO6ic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=CRtZN9fs9gPgMUz8BDp5PAqSuIynkjs4HRYlJmNQcaawRdOCOI8nDahDhwhmmPLy8u4h6p4tGd62iSC8Mh8Mhm5tD2nV1TNRELh6+/0NtforQpaTEVeQu2lXbCU8FKH+qyhmwOUV5LmtfMCQGl7KRIKHfAhxKsFQyqqbOHD8sjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UhzjzNNl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNDdusV5kHSN69Wnsdcb+ESaCAhVWZZ95i0rdnVfZIo=;
	b=UhzjzNNlkWyKPCBgU3I7/myJZoQ/R4kROmu9b//6VZraxGHS6AhCciyKggGA20l9g79beY
	/xN8afHGR2yKYsqfLHEPA6onEHo9pa4tQ+hX7qqJ3Dio5eLOFE4Ub50RFbZn6WGIw3y3Kn
	C5jd4tTbTY0BapeU8xCd7KkGyqRY4C4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-BxxbJwiAMd25F-6Rxc0WwQ-1; Thu, 13 Mar 2025 07:44:50 -0400
X-MC-Unique: BxxbJwiAMd25F-6Rxc0WwQ-1
X-Mimecast-MFC-AGG-ID: BxxbJwiAMd25F-6Rxc0WwQ_1741866289
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912e4e2033so382883f8f.0
        for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866289; x=1742471089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNDdusV5kHSN69Wnsdcb+ESaCAhVWZZ95i0rdnVfZIo=;
        b=JN8p9Whn7gf/mkZcCkg7ihC3LPFhRa+QzrzhwUa4KF+qYkDK3x5HtZiPmugU/gQz8E
         WmCowoGeiSffDAqR5Vz7Sz7Gv3KZmKYjArBgpmInEF8x/KWAkpdGwfQDRrc8eFbieRsZ
         5YPUjlCasme1Dlk0ZTDwxPdesFkBE3MuUmwCDSsOzL0DZJJrKT6d9hvaxl5zc0B0jo1g
         0w2W1sCwwjZy5Vp0xQudoEegg0IoKDQ8IirF2eyNbgVdh7Df+Qgx55ZVp9KMC00cUIVJ
         6bx3weU9XgeATQNxneB/lc4fdhgqYEjK/6EM1tlzuHLnK5dpAhscSmenDRgvgn2YuUWo
         xE9w==
X-Forwarded-Encrypted: i=1; AJvYcCXfkw8MoRwHLFv0V5pDllmLPF2oRhSBGHfBNLPRHzvDt+uZMLZbpXJ1W0/7+Rp4ZFsRz495Jl0sejwskGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK6w9X7QXKZ8KV7Wg/6Nc5RBQsiP+h+BrDRn8SRXKYUzPrArWW
	jH3ObulwKO73YrpmfzYpsn4V97d/ckMahGkHbRPQdCo+S+0huaCE6mKtdMiHo1w5XbVL+eSXjid
	Zpn/1f8nZQqy1EORAwEk+hXplibsuJvWhFiu8dI8A07vdV+F6oLaSxSAFPq3UEw==
X-Gm-Gg: ASbGncs0MIGY/H4FgxgJq0wNI7hnBKaN+MRBiS/SHSnnGxcTWb98/2anl7MU8EX4zje
	+4sBb/O6iG6nx/FtTYMEz2bdkvWB8jEGFu+YNdt5ewGsx0HD5yIll1iY/G9xfgZoM3f3mGUlYBh
	B+/hR0csePti+QZEuccSQ6Gez+E30qQB/Q8F8KaWqf6OYiRJyj0QiarFmWAXWdPYOMcTo3leDlv
	mwPEl0oWqKUxWsENT4o5beyiqVjtwT9O4KQuiiLxsBz3TZF2tbgnov00vZLvUAfnqfaHET1uNz2
	t3N9+8K1WGpcsDah/wLN
X-Received: by 2002:a5d:6daa:0:b0:390:fbba:e64b with SMTP id ffacd0b85a97d-39132d8afb7mr18596817f8f.31.1741866289394;
        Thu, 13 Mar 2025 04:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYwocEA7kYpHNOe02FWF9uxS8M3FuzRDEqfu4GtiOXX78+oDlT7RdxLzaiu9BpsPlw7lldzQ==
X-Received: by 2002:a5d:6daa:0:b0:390:fbba:e64b with SMTP id ffacd0b85a97d-39132d8afb7mr18596786f8f.31.1741866289052;
        Thu, 13 Mar 2025 04:44:49 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:48 -0700 (PDT)
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
	Helge Deller <deller@gmx.de>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 09/14] parisc: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:24 +0000
Message-Id: <20250313114329.284104-10-acarmina@redhat.com>
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

While at it, declare assembler parameters as constants where possible.
Refine .blockz instructions to calculate the necessary padding instead
of using fixed values.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/parisc/include/asm/bug.h | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 833555f74ffa..b59c3f7380bf 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -23,8 +23,17 @@
 # define __BUG_REL(val) ".word " __stringify(val)
 #endif
 
-
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define BUG()								\
 	do {								\
 		asm volatile("\n"					\
@@ -33,10 +42,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %c3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (0), "i" (sizeof(struct bug_entry)) );	\
 		unreachable();						\
 	} while(0)
@@ -58,10 +69,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
 	} while(0)
@@ -74,7 +87,7 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t.short %0\n"				\
-			     "\t.blockz %1-4-2\n"			\
+			     "\t.blockz %c1-(.-2b)\n"			\
 			     "\t.popsection"				\
 			     : : "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
-- 
2.34.1


