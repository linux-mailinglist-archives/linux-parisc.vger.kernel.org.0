Return-Path: <linux-parisc+bounces-4149-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26027B9DDE9
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Sep 2025 09:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26B4617A737
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Sep 2025 07:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335E82512FF;
	Thu, 25 Sep 2025 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KEyXJhzq"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BDC2E9EAE
	for <linux-parisc@vger.kernel.org>; Thu, 25 Sep 2025 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758785813; cv=none; b=ecUkfTC/52ezBf8qRCoLXYT5yYNYLsQdsH1MrR8NyqfTf2tHewot8ex6g8q2kehix/3L6IWEo0t27XzP7mLfT1rI7Z98952XvaQGlQK9/KdkETezrL2SwBPYarwS0KdA9demHUtESfNoS4HhQaqO/hG8DzuY4xKoZs/Fbx8PLtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758785813; c=relaxed/simple;
	bh=KyhoKHqp0G/+8CJx/lsSlezjV3fmH9xGWx9gJKIn7Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWPOlCW5JRe0J70T51956U11fw14NaiKE3NNeFdKHQVAXkg7bOdseA3jNNAnTj1D85Q255dZykrPrx3grrxpclyrDIvBXKvNAE5LZY8osPt0RoSKPhHlFnsCpbplk54OEZYUpkgEbNZk15KbXatbzF7J8naUCR33uKhQHYvuMJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KEyXJhzq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758785810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V4NmZHUoJps7Yrk11w5SBou2tcMbfSFRbEHR6+6/r24=;
	b=KEyXJhzq1KT/jbLSlgFqSXOHEzG5ulsKj9G8zJcXwF1AF3SW8KdkBiyxqSeWLpnUCWglzk
	ZDmGPWo5/EVVYfT8wipboKq4fcpIhwTz8bKSj3eRQvxpbDRG+K2v9erzUqAhAAsjoQOeaq
	jHYiSKAgBP4vBb61f89Eq4HCUfu2Z84=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-wJVIBUB-NViyUXP5JX6x0A-1; Thu, 25 Sep 2025 03:36:43 -0400
X-MC-Unique: wJVIBUB-NViyUXP5JX6x0A-1
X-Mimecast-MFC-AGG-ID: wJVIBUB-NViyUXP5JX6x0A_1758785802
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46cde0b2226so1455255e9.2
        for <linux-parisc@vger.kernel.org>; Thu, 25 Sep 2025 00:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758785802; x=1759390602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4NmZHUoJps7Yrk11w5SBou2tcMbfSFRbEHR6+6/r24=;
        b=YdBuBp+7vm21QzxDO5VF3+TA0x4TZPVgI0TW1gy0WtrbD738dbN3PDrTAWERGDNAvA
         XvnOE9d4mHsBgdUXTGyfzARxKZAi4Zu9TAb3RJB41OzeZBl/vvEXg4JLKwtQGEBXUWCi
         KPEVEhgf8WGsi6zotBP8ngXc3x2iNpv4OW5d4HsBXpJXXQPrO96yFcDV2BDPNNpQgy0w
         lBsyuueIcv+/Bgof+11sY05+Y7W6XL0SG1mCiWN13lDUCG4FX82Z1E0EI+LlPaxaYB9R
         GV1F15cRRmgQhVusH/iHDTQlArh+mKMQMm34UQXGeKb8jI/x6gEkekyIcRC2DGbp/w3C
         yibA==
X-Forwarded-Encrypted: i=1; AJvYcCXrKKvF/pNbMRKbRhVS14fEwIYYjpXN85I+ciKp9Y71yNRIHmH0anPYAYR1qkLs5KFNikO6NZMU9ReZNnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu66p90j//552f0RzxeI8KBgW5UAzOArHcxzJ0V40J8fU34beL
	TVhYonuG52T9+m7GkE8OEC4w56B/sDPNIhFqPPpnTVNLmbzjT1IxCt8V2w85/yO6PvrlUQ30uci
	TDfp3Uf/NSH67TIae+uwpuqA79eGsClFExjRU4Jdmso8IkjQO13M/D6eW2TFuodzTdg==
X-Gm-Gg: ASbGnctWXejEX84XvhdgtFnKHxc1XuqMVhjHzos9UVtDraScrCy+zhApS2yyNEmSS9B
	x0qZZ9km95AY7TjUjwen6e4RzSa4R7yQ0fbFqwJ3d8ChNruCuVNrxvxM4peIXw7tDmQiNWh8t1N
	Oag8TcEpKu5Hay34S+uz2bPL/gC3F/giqryxnSR7/ECV4pwqYpxM5Hbd5TpN5xIn1Mml2HnhJ4P
	ABwZdE3KFcUAelYKXbwa0aLYdfnR4RvT5cA27LtbVm+hVLCFtbcVKBIXgFAIWJRFrDpx3Spk9gS
	MdvUiGybVZhsgnMQmLfzyeXPeH6OkM1BkkWMyWXbSXl7B1x4P4g3VysymX21VOZZ59oWbP5wUFK
	x8qeZbQV6f739tA==
X-Received: by 2002:a05:600c:8010:b0:45c:b5eb:b0c6 with SMTP id 5b1f17b1804b1-46e329a805amr24229665e9.5.1758785801755;
        Thu, 25 Sep 2025 00:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHigtd7Rlw0EkwZsZ6TnPLHr+fIfHQKJS55XMc7sCab7310hvvOcbsSwYh9WPs1s1S/Xj6xjA==
