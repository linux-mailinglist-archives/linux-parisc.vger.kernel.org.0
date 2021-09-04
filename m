Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0CC400D4B
	for <lists+linux-parisc@lfdr.de>; Sun,  5 Sep 2021 00:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbhIDWFB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 4 Sep 2021 18:05:01 -0400
Received: from mout.gmx.net ([212.227.15.15]:44429 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235233AbhIDWFB (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 4 Sep 2021 18:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630793030;
        bh=CB54RDKnkf701WjPNX5oWT7t6ZDuaztyYDbfruo+ku0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Y025S/u5oNMimPblIpmNNrzp+0S1C/s3ccm9BEDkdRwo+N1wVPJdkeUNn7sva3aMc
         CwcgT7Y9lGgEwuYNmSAZ5BdPySCXCRl9XCPGbVTWssDfMBbxfV7bY9QG58d6bN8biS
         tFt4YWw8lFbSF/mehGqv/PipdZ2I3Xbnke4L0Pm8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.187.121.82]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MkYXs-1mpbfX3zJu-00m37o; Sun, 05 Sep 2021 00:03:50 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH] parisc: Drop strnlen_useric() in favour of generic version
Date:   Sun,  5 Sep 2021 00:02:13 +0200
Message-Id: <20210904220213.34504-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IDWdLKM0j2tG8N7CE73wSbUBSsqNuCliRXwGraWJjfkcIxI1OX3
 A4LOh4UGXGsXijQuId0ttDtj2rF3pqbL/GcCXYOasl91jQF3GcowFEx5yx343cti2LHPajz
 4C+hVeOAuulOH4mA2tNYLhpFGbUUGN8K0FVYatAbIolavICtn64Nr9WZg5Ht4+FwF2LrmLN
 /+Y7fSkejAQDRXVgN0AYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Blk7mGBVHsE=:I6k0/o9ljc6kzzBuQGQVeU
 AvTVumSYqKST82CLFViprvoyyICNH33EblTvSzHcQGA3RW+R4ALJxCa5EbC6ZpfDE3+bZuepg
 AVMWRYzHcog7+P065DAGoIPvNjpo5KSuNi6rxBzfCoflZrAOS/mYVZ1WqAo2LFsAbzzIskvNj
 8Qzgak1H7/Q7FGG6sH30rhcd4P10TMSfldh0zWFJSwD74QH8Voy85fw0l7+TtU5sP2nIp0Jpy
 0dtuys67/pIDA0w76cKiTLgt2DLVKfvcmQUJ9/cH1KuZgftVvwZR9ShMKEjRkIEV9aWz+tEws
 TaQVjzqf005bTWFyAT3a2Q1hfw169bgJFaW1KgseUlWnSYkUqQXvQL0VtLGI8hY4kNHgG9V9F
 YaeBhMdvwlswHPnRKZJwBelULwcw5uiCbb7reMERF+nXqJSYYGKZT3r2vzXcAsemqWg1dAo9S
 IoYVuUSQ/DpELDABDswrXnq8MAB6ZFv+tye5yWEYTwNIyzE1eo7xBuoKkxjT+wjCGrpKwoJ19
 QaDL1iZWCs1EVmM+maV4dgaEE+ldOZd10sA93u5oncqFexfm5WHD6EcSGcCwMpVCzPLJ/SW5+
 nUZMXUyoI9cKY6qbPE3tqjTCJI59pJq8aaox1e3ymLlCmIcTRkkUwTvW8dPerYoyN+D0Ryx6n
 WV3UeGSB4OwPtji1c5FOQ2Hiq/Sx+bNBRQHQd3t71BQyGlst6NXqlw98RFPwIG+ApkxI+Q9US
 2d2EKxC/5/TZ6dhfU1a02pEq0pMMU3W7IuXUW+IsG4sET+GhEMIbvKoqlqMk5mU5nV0axsCSa
 ifR946S1BzIygr9PMt2FSM+SAVo3I3rhoF//p+WVxJDwueUiLcOIUcf6K3craJLCpCDjjv3vN
 NGIsWYBIltgILCgTmbVF+sFxViETy1Q30a0Sxy1tZr60B1TIr77Z8PBMZVEXB8meSGu+bYoi8
 AJyII+jZnb8qzrZxIJTDGn2ZyTlQrzppcaN0R91zjDnonJuqdmFwIiNfRPBWkt82tzpJQGJ7O
 SFeGZDfdyzUhJJG3iZXBAOKdCfuJSo7WkMe6IKhvhbH3wNp4qNmoDQ3xdAf7hUfr/EAMjTcME
 fZHTxXsw7bb0CSNHcdQfmZPclfer1HFOlgm
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

