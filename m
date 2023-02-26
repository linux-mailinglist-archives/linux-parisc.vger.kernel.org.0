Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696FB6A3362
	for <lists+linux-parisc@lfdr.de>; Sun, 26 Feb 2023 19:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjBZSMy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 26 Feb 2023 13:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBZSMy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 26 Feb 2023 13:12:54 -0500
X-Greylist: delayed 544 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 26 Feb 2023 10:12:43 PST
Received: from dellerweb.de (unknown [IPv6:2a02:c207:3003:236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC86F959
        for <linux-parisc@vger.kernel.org>; Sun, 26 Feb 2023 10:12:43 -0800 (PST)
Received: from mx3210.localdomain (bras-base-otwaon0925w-grc-18-174-88-80-104.dsl.bell.ca [174.88.80.104])
        by dellerweb.de (Postfix) with ESMTPSA id 97DED1600342;
        Sun, 26 Feb 2023 19:03:36 +0100 (CET)
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 15BE022012C; Sun, 26 Feb 2023 18:03:33 +0000 (UTC)
Date:   Sun, 26 Feb 2023 18:03:33 +0000
From:   John David Anglin <dave@parisc-linux.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Cleanup mmap implementation
Message-ID: <Y/ue9R0ccHfdueYx@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DyOWv91KpGSD+FpM"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--DyOWv91KpGSD+FpM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This change simplifies the randomization of file mapping regions. It
reworks the code to remove duplication. The flow is now similar to
that for mips. Finally, we consistently use the do_color_align variable
to determine when color alignment is needed.

Tested on rp3440.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_paris=
c.c
index 09a34b07f02e..39acccabf2ed 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -25,31 +25,26 @@
 #include <linux/random.h>
 #include <linux/compat.h>
=20
-/* we construct an artificial offset for the mapping based on the physical
- * address of the kernel mapping variable */
-#define GET_LAST_MMAP(filp)		\
-	(filp ? ((unsigned long) filp->f_mapping) >> 8 : 0UL)
-#define SET_LAST_MMAP(filp, val)	\
-	 { /* nothing */ }
-
-static int get_offset(unsigned int last_mmap)
-{
-	return (last_mmap & (SHM_COLOUR-1)) >> PAGE_SHIFT;
-}
+/*
+ * Construct an artificial page offset for the mapping based on the physic=
al
+ * address of the kernel file mapping variable.
+ */
+#define GET_FILP_PGOFF(filp)		\
+	(filp ? (((unsigned long) filp->f_mapping) >> 8)	\
+		 & ((SHM_COLOUR-1) >> PAGE_SHIFT) : 0UL)
=20
-static unsigned long shared_align_offset(unsigned int last_mmap,
+static unsigned long shared_align_offset(unsigned long filp_pgoff,
 					 unsigned long pgoff)
 {
-	return (get_offset(last_mmap) + pgoff) << PAGE_SHIFT;
+	return (filp_pgoff + pgoff) << PAGE_SHIFT;
 }
=20
 static inline unsigned long COLOR_ALIGN(unsigned long addr,
-			 unsigned int last_mmap, unsigned long pgoff)
+			 unsigned long filp_pgoff, unsigned long pgoff)
 {
 	unsigned long base =3D (addr+SHM_COLOUR-1) & ~(SHM_COLOUR-1);
 	unsigned long off  =3D (SHM_COLOUR-1) &
-		(shared_align_offset(last_mmap, pgoff) << PAGE_SHIFT);
-
+		shared_align_offset(filp_pgoff, pgoff);
 	return base + off;
 }
=20
@@ -98,126 +93,91 @@ static unsigned long mmap_upper_limit(struct rlimit *r=
lim_stack)
 	return PAGE_ALIGN(STACK_TOP - stack_base);
 }
=20
+enum mmap_allocation_direction {UP, DOWN};
=20
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags)
+static unsigned long arch_get_unmapped_area_common(struct file *filp,
+	unsigned long addr, unsigned long len, unsigned long pgoff,
+	unsigned long flags, enum mmap_allocation_direction dir)
 {
 	struct mm_struct *mm =3D current->mm;
 	struct vm_area_struct *vma, *prev;
-	unsigned long task_size =3D TASK_SIZE;
-	int do_color_align, last_mmap;
+	unsigned long filp_pgoff;
+	int do_color_align;
 	struct vm_unmapped_area_info info;
=20
-	if (len > task_size)
+	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
=20
 	do_color_align =3D 0;
 	if (filp || (flags & MAP_SHARED))
 		do_color_align =3D 1;
-	last_mmap =3D GET_LAST_MMAP(filp);
+	filp_pgoff =3D GET_FILP_PGOFF(filp);
=20
 	if (flags & MAP_FIXED) {
-		if ((flags & MAP_SHARED) && last_mmap &&
-		    (addr - shared_align_offset(last_mmap, pgoff))
+		/* Even MAP_FIXED mappings must reside within TASK_SIZE */
+		if (TASK_SIZE - len < addr)
+			return -EINVAL;
+
+		if ((flags & MAP_SHARED) && filp &&
+		    (addr - shared_align_offset(filp_pgoff, pgoff))
 				& (SHM_COLOUR - 1))
 			return -EINVAL;
-		goto found_addr;
+		return addr;
 	}
=20
 	if (addr) {
-		if (do_color_align && last_mmap)
-			addr =3D COLOR_ALIGN(addr, last_mmap, pgoff);
+		if (do_color_align)
+			addr =3D COLOR_ALIGN(addr, filp_pgoff, pgoff);
 		else
 			addr =3D PAGE_ALIGN(addr);
=20
 		vma =3D find_vma_prev(mm, addr, &prev);
-		if (task_size - len >=3D addr &&
+		if (TASK_SIZE - len >=3D addr &&
 		    (!vma || addr + len <=3D vm_start_gap(vma)) &&
 		    (!prev || addr >=3D vm_end_gap(prev)))
-			goto found_addr;
+			return addr;
 	}
=20
-	info.flags =3D 0;
 	info.length =3D len;
+	info.align_mask =3D do_color_align ? (PAGE_MASK & (SHM_COLOUR - 1)) : 0;
+	info.align_offset =3D shared_align_offset(filp_pgoff, pgoff);
+
+	if (dir =3D=3D DOWN) {
+		info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
+		info.low_limit =3D PAGE_SIZE;
+		info.high_limit =3D mm->mmap_base;
+		addr =3D vm_unmapped_area(&info);
+		if (!(addr & ~PAGE_MASK))
+			return addr;
+		VM_BUG_ON(addr !=3D -ENOMEM);
+
+		/*
+		 * A failed mmap() very likely causes application failure,
+		 * so fall back to the bottom-up function here. This scenario
+		 * can happen with large stack limits and large mmap()
+		 * allocations.
+		 */
+	}
+
+	info.flags =3D 0;
 	info.low_limit =3D mm->mmap_legacy_base;
 	info.high_limit =3D mmap_upper_limit(NULL);
-	info.align_mask =3D last_mmap ? (PAGE_MASK & (SHM_COLOUR - 1)) : 0;
-	info.align_offset =3D shared_align_offset(last_mmap, pgoff);
-	addr =3D vm_unmapped_area(&info);
-
-found_addr:
-	if (do_color_align && !last_mmap && !(addr & ~PAGE_MASK))
-		SET_LAST_MMAP(filp, addr - (pgoff << PAGE_SHIFT));
-
-	return addr;
+	return vm_unmapped_area(&info);
 }
=20
-unsigned long
-arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr=
0,
-			  const unsigned long len, const unsigned long pgoff,
-			  const unsigned long flags)
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+	unsigned long len, unsigned long pgoff, unsigned long flags)
 {
-	struct vm_area_struct *vma, *prev;
-	struct mm_struct *mm =3D current->mm;
-	unsigned long addr =3D addr0;
-	int do_color_align, last_mmap;
-	struct vm_unmapped_area_info info;
-
-	/* requested length too big for entire address space */
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	do_color_align =3D 0;
-	if (filp || (flags & MAP_SHARED))
-		do_color_align =3D 1;
-	last_mmap =3D GET_LAST_MMAP(filp);
-
-	if (flags & MAP_FIXED) {
-		if ((flags & MAP_SHARED) && last_mmap &&
-		    (addr - shared_align_offset(last_mmap, pgoff))
-			& (SHM_COLOUR - 1))
-			return -EINVAL;
-		goto found_addr;
-	}
-
-	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align && last_mmap)
-			addr =3D COLOR_ALIGN(addr, last_mmap, pgoff);
-		else
-			addr =3D PAGE_ALIGN(addr);
-
-		vma =3D find_vma_prev(mm, addr, &prev);
-		if (TASK_SIZE - len >=3D addr &&
-		    (!vma || addr + len <=3D vm_start_gap(vma)) &&
-		    (!prev || addr >=3D vm_end_gap(prev)))
-			goto found_addr;
-	}
-
-	info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
-	info.length =3D len;
-	info.low_limit =3D PAGE_SIZE;
-	info.high_limit =3D mm->mmap_base;
-	info.align_mask =3D last_mmap ? (PAGE_MASK & (SHM_COLOUR - 1)) : 0;
-	info.align_offset =3D shared_align_offset(last_mmap, pgoff);
-	addr =3D vm_unmapped_area(&info);
-	if (!(addr & ~PAGE_MASK))
-		goto found_addr;
-	VM_BUG_ON(addr !=3D -ENOMEM);
-
-	/*
-	 * A failed mmap() very likely causes application failure,
-	 * so fall back to the bottom-up function here. This scenario
-	 * can happen with large stack limits and large mmap()
-	 * allocations.
-	 */
-	return arch_get_unmapped_area(filp, addr0, len, pgoff, flags);
-
-found_addr:
-	if (do_color_align && !last_mmap && !(addr & ~PAGE_MASK))
-		SET_LAST_MMAP(filp, addr - (pgoff << PAGE_SHIFT));
+	return arch_get_unmapped_area_common(filp,
+			addr, len, pgoff, flags, UP);
+}
=20
-	return addr;
+unsigned long arch_get_unmapped_area_topdown(struct file *filp,
+	unsigned long addr, unsigned long len, unsigned long pgoff,
+	unsigned long flags)
+{
+	return arch_get_unmapped_area_common(filp,
+			addr, len, pgoff, flags, DOWN);
 }
