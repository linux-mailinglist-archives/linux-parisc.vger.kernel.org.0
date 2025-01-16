Return-Path: <linux-parisc+bounces-3226-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88241A142F0
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Jan 2025 21:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E09EF1882D52
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Jan 2025 20:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C6926AEC;
	Thu, 16 Jan 2025 20:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQJgYc7m"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751CB24A7EE
	for <linux-parisc@vger.kernel.org>; Thu, 16 Jan 2025 20:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737058671; cv=none; b=c9gIjQJTvJiTeCP0pNCyIQqsID/pxLG/XnfnoUWhOdMID3J35hyOsTOBdP52FgMFDi9v82Tab4DerC20WqLh3/SytfkOavpcOWSC+UpFL9BXi9LzmYxmDlSIPa+Dc9bMYpYbIyHWyrGIXkyrhELnARUGpiMXtnfvhub15K61Scg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737058671; c=relaxed/simple;
	bh=2fVJYrDJrauo1neOiFmFxwwLv59IEEgq1ktcQl4XkkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+cIYnGuUZ/xRF1d97iZM4HoiYQ8KP1hmduBtq175piFsdkReLXaQKOJgqC7DXv1G9st/0Fte4vrRJje6UKtSTHDfWjOun+IA1+kf3AdQYgLUZ9LegPc0xicp19e8E009yljsyGw7HWGEADfG4BSuzan3SvosPeiPJ3L7+s3nqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQJgYc7m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B860C4CED6;
	Thu, 16 Jan 2025 20:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737058671;
	bh=2fVJYrDJrauo1neOiFmFxwwLv59IEEgq1ktcQl4XkkM=;
	h=Date:From:To:Cc:Subject:From;
	b=KQJgYc7mwLRvxjLJJLY1pMRVjbrYpvzxgLWInG9xKrNIMzGIMdBm7NEFs/IUFJc6m
	 5YphhZJ4T2njxqoHkV3Q6J3zCrpKfyGMWj/mpJz91YNP0f01PB196CW1w9sPi8mT65
	 YFvBGpHC2ooPBMFERk8PyAQcaGGFc8xk7uhJOjPM2fKFl4QyyTHatHjtwQcDYF0Qqj
	 VgMkfYN308KyI2CX+IhsIP7u3t4/HmKWz8gQqYf9qtXVQC6GOgjC5H1qXvO1LEfNDs
	 pqBKQiyLa9JJuEf9gjLjyv104534WRl8dSxpZmrpBbXUysHvelxiyK5wPMWrryIBNK
	 fc6d3KzBe4F5Q==
Date: Thu, 16 Jan 2025 21:17:47 +0100
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] parisc: Temporarily disable jump label support
Message-ID: <Z4lpa9qoJClb6X7Z@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The 32-bit Debian kernel 6.12 fails to boot and crashes like this:

 init (pid 65): Protection id trap (code 7)
 CPU: 0 UID: 0 PID: 65 Comm: init Not tainted 6.12.9 #2
 Hardware name: 9000/778/B160L

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
 PSW: 00000000000001000000000000001111 Not tainted
 r00-03  0004000f 110d39d0 109a6558 12974400
 r04-07  12a810e0 12a810e0 00000000 12a81144
 r08-11  12a81174 00000007 00000000 00000002
 r12-15  f8c55c08 0000006c 00000001 f8c55c08
 r16-19  00000002 f8c58620 002da3a8 0000004e
 r20-23  00001a46 0000000f 10754f84 00000000
 r24-27  00000000 00000003 12ae6980 1127b9d0
 r28-31  00000000 00000000 12974440 109a6558
 sr00-03  00000000 00000000 00000000 00000010
 sr04-07  00000000 00000000 00000000 00000000

 IASQ: 00000000 00000000 IAOQ: 110d39d0 110d39d4
  IIR: baadf00d    ISR: 00000000  IOR: 110d39d0
  CPU:        0   CR30: 128740c0 CR31: 00000000
  ORIG_R28: 000003f3
  IAOQ[0]: 0x110d39d0
  IAOQ[1]: 0x110d39d4
  RP(r2): security_sk_free+0x70/0x1a4
 Backtrace:
  [<10d8c844>] __sk_destruct+0x2bc/0x378
  [<10d8e33c>] sk_destruct+0x68/0x8c
  [<10d8e3dc>] __sk_free+0x7c/0x148
  [<10d8e560>] sk_free+0xb8/0xf0
  [<10f6420c>] unix_release_sock+0x3ac/0x50c
  [<10f643b8>] unix_release+0x4c/0x7c
  [<10d832f8>] __sock_release+0x5c/0xf8
  [<10d833b4>] sock_close+0x20/0x44
  [<107ba52c>] __fput+0xf8/0x468
  [<107baa08>] __fput_sync+0xb4/0xd4
  [<107b471c>] sys_close+0x44/0x94
  [<10405334>] syscall_exit+0x0/0x10

Bisecting points to this commit which triggers the issue:
	commit  417c5643cd67a55f424b203b492082035d0236c3
	Author: KP Singh <kpsingh@kernel.org>
	Date:   Fri Aug 16 17:43:07 2024 +0200
	        lsm: replace indirect LSM hook calls with static calls

After more analysis it seems that we don't fully implement the static calls
and jump tables yet. Additionally the functions which mark kernel memory
read-only or read-write-executable needs to be further enhanced to be able to
fully support static calls.

CONFIG_SECURITY_YAMA=y was one option to trigger the issue.

As a temporary solution disable JUMP_LABEL functionality to
avoid the crashes.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: Guenter Roeck <linux@roeck-us.net>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index aa6a3cad275d..fcc5973f7519 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -60,8 +60,8 @@ config PARISC
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HASH
-	select HAVE_ARCH_JUMP_LABEL
-	select HAVE_ARCH_JUMP_LABEL_RELATIVE
+	# select HAVE_ARCH_JUMP_LABEL
+	# select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KFENCE
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK

