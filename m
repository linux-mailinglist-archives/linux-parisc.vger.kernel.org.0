Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88EF03FE3EE
	for <lists+linux-parisc@lfdr.de>; Wed,  1 Sep 2021 22:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344919AbhIAUXN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 Sep 2021 16:23:13 -0400
Received: from mout.gmx.net ([212.227.15.15]:44751 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244880AbhIAUWo (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 Sep 2021 16:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630527692;
        bh=HDVttNBDHOLitwP15LZkW6CwFMdVgOGYarMFlSvNZ80=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=BRNv0FQcS/GyOOhgnIZ5YHiC/Sy279etL7K1iwGc27bNcDQulxmnTMpb6fFHh6Bd3
         mAkaouONExXVJqRkV1K5oi0b3+uliCLJoiA4g1NFwfdfXkd2nViXdKRdqOWoPV2FpF
         77FF6Egs7w7a33adXugQvIvLDg0DShpZMNE3ORtY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.182.80]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s0j-1mJbrQ3tHb-001xnn; Wed, 01
 Sep 2021 22:21:32 +0200
Date:   Wed, 1 Sep 2021 22:21:27 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: math-emu: Fix fall-through warnings
Message-ID: <YS/gx3Scv+XTY1hc@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:vmg3Dv9KTX9CiSDAbcgTyW1aSYN80/qacq1KCfonH3+oU9XSpXB
 F4lI8JGUFIslr7csRC7ajiLI977jtOsKt/KDK2ggXlc07v8HGcc5PjzbDqf5ZP7JjLnbPbN
 6ufW3IReUnketffwTc7GYn91gA5UhOvWOrFeY3UGrg5PWnbIKs2fBJ6AosPiu/UXJHG67h0
 uwGhSIaPj8Xh9So28gPiQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YiQtu4MWq2s=:kdVxaaWDcoQ24PtJV2fYV1
 Kqtuv29lRTnaKN1tnH8A/1FQjYZzL0+lST105M6wX9waITfwn5lKB+x7m7n59kwCEhAvca3T9
 wISK9K98nSArtSzzIFEr9dIkXCjTUd28Tz8c+mqSKs7KX8wNTYvP2O1yRbTLyrEUW+b7fpQLe
 IcDGx12O3MEuqlgtWAlnTzbihXtFOxLKNZdZzNArJegb3so4pR6jHfHiejYMf8GGlC9JmT5+S
 XfZ8T4gIvZ987mh8J0MLCUYb1We77JAJrhLJEtaTMYHTpD4L1C1x5mYwZXmYR6Eg/0z6ZxXrA
 9U7JSbmXz4AK55646MPIBrNzKSje8pR1Uyuiv2xwqLltrZzKZ83UextW1he3WapxqKt5IgtrV
 PB7efH/8RFJOb2Nw155iyU64WpcOSpu9/WVewuOQErJBwhKGepv6dYqEzodQl5ULkJeTyLFnK
 +GnbEWy69NWz2O/6Ew+zNh0MUo1QcnAE6Lki4CuTzsy7GjTSRAbmSGXFJL3p+Rvwgs1NhkuzM
 o5YgkFwrjvBjV3DMwlASlXlbyyqO0o4z7SJusQ3EzyS5DnHJ/bLi0vzjYVQShxvrlRhONkqDD
 2CakpGPyWdKew8h8eXcBdsIuTL7j3/30Dxp3hj7QIxVip1BSVJ3wcOcaf/ytSpIJp/UDBAaS3
 fc8gcuY1BsdkbZj+FMY98G3D6PcXV1BKf8t96SckXPlcC5l8uTWgeItN/AVMIqWtIOFAgHIkQ
 zE8R/v0mSOYwVjyaDBQYZPjF2hK2psEyCLq8A9O/5yvx1JXEDM3gPbk0uSe06O3xeMrVEpeSV
 ETye24XTRW7YUH2+mUEL0FDqB9l8EGL0pQ2kipQygwvuBfXKROmqCSA/HH+/VIfRMkyqGQzI1
 LgKS65R1DZ2OIgo07AjDy6w2x4uTASkA95uiUu+3RzOpJcqsfxIcYN1LUvPYSm+oJ1oR7zsjQ
 PHyGqE2sQsx1L1d69GWIPkS1hyVUKRor0YxhJFqPY0FPaDBwca33PLZS3Vww1J6yuFYcXWcIS
 abKl48CGpjP2jJ3KMxk1a+Jht0wv27lw1VO9fn8RkUVqES9yt3tjd/uZgW7Yz91ULSVGycBpR
 rd+4TjwTumVvmZCO3n+4xFUPkY24x8OYGcxrmOCjSUXscsPPC/aIFs7qg==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix lots of fallthrough warnings, e.g.:
arch/parisc/math-emu/fpudispatch.c:323:33: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/math-emu/fpudispatch.c b/arch/parisc/math-emu/fpu=
dispatch.c
index 7c46969ead9b..01ed133227c2 100644
=2D-- a/arch/parisc/math-emu/fpudispatch.c
+++ b/arch/parisc/math-emu/fpudispatch.c
@@ -310,12 +310,15 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int =
fpregs[])
 					r1 &=3D ~3;
 					fpregs[t+3] =3D fpregs[r1+3];
 					fpregs[t+2] =3D fpregs[r1+2];
