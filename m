Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0CA5E9147
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 08:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiIYGlp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 02:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiIYGlo (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 02:41:44 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995303A175
        for <linux-parisc@vger.kernel.org>; Sat, 24 Sep 2022 23:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664088092;
        bh=g5Moh1CPwnSp0U5kqnb7wXhTV9eJE5bDP3aCswABsE0=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Sqbhp4JjeutPcgvwZH/wK6OUS6yVWlLxUKoN8D8GsgGJ/wlKjl9kMsVozpitwzgud
         vX5pZEvJzXn7dSw8BHnnFp+t/3CZgjw38WTLJGYBHvjaGJT/xmH/AlKT79jb5Du9u8
         mJmaGiscBag9gkyaGQS49oIgQS5lPdBxxRiKB2sw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.188.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72sP-1ocbEx0LiZ-008YwH; Sun, 25
 Sep 2022 08:41:32 +0200
Date:   Sun, 25 Sep 2022 08:41:28 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add alternative prefetchw() on 32-bit CPUs
Message-ID: <Yy/4GF75gFz86ZAH@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:ZsQSDm5r4zssr9lwJgYJ4Jn5h52mUe7t74Ev8M8iJ3xh8Y3M3cQ
 8rGPRzF1e/Da7uBtAVaVMQ7PaspxtO8PE437quCEJHIhNIwi85jL4lEIbwby6IUq5lELJWX
 9O7oXhgDfDVWqwGUwReVr2vZsvIjiDhG7BADXImsncvqzoJ4+V2uO3y8Q4FnkHlmBfUpTz5
 zmhX2s7wknen9jcnbTkjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8jsp8TK+7B4=:XVGvvYhsTavL65+xLKF+rs
 2sf/gMVFXyxLekASCcKIBxlsIy8Krb+XCU3kSjQ43Pz1Kym3NMyb2cmqsTskgXIIzme/0FHcZ
 W/j96NqIdyXzpipJXE2iRYAt5dh8y3r+Rnwz2T/+qPd6PhBcKnSb8xTGBC/155BcjLUyn1w9U
 58ey+jsWRHcY08vcnBhuYTDL805tVTjDib0G90QiwNlWHEdK9qhihkc86So21axZloRilODn6
 cajbjRKValEl6vfHDHQUdgnwxcJykNUlhTSXmujEY9dzj3Y+JvZ7B9T8Bi0pVmrj0tyEnTres
 GCL5YqIty6xdzvRswmCh1ufr0fY3/1At1xxmxihUMonhcHE73m/HU11WUtE8R9La9NRXDVk30
 tFMfb0KAkZ0gz869vYHWNSK2CTovAbN/J8lawDGXRGlhrR1959DPy0oTjypghNPA+iBF1LBGQ
 fqxJlzNBRiSLqKD6D0YOUXrWtUnR92Id7zc2tuv/xeBEVpBa4473s+ALa1tozR+aeyb/u+LK1
 uWCkkT0mX5WDzqKrf3HQxkgcW3DWJipVmD93Nzr0WssfcZQLRwg8iDBFZtV6/HKdzLLeAmGhC
 NE1zMCWJfpvhkEbh3EPJqBOcWAwKWwmCYPkHbfDAe9UDYCTaC6iMaDuex79y5HBsIGu8b21pO
 VtRGUN3zjE3mXHtMvMszHS6xSYPArf7bqQ1cPtoQxyaMdcZt52VSnNxUhlJQF+5+cfoMT93nP
 ulL9sTC8mLCCEpMfs2Vf0x19o/KAqFJH7Vz8tAhxNSmNf1As+Nowdl+6NEzYgOgVepEEQY+Od
 t6LmWYxrxixuYG/UGuRJbcuoq4L6SeY7kXMYjdTn0u8EJFS9cohEFaU4kUE4plUbcDC7HY2TB
 hEalRvM+lzFUvF2Ap8ONX5+VqxLDiN/2tHt7R4HVGvwcFasBjv5JGlNXNq6FBZmtksLySSznn
 ofujNykuEYp/njT2Zfw9lpJl+2kNftp/QWdCKOmHKNDqhjdcexmLTlJsRJoBWEwcSjSymbBQZ
 G5ouZllxWcZKRPnWOxMvJWFBL098G3ZgTbo3iYlhdJK885vyy9zUllabuw4jxDcBqxpI/D9yN
 fZRlY3C4sYgONqeW9XhzWkepX/1OXPctIbKBzeLRU9WhZrF3ol/eGqpw+PDwprFAJXIpegB4f
 PJvgU7kN6rSlOAhb4Um8gD1LHx
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add the ALT_COND_RUN_ON_PA1X alternative conditional to nop
out a 64-bit ldd instruction in prefetchw() when running on 32-bit CPUs.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/alternative.h b/arch/parisc/include/a=
sm/alternative.h
index 0ec54f43d6d2..8b94aa4f1bd7 100644
=2D-- a/arch/parisc/include/asm/alternative.h
+++ b/arch/parisc/include/asm/alternative.h
@@ -9,6 +9,7 @@
 #define ALT_COND_NO_SPLIT_TLB	0x08	/* if split_tlb =3D=3D 0  */
 #define ALT_COND_NO_IOC_FDC	0x10	/* if I/O cache does not need flushes */
 #define ALT_COND_RUN_ON_QEMU	0x20	/* if running on QEMU */
+#define ALT_COND_RUN_ON_PA1X	0x40	/* if running on PA1.x CPU */

 #define INSN_PxTLB	0x02		/* modify pdtlb, pitlb */
 #define INSN_NOP	0x08000240	/* nop */
diff --git a/arch/parisc/include/asm/prefetch.h b/arch/parisc/include/asm/=
prefetch.h
index 6e63f720024d..ea898362dfc0 100644
=2D-- a/arch/parisc/include/asm/prefetch.h
+++ b/arch/parisc/include/asm/prefetch.h
@@ -17,6 +17,8 @@
 #define __ASM_PARISC_PREFETCH_H

 #ifndef __ASSEMBLY__
+#include <asm/alternative.h>
+
 #ifdef CONFIG_PREFETCH

 #define ARCH_HAS_PREFETCH
@@ -35,7 +37,9 @@ static inline void prefetch(const void *addr)
 #define ARCH_HAS_PREFETCHW
 static inline void prefetchw(const void *addr)
 {
-	__asm__("ldd 0(%0), %%r0" : : "r" (addr));
+	__asm__("ldd 0(%0), %%r0"
+		ALTERNATIVE(ALT_COND_RUN_ON_PA1X, INSN_NOP)
+		: : "r" (addr));
 }
 #endif /* CONFIG_PA20 */

diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alterna=
tive.c
index daa1e9047275..276904ab7265 100644
=2D-- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -33,6 +33,7 @@ void __init_or_module apply_alternatives(struct alt_inst=
r *start,
 		((cache_info.dc_size =3D=3D 0) ? ALT_COND_NO_DCACHE : 0) |
 		((cache_info.ic_size =3D=3D 0) ? ALT_COND_NO_ICACHE : 0) |
 		(running_on_qemu ? ALT_COND_RUN_ON_QEMU : 0) |
+		((boot_cpu_data.cpu_type < pcxu) ? ALT_COND_RUN_ON_PA1X : 0) |
 		((split_tlb =3D=3D 0) ? ALT_COND_NO_SPLIT_TLB : 0) |
 		/*
 		 * If the PDC_MODEL capabilities has Non-coherent IO-PDIR bit
