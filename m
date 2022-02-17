Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A899A4BAB3E
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Feb 2022 21:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243247AbiBQUqY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Feb 2022 15:46:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242835AbiBQUqX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Feb 2022 15:46:23 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C61615DB0D
        for <linux-parisc@vger.kernel.org>; Thu, 17 Feb 2022 12:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645130755;
        bh=QwFeTDflzfrXe5GQ7u/axdfuudKHloY62+8a4ZjvNCM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=F3eUMLaqINe66oFJuQg+Cn/B2C1uPTRe/9WXP1LuGgowD6qKFzP1VcAHbpNz5tHaL
         wkpEY0GDbJoxer8353TZUkWEGxsY8/YsdsWPhg7GsTZXXnXlnmYMjWZA3AWp/8fEyL
         ajJRhMgi437/0rGkbJXaFZ8f4OsCfOLmHuO6wbE8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.175.13]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTNF-1ng1Re2VrJ-00NRlw; Thu, 17
 Feb 2022 21:45:55 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 4/4] parisc: Reduce code size by optimizing get_current() function calls
Date:   Thu, 17 Feb 2022 21:45:54 +0100
Message-Id: <20220217204554.305554-4-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217204554.305554-1-deller@gmx.de>
References: <20220217204554.305554-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6vytxvOOiXSZpfJ6oBzU2GvdBzrTqdxGbtq8PsdDmB/Uo0RBw/4
 Ftpqu8lwsv+crXyCEjaQnVmtMISAMs4S6iJ4mxpTZaEXnx7TQKn7rFn1kjUgm4LhLEU4JLj
 Iu7LjoDWG5jTehrAuVRtY6xh6H22DztXciXwRfKESKGVNDBp6BA8BoaWZRkLV9hGyxk1HO6
 UrzhbuEmVeZ3MUvbp7Cmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L8Y7C/Rl1QI=:K0/ky+qMBjzZBfmbOaNy+Q
 L+NIez8Wiyo6CMGwDTD1c+od0BRRVytJ7iXb9U3WVSlf0nCQ81xGa93ZGt753LrRLLDvBe2LO
 czbTN2voYk36Nm7QRmG2v4qLDUOCrHSTXAdJjrwwseGImfCK1jagA+3LrqA4uPxgg0FJBlJhx
 FOYxWaQFWwEg/fQUihePtnCJLRH+MyAe7LGGT1c1koihMhjzD3PmJCCSKPjVaeaB/hH+37qhP
 pxwPVXVYeGjDxnxkPZegRCRfnclsqhrnzoJ6E00b0JSExYTK3jnYpPkbnICspaEzN0LZfZZwg
 CR+LcAk+KNE6NllFKhCS0VLCDniUu/KzDdqHbTTIiLEGxecFRlGXMpu/uiolHdcTz+ZGMIMrD
 2OoZewySpbSrXkkHjFG99oQpz8qgsJoDbRasMd1wZmQ6GjPrPIA1tVxDKPDd9owAO0y20AhOd
 F4anKd/T8H3515vIVohD86BADe8W86nfOm4nySs2hWmpujO8MVrpXEHs9e7P35jjQFyLZ+2VP
 y6uPGaanssFdc8SQxZOiiBWaTrJ9JJV+5c/gdip/Bt3IDx7ho4x0MurAVrnr0rkqzSSeW7wQm
 +tXVfN6bFKGf0RLIJIbor62vte7ytb/vW4aOLcaoVVCt8XkQER/LYb1vm777BGNUNfo5Yuoz6
 ZU8zxz6JQKJO3mtzlaaIsI5lAaZSvPX+aGPZ9ZjzkQ0LCnELAMg02smiW0ETk0zFxy1Ex1xlV
 HPSRJ8mYATjiXzR0rlcTfPKuH+p1YYRdxlyw8gibzl5bIc7H0vwU/66IdpIpcwbBdn+J9MBBD
 zrLM7bEYd7Ipfjse+mD9GXRJpInww4+PHmOYP6H/09u8Yf1TrX/cBYFqEmjTW87oMzaxeIiay
 QZ77KTiXPqABPs0DIlUmYH4HWY9uMZKUe5tr+4vI3HWfUxC72q1Kvw61U3vTFPHFWxdOybsEO
 D6B0Fy4IZ2dgVdJGdlbtjK4JyR7xZbSIEeVZuR59meaPBARR0f9/4QoMYiDQ6KkVR0nZPkRza
 XRMfLG25HIRMdvJDcHxF/RDkpFzVCJszW3f0VkDSGkoi0DTNGiEkoGI7TVgCMxDDiBd6vcKF4
 oex1QWsJQLXuuE=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The get_current() code uses the mfctl() macro to get the pointer to the
current task struct from %cr30. The problem with the mfctl() macro is,
that it is marked volatile which is basically correct, because mfctl()
is used to get e.g. the current internal timer or interrupt flags as
well.

But specifically the task struct pointer (%cr30) doesn't change over
time when the kernel executes code for a task.

So, by dropping the volatile when retrieving %cr30 the compiler is now
able to get this value only once and optimize the generated code a lot.

A bloat-o-meter comparism shows that this patch saves ~5kB kernel code
on a 32-bit kernel and ~6kB kernel code on a 64-bit kernel.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/current.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/current.h b/arch/parisc/include/asm/c=
urrent.h
index 568b739e42af..dc7aea07c3f3 100644
=2D-- a/arch/parisc/include/asm/current.h
+++ b/arch/parisc/include/asm/current.h
@@ -2,14 +2,16 @@
 #ifndef _ASM_PARISC_CURRENT_H
 #define _ASM_PARISC_CURRENT_H

-#include <asm/special_insns.h>
-
 #ifndef __ASSEMBLY__
 struct task_struct;

 static __always_inline struct task_struct *get_current(void)
 {
-	return (struct task_struct *) mfctl(30);
+	struct task_struct *ts;
+
+	/* do not use mfctl() macro as it is marked volatile */
+	asm( "mfctl %%cr30,%0" : "=3Dr" (ts) );
+	return ts;
 }

 #define current get_current()
=2D-
2.34.1

