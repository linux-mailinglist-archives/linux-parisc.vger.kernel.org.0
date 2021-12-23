Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C24747E8DD
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Dec 2021 21:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350278AbhLWUxq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Dec 2021 15:53:46 -0500
Received: from mout.gmx.net ([212.227.15.18]:35053 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350277AbhLWUxq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Dec 2021 15:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1640292820;
        bh=pEAhuovbLdiJZZUrTelZV8cteFGwPBv/83yoUAe3jE0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=XqvwwaBHe26OnKRuA5vGXR48nfmSw8EeNnRcKNmpe53aSPwV6W/vWkr5QlYL5Yvrn
         8gXrTWIqnqQ2vSbDysekSiIYOysJchWDScw2P4OaBwCNOUQCrBI52ehIG4X66HQpnE
         8BS1HcUNWL1dsZ1vQU72o97dD7X5yI2QFlSTwtC4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.187.188]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNbkv-1mqHfM3l75-00P9mh; Thu, 23
 Dec 2021 21:53:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Switch user access functions to signal errors in r29 instead of r8
Date:   Thu, 23 Dec 2021 21:52:46 +0100
Message-Id: <20211223205246.16105-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6XFnTQrI8FTlH8jL4Kv+NJVGnJPEbb9TpG2BOdr/zXDJYiRh8b3
 oqrXGnNdUatAtr/c1gX26d5xtxRxDxqIwLDvilhDMqLIQxyk6ChrNcL95ifqLLGYpsPI/n9
 IZRe8aMgI6DPqj06BDQ2Qxs6al+6hnCmmcNvl2H9uH/o3g/gTfygJD3M5pAKBP0UtHJB1cH
 2g690vDfAvdPjNlEQ1N9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WExa5IWqBKk=:2DJZV2dmnzT6Ls09mHUxq6
 YeZqGx8ylUQRTJ4rKyLC1uxp8RRUa7QMV9uUvKR/9BDG1Tip4seKfI+ShhFQtVHtqrAtME9Sv
 iFBrLm0m/XIm8LbY2S2SqVafFOoPkJCaIV+g4Pm1uzrJSVC2SbAkFejeQB/ZzSkUbs++2NK9P
 pTS6WA8NlDKoVwhpYOXsaWAC8CWbMJdR2JUhMroSTiC6fVU5FHN8bpXUKqAweFSs0W//KAcRz
 CXFq9ZUi9DMeoPhPDpZB3utbTxfVYkdxU5O2dgsgybn8Z/6dTMGWFhooyljQLyOk76lMmHPCH
 gT/SBlZnsuzg9K6/WcdPZ8jB6oc6gxQu4gDnjEWp1O3ld+F+8ssSlh35oOCytAbJRlLE68Lvy
 R+OlTtKEhYNoGQb+6Laq3KPT9Xynd10ukP8DqNoPIgpIMI4q/G0BJqpNf3bTlq3ohaR6DOLgr
 uS+iAnBkhPdHHdlQhtlOVmy+tlPj+DHdf1Wr0DgVzE8JauC2qcZEZTm5yUAajCA+kFafCSyW8
 YFg5bUQ4xilXNwck8Lb0L1OGst8t55KO4AYZRkya8UT4HTdN+/Eq5RmmgZCuE9YK/RT1hA1VX
 FSG5EF2yULunCZtIRxWHhD/heTgqNQyebx1plhhUE8I6QwcR2GIyYdRtV6Qf0DjFGQW/mPJNo
 CvkFwrjj0c7Rrh4I1dCGVVPcH5g+jLoN6seFerIhp9BUwMwIMLcU5UOYWkPi03hB/sskMBzLM
 mJmJqiRwHD74NZO9uJ6Gq3a8NMTn0qjb6MuBa6FBL5U/OdVwBRvuzpP4gVBETUtDGtRp2/aSJ
 W1hnqMSQQ8noSLkZsr1QXCQJE/a4zGEX9Qg6CemmATL0A4bHE59GfvH/+YDmf/vq1xjYYVBHn
 F0TpmJepE4J7K+5jdCRtxIW89f5XfM+XhG9LxBZdEuR4FmRwJr70iF5P6SxWZRmGNkcyLu7m/
 oFerWwJxPscLeno8SgKgmDEKKIuCk787rYYK0Li9ywu6trZblFKlzinJd0/hELgRNBxoMdPJi
 4wYJqI4gYLBEQ0Een8Q6Z+tFrtYfCrzqBrxCZ13AMGTfpSCLj7q0gRdZWN0zabyYrzML5c20h
 y0jFtn8GQ2Nm1o=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Use register r29 instead of register r8 to signal faults when accessing
