Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20FF5FF3DA
	for <lists+linux-parisc@lfdr.de>; Fri, 14 Oct 2022 20:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbiJNSyB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 14 Oct 2022 14:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiJNSyB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 14 Oct 2022 14:54:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062571D3449
        for <linux-parisc@vger.kernel.org>; Fri, 14 Oct 2022 11:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1665773634;
        bh=gLwVFlm4Dc5asPNLFH6paZgJMmGcIUVZ211Ir0/c8kY=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=WAGN1iR5FYHJb9YaDp6rSMwRiutr8DyCDDWtlXTPoDi9lUATFBlEqQYPX6IA0OnyG
         AH5Ya+K83Or/jwa4hY11h+bTwdallHBrmYBE87mPQ0FU680ePOeAACB0F3XRNXas+k
         cpi7YVHB54HDVUyIP1Tn0H3HaXHuAJ1HyJydevVE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.188.185]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbVu-1ow1oi1SO6-00H49L; Fri, 14
 Oct 2022 20:53:54 +0200
Date:   Fri, 14 Oct 2022 20:53:52 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix userspace graphics card breakage due to pgtable
 special bit
Message-ID: <Y0mwQOZYXqTKlJSy@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:WNnPDLVlts3UycVZze7WUxOB933wy3gMtXb7KlS90z+JR/M9IKz
 mMtzZ+sYn85rNPQ13CpzgdFE1RZlgAM7Hgv+7o9zzPOEP92QBE14QQKadByvgcOEVNIQ5IE
 lf7lzqZZJkEq+7tFg3f1gyOgX0N3hMrvjhIU2S1j7NLGffcMpr63lumI3d8msHLVxBonJ2o
 8+ipQzLTMLJBxCOybEvJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mSmTH5LzWsI=:i4iuQG6UCBs31ldh8QwMjG
 ztEKnUSREDg1jYJCpseQYiCqyN2E3/lfzFQYLBzVOhJWF62PVg8JcqY5sPTBkZ/U7REqz/rTD
 wHhyAVBNfu6Am6WRUVnP+T5Br6XvUnzfESEqccKYgeJ2iEkJSpJdaPaTk3agC9dvJz5P6rVvL
 Q/A6oFr5xxjvXpSa1IonW0CfNcYkJ4/CbLcVMEDeCGTbdQAQeQCkz/NfFO60YIa9XztDHuoki
 eGCHgpa9NDtT8VMjJkH97qOOQ0KMqsLejOh8ZacCWqfflDOb63rkr0oEEnxksEjE8r3ZhoD35
 L2sdKP6CS4JJ36HjcV+eZ25UVXLnDT4abLFQLdgBOKDVnSCrg24klxC9JO/I1dNkF3cSwzrq3
 xcDlKszX88AKBvY1/1w7ErbxYRd+oFvnlcaIdruqBooQ9kr3AeoxrPbYGwbFz1Lp+idURJted
 3iUIgo7qq+WQB5zc/smc8zA0Ci6/3aWbjvpZgbV905n5Pm/w/aOezSkIq7CgzDKJ4VhhrabaJ
 OEeQ5b/jRjMW4NnWPbHvRj1DEGXFOZnUu/mcMMDv9oy50y9aFLGEVExAq+4F1TocYnj4akIFf
 in+9QZ+SUrrPCGr9YK2exGeBr7ZLixy25rVi2L+x521EUnUEjM+doRUtL5acYBHKhUqWKU9Ho
 Auglj/vK9KibQosUeMuERVP9/MBAjsMtPWBZOpx+yJ/WT0zENUbuQ0nKnje/cQE7cOh9YV1Ln
 7SNyStuNhx30PcwtcbTn0ixFEEiMKz4pcNN3VnNKWeB5zrH5iu4Z5q3lznFrzFm6ZIFH7pdH5
 rns6Yzetoc9GaB4F94yU6yj75ruV6m3xh+5JtPDdC99L2YzjWNx8ktYWTKOvPyB3SJDU/H9hL
 yHpx2F+z9dIy+bgZfWiJotBvk3fqq8VPQITageh1sSXNuSoVnrDQbVOCl+s2MLH12ihGJC7Mx
 UwTUvzUKWqEc6iPWaJGfEMAtvRMGoX1rBY8+oM+FDtIRz2INiDrzfEe7bBfa0uo0eITUo3+H7
 ac2Nz/H8z6LHcQk+7KTf6v/TVlEgIhBZfdRKIG+X/9N8x1t+f+MIzjr90pKGn4UlYYxcgKNOE
 nmVFXuX9oSmXM6N9+GLgQ4/Sg3ecXY5VMgqVO6TWaSm/hQ+I4HZsZ8LNqkuW0YLbL+aPJo83A
 V91ewplyE9o7yEZwmyaJ7Iwb58vOYp9Q+qViPCrg104kWmsoEwlb7v9AUZ3wjSis1Sk/FMdwt
 PqaBOAu2Rc4W8dfWR2EC2fNax2QjlT8gZ7KDC7AGzIOr75wUjHkYGKPMFBVWpPn73zUFbyycV
 nEMssZgEKUyDIWSZv7Oo9abnT96p4u168NLQkNriGLI/HLiMvA/Hzkhzn6J53zZvzb9cDu7rG
 zBO8lGoOBqwpVlb2yghvcPS05JgWN7q/KgHWO3fBOBwT3+4/smzco7J5SC8TZRBFl8kYQ8+mn
 D37Lt3Av/ojxmN+QAj/JmvwV17fLROGRLIqFo32q3wWY3LCH3s/EcONSPWlDldEB/PSUzCncR
 OS7E9+71UPK0uXCeQ3fdk5NxRcLUEtYaV0aJ2InNZRhXG
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Commit df24e1783e6e ("parisc: Add vDSO support") introduced the vDSO
support, for which a _PAGE_SPECIAL page table flag was needed.  Since we
wanted to keep every page table entry in 32-bits, this patch re-used the
existing - but yet unused - _PAGE_DMB flag (which triggers a hardware brea=
k
if a page is accessed) to store the special bit.

