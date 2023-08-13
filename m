Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358CF77A5DC
	for <lists+linux-parisc@lfdr.de>; Sun, 13 Aug 2023 11:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjHMJtT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 13 Aug 2023 05:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjHMJtS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 13 Aug 2023 05:49:18 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF21E10CE
        for <linux-parisc@vger.kernel.org>; Sun, 13 Aug 2023 02:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691920144; x=1692524944; i=deller@gmx.de;
 bh=xAHgr8ZWuDOzyd59E4gGR+tGDZ72q47NJU6MS+iKPgQ=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=pQQ2qVhoz8R0AKrSEBM/kpoUkMQTcm5L92nYR0nA/GamdzQ0urzyTD6jntDubEXxc5w539Y
 eBgtJjm1+af4aaFylBMmlNo9lPWOxzXCPj6eyPsWRKwY3ggaAaIgWFqzqutvCTEcwYamGWrb8
 4+ox4zDPU0LZlyosqv3v644x1kaTt4o/YxP6bMQyUMY/UyFU3SyJQVCOOk3RdLHqjoAojlVh0
 8al7cUzarUejmDg3x9MOeby3Ks/c7LGbFEh1JO8nbpXvK1jBmgbuDsE+pGj0TBnGfXJLHisak
 /ph7xf4zptLdfA4wzNc6TBLKNbA7Dom7NX1QaxKA9LFYXOZaKePg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.146.141]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zFZ-1pjSmh3EzD-0152tg; Sun, 13
 Aug 2023 11:49:04 +0200
Date:   Sun, 13 Aug 2023 11:49:03 +0200
From:   Helge Deller <deller@gmx.de>
To:     Sam James <sam@gentoo.org>, linux-parisc@vger.kernel.org
Subject: [PATCH] Fix CONFIG_TLB_PTLOCK to work with lightweight spinlock
 checks
Message-ID: <ZNinD9QbRUn6BSiR@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:gLBeTn2j8M5eSdkH+xkNqvSyp7ZLCNI/qqjopXZrPcMucfzHNE1
 j3RromPVIUkYyt22ZU07IgYs+lOZ0WRO97iamKh7ouYIiy1tygQw9N51Lw/9bsfFybnwvht
 hz+rLP6teOQLv3GVYI04p5ke6kQ3O+5Gv6Yrvn+01WD6Kl3q9GWtqEbJx0Wv4fJlgDylcNi
 u18LIFSW6OUgJRUNHUNVg==
UI-OutboundReport: notjunk:1;M01:P0:8Yw2HeqRF/g=;KLheVPkk7Y+nRD94Nssy6vQUNLx
 mzOMRPeSdPwz1E+M/yxDVHk94cddixvJERU0zWi89wa9L0csay2oYTLdYvL5cf7Ha2ykmfdDh
 W5U19Esc3iq68dxY1gLJQSrhb7y8yZ+imkW9f8y7DOEB533ofiYTloG7opmuSLwkMSCZy/jVC
 6qTbP5JdIRtbbbbHS5CwVh19ANW8bOQD/2ZkcVDLSFHq2oA0UiTBYI3I9duh7RVUF86BZe9hg
 e6y8MLf4MG8CPDRFezb5XfrIfM37fLDVmuBh+WFh0JhRjDMQJo6KL0BavJEeVn28jQm8m1X9A
 v/kvddE48SLxljPDDW9ekIkF34WB62ExqJQIY5NqmSvvHHRk0aT9xtdToAS+SIECLBKrWF7Xp
 33j9PDtV8PkwD7ha0OIUqZ/l7jvIcsmXGGURMSdqvIYAzdwfaQUPP9UVsdjL8pSqoeAgsLm/J
 u3Ze+H3r6uLVR00nJ+QOLIOwgD6pfKelM4PXH1jOu3fBwsMojzz9DBOy0IsssjPDSwjyXqRa+
 7WwBcu/l0N/0aYWDP2euKSt0id8LWu57weYxYE9EEjrpLyCed7y1IwNyVsN6RhreKB/8G60ix
 B6QgKmn9TKg93PgSVDdgN7+x+QGSmf13keA7XF2nHWUxby193kzXoUx2gCvPv9EnPuLX612g/
 8oTeP2NbTIumW+Xv6OMlMCY5orpn5B8ufbjDJW9qQMzOSmjMJRAZkN13HwsHuOtnY7DU1PztQ
 oCtmlTExjUsjo6QyROTnzK0ws+f39z9tqTxe0ox0PrFj8GPHqIFUr+d3s4JpdsKJYb3E/tkFc
 lUF7ooxg/PJV8b3sovOuhNVLKsg+OGdyC1p7KpUj626PD6RrYvXleCpnOt6kNk3GQTec/YvLA
 Cf0Z5r5P+tp/+Zn2FKPg2vhrUy5VZPqKGp7Meecp1Yz8ilnZ0FaEE+GWBXrLVn9al7TdugpS/
 xhfj0apgNf2bZI+r0Be1aZPpWB8=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

