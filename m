Return-Path: <linux-parisc+bounces-4353-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D3ECCBBA5
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 13:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8C9D302B157
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 12:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9552932D435;
	Thu, 18 Dec 2025 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdnnQYB3"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA992EC0AD;
	Thu, 18 Dec 2025 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059699; cv=none; b=jVlRRbrlI0xk3Duw+aOFwmtPRQoZY+EazoPXJwPFgkPprjkcbndiJZKxG7aJvZUZWBR3BWE2i9adSEEQgzu0hRF5IUXF2rPeQ7S3VoHbnEJUmkn9w/4hvYwT8+6rpEuLP2NmrLrRAKtoh9MmaKF21GNNzhKO5PTo/ufGp5AO0ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059699; c=relaxed/simple;
	bh=+nwdmfOj55viuIQE6/kDsV/RkqCStxrmUoswJUWaNuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GKrLHRY7/o3/owWGMutohr60te0yLRJldkQjtqCuhD0HhzW3YINDQbr/04xvps9DisavDl0KZafalaOfI2dELO/FE6gVPRv6nMhA1W6UtAaBcPWV4k5EnvPIFJbOHtMUtZRkbD97y4ZHGXsitV1nErPyFTHJj3aHTT311EHKEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdnnQYB3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A047DC116B1;
	Thu, 18 Dec 2025 12:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766059699;
	bh=+nwdmfOj55viuIQE6/kDsV/RkqCStxrmUoswJUWaNuk=;
	h=From:To:Cc:Subject:Date:From;
	b=MdnnQYB3qo7UaAJZp7A+mxXr49L0JZmxaWT+8893Y3vVg+AWLH+eFEiiMLTZoRGUH
	 mMLy1aXg1s3ft2o7tlEESGOcxTmFRImd14W7PKEjIVG94PGnvPPoISgOIA8NX2Ibn3
	 C1gGMMV5jhThTm6cqXo4+X00btLirzJQ2T0tQb+fYt6r2u2PUG8lJ/m46MoVvabSvG
	 1hn3Jq6oSCNi8PQ9odV9J3bssA1WTBcMEMRuraml71/oOmL3A6q4ZzHZ6gQglAh5K1
	 f8Cb4nIcSB+BhQFRNLDW73lxzqJTVnpC2Jpqe7sIuoec+FE97fjl3IA12CYjWITasT
	 hIk5HmiUK6ncg==
From: Leon Romanovsky <leon@kernel.org>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: =?utf-8?q?=5BPATCH=5D_parisc=3A_Set_valid_bit_in_high_byte_of_64?= =?utf-8?q?=E2=80=91bit_physical_address?=
Date: Thu, 18 Dec 2025 14:08:08 +0200
Message-ID: <20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251218-fix-parisc-conversion-37e31197a291
X-Mailer: b4 0.15-dev-a6db3
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

On 32‑bit systems, phys_addr_t is defined as u32. However, parisc
expects physical addresses to be 64‑bit values so it can store a
validity bit in the upper byte.

Resolve this mismatch by casting the physical address to unsigned
long, ensuring it is treated as a 64‑bit value where required. This
fixes the failure to start block device drivers on the C3700
platform, as reported by Guenter.

Also remove the now‑obsolete macro.

QEMU command line to reproduce the issue (with Debian SID as rootfs):
  qemu-system-hppa -machine C3700 \
	-kernel arch/parisc/boot/bzImage \
	-append "console=ttyS0 \
	root=/dev/sda rw rootwait panic=-1" \
	-nographic \
	-device lsi53c895a \
	-drive file=rootfs-hppa.img,if=none,format=raw,id=hd0 \
	-device scsi-hd,drive=hd0

Fixes: 96ddf2ef58ec ("parisc: Convert DMA map_page to map_phys interface")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net/
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/parisc/include/asm/special_insns.h | 15 ---------------
 drivers/parisc/sba_iommu.c              |  4 ++--
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/include/asm/special_insns.h
index 1013eeba31e5..fbccd76180b6 100644
--- a/arch/parisc/include/asm/special_insns.h
+++ b/arch/parisc/include/asm/special_insns.h
@@ -2,21 +2,6 @@
 #ifndef __PARISC_SPECIAL_INSNS_H
 #define __PARISC_SPECIAL_INSNS_H
 
-#define lpa(va)	({					\
-	unsigned long pa;				\
-	__asm__ __volatile__(				\
-		"copy %%r0,%0\n"			\
-		"8:\tlpa %%r0(%1),%0\n"			\
-		"9:\n"					\
-		ASM_EXCEPTIONTABLE_ENTRY(8b, 9b,	\
-				"or %%r0,%%r0,%%r0")	\
-		: "=&r" (pa)				\
-		: "r" (va)				\
-		: "memory"				\
-	);						\
-	pa;						\
-})
-
 #define lpa_user(va)	({				\
 	unsigned long pa;				\
 	__asm__ __volatile__(				\
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index a6eb6bffa5ea..eefb2bac8443 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -578,8 +578,8 @@ sba_io_pdir_entry(__le64 *pdir_ptr, space_t sid, phys_addr_t pba,
 	pba &= IOVP_MASK;
 	pba |= (ci >> PAGE_SHIFT) & 0xff;  /* move CI (8 bits) into lowest byte */
 
-	pba |= SBA_PDIR_VALID_BIT;	/* set "valid" bit */
-	*pdir_ptr = cpu_to_le64(pba);	/* swap and store into I/O Pdir */
+	/* set "valid" bit, swap and store into I/O Pdir */
+	*pdir_ptr = cpu_to_le64((unsigned long)pba | SBA_PDIR_VALID_BIT);
 
 	/*
 	 * If the PDC_MODEL capabilities has Non-coherent IO-PDIR bit set

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251218-fix-parisc-conversion-37e31197a291

Best regards,
--  
Leon Romanovsky <leonro@nvidia.com>