But when graphics card memory is mmapped into userspace, the kernel uses
vm_iomap_memory() which sets the the special flag. So, with the DMB bit
set, every access to the graphics memory now triggered a hardware
exception and segfaulted the userspace program.

Fix this breakage by dropping the DMB bit when writing the page
protection bits to the CPU TLB.

In addition this patch adds a small optimization: if huge pages aren't
configured (which is at least the case for 32-bit kernels), then the
special bit is stored in the hpage (HUGE PAGE) bit instead. That way we
can skip to reset the DMB bit.

Fixes: df24e1783e6e ("parisc: Add vDSO support")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/p=
gtable.h
index df7b931865d2..ecd028854469 100644
=2D-- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -192,6 +192,11 @@ extern void __update_cache(pte_t pte);
 #define _PAGE_PRESENT_BIT  22   /* (0x200) Software: translation valid */
 #define _PAGE_HPAGE_BIT    21   /* (0x400) Software: Huge Page */
 #define _PAGE_USER_BIT     20   /* (0x800) Software: User accessible page=
 */
+#ifdef CONFIG_HUGETLB_PAGE
+#define _PAGE_SPECIAL_BIT  _PAGE_DMB_BIT  /* DMB feature is currently unu=
sed */
+#else
+#define _PAGE_SPECIAL_BIT  _PAGE_HPAGE_BIT /* use unused HUGE PAGE bit */
+#endif

 /* N.B. The bits are defined in terms of a 32 bit word above, so the */
 /*      following macro is ok for both 32 and 64 bit.                */
@@ -219,7 +224,7 @@ extern void __update_cache(pte_t pte);
 #define _PAGE_PRESENT  (1 << xlate_pabit(_PAGE_PRESENT_BIT))
 #define _PAGE_HUGE     (1 << xlate_pabit(_PAGE_HPAGE_BIT))
 #define _PAGE_USER     (1 << xlate_pabit(_PAGE_USER_BIT))
-#define _PAGE_SPECIAL  (_PAGE_DMB)
+#define _PAGE_SPECIAL  (1 << xlate_pabit(_PAGE_SPECIAL_BIT))

 #define _PAGE_TABLE	(_PAGE_PRESENT | _PAGE_READ | _PAGE_WRITE | _PAGE_DIR=
TY | _PAGE_ACCESSED)
 #define _PAGE_CHG_MASK	(PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_=
SPECIAL)
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index df8102fb435f..0e5ebfe8d9d2 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -499,6 +499,10 @@
 	 * Finally, _PAGE_READ goes in the top bit of PL1 (so we
 	 * trigger an access rights trap in user space if the user
 	 * tries to read an unreadable page */
+#if _PAGE_SPECIAL_BIT =3D=3D _PAGE_DMB_BIT
+	/* need to drop DMB bit, as it's used as SPECIAL flag */
+	depi		0,_PAGE_SPECIAL_BIT,1,\pte
+#endif
 	depd            \pte,8,7,\prot

 	/* PAGE_USER indicates the page can be read with user privileges,
@@ -529,6 +533,10 @@
 	 * makes the tlb entry for the differently formatted pa11
 	 * insertion instructions */
 	.macro		make_insert_tlb_11	spc,pte,prot
+#if _PAGE_SPECIAL_BIT =3D=3D _PAGE_DMB_BIT
+	/* need to drop DMB bit, as it's used as SPECIAL flag */
+	depi		0,_PAGE_SPECIAL_BIT,1,\pte
+#endif
 	zdep		\spc,30,15,\prot
 	dep		\pte,8,7,\prot
 	extru,=3D		\pte,_PAGE_NO_CACHE_BIT,1,%r0
