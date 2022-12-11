Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC7836495F5
	for <lists+linux-parisc@lfdr.de>; Sun, 11 Dec 2022 20:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiLKTFS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 11 Dec 2022 14:05:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiLKTFQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 11 Dec 2022 14:05:16 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257A265C3
        for <linux-parisc@vger.kernel.org>; Sun, 11 Dec 2022 11:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1670785506; bh=dCnQyw+lLnIlfcfitrXfrV9ISJerZ/ziCrXDbXWxwr8=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=NMozHgkcR+o/E5Yay5hexUdlR4RWEwa4gzIH/XVAyb2w8dc5EKziX18rZ00sQEi/E
         FOLzUh0i5y4gIUD8fmiaoSd1Mz7gkGhNVdJm6cSKJyjC5LDce/qHJ3aOxap5LiOoSo
         D52gqoGZN3OUVHj2cZCwUV+4m2V7wxVukZJfph7EMpyRrTAzyxShFa7Apeir6DC0jI
         5XMsR3i+U5TEojSg4PehY0A62UVrCF2PuE8IS23RhtyjtNHekE+Hyen/HbIzIRRCaX
         OvROiYDVIlhk1SItBiljwAvknYyNC5FWxVBa/MEJPiwMZZpiLOdv3ce3OGZOuECmes
         tsqLR38S7q4Eg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.144.19]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU9Z-1oQjAX07hD-00edAe; Sun, 11
 Dec 2022 20:05:06 +0100
Date:   Sun, 11 Dec 2022 20:05:02 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [RFC] [PATCH v2] parisc: Align parisc MADV_XXX constants with all
 other architectures
Message-ID: <Y5Yp3tdDepkY9Q6u@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:QtK2TyuRaMgM5qhhkMq6PqZwPLmd36sKCLaUSgAjqg/G1Tpz+4x
 L1Mzr6STRRVc7kBZyzRLvp5fijTFSSx7R0wjstlxuV8ovvmUsT215EmzpEHrSmLr6r/5qj+
 N6Os5nDy9sIczmPQuUGypJ2uLZGtEveu1z7vwQpsulmtQ0q3FM4nTjMLmqIFTcl0IxK49TN
 CV5/BhFsUuDVapRi9DJAQ==
UI-OutboundReport: notjunk:1;M01:P0:LoEKFveoW1w=;oeL7DldaxC+N5X52Lh/k9Dk1TQL
 pZSQ8mjK6JXxpTH86qB0RjJxfbdwVcKhJW+I8U7uYZyeSWBZK01gXOeXoNpXOdHA6r70D30ed
 qnSyBFS8Ml3TU08Fqya2FvEZrs6d813VL2Fs4trQ22MtFNJbGd8yP/oS+lpYRotjxMu3+MzHP
 0QHK/du6lEjBokbUAATyNc5H+Yn678LEwHB+ImLaLhpJRG5NaIekrPwpnUy/nrslONjxAEdJw
 aEffNubi218/pb/bmcPQZSOQSgQnfLisIQCyN+Vnvi4ZaSSt/8VsG7ETfv1GxpH+bgpTVOPVN
 mqJm7rnRw130s3svgq9huQC+3j4xMWqFK/lEMbJEoNFxZhcnTG0oSZwwSrmtFHt9puHrkZrJs
 Rhj3BAQnI4N0QaGjTJZdsc/CjJTiihA1aSB6T6sc+Q9/7OtMD3HKwBQYj7VboNdIaqRgM9GOD
 U2qORH49PUV1ySo92B4vzwn+ku+JYfYYm+9YqjmfNJ9s+9vlCNIj14tu0wCwsQ6CdDFHjYFFe
 uiYaDepuvH5Es8Wv3r5ljP6MzmYZx9nR/pl7SmYFCGwglZnJ/4U5bkqFcSdjzxveydDhmL4Z0
 l/kPNOakIZrfvBZRvvB5A8KqdcM6bh6cX1D96EEeJ88qvICSoJyazeyb8N935jy7hPAPp0vka
 Pj4bLEREBw9iutq1r1CrMRjtmDglCoZ/+roRELAWjS+KOySL6L6pDdYMKMmsDtE6ox1NYluEX
 00Ydd/vAU+oEKZJdo4I7XGlqdxBRrRNnlWqBP5LfBHx8HcPsVXcfnwz8ZbhdUQjbzUmOk15vy
 85ifYvUWKVfpGxOWBwYuo2pY3tJ1crRsJa2VtRUUUpKL3wO5M14u0aQ+66R1kFdrUcY+v8vck
 cBRLX2cC7aVTt9Vw1JlwZ4hrfuxQFUxqP8y31EiXtHoHMSkBkw1o4A6PvgA2Fg2I0U6n9tkPr
 6pmX8Q==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

