Return-Path: <linux-parisc+bounces-3409-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594CA5F326
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 12:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F9893A80B5
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 11:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A38A269899;
	Thu, 13 Mar 2025 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dDT8Ld3i"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA54267F79
	for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866283; cv=none; b=LAnc+tIAVQZenaN0QVhit0oYeplI2q37Oc2fuJEVPYpCnZ3NG1QaDvi0qUfa7YI58/QYYcMoOrFzDYeSlWHoa0zoyz6nNbDM9p6rwuKqpJn7hLpP++02sbaWPKu4PohLmmwBrG0W37md+7om7/LzU2gSJzoTy4MXUsFUF4EEaS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866283; c=relaxed/simple;
	bh=k/QW8yyThWQYD06PZzn8avBbFa43Ro0Rb4YCVVYWNuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=n7umEiwgBPaw0OaXymapvniREZwx3dsh+Inu7Ewo6PlQ7VRIHQfeoL41xMA5DVdqkz07CbrmcBfR4rYXdWVcUNrc+T6COMw8lePrp8M6XRWvjw28MFfSCNVL6KRPC2c5GznKaboQzVxmXGWcjKxWjDA2uw6kXD6l4QwjFx9CCMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dDT8Ld3i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
	b=dDT8Ld3iMDbNLuPtKnwtwxnk1TH7HtnkGAXjEqLyEFPK4LmprwWoFs2HMl3iFWS/OzYfZy
	1KoI4jEU/cc6j4SlnWN7bldVylm68N2CsIW9kLnt+jVvPKmxLdv1Opp/oBmmeU9nRj5h2/
	yv4gscgc9EPIoUYRBU0w/db5+FyLpMw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-aQJdGzYdPqWKKyry2hkNFA-1; Thu, 13 Mar 2025 07:44:38 -0400
X-MC-Unique: aQJdGzYdPqWKKyry2hkNFA-1
X-Mimecast-MFC-AGG-ID: aQJdGzYdPqWKKyry2hkNFA_1741866278
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39135d31ca4so448460f8f.1
        for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866278; x=1742471078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
        b=YN+qejtlPHdLMbX/+NdtY+bO3IbT45L2mcmbnX55V/4uj1j+qKjYigXCuMe40h+K7v
         b/I4AEC/TNXvUivpSqzwsTrEzWVFHmKi5w/NY6sK0CU6pSmGHBHE5NilBVFUGOmB7ClL
         2s4+FgfBxxRpc+ZmZ9W3bawv5OObYCZoXuu6A1ep4FRzixz1KvXzoZrlRl7PnbnL43V+
         g+1Pq5Y95rimwmEyB7aobSIGWUq2PvChSac6EqaicE3/Xwhr/BMzHX1oZcmkfk07vNt7
         uohNXgoXlaA77gBdBQy2NBnL+o8cWk8wiW3f1LdEstB/db9dTLwSGK1Y1mzB9/sCuQG4
         O5rA==
X-Forwarded-Encrypted: i=1; AJvYcCWnnoAwpTB7nj5CftlQg615rHkFbsC9VuT01pvXxENY9DAlQ5+4knt9k4io7buwguYk29oMsvRwsyNJh6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyFb8KMz4eNy9HWs8QB2b10IsohiXsPU8DKI/njf7aqC8UNMPp
	13vsGBgeBGAj3PHZ5/J27h/2QSlv0NtW+ZavgUEDfyVr5g2XVMJwFa89AVUBioauYKXsNGJujEx
	qNdgHvFyE6EOkokCdAnUJdppQuuXYmyjWwdrqavN1Ug9snk+donRcdiBXnlS5hw==
X-Gm-Gg: ASbGnctcFDQQ3MRC/p0k2nwof2zy1Ygks+IRFcoCzDrQu6+ZasT/gzQpyerFv/MXX8r
	q+Dg/P2fk3NlalHXdbz+EXM+4f5gxQONbAKiOALvzchv/1KfQZqWRVPS/Q+QNZDqhd/vSegVgqb
	C67c/qIKAa16h4TFJ6nNwqwCJg+pR6VlXVyJl8/XPJdzOTsHAZaklpjqLenFViZpAEnNJ9/8f4E
	LvOOjRFz3w1z1nv3YuE1HDvpHA77/h0S2WmoUjxNB7Xv2bBH9CKFTO12E4jAMsrQjs8knEV1TLM
	D4FWsJlkxocEQhkIpeiO
X-Received: by 2002:a05:6000:1fa9:b0:390:f025:9e85 with SMTP id ffacd0b85a97d-395b954eeeamr1447651f8f.21.1741866277773;
        Thu, 13 Mar 2025 04:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPsIsJrLJpu/wcDWacnMw+4SNJEtb8GetI5Mzi5kv4VuMQGkXurfVfuA8bqNlB7JY189Yj3A==
X-Received: by 2002:a05:6000:1fa9:b0:390:f025:9e85 with SMTP id ffacd0b85a97d-395b954eeeamr1447604f8f.21.1741866277398;
        Thu, 13 Mar 2025 04:44:37 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:36 -0700 (PDT)
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
Subject: [PATCH v4 04/14] kunit: Add documentation for warning backtrace suppression API
Date: Thu, 13 Mar 2025 11:43:19 +0000
Message-Id: <20250313114329.284104-5-acarmina@redhat.com>
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

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..b2f1e56d53b4 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -157,6 +157,34 @@ Alternatively, one can take full control over the error message by using
 	if (some_setup_function())
 		KUNIT_FAIL(test, "Failed to setup thing for testing");
 
+Suppressing warning backtraces
+------------------------------
+
+Some unit tests trigger warning backtraces either intentionally or as side
+effect. Such backtraces are normally undesirable since they distract from
+the actual test and may result in the impression that there is a problem.
+
+Such backtraces can be suppressed. To suppress a backtrace in some_function(),
+use the following code.
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		DEFINE_SUPPRESSED_WARNING(some_function);
+
+		KUNIT_START_SUPPRESSED_WARNING(some_function);
+		trigger_backtrace();
+		KUNIT_END_SUPPRESSED_WARNING(some_function);
+	}
+
+SUPPRESSED_WARNING_COUNT() returns the number of suppressed backtraces. If the
+suppressed backtrace was triggered on purpose, this can be used to check if
+the backtrace was actually triggered.
+
+.. code-block:: c
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(some_function), 1);
 
 Test Suites
 ~~~~~~~~~~~
@@ -857,4 +885,4 @@ For example:
 		dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
 
 		// Everything is cleaned up automatically when the test ends.
-	}
\ No newline at end of file
+	}
-- 
2.34.1


