Return-Path: <linux-parisc+bounces-1629-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC873912DD7
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Jun 2024 21:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BC241F229CF
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Jun 2024 19:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339B117B40B;
	Fri, 21 Jun 2024 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAMKk4rq"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E083179949
	for <linux-parisc@vger.kernel.org>; Fri, 21 Jun 2024 19:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718998011; cv=none; b=u8w94ppMG/jaDZ2ICfDjgU2jdACZ+I/airbLHaWpIVapdBUoIn0T+GKGA55rRxjhlvkzXmHME51Qg9Eg5Pkrwq/sBdeHxyR1XW1qlTOLoejzis4/Nr8eJS3M5gbXIMPdURjg9xDcklqyTGDnNwZAIWkWgsRGLI+ozzYdgXVbsLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718998011; c=relaxed/simple;
	bh=ZhnlL38L55WYXqjIVFjxbTLQ3LNiflOEz64b8JZQ8fk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTnfA344pUsgCRwZgtV283iedqKoekiV/FuUaI3WaJI7Q9BNMYzRscynm1wp3rQIGoX99SBJO8Novu+mr9yvH2e7PDxejeVmHqzmld6PgMS/y/LlVGfXvB73ANWsOx7YDIGUv/dkpF18twvp6q3sevudC4PbmYmJuznFZ1L1m+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAMKk4rq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFC5C2BBFC;
	Fri, 21 Jun 2024 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718998010;
	bh=ZhnlL38L55WYXqjIVFjxbTLQ3LNiflOEz64b8JZQ8fk=;
	h=Date:From:To:Subject:From;
	b=vAMKk4rqF1zb0/fahpaDRvM/1WejHSFLD/8p25lL7TFSd6kOmuCuYoua2fv0Qy6bu
	 W3ppuMfT+1uqx3ijV9VNP8+IUPEjGWwtNRF2Ck+E67cJCQxMnzdzMgoKE4xHOdvlwt
	 tt6ckoXkqIlOvunqbwGoYz+2BLOgC5CoQF5sm97AOtKIMTbUpBC6lIi1/YfDUhVaoD
	 16S+2pjwTTAvaUwznFx4CiWyRqGPlkpqo+vuEeB/ezfhSHMQs/6sGva8Bw5iaOrtp9
	 3z7Ud4GaVfqQ9mKO2pHzFHqV6Pb9aLFybinY1mW4Di98xVs0AwIwVt5s13F3B/uYlu
	 a2Wsv8vor+rSg==
Date: Fri, 21 Jun 2024 21:26:46 +0200
From: Helge Deller <deller@kernel.org>
To: libc-alpha@sourceware.org, John David Anglin <dave.anglin@bell.net>,
	carlos@redhat.com, linux-parisc@vger.kernel.org
Subject: [PATCH v2] hppa/vdso: Add wrappers for vDSO functions
Message-ID: <ZnXT9hNtYWLg9MID@carbonx1>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The upcoming parisc (hppa) v6.11 Linux kernel will include vDSO
support for gettimeofday(), clock_gettime() and clock_gettime64()
syscalls for 32- and 64-bit userspace.
The patch below adds the necessary glue code for glibc.

Signed-off-by: Helge Deller <deller@gmx.de>

Changes in v2:
- add vsyscalls for 64-bit too
 
diff -up ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org ./sysdeps/unix/sysv/linux/hppa/sysdep.h
--- ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org	2024-06-15 20:20:58.992000000 +0000
+++ ./sysdeps/unix/sysv/linux/hppa/sysdep.h	2024-06-21 19:19:02.132000000 +0000
@@ -468,6 +468,18 @@ L(pre_end):					ASM_LINE_SEP	\
 #define CLOB_ARGS_1 CLOB_ARGS_2, "%r25"
 #define CLOB_ARGS_0 CLOB_ARGS_1, "%r26"
 
+#define VDSO_NAME	"LINUX_6.11"
+#define VDSO_HASH	182951793
+
+#ifdef __LP64__
+# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
+# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
+#else
+# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
+# define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
+# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
+#endif /* __LP64__ */
+
 #endif	/* __ASSEMBLER__ */
 
 #endif /* _LINUX_HPPA_SYSDEP_H */

