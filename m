Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF628457898
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Nov 2021 23:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbhKSWY1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Nov 2021 17:24:27 -0500
Received: from mout.gmx.net ([212.227.15.18]:51763 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235428AbhKSWY0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Nov 2021 17:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637360478;
        bh=z4vCpjE4uf7m8UTDC8XDUV/zO0UaFbGiapgwKYsaC+g=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=cRcpT2VwFTp3Feqj0UfTlSNrKaWaqc/HHRKSU0sOJMkdJG7ofmrbqei/LovFV/nSY
         1NihN/7GPOEo0dg2GpfDYMndRarRAYacBQ72DZkyNComtZy3QJ0+psH3RZFN4aawIX
         oAi4B9IfEEKG33pjuRkYX2Tqfc4Nx1bJTz6e0tA4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.164.19]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGhuK-1mt7wS0ql0-00DqJA; Fri, 19
 Nov 2021 23:21:18 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 3/4] parisc: Fix extraction of hash lock bits in syscall.S
Date:   Fri, 19 Nov 2021 23:20:41 +0100
Message-Id: <20211119222042.361671-3-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119222042.361671-1-deller@gmx.de>
References: <20211119222042.361671-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sQ1aQHh/oGf1gn2Vb4Qew5TJU7tRlb9w+o94BROmQpTqeSujowD
 ZhhgtOoqN4uxJ0HD+vKJ+MGt1t/JPJJQjF3y9HJIws/TD2gbY1O7uByuRHwSbmaynx0cNeC
 +4hK5b2VsV6ONPYhEYn8S6PPQlxDMSoSIZIoE+PnH+aqavrCViFLEWQg4Nb7ldK1JudZnoC
 3koWTd4V7f3vT8IotsDow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1GQ3Vfk6Qiw=:oA0rhGozVjnt6cV0UNEbpN
 OvXJbfgbQREf/Zj6u3gcgIjdvGV15pSRHT0mo4az/Vuv/kiUgIdyRP/kg2wOnkHTUfLadVr/K
 tzzAcu/72EjopKosF6KZZNvGM/nrdV/ej3dIHrNIpfx1iv8cyh1yPVtDW+20iv4HtYO/Dddum
 2XgLa0S1T/ZnpbP5VRxvfO4FOASUpnw8M7R+jyjsYmMnunbJeobkT0gfZSHjsQxbh8/vwRtAJ
 8M6D1pgNMhABvKZXh1nwfs9ccYpIh6f4Zmrb7YkLUeViZg+8q45r7YwRgUDhJaYkYDA6xcyN3
 217KClbwFQi/lgqoYtultt/PWliV2VlOddZZ7CAtjJoP8l2LgKRgNidKZgpDOoC+uSHBUsbDB
 vbFyn2UT4axFQUy3/xGSIBjY9lty0uRoH7InN0K8toPflX8abhBSBW98p027r2mNHVSURanGe
 UliaM5YbJ914u3CaZMchEVFXP8RYskrAIKBI6MUJQinXC0vJy2oUBePWeJTm1kRQzj0NicLRP
 ADq+vxVFlism7huWlLo8xkUjsyvLl7J2grscqWh00yZZLWFuWBgyRAcCf9uOlHg5C4JnehB4r
 KzGzpceHt4MOpW8gFzWfxegKM1UUttBrQdUBiube5yW41T1qIUu7qzbKtjbZEGhPPpkf0HqYX
 un0MdqMgCq+mOLusgyNSlh9DVesZ4S22+Sqy1GLok5nM0ryI+fosIQdpJbPHNIXfNIbOqoncd
 2qbq2pJbDonEACA0D2x26M7aTT1yMZEE7MEx0N50F0tPM+USfXSxfBsKWcNOrmV0nABaaaCCS
 oVvl7J6YRAhC0yO+ecSCvBuutqwQ0mJBPZ19SzV9x0lA6/DH5IVOYYjbPlEyFUsg9NT8LRwi9
 KBrPWI6RdvHFAfZhIOTcTQTmAQ59hlgM/EGclfXcTGfIMa4wYOh0MpFEE0YH3GAjW8kaAMwTi
 5ZVMfTFAWnMKor8bEP8xVl1GF4D97DuMens7ooR7HwIJAzGlosKlXOgkS+C6EIRczSengIdXq
 btI8c83BmIJOcEjd4W6aUplb9PqfZOT2lAMfO+d0CGgcM+AxMvhP+J3eMWealFiYfaTpPgKU6
 KcKwD1XrZAOMvA=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: John David Anglin <dave.anglin@bell.net>

The extru instruction leaves the most significant 32 bits of the target
register in an undefined state on PA 2.0 systems. If any of these bits
are nonzero, this will break the calculation of the lock pointer.

Fix by using extrd,u instruction via extru_safe macro on 64-bit kernels.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/syscall.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 4fb3b6a993bf..d2497b339d13 100644
=2D-- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -566,7 +566,7 @@ lws_compare_and_swap:
 	ldo	R%lws_lock_start(%r20), %r28

 	/* Extract eight bits from r26 and hash lock (Bits 3-11) */
-	extru  %r26, 28, 8, %r20
+	extru_safe  %r26, 28, 8, %r20

 	/* Find lock to use, the hash is either one of 0 to
 	   15, multiplied by 16 (keep it 16-byte aligned)
@@ -751,7 +751,7 @@ cas2_lock_start:
 	ldo	R%lws_lock_start(%r20), %r28

 	/* Extract eight bits from r26 and hash lock (Bits 3-11) */
-	extru  %r26, 28, 8, %r20
+	extru_safe  %r26, 28, 8, %r20

 	/* Find lock to use, the hash is either one of 0 to
 	   15, multiplied by 16 (keep it 16-byte aligned)
=2D-
2.31.1

