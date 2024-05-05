Return-Path: <linux-parisc+bounces-1330-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E54048BC2B2
	for <lists+linux-parisc@lfdr.de>; Sun,  5 May 2024 19:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 220331C20977
	for <lists+linux-parisc@lfdr.de>; Sun,  5 May 2024 17:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E7E374F9;
	Sun,  5 May 2024 17:04:21 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from dellerweb.de (dellerweb.de [173.249.48.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E40B40848
	for <linux-parisc@vger.kernel.org>; Sun,  5 May 2024 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.48.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714928661; cv=none; b=kpoU/4u4Sq6L8tLN2SalWNuO9JwW+ATS1wMgK3vvFCoeHA0VMsFuNSvEyDVEJMVZdlP+QEWOVJfxkNWPCRFwC6wYGVvOTcXMFtwn5ia22BAo2NPu2F71sd/Ai0ekg1YbStS1AiZTrQH8LkjY8Y3cciunQ3oSAO04jK2FMO/fLKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714928661; c=relaxed/simple;
	bh=tB0J95LmAWc62+re1tGLa6WMM329JLunkBvf5NHrG8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUhEGOowoUzQ+YbwGdfMI2nESu4+qxQ4cDRwbnuHgH9oF01QvdIvLu4uY88hMsRsymQF8Pox7RzdRvrk/yZg6DdMGCARB2NXVDjk27cvd9tf5Jx5pvle9LdmwpdKsHXMe9Kf0w5Zcx1lzDLED2SO5Iy9gbSxQJlFOXYqCEm7F4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=parisc-linux.org; spf=pass smtp.mailfrom=parisc-linux.org; arc=none smtp.client-ip=173.249.48.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=parisc-linux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parisc-linux.org
Received: from mx3210.localdomain (unknown [142.126.188.251])
	by dellerweb.de (Postfix) with ESMTPSA id 5976716001D6;
	Sun,  5 May 2024 18:58:53 +0200 (CEST)
Received: by mx3210.localdomain (Postfix, from userid 1000)
	id B767722011C; Sun,  5 May 2024 16:58:51 +0000 (UTC)
Date: Sun, 5 May 2024 16:58:51 +0000
From: John David Anglin <dave@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Try to fix random segmentation faults in package
 builds
Message-ID: <Zje6ywzNAltbG3R2@mx3210.localdomain>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0+fWBbu/67hV2rTD"
Content-Disposition: inline


--0+fWBbu/67hV2rTD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The majority of random segmentation faults that I have looked at
appear to be memory corruption in memory allocated using mmap and
malloc.  This got me thinking that there might be issues with the
parisc implementation of flush_anon_page.

On PA8800/PA8900 CPUs, we use flush_user_cache_page to flush anonymous
pages.  I modified flush_user_cache_page to leave interrupts disabled
for the entire flush just to be sure the context didn't get modified
mid flush.

In looking at the implementation of flush_anon_page on other architectures,
I noticed that they all invalidate the kernel mapping as well as flush
the user page.  I added code to invalidate the kernel mapping to this
page in the PA8800/PA8900 path.  It's possible this is also needed for
other processors but I don't have a way to test.

I removed using flush_data_cache when the mapping is shared.  In theory,
shared mappings are all equivalent, so flush_user_cache_page should
flush all shared mappings.  It is much faster.

Lightly tested on rp3440 and c8000.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index ca4a302d4365..8d14a8a5d4d6 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -333,8 +333,6 @@ static void flush_user_cache_page(struct vm_area_struct=
 *vma, unsigned long vmad
=20
 	vmaddr &=3D PAGE_MASK;
=20
-	preempt_disable();
-
 	/* Set context for flush */
 	local_irq_save(flags);
 	prot =3D mfctl(8);
@@ -344,7 +342,6 @@ static void flush_user_cache_page(struct vm_area_struct=
 *vma, unsigned long vmad
 	pgd_lock =3D mfctl(28);
 #endif
 	switch_mm_irqs_off(NULL, vma->vm_mm, NULL);
-	local_irq_restore(flags);
=20
 	flush_user_dcache_range_asm(vmaddr, vmaddr + PAGE_SIZE);
 	if (vma->vm_flags & VM_EXEC)
@@ -352,7 +349,6 @@ static void flush_user_cache_page(struct vm_area_struct=
 *vma, unsigned long vmad
 	flush_tlb_page(vma, vmaddr);
=20
 	/* Restore previous context */
-	local_irq_save(flags);
 #ifdef CONFIG_TLB_PTLOCK
 	mtctl(pgd_lock, 28);
 #endif
@@ -360,8 +356,6 @@ static void flush_user_cache_page(struct vm_area_struct=
 *vma, unsigned long vmad
 	mtsp(space, SR_USER);
 	mtctl(prot, 8);
 	local_irq_restore(flags);
-
-	preempt_enable();
 }
=20
 static inline pte_t *get_ptep(struct mm_struct *mm, unsigned long addr)
@@ -543,7 +537,7 @@ void __init parisc_setup_cache_timing(void)
 		parisc_tlb_flush_threshold/1024);
 }
=20
-extern void purge_kernel_dcache_page_asm(unsigned long);
+extern void purge_kernel_dcache_page_asm(const void *addr);
 extern void clear_user_page_asm(void *, unsigned long);
 extern void copy_user_page_asm(void *, void *, unsigned long);
=20
@@ -558,6 +552,16 @@ void flush_kernel_dcache_page_addr(const void *addr)
 }
 EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
=20
+static void purge_kernel_dcache_page_addr(const void *addr)
+{
+	unsigned long flags;
+
+	purge_kernel_dcache_page_asm(addr);
+	purge_tlb_start(flags);
+	pdtlb(SR_KERNEL, addr);
+	purge_tlb_end(flags);
+}
+
 static void flush_cache_page_if_present(struct vm_area_struct *vma,
 	unsigned long vmaddr, unsigned long pfn)
 {
@@ -725,10 +729,8 @@ void flush_anon_page(struct vm_area_struct *vma, struc=
t page *page, unsigned lon
 		return;
=20
 	if (parisc_requires_coherency()) {
-		if (vma->vm_flags & VM_SHARED)
-			flush_data_cache();
-		else
-			flush_user_cache_page(vma, vmaddr);
+		flush_user_cache_page(vma, vmaddr);
+		purge_kernel_dcache_page_addr(page_address(page));
 		return;
 	}
=20

--0+fWBbu/67hV2rTD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmY3usMACgkQXb/Nrl8Z
TfGXeA//WHbufR7+kvo6dt2RfX9roE4zMvId8kj2nlVcoW1EpZLRnZ5Qc7ORDB43
Sjq2RLE5R7igGOE1uzj6AQgSozx/Lq2PuyHwoG3infddWTmP3NSzXBh3I52bL69c
A5xaQtgaXyBSNa8rnMpKQC2BaAHGQZWCzlSts47y/LERUaAnXIrJP94QpGdLbqMv
jLBV7Zc9yJ2WxbBwPH5JjNpNMvf1FKpnaagjmrPzoMrpKWL7aZ+/c7HTUbQ/YN0/
IRLs1BPWfEh4P6GjQa9lSD13SJexbHm7rmW1ikgDyUw5FPWCa46bVFDuVaXHBc6o
TRvID3uWDh8P2Kxl4W7Vn7QK6mX2Hth8Qm83Gnh/ISH5rlFf3bk/4JoSYmpJ3+Sq
JzkIpjVeu1kwngS4vJIpZ+xdAJVgDP8tjkn8hoy0oiUooksotsXmadx0+RrDOBq2
prQPPInxeXKOSJia/UxbgWpd56mGKs+92arioFyGQjfakrMFvKCSynBSNisdYkgb
2k827iw9Q/5m6okghLNTSgAVy1Gy42sgQCHSv4aBpJlmtSZoNpvxNAyDrHxojleP
WJZCPMiyCaIzm4iOCERuo18oBY51l2+Co42twSofl6Xnu3Cunx41KJNdvdGUmi2i
mkFGoM8ehe5Amw9i47Mfu/LhI2oN290WkWCdcNBj9zcNdCy6ag0=
=j9yD
-----END PGP SIGNATURE-----

--0+fWBbu/67hV2rTD--

