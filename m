Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19E584D2552
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Mar 2022 02:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiCIBDm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 8 Mar 2022 20:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiCIBDd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 8 Mar 2022 20:03:33 -0500
Received: from cmx-mtlrgo001.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B5F971323E8
        for <linux-parisc@vger.kernel.org>; Tue,  8 Mar 2022 16:40:37 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6225B9A1004AE872
X-CM-Envelope: MS4xfCh16oaAq6Olk3rJ0m/QWZrafh1BZn+s3OeL0QriLgDzx7jr/qrAY0ou4VndFEjXx1tJzcA4/Cwr6I2S9V5ocNa9NU6KQC1ErvAdJ9++WAnwD6Ndye4F
 MZgXmCzBwp9MpRUJekUbDm1kXQrc7HZ2oL7AAZNMzy1hYn1bc8b1Ng05YXCY6Bq23xUtO+LnbeNyk+YlD2EGQoVQIooXdG/oywNmrOGpUkj30yiG/ETO889G
 DVm+mhx+N9mvdX56BzIU5pqXUgjUJ5DR7R7BPBRcBZj9qU9sBC+YJTyrxHDtFI4G3gWV13/jTP2J1YFruKzawuXi/xMsQI10waQxFJ8P58yI+Z/vSDHfY3U2
 /i9W03zugZlqY3taH4T/Ncqq6MPs/5I9qd220esHw1cMS0Y83Qr+7Hkua9xnvXLjZ+5JOMo3NiiD2WyB+AFFOgLdanRzjHK3YFg/elXn0N6Spb5C+0bPa0OL
 ClyuiBWThpEz087+KLDnHmNp58FCCfQ75TdeEBCE0BN809xxrhDXw6Bqho0eq/3mJbjMVhAjgdg9LC713KzA1O7rTtFsAbUgrRCzAhH4CD9610Zh5m222ZJp
 k6NAjc5NFUPdiCoyw6tBEJtw4ae0PkygmYRO0ik9fKU/JQ==
X-CM-Analysis: v=2.4 cv=YYreWydf c=1 sm=1 tr=0 ts=6227f4ab
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=cGPhu0GUHzPwQ_FncaUA:9 a=CjuIK1q_8ugA:10
 a=-BzfZxxVLh24reVZQScA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6225B9A1004AE872; Tue, 8 Mar 2022 19:28:27 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id A142C220115; Wed,  9 Mar 2022 00:28:26 +0000 (UTC)
Date:   Wed, 9 Mar 2022 00:28:26 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH, RFC] parisc: Fix handling off probe non-access faults
Message-ID: <Yif0qrUlR4ixIaVL@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h4IXhlplqW6k4WB2"
Content-Disposition: inline
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--h4IXhlplqW6k4WB2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Currently, the parisc kernel does not fully support non-access TLB
fault handling for probe instructions. In the fast path, we set the
target register to zero if it is not a shadowed register. The slow
path is not implemented, so we call do_page_fault. The architecture
indicates that non-access faults should not cause a page fault from
disk.

This change adds to code to provide non-access fault support for
probe instructions. It also modifies the handling of faults on
userspace so that if the address lies in a valid VMA and the access
type matches that for the VMA, the probe target register is set to
one. Otherwise, the target register is set to zero.

This was done to make probe instructions more useful for userspace.
Probe instructions are not very useful if they set the target register
to zero whenever a page is not present in memory. Nominally, the
purpose of the probe instruction is determine whether read or write
access to a given address is allowed.

This fixes a problem in function pointer comparison noticed in the
glibc testsuite (stdio-common/tst-vfprintf-user-type). The same
problem is likely in glibc (_dl_lookup_address).

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/traps.h b/arch/parisc/include/asm/trap=
s.h
index 34619f010c63..0ccdb738a9a3 100644
--- a/arch/parisc/include/asm/traps.h
+++ b/arch/parisc/include/asm/traps.h
@@ -18,6 +18,7 @@ unsigned long parisc_acctyp(unsigned long code, unsigned =
int inst);
 const char *trap_name(unsigned long code);
 void do_page_fault(struct pt_regs *regs, unsigned long code,
 		unsigned long address);
+int handle_nadtlb_fault(struct pt_regs *regs);
 #endif
=20
 #endif
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 6e9cdb269862..85de7a0c26d0 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1348,6 +1348,8 @@ nadtlb_probe_check:
 	ldi             0x80,%r16
 	and             %r9,%r16,%r17
 	cmpb,<>,n       %r16,%r17,nadtlb_fault /* Must be probe,[rw]*/
