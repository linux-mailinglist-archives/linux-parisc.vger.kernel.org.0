Return-Path: <linux-parisc+bounces-2421-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B1D98C0F2
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Oct 2024 17:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5DEA1F20FDE
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Oct 2024 15:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC141C5782;
	Tue,  1 Oct 2024 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpOrLp27"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D1C1C2453;
	Tue,  1 Oct 2024 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794812; cv=none; b=CgItjam/gcqJ5yOR9Gwh13igstRYsE0uYk+KtvD2TAGBjzJKPEyL13qw3mFMHD2ZvQpC/1CJAgiGCtGRhhTi1RddEApwcSslgvfLXX7eJYGBBc81ETN2XmESM/chDO1xwljMNvD5CAKQwpwUix00cXGZjL9j0f/4RrNmoEpt8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794812; c=relaxed/simple;
	bh=jCeTvVB478eHvduQKVpCmoBAzUjIYnlhAvFp6YOusr0=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:Subject; b=orx/doHmjiHvIXh28Iz3pER77CuRtLoXEd58cZDlGLXuEVdulkVw+pr1H8/oDJEQvOWx40D6vTNnf9+DUbK1bsK02m/w0TrcVFSAIF0tFOwBMbUHV6VkWfksk6WRECIkxXg3nHwQ3DL1jljiK1F8mFNZgiydNScDGQ/aTw0lf0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpOrLp27; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EA0C4CEC7;
	Tue,  1 Oct 2024 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727794812;
	bh=jCeTvVB478eHvduQKVpCmoBAzUjIYnlhAvFp6YOusr0=;
	h=From:Date:To:Subject:From;
	b=UpOrLp27hA1Zx9cr8tqCIVXB0gDYO8UfMEpJSvAwmnhJZvYQ3mbpL2vodlkrEdJ7y
	 LqVNQn0kGRtoBOUcZsFWKhAYyMN0KLkeumeidISTWoWZT5E4IVEk7EoEpGgjpP5OUi
	 1ZdijC+jacyuOLMGSEq3Afcjv8dxFMj51BAmyQ9nnuSHHUd3Qhlf1y5zFdV7aP8LJE
	 +onBcR2r7aWo6h15hnMLTyW7XRYu/g/xKxedkBO2c61Fx6Sc3QlHdRPNbDYw9wF8nN
	 di+dRqlu0JrOiAicAWSejSSs33NYRSrkxRNsX7PtUnZs+Xqlc5PmFaEBAGsHTeA/Av
	 MF3kzRY/ePrcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7704E380DBF7;
	Tue,  1 Oct 2024 15:00:16 +0000 (UTC)
From: Colin Ian King via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 01 Oct 2024 15:00:12 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: deller@gmx.de, bugs@lists.linux.dev, linux-parisc@vger.kernel.org, 
 James.Bottomley@HansenPartnership.com
Message-ID: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
Subject: calling getcpu with misaligned address causes kernel panic
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Colin Ian King writes via Kernel.org Bugzilla:

Passing a read-only incorrectly aligned address into getcpu() causes a kernel panic.  I originally found this issue when testing stress-ng using stress-ng --sysbadaddr 1, I've managed to make a short reproducer that can panic the kernel on every invocation of the program.

I can reproduce this on mainline kernels (in Debian), tested and reproduced on kernels 6.6.15, 6.9.7 and 6.10.6, so it's been around a while and it's still reproducible on recent kernels.

This only occurs on PA-RISC (hppa) kernels and only tested in a QEMU VM since I don't have access to real H/W.

cking@hppa:~$ cat crash.c

#define _GNU_SOURCE
#include <sched.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <unistd.h>

void main(void)
{
	char *addr;
	
	addr = mmap(NULL, 4096, PROT_READ, MAP_ANONYMOUS | MAP_SHARED, -1, 0);
	if (addr != MAP_FAILED)
		getcpu((int *)addr, (int *)(1 + addr));
}

cking@hppa:~$ gcc crash.c -o crash
cking@hppa:~$ ./crash 

[  361.158650] Backtrace:
[  361.159621]  [<10413c78>] handle_unaligned+0x590/0x710
[  361.159621]  [<10409354>] handle_interruption+0x1dc/0x7b8
[  361.159621]  [<104545d8>] sys_getcpu+0x30/0x74
[  361.159621] 
[  361.159621] 
[  361.159621] Page fault: bad address: Code=26 (Data memory access rights trap) at addr f9000000
[  361.159621] CPU: 2 PID: 749 Comm: crash Not tainted 6.6.15-parisc #1  Debian 6.6.15-2
[  361.159621] Hardware name: 9000/778/B160L
[  361.159621] 
[  361.159621]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[  361.159621] PSW: 00000000000001000000000000001111 Not tainted
[  361.159621] r00-03  0004000f 00000000 10413c78 142903c0
[  361.159621] r04-07  14290080 12a08000 fc000000 f9000001
[  361.159621] r08-11  00000000 0f3dd280 f9099c20 f9096e58
[  361.159621] r12-15  00011008 0119c228 00000000 00000001
[  361.159621] r16-19  14290080 00138428 011b4e00 ff000000
[  361.159621] r20-23  00000000 00000000 00000000 00000011
[  361.159621] r24-27  00000000 00000000 14290080 110dd848
[  361.159621] r28-31  f9000000 00000000 14290400 000003c3
[  361.159621] sr00-03  000003c3 000003c3 00000000 000003c3
[  361.159621] sr04-07  00000000 00000000 00000000 00000000
[  361.159621] 
[  361.159621] IASQ: 00000000 00000000 IAOQ: 104135ac 104135b0
[  361.170517]  IIR: 0f945280    ISR: 000003c3  IOR: f9000000
[  361.170517]  CPU:        2   CR30: 12a08000 CR31: 00000000
[  361.170517]  ORIG_R28: 12a08000
[  361.170517]  IAOQ[0]: emulate_stw+0x5c/0x94
[  361.170517]  IAOQ[1]: emulate_stw+0x60/0x94
[  361.170517]  RP(r2): handle_unaligned+0x590/0x710
[  361.170517] Backtrace:
[  361.170517]  [<10413c78>] handle_unaligned+0x590/0x710
[  361.170517]  [<10409354>] handle_interruption+0x1dc/0x7b8
[  361.170517]  [<104545d8>] sys_getcpu+0x30/0x74
[  361.170517] 
[  361.170517] Kernel panic - not syncing: Page fault: bad address
[  361.170517] ---[ end Kernel panic - not syncing: Page fault: bad address ]---

View: https://bugzilla.kernel.org/show_bug.cgi?id=219339#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


