Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2200B64935A
	for <lists+linux-parisc@lfdr.de>; Sun, 11 Dec 2022 10:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiLKJlk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 11 Dec 2022 04:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLKJli (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 11 Dec 2022 04:41:38 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD688101F9
        for <linux-parisc@vger.kernel.org>; Sun, 11 Dec 2022 01:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1670751684; bh=UJ+iQHJm0x49MdX4/SV2vTQFSZEsO6wv91AkoN09peE=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=qn7Dn2ZF3ciz3Fe9/lR8JR+ZJg5UK3wQWl/pQtS305TiUG1zmurdM21zzMOt3NC0p
         uO00EwsWgo+3t7qf67p94HhYlZ24tZ8h2vHEsJa82VqOEcC89tzsC2NULV5jft5loX
         VvNdkzYwxfqocYvh3r60Qaw6bH31wT1gbU8hYgsq0gzcG/f0fqOT5RR8EOlcwOpGS1
         g1PhYeiMoyuMZfJisiQZGwivQ6BA4AlkSaj8yn4Rr7reDSA6p3Y2Eq+ZU2S5vKtru4
         zDtwTyZc/nOQSPe2/eUz/Je7zWDjLB0iTqunJF+HzF9M5VICFyqFABzz+XlmYdKzvl
         ZHmGngnqTSAJg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([92.116.144.19]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6Zq-1oSEzy25hm-00hi90; Sun, 11
 Dec 2022 10:41:24 +0100
Date:   Sun, 11 Dec 2022 10:41:17 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [RFC] [PATCH] parisc: Align parisc MADV_XXX constants with all other
 architectures
Message-ID: <Y5WlvT3V+2Bp4e29@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Ss/rTTVJ1/sD2VOsVC3vHOZ6SoTWz8JOXwUha7ve23l7k2vYzJw
 I7pfkjEA35j4mlLvPEbFJVFfXZDIV0uP3qY/PjAb3+oPQgR/5vB3Wycsv1pdva8lDNw1bQl
 W8JJ4gTp904VxpZZvdoqobNmiG3E6l1zV2w3KskOQjqgLapmKajGk0/AH3fBn/WAuzqYhhL
 tOp/9vrF7O6DGKrHfxFRQ==
UI-OutboundReport: notjunk:1;M01:P0:zzhYuGAkqmI=;rgDrvgsNOJvZa7OjQlxKnY2W+e+
 M85e9ElTxqyMz0Xaww2X3uChpU6Qe8Fk7dh2+1XGHAWSQLDBEGks4jNzWUA14CCFjp3vYNjsn
 B47d4yxEvkDGn3X8WXI0kUQQrkoq+bL0ldIMVwh0izzT0p3CE5bWMjxzVrwodmyXol1fpkIoQ
 4kf8n6vVwdiNJmOZbNNm2Nf9aFItSDIpnq5S03kreJycwSh4F+UCM+hDz0crLS9QNX7PCem2l
 kQGLwkHprvMlCeV/HvUlECb0lYF7l5Q4u4ok5FfENqmUuVoF23lOOEMwmr4iShJm66jt+EKwI
 pkoCu5EkLb96ym+Ne1/Ct2OftWiwJjgDr2/L3MCU4vOc5LB07Affn5/vjzCfZaVT8UpkIo9EU
 5YJaRojKmJObeg3aky8WoYcaZy/tb3+nFRJX5Ydw4WxA/9F0TQZJ6NflyD1FoJbnoxFFlyp86
 ELgAneOEc9J3epx4slaNPvl21OVNc61GQI4fQ9l7RD2MTPCngBswYuox2qOTrZfPzPWL9pnLp
 n9T56CLEt2LX92jlcthOz2eMfZAXMNtsRA5WvsOmz3CUBVjR6Zbt5CKPqcTV4yfpdAPtQ1Ylc
 bsobAjpRXcIHhRZOAYjuj/qdkW4KVxbU3Zkm/osme5Pua0/spJh12baP3nFkOwJ38kmK80Npk
 PUSxzUQWDkj7ev3m+URQ299tKMJcWI1EHnPvzGwOKdlGGT83PI3JlO0LcPxwN7I1xSqLVhRu/
 OLpqtUVgShnxTLMU9/tsNWJCNkil5JVY4hr8eOL2ELOGhY4QRO3gIybMpWe1dZrAtNsDcZEEK
 Jb32BoBVBLV3DDEUkBkfJZZLQ+0HODhGA4scorxmkv8FftA0sTjiB3yFz1sJL9tCr7kOowU5Y
 itHiV13RlWX8r9bKFwnw6+zBg5Vs5ixC4De34TDDSBMy9kIluMVdgv905IDinHXDlG3n+EnpA
 TTj65A==
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

This patch does introduce an ABI breakage.

It adjusts some MADV_XXX constants to be in sync what their values are
on all other platforms. There is currently no reason to have an own
numbering on parisc, but due to this own numbering workarounds were
required in many userspace sources (e.g. glibc, qemu, ...) which were
often forgotten.

With this change, existing programs will now suddenly receive an -EINVAL
return code on those specific madvise() calls.  But since madvise() is
just used to give the kernel an advice about the address range, a
successfull call shouldn't be required and will probably be ignored by
userspace. Thus the implication of this change is probably small, but
allows parisc to stay in sync with other platforms in future and helps
to keep parisc specific patches in userspace small.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uap=
i/asm/mman.h
index 22133a6a506e..234bc30866a9 100644
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

@@ -57,21 +70,6 @@

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
-
 #define MADV_HWPOISON     100		/* poison a page for testing */
 #define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */

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