As suggested by Arnd Bergmann, drop the parisc version of
strnlen_useric() and switch to the generic version.

user_addr_max() was wrong too, fix it by using TASK_SIZE.

Cc: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig               |  1 -
 arch/parisc/include/asm/uaccess.h |  5 ++---
 arch/parisc/kernel/parisc_ksyms.c |  1 -
 arch/parisc/lib/lusercopy.S       | 34 -------------------------------
 4 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 95d4bbf4e455..3ae71994399c 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -10,7 +10,6 @@ config PARISC
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
-	select ARCH_HAS_STRNLEN_USER
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_HUGETLBFS if PA20
 	select ARCH_SUPPORTS_MEMORY_FAILURE
diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/u=
access.h
index ed2cd4fb479b..2442ed2929ae 100644
=2D-- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -201,13 +201,12 @@ struct exception_table_entry {

 extern long strncpy_from_user(char *, const char __user *, long);
 extern unsigned lclear_user(void __user *, unsigned long);
-extern long lstrnlen_user(const char __user *, long);
+extern __must_check long strnlen_user(const char __user *src, long n);
 /*
  * Complex access routines -- macros
  */
-#define user_addr_max() (~0UL)
+#define user_addr_max() (uaccess_kernel() ? ~0UL : TASK_SIZE)

-#define strnlen_user lstrnlen_user
 #define clear_user lclear_user
 #define __clear_user lclear_user

diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc=
_ksyms.c
index e8a6a751dfd8..00297e8e1c88 100644
=2D-- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -32,7 +32,6 @@ EXPORT_SYMBOL(__xchg64);

 #include <linux/uaccess.h>
 EXPORT_SYMBOL(lclear_user);
-EXPORT_SYMBOL(lstrnlen_user);

 #ifndef CONFIG_64BIT
 /* Needed so insmod can set dp value */
diff --git a/arch/parisc/lib/lusercopy.S b/arch/parisc/lib/lusercopy.S
index 36d6a8638ead..0aad5ce89f4d 100644
=2D-- a/arch/parisc/lib/lusercopy.S
+++ b/arch/parisc/lib/lusercopy.S
@@ -67,40 +67,6 @@ $lclu_done:
 ENDPROC_CFI(lclear_user)


-	/*
-	 * long lstrnlen_user(char *s, long n)
-	 *
-	 * Returns 0 if exception before zero byte or reaching N,
-	 *         N+1 if N would be exceeded,
-	 *         else strlen + 1 (i.e. includes zero byte).
-	 */
-
-ENTRY_CFI(lstrnlen_user)
-	comib,=3D     0,%r25,$lslen_nzero
-	copy	    %r26,%r24
-	get_sr
-1:      ldbs,ma     1(%sr1,%r26),%r1
-$lslen_loop:
-	comib,=3D,n   0,%r1,$lslen_done
-	addib,<>    -1,%r25,$lslen_loop
-2:      ldbs,ma     1(%sr1,%r26),%r1
-$lslen_done:
-	bv          %r0(%r2)
-	sub	    %r26,%r24,%r28
-
-$lslen_nzero:
-	b           $lslen_done
-	ldo         1(%r26),%r26 /* special case for N =3D=3D 0 */
-
-3:      b	    $lslen_done
-	copy        %r24,%r26    /* reset r26 so 0 is returned on fault */
-
-	ASM_EXCEPTIONTABLE_ENTRY(1b,3b)
-	ASM_EXCEPTIONTABLE_ENTRY(2b,3b)
-
-ENDPROC_CFI(lstrnlen_user)
-
-
 /*
  * unsigned long pa_memcpy(void *dstp, const void *srcp, unsigned long le=
n)
  *
=2D-
2.31.1

