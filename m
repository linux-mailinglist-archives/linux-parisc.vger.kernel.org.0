Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 546DEC190E
	for <lists+linux-parisc@lfdr.de>; Sun, 29 Sep 2019 21:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729254AbfI2TA4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 29 Sep 2019 15:00:56 -0400
Received: from mout.gmx.net ([212.227.15.19]:43875 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729179AbfI2TAz (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 29 Sep 2019 15:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1569783645;
        bh=+NOOwL9dNCC3nwYM2PvYrdhx6IdiUNLnJzHV3qFPMbo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=iEwGe8JPGLnP7tu+38+dd0McEp9YLOsTjNlIHapI6RfLNw1JwkUMJW5JvieT2Bore
         2obDqM+oqN0E4Sdg+9XCKQdm1xqnadDolYm2r2GMTViOKXecyiLai6adMQ3HO3w2ne
         PMz+TFU/tPdnQTlF8BaMiQPKhMpgV+ifuq6Toz7g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.151.0]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE6L-1iZC5e0mV9-00KdlA; Sun, 29
 Sep 2019 21:00:45 +0200
Date:   Sun, 29 Sep 2019 21:00:42 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Do not hardcode registers in checksum functions
Message-ID: <20190929190042.GA10377@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Provags-ID: V03:K1:+PIa8XH01rDiDnxWsNnYbtPGmSedXW2CHTLowqkLxBoAW3sufMA
 4eIziA7/ylMqGpoOhhe9Xr7WPEX4pfHj5R4u7HZCuLwOtvBTitrWcciRnItbg88Lu5R3Nxu
 eeQAeEfchcTaFM46mtbAQC36NSCb4bwuW6CpWcsjSfaSxN70YzSbdyLaE7L0V+nsjzFbsuE
 /qy1g/15wjbeSHhQjkyPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A1pBJ3+PCxQ=:nLGVz75bwCk5GEm7P8s9Kp
 VwWddJsRVt/2vzTD67aW7lI2hcsAlnLAgT5xOUtyCuv7I9GUR2ejaH5KJ+iMZwR6It3w+BRRY
 fpY35ek81SKXfx+1mnmyDYvO+vQIWL6Ryl/WyPqSqe2wuyS46vWNPIGo7S2ZAHzMzYS9gKXVT
 KeW9iJ0Y5FTrrz3yBaydrMaIxHQNBmzye5BWxGnGc2rK+q+D4mSbx269k9t/IeEPwqEGPbe1T
 ARrGRpw4tbcnEACXQLH7caHrzDfSLwV2maPlkck1h7s8hY3gNYbDlE31jNtwmPgXSRAI4OAYv
 2afoDrcFHQe8a8gC5vjeQpra7chnxm+R3x+RYQEQMAtieBkE2kBADVVTKgMx6RQclxdM1d7uO
 LnO4VdIq6a/FNSE8B+irJdZswEwoX4MUVJ7YJ2JnFOreIF9nzQJKNenPZ2JtHPo7eXNO8lwOu
 rOCLXKPIiIs2azMZOS/Fq6mD086kivJUsroesLjveYefswjzm9DH/fL7BiBk9zBS5uArN1I6/
 hiAerzLNjcKzd+qE0wiaaH0mPgq/YdFfk5vefatdAU2N+Di91hUEgaZmX85um/ynt06gOcg+S
 OhxnKJCblicYkVMOp+xCg5qRV7KJCLRunbU4G0uANUDnV1Utz5Ghna/SLY/C+HITdHuQvSmHS
 pc/+KXcH43zkAjMmK/iOUdd/Z1Apt1Dwygp1GrfPEJ1TY1TsEhkzW+7hP4iSYmnzmfXKrKCpa
 0NZCfWeIKkdqNWOwADnYz0keobj6B5TUucJsIIc78qmeXdwOjW0pn4PoQo7TI1cbg1l0+GWHo
 xdc8q+6wZr0i+AR+fsEfrqiLqVy1m6l7lV9N44nYTrCXNuz35wmIcsI8XAWsvxqG2AzAebz90
 T4GU3CJ/y5MqStbo6UuYPu5g3tR0T0yNA41jGKmwLOPV1mxBfwkl7ytFQzIne4uqAYU0i+K4L
 nxOEnBnQ/6TuM03H8s1EVSR4upMbbJMCkfE3IwF6bvTi99nkCSmsLqI00pTFg2FSSkOkQC19u
 ZhCU898pQnOsP0SZGViVZbJ6Oqqcd4xIr/Xhb6fuIaizbUBV5rgOOMSGpJe+u0O5Mw/de6pfG
 joNiJgPSvmRiRSuGbyiiCCcVgHrR13LBo4jxIm/gc8iW4OkA5msHoX9bBZ0QWjghXmRCOZrRY
 0iK/ssR6VObkMqf2GTurBlJy9cbp66pL6+/Mnqi9MOCP2MJVS8HZnQnzFIDgrKHeHx0XIpgRE
 TLaWBonBDX/Vp1fQwDlWby6oMZumuFqb2VmfFNA==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Do not hardcode processor registers r19 to r22 as scratch registers.
Instead let the compiler decide, which may give better optimization
results when the functions get inlined.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/checksum.h b/arch/parisc/include/asm/=
checksum.h
index 3cbf1f1c1188..c1c22819a04d 100644
=2D-- a/arch/parisc/include/asm/checksum.h
+++ b/arch/parisc/include/asm/checksum.h
@@ -42,31 +42,32 @@ extern __wsum csum_partial_copy_from_user(const void _=
_user *src,
 static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 {
 	unsigned int sum;
+	unsigned long t0, t1, t2;

 	__asm__ __volatile__ (
 "	ldws,ma		4(%1), %0\n"
 "	addib,<=3D	-4, %2, 2f\n"
 "\n"
-"	ldws		4(%1), %%r20\n"
-"	ldws		8(%1), %%r21\n"
-"	add		%0, %%r20, %0\n"
-"	ldws,ma		12(%1), %%r19\n"
-"	addc		%0, %%r21, %0\n"
-"	addc		%0, %%r19, %0\n"
-"1:	ldws,ma		4(%1), %%r19\n"
+"	ldws		4(%1), %4\n"
+"	ldws		8(%1), %5\n"
+"	add		%0, %4, %0\n"
+"	ldws,ma		12(%1), %3\n"
+"	addc		%0, %5, %0\n"
+"	addc		%0, %3, %0\n"
+"1:	ldws,ma		4(%1), %3\n"
 "	addib,<		0, %2, 1b\n"
-"	addc		%0, %%r19, %0\n"
+"	addc		%0, %3, %0\n"
 "\n"
-"	extru		%0, 31, 16, %%r20\n"
-"	extru		%0, 15, 16, %%r21\n"
-"	addc		%%r20, %%r21, %0\n"
-"	extru		%0, 15, 16, %%r21\n"
-"	add		%0, %%r21, %0\n"
+"	extru		%0, 31, 16, %4\n"
+"	extru		%0, 15, 16, %5\n"
+"	addc		%4, %5, %0\n"
+"	extru		%0, 15, 16, %5\n"
+"	add		%0, %5, %0\n"
 "	subi		-1, %0, %0\n"
 "2:\n"
-	: "=3Dr" (sum), "=3Dr" (iph), "=3Dr" (ihl)
+	: "=3Dr" (sum), "=3Dr" (iph), "=3Dr" (ihl), "=3Dr" (t0), "=3Dr" (t1), "=
=3Dr" (t2)
 	: "1" (iph), "2" (ihl)
-	: "r19", "r20", "r21", "memory");
+	: "memory");

 	return (__force __sum16)sum;
 }
@@ -126,6 +127,10 @@ static __inline__ __sum16 csum_ipv6_magic(const struc=
t in6_addr *saddr,
 					  __u32 len, __u8 proto,
 					  __wsum sum)
 {
+	unsigned long t0, t1, t2, t3;
+
+	len +=3D proto;	/* add 16-bit proto + len */
+
 	__asm__ __volatile__ (

 #if BITS_PER_LONG > 32
@@ -136,20 +141,19 @@ static __inline__ __sum16 csum_ipv6_magic(const stru=
ct in6_addr *saddr,
 	** Try to keep 4 registers with "live" values ahead of the ALU.
 	*/

-"	ldd,ma		8(%1), %%r19\n"	/* get 1st saddr word */
-"	ldd,ma		8(%2), %%r20\n"	/* get 1st daddr word */
-"	add		%8, %3, %3\n"/* add 16-bit proto + len */
-"	add		%%r19, %0, %0\n"
-"	ldd,ma		8(%1), %%r21\n"	/* 2cd saddr */
-"	ldd,ma		8(%2), %%r22\n"	/* 2cd daddr */
-"	add,dc		%%r20, %0, %0\n"
-"	add,dc		%%r21, %0, %0\n"
-"	add,dc		%%r22, %0, %0\n"
+"	ldd,ma		8(%1), %4\n"	/* get 1st saddr word */
+"	ldd,ma		8(%2), %5\n"	/* get 1st daddr word */
+"	add		%4, %0, %0\n"
+"	ldd,ma		8(%1), %6\n"	/* 2nd saddr */
+"	ldd,ma		8(%2), %7\n"	/* 2nd daddr */
+"	add,dc		%5, %0, %0\n"
+"	add,dc		%6, %0, %0\n"
+"	add,dc		%7, %0, %0\n"
 "	add,dc		%3, %0, %0\n"  /* fold in proto+len | carry bit */
-"	extrd,u		%0, 31, 32, %%r19\n"	/* copy upper half down */
-"	depdi		0, 31, 32, %0\n"	/* clear upper half */
-"	add		%%r19, %0, %0\n"	/* fold into 32-bits */
-"	addc		0, %0, %0\n"		/* add carry */
+"	extrd,u		%0, 31, 32, %4\n"/* copy upper half down */
+"	depdi		0, 31, 32, %0\n"/* clear upper half */
+"	add		%4, %0, %0\n"	/* fold into 32-bits */
+"	addc		0, %0, %0\n"	/* add carry */

 #else

@@ -158,30 +162,29 @@ static __inline__ __sum16 csum_ipv6_magic(const stru=
ct in6_addr *saddr,
 	** Insn stream is serialized on the carry bit here too.
 	** result from the previous operation (eg r0 + x)
 	*/
-
-"	ldw,ma		4(%1), %%r19\n"	/* get 1st saddr word */
-"	ldw,ma		4(%2), %%r20\n"	/* get 1st daddr word */
-"	add		%8, %3, %3\n"	/* add 16-bit proto + len */
-"	add		%%r19, %0, %0\n"
-"	ldw,ma		4(%1), %%r21\n"	/* 2cd saddr */
-"	addc		%%r20, %0, %0\n"
-"	ldw,ma		4(%2), %%r22\n"	/* 2cd daddr */
-"	addc		%%r21, %0, %0\n"
-"	ldw,ma		4(%1), %%r19\n"	/* 3rd saddr */
-"	addc		%%r22, %0, %0\n"
-"	ldw,ma		4(%2), %%r20\n"	/* 3rd daddr */
-"	addc		%%r19, %0, %0\n"
-"	ldw,ma		4(%1), %%r21\n"	/* 4th saddr */
-"	addc		%%r20, %0, %0\n"
-"	ldw,ma		4(%2), %%r22\n"	/* 4th daddr */
-"	addc		%%r21, %0, %0\n"
-"	addc		%%r22, %0, %0\n"
+"	ldw,ma		4(%1), %4\n"	/* get 1st saddr word */
+"	ldw,ma		4(%2), %5\n"	/* get 1st daddr word */
+"	add		%4, %0, %0\n"
+"	ldw,ma		4(%1), %6\n"	/* 2nd saddr */
+"	addc		%5, %0, %0\n"
+"	ldw,ma		4(%2), %7\n"	/* 2nd daddr */
+"	addc		%6, %0, %0\n"
+"	ldw,ma		4(%1), %4\n"	/* 3rd saddr */
+"	addc		%7, %0, %0\n"
+"	ldw,ma		4(%2), %5\n"	/* 3rd daddr */
+"	addc		%4, %0, %0\n"
+"	ldw,ma		4(%1), %6\n"	/* 4th saddr */
+"	addc		%5, %0, %0\n"
+"	ldw,ma		4(%2), %7\n"	/* 4th daddr */
+"	addc		%6, %0, %0\n"
+"	addc		%7, %0, %0\n"
 "	addc		%3, %0, %0\n"	/* fold in proto+len, catch carry */

 #endif
-	: "=3Dr" (sum), "=3Dr" (saddr), "=3Dr" (daddr), "=3Dr" (len)
-	: "0" (sum), "1" (saddr), "2" (daddr), "3" (len), "r" (proto)
-	: "r19", "r20", "r21", "r22", "memory");
+	: "=3Dr" (sum), "=3Dr" (saddr), "=3Dr" (daddr), "=3Dr" (len),
+	  "=3Dr" (t0), "=3Dr" (t1), "=3Dr" (t2), "=3Dr" (t3)
+	: "0" (sum), "1" (saddr), "2" (daddr), "3" (len)
+	: "memory");
 	return csum_fold(sum);
 }

