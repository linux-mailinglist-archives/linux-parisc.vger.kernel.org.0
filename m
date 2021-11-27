Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8BD145FE9C
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Nov 2021 13:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbhK0Mlv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 27 Nov 2021 07:41:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44494 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350108AbhK0Mjv (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Nov 2021 07:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638016596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=zqIa1j5A0d/EtUnFJ/VqrjiyNF8lkC24a0+Y8rFhsf4=;
        b=Glcpq7IHj+UH8UmWJ5N5L24nKSrbEiIdmeOifZJiIQeKetIOuaHHq6MVnSHovX/AxOytqP
        ETEQ7EE5A4s5bk3sGMYnhQqWuRv7hCQhwSo2c1kYGXQhhGXYbgveqy8jR+C1Tv25G2Yr43
        0Q3NYhmROhx0nfViBR4pwn2WMjCdC5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-Cx-C8ahHNb-t1rnV_7fVYw-1; Sat, 27 Nov 2021 07:36:31 -0500
X-MC-Unique: Cx-C8ahHNb-t1rnV_7fVYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9DCB1853026;
        Sat, 27 Nov 2021 12:36:29 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AA141803D;
        Sat, 27 Nov 2021 12:36:29 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 1ARCaTZl011572;
        Sat, 27 Nov 2021 07:36:29 -0500
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 1ARCaSP7011568;
        Sat, 27 Nov 2021 07:36:28 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Sat, 27 Nov 2021 07:36:28 -0500 (EST)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>
cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: fix compilation failure due to missing __lshrdi3
Message-ID: <alpine.LRH.2.02.2111270717490.10680@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi

I get this error when compiling a 64-bit kernel on a current Debian-ports 
system.

  CC [M]  drivers/hid/hid-generic.o
  LD [M]  drivers/hid/hid.o
  GEN     .version
  CHK     include/generated/compile.h
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
hppa64-linux-gnu-ld: arch/parisc/kernel/parisc_ksyms.o:(___ksymtab+__lshrdi3+0x0): undefined reference to `__lshrdi3'
make: *** [Makefile:1161: vmlinux] Chyba 1

This patch fixes it.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 arch/parisc/kernel/parisc_ksyms.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

Index: linux-5.16-rc2/arch/parisc/kernel/parisc_ksyms.c
===================================================================
--- linux-5.16-rc2.orig/arch/parisc/kernel/parisc_ksyms.c	2021-11-26 17:55:20.000000000 +0100
+++ linux-5.16-rc2/arch/parisc/kernel/parisc_ksyms.c	2021-11-26 19:18:31.000000000 +0100
@@ -92,17 +92,20 @@ EXPORT_SYMBOL($$divI_12);
 EXPORT_SYMBOL($$divI_14);
 EXPORT_SYMBOL($$divI_15);
 
+#ifndef CONFIG_64BIT
 extern void __ashrdi3(void);
 extern void __ashldi3(void);
 extern void __lshrdi3(void);
-extern void __muldi3(void);
 extern void __ucmpdi2(void);
 
 EXPORT_SYMBOL(__ashrdi3);
 EXPORT_SYMBOL(__ashldi3);
 EXPORT_SYMBOL(__lshrdi3);
-EXPORT_SYMBOL(__muldi3);
 EXPORT_SYMBOL(__ucmpdi2);
+#endif
+
+extern void __muldi3(void);
+EXPORT_SYMBOL(__muldi3);
 
 asmlinkage void * __canonicalize_funcptr_for_compare(void *);
 EXPORT_SYMBOL(__canonicalize_funcptr_for_compare);

