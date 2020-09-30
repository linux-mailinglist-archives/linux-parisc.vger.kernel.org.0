Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347D027EC47
	for <lists+linux-parisc@lfdr.de>; Wed, 30 Sep 2020 17:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730654AbgI3PVC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 30 Sep 2020 11:21:02 -0400
Received: from mout.gmx.net ([212.227.17.20]:42495 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbgI3PUs (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 30 Sep 2020 11:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601479239;
        bh=fltS7dm/xul5s+VvCN1nG8/xZMrv7p+KXxJRx6aLVqg=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=RDIYozhQi5dsZMemQ+QQZBcW3Lct3R/fIBGncQv9WJEMx0unypbFHxNsOMXoZ08FP
         U23XEYApa4nP1h9VEDmWY10S+s8UvEqmUqNsXiRbtcaPGCUeLOBqlcFXzb6Bpk57OM
         JlPdwc/8TBayYZMfTOIZxkSmfjhM+8/iK70/6Oo4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.141.77]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAci-1kyubP1AYi-00bf8S; Wed, 30
 Sep 2020 17:20:39 +0200
Date:   Wed, 30 Sep 2020 17:20:36 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add ioread64_hi_lo() and iowrite64_hi_lo()
Message-ID: <20200930152036.GA27117@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:XOQ2xSo3/M03JIPTbkp6TAgi/h9MkPYuRXgW46psg53NjYdnBpG
 lbKgtzlIkJI2lMZ3LUdInjY7yIUumvYWpP4JDI/WUd6JnW8GMQrStPr4fCeDle+0KmNOiqf
 FYCgSwJIPSHeezZBjvKGDgj9i2V0CgC12VvjwZRLuqLYCO3R8kcSMq743++atMXxX42kZNe
 iuZx/hhPg/Wr9GEneQe4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fPlCEiTYPo0=://xKvMpqnEKLnpSI0yHzih
 I/krlkJE9NSEaQOu47iSN8D1RBM2vA8w+b0aPI1vRMpj1q7S3gvr/O7yYhSuP3pkFfcF2TELt
 KrPXxO5pJooyYOi6nL68WsIF1mXNNywU8qO+M61xU/3GC1VqqI+M2iVM3xKrwMnQD80qoWP/M
 jFSbk6BanFlqWmm8VFybFGDEcqaQ/DGmM27zVLVOQLfkwZpPSvlQge8sZ3OhOwn45hJkUu+0o
 0W3jjzRZbmmI64eTWOWOzuTtKf0L7jeExEVbB50pyGrGL29DqsGwCz8KkewGq/YjP7nznPVHH
 +Cj6maLh9cRfHBsmKAzgZ2vfwEBKdzSCnm6/pV6VLIi820vY8/BgvreEgIp9MyhmBaNHewdng
 MGAqmN2gE58aKa7v0Rk5VCEwWq4GEZ7QyYwSjZsfjzp5Aq3Df03JwtyPqcPL0MG6GcJC//uZ3
 iS2715jJqZTtS9mpGiglq6nsBOJtR3ejs8nEY4+xSRBk+hE3kd14PRxnht6iBz//aAliH75kn
 7Qh/PrXf/1i1729LEJlMsbkV2X9SSCMGzxQYJfd/fon1EVj/vGbAI7b3RpmBopUdxyyLKNwPn
 zxrLHKGyEUufBsb+tw2Zu1MFFCEFdke6MMCMZ2o1LgaVVmkgVsa1IYa430aSCnFW3wDRHHsTV
 Tfv64qBezrZqcN+l1yQI0dGeW5dS5bTPOYJNgKat+LPI5fWjGLb7n8k7dtdxyzSD4pk/ZDDsB
 nEB/c80XeHleTX0ztDbNGIYCr5MiJK0NiBaiLmVQVZQ9OjoRSYyHmzlz3fJusAXZH1jYvWIOc
 +2UZjy7N9HYwIq1RX3jwvX1nfd5DHF+St6OO1lkdpsC4YPq7/9Mct+LoisvmB777GMi1aGhAv
 FS7AZhLwUlKBmrlRx+OXYkCPW2d8suCBWa5lbrcomYsH+yozu5E0y+kvaL0KHQcTi8I/hIa6/
 KG13jl+LWTGQmxGk4rhMZi8Kl+n6E7WlNeFxDPpOZiAuAExn9FNk0h4nrIgyglMeIjoMeEMAH
 onbMKdJfdUXhr/074AxJbLnMUaxfAL7QlsueLjNlynb6bU/LZcCifH4jF1WeR9pYSxDjhBvJL
 FUEoXAWOF451JZOGWDi5FqcHtDtiLNnwUaWv418bMKbcFofyYVyleOiJ2P1zbCRZSrKANbB7H
 jTgsakT6CjgukJo/HLO5oQrJU3k1zr/05EudqHwtMLGjbRaVebxCytUbvw7PZHmuPtGg0NDwq
 XfHZ/pWOO6FQoeyEv
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The kernel test robot reports missing functions. Add them.

hppa-linux-ld: drivers/firmware/arm_scmi/perf.o: in function `scmi_perf_fc=
_ring_db':
 (.text+0x610): undefined reference to `ioread64_hi_lo'
 (.text+0x63c): undefined reference to `iowrite64_hi_lo'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
index ce400417d54e..f03adb1999e7 100644
=2D-- a/arch/parisc/lib/iomap.c
+++ b/arch/parisc/lib/iomap.c
@@ -346,6 +346,16 @@ u64 ioread64be(const void __iomem *addr)
 	return *((u64 *)addr);
 }

+u64 ioread64_hi_lo(const void __iomem *addr)
+{
+	u32 low, high;
+
+	high =3D ioread32(addr + sizeof(u32));
+	low =3D ioread32(addr);
+
+	return low + ((u64)high << 32);
+}
+
 void iowrite8(u8 datum, void __iomem *addr)
 {
 	if (unlikely(INDIRECT_ADDR(addr))) {
@@ -409,6 +419,12 @@ void iowrite64be(u64 datum, void __iomem *addr)
 	}
 }

+void iowrite64_hi_lo(u64 val, void __iomem *addr)
+{
+	iowrite32(val >> 32, addr + sizeof(u32));
+	iowrite32(val, addr);
+}
+
 /* Repeating interfaces */

 void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count=
)
@@ -511,6 +527,7 @@ EXPORT_SYMBOL(ioread32);
 EXPORT_SYMBOL(ioread32be);
 EXPORT_SYMBOL(ioread64);
 EXPORT_SYMBOL(ioread64be);
+EXPORT_SYMBOL(ioread64_hi_lo);
 EXPORT_SYMBOL(iowrite8);
 EXPORT_SYMBOL(iowrite16);
 EXPORT_SYMBOL(iowrite16be);
@@ -518,6 +535,7 @@ EXPORT_SYMBOL(iowrite32);
 EXPORT_SYMBOL(iowrite32be);
 EXPORT_SYMBOL(iowrite64);
 EXPORT_SYMBOL(iowrite64be);
+EXPORT_SYMBOL(iowrite64_hi_lo);
 EXPORT_SYMBOL(ioread8_rep);
 EXPORT_SYMBOL(ioread16_rep);
 EXPORT_SYMBOL(ioread32_rep);
