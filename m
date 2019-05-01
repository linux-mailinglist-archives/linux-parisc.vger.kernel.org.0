Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0767310832
	for <lists+linux-parisc@lfdr.de>; Wed,  1 May 2019 15:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbfEANOv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 May 2019 09:14:51 -0400
Received: from mout.gmx.net ([212.227.17.20]:46729 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbfEANOv (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 May 2019 09:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1556716484;
        bh=moe2VZCaGFS+azxE5O2vjagArtQMPRWz8tbrmFZCXBU=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=img4TpUoKAhElB8W0NYM06inB5CfhW3U/Va2rS7wgDwn0mkau4wjQPXStgxblogt1
         LrDf7iTxKr81W1yDVurqWiV8XB56aMK/fY32PZNiFmuOE3KbbQJX03nXDG2tgZT1tJ
         qZhQKAwocBhEVWTTC6V5WX8E005/aL9mPhCzqAlI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.140.64]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MFPyK-1ha8xM02HE-00ELvQ; Wed, 01
 May 2019 15:14:44 +0200
Date:   Wed, 1 May 2019 15:14:40 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Enable SPARSEMEM_VMEMMAP
Message-ID: <20190501131440.GA8816@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:/LjvLUEqPpGAKYKbDtGQpND7LjaqaVQInKX7EhTj3LVTluq2emL
 MigAeKijIJ72kCgKNE8AO5ulyZylHeURp+fCFTDuifV813jDJzf4SNxh2bI1YoyNPvrGz5E
 J3Pj9mFTyPciBnV6ze5cKT1YOeQCrAOnMHMbR5Jk+FYk1gWZUWyPH3aXn8j5fjMMzrnnipa
 nek80BQTCgS5cXezOdJKg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XvCu02PB6Q8=:XEb7VWnc1tftpfK07DDILJ
 ibeBZPaOl9uifrrN1ZzTpWb6QIzf+M29ZoK2K4UCoIX+Acj9mNN0A26Eu8pNzLTGrTxZcWXQw
 vD9IlWNkTcnWq1zQepDWjIzyKk80z2Rg+IZU91vcx5RA8DDb6FOXJdAsqoFTsdSjNsuA+0f4x
 5szlsqJROiBQ/XU7D9DdL0bJrKypq0cT7/3IZu/b8QrLgQAEqXEjAwEAj6b3jkOm8pvm473TO
 hNaN92OFdoeeP6lrs3GFYXrBIfjbNqwvn4xKNjdDLo8QDxvih7trcX7lg9ZdRmak4A+1h8cgC
 120fvxKZB9v/spy4Mxi3oMpZNuPa88gZd/f9dltagIm9kIlU7cpz+oUb2xMJXZ3s/gHk70aqu
 TLQV596rUj8gyDsRXAtDvaAK6S8UQOsvntlseEB+WlnnBoW7V7Py3EB34eHhXJEMNu2zlO987
 W4UJANR0cF4uI/S2kcteM6H2gFJsGH+cTJIRjszgEasp5FWjuTSTTSkmeF6+8358nM/1vGc4c
 mRWB9ZOzU8k/io50gMHyUyCWHivqSPwCzjDzc2DMPeD+C3YeMXuNawblF2k0OXaPkehG8c3Zj
 m3j9L426CaS8tQXXSxBdDAWQe6w0KJtzT66AD/fzNTnvSIWkpOsRbihwE8KNAIwchRS1cn/7R
 806oSjU+m8IdxI/YIKdi91Cmw/DlDResqUJ7V2iWq8tlwAVZwwlOLTDaL2Pu8F9bQ/2PBWODP
 x2y5kqkJNZS3p0iUPxFCD01cNIoo7jtTTTNPgtcjuvaluPjgnVyc3j7qy7Kxy+Tp1H0UylRBA
 xdyb3gwZO2StiMB/u7cSODDfYU8OtXAJXAPwDBEM2FHjfNMQuZe6rS4VGeGBw/weGiwFWc3sr
 xu+UIgNIrs4xmSCeWYF2F8u6RwkHKLlTi+myf6L2DNBmZRRqMaKjauOkWz3c6L
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Enable the SPARSEMEM VMEMMAP implementation on parisc.
The vmemmap is mapped at a virtual address which is higher than the
addressable physical address (0x8000000000).

This patch could be optimized by rewriting vmemmap_populate() to utilize
large pages.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 26c215570adf..49212f31b461 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -318,6 +318,7 @@ config ARCH_SELECT_MEMORY_MODEL
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	depends on 64BIT
+	select SPARSEMEM_VMEMMAP_ENABLE

 config ARCH_FLATMEM_ENABLE
 	def_bool y
diff --git a/arch/parisc/include/asm/fixmap.h b/arch/parisc/include/asm/fi=
xmap.h
index 288da73d4cc0..c5ae85fc99ae 100644
=2D-- a/arch/parisc/include/asm/fixmap.h
+++ b/arch/parisc/include/asm/fixmap.h
@@ -43,6 +43,12 @@ extern void *parisc_vmalloc_start;
 void set_fixmap(enum fixed_addresses idx, phys_addr_t phys);
 void clear_fixmap(enum fixed_addresses idx);

+#if defined(CONFIG_SPARSEMEM_VMEMMAP)
+#define VMEMMAP_BASE	(UL(1) << MAX_PHYSMEM_BITS)
+#define VMEMMAP_SIZE	(UL(1) << (MAX_PHYSMEM_BITS - PAGE_SHIFT - 1 + STRUC=
T_PAGE_MAX_SHIFT))
+#define vmemmap		((struct page *) VMEMMAP_BASE)
+#endif
+
 #endif /*__ASSEMBLY__*/

 #endif /*_ASM_FIXMAP_H*/
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 78e451ce0f1b..c4c71490ca36 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -609,8 +609,11 @@ void __init mem_init(void)
 	       "     memory  : 0x%px - 0x%px   (%4ld MB)\n"
 	       "       .init : 0x%px - 0x%px   (%4ld kB)\n"
 	       "       .data : 0x%px - 0x%px   (%4ld kB)\n"
