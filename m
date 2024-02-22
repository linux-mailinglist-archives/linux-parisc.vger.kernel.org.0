Return-Path: <linux-parisc+bounces-614-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A285EF33
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Feb 2024 03:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D49F81C21E18
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Feb 2024 02:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCA11428F;
	Thu, 22 Feb 2024 02:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="My0RCvBz"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72614296
	for <linux-parisc@vger.kernel.org>; Thu, 22 Feb 2024 02:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708569457; cv=none; b=A1E5gVBVdo57ctWwx2GUA1Uj5HUL0TtMGn2Rpf6lwky44czog73FvoAOGM1Uj+ZM3/M9o4Ucx2NEywRWef4L7H8VG/OXdiA7emrtYh2d3O8S05JvRuenrvIiC1pm3hEW8I7hnQQQLtyeUqVf1qOb2OVpukYoJauUvkuLX6kWJvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708569457; c=relaxed/simple;
	bh=l+USg6YpypTRM0+WpzcfEdryMXsoNQLARzL5GiGzQLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moJcNZKmKe5LIYprXCp9aKkxJyZOpzSluNSXGxH/V2O0EXaWaU9DmOzkhVi4uG4f7pe0MqiXbxoT/nJQ42D/VYzhmmWZnWMNoH/sYILN05sdotrpsBIYILDtMa+uAvpX2RcqSg4T35ThdxWqLFfFoqgEXj1TG2nJ/N3g2iOCnf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=My0RCvBz; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e471f5f1a5so2331462b3a.1
        for <linux-parisc@vger.kernel.org>; Wed, 21 Feb 2024 18:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708569455; x=1709174255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdYAIYdQG1Ak9nX+umevv7MEU7fdacXyP4+T5jQwePU=;
        b=My0RCvBzyoUfAKwvIOr/6evWcNGJLzzMtcwkKb1D9MGInpj5eIYlBD5Y+69md2E4KJ
         Waqg4RYOkpbP2Ot1BJDPWg7cSW4y2YUqGcuMRe661H/ffqPP6Pb9FjG1pTbgS/y+kOrc
         GQflr0RrvAS5OpusJ1bITlWwEampTy7okf7lJd6c/qg0Gd8yZb9Ll9M9DGE2i8rXDS6m
         +4Z215xFLj2LD0coTLSHrk2dwaHpJAfYx7M2BK+TXYl74fhNMrwPU4KJe9yhpU77ItnZ
         rwZxvpmInhbhohbGxbXBrUejxQbrio2OWOpqHFh2GtnE9xhmJQ3M95q2HUQZP0UpCbqu
         rd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708569455; x=1709174255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdYAIYdQG1Ak9nX+umevv7MEU7fdacXyP4+T5jQwePU=;
        b=UlZPqm/xBIDEhNcAeb/B3ICQF4yHH086CzGVzN7GDg7nukL29YZrAIZWlCidef7bN9
         WUu9M7bL0B+3pU5lVRh+rsThZ0S5Stiqc2w8hZmYdMc4/DyPO1Qi0Dqj1eTvsgtghQo6
         +S51r9iDygz6j2NIeyR8OrwtmC8nG3YgfkpO1aISxXN/5v5S7Y43QHfqxd2D+9XuENLG
         FMolEf/uz4glp5k6cv0nl984hGs/munbWIFLXXexMHxq+8GcdI2eliv6I4PZ+HsZ7zI/
         XTApF2pLSeadE7hoz3t/6LtmRVQS7N5YZTJ6MPlf2JkVYCF6pv0s1ndEeV1kpYRKNdQD
         QniA==
X-Gm-Message-State: AOJu0YxZyT1s+sR4ZlP8nCxR7QNXIHxDcW133bsp6K8rILkNeK4Ogk9x
	aAVOY80ZodbrE8Pb6eckamPAQVRTpt/uigqYq6WO8FsqUyqfn18SdMa5oCOkFt8=
X-Google-Smtp-Source: AGHT+IECw2nme63hi+mxaAn1NvEiiav0mQgIl1MQUmLPHTPgHSppDVeUu9MO0MA/vVcETkLZhGo+RQ==
X-Received: by 2002:a05:6a00:1d92:b0:6e4:ce30:ae1 with SMTP id z18-20020a056a001d9200b006e4ce300ae1mr229424pfw.20.1708569454826;
        Wed, 21 Feb 2024 18:37:34 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id kt21-20020a056a004bb500b006e465e1573esm6469705pfb.74.2024.02.21.18.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 18:37:34 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 21 Feb 2024 18:37:12 -0800
