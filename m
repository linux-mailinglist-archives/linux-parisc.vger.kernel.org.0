Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C23322A043
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 23:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391765AbfEXVQf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 17:16:35 -0400
Received: from mout.gmx.net ([212.227.15.19]:32957 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391745AbfEXVQf (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 17:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558732589;
        bh=Rxru9r9xRKPbbOADWCsF5uOA+e/FhuEJ4O2hphaK2e4=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=E459sEMWFHSAm1/Ee+vVdiFNBrjFT8hglIJMKZkAyzgr48TvWeYSC0rHoQVZxQ4iM
         gE6Y+Rn6Z95NNyb/JV1XjguikA9ayCTRHKQVejM/mV+J7HfiIbm7UAUwcw4fhaxXKs
         oZnfyYKMgQisF4v/Sk6DIdbGQ80lNUYUMsoV3I5Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.183.223]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LreCz-1gTx0z41T3-013OnS; Fri, 24 May 2019 23:16:29 +0200
Date:   Fri, 24 May 2019 23:16:25 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix compiler warnings in float emulation code
Message-ID: <20190524211625.GA8486@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:dOjrff3Wi43B8VfAbmv+92fQFpbW3y3tV+fNt1o5BVkbB9u3CC0
 ywdAzzTmQdy1+v6BdysgcLjjHjcUNhI7q8dDXI3wGWbwAerg36yCDPj3Z4Z1HafD/ilj6sW
 DtI85dVoxT3y6+kkVjkdBkFZcOQP2xf4NXRxmfpwblDy0BlE5YFLwPlUEgqb5uT5ZxzrYlw
 FJdsuXJ9wGjYsUz7SmlEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rijHebL31Lc=:2tFKU2iC5UhfpPxUkKyQuU
 Inx7MGiK3tHGYx0sduE3az0eJEcqePlRYRmFp9eks6rAVNXAi3u78jHXt/z5xJQjDLNwS4piV
 uODTPpPp2t54q6nV2YzS517g2A+FiD4znQyI/OjnUAtU1qqaOcoKMWynMrgLdGhmx53kc2bHo
 ksrKzLv37s82bIGKITfntO8nfX0hPE94jbMMUor7sIhkKIXGOZnXESW3sLWycVBFg8By4B4xf
 yLD3FzAykcqpVMm7YHoTlYiwiZRsU1Fp+Xn4ffhMf2XH6p6oTx7NcqSj12f31JeTAnW2U183V
 14jhV/+6gDWSOqDCDFUuVE7j4xEIEjvPZ+O8rRcZrisfjYbSiLUk8Ip6sPiP4Ww7H6+KMIAap
 RvDv9h+4dVOCJ0XV/+cm5KJl9/vodCaqV8HCHbfJ8a7+J4sBNkxYioeyQHTHPl1BOo8hyjA67
 pQyDfABjxyGY040FaCXuIGB9Kqj5ui8K7qVRRx+8zYhH9oRLlnga7SBnj/KB/RFef5fTM59Yp
 MQ6ugwefCqE4Uj8xYZBVNdWijKLIKOjpWS44W39z4o8AZN5JY6kA4tURh/TDLPmcr3x3fZjPy
 W6l4Scz0uawZJj/47ovVA6xkQ5mVFeuBCaARwvOVS2VjL/oPsE3siK3ajyfErddd3znLHSGX9
 bTCR7+LpVOMQxNbfXo38WPyyeioH5vXAEMixAVWvL0bgpkgVr0lZ49HFht4Fp5b0JizBdUGcG
 y0HoREtx0ZjcDPp2k4nKrUkA8gESDeEWYAQ0VloOcNsGt2PfxafGZaVjb568wqz60LLpeKFPN
 8WVtl43vZTLI89GPVWqPm7p6pvQGf+JNUCMm6GKBJtLgQgqejhHbN7tCtg/AtpvMnDxZpg1IJ
 /GVZG7277llwjXAO6I2+4mUO8vrokyx1yrCgIemf9YxNUfQwtjBNEO03m+f7P9hxmaivnSDjd
 0u1bMr9581RTQKQ6y4ml/dIsshIEaNNQ=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Avoid such compiler warnings:
arch/parisc/math-emu/cnv_float.h:71:27: warning: =E2=80=98<<=E2=80=99 in b=
oolean context, did you mean =E2=80=98<=E2=80=99 ? [-Wint-in-bool-context]
     ((Dintp1(dint_valueA) << 33 - SGL_EXP_LENGTH) || Dintp2(dint_valueB))
arch/parisc/math-emu/fcnvxf.c:257:6: note: in expansion of macro =E2=80=98=
Dint_isinexact_to_sgl=E2=80=99
  if (Dint_isinexact_to_sgl(srcp1,srcp2)) {

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/math-emu/cnv_float.h b/arch/parisc/math-emu/cnv_f=
loat.h
index 933423fa5144..b0db61188a61 100644
=2D-- a/arch/parisc/math-emu/cnv_float.h
+++ b/arch/parisc/math-emu/cnv_float.h
@@ -60,19 +60,19 @@
     ((exponent < (SGL_P - 1)) ?				\
      (Sall(sgl_value) << (SGL_EXP_LENGTH + 1 + exponent)) : FALSE)

-#define Int_isinexact_to_sgl(int_value)	(int_value << 33 - SGL_EXP_LENGTH=
)
+#define Int_isinexact_to_sgl(int_value)	((int_value << 33 - SGL_EXP_LENGT=
H) !=3D 0)

 #define Sgl_roundnearest_from_int(int_value,sgl_value)			\
     if (int_value & 1<<(SGL_EXP_LENGTH - 2))   /* round bit */		\
-    	if ((int_value << 34 - SGL_EXP_LENGTH) || Slow(sgl_value))	\
+	if (((int_value << 34 - SGL_EXP_LENGTH) !=3D 0) || Slow(sgl_value)) \
 		Sall(sgl_value)++

 #define Dint_isinexact_to_sgl(dint_valueA,dint_valueB)		\
-    ((Dintp1(dint_valueA) << 33 - SGL_EXP_LENGTH) || Dintp2(dint_valueB))
+    (((Dintp1(dint_valueA) << 33 - SGL_EXP_LENGTH) !=3D 0) || Dintp2(dint=
_valueB))

 #define Sgl_roundnearest_from_dint(dint_valueA,dint_valueB,sgl_value)	\
     if (Dintp1(dint_valueA) & 1<<(SGL_EXP_LENGTH - 2)) 			\
-    	if ((Dintp1(dint_valueA) << 34 - SGL_EXP_LENGTH) ||		\
+	if (((Dintp1(dint_valueA) << 34 - SGL_EXP_LENGTH) !=3D 0) ||	\
     	Dintp2(dint_valueB) || Slow(sgl_value)) Sall(sgl_value)++

 #define Dint_isinexact_to_dbl(dint_value) 	\
