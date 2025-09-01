Return-Path: <linux-parisc+bounces-3880-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B5B3DE0B
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 11:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF5767A85BE
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 09:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3027B3112C6;
	Mon,  1 Sep 2025 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="DXEQX+bY"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB69F30F7F8
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718380; cv=none; b=se4MPInqw2QWlMs31pYFDmry9P13mNSLnpHaMCOP7OmTPvBZMod0Z+OU2LYfBo+u+y7/JGM5Alv2DaYkM7GwDj7M1GAKBK7ieF1Dtk6W8+SBJNYdtpE6iA7+kaGaP4eJ8ZS+dNKBkKC7SQIlXBnT9pWiiXmNj0HalHeVwYtCta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718380; c=relaxed/simple;
	bh=XjuAxYKBI3IkXJfvQ3kH8dgkzun3QXNzWiHOIferAsU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnZAcquRx1xAGyfxsrQqLorj0gO4fs9rCNnk7BYx6iJmYXsOYu318bw94gvvfQCDpGrf6cr63hEZElIqR3rIly1Kkxo2T2HeBq639LKoOeEu1Og8HyY6KE4ofiCGbbiCvSP15O+cqQLw7J1PcNV+KO9znYqLDJJrxG9LX8EO878=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=DXEQX+bY; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b042cc3954fso116376666b.0
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 02:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756718377; x=1757323177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3Upj2m2g1j8fphq8NY5txcaBLQgQOVfeQ4k3TdopfU=;
        b=DXEQX+bYXq70Y1f5UkdcIks7JtRa0eSzATZtvDlSFczs0bR/6gCc+iha9hYpBv0ou/
         DXtUscRboTKPE3UCnkjZVHlVGx5L+U4UIzZf5jdPFRBcRgNYr96+JFDtcG1L1+1msW3f
         GfbRMvobUrjslmll54nCCGegclrrk7XCDPRf4fQ1Fpj7glinQMqK9ML8YPwwvBJ27XIN
         6FVMPrptovnDEZaNGEubw1typaLX9/REsDD3L8Ygwwb2YgVjfz/wz/K1fhIRGk9K0iRH
         eRnK1iz4C7sEhvPt68/W1yPZ0Q5SCQ14h3GbbTsbXPX8BkT+V0Lqe1FNMh/UgEgDtaCa
         HbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756718377; x=1757323177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3Upj2m2g1j8fphq8NY5txcaBLQgQOVfeQ4k3TdopfU=;
        b=Pw3smHHLnBbhTR5wED9OnEFn+kVcUvhfh5EuFX5eUo6sKNGzm8Xp3SWsfGwPcoT9GT
         zx2lK/hUjb6V/LVnKGfaRB1NFmz1eep0VsPGgSM9VNiO3sU5OoIW17CTcMeBC9+GVi7Z
         ErTglpyt6X1owh3+ImhMgAUQ9LZPlRGLk/32T3Lh3YIgnyK+jhkOGqahDM4ENRk6orHN
         jo07G373AttYWNhZsRXNxWTNRf2Sth+z6HanNYp06uqjhaSVbQ7MkRnuBJLQQ6gkbNSU
         F04ZCv5xPN0DC19nDtKBE+XGbm21bYdgUxsoaXUlq0/e2imoKANuaGx/duFeDgUitsyU
         188Q==
X-Forwarded-Encrypted: i=1; AJvYcCUI8R+17kf71IvbTxErZ79crh3DUWxtneO/Q0/0YUctG38j5ZvSn3JwEbUslZljozJymwPF03+Fa0UmmOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeaV7f4r71e9cY4RNQFj0Y/uM+njUEXLy5BAznc6dX0KSZI35Z
	1g7yVSDsui4pWa3QfEJrj1MHMhqAqNzPXrD+/LEt11+jmCgLxZ3AfIeMVqJ4W+sWmuA=
