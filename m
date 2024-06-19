Return-Path: <linux-parisc+bounces-1592-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892E590F626
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Jun 2024 20:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BDB01C22DF3
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Jun 2024 18:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C2F15748B;
	Wed, 19 Jun 2024 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOro2vEn"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BA01848
	for <linux-parisc@vger.kernel.org>; Wed, 19 Jun 2024 18:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718822219; cv=none; b=LzEX3zbIqdLXwvp2tfQoKNLCFNATQx+P+SW3BM4o6ZgYrGZseggOF/wbvwz3oYYMbAbLDstLYlkW3zLHPW9U1OFjPfb9IJSLtbBQkGW8gFKBhg1uBr0i5TN/wktHrbj+CCuV3imUHdHJmPmTpWlkK70sD5cOrzyffDekeHMNqLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718822219; c=relaxed/simple;
	bh=n8i4X26S+B3dDSJXqlazgUhMmhZqMxQCAiiFwyQeqGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kPp+inCAbl23RNa8PfuQjvwxfafG1ii35AH0mk9D9301JEXEXMVrRMgExwq02sgUUl/hzAwsPg/UURO0w5c+ggaxTcoJkJIyxJLweuhzYAl3DZ0CKPt6G+r2uWCgX0AJ8G4ANhHWZg6uln6D80U6XiZrAUuj4zu6KUieKBXBvF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOro2vEn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC2AC2BBFC;
	Wed, 19 Jun 2024 18:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718822218;
	bh=n8i4X26S+B3dDSJXqlazgUhMmhZqMxQCAiiFwyQeqGo=;
	h=Date:From:To:Cc:Subject:From;
	b=YOro2vEnmFMTVQayC5+11WgqWVCFrr/T1luyiVkXO2sF2e3SL8vA3zU/YAbnnW2dw
	 Jrmrj3gsszHxbxG5ClUHCjfyulz1hLtgRbGWZZUbltlMZPLd8tB7BStmxgm9Dx74yb
	 PEhZfa+m95FyZYt+fbmP+6jwB6Py0KeKnhbT3r/DTzr9YI6h0imJKCI0tjlgxEWH5j
	 2Fs3DnwNfmsEKrve3s6UuEicl6KRZnsAZ1IiNLI9J2h85FPmQekFmhtQm+E83HaIro
	 LHnjjicZUxNQ+CASeoFOTL2GvXEaa3PsrwPVma/cuvb9AGFGc8K2LSsThy86WPtO2q
	 T/BDfxabsKheA==
Date: Wed, 19 Jun 2024 20:36:54 +0200
From: Helge Deller <deller@kernel.org>
To: libc-alpha@sourceware.org, John David Anglin <dave.anglin@bell.net>,
	carlos@redhat.com
Cc: linux-parisc@vger.kernel.org
Subject: [PATCH] hppa/vdso: Add wrappers for vDSO functions
Message-ID: <ZnMlRrsmHzrEkpYL@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The upcoming parisc (hppa) Linux kernel v6.11 will include basic vDSO
support for gettimeofday(), clock_gettime() and clock_gettime64()
syscalls for 32-bit userspace.
The patch below adds the necessary glue code for glibc.

Signed-off-by: Helge Deller <deller@gmx.de>


diff -up ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org ./sysdeps/unix/sysv/linux/hppa/sysdep.h
--- ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org	2024-06-15 20:20:58.992000000 +0000
+++ ./sysdeps/unix/sysv/linux/hppa/sysdep.h	2024-06-19 18:26:08.324000000 +0000
@@ -468,6 +468,16 @@ L(pre_end):					ASM_LINE_SEP	\
 #define CLOB_ARGS_1 CLOB_ARGS_2, "%r25"
 #define CLOB_ARGS_0 CLOB_ARGS_1, "%r26"
 
+#ifndef __LP64__
+# define VDSO_NAME	"LINUX_6.11"
+# define VDSO_HASH	182951793
+
+/* List of system calls which are supported as vsyscalls.  */
+# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
+# define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
+# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
+#endif /* __LP64__ */
+
 #endif	/* __ASSEMBLER__ */
 
 #endif /* _LINUX_HPPA_SYSDEP_H */

