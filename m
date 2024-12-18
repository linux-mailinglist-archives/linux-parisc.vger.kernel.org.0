Return-Path: <linux-parisc+bounces-3063-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F049F70BF
	for <lists+linux-parisc@lfdr.de>; Thu, 19 Dec 2024 00:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 916887A3FD6
	for <lists+linux-parisc@lfdr.de>; Wed, 18 Dec 2024 23:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE671FCFD8;
	Wed, 18 Dec 2024 23:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKiuS8yl"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8705C1991B8
	for <linux-parisc@vger.kernel.org>; Wed, 18 Dec 2024 23:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564372; cv=none; b=E/P5Cs6CYwtkcspD14X/oEuxDKYzGPgzRJ4ZgLEmd32J/OAYfzFa9JbnnteUIJYj94L/eEbBBh4iJA3Eh31qzlKzP6bwTGJ28UhqzZSBA/TBEq3huQgZDm4/cfp2bjuhT3wFkd7rhc2bvHb+Kr+UbFenEozYaOjtp73FtxOXIno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564372; c=relaxed/simple;
	bh=gmHKb+ysBgOen3S1SaYoWzEoCpbcqxaWst0I1KwE2nU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mra7ktQCdrtLK5y8p+vpXefpu5W+r9F70Ie1Hg4dVmRM33SwdLO1a3+dG6wW/u5sXUdYKkJXt5vmIbunozA4O9PIFJvMp7Cds8pelDO90VcAj7NypEkcJznhDMELEkwcmno7Omq5gXDT2Hqb6rAKM80uXwclJF3Q/C7V9RAwXV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKiuS8yl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17675C4CECD;
	Wed, 18 Dec 2024 23:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734564372;
	bh=gmHKb+ysBgOen3S1SaYoWzEoCpbcqxaWst0I1KwE2nU=;
	h=Date:From:To:Cc:Subject:From;
	b=sKiuS8yltBt95/e5gPOkWXuSTJb6bRHwUXoCueigI+0wcTIS4wLjpQF1pP2W+0ga4
	 b0pn0diIvbC1HseiAj/4Y5uJWGnNIWLrmGrIhYYtMcyttTaFeKdDkJZyqkD/qIRlti
	 DZcY6vpo4AmLFKzyQ/PAxCY/kJQhJ+WUNEfkE/kspeCxY5LZiNM3zfXoFRcSJM1CnR
	 9Et/j91NMZ8xWmsUXuv1z/EMr2QaS+aaeAlUX0BwbcEHwUhRPXod7GSFDMFLPg+G4P
	 sao5H/ERhfFZdeQJDkVX0umF2jnhiCqoV/aDwhgsPYt8nCAvcYs86ziqUu4mHk0z8r
	 ycMRcKgouzZeg==
Date: Thu, 19 Dec 2024 00:26:08 +0100
From: Helge Deller <deller@kernel.org>
To: libc-alpha@sourceware.org, John David Anglin <dave.anglin@bell.net>
Cc: linux-parisc@vger.kernel.org
Subject: [PATCH v2] hppa: Wire up cacheflush syscall
Message-ID: <Z2NaED_0wNDlLIwZ@p100>
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
v2: This patch was too late in release cycle for GLIBC_2.40,
    so Update now to GLIBC_2.41 instead.


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
index 78528e5fa2..1f83840d2f 100644
--- a/sysdeps/unix/sysv/linux/hppa/Versions
+++ b/sysdeps/unix/sysv/linux/hppa/Versions
@@ -23,4 +23,7 @@ libc {
   GLIBC_2.19 {
     fanotify_mark;
   }
+  GLIBC_2.41 {
+    cacheflush;
+  }
 }
diff --git a/sysdeps/unix/sysv/linux/hppa/libc.abilist b/sysdeps/unix/sysv/linux/hppa/libc.abilist
index 8de7644a59..306b90c8b5 100644
--- a/sysdeps/unix/sysv/linux/hppa/libc.abilist
+++ b/sysdeps/unix/sysv/linux/hppa/libc.abilist
@@ -2823,6 +2823,7 @@ GLIBC_2.4 unlinkat F
 GLIBC_2.4 unshare F
 GLIBC_2.41 sched_getattr F
 GLIBC_2.41 sched_setattr F
+GLIBC_2.41 cacheflush F
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