X-Gm-Gg: ASbGncvMBl0aZ+qbM3LS5CwNetKp7vO5fWprLB6PcTaKeJImqr4Lk9myn5lfy1z/wRr
	9wQKPFx3QSfc3fzAnT/zrT7YQOXZ6TmDOpA0Zql9byamuJ3azV4jxFdxpMr8aGDwcJeywPASW+C
	cx8nWOx+Vm/PrloRQf0HqdJ5EMhTzWBl5z9p4UunWsr9Onop1NM0AqCbxx0iB3pN5UGncrlqWfz
	zlroktQ06ZJnikk/SoCMlAxdJXP1JKQWLxHftAdrygSxT5QV8opMtXcVXLc9QqcmYAYcnr8tVQv
	QE2b8nSzm9ljoXVNS8CszSt4UYXjZfedMpGNmlbNfoph33nIqfBhUk127S9NZyMznbeXoppPzLJ
	RU2HPBFaUyf50yLeM/yxFgVPLTSsXgAKG3TEzQ42Io0Y1dzeqfeWbm3rsnZ+4PDjNWx13tXw/Xl
	BTVx+6hEs92UJtF2RmigdsTIp9sf6kqPGh
X-Google-Smtp-Source: AGHT+IHU03tJneIRXPXjJBcv8U2Bz02uUMfdpAyBKwgR6+o6K1xVYVpx/SIyHdw8wkNyrhH8/CTQOg==
X-Received: by 2002:a17:906:9f8e:b0:afe:c6a0:d116 with SMTP id a640c23a62f3a-b01d8a6b6ffmr681548166b.18.1756718376821;
        Mon, 01 Sep 2025 02:19:36 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f1d0f00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1d:f00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm541005766b.12.2025.09.01.02.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:19:36 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	axelrasmussen@google.com,
	yuanchu@google.com,
	willy@infradead.org,
	hughd@google.com,
	mhocko@suse.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	vishal.moola@gmail.com,
	linux@armlinux.org.uk,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	weixugc@google.com,
	baolin.wang@linux.alibaba.com,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	max.kellermann@ionos.com,
	thuth@redhat.com,
	broonie@kernel.org,
	osalvador@suse.de,
	jfalempe@redhat.com,
	mpe@ellerman.id.au,
	nysal@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v4 07/12] parisc: add `const` to mmap_upper_limit() parameter
Date: Mon,  1 Sep 2025 11:19:10 +0200
Message-ID: <20250901091916.3002082-8-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901091916.3002082-1-max.kellermann@ionos.com>
References: <20250901091916.3002082-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory management (mm) subsystem is a fundamental low-level component
of the Linux kernel. Establishing const-correctness at this foundational
level enables higher-level subsystems, such as filesystems and drivers,
to also adopt const-correctness in their interfaces. This patch lays
the groundwork for broader const-correctness throughout the kernel
by starting with the core mm subsystem.

This patch adds const qualifier to the rlimit pointer parameter in
parisc's mmap_upper_limit() function that does not modify the referenced
memory, improving type safety and enabling compiler optimizations.

Functions improved:
- mmap_upper_limit()

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/parisc/include/asm/processor.h | 2 +-
 arch/parisc/kernel/sys_parisc.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 4c14bde39aac..dd0b5e199559 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -48,7 +48,7 @@
 #ifndef __ASSEMBLER__
 
 struct rlimit;
-unsigned long mmap_upper_limit(struct rlimit *rlim_stack);
+unsigned long mmap_upper_limit(const struct rlimit *rlim_stack);
 unsigned long calc_max_stack_size(unsigned long stack_max);
 
 /*
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index f852fe274abe..c2bbaef7e6b7 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -77,7 +77,7 @@ unsigned long calc_max_stack_size(unsigned long stack_max)
  * indicating that "current" should be used instead of a passed-in
  * value from the exec bprm as done with arch_pick_mmap_layout().
  */
-unsigned long mmap_upper_limit(struct rlimit *rlim_stack)
+unsigned long mmap_upper_limit(const struct rlimit *const rlim_stack)
 {
 	unsigned long stack_base;
 
-- 
2.47.2


