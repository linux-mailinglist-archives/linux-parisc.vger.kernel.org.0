Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E729D3FCEC5
	for <lists+linux-parisc@lfdr.de>; Tue, 31 Aug 2021 22:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241203AbhHaUrb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 31 Aug 2021 16:47:31 -0400
Received: from mout.gmx.net ([212.227.17.21]:44025 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241038AbhHaUr1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 31 Aug 2021 16:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630442781;
        bh=AfqmrfKgu8v0/wg7CtrEep36aQ0RxNAn/CufTZYSRS8=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=dmQWnTWYIuRXm8EfV4H1Zwe50YaO5gxMqw48bbgsyEs9g8q5CtzsJOUXsCfwPfpHV
         HHxrVlwHRqChpyLz0Q4Yqz0kzrmh+DCpknRiRGJOxi9rn0wQ8iF8O9WeSfJOOz9y8A
         TndqVlCNYapAXq4sKmECMnuhPexYTpbsoMSG/e4E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.173.235]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeMt-1mYBMV45pb-00VjCm; Tue, 31
 Aug 2021 22:46:21 +0200
Date:   Tue, 31 Aug 2021 22:46:18 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix boot with kernel v5.14
Message-ID: <YS6VGsZ7fZtZeu/i@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:fKag6vA2X72AVzE/37H+h2DOxbiGKbYqwKDC/Ygjvnf8c9L5S9j
 VpSBGOfEsMQOgl0+VDnhojRsVlyT/YN96hidKSGeBST/iJjeER3Fj2b5zT0c8U/BrBzCbfB
 EY6GHVbwHX47K6CJyeoFZWQnIvFqiV/rN4dYVooA1X2GfMLCtW4LQw3YkW1CtrVKAvgY++P
 CCkZYPT1Xq78cj5hdhdaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ync+drwqhpg=:SD6JkVMdh/Q8sKuKDvUC77
 6DTjPHqaFUMHxo5YBHtLK1Y5XdQ1ldY4hfdDkiinWvHRbE2dLCj9WPRiV4Z4YKPpHASK1DYVS
 +Cze1b1Mavkbbdqd1SNPZjiE2tQ5+AP1iVTC4b+w1yqGp+Kcn12eLPeLCQjx1S+T1h7ykRtRI
 r5vK6JHz7ILC+uLZtllPKvVkU2Fv2tZhRPZzqWFZsqpsUGWrqt1Idd6tbjjbIXSMgV3M6p5Fh
 0DsCGuwjT/vLoh3UTYTFY2vbcq5lpP6Q4p7gt9SW4gwmoTqdX9oGmmFxkMEOTo4batsamsI8x
 ONSeTo49oXA0HY0xQ2QFoa/nBKz0AXrd2dnsAHsSLrmsqJASYetWxVtzH/93aXeD7T3LNQN6w
 mYTgFEI8FNfhZ1sCWkWYnrzQ//NPmhWV6nBGLI478WKg+7Yxs9jBDPydYp+tBlEenDCclOCgP
 ckR51xB6iz5FBsookdWfIA1c2U6kA9y5ZDogeS5jXZdSFdueGnxuZTepxX7WlQ33Wy2A0Cxg+
 EG3MveyBSxhpS/JbWQcySZ4595WV3idFWqZYtKXvEKpxRmlIYALtrRZTF8XKs7vCWtOGv4LRm
 94cNjrWO4ciGYR+BKPdVScnPoGzsgedBONx8tiXoEOs/0KGz6J7BSvvRV+U7uSagaISdfPxxp
 kyKKJzLdGogzJ6lcL5y0dKaOSRjddQpLIbex8RvISoMERdeula6kMvs8uhjKx/gLiGnH8Ex7W
 agVgbD75LCA6DHkGcypKB1K0wPrTUd1X5Wp5LLIC9nTZsgiGzOnQEcGodEKyIahlPpGgtFAun
 CHXLPpw3JnJBASWAgzaT86DOeK7TF+iLNf2hHoZq3Lp/HomFpGliYyftqvjpPer1c5WmG2tBI
 wD0qSN+7PtVo45jelVQU1pA3A5/gIAhn4JN72mH06Jgd1L6Tiox6L+ccb93FvbZiajIzKLDso
 vlJa2PLkgAXoyt1/GJ6/FndwSw2+4Q4lTOOhLbA395TMrFE4Vl05N/1SoL7YdmE9pawvW1h8I
 Iv1BEy9eb9upNUG27ATpK+qWeUddIB3ZW8p4n2j06RNG8FRxEkYlTs8mvJgAtNSql/f9OT49T
 SPDKYwtwumNe9j3RtUHq58Mk0DJwWT+BaXx
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Kernel v5.14 has various changes to optimize unaligned memory accesses,
e.g. commit 0652035a5794 ("asm-generic: unaligned: remove byteshift helper=
s").

Those changes break the bootloader on parisc which needs byte-wise
accesses to unaligned memory.

Below is a *** temporary *** patch/hack which fixes those boot problems.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--

diff --git a/include/asm-generic/unaligned.h b/include/asm-generic/unalign=
ed.h
index 1c4242416c9f..3ef9a5dd35b5 100644
=2D-- a/include/asm-generic/unaligned.h
+++ b/include/asm-generic/unaligned.h
@@ -9,10 +9,21 @@
 #include <linux/unaligned/packed_struct.h>
 #include <asm/byteorder.h>

+#if 0
 #define __get_unaligned_t(type, ptr) ({						\
 	const struct { type x; } __packed *__pptr =3D (typeof(__pptr))(ptr);	\
 	__pptr->x;								\
 })
+#else
+#define __get_unaligned_t(type, ptr) ({						\
+	unsigned char *a =3D (unsigned char *)(unsigned long)(ptr);		\
+	sizeof(type) =3D=3D 1 ? a[0] :						\
+	sizeof(type) =3D=3D 2 ? a[0] << 8  | a[1] : 				\
+	sizeof(type) =3D=3D 3 ? a[0] << 16 | a[1] << 8  | a[2] : 			\
+	sizeof(type) =3D=3D 4 ? a[0] << 24 | a[1] << 16 | a[2] << 8 | a[3] :	\
+	 0 ; \
+})
+#endif

 #define __put_unaligned_t(type, val, ptr) do {					\
 	struct { type x; } __packed *__pptr =3D (typeof(__pptr))(ptr);		\
