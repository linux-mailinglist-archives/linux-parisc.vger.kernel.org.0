Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1122E28A328
	for <lists+linux-parisc@lfdr.de>; Sun, 11 Oct 2020 01:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390504AbgJJW51 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 10 Oct 2020 18:57:27 -0400
Received: from mout.gmx.net ([212.227.15.19]:48011 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730722AbgJJWBa (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 10 Oct 2020 18:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602367287;
        bh=zOQWhE2SfLflRUOJNnJIACK+GIcZgQjz8BvTaNfmIe0=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=R1SSMfNGg+jrreUeepYKRdaMrx4HpqqlJZvrnYd22uKGP5BZDzDWB/8jHTJkNgSAv
         9sAEdpjKeyxp0q1BPjAwNH3EFSHICS3K77qMfbSjOzzU5DiBA3AAEJEF7lAVt8zXI8
         6KbCC2epnRHphbpCzHbcfVjfVGVehi7wjrgAQKKc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.183.219]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKKh-1kh0wl2dFB-00Fi2J; Sat, 10
 Oct 2020 23:54:34 +0200
Date:   Sat, 10 Oct 2020 23:54:31 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add MAP_UNINITIALIZED define
Message-ID: <20201010215431.GA30936@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:R4fY0L2bOamhBARlhLQi47dnMwBGWgZudMSxmNlvgmMbh6dezPb
 OdKj8jtsMqSFD0WIwKuBVe8J8Ng0p8Z+l/GvNBc9/NXbk9O3Q64900Gz3xTssHLfTnmUVds
 UNo0QM5i0INbPs8Kl9RHVLWJNsAJ9+LVAbeoELu5wJWzSpelUIW0CtwE7B7eHxbphgj/IZH
 I/tIFDSCFgHzaQdR66H3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bfjuKkzi8Y4=:esIENfFUs1UtoSPfHrfALI
 5udS1zRJeHCfO8GHM6yg1K7Uh3Yw1DKVVg6SD42m4XtSdbzya1K2nS/cVqPfiIbs8F9O8iAcw
 OjMHjEoqfsiFlw+rWPajnxG5VCE2BOnsOdUALoHSaGrlMQTcaY2EcrDelaRnkwsHlwGgZA8o2
 xKbEokO/Cd5MiyJDGTmHtSdYMp8vyIBo4Pe2ZAtd7vPj+vfWaa/Tuf1MTyIgKBc/YyOW56qDB
 jtBOmqPz9ZHtj3+OwmbSoMC1WNlJ/Zfo+KtRVKedKBWcd9DVR5kOT4dzIReVBQzuALuLaXrnQ
 F51oJ8jUHB+tYD5io6aNOPLyJtwjZmzVnkFi07nkiHeuXA4BHfITpTU+GEDENSALDN5rjIcJK
 Zu/AwXcSICTMzbouRPwwexT+I7GDN5axVi9XQ2e7XbafuEb96r9XXytPZpD1RijtqQ+im7dtx
 JmL5cfLUaAx+Im1kVduIiVAXZzxjvWAvJrJwUovHzlDEERdo/CLgBR+il1k5ShsWzWE+fhmCG
 OGTYV4mYTTWl7CX6PVrcEFPk/6wAJlg3QIuSD4fxprZXZtByZmL7v65kxgR9JLnX25a8kpAYf
 9TW38/jL/vdY1UeWMJA38y3LvfQnG4fe1bko3BIBSONUNTitg83rFefbOslFNme5P2rSJaUJK
 bmWk8Lo5BJLDsxFrSxSdrwTKlPVwizHa4GupgPJcx/Y5mDRvf1xInvNyftM7oekn/4Mdr40p5
 lrMyNKgnE53e6KFxnZh0hHv+G3l++sWAVWtxskI3MBnaor5RouhXij8dD8eYuC9I6psMa7Ced
 oHa7X0rAdJRqdRQbQK5PQIkC8Gv9xYk0YuS51cCF3S4vQt5alh2VZVuDueIO4hkcXT4MBXxns
 g7f3n+3vbL3kbQjFRW+BUQW0Lwv7XPIUNDVWjN86yEtrBBrWlKQepnv5nHKKjwCitdJ8ygw0J
 IpQHb8uawh0JKT6DREWoR0MSIdd4jVOPm+VbRQdhhF/4soq/RSdPHBYG/sI3bEntuX1OU1KiC
 KQFHYGUatwjdxyeZdcikfYFdIMdQQjlxo4vmFONFssJkcpBuPo5STsN2D4apAH++VtU022E/D
 /Xt+4E9QqQQ4Znw52Jq2gwB+s9xKHw+nuH5CkwT2NRYL5q853KNse99lShh8ax70Igsxn0OKP
 /KelUnrs4gxT8FKnS/QbW69NqUhIEjvqrhQQ3FqYsOLlKjFegU2fBWJSTQqL1UZJnLGT6HoXF
 MANYBmwLND+YYmXEs
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Define MAP_UNINITIALIZED and use same value as other architectures.
Fixes build of debian foot package.

Suggested-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uap=
i/asm/mman.h
index 6fd8871e4081..d828b293b6de 100644
=2D-- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -25,6 +25,8 @@
 #define MAP_STACK	0x40000		/* give out an address that is best suited for=
 process/thread stacks */
 #define MAP_HUGETLB	0x80000		/* create a huge page mapping */
 #define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap und=
erlying mapping */
+#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could b=
e
+					 * uninitialized */

 #define MS_SYNC		1		/* synchronous memory sync */
 #define MS_ASYNC	2		/* sync memory asynchronously */
diff --git a/tools/arch/parisc/include/uapi/asm/mman.h b/tools/arch/parisc=
/include/uapi/asm/mman.h
index f9fd1325f5bd..c7af0f2292fc 100644
=2D-- a/tools/arch/parisc/include/uapi/asm/mman.h
+++ b/tools/arch/parisc/include/uapi/asm/mman.h
@@ -39,6 +39,5 @@
 #define MADV_SOFT_OFFLINE 101
 /* MAP_32BIT is undefined on parisc, fix it for perf */
 #define MAP_32BIT	0
-/* MAP_UNINITIALIZED is undefined on parisc, fix it for perf */
-#define MAP_UNINITIALIZED	0
+#define MAP_UNINITIALIZED 0x4000000
 #endif
