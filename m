Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4683FFB80
	for <lists+linux-parisc@lfdr.de>; Fri,  3 Sep 2021 10:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348131AbhICIFM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 3 Sep 2021 04:05:12 -0400
Received: from mout.gmx.net ([212.227.15.18]:57233 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348136AbhICIEw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 3 Sep 2021 04:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630656218;
        bh=M+euPP0Dui5a3lhd99Ng3eq1DJNuyQWmiCTOeMmM1XM=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Bm3fi0dJrVxf6zJujSImlZs8UkTeCCKkCwyriKf+ndf6omc+/iuqmSnf6LtevqK1p
         fQjjJgHvZYFkkj979RR0uSRGyiauFC2r1dJF58vPKQfo1GyZmwReIj6G7aEZuhVXAJ
         ZSAdLNecAsN/s4cAiC7YJudXMsvx6ixDvbiL2LYk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.183.73]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO2E-1mk9WE1Dy4-00omWU; Fri, 03
 Sep 2021 10:03:38 +0200
Date:   Fri, 3 Sep 2021 10:03:24 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Drop __arch_swab16(), arch_swab24(), _arch_swab32()
 and __arch_swab64() functions
Message-ID: <YTHWzLrVpZV/dk8n@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:4NaDPefcyTqtYizdvVEhEW0+2tm4zWug6t1jx7u172YpEd3wA8p
 hayq3F0Yz+EPI9U+fa48SsEvBVxO1uZSjKI9NwrUKNzDsj0VIUm6QzYxo+APZGW+waQYE+6
 S57wb74ynxtmBHnf4b3zdk/n+dDBpA7RL+9FGjRnSNA7+GBGMuN8hBC7+6GrDN18p61X5py
 4/q8m3qSxWqX1Ln1Uwwjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3noE9eFyzss=:uztt+OQ8FRmWao1sqrtjoT
 MlNK8cdyVd7eZ/mD8438gJYY6gLmh8AKbL0CPDtnDw6hI+Xb2qh4cdqjU5eRIiBdCFGnOh8+t
 MFtbmZuTBFsMkIVx9FQvIANaGiz7iEVNVZwGLfUuQPjcACFvJEJDNjFOH1VEd+zPMZWwAOdnV
 1cHBA/XexT/XU2g7RvaEoSIeKsMzGuGIQSzIIwsJOjueeGQ5GQ9NSNw/rglasQBUvqGbXYQsw
 SKicEFvYBL8Kf+jK0Y2PTuZQixtREa5i0/CBSV7l2GVqMwjLBDc4UeEqV0XqlDG1QDrtFPDWr
 KFR0hwgcwlmi/KC+LfMhdKRqJXW/v1cl4EG11x2g+Ygz1CWr9fUhmvyBouUd4V9rsKFQ9TWbN
 Xx2s+IoS0CEcZHWgaz+v02619YCMq7wdBYpQtUzDDQr1a/ramFUm1qVsy0tmjT0DDq1pzwyEi
 hOnxP6QiAH2eO7qGJhnqtpMat4U3pnBBadLluCSPkbrz00E9vWJRiPpHWqz6CGUXb+pZnycSo
 F1QcfFEb4sgTaU/yOyw8urdbvlgpkLyFVinKwdKGLw+dzhysxHANkcwnSJDXVw4ceX3jQSEao
 ynUZCxZeXMn8IR4FbiZQJTWkIIsxKE5iZAjCwsZ4ZM3M+sDI6smdkAQbFhYFWYZl56AFYn6Ed
 AAOs5yaV1vyjNcDuXO1AshLClGzh25BKS50+al7SP9V3EGPA6gStA8PBz5tsjOx7J9WmAghUD
 ZYDvp7g4gU5ZjcidFs34xV1plC+b8XPAnc7dPtfz9VmiWrEKqopHUyWKd4+q/Fd8syttO7o70
 SAyZdBG3Vl2Ky1ORGOUAK3/67dN6vn5rjtLINVdBbnv1ds5r0qpNtMF34rFLf9ZGOPqHaua6w
 xZzKvK5om7TaGdI+PZug+A7US2hkbofdhilM4Vyt5L2aM1E7Ixzql45RG9gygIwHN8KUNC2xa
 ilUWYHtrphs3uT2OmzjBw8JLGnUhOy32NFhtVxPQgF8QpfACUvrCDlb6EZcAATQTGEtLcm+F1
 fzvOMxP7Gp87dO9F+U8fUeaVeRiGICRt/YTSQktuZrSDdnWnCezo8XdKieNOV+Vy3pxEeWaME
 ulQc+qXoyIUW1zDjp9DuTggJxCVGKzr1PvI
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