For the TLB_PTLOCK checks we used an optimization to store the spc
register into the spinlock to unlock it. This optimization works as
long as the lightweight spinlock checks (CONFIG_LIGHTWEIGHT_SPINLOCK_CHECK=
)
aren't enabled, because they really check if the lock word is zero or
__ARCH_SPIN_LOCK_UNLOCKED_VAL and abort with a kernel crash
("Spinlock was trashed") otherwise.

Drop that optimization to make it possible to activate both checks
at the same time.

Noticed-by: Sam James <sam@gentoo.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v6.4+
Fixes: 15e64ef6520e ("parisc: Add lightweight spinlock checks")

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 0e5ebfe8d9d2..bddf9c905c01 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -25,6 +25,7 @@
 #include <asm/traps.h>
 #include <asm/thread_info.h>
 #include <asm/alternative.h>
+#include <asm/spinlock_types.h>

 #include <linux/linkage.h>
 #include <linux/pgtable.h>
@@ -415,24 +416,22 @@
 	.endm

 	/* Release page_table_lock without reloading lock address.
-	   Note that the values in the register spc are limited to
-	   NR_SPACE_IDS (262144). Thus, the stw instruction always
-	   stores a nonzero value even when register spc is 64 bits.
 	   We use an ordered store to ensure all prior accesses are
 	   performed prior to releasing the lock. */
-	.macro		ptl_unlock0	spc,tmp
+	.macro		ptl_unlock0	spc,tmp,tmp2
 #ifdef CONFIG_TLB_PTLOCK
-98:	or,COND(=3D)	%r0,\spc,%r0
-	stw,ma		\spc,0(\tmp)
+98:	ldi		__ARCH_SPIN_LOCK_UNLOCKED_VAL, \tmp2
+	or,COND(=3D)	%r0,\spc,%r0
+	stw,ma		\tmp2,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	.endm

 	/* Release page_table_lock. */
-	.macro		ptl_unlock1	spc,tmp
+	.macro		ptl_unlock1	spc,tmp,tmp2
 #ifdef CONFIG_TLB_PTLOCK
 98:	get_ptl		\tmp
-	ptl_unlock0	\spc,\tmp
+	ptl_unlock0	\spc,\tmp,\tmp2
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	.endm
@@ -1125,7 +1124,7 @@ dtlb_miss_20w:

 	idtlbt          pte,prot

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1151,7 +1150,7 @@ nadtlb_miss_20w:

 	idtlbt          pte,prot

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1185,7 +1184,7 @@ dtlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1218,7 +1217,7 @@ nadtlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1247,7 +1246,7 @@ dtlb_miss_20:

 	idtlbt          pte,prot

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1275,7 +1274,7 @@ nadtlb_miss_20:

 	idtlbt		pte,prot

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1320,7 +1319,7 @@ itlb_miss_20w:

 	iitlbt          pte,prot

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1344,7 +1343,7 @@ naitlb_miss_20w:

 	iitlbt          pte,prot

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1378,7 +1377,7 @@ itlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1402,7 +1401,7 @@ naitlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1432,7 +1431,7 @@ itlb_miss_20:

 	iitlbt          pte,prot

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1452,7 +1451,7 @@ naitlb_miss_20:

 	iitlbt          pte,prot

-	ptl_unlock1	spc,t0
+	ptl_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1482,7 +1481,7 @@ dbit_trap_20w:

 	idtlbt          pte,prot

-	ptl_unlock0	spc,t0
+	ptl_unlock0	spc,t0,t1
 	rfir
 	nop
 #else
@@ -1508,7 +1507,7 @@ dbit_trap_11:

 	mtsp            t1, %sr1     /* Restore sr1 */

-	ptl_unlock0	spc,t0
+	ptl_unlock0	spc,t0,t1
 	rfir
 	nop

@@ -1528,7 +1527,7 @@ dbit_trap_20:

 	idtlbt		pte,prot

-	ptl_unlock0	spc,t0
+	ptl_unlock0	spc,t0,t1
 	rfir
 	nop
 #endif
