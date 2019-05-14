Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6584B1D015
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2019 21:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbfENTlE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 14 May 2019 15:41:04 -0400
Received: from mout.gmx.net ([212.227.15.15]:52839 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbfENTlE (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 14 May 2019 15:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557862856;
        bh=f80EePT+/XL8DKt0zToQgfDrlkRHNQJrWtGqfQ6O8n4=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=C1vrBjqu3Y8gW3AsORaeBKb7NFkEIHnyVSOEBAdaXnDFbMGBq7SbMXNnYUbMnN+jm
         YZ5L1m6IBRUQxcc6nojtuL9XU9ey8gLAbY8osu2pQP7p7Vb9f0hrVA0tMgcqc/ItL7
         EbDVRJ+S1nIWfQNP7EgG0tykeyDMmVz2PqQoi0Es=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.143.159]) by mail.gmx.com
 (mrgmx001 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LhOO8-1gvzNw14ds-00mcSN; Tue, 14 May 2019 21:40:56 +0200
Date:   Tue, 14 May 2019 21:40:53 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [RFC][PATCH] parisc: Allow building 64-bit kernel without
 -mlong-calls compiler option
Message-ID: <20190514194053.GA6635@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:2GzbRq1u3sjOZs/m98F4L2ut9ynoAKwmMKGfPGds40iT8dtDPa1
 7MXqZsuxpwou16oIfjCFaLuy+sdGe9UX1XUwkZRJ+UmUbqIS1/w41g9R6HNLz/54J8h1tUr
 +oT2LVOdqz9OE3QQuK2u1mW78c0RDw7gAr/u0R5MXi3U5Bcd3qvDIUQMbnVwQMCaRgJ7YPP
 vUcOL53kMeXmJBldV45tA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rDpayjJWDVE=:YL9rOi9zZSPThj3/y8TEgx
 +4Pk6Qktp7UsSJres86o2hJAfJQVh71ubyrs3E9t9psGPmBdLhWqcYPdmLTgxF5zRzLGmDDuC
 hokL1pMHVFWFbCNQDOwIe0sJnn0MdW/sRKm711yaeLHtjvCiBQHA8aArXFFUhivDNq/FjhCtS
 a70wC3FGi6IV3f/plx8r3EvJTDw3rfq5EUVbYm8TT0H1CxU61fO/DXf8UjXLi8kDsW2u2ftn8
 f32uNro/aPoukvgdZdqztD/rWU4M1yplN4Bnf4n9hw3lsNQuRGZXeKRB9Nj7hAKkQcaHZQPNZ
 XWvx7hmCmQ5s+sT1jClPpdLrAy++vay+qOB7+Hct0f4Kl9ukWDCg1gV6Ouizi5B0Q7KRFkxRG
 +47t0BXwC86HRU84Hh30PXOfVUq/3QT1RfHhwUMOcbM69urUN2AnWjJ8kUcuXZQXj6/6h5aQa
 aqInTw2Nhd4dBQnNz0L5gwaN4kQZkrMh+denLHxe4BFjwQhJEYsC8Ct1lmSR0LUXF5BmaWvCj
 pkaxA0AwlXT2io/4T0Qg8e2AF4AScnBKJxnDx+YHiOJ6kqDuCrlreITHeV+axvQsctyuoO3Qn
 oK+bhL4cIQ674h1F6+saVJoh6u/E9OADKRoqBpsNzkYFIA+5xM7NdhmBSW0Ae7vy6ULLneSYC
 xl3bNKLSYrMgpo6FItQW4O5NX1s5PbMbNZMGBA/f4FnU0qlNc7FKMEXshbmST6wTR7U8qnF6P
 t1jmnoxgFN4VHiJilNG/aSgD33WfFNbg7pqNNQFyycDdsw7BuPX6kwprHVOvIzPNSK5b3jLeR
 K0ZZkmELEyVX12OQwTx33I8xoST+e6fXYr8skfvoIRfGdHJxi+a0kOiwhJjxFr0RSIO9Ua/AA
 yy1ywTnTdj+cHcUOr8xnWzL2tHHiFdgdp5eGN/USV1n7l3KbsMSCGh7dTbrb0U
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

A 64-bit kernel built without CONFIG_MLONGCALLS (-mlong-calls compiler
option) usually fails to link because of unreachable functions.  Try to
work around that linking issue by moving the *.init and *.exit text
segments closer to the main text segment. With that change those
segments now don't get freed at runtime any longer, but since we in most
cases run with huge-page enabled, we ignore the lost memory in
preference of better performance.

This change will not guarantee that every kernel config will now
sucessfully build with short calls and without linking issues.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index d333570fec13..56a9b6d6e979 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -195,7 +195,8 @@ config PREFETCH

 config MLONGCALLS
 	bool "Enable the -mlong-calls compiler option for big kernels"
-	default y
+	default y if !MODULES || UBSAN || FTRACE
+	default n
 	depends on PA8X00
 	help
 	  If you configure the kernel to include many drivers built-in instead
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux=
.lds.S
index c3b1b9c24ede..cd33b4feacb1 100644
=2D-- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -35,6 +35,15 @@ OUTPUT_FORMAT("elf64-hppa-linux")
 OUTPUT_ARCH(hppa:hppa2.0w)
 #endif

+#define EXIT_TEXT_SECTIONS()	.exit.text : { EXIT_TEXT }
+#if !defined(CONFIG_64BIT) || defined(CONFIG_MLONGCALLS)
+#define MLONGCALL_KEEP(x)
+#define MLONGCALL_DISCARD(x)	x
+#else
+#define MLONGCALL_KEEP(x)	x
+#define MLONGCALL_DISCARD(x)
+#endif
+
 ENTRY(parisc_kernel_start)
 #ifndef CONFIG_64BIT
 jiffies =3D jiffies_64 + 4;
@@ -47,15 +56,11 @@ SECTIONS

 	__init_begin =3D .;
 	HEAD_TEXT_SECTION
-	INIT_TEXT_SECTION(8)
+	MLONGCALL_DISCARD(INIT_TEXT_SECTION(8))

 	. =3D ALIGN(PAGE_SIZE);
 	INIT_DATA_SECTION(PAGE_SIZE)
-	/* we have to discard exit text and such at runtime, not link time */
-	.exit.text :
-	{
-		EXIT_TEXT
-	}
+	MLONGCALL_DISCARD(EXIT_TEXT_SECTIONS())
 	.exit.data :
 	{
 		EXIT_DATA
@@ -73,11 +78,12 @@ SECTIONS

 	_text =3D .;		/* Text and read-only data */
 	_stext =3D .;
+	MLONGCALL_KEEP(INIT_TEXT_SECTION(8))
 	.text ALIGN(PAGE_SIZE) : {
 		TEXT_TEXT
+		LOCK_TEXT
 		SCHED_TEXT
 		CPUIDLE_TEXT
-		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
@@ -92,6 +98,7 @@ SECTIONS
 		*(.lock.text)		/* out-of-line lock text */
 		*(.gnu.warning)
 	}
+	MLONGCALL_KEEP(EXIT_TEXT_SECTIONS())
 	. =3D ALIGN(PAGE_SIZE);
 	_etext =3D .;
 	/* End of text section */
