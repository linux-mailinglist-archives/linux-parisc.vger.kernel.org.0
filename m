Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C8F4D3BE8
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Mar 2022 22:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236819AbiCIVPv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 9 Mar 2022 16:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238161AbiCIVPt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Mar 2022 16:15:49 -0500
Received: from cmx-torrgo001.bell.net (mta-tor-001.bell.net [209.71.212.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 631A26514A
        for <linux-parisc@vger.kernel.org>; Wed,  9 Mar 2022 13:14:49 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6228049100124CF9
X-CM-Envelope: MS4xfOaSc1Pmasfli6WPl70DBQZZ3cmz6qN3GWKVALN8q6CTd+Qo6m/nYRjAcn56ttc1E4zGkD4cPKAmQ/q51A4eelw+lRiUEzQZvz6EXTCoCLNvXhI89sIM
 6vEJoGklce9YRHVsw0qHlFRBCmxvMFI8rJZQSqw0peHszWySyZDtrSdrtJ/hubPFZ6mhX11/cEAClKHPH5q5A5rbtt4OoVYalVUCVEDfmg7NHzjtAG/crCED
 VtZB//RoWWwrIbpISoHz0eq7e2SaDAfp23eJCYspjJWgP8yTD70xLuoqZmYCw5ny04ylvzY8vjkn77nO/pvS7slqyneD5Gy/k6vOigIVz86YR7lEI2VmuJE9
 jgD1noyHSzpYunhFVJnrcDsUhvcGfPQrKBxNAy+R5tfkiT0ObAV9kpTUQmIuKuecf3crK0ts+adGNjCmJfafUHE5SrJE3Y9TOesVFmQ90NvnagUbhL/CPdT4
 eYTIWgIVyS9EKCaDajW9r/e453mIzCzsZ9UKEqiSHLpY9nke8QqhZ+OFBpU6HAUwMbaOdSTIQ9MG0GdVb3CgvoNAt8vYdde/G3vjxfcgJDUI2dL2IrsEBfZI
 0c9qklq07Xmsk8QQjap5MMTx+tyguOiQjmOF03+q5t3nkQ==
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=622918bd
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=cGPhu0GUHzPwQ_FncaUA:9 a=CjuIK1q_8ugA:10
 a=_oGcFUuPwXcPBOr9mwoA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6228049100124CF9; Wed, 9 Mar 2022 16:14:37 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 18171220115; Wed,  9 Mar 2022 21:14:36 +0000 (UTC)
Date:   Wed, 9 Mar 2022 21:14:36 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH, V2] parisc: Fix handling off probe non-access faults
Message-ID: <YikYvO5Qj+56wMtY@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B6V484IiT9NiuR5R"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--B6V484IiT9NiuR5R
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

V2 adds flush and lpa instruction support to handle_nadtlb_fault.

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
index e9eabf8f14d7..39f813dcb008 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -425,3 +425,92 @@ void do_page_fault(struct pt_regs *regs, unsigned long=
 code,
 	}
 	pagefault_out_of_memory();
 }
+
+/* Handle non-access data TLB miss faults.
+ *
+ * For probe instructions, accesses to userspace are considered allowed
+ * if they lie in a valid VMA and the access type matches. We are not
+ * allowed to handle MM faults here so there may be situations where an
+ * actual access would fail even though a probe was successful.
+ */
+int
+handle_nadtlb_fault(struct pt_regs *regs)
+{
+	unsigned long insn =3D regs->iir;
+	int breg, treg, xreg, val =3D 0;
+	struct vm_area_struct *vma, *prev_vma;
+	struct task_struct *tsk;
+	struct mm_struct *mm;
+	unsigned long address;
+	unsigned long acc_type;
+
+	switch (insn & 0x380) {
+	case 0x280:
+		/* FDC instruction */
+		fallthrough;
+	case 0x380:
+		/* PDC and FIC instructions */
+		if(printk_ratelimit()) {
+			pr_warn("BUG: nullifying cache flush/purge instruction\n");
+			show_regs(regs);
+		 }
+		if (insn & 0x20) {
+			/* Base modification */
+			breg =3D (insn >> 21) & 0x1f;
+			xreg =3D (insn >> 16) & 0x1f;
+			if (breg && xreg)
+				regs->gr[breg] +=3D regs->gr[xreg];
+		}
+		regs->gr[0] |=3D PSW_N;
+		return 1;
+	=09
+	case 0x180:
+		/* PROBE instruction */
+		treg =3D insn & 0x1f;
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
+		if (treg)
+			regs->gr[treg] =3D val;
+		regs->gr[0] |=3D PSW_N;
+		return 1;
+
+	case 0x300:
+		/* LPA instruction */
+		if (insn & 0x20) {
+			/* Base modification */
+			breg =3D (insn >> 21) & 0x1f;
+			xreg =3D (insn >> 16) & 0x1f;
+			if (breg && xreg)
+				regs->gr[breg] +=3D regs->gr[xreg];
+		}
+		treg =3D insn & 0x1f;
+		if (treg)
+			regs->gr[treg] =3D 0;
+		regs->gr[0] |=3D PSW_N;
+		return 1;
+
+	default:
+		break;
+	}
+
+	return 0;
+}

--B6V484IiT9NiuR5R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmIpGLYACgkQXb/Nrl8Z
TfGglQ//b5uIq3uAeFB1h3ktO+0IkBKZdk9aJJASAZACTjFzoAairApP9D0nl/Ul
glKhaz2dI6Tk6uaOaEnhTnOnRMc4TsQwNRyx0wdVZnn0zQ7gDK1pWvcjVoDIZRVM
+u89LX2AyF48Tlfgl8fw5O9nkyDu8BUoqja2y+aeYX+SUb6gP1icZfYt3f54QQYI
GRRO42GNzmFEpIcm0MJtwH/alaUsSvn9M4RZ0PyyzRR31btGKCOzkfs5whghMoP9
3mtaB3MggAIiRbC1qmB9Z47AB6yrEGBy0rnbc58HjIjcuA354Fxq4OdDHtPMSaX2
7ToXDOG7BZzJbWnWVXTDqhIeCsVKP1LyGtrW/0vIdPk+W8HD4rpKMTCo5bKXEeDV
Uwp7413wmb0eIzSYYC+/j7dudt3rprM0kK0h5s3ozZCEBxy0lYGTaMdF5noDE2qO
X8CEQ4jrKIhtAxQJZXJ3kqVeysUH8tYPJFPKi3AeEFkzVCooJ9qfVdZuSHeGEGfa
WeQ9JiJXqzYEA1Pipp7oXkD5JwUoy5q/9OqPpmSgjmY9f3+DMlKNx6Dm2KjIAfe+
zEei8SfSjXJ4+lN4swXv9kPLqnQaWs5jHgk3Jfq2+nY/xMMNlLchQzeYb2e5uHYB
KesSVMvl+JCZj5XktkSPvei7oSj3U+1UlH182VvLkNjWBU2l6gQ=
=Mtp4
-----END PGP SIGNATURE-----

--B6V484IiT9NiuR5R--