No need to keep those as inline assembly functions, the compiler now
generates the same or even better optimized code.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/swab.h b/arch/parisc/include/uapi/asm/swab.h
deleted file mode 100644
index 35fb2d1bfbbd..000000000000
--- a/arch/parisc/include/uapi/asm/swab.h
+++ /dev/null
@@ -1,68 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _PARISC_SWAB_H
-#define _PARISC_SWAB_H
-
-#include <asm/bitsperlong.h>
-#include <linux/types.h>
-#include <linux/compiler.h>
-
-#define __SWAB_64_THRU_32__
-
-static inline __attribute_const__ __u16 __arch_swab16(__u16 x)
-{
-	__asm__("dep %0, 15, 8, %0\n\t"		/* deposit 00ab -> 0bab */
-		"shd %%r0, %0, 8, %0"		/* shift 000000ab -> 00ba */
-		: "=r" (x)
-		: "0" (x));
-	return x;
-}
-#define __arch_swab16 __arch_swab16
-
-static inline __attribute_const__ __u32 __arch_swab24(__u32 x)
-{
-	__asm__("shd %0, %0, 8, %0\n\t"		/* shift xabcxabc -> cxab */
-		"dep %0, 15, 8, %0\n\t"		/* deposit cxab -> cbab */
-		"shd %%r0, %0, 8, %0"		/* shift 0000cbab -> 0cba */
-		: "=r" (x)
-		: "0" (x));
-	return x;
-}
-
-static inline __attribute_const__ __u32 __arch_swab32(__u32 x)
-{
-	unsigned int temp;
-	__asm__("shd %0, %0, 16, %1\n\t"	/* shift abcdabcd -> cdab */
-		"dep %1, 15, 8, %1\n\t"		/* deposit cdab -> cbab */
-		"shd %0, %1, 8, %0"		/* shift abcdcbab -> dcba */
-		: "=r" (x), "=&r" (temp)
-		: "0" (x));
-	return x;
-}
-#define __arch_swab32 __arch_swab32
-
-#if __BITS_PER_LONG > 32
-/*
-** From "PA-RISC 2.0 Architecture", HP Professional Books.
-** See Appendix I page 8 , "Endian Byte Swapping".
-**
-** Pretty cool algorithm: (* == zero'd bits)
-**      PERMH   01234567 -> 67452301 into %0
-**      HSHL    67452301 -> 7*5*3*1* into %1
-**      HSHR    67452301 -> *6*4*2*0 into %0
-**      OR      %0 | %1  -> 76543210 into %0 (all done!)
-*/
-static inline __attribute_const__ __u64 __arch_swab64(__u64 x)
-{
-	__u64 temp;
-	__asm__("permh,3210 %0, %0\n\t"
-		"hshl %0, 8, %1\n\t"
-		"hshr,u %0, 8, %0\n\t"
-		"or %1, %0, %0"
-		: "=r" (x), "=&r" (temp)
-		: "0" (x));
-	return x;
-}
-#define __arch_swab64 __arch_swab64
-#endif /* __BITS_PER_LONG > 32 */
-
-#endif /* _PARISC_SWAB_H */
