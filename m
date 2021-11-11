Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E6544DDB7
	for <lists+linux-parisc@lfdr.de>; Thu, 11 Nov 2021 23:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhKKWHc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 11 Nov 2021 17:07:32 -0500
Received: from outbound5e.eu.mailhop.org ([52.28.168.19]:10465 "EHLO
        outbound5e.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhKKWHb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 Nov 2021 17:07:31 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1636668277; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=jS0bzu/b/fdTZXbucNlXN7009mfkO/+uN4LUV+GDIwb4D3XPaiWbmeFRkIg5zc8Q5dgzncj2JnmZC
         mAbeW3zZBG+14kF7UvB49k8MTZiep8xrfbooqWQsxpMtLdIzEDdRA3AUXs3853ieowO9stucOe8TgN
         4jqhg0d3NCY1tsl36gA0y1Fd3Gavx5qZthKELSKbLNY8agjR9ue39ohc9933EP6o7tjifE+wqpnswS
         pkKCQlwEFLHn8+6RxYYUTfMU1GRL3phqXfXm/GOt5r/ERbdJG/tsZrgjAbkNUlqjj8Im7OZV0jUQWN
         umxmmZMT8jS9Xr74DDLDMZlo933/VAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         dkim-signature:dkim-signature:from;
        bh=4Aj6mSQJ1cBVpq6u2MOAGcam3LLmr3+5pw6ofSJ+1HI=;
        b=UgMH7JsdmyMMnTYCNbmcy77PyLabBV5p1zCJI3LEAnwCnM39eDOi3AYQspAQxmmXTDa7bb7di0HhE
         DDqlRsxaM2f4AJXxE3uWQqv/tBF+wcCX04bCmpg3zZc1avgYaRYAHAfW/mXcuLXMk1LvxzetNsv7Xh
         2cr0dzt81RemiZSFmISezZevu8NM0BsUUrFOPqqnF6AgKz2ZxMLKqf1Ls1NZEPOhRv1b3vMU92bBxn
         WIz/e7NpdfPp77+RA5IijIApa+o3Wsn6aHJp6ixVgir5Eoi2nDkbCR9hjrNxM5+p/1hr7miN+yE370
         X8HCfuLeF203VzzmLsnIaJtu3H07/cQ==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=4Aj6mSQJ1cBVpq6u2MOAGcam3LLmr3+5pw6ofSJ+1HI=;
        b=BqsZ4b5iQu86sPUk/5dKJrPJVhIgPr8yEg4J86Yw1bNQGn5AWtyOA5UOVqtQavkF/8PLoRUjNQl5/
         IKqwmJ1m1+wAERcwYLwdXWOcbRtH0Cld7IPh40iwEWtdkwXbyW5pT92aLpJjoiC/ivD0D9p6yhq17N
         SG46uj0qQ56KFFjQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=4Aj6mSQJ1cBVpq6u2MOAGcam3LLmr3+5pw6ofSJ+1HI=;
        b=ilbl/retkYWrZNWZYJBUtahPcGp2GbvuGqO3ethm+yi+m+FsZyy+6FrjrmYDf2/82Xl9nAzHYVIOb
         tPdfk2TF8Xuububiahp3FhXkTuCie7/2+dLpGT/aKDd/g/4lDTf/Gs5hiNpS53PauzlA2Spf1uw/qW
         ykP5J10wk5BJiWHk0XzJDMb8dgI6ASQFt2/oSqYU9YzvHoYFsVIlpj21BRZodNgbHdp+oCuP/7YcO5
         ZE9KFBQnt8EHObBabdhQXsqwTGWGGbetwv5J89fIlrhpy2jqXliu6q+csCAXZlhfWBqum1VTfMldet
         RjJedrDTC0ddH2g81fFR78QT9mCAmRA==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 5ab0ddff-433b-11ec-a072-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id 5ab0ddff-433b-11ec-a072-973b52397bcb;
        Thu, 11 Nov 2021 22:04:35 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by mail.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mlIBN-00EOFc-Sz; Fri, 12 Nov 2021 00:04:34 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc/entry: fix trace test in syscall exit path
Date:   Thu, 11 Nov 2021 23:04:29 +0100
Message-Id: <20211111220429.797-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

commit 8779e05ba8aa ("parisc: Fix ptrace check on syscall return")
fixed testing of TI_FLAGS. This uncovered a bug in the test mask.
syscall_restore_rfi is only used when the kernel needs to exit to
usespace with single stepping via recovery counter enabled. The test
however used _TIF_SYSCALL_TRACE_MASK, which includes a lot of bits
that shouldn't be tested here.

Fix this by using TIF_SINGLESTEP and TIF_BLOCKSTEP directly and
remove those bits from TIF_SYSCALL_TRACE_MASK.

I encountered this bug by enabling syscall tracepoints. Both in qemu and
on real hardware. As soon as i enabled the tracepoint (sys_exit_read,
but i guess it doesn't really matter which one), i got random page
faults in userspace almost immediately.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/thread_info.h | 3 +--
 arch/parisc/kernel/entry.S            | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index 1a58795f785c..a3ba8c518292 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -68,8 +68,7 @@ struct thread_info {
 
 #define _TIF_USER_WORK_MASK     (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | \
                                  _TIF_NEED_RESCHED | _TIF_NOTIFY_SIGNAL)
-#define _TIF_SYSCALL_TRACE_MASK (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP |	\
-				 _TIF_BLOCKSTEP | _TIF_SYSCALL_AUDIT | \
+#define _TIF_SYSCALL_TRACE_MASK (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT)
 
 #ifdef CONFIG_64BIT
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 57944d6f9ebb..88c188a965d8 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1805,7 +1805,7 @@ syscall_restore:
 
 	/* Are we being ptraced? */
 	LDREG	TASK_TI_FLAGS(%r1),%r19
-	ldi	_TIF_SYSCALL_TRACE_MASK,%r2
+	ldi	_TIF_SINGLESTEP|_TIF_BLOCKSTEP,%r2
 	and,COND(=)	%r19,%r2,%r0
 	b,n	syscall_restore_rfi
 
-- 
2.33.1

