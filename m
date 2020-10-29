Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F3F29F68E
	for <lists+linux-parisc@lfdr.de>; Thu, 29 Oct 2020 22:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgJ2VBR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 29 Oct 2020 17:01:17 -0400
Received: from mout.gmx.net ([212.227.15.19]:51829 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbgJ2VBR (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 29 Oct 2020 17:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1604005268;
        bh=+D9f1kL4Qw0d56ncgJfyjRLZS1Gw03QpGiswUjN/pCc=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=l72WFYABXDsnVxNILoNSb/PfnNxlGUDdyXexUIOJLFn0LEicciPnRcSF6mBIE7if6
         OzMjYE6CeY7yEZfo1KO3eLbZes3MnpONtPF0Ho0NVNhk+tfiESpQgfVHJ0xc4JTxk+
         /rDC3fdrC5eBBadd6te8GwMhxnsSBeK/G20z9lik=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.183.86]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzf6-1ky7vi1vhS-00Qzz7; Thu, 29
 Oct 2020 22:01:08 +0100
Date:   Thu, 29 Oct 2020 22:01:06 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Use _TIF_USER_WORK_MASK in entry.S
Message-ID: <20201029210106.GA12104@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:8ghDZx/2ZALz7LCvGQbsr4dpdUausVUFllAPhSfNVac73b8V6Zk
 XNlGnkPDx9jhkv9sLPei2IZdzur9a1Jrk0DiRL3PXpybAScAzVmXqiFMfGgiD2QKy4ikATx
 JUH0ZEj8XjxMyoFvc8eAAGcIHs1wuh0bqThIRd4Fc/+abpbu1fQsdUcOoKdlJtZbDpaMML3
 4+FLttGAKzp6TuvLMEfmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:69/SKzUM3TE=:RlUIWOgLrea3ydJJjMSpoX
 oJkeC1fhqsRIUFYEGAPksQt8oF6EscP6sIeaLCqztxx965Vvsv1uab5GT8Owniy1v4+pUXlZm
 H9SmxkvTfqMOuvZgakU0Zrp9kplMCzak+LefsSyw/DfE9qatka7r6V80aGeVTGF/lhEM4NCG2
 5mWSOez19VxOAbL11E+PkiD3jR7kY9akQxh5pu34JF1YQzXbIeThLYziflGe7OVtk6uiugPk6
 QscTYXux1tW/CrU5izRF3QEITRRV2Xm6tMlOybH2M/2yk5gc8sDLz66tw2gwFj5UR2Ndey8aV
 DtJcS4yeXO+i0odDlKeBqZCnCJQqIQwFhijcBfm5LKLt9DnnG1CHzOBIOP6crgqv18WC2PGHN
 FMavnDugwxm+IDGf6WQkSiHA2P0zeKssShJYoM+h/zoQ06kwJf7XDhIQw88Pqrgfx8KU7A+G+
 hVUkwKj87eBC9P2U2Dt7cWFrbfOUx7dTaiPd3FJRAD1Z26I642vHAr9f2nb5aSjYk6YYvifFk
 3Fa9bgrAAe9iV65+VmCm9pxrLCbMb5YUFDl0KGWCRiklL9zlWlF23XesFO7HKbxNN1gAtHpJd
 y4WA/eehVHcV/GRTozP10D4Gfy6TgRHluznj6rq9vCY3ji0y6EA/5MDwq4NNntzyt0o3J4dnc
 I+2uXd2hJV98EQM7XwaCSm4unAoUEuESdFtNOTCeQnQ9QxuFaUAWD86SXaQOqu2ODjBZFTjSV
 C+60lpNYRb2DAA8DQFKS5TzGwi6G68gJvuWpxs52l+DRVYKziDNqt2IyN/Ex+6g9UcVNJ5aCd
 TIV4ZJqQAZaM7RIhiifuIyq2QWnRDWm9twgcqCcEY3hav4atUd+R7g3gCh7ljwNnPdcKQTiGp
 9RxksFFsDvtd1EO8XHfg==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The constant _TIF_USER_WORK_MASK will get extended by additional flags
in the future, so check against the bits set in this mask - with the
exception of _TIF_NEED_RESCHED which was tested a few lines above.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index f6f28e41bb5e..beba9816cc6c 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -887,7 +887,7 @@ intr_check_sig:
 	/* As above */
 	mfctl   %cr30,%r1
 	LDREG	TI_FLAGS(%r1),%r19
-	ldi	(_TIF_SIGPENDING|_TIF_NOTIFY_RESUME), %r20
+	ldi	(_TIF_USER_WORK_MASK & ~_TIF_NEED_RESCHED), %r20
 	and,COND(<>)	%r19, %r20, %r0
 	b,n	intr_restore	/* skip past if we've nothing to do */

@@ -1810,7 +1810,7 @@ syscall_check_resched:
 	.import do_signal,code
 syscall_check_sig:
 	LDREG	TI_FLAGS-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r19
-	ldi	(_TIF_SIGPENDING|_TIF_NOTIFY_RESUME), %r26
+	ldi	(_TIF_USER_WORK_MASK & ~_TIF_NEED_RESCHED), %r26
 	and,COND(<>)	%r19, %r26, %r0
 	b,n	syscall_restore	/* skip past if we've nothing to do */