=46rom 60c95270ef643fdda92cb594b78646a7508039d4 Mon Sep 17 00:00:00 2001
From: Helge Deller <deller@gmx.de>
Date: Sun, 11 Dec 2022 19:50:20 +0100

Adjust some MADV_XXX constants to be in sync what their values are on
all other platforms. There is currently no reason to have an own
numbering on parisc, but it requires workarounds in many userspace
sources (e.g. glibc, qemu, ...) - which are often forgotten and thus
introduce bugs and different behaviour on parisc.

A wrapper avoids an ABI breakage for existing userspace applications by
translating any old values to the new ones, so this change allows us to
move over all programs to the new ABI over time.

Signed-off-by: Helge Deller <deller@gmx.de>

v2: Add wrapper to avoid ABI breakage

diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uap=
i/asm/mman.h
index 22133a6a506e..68c44f99bc93 100644
=2D-- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -49,6 +49,19 @@
 #define MADV_DONTFORK	10		/* don't inherit across fork */
 #define MADV_DOFORK	11		/* do inherit across fork */

+#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
+#define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
+
+#define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
+#define MADV_NOHUGEPAGE 15		/* Not worth backing with hugepages */
+
+#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
+					   overrides the coredump filter bits */
+#define MADV_DODUMP	17		/* Clear the MADV_NODUMP flag */
+
+#define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
+#define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
+
 #define MADV_COLD	20		/* deactivate these pages */
 #define MADV_PAGEOUT	21		/* reclaim these pages */

@@ -57,27 +70,13 @@

 #define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages t=
oo */

-#define MADV_MERGEABLE   65		/* KSM may merge identical pages */
-#define MADV_UNMERGEABLE 66		/* KSM may not merge identical pages */
-
-#define MADV_HUGEPAGE	67		/* Worth backing with hugepages */
-#define MADV_NOHUGEPAGE	68		/* Not worth backing with hugepages */
-
-#define MADV_DONTDUMP   69		/* Explicity exclude from the core dump,
-					   overrides the coredump filter bits */
-#define MADV_DODUMP	70		/* Clear the MADV_NODUMP flag */
-
-#define MADV_WIPEONFORK 71		/* Zero memory on fork, child only */
-#define MADV_KEEPONFORK 72		/* Undo MADV_WIPEONFORK */
-
-#define MADV_COLLAPSE	73		/* Synchronous hugepage collapse */
+#define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */

 #define MADV_HWPOISON     100		/* poison a page for testing */
 #define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */

 /* compatibility flags */
 #define MAP_FILE	0
-#define MAP_VARIABLE	0

 #define PKEY_DISABLE_ACCESS	0x1
 #define PKEY_DISABLE_WRITE	0x2
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_pari=
sc.c
index 848b0702005d..bcd317871840 100644
=2D-- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -465,3 +465,31 @@ asmlinkage long parisc_inotify_init1(int flags)
 	flags =3D FIX_O_NONBLOCK(flags);
 	return sys_inotify_init1(flags);
 }
