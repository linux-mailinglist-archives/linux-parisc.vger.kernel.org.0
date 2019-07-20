Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B94D46F0FA
	for <lists+linux-parisc@lfdr.de>; Sun, 21 Jul 2019 00:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfGTW4G (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 20 Jul 2019 18:56:06 -0400
Received: from mout.gmx.net ([212.227.17.21]:56529 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbfGTW4G (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 20 Jul 2019 18:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563663355;
        bh=SyNqpRUkXiUtYboNyGZrIbidYv70K66aRyZOW7TFL9I=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=gvlmRuz/No+EyOnp868qnTMPBpdUv+LO8EeesMrhQe5Z1myQfp4tdUBChXPLlrz4z
         LKWTwzXqTAX3xhU1OcXvRHySFkTbKYGJadIpkEZK8Hl0IuU88AA6BaAVT85idSozhB
         Ki7iYRgRQahx7izlNdpRgplecSQOweZ0F3A3BwZs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.191.115]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MgHHO-1i2m1U3qhq-00Nl7i; Sun, 21
 Jul 2019 00:55:55 +0200
Date:   Sun, 21 Jul 2019 00:55:48 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Flush ITLB in flush_tlb_all_local() only on split
 TLB machines
Message-ID: <20190720225548.GA15055@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:0DrMz+VClFKayGWZ2Wjxf2NQPowMCSmzxD0/edme6PL4kYbwSSi
 4v4u5Zy7qvsT1SSpJ4qJtYMuEBlrW5hwj2tFAciQoWOxcUlA8vRpASdGB+V0/VOpb9UGa5v
 KM1OqTS+AnzfgPZi3gtFC47hm2+CJRvEIBdaXE2k1W6+an37lV8oNp0DcMX/Bs5qbtw1oHh
 C7brIgbP1nK7uc3eGJqWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jJ8PhpNQ8dc=:2bMLIPhyiVCYaXk+sCqQNa
 LF/gVyQfprEAdHGuq18iO65wAP2N3NpjaEgUzGlW6C9mGRVjAgqXasNAD2JM9vGqQxE2JFQGr
 8Ctdd8lv84krpLr3tcnQtt22fr7upS81Mu4bzAKQrCwTupS/JdLUijyN6OaLRbFKV1yHX9DR2
 zYqEearWdknytxL8Ra2vPgoLtP125ih1fkGSyuJZLZW7hpcGRT+P6oldW1VyBV7H5W0C2Ewnd
 gKrlMNqy6huFErHP2woHzaXDfgI1KxJFdK2i9npmHTgCrmP5xmbFoGav5SLiZJEVwD7WLdElF
 9aMGFw5DC/sE5XaFUOi2N/sXQMRxQIp8YXYayZe03KbQ/jfkIhrxDclCQxFih652dyV0tLHMI
 50Sf0CTa2iGJ1P98Q5L3FJiBAzNp+cOyamAj5IJIr/UzSpqJM0o2MO4lXUjVvMK1gUAYPBlzL
 ho3FS5L75BXvQKiNyX12UTJ+vUj2srTaLfzd0MJ99t6U6bCgdYJ4yXEMJzMXIF/yJClCB1Lc8
 JDSpPKFY8fcPqCBj57dU/jf/XL+g/D+0oR7iecPQQ2GPw3fq5FFkK9gAjq8SQS1pyMYo2M6/C
 3g182f9DiEaAsPfbe7GEhl5Hs+pYT1wYCEiPfgU4mkSSpYBPQfr46LSdvWEOHECRL7UIZ3Va7
 5jufPcO8Kq/vz+aG3DwWp670n2EaQ+7xwVmHKg0V7wGB3vukG+Wv3AmfIZR7NiPNY2kCQYsmv
 GP+y6F2GXC5NKk3GWAPSZvOdyDosit+yd4YBdnEPG7/Tz//Zt5606zclVjEANxAn79xHUldzn
 EvmIo6i+Ioj1Bh8WaEHzfqhRiluPi5Lw4rac765BzMTi53gi5q9daKd11KmGls114MAeCSIoi
 qum8sXqmCkDoyY14oZHHY+xEKEv84RhjcJCfKG2kLVQaOIzlCRwKc4lfauzsygLZwhgktsPbO
 u0Wz5N5ZDDkrUn07EqBJEJRv8Dl34LNZ2dara9D2AjaeSAAIEPrsPZsABPsnHBn12k31umK1A
 3pMyMj7faSoxeH6s2UkWbh3TulRbiTgESGyIiDC7vUxVdJyxYVX8KU3znNauWeba5w==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

flush_tlb_all_local() flushes the ITLB and DTLB of the CPU.
In case the machine does not have separate ITLBs and DTLBs, use the
alternative functionality to replace the code which flushes the ITLB
with nops while keeping the code which flushes the DTLB.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index ba67893a1d72..df46b0e5a915 100644
=2D-- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -63,7 +63,7 @@ ENTRY_CFI(flush_tlb_all_local)

 	/* Flush Instruction Tlb */

-	LDREG		ITLB_SID_BASE(%r1), %r20
+88:	LDREG		ITLB_SID_BASE(%r1), %r20
 	LDREG		ITLB_SID_STRIDE(%r1), %r21
 	LDREG		ITLB_SID_COUNT(%r1), %r22
 	LDREG		ITLB_OFF_BASE(%r1), %arg0
@@ -103,6 +103,7 @@ fitonemiddle:					/* Loop if LOOP =3D 1 */
 	add		%r21, %r20, %r20		/* increment space */

 fitdone:
+	ALTERNATIVE(88b, fitdone, ALT_COND_NO_SPLIT_TLB, INSN_NOP)

 	/* Flush Data Tlb */

