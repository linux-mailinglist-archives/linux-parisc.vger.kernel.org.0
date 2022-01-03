Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5057748385A
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jan 2022 22:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiACVah (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jan 2022 16:30:37 -0500
Received: from mout.gmx.net ([212.227.17.21]:43311 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229904AbiACVag (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jan 2022 16:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641245428;
        bh=MFfsDmt/0Mu5piB2skmYk6BFngMK2czpiNdOw2+iOsQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=gaSku1jMbi/sPuNqEQ1ujqoZXfQE7Yb2K3+0z9TTVqF8iDTJt3YzD9ujb6qF4hpQ9
         2xGkq3PqbOr+5fEhuX3Md7fbr/hhoIW15xhtsd+gd2+pSHmXVneDdUAvaHmBBbS29i
         UOA0hnOBopBsUP/qVI5CVBSIVdbowns9FeGW0KOw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.180.103]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sit-1mKcXr2kox-018K7Y; Mon, 03
 Jan 2022 22:30:28 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Whitespace cleanups in pdc.h
Date:   Mon,  3 Jan 2022 22:29:30 +0100
Message-Id: <20220103212930.488929-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TqQVG1+S7E55zeTSKv5O2B2iiRD/ikJvEgbO9XEW9jTTFEQ5KoQ
 vENj6wXQE7yOLldxstaUZAkCRvzfV4/mjZEn+KdZiu+0tnnzZD/b73S0ZReHUvPoa6GX2Ik
 hKbRRIQDBrkS9WRZy5Xq1TXheB8tlO7QEpUnEAae624VzpGJIjIwGCzWIk8yrbIeKMm4JEE
 CE2GzaVbkfCcaeDYqSwhQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jQi5sm9N6IM=:HcNLe7sSWjQbgjQ3Lkr1Hr
 qJ7gTPIqKoVavdjWBm5lvhjMbcuTvvqnvvFPLaVj+IT5aPuKti3+mn6SBOlP/e93PPDIHxhry
 zY+sZpUZjTxeb0XQsBjyuU8ZwlQM5v4MczrOtXTQKlvKuTSHnBEEYcoNx11AI8a3r/acZ5XHQ
 rvc+2UTAaXoiP15Ac3gDOZXgEYV6CeUPuPCsTAX5VZroVSgWWMa3LbOs7sdl/au4X+lhOouuo
 m0V/lKK7ywhWpEgMAX+eFHMCr7hHZ7jGUEe7MrLZ/YmGi+BUeQ9FhY/vUPiPRJFpNlizrM+WB
 PRc8HH8nKBNOTS7F1i67ersZ2hteY1XVB7EBSRW/1I5PUj7hpL1OiT/LMdpT0bXFd1Z8WWv6C
 wfF4w/HEEKcUqwf04kIPw0JIvWioDK9A4aN2FW26RnXfaoNRB1/N+tYHn202b9mXl47uCnwzu
 jDNXEFh9NCC4xPlMyLbiqUSZfNxkoOctK5BEabYwnTN7F7G5VJ93v8L/uKZdmVUh53TjhTK4g
 uTHOOYiyl3TSKyrA5fyEOachVwNkn+OnJuzNZwoQethQPwnjnRJuAzR99cuC4RHjQNjBEd2mq
 KfcT0XQtSA8eDCFyJ2axi29DYBJjMO6M/UFfaTh1u/z9mUQE6+CCOEJoO3TUhMzWT50NyQ+FO
 gBixSOVFZrUOvl9EK0wfvQL02QZJQhwO5rfYBkge1YKMl8eahYc6LjzYGv1OucS5YGdrTF+eF
 HVGYuOi0bHHgibx+ESBU+tFyY4ERjGh5bsUuXuBgJVZskRPtFFujwC5Fh/itQ3fzt9fIg9pC5
 XTfTr3mK3m6I4In9JVykZHbovoLzmRbE22aN5AEpGPZV1qPRXynr38Yx4uups8SWt9u7up4Hc
 yaqXNWO35CLWHfyWXWI5ES2xIx3g0F7VgActMC0tieonZTWtuBadJ1XFullZWBTG61sCh4+92
 osoTCOoiMVAtAWHd/tW/ZZ0LIZcQpTiogH40drLqquvZGskv63Uqn8OZFM0TTvXWt/mxYY1PL
 SgopFaY/sEfgHQ3laQFaAh2+XOg3eoeUDOZvw3l3RyKAhJPPI/WOzKSUz4kFb3UJZD7Z+HdfV
 rVTe1qDCRBYp1U=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Bring contents of pdc.h in sync with the file in SeaBIOS-hppa.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/uapi/asm/pdc.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi=
/asm/pdc.h
index acc633c15722..cc6f7d1b8f16 100644
=2D-- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -4,7 +4,7 @@

 /*
  *	PDC return values ...
- *	All PDC calls return a subset of these errors.
+ *	All PDC calls return a subset of these errors.
  */

 #define PDC_WARN		  3	/* Call completed with a warning */
@@ -165,7 +165,7 @@
 #define PDC_PSW_GET_DEFAULTS	1	/* Return defaults              */
 #define PDC_PSW_SET_DEFAULTS	2	/* Set default                  */
 #define PDC_PSW_ENDIAN_BIT	1	/* set for big endian           */
-#define PDC_PSW_WIDE_BIT	2	/* set for wide mode            */
+#define PDC_PSW_WIDE_BIT	2	/* set for wide mode            */

 #define PDC_SYSTEM_MAP	22		/* find system modules		*/
 #define PDC_FIND_MODULE 	0
@@ -274,7 +274,7 @@
 #define PDC_PCI_PCI_INT_ROUTE_SIZE	13
 #define PDC_PCI_GET_INT_TBL_SIZE	PDC_PCI_PCI_INT_ROUTE_SIZE
 #define PDC_PCI_PCI_INT_ROUTE		14
-#define PDC_PCI_GET_INT_TBL		PDC_PCI_PCI_INT_ROUTE
+#define PDC_PCI_GET_INT_TBL		PDC_PCI_PCI_INT_ROUTE
 #define PDC_PCI_READ_MON_TYPE		15
 #define PDC_PCI_WRITE_MON_TYPE		16

@@ -345,7 +345,7 @@

 /* constants for PDC_CHASSIS */
 #define OSTAT_OFF		0
-#define OSTAT_FLT		1
+#define OSTAT_FLT		1
 #define OSTAT_TEST		2
 #define OSTAT_INIT		3
 #define OSTAT_SHUT		4
@@ -403,7 +403,7 @@ struct zeropage {
 	int	vec_pad1[6];

 	/* [0x040] reserved processor dependent */
-	int	pad0[112];
+	int	pad0[112];              /* in QEMU pad0[0] holds "SeaBIOS\0" */

 	/* [0x200] reserved */
 	int	pad1[84];
=2D-
2.31.1