+					fallthrough;
 				    case 1: /* double */
 					fpregs[t+1] =3D fpregs[r1+1];
+					fallthrough;
 				    case 0: /* single */
 					fpregs[t] =3D fpregs[r1];
 					return(NOEXCEPTION);
 				}
+				BUG();
 			case 3: /* FABS */
 				switch (fmt) {
 				    case 2: /* illegal */
@@ -325,13 +328,16 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int =
fpregs[])
 					r1 &=3D ~3;
 					fpregs[t+3] =3D fpregs[r1+3];
 					fpregs[t+2] =3D fpregs[r1+2];
+					fallthrough;
 				    case 1: /* double */
 					fpregs[t+1] =3D fpregs[r1+1];
+					fallthrough;
 				    case 0: /* single */
 					/* copy and clear sign bit */
 					fpregs[t] =3D fpregs[r1] & 0x7fffffff;
 					return(NOEXCEPTION);
 				}
+				BUG();
 			case 6: /* FNEG */
 				switch (fmt) {
 				    case 2: /* illegal */
@@ -341,13 +347,16 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int =
fpregs[])
 					r1 &=3D ~3;
 					fpregs[t+3] =3D fpregs[r1+3];
 					fpregs[t+2] =3D fpregs[r1+2];
+					fallthrough;
 				    case 1: /* double */
 					fpregs[t+1] =3D fpregs[r1+1];
+					fallthrough;
 				    case 0: /* single */
 					/* copy and invert sign bit */
 					fpregs[t] =3D fpregs[r1] ^ 0x80000000;
 					return(NOEXCEPTION);
 				}
+				BUG();
 			case 7: /* FNEGABS */
 				switch (fmt) {
 				    case 2: /* illegal */
@@ -357,13 +366,16 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int =
fpregs[])
 					r1 &=3D ~3;
 					fpregs[t+3] =3D fpregs[r1+3];
 					fpregs[t+2] =3D fpregs[r1+2];
+					fallthrough;
 				    case 1: /* double */
 					fpregs[t+1] =3D fpregs[r1+1];
+					fallthrough;
 				    case 0: /* single */
 					/* copy and set sign bit */
 					fpregs[t] =3D fpregs[r1] | 0x80000000;
 					return(NOEXCEPTION);
 				}
+				BUG();
 			case 4: /* FSQRT */
 				switch (fmt) {
 				    case 0:
@@ -376,6 +388,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 				    case 3: /* quad not implemented */
 					return(MAJOR_0C_EXCP);
 				}
+				BUG();
 			case 5: /* FRND */
 				switch (fmt) {
 				    case 0:
@@ -389,7 +402,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 					return(MAJOR_0C_EXCP);
 				}
 		} /* end of switch (subop) */
-
+		BUG();
 	case 1: /* class 1 */
 		df =3D extru(ir,fpdfpos,2); /* get dest format */
 		if ((df & 2) || (fmt & 2)) {
@@ -419,6 +432,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 				    case 3: /* dbl/dbl */
 					return(MAJOR_0C_EXCP);
 				}
