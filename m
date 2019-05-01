Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 335B210DAE
	for <lists+linux-parisc@lfdr.de>; Wed,  1 May 2019 22:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfEAUCn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 May 2019 16:02:43 -0400
Received: from mout.gmx.net ([212.227.15.18]:49429 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726004AbfEAUCn (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 May 2019 16:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1556740955;
        bh=d8p3pNPtfTwBdxN9qmaa/qNzQ48Zd7MB2RgEAX0A9G4=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Dfo7nf5gI4OeMmRYjYHQdZjT0AaRK0gnaVFRJ0Cy7TE/W1pKhEEYjXzla+trrzJhs
         LShHYrReZoIZUhYJ7t2PacC4u+fv9fI8IoIWXG0L85VrOwn7sTWaagWE4+YwytO3ZA
         B1aVjjbCEqb7nowRaHX13CN3v4DUcZ1wrYmiHcf8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.140.64]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MgL1q-1hAIAO3PKo-00Nfuj; Wed, 01
 May 2019 22:02:34 +0200
Date:   Wed, 1 May 2019 22:02:31 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add static branch / JUMP_LABEL feature
Message-ID: <20190501200231.GA7087@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:5IcjS3gniTacJqA6L5BAntQIz/9GubRr+QTw8sk0urQvrXr7N93
 whuWu4zh+O6KrWilS7bJ4LbYHddA6B65VJfmZEh6cRty7/DSRrd9O7dPeDaxBKqRYdNshP+
 MV64RAT4jIXD/SBQcNEEzReXexbvahm2QvZxmFZN4dsY+P1/aF9lHsGGokPcAk3grspdlNK
 1tafen9LOX1PT7rE9eokQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rOVNd/+7b+4=:10IHcYtxCu4qypUxT9YkgS
 meJOPw8GPwPCOi0O3Tefyzcf3EpbQ9oDS+cAPXPSWhIbHv3LecnvygZGhYUraQslsZuYwPKKW
 /fdkuMriGxVZPn2ihhxYyKMkHdNEqPydqs7MEllsRJMFzxlce5JhT/TYy47spZo5oz2xOyYzy
 jYcxRYuXZhLZd/uBM4uWvegzTVH+6LHnl4Kmb2HfA16FeXJ1ts9mpb+NsTP+lGRATkxUEy72p
 gIf/nDbC2ewUW3vaea6ppMyz+dVbS3E5LrNCj1wJ0PL2FCRfvZi6oq+6wqfjD4mtPtKnHvn/Z
 rC1APBodJ1OvHH0GnFEp5daZcjyitGCH/cjboXgpc87442p497uFw6/laKjSWg6jpm1vUc/vH
 boyZeFJeCtpL8R099/MSJft0hM1NfngpKOCMqyJ1ZXcWffeSxGQ336L6oF57MNV5E0HusklyF
 1OWsyWcH8RlKo+JAV5IbCIwkO6iy0EqRIF0vEFBRUM57DY5wnHxHIU9JAYrx53syYNdQ8kQJm
 paF9twnna7fY4VmdviNoUrn8XIUQbvfW2fbOc67QN03DjbTnJr3gi7mQFViMO/5C7N4Rm8cbl
 YKQb+UyeRsCCD0YtCqcDVwQVGISk3fk8d9C6hxS3e7jBewxukYT7gb5YFILrCRKaozQsAx4Op
 5qc/6MNUP9rPXh+tUkRMaA0523Ol60D0/fvPFIVK7517cAo6WnGFjyQ9ZkT/Fhsv4W63rnWAG
 aT8VPtGl2uy8uMkEtUaM6yXj+1w5bmj1TiCkgJqpNrl30fC7pV/7ks41jfJtqhkjY7e6FAUsh
 kqW8yWJxG4AZ77yvyCsZy8cwTFCto1fQbhfALO5HUtGSaWZwRzbAouTXKaIrHrHUoYF080K2C
 UB8atZgEzCT6X3EeT123SucKVFxZbFabjLqk5T0BiJmewKitdlgc5IA85l+7Qm
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 49212f31b461..bdd4fea0150b 100644
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
index 000000000000..2d82368b6ed3
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
+		 __stringify(ASM_ULONG_INSN) " %c0\n\t"
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
+		 __stringify(ASM_ULONG_INSN) " %c0\n\t"
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
index 000000000000..0d077c6d3ca7
=2D-- /dev/null
+++ b/arch/parisc/kernel/jump_label.c
@@ -0,0 +1,37 @@
+/*
+ * Copyright (C) 2019 Helge Deller <deller@gmx.de>
+ *
+ * Based on arch/arm64/kernel/jump_label.c
+ */
+#include <linux/kernel.h>
+#include <linux/jump_label.h>
+#include <asm/alternative.h>
+#include <asm/patch.h>
+
+void arch_jump_label_transform(struct jump_entry *entry,
+			       enum jump_label_type type)
+{
+	void *addr =3D (void *)jump_entry_code(entry);
+	u32 insn;
+
+	if (type =3D=3D JUMP_LABEL_JMP) {
+		void *target =3D (void *)jump_entry_target(entry);
+		unsigned len =3D target - addr;
+		insn =3D 0xe8000002 + (len-2)*8; /* "b,n .+8" */
+	} else {
+		insn =3D INSN_NOP;
+	}
+
+	patch_text(addr, insn); // nosync ?
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
