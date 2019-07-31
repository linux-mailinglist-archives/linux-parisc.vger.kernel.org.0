Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2216F7C90F
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 18:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729435AbfGaQoH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 12:44:07 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:58368 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729432AbfGaQoH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 12:44:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id AFAE98EE134
        for <linux-parisc@vger.kernel.org>; Wed, 31 Jul 2019 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564591446;
        bh=ZI8KPtINK/O3LiDgIFovcgqleLa9+egishEh/oKQcUc=;
        h=Subject:From:To:Date:From;
        b=kLD66Ise1YsoQqEyJ+0Tdc8NevxHGostCrLJl1XmihKm1ozxnb6MR4dta+beuT6L1
         XuFnHVYmBoTMP5O26Fe8+chXOHES1QTITu3Pum8oAfcMyRNdWbFhnOv1GJ8zBJV4eh
         wxSXVfSw5BTEIkC43luGWg+Bfk5+TjIhrbf/nVIA=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1Kxi5DgGTYsw for <linux-parisc@vger.kernel.org>;
        Wed, 31 Jul 2019 09:44:06 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 134A68EE130
        for <linux-parisc@vger.kernel.org>; Wed, 31 Jul 2019 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564591446;
        bh=ZI8KPtINK/O3LiDgIFovcgqleLa9+egishEh/oKQcUc=;
        h=Subject:From:To:Date:From;
        b=kLD66Ise1YsoQqEyJ+0Tdc8NevxHGostCrLJl1XmihKm1ozxnb6MR4dta+beuT6L1
         XuFnHVYmBoTMP5O26Fe8+chXOHES1QTITu3Pum8oAfcMyRNdWbFhnOv1GJ8zBJV4eh
         wxSXVfSw5BTEIkC43luGWg+Bfk5+TjIhrbf/nVIA=
Message-ID: <1564591443.3319.30.camel@HansenPartnership.com>
Subject: Compressed kernels currently won't boot
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Parisc List <linux-parisc@vger.kernel.org>
Date:   Wed, 31 Jul 2019 09:44:03 -0700
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I noticed this trying to test out compressed kernel booting.  The
problem is that a compressed kernel is divided into two pieces, one of
which starts at 0x000e0000 and is the bootstrap code which is
uncompressed into 0x00100000 and the rest of which is the real
compressed kernel which is loaded above the end of the current
decompressed size of the entire kernel.  palo decompresses the head and
jumps to it and it then decompresses the rest of the kernel into place.
 This means that the first part of the compressed image can't be larger
than 0x20000 == 131072 because otherwise it will be loaded into an area
that decompression will alter.

The problem is that a change was introduced by 

commit 34c201ae49fe9e0bf3b389da5869d810f201c740
Author: Helge Deller <deller@gmx.de>
Date:   Mon Oct 15 22:14:01 2018 +0200

    parisc: Include compressed vmlinux file in vmlinuz boot kernel
 

Which moved the compressed vmlinux from the second segment to the
first, which is what makes it too big for me.  This patch reverting
that piece allows me to boot again.

James

---

diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boot/compressed/vmlinux.lds.S
index bfd7872739a3..5841aa373c03 100644
--- a/arch/parisc/boot/compressed/vmlinux.lds.S
+++ b/arch/parisc/boot/compressed/vmlinux.lds.S
@@ -42,12 +42,6 @@ SECTIONS
 #endif
 	_startcode_end = .;
 
-	/* vmlinux.bin.gz is here */
-	. = ALIGN(8);
-	.rodata.compressed : {
-		*(.rodata.compressed)
-	}
-
 	/* bootloader code and data starts behind area of extracted kernel */
 	. = (SZ_end - SZparisc_kernel_start + KERNEL_BINARY_TEXT_START);
 
@@ -73,6 +67,12 @@ SECTIONS
 		*(.rodata.*)
 		_erodata = . ;
 	}
+	/* vmlinux.bin.gz is here */
+	. = ALIGN(8);
+	.rodata.compressed : {
+		*(.rodata.compressed)
+	}
+
 	. = ALIGN(8);
 	.bss : {
 		_bss = . ;
