Return-Path: <linux-parisc+bounces-3414-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C5A5F341
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 12:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9633189EE9D
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 11:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B40426A1A8;
	Thu, 13 Mar 2025 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ueem3qgu"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F62D26A1A7
	for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866299; cv=none; b=SVSsg8HFW/AeexACKnvb2+IUmC8ufGKWfzexcceK7Da6UkNHrrjVxkyBxPl0MVCSPATYSW9lgF1fz8aMKBJRiB9D9pp2x23ISlhUMRu1XI7W4mqFmOuCU7On7ZBpcX/xk+It6onHK2iwlWkvVCUA6C5Sol1AZMlm8g/iOW2u8iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866299; c=relaxed/simple;
	bh=NbfqpVn1osOn99nDNr/w9uuM1r2DWHYwWsVBZu8K+4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=kYxbWPGLY1LiwjcJstDOSzVU3xWdhKrYvnXz/Xi4YNuVGFBZoPr6EMgLJGFZW51s4UuzkSpxlrBAz6qwSnVgPN9xXxTQ1QxkmFCWwmoRZ9rmKwlUnipomDqNrbvQGzT3Z0ShadPGOuaJFChVdzEjbWUIFJ3VGnofpvObseOgUsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ueem3qgu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuCFF39iXwBMHtdVpJheMeZKmjdk+AFM9NbRaPloTHM=;
	b=Ueem3qgu/bwrPeThggc8eKEZiZKCmBXNYZTVPIBU0m3PMAm+F6TvBn/xP1RgHL3spX5D/q
	4/o5TZaodkLFpfbVO9btq53ucOCuWY0pXlkLygMOuHcvN+SP5Z2Z8H0Hj+pyAYUFFjnVvf
	X/lbH228eB72/reWPv0oRXBouWFJNxc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-t2xyHwHiNFmoPllVOSm6XA-1; Thu, 13 Mar 2025 07:44:55 -0400
X-MC-Unique: t2xyHwHiNFmoPllVOSm6XA-1
X-Mimecast-MFC-AGG-ID: t2xyHwHiNFmoPllVOSm6XA_1741866294
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so4303845e9.1
        for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866294; x=1742471094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuCFF39iXwBMHtdVpJheMeZKmjdk+AFM9NbRaPloTHM=;
        b=qsSED//C5pq5kiDLIBceCaAGvzNuv+h2WuvTSWPN0RD0TnJBc2LgmSYINrutCje591
         cUCHJIZW7HMgCoZgIPBWo8sEd6VJboEZAtpDHpskC4rI1m9+jmvCr9wHpOkqm9Tdd4ro
         1yqt/WxIRwcFVzl6GbLkqTXymxlKhOTZANoKmCvXoNtqegoL3iCENmz4tYwSzOzEA8jn
         UPKWf8J4fNP+vMp40QMDoIMg3zdRlKL2ZDbUv8obdvABC4a2ivokBg6/s16GkbeKVqi2
         jFBjsjaGlrqDj81sTjdMDBRCRq1hqMa5Ty0lKcd1+gOcmg+lgXF3YXrFO/ae9+miBrC0
         E8iA==
X-Forwarded-Encrypted: i=1; AJvYcCUGIrnYcD9H3fVFu4Kga3aeI202x0UlgCBpBTo46a0sp3bLbAiIH/Y/qxYOmz0KkZS1m0WFqvK0Q1JNYVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLRr0D3bgBa59IOavA06hDweS+vTKkRzJUd0QWwP8I2TabZuHW
	0JQFIOMY8vgv/4h+RL4PeDLcUxNF+jyTXvbP3PWaUqS76S9LqwXnSNmJod1KcnED0PQsCoh9fk+
	M35tCh2F/PH1TMu0SU5vandhclQYddQ8k7P3361dUSuJ62JGdgdE4yvTbx/xGmw==
X-Gm-Gg: ASbGncsJfmRBCxpLgRjgKX0dpAKqoyni9qOdGP5jKVvscd9xhMdYUf845gjF7/zIWGA
	HqBrObt+v5/GzJMDufD1SXNfkJzDxMcAdhBFRo8/0p4qi+SPxsy9AoWkwGMj3wgOeDClziNPQTt
	AO7GmenEdEdXke8pR77seADz52Geo/2NMXkjCXy08+WrNRdFMPAeNQbuaIpO9qrygbqpXWhdVLg
	s191DWDhKmVxjaTXSBFWtVXqpS2k/Ntg7dxIPIkUDEHCGzljDH6KXKDYk5O0I0Pp0Bb0Rz+NErY
	N8gXtkdajjrBnYoLsNle
X-Received: by 2002:a05:600c:448a:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43cee6235b7mr136023265e9.27.1741866293862;
        Thu, 13 Mar 2025 04:44:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0wHJ2zwJ8yj3cYw/s9VH9lfhVlHVsfQsMYeCFjOVxBPaF+5L2/VWS3+5UdzriUt/uCnhyuw==
X-Received: by 2002:a05:600c:448a:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43cee6235b7mr136023005e9.27.1741866293519;
        Thu, 13 Mar 2025 04:44:53 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:52 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 11/14] sh: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:26 +0000
Message-Id: <20250313114329.284104-12-acarmina@redhat.com>
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 05a485c4fabc..470ce6567d20 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -24,21 +24,36 @@
  * The offending file and line are encoded in the __bug_table section.
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-	"\t.short %O2, %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	__BUG_FUNC_PTR				\
+	"\t.short %O3, %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b\n"			\
-	"\t.short %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	"\t.short %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG()						\
 do {							\
 	__asm__ __volatile__ (				\
@@ -47,6 +62,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__), "i" (0),		\
 		   "i" (sizeof(struct bug_entry)));	\
 	unreachable();					\
@@ -60,6 +76,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_WARNING|(flags)),	\
 		   "i" (sizeof(struct bug_entry)));	\
@@ -85,6 +102,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_UNWINDER),		\
 		   "i" (sizeof(struct bug_entry)));	\
-- 
2.34.1


