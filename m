Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DC3433EB9
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Oct 2021 20:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhJSSuX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Oct 2021 14:50:23 -0400
Received: from outbound1a.eu.mailhop.org ([52.58.109.202]:46329 "EHLO
        outbound1a.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbhJSSuW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Oct 2021 14:50:22 -0400
X-Greylist: delayed 903 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Oct 2021 14:50:22 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1634668324; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=sEOPHuA165s2hutmRNqtadENpo4jIN3OCgnFwD1n3W4znZs2bgDu8fhjdQYJyZVl3bsCXZ3mwtX9B
         P6ITpfYOnwQUw30FNpterB9rYzCdYqD8eGKidPf+DfWaTcePZCBG3kUJBAC0PJgcksfcWC3PCW3ZbA
         4KxF43jEg6WUo1Wom5nDe6KI59V2x+oQEmpMaAXTZ2oKVzvU5yInr+0AmgBwY6X7k90i7X03bZN74T
         Ipn68J4RlxxIGC3x/NFSnTh8rKZlO2h7oX78CChWp6X3J6NG8C9H4NnF+ramYtQrAfJc2Y3osEFOqR
         9Tz27DCuCRtLx/vLj0KrVDs2bXIFFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:dkim-signature:dkim-signature:from;
        bh=tHz9dIg4zbjCy51M57Vo14OySRQjwySB/PHYJl37ugw=;
        b=EdP3k6b4NDLUjqdLvz1jB0O+duZsjouVYSzFTmolFh3eJsBVlRPy+C+wWmarjiNDB0ev8D2r3PIif
         IIHEh1rvOHdDXXiuPohCPvstku5Ysm71X6V/gjFti+1PSP3yINvbWOAGqmiXH56Z/Cd4LIHgJpcD+e
         lxT2nXIxlYi11mN42XSIVqR+ypOaj5czDcX3RwAazLxRhr3GsMnfoRK/8T7mdQsJCoz6NBFbPt67VQ
         nZ8+o0AvPVfrsR+SBJkGEGcIt/oFQm2EcgIkn/I2aFAdoV8Dfk+JbF2Ko9mg8s9hP8IJLh0FPIDQg4
         AmUyMk2lsa6cnakcOFccXE0DI7Adavw==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=tHz9dIg4zbjCy51M57Vo14OySRQjwySB/PHYJl37ugw=;
        b=I94r2Q4QVJO3EwIRGr2rH6TTw8TJfJ13c3PdRO3ToIBM9QmtEdR1SGuHGwn7FMgPMx0WxwwW5igT+
         Z8i3aIjQXdNk8ROBnFY6OIvv3KUSmqV8Vhyw8ZXE65M70cuhorwtoajUaUbGtPyk4C8vjH9keBHsUo
         kNN51k9gzgOf+/gY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=tHz9dIg4zbjCy51M57Vo14OySRQjwySB/PHYJl37ugw=;
        b=lIIyYwzier4U0B2gEoCJPyypkyyI5/sP6NmzHZ6DKjz6Lnc0s7aWUEG5waIq46TXNu2qydyIQkDYF
         HQutYDpf47W3wq7GFxYLgir5UOmx3PMNxqI+mdwpB4hprCVrZ2+FNHjuOwjAY5luCx4aSh4e88kUGz
         Pkm/tReaqn7xHweTLCuU37u/YlP41Ty3ML1dKMK4iTukD/jBcfQmtKB/QYnMdL6/gXPWeoEd+CrKkP
         7ICloR4a8U57ZD9tcUcNJFJrbPioj/QXRjsqQSYwplnAUCid40+1OeOQJggDIacr1c4XsnFHp1REYH
         ryAkMmgPbGeKsZsNG15uD6Nwd+QjZUw==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: da0b2740-310a-11ec-a070-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id da0b2740-310a-11ec-a070-973b52397bcb;
        Tue, 19 Oct 2021 18:32:02 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by mail.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mctu5-00Bhg0-8f; Tue, 19 Oct 2021 21:32:01 +0300
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH 3/3] parisc: mark xchg functions notrace
Date:   Tue, 19 Oct 2021 20:31:52 +0200
Message-Id: <20211019183152.26191-4-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019183152.26191-1-svens@stackframe.org>
References: <20211019183152.26191-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

tracing the xchg functions leads to recursion in various
places. Therefore mark the function as notrace.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/lib/bitops.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/lib/bitops.c b/arch/parisc/lib/bitops.c
index 9ac683bf6ae7..36a314199074 100644
--- a/arch/parisc/lib/bitops.c
+++ b/arch/parisc/lib/bitops.c
@@ -18,7 +18,7 @@ arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
 #endif
 
 #ifdef CONFIG_64BIT
-unsigned long __xchg64(unsigned long x, volatile unsigned long *ptr)
+unsigned long notrace __xchg64(unsigned long x, volatile unsigned long *ptr)
 {
 	unsigned long temp, flags;
 
@@ -30,7 +30,7 @@ unsigned long __xchg64(unsigned long x, volatile unsigned long *ptr)
 }
 #endif
 
-unsigned long __xchg32(int x, volatile int *ptr)
+unsigned long notrace __xchg32(int x, volatile int *ptr)
 {
 	unsigned long flags;
 	long temp;
@@ -43,7 +43,7 @@ unsigned long __xchg32(int x, volatile int *ptr)
 }
 
 
-unsigned long __xchg8(char x, volatile char *ptr)
+unsigned long notrace __xchg8(char x, volatile char *ptr)
 {
 	unsigned long flags;
 	long temp;
@@ -56,7 +56,7 @@ unsigned long __xchg8(char x, volatile char *ptr)
 }
 
 
-u64 __cmpxchg_u64(volatile u64 *ptr, u64 old, u64 new)
+u64 notrace __cmpxchg_u64(volatile u64 *ptr, u64 old, u64 new)
 {
 	unsigned long flags;
 	u64 prev;
@@ -68,7 +68,7 @@ u64 __cmpxchg_u64(volatile u64 *ptr, u64 old, u64 new)
 	return prev;
 }
 
-unsigned long __cmpxchg_u32(volatile unsigned int *ptr, unsigned int old, unsigned int new)
+unsigned long notrace __cmpxchg_u32(volatile unsigned int *ptr, unsigned int old, unsigned int new)
 {
 	unsigned long flags;
 	unsigned int prev;
@@ -80,7 +80,7 @@ unsigned long __cmpxchg_u32(volatile unsigned int *ptr, unsigned int old, unsign
 	return (unsigned long)prev;
 }
 
-u8 __cmpxchg_u8(volatile u8 *ptr, u8 old, u8 new)
+u8 notrace __cmpxchg_u8(volatile u8 *ptr, u8 old, u8 new)
 {
 	unsigned long flags;
 	u8 prev;
-- 
2.33.0