X-Received: by 2002:a05:600c:8010:b0:45c:b5eb:b0c6 with SMTP id 5b1f17b1804b1-46e329a805amr24229265e9.5.1758785801231;
        Thu, 25 Sep 2025 00:36:41 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc560338csm1755120f8f.41.2025.09.25.00.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:36:40 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-um@lists.infradead.org,
	linux-openrisc@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] Documentation/features: Update feature lists for 6.17-rc7
Date: Thu, 25 Sep 2025 09:36:34 +0200
Message-ID: <20250925073634.112142-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

It seems that ./Documentation/features/scripts/features-refresh.sh was most
recently used in December 2022, with the latest kernel release v6.1-rc7 at
that time (see commit 7f2e60ff51ca ("Documentation/features: Update feature
lists for 6.1") to update the feature lists in this subdirectory. All
further changes to Documentation/features/ since then have probably been
done manually, without checking for changes in other architectures and
features, that missed to update this part of the documentation.

Running ./Documentation/features/scripts/features-refresh.sh now showed
seven changes of supported features in various architectures (one in arc,
two in parisc, one in riscv, one in openrisc, and two in um), which were
not reflected yet in the current documentation.

To confirm the sanity of this script's suggested changes, I checked if the
commit messages confirm that the features have in fact been added in the
following commits:

  - commit f122668ddcce ("ARC: Add eBPF JIT support")
  - commit 4800a6215e33 ("parisc: Wire up eBPF JIT compiler")
  - commit a869b8c29f86 ("riscv: enable mseal sysmap for RV64")
  - commit 2f681ba4b352 ("um: move thread info into task")
  - commit 3f17fed21491 ("um: switch to regset API and depend on XSTATE")
  - commit 7ce8716e2769 ("openrisc: Add HAVE_REGS_AND_STACK_ACCESS_API support")
  - commit b5ff52be8913 ("parisc: Convert to generic clockevents")

So, update all documents to the current state with features-refresh.sh.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 Documentation/features/core/eBPF-JIT/arch-support.txt         | 4 ++--
 .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
 .../features/core/thread-info-in-task/arch-support.txt        | 2 +-
 Documentation/features/core/tracehook/arch-support.txt        | 2 +-
 Documentation/features/perf/kprobes-event/arch-support.txt    | 2 +-
 Documentation/features/time/clockevents/arch-support.txt      | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/features/core/eBPF-JIT/arch-support.txt b/Documentation/features/core/eBPF-JIT/arch-support.txt
index 7434b43c2ff8..83f77f55fc87 100644
--- a/Documentation/features/core/eBPF-JIT/arch-support.txt
+++ b/Documentation/features/core/eBPF-JIT/arch-support.txt
@@ -7,7 +7,7 @@
     |         arch |status|
     -----------------------
     |       alpha: | TODO |
-    |         arc: | TODO |
+    |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |        csky: | TODO |
@@ -18,7 +18,7 @@
     |        mips: |  ok  |
     |       nios2: | TODO |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: |  ok  |
     |        s390: |  ok  |
diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
index a3c24233eb9b..fa85381acc43 100644
--- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
+++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
@@ -20,7 +20,7 @@
     |    openrisc: |  N/A |
     |      parisc: | TODO |
     |     powerpc: | TODO |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  N/A |
     |       sparc: | TODO |
diff --git a/Documentation/features/core/thread-info-in-task/arch-support.txt b/Documentation/features/core/thread-info-in-task/arch-support.txt
index 2afeb6bf6e64..f3d744c76061 100644
--- a/Documentation/features/core/thread-info-in-task/arch-support.txt
+++ b/Documentation/features/core/thread-info-in-task/arch-support.txt
@@ -24,7 +24,7 @@
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
-    |          um: | TODO |
+    |          um: |  ok  |
     |         x86: |  ok  |
     |      xtensa: | TODO |
     -----------------------
diff --git a/Documentation/features/core/tracehook/arch-support.txt b/Documentation/features/core/tracehook/arch-support.txt
index a72330e25542..4f36fcbfb6d5 100644
--- a/Documentation/features/core/tracehook/arch-support.txt
+++ b/Documentation/features/core/tracehook/arch-support.txt
@@ -24,7 +24,7 @@
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |
-    |          um: | TODO |
+    |          um: |  ok  |
     |         x86: |  ok  |
     |      xtensa: |  ok  |
     -----------------------
diff --git a/Documentation/features/perf/kprobes-event/arch-support.txt b/Documentation/features/perf/kprobes-event/arch-support.txt
index 713a69fcd697..75c05d348c01 100644
--- a/Documentation/features/perf/kprobes-event/arch-support.txt
+++ b/Documentation/features/perf/kprobes-event/arch-support.txt
@@ -17,7 +17,7 @@
     |  microblaze: | TODO |
     |        mips: |  ok  |
     |       nios2: | TODO |
-    |    openrisc: | TODO |
+    |    openrisc: |  ok  |
     |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: |  ok  |
diff --git a/Documentation/features/time/clockevents/arch-support.txt b/Documentation/features/time/clockevents/arch-support.txt
index 4d4bfac52970..d6100b226de5 100644
--- a/Documentation/features/time/clockevents/arch-support.txt
+++ b/Documentation/features/time/clockevents/arch-support.txt
@@ -18,7 +18,7 @@
     |        mips: |  ok  |
     |       nios2: |  ok  |
     |    openrisc: |  ok  |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: |  ok  |
     |        s390: |  ok  |
-- 
2.51.0


