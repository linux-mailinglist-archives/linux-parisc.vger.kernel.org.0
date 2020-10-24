Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A071297BF1
	for <lists+linux-parisc@lfdr.de>; Sat, 24 Oct 2020 12:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761030AbgJXKnX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 24 Oct 2020 06:43:23 -0400
Received: from mout.gmx.net ([212.227.17.22]:36525 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759013AbgJXKnW (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 24 Oct 2020 06:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603536195;
        bh=olDr1e/tUfHAWnewCc3DfaWr+ZN0/eNiOa6CSfj+B8o=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=bPA1TuNBBK7pRDFAfWMnUemvWnoqU2eGR711oorUn/6nS4xe0gTnAppS+hNayCyI0
         LGbi+ct9gSjGSfSGfQqzJ/GAFgpDOGg6UK4V4YbPPFryJURw13dsL6mfU4ZfVENQU3
         WZ35ACS6+EjInwM5h0jeKIbBGf4pIFbapwyhLZ38=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.128.3]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1jyJmJ1HUC-00cicw; Sat, 24
 Oct 2020 12:43:15 +0200
Date:   Sat, 24 Oct 2020 12:43:11 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Drop loops_per_jiffy from per_cpu struct
Message-ID: <20201024104311.GA28699@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:0eJTUY+paUxE/jHSw+rWzQ4jHtNB66srGYfgBsZyQjuoT9tsAsn
 UWY0ungX68fjnKZX8zkrWZzApkhA20/Y2av2t96ANvLMdP8zk6h+7ZdjtJrzA0T39Yu4xpB
 j8n1wzGxrwd30qx/dwL87lrkLqjxxy/SAt7ieD02grdR94nqKK0XmNQsHfK8DRpivnq8/X0
 cWy7UYjmubcc1mbuVjvMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2J36iquQhkU=:ZYtPWwRZYzu8jiygL1VSdF
 bG9IXAll9KQVZgAWUqmdQzGwMi06VWsIWELetyxf110MnvgPqfwbDemu9iX0WziFRj8LZ6o9A
 Bys2kP0iMbkgRbYQVHBag2tnPXNEa8UQ0CZuz0CmN8TmEuibk/gV57o1CiHO3K2PFT6s8b2eI
 ukv/m804UF7ckf97swDTMJUq9V4tEepx9n5i4R5c9XhGwL8RM8Bx1MHdfL0NEIYOjmNo9oDiQ
 s61/AoYT2MOdEwIntZDcRLhAeBxIoa38XTy+6su4QY3aH5G093b7mJWuN7d5wqJfPrBibAO3E
 HskzdLquBwCD++Vk7mXZOEe3hnZDAee+BvKElobR5dpXLhez6eNF4wGWoyzj8SFA3lOca7EwI
 inE8GEyLtdn+eINb4kRX9ofG2i+mmHkY/n5wQwcmvUxggb7UNmamT/secEWY/veGx8nel/CoX
 wM4QvBKssB7v0DDRCLTWGJp0gVwFlCotsVdZVP2QMngPFxyQeoQDMFjfn5xMRMLonAZ+h9pZm
 qFiforAGkaGKKOcGGXl9lPizkMohZVKFjzSJBd8PLuE0CrEobsW0t/g5goJrKzMjXmqA2UBkn
 diM1Qs7Wy9zn2EB+kMo/uZWXGh5o2P7A9I/sAWtuX72skcePQ9O8YTOQTcFaYnprI5GeS3q4O
 w475fzTjeIBm33pM8LtYR+cgDtRBjQDVEb2gkpi0fuNs0VHTZYviIGRZfe4fl1E0zN5p+djHr
 qpa4JW/kqMuElrHNnZuD78SPKu+VD2fDk2AAKybXYwQoE6oDexbHmbKyz7RY/ujaeuFOXHzb8
 WbYqnmVaPCsWR13uLugT1ZdNMoPgiXy1WHWHCx+1obduluiwD+RGZMdV92aVGkNj1w6GJ2t7Y
 ++bFuY0JX8ECLkhA1Qig==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

There is no need to keep a loops_per_jiffy value per cpu. Drop it.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm=
/processor.h
index 6e2a8176b0dd..0f7e30547dab 100644
=2D-- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -97,7 +96,6 @@ struct cpuinfo_parisc {
 	unsigned long cpu_loc;      /* CPU location from PAT firmware */
 	unsigned int state;
 	struct parisc_device *dev;
-	unsigned long loops_per_jiffy;
 };

 extern struct system_cpuinfo_parisc boot_cpu_data;
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor=
.c
index 7f2d0c0ecc80..1b6129e7d776 100644
=2D-- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -163,7 +163,6 @@ static int __init processor_probe(struct parisc_device=
 *dev)
 	if (cpuid)
 		memset(p, 0, sizeof(struct cpuinfo_parisc));

-	p->loops_per_jiffy =3D loops_per_jiffy;
 	p->dev =3D dev;		/* Save IODC data in case we need it */
 	p->hpa =3D dev->hpa.start;	/* save CPU hpa */
 	p->cpuid =3D cpuid;	/* save CPU id */
@@ -434,8 +433,8 @@ show_cpuinfo (struct seq_file *m, void *v)
 		show_cache_info(m);

 		seq_printf(m, "bogomips\t: %lu.%02lu\n",
-			     cpuinfo->loops_per_jiffy / (500000 / HZ),
-			     (cpuinfo->loops_per_jiffy / (5000 / HZ)) % 100);
+			     loops_per_jiffy / (500000 / HZ),
+			     loops_per_jiffy / (5000 / HZ) % 100);

 		seq_printf(m, "software id\t: %ld\n\n",
 				boot_cpu_data.pdc.model.sw_id);
