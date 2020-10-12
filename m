Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD33228AE67
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Oct 2020 08:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgJLGvW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Oct 2020 02:51:22 -0400
Received: from mout.gmx.net ([212.227.17.22]:51013 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbgJLGvF (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Oct 2020 02:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602485455;
        bh=VlTv1BZabwNSeBHtUs0Z+ugHWYDJw7Fem2kM+ANWwqg=;
        h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
        b=X4dk89myVlDFUCuUzZ6vP+XipfISAmWzp5Oi4VWWmVj4WG9FRDvlNttN4ahiqMEuW
         sFPoM+FGQGAm9cC1yctT/KASD+hWi4ev5pXbZBj73StWXoesF49wrrJveh+S5Nq3bC
         yTlOqM/76d2DlugYsVUZJsOpDAcMXQrP5bck42V0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.158.71]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mFY-1kM6vj2CeS-0133Eo; Mon, 12
 Oct 2020 08:50:55 +0200
Date:   Mon, 12 Oct 2020 08:50:51 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: PATCH v2] parisc: Add MAP_UNINITIALIZED define
Message-ID: <20201012065051.GA3458@ls3530.fritz.box>
References: <20201010215431.GA30936@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201010215431.GA30936@ls3530.fritz.box>
X-Provags-ID: V03:K1:FcGfCxzVnLGGEz+eRUukrqTdipuqXfkuj+SqafLZ/aLZnFnbcig
 TxhbC08v3wnB7o1IGOu98QeQJV97XS9mN5DEBR7FY0s+T7ArQUBl5fzseq7uSZo95+9EABU
 IvQjzFnCIaLMlcfj2o4vCofUUQsxab99sJ64gd/5YyE1s/jaN1lqPIC21s2KD1/J0gSkIzE
 QMems/XhV/Nn22lzFdyAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DFB/ehBYQXQ=:qoQwEvALctrTAZoSsJmcAB
 XKojGwarfC5QmUhApKNQetUtCFesUDY347G2dWaRdWBLHz7Du+H6WtNn0bcbdPrpASK4tDDVk
 /h78zvHwGGLCkMfCumtG9IhtAoM5jDiSrmA+htVGUbzXhiCB08xVl/sGLvSV4lA9lrat9StZv
 ikw9klLCsArbuf15HvOK0xjaDIZVj0qvdu4Y1qFsZbdpkO95xfRa10HVnxDkY7eb0qApsZsPT
 AMljJdtJTXdeN01sw+vMFIPyl733e1vHxiyLSntXR+cz1bvpPcdjmBtGKK3xe/EMb0+KwG447
 qHRG0ZwSxjyfPeoFwZt1ET+oZY7Apbk4n5sY6Y8ug+UKxKbiyIjj5dO/H+njXzkdZy0vh54Of
 vJbfnlzlVTI0C25dpxo1gQwmOcYdz7odnGD6pBABwRVes/PjfsDW8mjUxzcWUH9DujQOi8WAZ
 D7xvxM3bi0USLYmVAwVIIywenbIG/JElYka1+Bfbfwez5W+50AqiEQKftU3Te5bF41rRI5893
 eEGtheJmns/oVJ28QtAS+FiiB3S1ZPY+PjTareAWgss3GbeoXOZ5b1he4buir/5CFBIioic6X
 4R0AzC1m6ML53ufnydrIL1J4VeujGyEUgtYm1q4pIfgwiH1NwznTH7DLokFLCGvgmQwGxU5C4
 7VVA3SHFOsbUv3vDCP6o18e8n+N2CQpTMjtP/tdwx7T2CI022w19rcsseZBinbkvhuTxhCQDp
 +CIRz5J2DvqOVZFdaaIUXFYh7a2n7zNj5M6w99CpvPReobAb89ftzii4BiSvRvspYvspjImYY
 voLCiMJXxllXAsldwFwGRrMCDkVkZIONq782aVmvFX3GLQFcGRxxEGC1eYXDJkKt4QKa1lw8O
 N4C+7eQ/KmJQ+8tAmJB6Ph3uHMRMwJ8d2TNGYvE54C8zs35xVIJEqU9ZU67MWXblBLm5blKFB
 roTcbzZzmrxatKfpbv/2vjE1hs3U2dKKIwrdpjDa/Hatgxbtvr2UIhG1cFWblmWHjB44q6DjH
 D/suAaU+9AooDfAXZIluP314IXVJC/JkS+W7FUGNAPXfXTmNypiaRvbkcZX7nTU14tvKFb3My
 AuSraqyN0gTeWV1njurL6p3z+YI1kXJYOd6Z5pUULcooLM1M+Cvrg9KO9hf5CAIh830aDNjQV
 c5Xn8DfgAWWw1VyepBDaANTbqPARkcZT1+ygLC9A0hmiHwdjouCAuzAJF4cJFyqowXwSv4UvR
 zV1Y0kfVsOQct+EO8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

We will not allow unitialized anon mmaps, but we need this define
to prevent build errors, e.g. the debian foot package.

Suggested-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uap=
i/asm/mman.h
index 6fd8871e4081..ab78cba446ed 100644
=2D-- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -25,6 +25,7 @@
 #define MAP_STACK	0x40000		/* give out an address that is best suited for=
 process/thread stacks */
 #define MAP_HUGETLB	0x80000		/* create a huge page mapping */
 #define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap und=
erlying mapping */
+#define MAP_UNINITIALIZED 0		/* uninitialized anonymous mmap */

 #define MS_SYNC		1		/* synchronous memory sync */
 #define MS_ASYNC	2		/* sync memory asynchronously */
diff --git a/tools/arch/parisc/include/uapi/asm/mman.h b/tools/arch/parisc=
/include/uapi/asm/mman.h
index f9fd1325f5bd..506c06a6536f 100644
=2D-- a/tools/arch/parisc/include/uapi/asm/mman.h
+++ b/tools/arch/parisc/include/uapi/asm/mman.h
@@ -39,6 +39,5 @@
 #define MADV_SOFT_OFFLINE 101
 /* MAP_32BIT is undefined on parisc, fix it for perf */
 #define MAP_32BIT	0
-/* MAP_UNINITIALIZED is undefined on parisc, fix it for perf */
 #define MAP_UNINITIALIZED	0
 #endif