+
+/*
+ * madvise() wrapper
+ *
+ * Up to kernel v6.0 parisc had different values than all other
+ * platforms for the MADV_xxx flags listed below.
+ * To keep binary compatibility with existing userspace programs we
+ * translate here the former values to the new values.
+ *
+ * XXX: Remove this wrapper in year 2025 (or later)?
+ */
+
+asmlinkage notrace long parisc_madvise(unsigned long start, size_t len_in=
, int behavior)
+{
+	switch (behavior) {
+	case 65: behavior =3D MADV_MERGEABLE;	break;
+	case 66: behavior =3D MADV_UNMERGEABLE;	break;
+	case 67: behavior =3D MADV_HUGEPAGE;	break;
+	case 68: behavior =3D MADV_NOHUGEPAGE;	break;
+	case 69: behavior =3D MADV_DONTDUMP;	break;
+	case 70: behavior =3D MADV_DODUMP;	break;
+	case 71: behavior =3D MADV_WIPEONFORK;	break;
+	case 72: behavior =3D MADV_KEEPONFORK;	break;
+	case 73: behavior =3D MADV_COLLAPSE;	break;
+	}
+
+	return sys_madvise(start, len_in, behavior);
+}
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/=
syscalls/syscall.tbl
index 8a99c998da9b..0e42fceb2d5e 100644
=2D-- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -131,7 +131,7 @@
 116	common	sysinfo			sys_sysinfo			compat_sys_sysinfo
 117	common	shutdown		sys_shutdown
 118	common	fsync			sys_fsync
-119	common	madvise			sys_madvise
+119	common	madvise			parisc_madvise
 120	common	clone			sys_clone_wrapper
 121	common	setdomainname		sys_setdomainname
 122	common	sendfile		sys_sendfile			compat_sys_sendfile
diff --git a/tools/arch/parisc/include/uapi/asm/mman.h b/tools/arch/parisc=
/include/uapi/asm/mman.h
index 506c06a6536f..4cc88a642e10 100644
=2D-- a/tools/arch/parisc/include/uapi/asm/mman.h
+++ b/tools/arch/parisc/include/uapi/asm/mman.h
@@ -1,20 +1,20 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef TOOLS_ARCH_PARISC_UAPI_ASM_MMAN_FIX_H
 #define TOOLS_ARCH_PARISC_UAPI_ASM_MMAN_FIX_H
-#define MADV_DODUMP	70
+#define MADV_DODUMP	17
 #define MADV_DOFORK	11
-#define MADV_DONTDUMP   69
+#define MADV_DONTDUMP   16
 #define MADV_DONTFORK	10
 #define MADV_DONTNEED   4
 #define MADV_FREE	8
-#define MADV_HUGEPAGE	67
-#define MADV_MERGEABLE   65
-#define MADV_NOHUGEPAGE	68
+#define MADV_HUGEPAGE	14
+#define MADV_MERGEABLE  12
+#define MADV_NOHUGEPAGE 15
 #define MADV_NORMAL     0
 #define MADV_RANDOM     1
 #define MADV_REMOVE	9
 #define MADV_SEQUENTIAL 2
-#define MADV_UNMERGEABLE 66
+#define MADV_UNMERGEABLE 13
 #define MADV_WILLNEED   3
 #define MAP_ANONYMOUS	0x10
 #define MAP_DENYWRITE	0x0800
diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
index 6cefb4315d75..a5d49b3b6a09 100644
=2D-- a/tools/perf/bench/bench.h
+++ b/tools/perf/bench/bench.h
@@ -10,25 +10,13 @@ extern struct timeval bench__start, bench__end, bench_=
_runtime;
  * The madvise transparent hugepage constants were added in glibc
  * 2.13. For compatibility with older versions of glibc, define these
  * tokens if they are not already defined.
- *
- * PA-RISC uses different madvise values from other architectures and
- * needs to be special-cased.
  */
-#ifdef __hppa__
-# ifndef MADV_HUGEPAGE
-#  define MADV_HUGEPAGE		67
-# endif
-# ifndef MADV_NOHUGEPAGE
-#  define MADV_NOHUGEPAGE	68
-# endif
-#else
 # ifndef MADV_HUGEPAGE
 #  define MADV_HUGEPAGE		14
 # endif
 # ifndef MADV_NOHUGEPAGE
 #  define MADV_NOHUGEPAGE	15
 # endif
-#endif

 int bench_numa(int argc, const char **argv);
 int bench_sched_messaging(int argc, const char **argv);