+				BUG();
 			case 1: /* FCNVXF */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -434,6 +448,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 					return(dbl_to_dbl_fcnvxf(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 2: /* FCNVFX */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -449,6 +464,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 					return(dbl_to_dbl_fcnvfx(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 3: /* FCNVFXT */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -464,6 +480,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 					return(dbl_to_dbl_fcnvfxt(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 5: /* FCNVUF (PA2.0 only) */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -479,6 +496,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 					return(dbl_to_dbl_fcnvuf(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 6: /* FCNVFU (PA2.0 only) */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -494,6 +512,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 					return(dbl_to_dbl_fcnvfu(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 7: /* FCNVFUT (PA2.0 only) */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -509,10 +528,11 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int =
fpregs[])
 					return(dbl_to_dbl_fcnvfut(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 4: /* undefined */
 				return(MAJOR_0C_EXCP);
 		} /* end of switch subop */
-
+		BUG();
 	case 2: /* class 2 */
 		fpu_type_flags=3Dfpregs[FPU_TYPE_FLAG_POS];
 		r2 =3D extru(ir, fpr2pos, 5) * sizeof(double)/sizeof(u_int);
@@ -590,6 +610,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 				    case 3: /* quad not implemented */
 					return(MAJOR_0C_EXCP);
 				}
+				BUG();
 			case 1: /* FTEST */
 				switch (fmt) {
 				    case 0:
@@ -609,8 +630,10 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int f=
pregs[])
 				    case 3:
 					return(MAJOR_0C_EXCP);
 				}
+				BUG();
 		    } /* end of switch subop */
 		} /* end of else for PA1.0 & PA1.1 */
+		BUG();
 	case 3: /* class 3 */
 		r2 =3D extru(ir,fpr2pos,5) * sizeof(double)/sizeof(u_int);
 		if (r2 =3D=3D 0)
@@ -633,6 +656,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 				    case 3: /* quad not implemented */
 					return(MAJOR_0C_EXCP);
 				}
+				BUG();
 			case 1: /* FSUB */
 				switch (fmt) {
 				    case 0:
@@ -645,6 +669,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 				    case 3: /* quad not implemented */
 					return(MAJOR_0C_EXCP);
 				}
+				BUG();
 			case 2: /* FMPY */
 				switch (fmt) {
 				    case 0:
@@ -657,6 +682,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 				    case 3: /* quad not implemented */
 					return(MAJOR_0C_EXCP);
 				}
+				BUG();
 			case 3: /* FDIV */
 				switch (fmt) {
 				    case 0:
@@ -669,6 +695,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 				    case 3: /* quad not implemented */
 					return(MAJOR_0C_EXCP);
 				}
+				BUG();
 			case 4: /* FREM */
 				switch (fmt) {
 				    case 0:
@@ -681,6 +708,7 @@ decode_0c(u_int ir, u_int class, u_int subop, u_int fp=
regs[])
 				    case 3: /* quad not implemented */
 					return(MAJOR_0C_EXCP);
 				}
+				BUG();
 		} /* end of class 3 switch */
 	} /* end of switch(class) */

@@ -736,10 +764,12 @@ u_int fpregs[];
 					return(MAJOR_0E_EXCP);
 				    case 1: /* double */
 					fpregs[t+1] =3D fpregs[r1+1];
+					fallthrough;
 				    case 0: /* single */
 					fpregs[t] =3D fpregs[r1];
 					return(NOEXCEPTION);
 				}
+				BUG();
 			case 3: /* FABS */
 				switch (fmt) {
 				    case 2:
@@ -747,10 +777,12 @@ u_int fpregs[];
 					return(MAJOR_0E_EXCP);
 				    case 1: /* double */
 					fpregs[t+1] =3D fpregs[r1+1];
+					fallthrough;
 				    case 0: /* single */
 					fpregs[t] =3D fpregs[r1] & 0x7fffffff;
 					return(NOEXCEPTION);
 				}
+				BUG();
 			case 6: /* FNEG */
 				switch (fmt) {
 				    case 2:
@@ -758,10 +790,12 @@ u_int fpregs[];
 					return(MAJOR_0E_EXCP);
 				    case 1: /* double */
 					fpregs[t+1] =3D fpregs[r1+1];
+					fallthrough;
 				    case 0: /* single */
 					fpregs[t] =3D fpregs[r1] ^ 0x80000000;
 					return(NOEXCEPTION);
 				}
+				BUG();
 			case 7: /* FNEGABS */
 				switch (fmt) {
 				    case 2:
@@ -769,10 +803,12 @@ u_int fpregs[];
 					return(MAJOR_0E_EXCP);
 				    case 1: /* double */
 					fpregs[t+1] =3D fpregs[r1+1];
+					fallthrough;
 				    case 0: /* single */
 					fpregs[t] =3D fpregs[r1] | 0x80000000;
 					return(NOEXCEPTION);
 				}
+				BUG();
 			case 4: /* FSQRT */
 				switch (fmt) {
 				    case 0:
@@ -785,6 +821,7 @@ u_int fpregs[];
 				    case 3:
 					return(MAJOR_0E_EXCP);
 				}
+				BUG();
 			case 5: /* FRMD */
 				switch (fmt) {
 				    case 0:
@@ -798,7 +835,7 @@ u_int fpregs[];
 					return(MAJOR_0E_EXCP);
 				}
 		} /* end of switch (subop */
-
+		BUG();
 	case 1: /* class 1 */
 		df =3D extru(ir,fpdfpos,2); /* get dest format */
 		/*
@@ -826,6 +863,7 @@ u_int fpregs[];
 				    case 3: /* dbl/dbl */
 					return(MAJOR_0E_EXCP);
 				}
