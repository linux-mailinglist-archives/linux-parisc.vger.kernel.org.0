Return-Path: <linux-parisc+bounces-65-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8567F76C2
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 15:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0482DB2135E
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 14:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5642D635;
	Fri, 24 Nov 2023 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWAVXFsy"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B3A2C87A
	for <linux-parisc@vger.kernel.org>; Fri, 24 Nov 2023 14:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D7BC433C9;
	Fri, 24 Nov 2023 14:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700837017;
	bh=fE+2vrrbwsXIZxY6U9hJE6L8qv3ZN509yo2AnlnuBjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OWAVXFsyyvVXO6vZtBw4My87Mbb7+mGnoICsGONPWd7j13EPGEhWQgG29iqxNLD4M
	 IHoB6Z87HIa7HcCuLxgvdU8pJLCAfKfO6Iga+E1dEsfjFfc0m1D0YMue1nKrt9ZhQF
	 ZwsKcjoQLVeLT4up4lFJ20Ex4OMS9xFyHWD7DsBqHfBln6RGthiY9N9jzwxHR+6WME
	 cMi0wopSCPhVQwyojXUodiUuTEp6exdUyy+cVp6eIZHjzHoJTb5gxfpGKa8GQ1dVDE
	 Y0hhKX46UWzbS68Gpw4pnIo6jl8Re8R2UEL837unMT1v3KNhQthORdKot8rK3H3yeH
	 pxyIwAdXgiqyA==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	Bruno Haible <bruno@clisp.org>
Subject: [PATCH 7/8] parisc: Drop the HP-UX ENOSYM and EREMOTERELEASE error codes
Date: Fri, 24 Nov 2023 15:41:12 +0100
Message-ID: <20231124144158.158993-15-deller@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231124144158.158993-1-deller@kernel.org>
References: <20231124144158.158993-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Those return codes are only defined for the parisc architecture and
are leftovers from when we wanted to be HP-UX compatible.

They are not returned by any Linux kernel syscall but do trigger
problems with the glibc strerrorname_np() and strerror() functions as
reported in glibc issue #31080.

There is no need to keep them, so simply remove them.

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: Bruno Haible <bruno@clisp.org>
Closes: https://sourceware.org/bugzilla/show_bug.cgi?id=31080
---
 arch/parisc/include/uapi/asm/errno.h       | 2 --
 lib/errname.c                              | 6 ------
 tools/arch/parisc/include/uapi/asm/errno.h | 2 --
 3 files changed, 10 deletions(-)

diff --git a/arch/parisc/include/uapi/asm/errno.h b/arch/parisc/include/uapi/asm/errno.h
index 87245c584784..8d94739d75c6 100644
--- a/arch/parisc/include/uapi/asm/errno.h
+++ b/arch/parisc/include/uapi/asm/errno.h
@@ -75,7 +75,6 @@
 
 /* We now return you to your regularly scheduled HPUX. */
 
-#define ENOSYM		215	/* symbol does not exist in executable */
 #define	ENOTSOCK	216	/* Socket operation on non-socket */
 #define	EDESTADDRREQ	217	/* Destination address required */
 #define	EMSGSIZE	218	/* Message too long */
@@ -101,7 +100,6 @@
 #define	ETIMEDOUT	238	/* Connection timed out */
 #define	ECONNREFUSED	239	/* Connection refused */
 #define	EREFUSED	ECONNREFUSED	/* for HP's NFS apparently */
-#define	EREMOTERELEASE	240	/* Remote peer released connection */
 #define	EHOSTDOWN	241	/* Host is down */
 #define	EHOSTUNREACH	242	/* No route to host */
 
diff --git a/lib/errname.c b/lib/errname.c
index dd1b998552cd..4f9112b38f3a 100644
--- a/lib/errname.c
+++ b/lib/errname.c
@@ -111,9 +111,6 @@ static const char *names_0[] = {
 	E(ENOSPC),
 	E(ENOSR),
 	E(ENOSTR),
-#ifdef ENOSYM
-	E(ENOSYM),
-#endif
 	E(ENOSYS),
 	E(ENOTBLK),
 	E(ENOTCONN),
@@ -144,9 +141,6 @@ static const char *names_0[] = {
 #endif
 	E(EREMOTE),
 	E(EREMOTEIO),
-#ifdef EREMOTERELEASE
-	E(EREMOTERELEASE),
-#endif
 	E(ERESTART),
 	E(ERFKILL),
 	E(EROFS),
diff --git a/tools/arch/parisc/include/uapi/asm/errno.h b/tools/arch/parisc/include/uapi/asm/errno.h
index 87245c584784..8d94739d75c6 100644
--- a/tools/arch/parisc/include/uapi/asm/errno.h
+++ b/tools/arch/parisc/include/uapi/asm/errno.h
@@ -75,7 +75,6 @@
 
 /* We now return you to your regularly scheduled HPUX. */
 
-#define ENOSYM		215	/* symbol does not exist in executable */
 #define	ENOTSOCK	216	/* Socket operation on non-socket */
 #define	EDESTADDRREQ	217	/* Destination address required */
 #define	EMSGSIZE	218	/* Message too long */
@@ -101,7 +100,6 @@
 #define	ETIMEDOUT	238	/* Connection timed out */
 #define	ECONNREFUSED	239	/* Connection refused */
 #define	EREFUSED	ECONNREFUSED	/* for HP's NFS apparently */
-#define	EREMOTERELEASE	240	/* Remote peer released connection */
 #define	EHOSTDOWN	241	/* Host is down */
 #define	EHOSTUNREACH	242	/* No route to host */
 
-- 
2.42.0


