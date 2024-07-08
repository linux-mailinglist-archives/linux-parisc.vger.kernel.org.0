Return-Path: <linux-parisc+bounces-1773-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AD2929A76
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Jul 2024 03:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF43F28107A
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Jul 2024 01:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B10B816;
	Mon,  8 Jul 2024 01:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8Fr7rq7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CEB812
	for <linux-parisc@vger.kernel.org>; Mon,  8 Jul 2024 01:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720401030; cv=none; b=fTnYDBtCci8NGlH6/QoZzvuMY3BdqR6t3hKo6MIpJqZ9WhGrybN6FPforDXccGeoPriHjBAxdJJel0Hbh9o8ki1u5lLsMyVFo9w8Oc4tG1OPpCiyjBRw4zVvB322DgZnq+pVn2BqH0TjV71zKjpuV9itd2zUc7K5EVDAb+QNsM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720401030; c=relaxed/simple;
	bh=yVcIRsdTQoqOQqMflHSWTdjt59qVq2V2sIdDSeiGZmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YvtuLXL/+wiue08K1GS+VbhxbIz1OU73Ui4kJ/VpryT+6zAhhihw38p9ADzSBUS1VPeLzMT75FkaL6p16G4sQCRKX3+SFhEirsgMlhM3xdo1AXZ4/2UMqQyGRWLOrSjgezbalDNeUMWAcjJmwfzwF7yv4D77RGzx12tlVjkRhVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8Fr7rq7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2F2C3277B;
	Mon,  8 Jul 2024 01:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720401029;
	bh=yVcIRsdTQoqOQqMflHSWTdjt59qVq2V2sIdDSeiGZmI=;
	h=Date:From:To:Cc:Subject:From;
	b=V8Fr7rq7rnRde7KVLn64CkMcCkBa8RetMeL73jLWkYeKhD6CzLgp8C+JW2Myr3dVj
	 FY0737eb9JQmIdD6sZLg1n8kR/5lgyzJqtgdXNh+zWwa7NTmZuiJ7md1Fkna3RFY3V
	 coyL74qFDMDzxSpzG0GUMk87vLCBVeEWCglwz6l5c9D/Lj8o3V3WuI/Ca4mFriQbZw
	 30tdZbH6V/7Pc4YOHfRE3X8CngXQzO/Wb2HwnrIaKn/rm9noUAywKfAakK0d8fYh3h
	 yARENDIGXF26vd+Ac31n1B1mnh3/6afaRtnLh8l74bNMT3vA5pV+5DVPuEF9/RwFZQ
	 XbnBdoo2zUM0g==
Date: Mon, 8 Jul 2024 03:10:25 +0200
From: Helge Deller <deller@kernel.org>
To: libc-alpha@sourceware.org, John David Anglin <dave.anglin@bell.net>
Cc: linux-parisc@vger.kernel.org
Subject: [PATCH] hppa: Wire up cacheflush syscall
Message-ID: <Zos8gVaGUcuaaNaI@carbonx1>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The hppa Linux kernel supports the cacheflush() syscall
since version 6.5. This adds the glibc syscall wrapper.

Signed-off-by: Helge Deller <deller@gmx.de>

---

diff --git a/sysdeps/unix/sysv/linux/hppa/Makefile b/sysdeps/unix/sysv/linux/hppa/Makefile
index 2e031e2f8a..9eebe8e0e7 100644
--- a/sysdeps/unix/sysv/linux/hppa/Makefile
+++ b/sysdeps/unix/sysv/linux/hppa/Makefile
@@ -15,6 +15,11 @@ test-xfail-check-wx-segment = *
 
 endif # $(subdir) == elf
 
+ifeq ($(subdir),misc)
+sysdep_routines += cacheflush
+sysdep_headers += sys/cachectl.h
+endif
+
 ifeq ($(subdir),debug)
 test-xfail-tst-ssp-1 = $(have-ssp)
 endif # $(subdir) == debug
diff --git a/sysdeps/unix/sysv/linux/hppa/Versions b/sysdeps/unix/sysv/linux/hppa/Versions
index 78528e5fa2..f7ac20ab7e 100644
--- a/sysdeps/unix/sysv/linux/hppa/Versions
+++ b/sysdeps/unix/sysv/linux/hppa/Versions
@@ -23,4 +23,7 @@ libc {
   GLIBC_2.19 {
     fanotify_mark;
   }
+  GLIBC_2.40 {
+    cacheflush;
+  }
 }
diff --git a/sysdeps/unix/sysv/linux/hppa/libc.abilist b/sysdeps/unix/sysv/linux/hppa/libc.abilist
index fbcd60c2b3..965b946ab0 100644
--- a/sysdeps/unix/sysv/linux/hppa/libc.abilist
+++ b/sysdeps/unix/sysv/linux/hppa/libc.abilist
@@ -2821,6 +2821,7 @@ GLIBC_2.4 sys_errlist D 0x400
 GLIBC_2.4 sys_nerr D 0x4
 GLIBC_2.4 unlinkat F
 GLIBC_2.4 unshare F
+GLIBC_2.40 cacheflush F
 GLIBC_2.5 __readlinkat_chk F
 GLIBC_2.5 inet6_opt_append F
 GLIBC_2.5 inet6_opt_find F
diff --git a/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h b/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h
new file mode 100644
index 0000000000..16e47d1329
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h
@@ -0,0 +1,36 @@
+/* HPPA cache flushing interface.
+   Copyright (C) 2018-2024 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#ifndef _SYS_CACHECTL_H
+#define _SYS_CACHECTL_H 1
+
+#include <features.h>
+
+/* Get the kernel definition for the op bits.  */
+#include <asm/cachectl.h>
+
+__BEGIN_DECLS
+
+#ifdef __USE_MISC
+extern int cacheflush (void *__addr, const int __nbytes,
+		       const int __op) __THROW;
+#endif
+
+__END_DECLS
+
+#endif /* sys/cachectl.h */
diff --git a/sysdeps/unix/sysv/linux/hppa/syscalls.list b/sysdeps/unix/sysv/linux/hppa/syscalls.list
index 12e4adeccc..b3020114d6 100644
--- a/sysdeps/unix/sysv/linux/hppa/syscalls.list
+++ b/sysdeps/unix/sysv/linux/hppa/syscalls.list
@@ -8,5 +8,6 @@ listen		-	listen		i:ii	__listen	listen
 shutdown	-	shutdown	i:ii	__shutdown	shutdown
 socket		-	socket		i:iii	__socket	socket
 socketpair	-	socketpair	i:iiif	__socketpair	socketpair
+cacheflush	-	cacheflush	i:pii	_flush_cache	cacheflush
 
 personality	EXTRA	personality	Ei:i	__personality	personality

