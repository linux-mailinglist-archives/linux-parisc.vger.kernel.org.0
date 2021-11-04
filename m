Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D69445A80
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 20:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhKDTWL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 15:22:11 -0400
Received: from mout.gmx.net ([212.227.17.22]:44499 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229804AbhKDTWL (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 15:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636053567;
        bh=6+12gLU11vJTuAaix2qZxhywmuQn/HQGcbKT57YD24k=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=QSkyTozlxeAGFl8DcTXAMJpFV0wwE9RUFsEpjIQykzu2EjzAvEscwVGJhT7cGTmKe
         APDMvMRbfPU5ven3boGXeLvX+sPjfR9VZlpkd3lk7qak/3BVh/ILS2ErIoNaF+Zq+e
         HerHDz+NBlsDV8cTF+8vYeCr0+XXxsFjQlWZF4mM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.157.73]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fnj-1mmp8C1VyR-006Qqa; Thu, 04
 Nov 2021 20:19:27 +0100
Date:   Thu, 4 Nov 2021 20:19:00 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix backtrace to always include init funtion names
Message-ID: <YYQyJMe5nM8Y5cum@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:gw7QldgX3czYh0/Uh1aWm91t14Sx6bL+u8IeL5yAghylWEOScHH
 NC1NWIsea37hudB7xXYPV6AIPC2kEyoHXhQ1WB0kE/SdIG/pLqQ1550/CU6nsS2XrsBlcfU
 FI13BlxXJLZXahxVO1rYnLNGHK15UGADUwHPfPFoy1zp4nJz3Nk0PkgJi2Q/yDMNlQfyfkm
 mA3/NWYsYYJZ83e8zjHCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NPSXyw7M1LM=:9GJIX6ua6fKV4bk0OtfRaq
 P0K6n9ke2ayR+SbutNE3IVajxF42XJ2pl81ba6GUCAw3L7bIsbDr++VFY9NfoV9jDr5zpuDSi
 l+P9mpFdhBjHlyZdFvsATm+CzK13JsfbEmNfpY+gKn8ImOfkRVjS60WsUM9QFBgECucWFsKUQ
 8ILmPdUF3uqphw4s07UazQrMLr8LhD7lf02J+oAjyH6zz0qWqhmEl1EuF5O+H4VKWJboxym4f
 rypd1Q5LdWaPMou9JULu2DWrBXGIRYOKBhDMbYyy2BXq2Myk7E6W3PDtdtLqi31cXULKkt6QL
 JTPWZ9W34CwPSoZw2rgbe7SMkvNeVoo0ibg6NJk1sWTo+HEeNaErwqgyb1NRVlqssyzCQrJ8D
 kPOYsqrA8nJeu42bGvEV3e3hv8coRKU0LEnnDlfgmdCHzcdkMy+g9pDiRLKx6ajsrTfxZpmww
 AOYlqX4VRtEzOlv1hl4SMWx3dDeujxbHNTYrxro5U1rBDWVXta1fITj08IsbVYUYNupfHSP63
 Dt2ZDDgxtUr90NQZOgFKabKK1z/hy56uocVlmn+gDSQFSqA3kKyWDgnB7TMFpWifkWnTjiZzq
 IUhLtBZoNrsq2sYXcqeh1aA6cfQuKpAYG0PZfg/2owFpB1Pi/35FPzQPu33GUQ5b8iP0AKstw
 kT8+AB18kclLSK9tVzO329maqZXyuMOiOkKV9Ja4a3v3lXynNafeek0VJ3hUcsfkozSz+PqEC
 vMF/oNIr83J/a/GFn5YhhWkmNmheA3TAtRsWzeXJ5seM54eXhQcViaY9XKuFTy+ufC3NYZ0FP
 kxDB24U0FcQFUNDFjtl1d8xfMKiiiutD2hKUIrvgmvFvQNyjlO7axR5cE4nnkViQjmatih+24
 gjNaPKxJ8dgSqj2mmNvW07wwwEG9ch9/4EAm7OYI9RoU4ButVgfIVymIKSENRJ5NzZjNpQqPa
 jwA8MtyREWHQtxYFXP3CgtpK8FQkxhF/FSdKcYIq5GuxlSitY2LAZ3PoYBH/bjcpvQoslnmCW
 6CoJKV5VJY+eFRDJZy7JOtF0KKpWYKs/SVXUAKCvUEzgli/i5JNZ+9EEcpyAmjWkmINUaz9qx
 YWDCjo69UZJL5g=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I noticed that sometimes at kernel startup the backtraces did not
included the function names of init functions. Their address were not
resolved to function names and instead only the address was printed.

Debugging shows that the culprit is is_ksym_addr() which is called
by the backtrace functions to check if an address belongs to a function in
the kernel. The problem occurs only for CONFIG_KALLSYMS_ALL=3Dy.

When looking at is_ksym_addr() one can see that for CONFIG_KALLSYMS_ALL=3D=
y
the function only tries to resolve the address via is_kernel() function,
which checks like this:
	if (addr >=3D _stext && addr <=3D _end)
                return 1;
On parisc the init functions are locted before _stext, so this check fails=
.
Other platforms seem to have all functions (including init functions)
behind _stext.

The following patch moves the _stext symbol at the beginning of the
kernel and thus includes the init section. This fixes the check and does
not seem to have any negative side effects on where the kernel mapping
happens in the map_pages() function in arch/parisc/mm/init.c.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux=
.lds.S
index 2769eb991f58..3d208afd15bc 100644
=2D-- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -57,6 +57,8 @@ SECTIONS
 {
 	. =3D KERNEL_BINARY_TEXT_START;

+	_stext =3D .;	/* start of kernel text, includes init code & data */
+
 	__init_begin =3D .;
 	HEAD_TEXT_SECTION
 	MLONGCALL_DISCARD(INIT_TEXT_SECTION(8))
@@ -80,7 +82,6 @@ SECTIONS
 	/* freed after init ends here */

 	_text =3D .;		/* Text and read-only data */
-	_stext =3D .;
 	MLONGCALL_KEEP(INIT_TEXT_SECTION(8))
 	.text ALIGN(PAGE_SIZE) : {
 		TEXT_TEXT
