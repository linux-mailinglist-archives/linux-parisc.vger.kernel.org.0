Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21C645FE36
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Nov 2021 12:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhK0LDr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 27 Nov 2021 06:03:47 -0500
Received: from mout.gmx.net ([212.227.17.20]:35659 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233248AbhK0LBq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Nov 2021 06:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638010705;
        bh=sWXyLZHF1FuKKSGyu0QX2Bvsjy7Aa81ICOcQipfD62g=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Dg+s0cIW+cBp277lcubXmtc6u8jQMnsn6BM7z62ZL1InleG+iwu8tZJZA08KH2eom
         76swBzDRMmJtNya7azsLBc5/piTSvHJl2x4PvhUQjBulqDPUq2vDs+4E8PKzA2Sw2V
         UnWUCdwFaQuF4v5IluTC16D8gS5j77XnzqWLHAsM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.151.211]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McY8T-1mLQTt44uD-00cyxO; Sat, 27
 Nov 2021 11:58:25 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Do not export __lshrdi3 on 64-bit with gcc >= 11
Date:   Sat, 27 Nov 2021 11:58:18 +0100
Message-Id: <20211127105818.299902-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L5CXnDoTiGZook4rlgJc5bGuGtIdF64ki3jCtimHTEdLXXiYxwA
 Rp04WxtzPI/wVjnMHPk8RdFhR9LQCwP7pqDU5HTMVixb7DqEZCbW//gTLGKw52AVrAx+NXO
 f4RFhFX6Z1V84slrlaSVJ6h9uAe6nv/TkXUbjYL1X/mjXFBww3+0cBgjx7b6elA+eVddbMx
 4DsfSkmIuUY8XYThqFljw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VURbKvuUDnI=:YPlmw/SIU8XWfdwqXI59Yi
 iufGT6junY+ua4ixrPWtn5ebfE0dbm0ciFW2IdanG1AS/S8Bn1bKmiNkou685MF+ulbLgW9OO
 1TLkU9jV2rVlgzDEhNka0vvpAuVkpEI9KYmyxrj2lS6T9IPFVcP+rK1MesWgVjG9nrW6t+5lI
 /ATV02oc9Mek9BZ7wFfHTtXmUsz4rT+863AD3qg3ijppcDNy9v5SnOB5ujGd09O5p4N67MRMw
 CNueUDOKC/vjeOjv1v9B7LzRKFj1ygxXaSV+4VPMglEVRvw5H20idihab8cW6JqhAzA/jODtU
 EFL/yUs+KV1QAvFfNIQZfODpXjMzdPLhNpcLObPGsShdQE+bWLi10dl4m0ig2cKwvlSRIbEwn
 dVUEGKkfq9XREqOuWkS+xZHyo/iJTZMh/YoLstsMtfIqWXucVpo5KY4/Ybte7zK7q/ah1++gs
 Ut9pCjZ9I1wNpHC4GS/vgFCRQdTt3jM1TBXI10QqxuikNPWl6mcefEg9etf4QuiFb/pbq+1in
 O7pMObadtfSDFDZXYh2FFncFnbaipiXhiYAz5pBQwBB987ALmcTmEgUM4E6+JvGfhYWqXPDyi
 GjeYfIMB6UtywArW69PpUrBVUKZDStCCnPKiJrIbQQy7h5r3CE3kmz8cWlBm++Ts/Bb74uoqO
 OWACcLRlcc12vnHjMZtFpeO+iO9iQZymAuctPZuFJQtj93WWoa/GUQmjau+sVjwyOC3XZat2q
 Y8Ima9p9XoXXEPdqIwzYJpjTKj9jr9H2TUlxF+Lro/M0dctsANulN2Raq/PBOn6fzjGsK8u06
 KiqbQK7NELRSCZgbKd5uHHc/ZJQ8tkcTg84XJf0zarxION9fTcpitQ7TTqWtiDjlzkwTErbzn
 lNqujR+6bVlExxPqN2wVKYCNsy3/oTzGzQpya1K3Z+SlLCwPwJAEG/jEI/3Wtcza2XToOYk1s
 hM3NZfHBpoDyICL1prPc7IgzA6gP5NyTw5iOm0bvg+0i+uC0xGUO4odIJQn/+oEi2NMSfKbc/
 Trnog1W20SsixjXOXueNeXH66+OpVSeSVlzaXz0cCBJbdXkHGH29jhNmwlq9RKorz3rBQHsT7
 l1/h8rwzK7LjOE=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

It seems the __lshrdi3 symbol was dropped from libgcc.a from gcc-11 for
64-bit executables.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/parisc_ksyms.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc=
_ksyms.c
index 00297e8e1c88..f26c51370255 100644
=2D-- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/syscalls.h>
+#include <linux/compiler.h>

 #include <linux/string.h>
 EXPORT_SYMBOL(memset);
@@ -94,16 +95,19 @@ EXPORT_SYMBOL($$divI_15);

 extern void __ashrdi3(void);
 extern void __ashldi3(void);
-extern void __lshrdi3(void);
 extern void __muldi3(void);
 extern void __ucmpdi2(void);

 EXPORT_SYMBOL(__ashrdi3);
 EXPORT_SYMBOL(__ashldi3);
-EXPORT_SYMBOL(__lshrdi3);
 EXPORT_SYMBOL(__muldi3);
 EXPORT_SYMBOL(__ucmpdi2);

+#if !(defined(CONFIG_64BIT) && (GCC_VERSION >=3D 110000))
+extern void __lshrdi3(void);
+EXPORT_SYMBOL(__lshrdi3);
+#endif
+
 asmlinkage void * __canonicalize_funcptr_for_compare(void *);
 EXPORT_SYMBOL(__canonicalize_funcptr_for_compare);

=2D-
2.31.1