user memory. In case of faults, the fixup routine will store -EFAULT in
this register.

This change saves up to 752 bytes on a 32bit kernel, partly because the
compiler doesn't need to save and restore the old r8 value on the stack.

bloat-o-meter results for usage with r29 register:
add/remove: 0/0 grow/shrink: 23/86 up/down: 228/-980 (-752)

bloat-o-meter results for usage with r28 register:
add/remove: 0/0 grow/shrink: 28/83 up/down: 296/-956 (-660)

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/uaccess.h | 12 ++++++++----
 arch/parisc/mm/fault.c            |  6 +++---
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/u=
access.h
index 192ad9e11b25..ebf8a845b017 100644
=2D-- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -53,15 +53,18 @@ struct exception_table_entry {
 /*
  * ASM_EXCEPTIONTABLE_ENTRY_EFAULT() creates a special exception table en=
try
  * (with lowest bit set) for which the fault handler in fixup_exception()=
 will
- * load -EFAULT into %r8 for a read or write fault, and zeroes the target
+ * load -EFAULT into %r29 for a read or write fault, and zeroes the targe=
t
  * register in case of a read fault in get_user().
  */
+#define ASM_EXCEPTIONTABLE_REG	29
+#define ASM_EXCEPTIONTABLE_VAR(__variable)		\
+	register long __variable __asm__ ("r29") =3D 0
 #define ASM_EXCEPTIONTABLE_ENTRY_EFAULT( fault_addr, except_addr )\
 	ASM_EXCEPTIONTABLE_ENTRY( fault_addr, except_addr + 1)

 #define __get_user_internal(sr, val, ptr)		\
 ({							\
-	register long __gu_err __asm__ ("r8") =3D 0;	\
+	ASM_EXCEPTIONTABLE_VAR(__gu_err);		\
 							\
 	switch (sizeof(*(ptr))) {			\
 	case 1: __get_user_asm(sr, val, "ldb", ptr); break; \
@@ -131,7 +134,7 @@ struct exception_table_entry {

 #define __put_user_internal(sr, x, ptr)				\
 ({								\
-	register long __pu_err __asm__ ("r8") =3D 0;      	\
+	ASM_EXCEPTIONTABLE_VAR(__pu_err);		      	\
         __typeof__(*(ptr)) __x =3D (__typeof__(*(ptr)))(x);	\
 								\
 	switch (sizeof(*(ptr))) {				\
@@ -168,7 +171,8 @@ struct exception_table_entry {
  * gcc knows about, so there are no aliasing issues. These macros must
  * also be aware that fixups are executed in the context of the fault,
  * and any registers used there must be listed as clobbers.
- * r8 is already listed as err.
+ * The register holding the possible EFAULT error (ASM_EXCEPTIONTABLE_REG=
)
+ * is already listed as input and output register.
  */

 #define __put_user_asm(sr, stx, x, ptr)				\
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 4a6221b869fd..01fd2a32acc6 100644
=2D-- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -148,11 +148,11 @@ int fixup_exception(struct pt_regs *regs)
 		 * Fix up get_user() and put_user().
 		 * ASM_EXCEPTIONTABLE_ENTRY_EFAULT() sets the least-significant
 		 * bit in the relative address of the fixup routine to indicate
-		 * that %r8 should be loaded with -EFAULT to report a userspace
-		 * access error.
+		 * that gr[ASM_EXCEPTIONTABLE_REG] should be loaded with
+		 * -EFAULT to report a userspace access error.
 		 */
 		if (fix->fixup & 1) {
-			regs->gr[8] =3D -EFAULT;
+			regs->gr[ASM_EXCEPTIONTABLE_REG] =3D -EFAULT;

 			/* zero target register for get_user() */
 			if (parisc_acctyp(0, regs->iir) =3D=3D VM_READ) {
=2D-
2.31.1