-	       "       .text : 0x%px - 0x%px   (%4ld kB)\n",
-
+	       "       .text : 0x%px - 0x%px   (%4ld kB)\n"
+#if defined(CONFIG_SPARSEMEM_VMEMMAP)
+	       "     vmemmap : 0x%px - 0x%px   (%4ld MB)\n"
+#endif
+		,
 	       (void*)VMALLOC_START, (void*)VMALLOC_END,
 	       (VMALLOC_END - VMALLOC_START) >> 20,

@@ -627,7 +630,15 @@ void __init mem_init(void)
 	       ((unsigned long)_edata - (unsigned long)_etext) >> 10,

 	       _text, _etext,
-	       ((unsigned long)_etext - (unsigned long)_text) >> 10);
+	       ((unsigned long)_etext - (unsigned long)_text) >> 10
+
+#if defined(CONFIG_SPARSEMEM_VMEMMAP)
+		,
+	       (void *)VMEMMAP_BASE, (void *)(VMEMMAP_BASE + VMEMMAP_SIZE),
+	       (unsigned long)(VMEMMAP_SIZE >> 20)
+#endif
+		);
+
 #endif
 }

@@ -923,3 +934,11 @@ void free_initrd_mem(unsigned long start, unsigned lo=
ng end)
 	free_reserved_area((void *)start, (void *)end, -1, "initrd");
 }
 #endif
+
+#if defined(CONFIG_SPARSEMEM_VMEMMAP)
+int __meminit vmemmap_populate(unsigned long vstart, unsigned long vend,
+			       int node, struct vmem_altmap *altmap)
+{
+	return vmemmap_populate_basepages(vstart, vend, node);
+}
+#endif
