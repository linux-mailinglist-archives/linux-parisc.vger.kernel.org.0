Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D26E3FAE35
	for <lists+linux-parisc@lfdr.de>; Sun, 29 Aug 2021 21:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235923AbhH2TvY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 29 Aug 2021 15:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36747 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235891AbhH2TvX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 29 Aug 2021 15:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630266630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=0XCax7KARgvB+yibQLjYOCFFNOoUulRySNkz/gyF4lQ=;
        b=BmDie0TRQhFLds2wd91o8dQGblWKOJOyDjWLa1oWO77XtKEYCX/oug7Ga4FpKrws8Hlgv0
        q37epcnDH7ZA7TZdJsoiDvJ6264gXsRE0rGCkr+136+aH+/477aeH6HduvBFdYK884OnWj
        xsHZVU+WdrqWahWS0mg4sOQz6T9uw3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-jGdK9uryPT-vW4gSHjKk2A-1; Sun, 29 Aug 2021 15:50:25 -0400
X-MC-Unique: jGdK9uryPT-vW4gSHjKk2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFD0C802929;
        Sun, 29 Aug 2021 19:50:24 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C5A9189C7;
        Sun, 29 Aug 2021 19:50:24 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 17TJoNJu006348;
        Sun, 29 Aug 2021 15:50:23 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 17TJoN0o006343;
        Sun, 29 Aug 2021 15:50:23 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Sun, 29 Aug 2021 15:50:23 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>
cc:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: [PATCH] parisc: fix crash with signals and alloca
Message-ID: <alpine.LRH.2.02.2108291530440.5661@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi

I was debugging some crashes on parisc and I found out that there is a 
crash possibility if a function using alloca is interrupted by a signal. 
The reason for the crash is that the gcc alloca implementation leaves 
garbage in the upper 32 bits of the sp register. This normally doesn't 
matter (the upper bits are ignored because the PSW W-bit is clear), 
however the signal delivery routine in the kernel uses full 64 bits of sp 
and it fails with -EFAULT if the upper 32 bits are not zero.

I created this program that demonstrates the problem:

#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <alloca.h>

static __attribute__((noinline,noclone)) void aa(int *size)
{
	void * volatile p = alloca(-*size);
	while (1) ;
}

static void handler(int sig)
{
	write(1, "signal delivered\n", 17);
	_exit(0);
}

int main(void)
{
	int size = -0x100;
	signal(SIGALRM, handler);
	alarm(1);
	aa(&size);
}

If you compile it with optimizations, it will crash.
The "aa" function has this disassembly:

000106a0 <aa>:
   106a0:       08 03 02 41     copy r3,r1
   106a4:       08 1e 02 43     copy sp,r3
   106a8:       6f c1 00 80     stw,ma r1,40(sp)
   106ac:       37 dc 3f c1     ldo -20(sp),ret0
   106b0:       0c 7c 12 90     stw ret0,8(r3)
   106b4:       0f 40 10 9c     ldw 0(r26),ret0		; ret0 = 0x00000000FFFFFF00
   106b8:       97 9c 00 7e     subi 3f,ret0,ret0	; ret0 = 0xFFFFFFFF0000013F
   106bc:       d7 80 1c 1a     depwi 0,31,6,ret0	; ret0 = 0xFFFFFFFF00000100
   106c0:       0b 9e 0a 1e     add,l sp,ret0,sp	;   sp = 0xFFFFFFFFxxxxxxxx
   106c4:       e8 1f 1f f7     b,l,n 106c4 <aa+0x24>,r0

This patch fixes the bug by truncating the "frame" variable to 32 bits.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 arch/parisc/kernel/signal.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: linux-5.12/arch/parisc/kernel/signal.c
===================================================================
--- linux-5.12.orig/arch/parisc/kernel/signal.c	2021-08-29 19:06:33.000000000 +0200
+++ linux-5.12/arch/parisc/kernel/signal.c	2021-08-29 21:17:55.000000000 +0200
@@ -246,6 +246,11 @@ setup_rt_frame(struct ksignal *ksig, sig
 	
 #ifdef CONFIG_64BIT
 
+	if (is_compat_task()) {
+		/* The gcc alloca implementation leaves garbage in the upper 32 bits of sp.*/
+		frame = (struct rt_sigframe __user *)(unsigned long)ptr_to_compat(frame);
+	}
+
 	compat_frame = (struct compat_rt_sigframe __user *)frame;
 	
 	if (is_compat_task()) {

