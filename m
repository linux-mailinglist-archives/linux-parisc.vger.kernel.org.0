Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 205BF6FE5E
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Jul 2019 13:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729849AbfGVLID (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 Jul 2019 07:08:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35664 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729843AbfGVLIB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 Jul 2019 07:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=a+bQj1O+XRjfOgK19pvPFmYDIh6VgLh2sOF6Gxqi2+E=; b=WEV9kenwMJfXXQFoAu1jII0oV3
        fZluZEm6iCvyJy0DYk2C/hV7zIFleSaux6waquQdpDY6cPahrcX8kcvTV2uIDkm4B+SaQKHo7CIJH
        chp8vYXExfijeRlEw1y2evaHoR4apGas/I/ftdr4UWZiKNEs95vHvx5XRzo3AM0BEzP4H3FOyxUCX
        gofbwRhY8SAfX0PQ6FgJjOBszMUNTldqmq2qcUz6g5LhPI418gpruGzYoTchvZ61z0ehjcj07M/jO
        myzIKk79IdaZ4UHkE4XT5oKDmQk28goKB3BrnekJaC/mftyQiJQ3NllextFfHHytLDfNDoiY5Aj6V
        kDhnISNQ==;
Received: from 177.157.124.3.dynamic.adsl.gvt.net.br ([177.157.124.3] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpWAe-00024w-MN; Mon, 22 Jul 2019 11:07:56 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hpWAa-000413-7e; Mon, 22 Jul 2019 08:07:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org,
        linux-parisc@vger.kernel.org
Subject: [PATCH 09/22] docs: parisc: convert to ReST and add to documentation body
Date:   Mon, 22 Jul 2019 08:07:36 -0300
Message-Id: <d93490565271fbf6b2e2bea40ec0c2381c86aac5.1563792334.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563792333.git.mchehab+samsung@kernel.org>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Manually convert the two PA-RISC documents to ReST, adding them
to the Linux documentation body.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/index.rst                       |  1 +
 .../parisc/{debugging => debugging.rst}       |  7 +++
 Documentation/parisc/index.rst                | 18 ++++++
 .../parisc/{registers => registers.rst}       | 59 +++++++++++++------
 4 files changed, 68 insertions(+), 17 deletions(-)
 rename Documentation/parisc/{debugging => debugging.rst} (94%)
 create mode 100644 Documentation/parisc/index.rst
 rename Documentation/parisc/{registers => registers.rst} (70%)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index ef9543c2516d..9bb08d272bd5 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -149,6 +149,7 @@ implementation.
    ia64/index
    m68k/index
    powerpc/index
+   parisc/index
    riscv/index
    s390/index
    sh/index
diff --git a/Documentation/parisc/debugging b/Documentation/parisc/debugging.rst
similarity index 94%
rename from Documentation/parisc/debugging
rename to Documentation/parisc/debugging.rst
index 7d75223fa18d..de1b60402c5b 100644
--- a/Documentation/parisc/debugging
+++ b/Documentation/parisc/debugging.rst
@@ -1,8 +1,13 @@
+=================
+PA-RISC Debugging
+=================
+
 okay, here are some hints for debugging the lower-level parts of
 linux/parisc.
 
 
 1. Absolute addresses
+=====================
 
 A lot of the assembly code currently runs in real mode, which means
 absolute addresses are used instead of virtual addresses as in the
@@ -12,6 +17,7 @@ currently).
 
 
 2. HPMCs
+========
 
 When real-mode code tries to access non-existent memory, you'll get
 an HPMC instead of a kernel oops.  To debug an HPMC, try to find
@@ -27,6 +33,7 @@ access it.
 
 
 3. Q bit fun
+============
 
 Certain, very critical code has to clear the Q bit in the PSW.  What
 happens when the Q bit is cleared is the CPU does not update the
diff --git a/Documentation/parisc/index.rst b/Documentation/parisc/index.rst
new file mode 100644
index 000000000000..aa3ee0470425
--- /dev/null
+++ b/Documentation/parisc/index.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================
+PA-RISC Architecture
+====================
+
+.. toctree::
+   :maxdepth: 2
+
+   debugging
+   registers
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/parisc/registers b/Documentation/parisc/registers.rst
similarity index 70%
rename from Documentation/parisc/registers
rename to Documentation/parisc/registers.rst
index 10c7d1730f5d..59c8ecf3e856 100644
--- a/Documentation/parisc/registers
+++ b/Documentation/parisc/registers.rst
@@ -1,11 +1,16 @@
+================================
 Register Usage for Linux/PA-RISC
+================================
 
 [ an asterisk is used for planned usage which is currently unimplemented ]
 
-	General Registers as specified by ABI
+General Registers as specified by ABI
+=====================================
 
-	Control Registers
+Control Registers
+-----------------
 
+===============================	===============================================
 CR 0 (Recovery Counter)		used for ptrace
 CR 1-CR 7(undefined)		unused
 CR 8 (Protection ID)		per-process value*
@@ -29,26 +34,35 @@ CR28 (TR 4)			not used
 CR29 (TR 5)			not used
 CR30 (TR 6)			current / 0
 CR31 (TR 7)			Temporary register, used in various places
+===============================	===============================================
 
-	Space Registers (kernel mode)
+Space Registers (kernel mode)
+-----------------------------
 
+===============================	===============================================
 SR0				temporary space register
 SR4-SR7 			set to 0
 SR1				temporary space register
 SR2				kernel should not clobber this
 SR3				used for userspace accesses (current process)
+===============================	===============================================
 
-	Space Registers (user mode)
+Space Registers (user mode)
+---------------------------
 
+===============================	===============================================
 SR0				temporary space register
 SR1                             temporary space register
 SR2                             holds space of linux gateway page
 SR3                             holds user address space value while in kernel
 SR4-SR7                         Defines short address space for user/kernel
+===============================	===============================================
 
 
-	Processor Status Word
+Processor Status Word
+---------------------
 
+===============================	===============================================
 W (64-bit addresses)		0
 E (Little-endian)		0
 S (Secure Interval Timer)	0
@@ -69,15 +83,19 @@ Q (collect interruption state)	1 (0 in code directly preceding an rfi)
 P (Protection Identifiers)	1*
 D (Data address translation)	1, 0 while executing real-mode code
 I (external interrupt mask)	used by cli()/sti() macros
+===============================	===============================================
 
-	"Invisible" Registers
+"Invisible" Registers
+---------------------
 
+===============================	===============================================
 PSW default W value		0
 PSW default E value		0
 Shadow Registers		used by interruption handler code
 TOC enable bit			1
+===============================	===============================================
 
-=========================================================================
+-------------------------------------------------------------------------
 
 The PA-RISC architecture defines 7 registers as "shadow registers".
 Those are used in RETURN FROM INTERRUPTION AND RESTORE instruction to reduce
@@ -85,7 +103,8 @@ the state save and restore time by eliminating the need for general register
 (GR) saves and restores in interruption handlers.
 Shadow registers are the GRs 1, 8, 9, 16, 17, 24, and 25.
 
-=========================================================================
+-------------------------------------------------------------------------
+
 Register usage notes, originally from John Marvin, with some additional
 notes from Randolph Chung.
 
@@ -96,10 +115,12 @@ course, you need to save them if you care about them, before calling
 another procedure. Some of the above registers do have special meanings
 that you should be aware of:
 
-    r1: The addil instruction is hardwired to place its result in r1,
+    r1:
+	The addil instruction is hardwired to place its result in r1,
 	so if you use that instruction be aware of that.
 
-    r2: This is the return pointer. In general you don't want to
+    r2:
+	This is the return pointer. In general you don't want to
 	use this, since you need the pointer to get back to your
 	caller. However, it is grouped with this set of registers
 	since the caller can't rely on the value being the same
@@ -107,23 +128,27 @@ that you should be aware of:
 	and return through that register after trashing r2, and
 	that should not cause a problem for the calling routine.
 
-    r19-r22: these are generally regarded as temporary registers.
+    r19-r22:
+	these are generally regarded as temporary registers.
 	Note that in 64 bit they are arg7-arg4.
 
-    r23-r26: these are arg3-arg0, i.e. you can use them if you
+    r23-r26:
+	these are arg3-arg0, i.e. you can use them if you
 	don't care about the values that were passed in anymore.
 
-    r28,r29: are ret0 and ret1. They are what you pass return values
+    r28,r29:
+	are ret0 and ret1. They are what you pass return values
 	in. r28 is the primary return. When returning small structures
 	r29 may also be used to pass data back to the caller.
 
-    r30: stack pointer
+    r30:
+	stack pointer
 
-    r31: the ble instruction puts the return pointer in here.
+    r31:
+	the ble instruction puts the return pointer in here.
 
 
-r3-r18,r27,r30 need to be saved and restored. r3-r18 are just
+    r3-r18,r27,r30 need to be saved and restored. r3-r18 are just
     general purpose registers. r27 is the data pointer, and is
     used to make references to global variables easier. r30 is
     the stack pointer.
-
-- 
2.21.0