+	mfctl		%isr,%r16
+	cmpib,COND(<>),n	0,%r16,nadtlb_fault
 	BL              get_register,%r25      /* Find the target register */
 	extrw,u         %r9,31,5,%r8           /* Get target register */
 	cmpib,COND(=3D),n        -1,%r1,nadtlb_fault    /* have to use slow path =
*/
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index b6fdebddc8e9..39576a9245c7 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -662,6 +662,8 @@ void notrace handle_interruption(int code, struct pt_re=
gs *regs)
 			 by hand. Technically we need to emulate:
 			 fdc,fdce,pdc,"fic,4f",prober,probeir,probew, probeiw
 		*/
+		if (code =3D=3D 17 && handle_nadtlb_fault(regs))
+			return;
 		fault_address =3D regs->ior;
 		fault_space =3D regs->isr;
 		break;
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index e9eabf8f14d7..fc2b6d0f22e8 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -425,3 +425,57 @@ void do_page_fault(struct pt_regs *regs, unsigned long=
 code,
 	}
 	pagefault_out_of_memory();
 }
+
+/* Handle non-access data TLB miss faults. Accesses to userspace are
+ * considered allowed if they lie in a valid VMA and the access type
+ * matches. We are not allowed to handle MM faults here so there may
+ * be situations where an actual access would fail even though a probe
+ * was successful.
+ */
+int
+handle_nadtlb_fault(struct pt_regs *regs)
+{
+	unsigned long insn =3D regs->iir;
+	int toreg, val =3D 0;
+	struct vm_area_struct *vma, *prev_vma;
+	struct task_struct *tsk;
+	struct mm_struct *mm;
+	unsigned long address;
+	unsigned long acc_type;
+
+	switch (insn & 0x380) {
+	case 0x180:
+		/* PROBE instruction */
+		toreg =3D insn & 0x1f;
+		if (regs->isr) {
+			tsk =3D current;
+			mm =3D tsk->mm;
+			if (mm) {
+				/* Search for VMA */
+				address =3D regs->ior;
+				mmap_read_lock(mm);
+				vma =3D find_vma_prev(mm, address, &prev_vma);
+				mmap_read_unlock(mm);
+
+				/*
+				 * Check if access to the VMA is okay.
+				 * We don't allow for stack expansion.
+				 */
+				acc_type =3D (insn & 0x40) ? VM_WRITE : VM_READ;
+				if (vma
+				    && address >=3D vma->vm_start
+				    && (vma->vm_flags & acc_type) =3D=3D acc_type)
+					val =3D 1;
+			}
+		}
+		if (toreg)
+			regs->gr[toreg] =3D val;
+		regs->gr[0]|=3DPSW_N;
+		return 1;
+
+	default:
+		break;
+	}
+
+	return 0;
+}

--h4IXhlplqW6k4WB2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmIn9KIACgkQXb/Nrl8Z
TfErGBAAmBH3OMrBKBzyRPvdx0X+26QnJpW2lPVPfNuhddED8Uh8FzjBWyqEdAJG
En0NTsB314BIgmW5w/LYwjRJLKuDcJaMqjK7mgyRhCjj/20D7v7qLUYj4bZ1VX+m
Wmlxt0Z5NkIEG9ZREe20lIKXMn86SNxkYiQsiYRUFKrrRodTruD3c+1yvqoXV/+m
dyMvxOgzN/WAdANTRvT4Xy6GKLeGrLnUlbDJPyOthYRVkqi7ezhIfiDR8m+UBSqi
R+2cwCsDSbvYVhgCFbnRjjzraUHzGXiMi8nOks4YSCHikYENPBr7N97XZt1UjWGw
pUmWqhjJtAnRyw4t0CsA5plFbrxaCXwfXJJJaC2HuxA+mPg7qUzePKk/Zx3eytvT
xp94/7x0XhmgfLrHIY8xLeVpisFTvYYIStwBDYhoHAMRTK+1LhY7+zrs10SPHSpY
MsCYl8S0/ddKVQxRyGs0XURq84lF0N1h7z6ABRytWD4WPWc/lOU1ad7Xep/exHtb
gnDHV3pFDEsd2yekg0pqf5HvaomoH19s5oZw3GHYj+JD2gEBgq1W5Xsb4lF5yme5
plXhzfaa6NLZdRmzeuOj4Eg5rR9GCVV5bcDEvsC54gTsPfT1dU4rj5UQhtqaWyOy
yelsPYTMgpGyHmwW+TLqFajoQCfLiFVxDljpId2ECTOu4VQOUgY=
=gxgn
-----END PGP SIGNATURE-----

--h4IXhlplqW6k4WB2--
