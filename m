Return-Path: <linux-parisc+bounces-3410-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 674E8A5F338
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 12:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E1593BFD05
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 11:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9E02661B1;
	Thu, 13 Mar 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DESuXSEw"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5987269B0F
	for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866287; cv=none; b=JKuLpNxfxSgiGoit2XF7wHPcdSSPjOIiu82jPVOP87joTtqP2jKFghtyXSDm2lI9mV/3n7DA/D+u9bSlpb2qJB7MLcK1pxxW/9aAZJJad3oRpHOLA7dLcc1oeusZ7Gmk2vLK2xv76L779jvYze0RAkXlFwZfdkv3iVqo3bJSvHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866287; c=relaxed/simple;
	bh=wb4K6eThBhnG7QUcN+gX/b7GoXZu0I9IHZjPqusvMic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=CpAB2GcqAOMBC1nk9CEHHtIv2T28hqrvoe8oeHm8cdAsuOirfiUuR7ibuC/Mhv+AlLmtw7iGAURM07OmpUblXR/XJ+t5EqUbIappDwu8ZkRIoVnl2FUr1jmztSCzmRunw0lSCnk0A8jwQT2z+l2BW4m6g7KiKWSEW/30xTrdXso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DESuXSEw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8P6wNaO+XIHVOsaMiUxPKzcQyyRjSmyu7hy/Ke33WeI=;
	b=DESuXSEw0MK+nK/zlaNyu3j2BohZ3Qlqx082nmPhyQ0AGKhWAt0M1A5ocrwv/VzoxS9uGH
	t5IOkWtqpmcjfoEyAm1rrgJONx/Em+sLSJJEydMzWrlDQeIAiJM0QxEL+i0LH/e+Zt3xay
	tCn16qQ/+MDl/nQMy0swH1Hr3L3343k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-jfmHThfiNBKV9ADG0L-6Sw-1; Thu, 13 Mar 2025 07:44:43 -0400
X-MC-Unique: jfmHThfiNBKV9ADG0L-6Sw-1
X-Mimecast-MFC-AGG-ID: jfmHThfiNBKV9ADG0L-6Sw_1741866283
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so5891175e9.3
        for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866282; x=1742471082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8P6wNaO+XIHVOsaMiUxPKzcQyyRjSmyu7hy/Ke33WeI=;
        b=RMLl2iH+9naykHzgM0rWxTq347852e1zILqZex8My2rkLZceQCqdazafbr1zdfek3t
         TrIqnMmZbcQ6uMV7CztOctW1/qF3z+HW2j/2bgSqO95qNFGGZG64EI0v1wMAnhdCFcyl
         8UYBI0+qHK2lyd/+566QJ/ml8XHHkv6/SxQJ2UO3GB1YwrYEF3tofK7cnaPyJQgXGE2q
         ln/l8cglPH53jPdXmd/PbxYBrNndN2ZWA6OImR9glqzKakAhuNqukWKDOmOwq/XY2rIu
         mKqcJGHxdIU81ER5pVzH1NvHm3VOymma2t5HsZqDUdl8Yait6m4YgIlAJPzzwZtajlKe
         2RHA==
X-Forwarded-Encrypted: i=1; AJvYcCVoHV9g0Tfj1VvhR+sTJGJ3aG3xBEyNImh8REI1pph3hGcZWUXpZMvZReGNSXdKwFdMBGlIPDWNgNVzPcI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bQ/5Zl8LT5XT4P/H0mVxVpaCmC7sUolJA7tvqB6xSicv6zSc
	zN2gutmYpfrX4DwqEehNqlCCJSFmlQhO21Ruh2b8oKKy0tiuVXEeIGEUmVTYx6FSDo0tEmZw1vE
	ligAOP1u+2DmvGuUDC4rdbNnW/Jq3aVMGIRQlh8ZKnKqj7Bj+CHZmv+DEILiXuA==
X-Gm-Gg: ASbGnctVp6nzq6XPLKgqq8esqJnqGaZdmM9HDWnjcstuKtPGGPOF18UD9GJPLlVez+8
	6maSvtJpmFwI09DgJo0ZTaB1m2pSrNudpyqp/RV1PX/dXGbyJD/xfe7A9Ck+u6JuiYhVJSOUi2Q
	cU+al8SNiGCBdv5GvJFULUbA78QkBdKJ9c7MMoZWf+vHIyCoADUYrV+EeWo4Y/+MWvIwkLFrrNQ
	tNZZYMGnA3BAArRzq4TuU5x9oGh7IBv/5SvkUPV7gLU47GnAs0vdqBoY4A6zQ43lT3S4LISKDCZ
	+L7CpcuMJQhR/o/FM37V
X-Received: by 2002:a05:600c:46d3:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43c602223f0mr255847185e9.30.1741866282655;
        Thu, 13 Mar 2025 04:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXX+a12CkpViQK6U7ArlV7I00zmbs9phG5wa1a6gevfoSJzXsUnRwbzS8Xh3mqpEsYOihpsg==
X-Received: by 2002:a05:600c:46d3:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43c602223f0mr255846615e9.30.1741866282213;
        Thu, 13 Mar 2025 04:44:42 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:41 -0700 (PDT)
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 06/14] x86: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:21 +0000
Message-Id: <20250313114329.284104-7-acarmina@redhat.com>
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
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index e85ac0c7c039..f6e13fc675ab 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -35,18 +35,28 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
 	asm_inline volatile("1:\t" ins "\n"				\
 		     ".pushsection __bug_table,\"aw\"\n"		\
 		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
 		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
+		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
+		     "\t.word %c2"        "\t# bug_entry::line\n"	\
+		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
+		     "\t.org 2b+%c4\n"					\
 		     ".popsection\n"					\
 		     extra						\
-		     : : "i" (__FILE__), "i" (__LINE__),		\
+		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
@@ -92,7 +102,8 @@ do {								\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
+	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
+		_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.34.1