+				BUG();
 			case 1: /* FCNVXF */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -841,6 +879,7 @@ u_int fpregs[];
 					return(dbl_to_dbl_fcnvxf(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 2: /* FCNVFX */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -856,6 +895,7 @@ u_int fpregs[];
 					return(dbl_to_dbl_fcnvfx(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 3: /* FCNVFXT */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -871,6 +911,7 @@ u_int fpregs[];
 					return(dbl_to_dbl_fcnvfxt(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 5: /* FCNVUF (PA2.0 only) */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -886,6 +927,7 @@ u_int fpregs[];
 					return(dbl_to_dbl_fcnvuf(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 6: /* FCNVFU (PA2.0 only) */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -901,6 +943,7 @@ u_int fpregs[];
 					return(dbl_to_dbl_fcnvfu(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 7: /* FCNVFUT (PA2.0 only) */
 				switch(fmt) {
 				    case 0: /* sgl/sgl */
@@ -916,9 +959,11 @@ u_int fpregs[];
 					return(dbl_to_dbl_fcnvfut(&fpregs[r1],0,
 						&fpregs[t],status));
 				}
+				BUG();
 			case 4: /* undefined */
 				return(MAJOR_0C_EXCP);
 		} /* end of switch subop */
+		BUG();
 	case 2: /* class 2 */
 		/*
 		 * Be careful out there.
@@ -994,6 +1039,7 @@ u_int fpregs[];
 				}
 		    } /* end of switch subop */
 		} /* end of else for PA1.0 & PA1.1 */
+		BUG();
 	case 3: /* class 3 */
 		/*
 		 * Be careful out there.
@@ -1026,6 +1072,7 @@ u_int fpregs[];
 					return(dbl_fadd(&fpregs[r1],&fpregs[r2],
 						&fpregs[t],status));
 				}
+				BUG();
 			case 1: /* FSUB */
 				switch (fmt) {
 				    case 0:
@@ -1035,6 +1082,7 @@ u_int fpregs[];
 					return(dbl_fsub(&fpregs[r1],&fpregs[r2],
 						&fpregs[t],status));
 				}
+				BUG();
 			case 2: /* FMPY or XMPYU */
 				/*
 				 * check for integer multiply (x bit set)
@@ -1071,6 +1119,7 @@ u_int fpregs[];
 					       &fpregs[r2],&fpregs[t],status));
 				    }
 				}
+				BUG();
 			case 3: /* FDIV */
 				switch (fmt) {
 				    case 0:
@@ -1080,6 +1129,7 @@ u_int fpregs[];
 					return(dbl_fdiv(&fpregs[r1],&fpregs[r2],
 						&fpregs[t],status));
 				}
+				BUG();
 			case 4: /* FREM */
 				switch (fmt) {
 				    case 0:
