Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 901AA44F4FB
	for <lists+linux-parisc@lfdr.de>; Sat, 13 Nov 2021 20:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236006AbhKMTpT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 Nov 2021 14:45:19 -0500
Received: from outbound5e.eu.mailhop.org ([52.28.168.19]:63592 "EHLO
        outbound5e.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235999AbhKMTpT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 Nov 2021 14:45:19 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1636832485; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=X6Jq7DuTQBrbEI30RW6jAXHbFwQJMqHbReFfMFsosI0Ru6nEloo25pOhWwlemfS9HH7nnzAMB4Mit
         3ktbKz+A3MOEy5Tr47JhfLH2lafWeznaqYuM4ZWM8pI86dI/JOWtSWghdShdncSWK3x1WY0LT4Jbkc
         4z1K3e/f1/MfJT/akibBypIOLc2Rf6C3JpHQEV//kC3vafJANFsYH3jh+n3H+xVMRyiR8Sd2VVh3IF
         tIKOSnLKaI1iXFVBg5vpfI+FJpv54UsMrXKD9GRZEsrlbU8Q/fh79yhnfDmHdBHiFZY8wbDKsv5hvm
         YMXSNKPuicQLoCerppO8veBQXzg1lKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         dkim-signature:dkim-signature:from;
        bh=XM449dZ3xIt9s7xBq25APMTjKSv753gAQJu4nRV7jYA=;
        b=WaP6g6u2OHhewBrPUOuCoNbg6kvUxopsVMbyzFdejUtY9ij1RtS4cQe3dwXmx+sxyCF4DgWh7cw0y
         W7BbjzajoYgxBhVQs0aT+LANhVV+jQUzLgXjQnM/deszKIkWkn1o2bNtKHR2LjdXR2bxEL/lnDtc4+
         1PldqWcphTS6ybYQX6nhnHk8JOzmvW0p7ZYwVhGNP+x6XkJu+lL1EIQ4VFwBbEc0aOD49JIkS8pbCS
         nG2zd+BZ+lAkxwaPJZoBPnYlTBWWEy60FKa8MYHtMmKCxJCKr1WxhcQGIouT3XtqsUTBxdyY1vVzeO
         DX1evbmUuXXkjhAhwYYqvnIfzo+/Gdw==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=XM449dZ3xIt9s7xBq25APMTjKSv753gAQJu4nRV7jYA=;
        b=DvGoYTjJ45lOCOfSIQaSA0dCsxHjspFdnLz/cmMdb2NuMUCR7mirMZAZbCJZ0keMc5I0a7loibZEi
         948f8qCS12YBteAn5/5NalyV7q0bOQ8M0eZbJl5ySz+FhiileNIP0MdhZUV2Ux4taZtsSnpFbD+vKw
         LancGR6Y3c1IEyGk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=XM449dZ3xIt9s7xBq25APMTjKSv753gAQJu4nRV7jYA=;
        b=b2Jw3QnKhi8YPD1PeXQgVOuxjsxL8I+gCcLKCSRdb8+KOrUSO4rvZzWrWtpR5WvIyH12ryzkWAhlq
         Phr9MxAgnFTzFq1sB4g/0SREjX0wrGQP2Xq95Cvluf03fyIFNtUR01g9VzqOb3wT3zxW2TomtKzkMa
         a70vAV6xJoZGsGb7CuV6Nj2GMuMJIYpAY2IGOX6PhmIo67f/Mnd+GmK3r/+WFh/oQqv668pCnlUx0j
         uFOspEcM43RUFsQecXh8YHe8onbqImsnl+4iN/YRky8yv95a/JRvapCbLIXFoIa6Xi65jA1LH7k4SE
         1Il3mUuGNTibI9+iolWidsKdilCvTyA==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: ae24f7f7-44b9-11ec-a072-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id ae24f7f7-44b9-11ec-a072-973b52397bcb;
        Sat, 13 Nov 2021 19:41:22 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by mail.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mlytt-00Edxk-Oi; Sat, 13 Nov 2021 21:41:21 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v2] parisc/entry: fix trace test in syscall exit path
Date:   Sat, 13 Nov 2021 20:41:17 +0100
Message-Id: <20211113194117.22680-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

commit 8779e05ba8aa ("parisc: Fix ptrace check on syscall return")
fixed testing of TI_FLAGS. This uncovered a bug in the test mask.
syscall_restore_rfi is only used when the kernel needs to exit to
usespace with single or block stepping and the recovery counter
enabled. The test however used _TIF_SYSCALL_TRACE_MASK, which
includes a lot of bits that shouldn't be tested here.

Fix this by using TIF_SINGLESTEP and TIF_BLOCKSTEP directly.

I encountered this bug by enabling syscall tracepoints. Both in qemu and
on real hardware. As soon as i enabled the tracepoint (sys_exit_read,
but i guess it doesn't really matter which one), i got random page
faults in userspace almost immediately.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

