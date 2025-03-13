Return-Path: <linux-parisc+bounces-3417-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFA8A5F355
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 12:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9DD1894DA7
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 11:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127B926656E;
	Thu, 13 Mar 2025 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BR5pgdfi"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECBD26B943
	for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866308; cv=none; b=e5U7s4+pEbVvUMa2wQIUmQjcdncr+nstlxWkV2l5J4wy8lVP6J6iPwiP3yIfQqVuN39YTVuLRDDyz589tkH1jUaYn4DaiZOlfD60phhXgX/jxX76xcdyQg4yc5SMVkN2EQpahhDHGysZtcjrkYun7lX/2iovdVdjVrC/0b6FaX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866308; c=relaxed/simple;
	bh=LkqKUNYGs/ePGkjxR4/GakhMBC+dOQkDGsyg7Jru2eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=rBMOYwfoP+L50KHG2nUiMsX3DXWpoDiYj5jhYERWeo/NVn8tQD6EAhDglJzGuTGUOfRR5EInS+VVcn27CklINwUzbSDovPAaTTfsiLIfMUwucMBnH7x45YkxqT6orNvDcxSn9s94QExRdo9LugLjg1QPzhxV1rOvaq0yFAjr58k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BR5pgdfi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Td98jnkcLGUCy3vrjbMOv35ZA5bivtUA493Q3YOVPt4=;
	b=BR5pgdfifIrLUGTDSxOJSaJhWwO8PAWrvFUrwJ+9zqKHsmmb8WJdTZ9CoxnBt/khy637S2
	bd4b13/bptHR2PQNgO45DTgVNVrKjhxINsPv6r4CEZBBrO1IRsYgd9IBqwp68vSD6DwJTo
	Se9oXuR8e92HGPkmHmhUqJTYhIq28Wk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-AdgdR_eZNYC1loEAPO_opw-1; Thu, 13 Mar 2025 07:44:59 -0400
X-MC-Unique: AdgdR_eZNYC1loEAPO_opw-1
X-Mimecast-MFC-AGG-ID: AdgdR_eZNYC1loEAPO_opw_1741866296
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3913b2d355fso345478f8f.1
        for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866296; x=1742471096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td98jnkcLGUCy3vrjbMOv35ZA5bivtUA493Q3YOVPt4=;
        b=wdbHbVPvs8bU8W0ARwDHLZVFVL0RTv0Fdd6PTSnaemjLx/woQc/dt384J5T0/eXQNe
         jVOIYsld0pi3LQgynW8sG2yJxtElSzwE37nnvjZcvUAWhJ3JjIaWeeJ7NDedb+4FaNVc
         f//RrXpdiBhgYaZReTIx7EaEh77eAYqSqk7UkmBCuLCHnkFgWQ6dBY3KHTApp5BmXTBb
         lW68EarolUX7zDxch0B8+ASLyA26WL5F/qqTo0se/tru/zVaw7rfn3d0zwtZ0qgX4UHj
         WizQqijqaI0z2UkEQSRWPKU9WkGnYYOIB9SVgah9lYu4FDATHZJ9qkrztgrUW881NW1Y
         fn3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOXRmN1RuRgw0kv/Umt2BU6k+G6LM66iJ21hTqY+LE9/zv+r7PVXwgKc2IiB3DWRtCAemT0CuXF9zxGZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+TBxn4rhrqhEF815WNTszqNRrEV3/OWf9uNTZSwjtE4OQpEl
	CCJ5iI6UGpcAshlWQECIYl7Dafo/F2xjlOImV0E47OKdLASrUwaOgoluYfy0cxkZjxZJS7uuBnM
	lrI0YyDJROzjhPdNUN7fkdT2lGYMBHs2fZ3RlkXcbxT9mfZF/0U3nAcFIIBDQhg==
X-Gm-Gg: ASbGncsIhLfBXIo4VyLzNKyMYhpsMVovvWa41Mid3b2rs60SB9Qn7kLzRKky2s3FF6B
	lrMIBOAZxX/1vWFj4Qnavo/Dfd3AekdkmzurF6I+any7mE878W0ermcDkGk4IlqRC6g7UobeMDp
	/gf3XFlWv2NeAeXnBlT5UDTqCU+7nXhUXO2/sofD0QAixOOlSO1tBjex1LPZT4rhaVU6D0uhqk3
	5AQWIfEG77tEVwLyA7FnB8IFwg+yMmnLbwow8f40pfTm41R4XYNYy0rJBDZ7U5kDEJlH0f/T7zA
	gV/kR89Iahz595UyAVUl
X-Received: by 2002:a5d:64a8:0:b0:391:23e7:968d with SMTP id ffacd0b85a97d-39132db703cmr17836136f8f.47.1741866296140;
        Thu, 13 Mar 2025 04:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyU2ePtAFWyqCZMakOsiK4/iIhrDziNVQawXJEAak4gPJli8tipIq38M0q9zksW0XKC08fAA==
X-Received: by 2002:a5d:64a8:0:b0:391:23e7:968d with SMTP id ffacd0b85a97d-39132db703cmr17836093f8f.47.1741866295677;
        Thu, 13 Mar 2025 04:44:55 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:54 -0700 (PDT)
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
	Simon Horman <horms@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 12/14] sh: Move defines needed for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:27 +0000
Message-Id: <20250313114329.284104-13-acarmina@redhat.com>
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

Declaring the defines needed for suppressing warning inside
'#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.

.../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
	Prototype was for HAVE_BUG_FUNCTION() instead

Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
to make kerneldoc happy.

Reported-by: Simon Horman <horms@kernel.org>
Cc: Simon Horman <horms@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/sh/include/asm/bug.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 470ce6567d20..bf4947d51d69 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -11,6 +11,15 @@
 #define HAVE_ARCH_BUG
 #define HAVE_ARCH_WARN_ON
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+#endif /* CONFIG_DEBUG_BUGVERBOSE */
+
 /**
  * _EMIT_BUG_ENTRY
  * %1 - __FILE__
@@ -25,13 +34,6 @@
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
-# define HAVE_BUG_FUNCTION
-# define __BUG_FUNC_PTR	"\t.long %O2\n"
-#else
-# define __BUG_FUNC_PTR
-#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
-
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-- 
2.34.1


