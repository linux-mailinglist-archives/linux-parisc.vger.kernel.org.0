Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0207519EDF3
	for <lists+linux-parisc@lfdr.de>; Sun,  5 Apr 2020 22:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgDEUhz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Apr 2020 16:37:55 -0400
Received: from mout.gmx.net ([212.227.15.19]:46135 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726772AbgDEUhy (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Apr 2020 16:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1586119065;
        bh=mnBvV5fWkVNvVqMgXwcXR99rq3WS3UUPysVF6x9NzYI=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Pqp1xHWH4T8Mrwedlze8FqqCBtxF2Ya5TJx3EFZ+inwqwX8FY/DIA9/+Gy9JAUmyk
         Z/BKjg+Ykk8DxdaSwvtYnKodg66ATxaHVugr5ef/94Z2SzZGUYGG5hKpxgYXPXaGVj
         Kz6/RAQl8S8PlKd+idrKGFs47srlubLt2D4nkKGs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.149.228]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowKi-1ixkRT2aDO-00qRSJ; Sun, 05
 Apr 2020 22:37:45 +0200
Date:   Sun, 5 Apr 2020 22:37:43 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Improve interrupt handling in arch_spin_lock_flags()
Message-ID: <20200405203743.GA24551@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:DfXZCcCrojBYnqZ1M3T7Z10O4kMKJTsXtZwUTAkBPDfJ+SxMJbV
 ewwLxU6SfqLMd708aipkVAEJupy18u31fI71NpXFM3+mi2r1TavSzw/v14YAkEnhguiHOxS
 Bdn8iqa2XcirhXQUSU9iKk4UrLDhuKOSEd8juqKM/TSNNNQ7SekNyByxx6uxAs7lpVnXxD6
 EPTuQWj40/Bt3rWAOyvkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jyR9+x2SeMw=:9awRGTH4VppbnOtGSlAOny
 PqyK3iB65fuO2a00o9vNpkfU4XVdhCGYrWVx93vCPx5zql33WCpbROyko/wzxA37C8e5UWMVF
 61hBOfxH7qea0AyzBBjuDvTAXVLdiQe70jtMayBaueW77alr90iv9p0o04N45yIs8BBlYwSWc
 RWxzOqOrwlGl4sH9oXj/n0RmjO7UBZMZax4yvZ3F4TJegqV/GdFb7Y05DEMG2oHvSdj4uTABa
 TEykvzR1LLTSQ1RIwQ7jdfMg5Jdeq5QwiGQzx9wq1XLrPKQptcRO39GvjWa5ULO1KdeTK+QFp
 G90/LPU4hIca7a9IHv+/X9qNYsiQBZW/FKbxI42U2Oub0TKDm3JpGdKkPKeNjKK1GBgs1R9PL
 d1hSO9kVA1Cf65+eFjuKV9YzMooftiJTrtxo7ZTeFy9+cvC9FWmmMtIx8hEsAsmCWeHGisgIE
 RhBvvocPkAyZWEyK35I83wkX6lmMwHbLBHiVY7aUuxLobuas0IYYMvnzrGlahHUmYDF/d2nx8
 3xk91eaxVz7S76cgQ8VaXptoSj9+W6V3HA975yMHJVi1xMn1iPlXoCfnrdvGSwXv6DV/GJzaq
 5DwEy3ZbxoEkqYfaoAeuN68kSW/56sOxQo0d/oUsZ5mQNrCwfg+rm2e9IqBGiYbWRWJE2JDXP
 zA02PlOJZ4m7N6UQeB7m0xbf5smt7uTZXOUslcq8REtcodFPHfABsHxqmFq9EdOdoDNfGiH1S
 78DMjnH0lrX21/EeQ3P2zNZSeM7hUL/xrHMnEJFdg1uC7gGI51il7Zau/MNHffwhdO/XGOBVW
 afFYmq8NGHcG/DXGRpRsKtqbm0ei4zOSLrN51Ldvw7a/7XYMuq7LuIt2j2l73jez5crtePIc8
 8NP4pni+CQRTDii2epsxceKiyk88M5bSa1JRpIS3U17cPVdpnVKLaT2AY3pGblhmH1xmNvfNV
 CJUI25KTfLLNcLMRyn3nkVjiUtqvcILRHNBqpek2PSzOumXHb5lHA66BBOVJss75chzP7n7M6
 t6IfMdYgof1n03G3wBwsd+8/R8WUwqmottOsigAKa7W7H95bdx2rNQzt3BUbk7/xvxvP3h5uU
 503Rm7XjlciXSBVSU6rZLpfTXC2s2TPTxJJLOSoUO9tVoMjoazfJcwJwQmbgMxk/r5l+CMouz
 0bn2Y7x9QTcKTFiuTM/J9qYQnt367tvELwefC7bWFheNHeKps68indBPbbC06+XbqF8snelmW
 5w3FbOUPnmM1/07S2
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Rewrite arch_spin_lock() and arch_spin_lock_flags() to not re-enable and
disable the PSW_SM_I interrupt flag too often.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/=
spinlock.h
index 197d2247e4db..51582eacb7ec 100644
=2D-- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -10,25 +10,34 @@
 static inline int arch_spin_is_locked(arch_spinlock_t *x)
 {
 	volatile unsigned int *a =3D __ldcw_align(x);
+	smp_mb();
 	return *a =3D=3D 0;
 }

-#define arch_spin_lock(lock) arch_spin_lock_flags(lock, 0)
+static inline void arch_spin_lock(arch_spinlock_t *x)
+{
+	volatile unsigned int *a;
+
+	a =3D __ldcw_align(x);
+	while (__ldcw(a) =3D=3D 0)
+		while (*a =3D=3D 0)
+			cpu_relax();
+}

 static inline void arch_spin_lock_flags(arch_spinlock_t *x,
 					 unsigned long flags)
 {
 	volatile unsigned int *a;
+	unsigned long flags_dis;

 	a =3D __ldcw_align(x);
-	while (__ldcw(a) =3D=3D 0)
+	while (__ldcw(a) =3D=3D 0) {
+		local_save_flags(flags_dis);
+		local_irq_restore(flags);
 		while (*a =3D=3D 0)
-			if (flags & PSW_SM_I) {
-				local_irq_enable();
-				cpu_relax();
-				local_irq_disable();
-			} else
-				cpu_relax();
+			cpu_relax();
+		local_irq_restore(flags_dis);
+	}
 }
 #define arch_spin_lock_flags arch_spin_lock_flags