=20
 static int mmap_is_legacy(void)



--DyOWv91KpGSD+FpM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmP7nu0ACgkQXb/Nrl8Z
TfE+YRAAjM4w7SbarLM2dPIXc6LAumfkRD5ZTK+XMuiI8AcSoiWpR7DD34Y2LS3X
WfRG1frrGD9NTB2fqK61x9Z+e6ujhlcKymXBHwRmg81voutLeGfYWJOVv5Qj+yU8
eSfGKVVn+1fRPDVUG5OLI/tA9aN4CXh92xNui8E3r3qfF/BDFAlOCXeHMWPTW3kA
IuaBk2xdV0rnFDX4e3Iasc7S6/6NgvR306oAI6xERXQSXPaUOiEF198nOXJLub7h
D93V60EnKzF2E3G+J1W5Fh8SIhnFkuwRXPLJbVF/277K9iuXEbG5kJYtMUbltdGW
kqeLu66h5UjQxK1ywM7B5gu9X2Ek5xmUCs3o+rEAVFUawcLShtTfelEu/ADeklLv
84c4pmEpDitqMqrH+c/S5HUow/upDZSHK2bKSwfvTFip6osI1TORJRmNte8nXdtx
s2FKZOv2qM0HFX2Oa066kh12udhRKKO3K5n25aFxlQhbm1kHivyosLRdrF51WLVO
4hxs+EaA/EGX0kdFb+u9uT5cW8yn7PnLoayyCY4JWREAg2GxSHnu32cqC7NvlIJ0
LACk9MAIMHon7dt2Cd7SGlVupd3Q7fExHMqjo+YbSZ8O7ZlPxJVVeKwihbgikumo
bwbyuVj6u4S9xwyxD437G8W6FwxHMKyXQrLS6sScgQDVx195Fos=
=etF7
-----END PGP SIGNATURE-----

--DyOWv91KpGSD+FpM--
