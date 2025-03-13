Return-Path: <linux-parisc+bounces-3418-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D082A5F359
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 12:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E006C7A9E04
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 11:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2009E268C55;
	Thu, 13 Mar 2025 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z3/zfWcI"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BF926BDA4
	for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866315; cv=none; b=ij/uwUxwOxMjovB8qU/ehydEIN+DehdZKrXdLFKlyKQ60PHT73yWP3bjUNskMWC683PZ+krHKJ0m+v5UL9fQGGXD0X9J0V1V49hygZTyI0KiJqHoy3b3yRc8UILCnhs8WakWMZhVAY+ZxZUXTlecDBLOg/kAF3jDlxLsbFwuRJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866315; c=relaxed/simple;
	bh=0zAXw8Fu4pWyrls3J/qZaqJC0Q8LMMCdN0t5bJavxBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-type; b=iSpSapHMDCZAdjRbnDxj1jtxZIoGX4pFGeLQ7bI07TK3CR039KOT6NcEnEXAfpz4AJ+OatuzK0EoWnrvncEuGXE6Rg68m33yTY0s6zT8VvP+PSaeGyhnVWgxl4Jgnv0c6dUK2w02ga7RAooUCGJjDu+NtxP2H6ZA7JjsgZ7sWro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z3/zfWcI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3r2g39Wllme+8/IppJMHdqpnHPlgxpExHUFAvvaA/g=;
	b=Z3/zfWcIuzVUqaCIARbNk47VSZahjE2kr8bBPpfPiXH51VWod8okz1toLWcknCl415t8GL
	BTpIiq+zQOqzfDQiPGJ6UuW7Ttkoj2Ej/cDeabuCOzWiugzmLMiNttxxKz+HdAbvgcvEaG
	fMBT5tg++IisZ9NzX2BMCAmjkYENq7I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-gZ_Sblc_MDaWvk9SukFWaA-1; Thu, 13 Mar 2025 07:44:41 -0400
X-MC-Unique: gZ_Sblc_MDaWvk9SukFWaA-1
X-Mimecast-MFC-AGG-ID: gZ_Sblc_MDaWvk9SukFWaA_1741866280
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3914608e90eso532346f8f.2
        for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866280; x=1742471080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3r2g39Wllme+8/IppJMHdqpnHPlgxpExHUFAvvaA/g=;
        b=IC8KBfIrUdJXfGmI7HwusU/iQ69RGZWywI3/Xcy97zJMdmQd8cABh0GcCvbOP6e6mA
         bWWUifqXWHwtZgPkofpgJYmad8j2bz3PMupcYfs0x7bk9nW6biMDmZ81rA0G7JO5qrEq
         WRvjFdzQhyFzgLhktGS8uDRZMARLLh2zqSX5TJbPBAva6dGzKX9Y/kCn33laQMxbIsIZ
         51evZ55esviMdj72KJVEdke9b9EsP6bYK0bXXln2aFKjf2l1nlZadCs55OQj1cwa7dsJ
         kwR6W7nTKIc0nrAbeA6R/QlfPHmsuTL7uHU50ifEa5aIRvur247xBvartJFWcjX9r9wE
         aZeg==
X-Forwarded-Encrypted: i=1; AJvYcCVJaVqmqU4Ivz8GvZNolr+ItTz5ehslTiaZDwFcSQJUW3wqHOB/O2hIe0/KnbP4DavbRglour/102nD8Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAaFDO0mJepXr61vQ5rW5NrsIovlJeCeV4VItUJILa674buv8P
	IzM+Xvmd1CsgjTkN11sfDlYf6A+7Vh3Y18JHjy5CmEWRtHYAzYPWRUtjH6aDGd6tqsJixHx+wrL
	SKR7vFedCURr7b0MBEyrKVO11LEoAetMZyQSEVXhn09RvLgyTDs7g8rmcpbRM7A==
X-Gm-Gg: ASbGnctTivwt8FPAo4qKFoHaVY8PBVFx/DeDdWPvv6yRXrQ0xTNlo3esa67fnrjYp2O
	yCmr6Kq+ERdosLird1KXSYLegAi5cCMZ1O5oPtQEF0ENNkF47xDK3rR+Fap3vAph6Xk2JiLfK3q
	kmi75Uoj4JHzC0E8Uk2SoUIRYbpQDR31PlfBc5cjLuy09jM/c+ICXTk9U0zoJh3sCAaZXiAG6TV
	gW9xnoF8rs803iahueCjOtkNquDRoR0JERV2oaznKrkIWrPgN1mv2MXOQ4Uq2pSuc5z0z90igu8
	vZCs2cOSfX4wUuAlxTO9
X-Received: by 2002:a05:6000:402a:b0:390:d73a:4848 with SMTP id ffacd0b85a97d-39132db1bdcmr22488997f8f.47.1741866280376;
        Thu, 13 Mar 2025 04:44:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX54DwhuuXuiX517uvSUEgVEhgO3UBbgNo/IaPOPi6DbNC92jX9q/7SC3qQwivycyOtbvIkA==
X-Received: by 2002:a05:6000:402a:b0:390:d73a:4848 with SMTP id ffacd0b85a97d-39132db1bdcmr22488963f8f.47.1741866280013;
        Thu, 13 Mar 2025 04:44:40 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:38 -0700 (PDT)
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
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 05/14] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Thu, 13 Mar 2025 11:43:20 +0000
Message-Id: <20250313114329.284104-6-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log and distraction from real problems.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Maíra Canal <mcanal@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 17e1f34b7610..e8d707b4a101 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,22 +406,38 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
 
 static void drm_test_rect_calc_hscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	/*
+	 * drm_rect_calc_hscale() generates a warning backtrace whenever bad
+	 * parameters are passed to it. This affects all unit tests with an
+	 * error code in expected_scaling_factor.
+	 */
+	KUNIT_START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	KUNIT_END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
 static void drm_test_rect_calc_vscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	/*
+	 * drm_rect_calc_vscale() generates a warning backtrace whenever bad
+	 * parameters are passed to it. This affects all unit tests with an
+	 * error code in expected_scaling_factor.
+	 */
+	KUNIT_START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	KUNIT_END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
-- 
2.34.1


