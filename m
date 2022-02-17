Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 981944BAB3D
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Feb 2022 21:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiBQUqV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Feb 2022 15:46:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242835AbiBQUqU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Feb 2022 15:46:20 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BA015DB10
        for <linux-parisc@vger.kernel.org>; Thu, 17 Feb 2022 12:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645130755;
        bh=B6Xo1m3cDpc/uLaoYuD1DFEzIyDdozNsioiatBIcQsU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=LKziR68IRRQUJGVI4jmDqeCpyf9EkrbKolPs84ELPijC0toPy64AX0iCaQST2Q8vZ
         seMMGH7QAatTYDD4jgGlKScdxaSdUSj+IVjB5D+LOiBeP1yydQ/ePCwBxZRrVCoBEJ
         C8NgoK3AxRRpkoPL/hNucCD9IQriMHCKMuxTAEEg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.175.13]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MF3HU-1nVky30xgW-00FRPx; Thu, 17
 Feb 2022 21:45:55 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 1/4] parisc: Add defines for various space register
Date:   Thu, 17 Feb 2022 21:45:51 +0100
Message-Id: <20220217204554.305554-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bzQag6ZxM1Y/uTe2kKTjX2MkERytkt5iyKUXRQ22zTLbuupEgh2
 2g5WN41gD7IdexJ191uSd9Qy5CR1f8fdnWHVRea1x0fA+MiBMuoCp1AecModsacmiOxBH41
 3NCDzhg4HTwNGWXNyKua4BKJIRyp/EQ/OKpA23cXdkhfkV7pqWVShOdkb9yTMZ4u38clmot
 NZygHiMF5iKWUVKActT3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:97cKcTpn95U=:1IWkCJmQF0Hh1+IeeiTROc
 nSUvcw+oUKUu3b85HmJDEaYKw03mR+NSmQlp6ZuFOtdhpptobcXkCpDAQCyN58Zmzfo9eFiqi
 2S8OyuWkvSiTaGYcypm/VYE92OYOd8xP3U3Be+I8kMlLx+rosZ9EkOUj4EfM/98kNXvXTw2Zp
 e7uvUJEKYO3wjRv7KG8/tzM0X3EVJ7GtMTgvf/7CtKMXvJLKZSUofU2jKwHEVieVKX7aQXyl2
 sP6HxUjQ0x4E7DZCsktVZrizWjw1XiR5lsh7+x9RZWXEIVLeYhZ5GJeU+zeEOjvXK8YAcIGhi
 jsg7BxHi0M1ceI3xv/F1Ktcv8fiYhyWGSA+YuXl4P47v/qoED5YKUd7Dx0KooN8fBmtaQjGyP
 t05LRpoQQafxg6ap7ydgJgTzHmjNA8MM1vPASftb3uNfIMfM3K2mla1L+hV+F7Mt11LBwXbiv
 mRZee4jXjxqblnUYIRiS32vXA+XFDS50f+xvUDfZwB1UmCMPjg5T/gfVjtirVv7ODsuaPTJbt
 BMkS9hp15JkoBf9EI7DZbxzrqEeQNJucWTEbpCc9nmqlyaR/5PWjvptyeGYZDctii6GUoLj9w
 qm+XqyGJtyY7kFc9S5iT7RbbUyluYLjhEcNi7H4sD6L/iQMDMwniRIdIdGz/jjX484hNgjOOe
 J8pGVVenmQK0GOusgcAPW4/9Ecc7SN6NGUKbRRtpXKHVYQ4tAUnvMN6LD4NN19aHDO3D5qDtQ
 8xJGm8w1HqsXOJ/7Cxht+yoMjTLMnjtt1xjrPS4d+xp7krRshG3S/YzQQ9Ux+G1DsQDAmbVeq
 Sfl5oBTbi08/QLmK/fcje7vdVpg3J1cvYdoXSrw8x1DxVcEcDXaCr/Bsq1vZ73E1PdOTSob+L
 4ShHSE7nonDJIlm3RPqapV3Ilfz6U6tDvnNwJVQIy6Bv1tdO4TlNj4HXZejz3bqw1yb3Hsdwg
 TS2YpOrJkhpfkBuA8UuW43Duzg4PZ0zjJJMBEYr7HogJJe1WQ0hZX4oyCfpiImKF+eKuNMePh
 BEuWW71NZxDFO/AUCRbyOzljzW7Qd9luQLvPD+gP2AlZJUWsgk3jXmj4bpypHXWu5irNPevK5
 SZpJX0HmhDjGh0=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Provide defines for space registers (SR_KERNEL, SR_USER, ...) which
should be used instead of hardcoding the values.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/assembly.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index 6369082c6c74..ea0cb318b13d 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -47,6 +47,12 @@
 #define PRIV_USER	3
 #define PRIV_KERNEL	0

+/* Space register used inside kernel */
+#define SR_KERNEL	0
+#define SR_TEMP1	1
+#define SR_TEMP2	2
+#define SR_USER		3
+
 #ifdef __ASSEMBLY__

 #ifdef CONFIG_64BIT
=2D-
2.34.1

