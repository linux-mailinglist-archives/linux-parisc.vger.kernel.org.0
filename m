Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF08A485AF1
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jan 2022 22:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244570AbiAEVrC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jan 2022 16:47:02 -0500
Received: from mout.gmx.net ([212.227.17.21]:55371 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244571AbiAEVrC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jan 2022 16:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641419211;
        bh=JjsMQVwUjfnZmUKbRog7p/dqUI080zIvcWJtx3Yme5o=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=f+sq9muTEBi5brp//I4mcnsW7VpXMN4HoTONvMhynmSdRsnom/WCtsKO/uOncmXyN
         NcaBtqmwn5QJj86kIs+ta4z8EHJG/OIHrpylFqAdXTZEcZQR4jJlpfreUcOT+1Qjv4
         3LU7Gd2wM/f9aJactyArqNKoBN21TpbAu1zU8L+0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.146.36]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6DWi-1n31CF1FKC-006fmm; Wed, 05
 Jan 2022 22:46:51 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 1/2] Subject: parisc: Fix pdc_toc_pim_11 and pdc_toc_pim_20 structs
Date:   Wed,  5 Jan 2022 22:45:51 +0100
Message-Id: <20220105214552.590606-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wyk3ItVsgJmR5rSgWq3pY9XJ93lASDXqHjhROlMKS/vbCfLhLBZ
 ApCS6dxuG9oSClBvx+6vO70rm2gYLTiLFqdcgSwT/GoWVInoImPIDLVPeZmNqP0OMyaxgBd
 rUwvJr250Bub4tWjR8Zq/zmTlZF79coD1rr3SUo1mXNyPCtL67eEDwj/SfvCc4xWTqw5N38
 E2gKHcqQ4FTeDj/FTcB7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WVfLHwljGDk=:jGvyKDzUFg/Jed1miNkUa8
 LNHP8WRco33un1LOiK4ntO8qutSdZtG0Xi0ZSjZg9tLn65fDP1AEtYNRMJ02gAPwYRGHdUkCE
 bRVeRGGhWjfWlygw4qK5a+pGOfv2TmUvHzPSeCEkZjv4u/jnauL8V7ORrkOfoY6YwXznl5iLa
 VT8ow7iazUdOmpHOaOSevEau3sREzi91SfTtxqiRAPIVutmPSb2RZr+QbgCM280l1U03P2mqw
 A2dG6FuV4uD0iXLBQj0K2aoaxdWE3EKo1jW2MEaV/Xiu7+Bo+2c7xFXiXPPB7UW+VCpgAohNL
 o1jf3BoIsBOgNPplRMMcJrx8WRyh7ITfBEfmM4MBypE7g2VkoBes9AtTsvD4qP0GUDD/cr3yE
 0Js1jXLs/wjgKDXBfQUbidyWQ7cAXcsb5JTYh2otzcP7mtvMYbvOThI9GnH+9lqHlg9j4wm0T
 gKLiI+yxWTHpuTJn9FKaxoAYyxICrUA0CZAYERyjGg3g2Vr6N5h8SfSAre0buDMhsB2yhNzI/
 xDdlUsqWLhlHbHZ1nG7iFI8SeIoCI/9uFrZJRRo5vsC0o1TKs4uU2QoszlYht/H6xk5WFrhK8
 BJUOEdBbMNA2uvD7DxXw2j73G9nmZu8QrOsPdU7eCnpHRwW1uK2pa6eQaY66kGCJMFgEfsWmj
 6pJQTxeCTFYyW9BP38lNWrVcx4vVFKAIoFzzeHQC+1EHfyYt8WFOfm8PwWpdi7dv9h98p3VUg
 mcIyVrdXU9r3leoktmuLz5ljCd2MMdeWR2QyVoaLYnjynumQ/F+zYsk09tZRvW1iPK1i4dwb0
 /u8l/9s5rYHdMLAgMqoCnAiDDTYyfd0MoNy/YGjB96+Vr9sQOWBD7KrKKZvVqKM6Sl4/n/zcv
 nQF6SVxZRNRh8Jpr2iiAwSiKPrHokz6r+z6BR33wZK7lNaktVAgPO3/3qyXp69DMmMWZcrFl5
 9/cEPTW6hOG0J58G/MwtpAz9ysObRxgrqZU4DyLcFaYRkDFpAGP8BRqz5fidLEwqmFu73KXQw
 rckliti0Js4kz+NQOFQqqZ2king+Pp3HWTsr0VtTi6vWyufyywxKK4fSkgHPhHaZebRBi3dxZ
 XMWAPnJcB/a090=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The definitions for pdc_toc_pim_11 and pdc_toc_pim_20 structs are wrong
since they include an entry for a hversion version field which isn't
in the specification.

Fix this and clean up some whitespaces so that the whole file will be in
sync with it's copy in the SeaBIOS-hppa sources.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/uapi/asm/pdc.h | 32 +++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi=
/asm/pdc.h
index acc633c15722..e794e143ec5f 100644
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
@@ -691,6 +691,22 @@ struct pdc_hpmc_pim_20 { /* PDC_PIM */
 	unsigned long long fr[32];
 };

+struct pim_cpu_state_cf {
+	union {
+	unsigned int
+		iqv : 1,	/* IIA queue Valid */
+		iqf : 1,	/* IIA queue Failure */
+		ipv : 1,	/* IPRs Valid */
+		grv : 1,	/* GRs Valid */
+		crv : 1,	/* CRs Valid */
+		srv : 1,	/* SRs Valid */
+		trv : 1,	/* CR24 through CR31 valid */
+		pad : 24,	/* reserved */
+		td  : 1;	/* TOC did not cause any damage to the system state */
+	unsigned int val;
+	};
+};
+
 struct pdc_toc_pim_11 {
 	unsigned int gr[32];
 	unsigned int cr[32];
@@ -698,8 +714,7 @@ struct pdc_toc_pim_11 {
 	unsigned int iasq_back;
 	unsigned int iaoq_back;
 	unsigned int check_type;
-	unsigned int hversion;
-	unsigned int cpu_state;
+	struct pim_cpu_state_cf cpu_state;
 };

 struct pdc_toc_pim_20 {
@@ -709,8 +724,7 @@ struct pdc_toc_pim_20 {
 	unsigned long long iasq_back;
 	unsigned long long iaoq_back;
 	unsigned int check_type;
-	unsigned int hversion;
-	unsigned int cpu_state;
+	struct pim_cpu_state_cf cpu_state;
 };

 #endif /* !defined(__ASSEMBLY__) */
=2D-
2.31.1

