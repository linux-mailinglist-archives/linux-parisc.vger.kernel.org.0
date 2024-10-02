Return-Path: <linux-parisc+bounces-2432-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B198CB4F
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 04:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A8E282F91
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 02:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A9D28F4;
	Wed,  2 Oct 2024 02:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzyWsLTu"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6211228EB
	for <linux-parisc@vger.kernel.org>; Wed,  2 Oct 2024 02:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727836634; cv=none; b=HQ9ta9VcPaDX7d8euuuKsHw8zbkYpyq/QUSfp+HMAyUPT9wh7jlHAQrmOj7tAhnXHmh4b8I+bLDZ3uiujZujORdNaA2JKL9Ynu87p979l1dkBbZQsnDJHBg5i1OdXmN/Df+UvRZYDe0lX6Sdva9hVX2qjrJpRohZCVikBqJWVEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727836634; c=relaxed/simple;
	bh=y4WQQgNX9iQxJSHq7SBJ345D+/87gDCmZbgc8BcvMjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gu/OfYhMgQKbIrQ9slvZ+2yAO4wxF4UCuF1SqmQnoavUXSV5BK33XbfJPyzBJqUlrfFW4yGtwNBQvgqoQiA4OH4buKIDglky+deYWarhpXY9XCdcah3q3ZNNhoGTcMzYyNryBdU0AvdX25RvAXtFzrhAdpkkQxnksPnQynS+HmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzyWsLTu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58FBC4CEC6;
	Wed,  2 Oct 2024 02:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727836633;
	bh=y4WQQgNX9iQxJSHq7SBJ345D+/87gDCmZbgc8BcvMjk=;
	h=Date:From:To:Cc:Subject:From;
	b=DzyWsLTu1ALWQFWdl/qscQvGtzk8TW0QZ+7zZBfC01n7HxnjANw7lYaVJNoTf53WW
	 p3foB+D10bI6ljQPes+U+FKKRebn182FnJIlSMETaEyPnc350gVyBQ1Z6254VoovGD
	 BWknX7aYycmD6gWpxgsSQxa6oMoFJhPqAtfhOo7lHnNe5qS6tG/l10ypdGz3gueISM
	 VE6GfdFnzAIdaqDSJqFCWp/6PEf+X6ivHR34+Kg8Bw2LC6omCw6r8rD+74s0d6J5z7
	 JhGkJs4e9+ZG+vct4ZTjJUZ85re6xxHOeQXH7ue1C0wGNG4D95OfUOCJ3Z7E+n73Tl
	 MWxvKLiMhG8bA==
Date: Wed, 2 Oct 2024 04:37:10 +0200
From: Helge Deller <deller@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: linux-parisc@vger.kernel.org
Subject: {PATCH] accel/tcg: Fix CPU specific unaligned behaviour
Message-ID: <Zvyx1kM4JljbzxQW@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When the emulated CPU reads or writes to a memory location
a) for which no read/write permissions exists, *and*
b) the access happens unaligned (non-natural alignment),
then the CPU should either
- trigger a permission fault, or
- trigger an unalign access fault.

In the current code the alignment check happens before the memory
permission checks, so only unalignment faults will be triggered.

This behaviour breaks the emulation of the PARISC architecture, where the CPU
does a memory verification first. The behaviour can be tested with the testcase
from the bugzilla report.

Add the necessary code to allow PARISC and possibly other architectures to
trigger a memory fault instead.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=219339


diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 117b516739..dd1da358fb 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1684,6 +1684,26 @@ static void mmu_watch_or_dirty(CPUState *cpu, MMULookupPageData *data,
     data->flags = flags;
 }
 
+/* when accessing unreadable memory unaligned, will the CPU issue
+ * a alignment trap or a memory access trap ? */
+#ifdef TARGET_HPPA
+# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  1
+#else
+# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  0
+#endif
+
+static void mmu_check_alignment(CPUState *cpu, vaddr addr,
+                       uintptr_t ra, MMUAccessType type, MMULookupLocals *l)
+{
+    unsigned a_bits;
+
+    /* Handle CPU specific unaligned behaviour */
+    a_bits = get_alignment_bits(l->memop);
+    if (addr & ((1 << a_bits) - 1)) {
+        cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
+    }
+}
+
 /**
  * mmu_lookup: translate page(s)
  * @cpu: generic cpu state
@@ -1699,7 +1719,6 @@ static void mmu_watch_or_dirty(CPUState *cpu, MMULookupPageData *data,
 static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
                        uintptr_t ra, MMUAccessType type, MMULookupLocals *l)
 {
-    unsigned a_bits;
     bool crosspage;
     int flags;
 
@@ -1708,10 +1727,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
 
     tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
 
-    /* Handle CPU specific unaligned behaviour */
-    a_bits = get_alignment_bits(l->memop);
-    if (addr & ((1 << a_bits) - 1)) {
-        cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
+    if (!CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK) {
+        mmu_check_alignment(cpu, addr, ra, type, l);
     }
 
     l->page[0].addr = addr;
@@ -1760,6 +1777,10 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
         tcg_debug_assert((flags & TLB_BSWAP) == 0);
     }
 
+    if (CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK) {
+        mmu_check_alignment(cpu, addr, ra, type, l);
+    }
+
     /*
      * This alignment check differs from the one above, in that this is
      * based on the atomicity of the operation. The intended use case is

