Return-Path: <linux-parisc+bounces-514-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF9850C1E
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Feb 2024 00:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B4CC1F22203
	for <lists+linux-parisc@lfdr.de>; Sun, 11 Feb 2024 23:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E786E171A5;
	Sun, 11 Feb 2024 23:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="M5JSqYeC"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA1329A8
	for <linux-parisc@vger.kernel.org>; Sun, 11 Feb 2024 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707692997; cv=none; b=hv/aotIOfI1/YQtMN47yVCTMkFPa8JIWd7DRq0PMWQRLcG1bzuZJdgauXGkW4Nu3ylhigCVPe4J9AYdQD76A+ojw4N0PpYROThNe8DeBzh3w4ZvpxelGlc4BQWV3vIY1jv06A25luQp/CDrUhlGFEZATD23gum2/E6CJCWwdp1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707692997; c=relaxed/simple;
	bh=0UHBFd8KsfNzuUb6VByQxElPhKzrj40UEzATEtX2vCE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qaEVhGabLLLzUtDw47s4ChDxVCvgsUZVbl8dHsB4RY8V45DWm2B1SuMev7SwlPwhPtzHgxqKfiTUITgWVwzx+GLYl3BTFVgnf1ihU+wQp1ySv2kQmIf/gzP8Mkpn3/5GoHH+vC1dk51acEQx1jkVYHZ37hbUmxX01u/rH+DnF38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=M5JSqYeC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-560c696ccffso6375956a12.1
        for <linux-parisc@vger.kernel.org>; Sun, 11 Feb 2024 15:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1707692994; x=1708297794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XH/aCjJt/DiB7MsEbqzKT+olkUUu+T5Xb1GlIEopZ2s=;
        b=M5JSqYeCSp8QZJ0B2mc5PfXQd8UPl+0ebY+0u3Y8K2A0g/yx5mmKb5TiyY96kReG60
         rdBafxGQe9jaEMLth/9RIT43xfVjJ3VUAfpxec6sEX7XaN+r+HJv/hodKAmEScigPQmb
         b5HIFSqr9NsYSACyYYq0ZPq3/sDHQSxyW87siIYAIv65M3EnrxP0zVbjtRhiJUmlISWK
         PW9LIMxa4nyxbONBqWD9F6jSJ/spDArZ7X3oJ9txipFILbKmt6sS3dQ7HaZvv6aVRU1J
         N/M4IlywRgLrZEMoxTgcxCNQDardrOj//vbYNC7Qv1EYRsu5dnB+UA1191K5D/ZvI4lL
         zL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707692994; x=1708297794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH/aCjJt/DiB7MsEbqzKT+olkUUu+T5Xb1GlIEopZ2s=;
        b=S1kVaeKi9L2aMC3m6YZXfKiCA3kIZqo+4MnKHiD6/oZOWWg+oYnHpTQ+7hGDrWxex/
         zoRo3uIOY5fgzZ2992Jdx8jXRZJGVZlwfaq79IMFqSYhykHCQgxssJDiM1UX5ps4JWY2
         GQesxypHe+pBKCUf2dt31+3fAJrVVf/L8y2j76hbwj4WX6IaoM2coDjK4FYKguTC3UTh
         X5pGrAyUYs7/8MUpZOHzf2YvNA9CdLirlVK/AB62Aq2lw5uq9E0icGmEzvj9Y1LONg0b
         vlBkcJQFy4kaWR66x5GjM+qtoJq6zgsQQSfD5DB1XwiQrDd5++zNPvua1LWJaH0v5fmY
         fbBA==
X-Gm-Message-State: AOJu0YzJgTMVDD/AqNPUohCXe87Tf/SGB+MWFPy6udHWXXOE6yMkuCrw
	MEF5MZjo51imiDPVfErcQUwuUTdio/AiarAKN6q0JW4dDSqSzAJppLrYHSH8W94=
X-Google-Smtp-Source: AGHT+IE/NlI/6DThlF/g6NgjuI7e0164D2rPvpOssgTLNrvG5ONjv7e8Jh03RQj+ex2PdOM1dF87kQ==
X-Received: by 2002:a05:6402:35d2:b0:561:841f:ed03 with SMTP id z18-20020a05640235d200b00561841fed03mr4116845edc.14.1707692993755;
        Sun, 11 Feb 2024 15:09:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8klcKZ40EjoIvJcSdkTkkctgF4aLklrTh0LA3GCGFlxsHvhu2iaJDoXh8SbFR2ykdO1OHYPmnwHRIRne8/iFWv3Xnx0P+iJDrLWI3UsTxy6mYBkjPS80zr+xF81W5Ft2FoFZePwaIKyF9/s3hpXjyma4TfGT/DY7z4np6u7S1JBY+bE4BqXDohnuaPizfwn/i7uNKjGn/8uPde2l6nDNATh26taFPA6bdDegmDFNeIFxVY2t1k16RyJRZ69GTdUGujLgEM1HxzKEx2YkKBGRrta4cmsvtaw==
Received: from raven.blarg.de (p200300dc6f267100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f26:7100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id e8-20020a056402148800b0055ff9299f71sm2183566edv.46.2024.02.11.15.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 15:09:53 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: svens@stackframe.org,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	mcgrof@kernel.org,
	linux-parisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] parisc/kprobes: always include asm-generic/kprobes.h
Date: Mon, 12 Feb 2024 00:09:45 +0100
Message-Id: <20240211230945.297104-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NOKPROBE_SYMBOL macro (and others) were moved to
asm-generic/kprobes.h in 2017 by commit 7d134b2ce639 ("kprobes: move
kprobe declarations to asm-generic/kprobes.h"), and this new header
was included by asm/kprobes.h unconditionally on all architectures.

When kprobe support was added to parisc in 2017 by commit
8858ac8e9e9b1 ("parisc: Implement kprobes"), that header was only
included when CONFIG_KPROBES was enabled.

This can lead to build failures when NOKPROBE_SYMBOL is used, but
CONFIG_KPROBES is disabled.  This mistake however was never actually
noticed because linux/kprobes.h also includes asm-generic/kprobes.h
(though I do not understand why that is, because it also includes
asm/kprobes.h).

To prevent eventual build failures, I suggest to always include
asm-generic/kprobes.h on parisc, just like all the other architectures
do.  This way, including asm/kprobes.h suffices, and nobody (outside
of arch/) ever needs to explicitly include asm-generic/kprobes.h.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/parisc/include/asm/kprobes.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/kprobes.h b/arch/parisc/include/asm/kprobes.h
index 0a175ac87698..0f42f5c8e3b6 100644
--- a/arch/parisc/include/asm/kprobes.h
+++ b/arch/parisc/include/asm/kprobes.h
@@ -10,9 +10,10 @@
 #ifndef _PARISC_KPROBES_H
 #define _PARISC_KPROBES_H
 
+#include <asm-generic/kprobes.h>
+
 #ifdef CONFIG_KPROBES
 
-#include <asm-generic/kprobes.h>
 #include <linux/types.h>
 #include <linux/ptrace.h>
 #include <linux/notifier.h>
-- 
2.39.2