Subject: [PATCH 2/4] parisc: checksum: Use generic implementations
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-parisc_use_generic_checksum-v1-2-ad34d895fd1b@rivosinc.com>
References: <20240221-parisc_use_generic_checksum-v1-0-ad34d895fd1b@rivosinc.com>
In-Reply-To: <20240221-parisc_use_generic_checksum-v1-0-ad34d895fd1b@rivosinc.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708569451; l=3620;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=l+USg6YpypTRM0+WpzcfEdryMXsoNQLARzL5GiGzQLo=;
 b=B+aW/3quyGTiPp/dimTVueCw78vaqCIG5wP05i6PchiAwl3gIbzt2dwaZ6dscnmEwLFzm7aBr
 xnekuqU4P72D8HfAbwftg4vIXq2sfQCtMjwzQBEvRc/VMEK7L9+evsT
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The generic implementations of the checksum functions
csum_tcpudp_nofold, csum_fold, and ip_compute_csum are either identical
or perform better than the parisc ones, so use the generic
implementations instead.

In order to use the generic implementations of checksum functions,
do_csum can no longer be static.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/parisc/Kconfig                |  3 +++
 arch/parisc/include/asm/checksum.h | 42 ++++++++------------------------------
 arch/parisc/lib/checksum.c         |  2 +-
 3 files changed, 13 insertions(+), 34 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index d14ccc948a29..1638deb23287 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -122,6 +122,9 @@ config GENERIC_BUG
 config GENERIC_BUG_RELATIVE_POINTERS
 	bool
 
+config GENERIC_CSUM
+	def_bool y
+
 config GENERIC_HWEIGHT
 	bool
 	default y
diff --git a/arch/parisc/include/asm/checksum.h b/arch/parisc/include/asm/checksum.h
index 3c43baca7b39..c7847a08ef7c 100644
--- a/arch/parisc/include/asm/checksum.h
+++ b/arch/parisc/include/asm/checksum.h
@@ -17,6 +17,7 @@
  * it's best to have buff aligned on a 32-bit boundary
  */
 extern __wsum csum_partial(const void *, int, __wsum);
+#define csum_partial csum_partial
 
 /*
  *	Optimized for IP headers, which always checksum on 4 octet boundaries.
@@ -57,20 +58,8 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 	return (__force __sum16)sum;
 }
 
-/*
- *	Fold a partial checksum
- */
-static inline __sum16 csum_fold(__wsum csum)
-{
-	u32 sum = (__force u32)csum;
-	/* add the swapped two 16-bit halves of sum,
-	   a possible carry from adding the two 16-bit halves,
-	   will carry from the lower half into the upper half,
-	   giving us the correct sum in the upper half. */
-	sum += (sum << 16) + (sum >> 16);
-	return (__force __sum16)(~sum >> 16);
-}
- 
+#define ip_fast_csum ip_fast_csum
+
 static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 					__u32 len, __u8 proto,
 					__wsum sum)
@@ -85,28 +74,15 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 	return sum;
 }
 
-/*
- * computes the checksum of the TCP/UDP pseudo-header
- * returns a 16-bit checksum, already complemented
- */
-static inline __sum16 csum_tcpudp_magic(__be32 saddr, __be32 daddr,
-					__u32 len, __u8 proto,
-					__wsum sum)
-{
-	return csum_fold(csum_tcpudp_nofold(saddr,daddr,len,proto,sum));
-}
-
-/*
- * this routine is used for miscellaneous IP-like checksums, mainly
- * in icmp.c
- */
-static inline __sum16 ip_compute_csum(const void *buf, int len)
-{
-	 return csum_fold (csum_partial(buf, len, 0));
-}
+#define csum_tcpudp_nofold csum_tcpudp_nofold
 
+extern unsigned int do_csum(const unsigned char *buff, int len);
+#define do_csum do_csum
 
 #define _HAVE_ARCH_IPV6_CSUM
+
+#include <asm-generic/checksum.h>
+
 static __inline__ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 					  const struct in6_addr *daddr,
 					  __u32 len, __u8 proto,
diff --git a/arch/parisc/lib/checksum.c b/arch/parisc/lib/checksum.c
index 4818f3db84a5..05f5ca4b2f96 100644
--- a/arch/parisc/lib/checksum.c
+++ b/arch/parisc/lib/checksum.c
@@ -34,7 +34,7 @@ static inline unsigned short from32to16(unsigned int x)
 	return (unsigned short)x;
 }
 
-static inline unsigned int do_csum(const unsigned char * buff, int len)
+unsigned int do_csum(const unsigned char *buff, int len)
 {
 	int odd, count;
 	unsigned int result = 0;

-- 
2.34.1


