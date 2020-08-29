Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11242566E2
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Aug 2020 12:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgH2Kvm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Aug 2020 06:51:42 -0400
Received: from mout.gmx.net ([212.227.17.22]:38761 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728012AbgH2Kv1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Aug 2020 06:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1598698276;
        bh=+7AuoRab6GmcN6o+bOGBlklqP8bgznOrAlyhh8+LeIo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=QoLxG9f+hOmAYKGpLsGisfGQYyOHzbn7MjABXBVSogBEpxkU592Ux/q7LTNsE3USD
         HtRZt7gfNCyN8QxsapuO2z+kotdqN1OtJ+8JK1BwLsB5U9JwbGng2F0xiqflDW3FtV
         Iuq5t35xiavR9P2cwKwI7fS87P7bgp+fXFMhTuqk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.169.105]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLi8m-1juRbI2T7g-00HjOK; Sat, 29
 Aug 2020 12:51:16 +0200
Date:   Sat, 29 Aug 2020 12:51:12 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Drop HP-UX specifix fcntl and signal flags
Message-ID: <20200829105112.GA863@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:OjLtdIFI6CYh8EOLP/Lx8gzLm4FT9+QYJtHbSPYpgcujs2rjAf3
 3mQp8SKGkoaE8at5UwVGkPSlBkAK/GV3Tp77m8t++PbPQpTgB2M2ep9Ap0Jy0O0XZzHxvoq
 q44URI1P9aEnt9KISxF6RmBWLO8gH8vES1IIKvqrVpg5Eotw16nMKoY3ISC9GVbDosCU5WF
 2XlLMkvzixLawQE9mgdOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QFbue/CI2lk=:cKj4J6Gi3NiGNVf9IEg7p6
 dR5rO8mVj2oi3Gg8kWuQkVRMDpUBsTn35Auzd6vn4I8+u10epvgMXpECQ66vUT+6BmtLF7sD9
 ZF8H7NdBFNm7ptvo+WM68HkSQNLW66XY1d7H4rt0+/hfFvHLmTz8x8tDgkx/H00dkB2bECwDp
 YvaBFMdW4t2P9g/AExR1lQeLVDrFtrxZxp9eHS2tzcOzo6OVFzyjI0RqMgXgCEebBuTpUMt3S
 /RZWJdD0a+Ilm701x8D+p5d3xhnfgOO6x5TWzEYOrUuQ+qTgWQPmee1AxaZIUhJpj9ZULI2ab
 0z+7iW/kwkVQ87a7xq/pA2fncT1jKWsaUMlmI9e7wA5w0lTWTPDXvzaPanV4ey0OQ0uQ6WAe4
 w3BCnFajHpFdqQUswRLqQRzwE9/5iLdhs45KuNmn4XJFtSEPGaaG0sbPrsc8Hq7R/xpRciJEX
 j+WDIMbmwyiL9KxTkekhNYEd4HyhhgQpwYLC4njESsSFsi1r+yYzoEWgQdoonK2nRmMSPBkuQ
 hr2YRvsP+DHzFJKBoZmHgqOtS6ZtPoRdtkJk5QGzxNx/u2nFPomlwV0VszGlafHaK54HT7blQ
 PiuxlnQll1kA/xttPuNOhvVMFkYQaiETGaceo3QSLMLmjYKw4qi6G95ykbAaiMd2AcZmsv+xx
 /5wu0sGWDPyeDsfyd4x5NvqBrdOw4QdbHikp0cO+uWPSSc6HdJocrf806plZtWdnq00ksXxpb
 8w7cqEEqME2Ufnt0cf2RhmbOz5gJAGm39vnQrGtqqmswSTlr5L+t5BeT1rFaqZsZWmZXv+myf
 DrVb3iYxLfS/3ZnRqj2W62dqmwkaqLiGdr4rhFCczpeuz3L3jX24dvE6fTc+HAMrjO/f9vHLM
 ZtwNAq/V+WTcEeoXD9iiggh+c5SS2yYPTc4YrcKCYVQo3MXVhTNRKl+NO4FS6CPyZxxYK7+FZ
 LhI52ue4c/2qBxZgkJ9mBIUbLVc1LcHrYFzFxFeCkpl0yZR5X6hafB7LSjevwq41DWG6JvP2Z
 xWiO2uTa9fcsCyRDjonRN9wAF4CbCdStmHcTja3Wc7caugmYLT303+gMZ3AXBTmROr/yqVyls
 7ScGblJtV47Yh3n8ZHk5M3HJ9AVtvTLFprXSz77/IX6Qx0sEBSjgdDjiM8j7vZSbDCIJH8xj9
 j5Gz6yaT7CELa+trFzZ75NfIqSRx75VsR5nO+BH1W/HMSPueZs+Tet3/bxCA7D/88mRfeLNIe
 HxluWjKodx14GD0SP
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Those flags are nowhere used in the Linux kernel and were added when we
still wanted to support HP-UX in a compat mode. Since we never will
support HP-UX, drop those flags.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/fcntl.h b/arch/parisc/include/ua=
pi/asm/fcntl.h
index 03ce20e5ad7d..4289ee732c4c 100644
=2D-- a/arch/parisc/include/uapi/asm/fcntl.h
+++ b/arch/parisc/include/uapi/asm/fcntl.h
@@ -3,7 +3,6 @@
 #define _PARISC_FCNTL_H

 #define O_APPEND	000000010
-#define O_BLKSEEK	000000100 /* HPUX only */
 #define O_CREAT		000000400 /* not fcntl */
 #define O_EXCL		000002000 /* not fcntl */
 #define O_LARGEFILE	000004000
@@ -12,13 +11,11 @@
 #define O_NONBLOCK	000200004 /* HPUX has separate NDELAY & NONBLOCK */
 #define O_NOCTTY	000400000 /* not fcntl */
 #define O_DSYNC		001000000 /* HPUX only */
-#define O_RSYNC		002000000 /* HPUX only */
 #define O_NOATIME	004000000
 #define O_CLOEXEC	010000000 /* set close_on_exec */

 #define O_DIRECTORY	000010000 /* must be a directory */
 #define O_NOFOLLOW	000000200 /* don't follow links */
-#define O_INVISIBLE	004000000 /* invisible I/O, for DMAPI/XDSM */

 #define O_PATH		020000000
 #define __O_TMPFILE	040000000
diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/u=
api/asm/signal.h
index d38563a394f2..045fde6d2fac 100644
=2D-- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -61,7 +61,6 @@
 #define SA_NODEFER	0x00000020
 #define SA_RESTART	0x00000040
 #define SA_NOCLDWAIT	0x00000080
-#define _SA_SIGGFAULT	0x00000100 /* HPUX */

 #define SA_NOMASK	SA_NODEFER
 #define SA_ONESHOT	SA_RESETHAND
