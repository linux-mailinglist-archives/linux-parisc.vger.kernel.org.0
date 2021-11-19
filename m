Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0920F457896
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Nov 2021 23:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbhKSWY0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Nov 2021 17:24:26 -0500
Received: from mout.gmx.net ([212.227.15.19]:59559 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234568AbhKSWY0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Nov 2021 17:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637360478;
        bh=3MDgLBbI8SD25h3sLgwLmW3+C96q0mb9hzc1fMTcOn4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hcQ8JTBFEtnxhQupNovspUxPLqp9Za9hPAfDrWu/NzVbDJrGhs7G7QoL40NX5qUdD
         HOQEkywBsDGzhiD6ApbEATf7oau79ANXXXwa8BfifbDlMguCpvwAcekVHYDJJqQvHM
         Nso/4287TOuClh06o8a221zHlXSM2tWDW8RS1So8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.164.19]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7i8O-1mbjcC1YEE-014i0i; Fri, 19
 Nov 2021 23:21:18 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 4/4] parisc: Convert PTE lookup to use extru_safe() macro
Date:   Fri, 19 Nov 2021 23:20:42 +0100
Message-Id: <20211119222042.361671-4-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119222042.361671-1-deller@gmx.de>
References: <20211119222042.361671-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/khI+MA3cGIyWemPFF04iNx4p1cOgfBmfNH3HTqzvdi01vySrwn
 BGAhHL4dQksFPlgjVMCcOuPBlUiP1dP8fvSVSYpE0CEEubXnLCAQLwocHnQ0De3ptr6ss+Y
 tqIHT5EMANcfgOe7ix/4K9AUxJhhGqvnGTwFgklI7nDflziE8h6n7p8ktb+ZvleSkj/d8LO
 UABvVggh2kHwn2S9fXiQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ULdo3TFUNuo=:+YN43kYujT62H7mlZsVDPx
 dlPcFWK2khmvn9HqdNz3dZR8e41/H5xHW8dUMyqyKEktT1RReJRTNP3oypv7PK6mmbnXL4I/X
 CWsHS9iS+LDNE6Eui6vNMV1UjwQrebPtSKFDpTbh4qOF7P3GfNjdI3hRPKNgc/z+OztNoefSb
 ZnsZCFAHuf/h6T517mAaYcsIxKm+9oZ4uo9T1b7ogvlbt+voGXWfvXk63BWbRiF1Hv2gLR0WT
 o3VHR+8SYF78TUtblj28JOJV96ECiDXslVpp8Ll77etxv2rrj09nDbwdEowGPsHSo7PWEvzWr
 V8IvQtrwLT6pZDmw1JVWnB+uSTwegyDStCbYgcvgU5W6xxyb8y8cXed5Cga5v8F2WSv+xBMJE
 +s66gQoO5jJJbk2AvDdWRpCakIL6fvWb7GWn5egWjpvJjwPXHWpI2Uixwq79NAhYXNUr4hpqP
 kz2M1g1POOmyboJJa9z1jTcYjmP7bUFMRuT1bQ3zQQD6/lkiISbVhm9xeYzEUynbghOuY6YJD
 kJH61mpHV4JVCPDMl3DqDi+7hxx67A8ZrEF/tu4cjemRGurvCpifApaZy4yYqs2ZTPfwWQsq0
 jrjE21GN046bGqiDk0Bxq1RmQiPhMJgexetyyiG2Dy9oInf57NXbZqJdYDvrulb4cGByf9UvG
 DXd85OctqYA1UruqbH4CFUUYqin2S5Cm/V2+9uwNybxDgxRkvRJ3FYcc9ZwFQEFUr++/+zAfO
 Jc91rxQnEIGVYzWStXkaHRoI9dgNP71jLDtu0byRxbDmeFtf2Cae8E0ckJK56JbK8YpUzbXBj
 ldVaz/xa8nhtFUVRK7li155U0Hs40XfhV9oCzc0QdF9cMPQYOPfp2aLpixQHxWGjKumcuBN8r
 LE/D15cfP4RHHvZC8mHnMUV86G08dFZFML7LNBrEvf1x0KvE1Rs+kLg+osvTMEKUEYcUsQi8V
 An2dsravQCYFRXu25h2JAqj9DDC6YttYJRf3ImrLiKnd0+4vAYTkUReMbus31NlZuC2M+jJSM
 Fo2X6pf+B7J7Ijcjwgj3AXa33fOye1L/fNrLeGHt3K597irgPHUiXNsLr5M7aGW7vqDWineiw
 hQPiT4/qjw6PO0=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Convert the PTE lookup functions to use the safer extru_safe macro.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/entry.S | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 88c188a965d8..6e9cdb269862 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -366,17 +366,9 @@
 	 */
 	.macro		L2_ptep	pmd,pte,index,va,fault
 #if CONFIG_PGTABLE_LEVELS =3D=3D 3
-	extru		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
+	extru_safe	\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
 #else
-# if defined(CONFIG_64BIT)
-	extrd,u		\va,63-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
-  #else
-  # if PAGE_SIZE > 4096
-	extru		\va,31-ASM_PGDIR_SHIFT,32-ASM_PGDIR_SHIFT,\index
-  # else
-	extru		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
-  # endif
-# endif
+	extru_safe	\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
 #endif
 	dep             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 #if CONFIG_PGTABLE_LEVELS < 3
@@ -386,7 +378,7 @@
 	bb,>=3D,n		\pmd,_PxD_PRESENT_BIT,\fault
 	dep		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
 	SHLREG		\pmd,PxD_VALUE_SHIFT,\pmd
-	extru		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
+	extru_safe	\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
 	dep		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd /* pmd is now pte */
 	.endm
=2D-
2.31.1

