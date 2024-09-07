Return-Path: <linux-parisc+bounces-2266-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B69970469
	for <lists+linux-parisc@lfdr.de>; Sun,  8 Sep 2024 00:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 887711C20F2B
	for <lists+linux-parisc@lfdr.de>; Sat,  7 Sep 2024 22:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B2125632;
	Sat,  7 Sep 2024 22:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUw7unlE"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A2224B2F
	for <linux-parisc@vger.kernel.org>; Sat,  7 Sep 2024 22:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725748842; cv=none; b=abqVvdg3luWRXVuhBmdl+iBZ1MjhAq+/0CGmMmgA5G/6484Lyvz2irADI7Zk2Sn9u8mEV73TL/lEOg1oieUFPHvvtcpRrPnuh4xFJOsSOjABSCu8NRPXccL0lJS4TlUawOdgzfx251UjVk9/SOaZiqBLTHw21zf8ss7zW/QjQj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725748842; c=relaxed/simple;
	bh=q/5406MbpCo5yY6XnGnV58LQCrwkz6rVjp+VYzkz/j8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JXeTp2q5uX8Ds+FfHHx2ijGJmKKXlMKR/OYEs85OzDrpvyv8OIP71oAi3QBGAObm60wRg2LsulM6Sy7uVLy8RxOZf3OYIGGzutGUqaoaqkiYAJN3l8bMQULCkL0F7ycVK44Tz/KK6jYO3/uZlaA/5IYlZlUy9b2PgW8WHptYzGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUw7unlE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3892BC4CEC2;
	Sat,  7 Sep 2024 22:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725748841;
	bh=q/5406MbpCo5yY6XnGnV58LQCrwkz6rVjp+VYzkz/j8=;
	h=Date:From:To:Subject:From;
	b=dUw7unlEUi9JwdBP6jSnN8VJaya326D0LDr5PhGlMXpkFenkXAYlghdisSxKO8u1K
	 8zoghcKUZbbikwoJOJeGdS9zK7ODZzkNJ2avotV6KbMJp3C3qrQkcxmBwH2qzPd1/7
	 eqBGGZeF+KDM/5Xt4Urz1LsfKuFYQBjMtN6M5D8cxbxPD6EKLE1KliwIqqR8Vqrm2s
	 F4eDGNyqer0O0n7OshC8Lv7CzAA7qJUXDITFCGRgGue9K8J/r7kk0H0znEXaa9gVsq
	 +8eWRNkL+4JAwl8JMYCIsR/4M6mV6nvLDVgwgiMA8M8acdMMYLWnmNBpzO153mEkin
	 3zKAs7SmFWOzQ==
Date: Sun, 8 Sep 2024 00:40:38 +0200
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Fix 64-bit userspace syscall path
Message-ID: <ZtzWZnFpEMZK1cFc@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Currently the glibc isn't yet ported to 64-bit for hppa, so
there is no usable userspace available yet.
But it's possible to manually build a static 64-bit binary
and run that for testing. One such 64-bit test program is
available at http://ftp.parisc-linux.org/src/64bit.tar.gz
and it shows various issues with the existing 64-bit syscall
path in the kernel.
This patch fixes those issues.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 1f51aa9c8230..0fa81bf1466b 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -243,10 +243,10 @@ linux_gateway_entry:
 
 #ifdef CONFIG_64BIT
 	ldil	L%sys_call_table, %r1
-	or,=	%r2,%r2,%r2
-	addil	L%(sys_call_table64-sys_call_table), %r1
+	or,ev	%r2,%r2,%r2
+	ldil	L%sys_call_table64, %r1
 	ldo	R%sys_call_table(%r1), %r19
-	or,=	%r2,%r2,%r2
+	or,ev	%r2,%r2,%r2
 	ldo	R%sys_call_table64(%r1), %r19
 #else
 	load32	sys_call_table, %r19
@@ -379,10 +379,10 @@ tracesys_next:
 	extrd,u	%r19,63,1,%r2			/* W hidden in bottom bit */
 
 	ldil	L%sys_call_table, %r1
-	or,=	%r2,%r2,%r2
-	addil	L%(sys_call_table64-sys_call_table), %r1
+	or,ev	%r2,%r2,%r2
+	ldil	L%sys_call_table64, %r1
 	ldo	R%sys_call_table(%r1), %r19
-	or,=	%r2,%r2,%r2
+	or,ev	%r2,%r2,%r2
 	ldo	R%sys_call_table64(%r1), %r19
 #else
 	load32	sys_call_table, %r19
@@ -1327,6 +1327,8 @@ ENTRY(sys_call_table)
 END(sys_call_table)
 
 #ifdef CONFIG_64BIT
+#undef __SYSCALL_WITH_COMPAT
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
 	.align 8
 ENTRY(sys_call_table64)
 #include <asm/syscall_table_64.h>    /* 64-bit syscalls */

