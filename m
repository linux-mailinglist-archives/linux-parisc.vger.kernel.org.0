Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0335A134F9
	for <lists+linux-parisc@lfdr.de>; Fri,  3 May 2019 23:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbfECVkW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 3 May 2019 17:40:22 -0400
Received: from mout.gmx.net ([212.227.17.22]:34919 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726402AbfECVkW (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 3 May 2019 17:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1556919610;
        bh=Tlgp5M0pq9wjGIEI0eOmQVJr1659y9rcuuk6geajQNk=;
        h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
        b=cob4lZxZK9LkGWrnerkhav0j9UchbRX9vNoznXM5AwIPZa3JrtKMyi5sx/XXMf7jb
         YDLBY3zW19Dw3ETLugSlo4nSSTQimmU2LG1blpKTWi0r8VcnJ5Q8yd6Li7eNr42m+2
         oKgMvw9c7atEM5L11AMoYvDOkKXCji2mJn9dsKJw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.154.14]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfHAB-1gqME53BZD-00grQf; Fri, 03
 May 2019 23:40:10 +0200
Date:   Fri, 3 May 2019 23:40:07 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add static branch and JUMP_LABEL feature (v2)
Message-ID: <20190503214006.GA25013@ls3530.dellerweb.de>
References: <20190501200231.GA7087@ls3530.dellerweb.de>
 <20190502050510.GA10924@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502050510.GA10924@t470p.stackframe.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:neHptzHUf/jNAzNRNceYdaPN/5aYHgEvbK/xDT3fS1k1K6zm0oi
 YLIUa9as7sqXUtNknrHVFC4q9hCn4/B+HgT6I4jE5N+JE+/rx1WdtFw4FcWH4NFk8mRe++X
 PRDndheaNaDIrxo027JtKz8l5QDMixxN9jFc1s9RW9oBGSFNJzUEqT2GYMYzk9BYg0lOTGg
 rOsaLqZy0JuJeugCvL/2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jI0wN9MM+wc=:9rufI7NJ1wHpwh6Bevv1UZ
 2yFwuD+Ocli8r/OfaXdQD8jlgPbPvtpOi7kksFBjWSZwJAwyecKjx9TGxyFH/FM9yL0HdYzhx
 Fczcx2R7L+sLnOJBJduVtID8wtVh4VMNZt/2Y5vBIuNvIj7urZ7mlFuh08JevdiSkl/zfhr0I
 CHoTRc06V/QE19rpZkQgYq4IetWsT/zROfQSAt/49CHUgcBdU0Y2LIqj3tJKIqF04hqEhUMGJ
 MJevjrhYbjdeRaNjyiEpUIZYb5P3Py9PzoD6TJb2boAwrkAYMl6n/U17CDD4JZFOQr5LtvM3B
 pvba2EAz2pXymhFqls0hrihKu5jPOou94gmeVNnIZKep17loVQBNcz/JqjW3FWiUtVG8GhsXU
 8gWJ/8aTVvW3dIewBfzOo7ustKRtDIHOvmdVRf/l1qCmSe3TkJige1n+Pa81W0dANz5wbvNcK
 Eqowz6Xz5CoHC6Bkp7ooUJYCys5CAdL9MtPjxKGkD27lG96HlL4xdglbBt8/sltzrfoVYkd4Q
 XJ85aWq/MnJ0BQvGiGrB+sG7lHCkMucIELuYsPuWaG56qGUd0aKNj0ZyXMgCEKrHddHWIySD/
 o8VvqxZJu9bS7ePuY+nlvbmzPWxBYbLCHrzVHKdf1w67l6KezlA9FtbKllruDKh2e1TixUIcY
 5GU2dw1t6c9N2ZGhgR+Y1SOKxoT01cWqXlACS33YjtvrDH2du2rD9R5w2J5jTDaSjlaX62Xlk
 AOaHRRvMCs92VEXI0kwRZ6e4buHasx53rk3dbSqG7Cwv/CwLdALP0f7bwd+/Bbo6K/2S8DsWS
 ZO99Y3faAgbEo/izzIf6+0iSG0iE/LlQA9shKRtYPjeNb9X6hu41GfjbrbALnfP+X2AJN0YSr
 X7IqJlTy4VAMSG8Qxfa9BDr3deT6G74u5KWu/LSjcWRcmJ/qyeAzXaT+NjKhgs
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

v1: Initial patch
v2: Fixes, correctly encode branch instruction, check distance, check on 3=
2-
    and 64-bit kernel

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 26c215570adf..c971256a74d2 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -45,6 +45,8 @@ config PARISC
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HASH
+	select HAVE_ARCH_JUMP_LABEL
+	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_REGS_AND_STACK_ACCESS_API
diff --git a/arch/parisc/include/asm/jump_label.h b/arch/parisc/include/as=
m/jump_label.h
new file mode 100644
index 000000000000..7efb1aa2f7f8
=2D-- /dev/null
+++ b/arch/parisc/include/asm/jump_label.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_PARISC_JUMP_LABEL_H
+#define _ASM_PARISC_JUMP_LABEL_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/types.h>
+#include <asm/assembly.h>
+
+#define JUMP_LABEL_NOP_SIZE 4
+
+static __always_inline bool arch_static_branch(struct static_key *key, bo=
ol branch)
+{
+	asm_volatile_goto("1:\n\t"
+		 "nop\n\t"
+		 ".pushsection __jump_table,  \"aw\"\n\t"
+		 ".word 1b - ., %l[l_yes] - .\n\t"
+		 __stringify(ASM_ULONG_INSN) " %c0 - .\n\t"
+		 ".popsection\n\t"
+		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
+
+static __always_inline bool arch_static_branch_jump(struct static_key *ke=
y, bool branch)
+{
+	asm_volatile_goto("1:\n\t"
+		 "b,n %l[l_yes]\n\t"
+		 ".pushsection __jump_table,  \"aw\"\n\t"
+		 ".word 1b - ., %l[l_yes] - .\n\t"
+		 __stringify(ASM_ULONG_INSN) " %c0 - .\n\t"
+		 ".popsection\n\t"
+		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
+
+#endif  /* __ASSEMBLY__ */
+#endif
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index b818b28c8a99..fc0df5c44468 100644
=2D-- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -33,5 +33,6 @@ obj-$(CONFIG_64BIT)	+=3D perf.o perf_asm.o $(obj64-y)
 obj-$(CONFIG_PARISC_CPU_TOPOLOGY)	+=3D topology.o
 obj-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+=3D ftrace.o
+obj-$(CONFIG_JUMP_LABEL)		+=3D jump_label.o
 obj-$(CONFIG_KGDB)			+=3D kgdb.o
 obj-$(CONFIG_KPROBES)			+=3D kprobes.o
diff --git a/arch/parisc/kernel/jump_label.c b/arch/parisc/kernel/jump_lab=
el.c
new file mode 100644
index 000000000000..d2f3cb12e282
=2D-- /dev/null
+++ b/arch/parisc/kernel/jump_label.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Helge Deller <deller@gmx.de>
+ *
+ * Based on arch/arm64/kernel/jump_label.c
+ */
+#include <linux/kernel.h>
+#include <linux/jump_label.h>
+#include <linux/bug.h>
+#include <asm/alternative.h>
+#include <asm/patch.h>
+
+static inline int reassemble_17(int as17)
+{
+	return (((as17 & 0x10000) >> 16) |
+		((as17 & 0x0f800) << 5) |
+		((as17 & 0x00400) >> 8) |
+		((as17 & 0x003ff) << 3));
+}
+
+void arch_jump_label_transform(struct jump_entry *entry,
+			       enum jump_label_type type)
+{
+	void *addr =3D (void *)jump_entry_code(entry);
+	u32 insn;
+
+	if (type =3D=3D JUMP_LABEL_JMP) {
+		void *target =3D (void *)jump_entry_target(entry);
+		int distance =3D target - addr;
+		/*
+		 * Encode the PA1.1 "b,n" instruction with a 17-bit
+		 * displacement.  In case we hit the BUG(), we could use
+		 * another branch instruction with a 22-bit displacement on
+		 * 64-bit CPUs instead. But this seems sufficient for now.
+		 */
+		distance -=3D 8;
+		BUG_ON(distance > 262143 || distance < -262144);
+		insn =3D 0xe8000002 | reassemble_17(distance >> 2);
+	} else {
+		insn =3D INSN_NOP;
+	}
+
+	patch_text(addr, insn);
+}
+
+void arch_jump_label_transform_static(struct jump_entry *entry,
+				      enum jump_label_type type)
+{
+	/*
+	 * We use the architected NOP in arch_static_branch, so there's no
+	 * need to patch an identical NOP over the top of it here. The core
+	 * will call arch_jump_label_transform from a module notifier if the
+	 * NOP needs to be replaced by a branch.
+	 */
+}
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux=
.lds.S
index c3b1b9c24ede..a8be7a47fcc0 100644
=2D-- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -18,6 +18,9 @@
 				*(.data..vm0.pgd) \
 				*(.data..vm0.pte)

+/* No __ro_after_init data in the .rodata section - which will always be =
ro */
+#define RO_AFTER_INIT_DATA
+
 #include <asm-generic/vmlinux.lds.h>

 /* needed for the processor specific cache alignment size */
