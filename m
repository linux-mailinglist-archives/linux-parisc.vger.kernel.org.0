Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1421E1F87BA
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Jun 2020 10:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgFNIux (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 14 Jun 2020 04:50:53 -0400
Received: from mout.gmx.net ([212.227.17.22]:57111 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726755AbgFNIuw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 14 Jun 2020 04:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1592124645;
        bh=Tx3A9HEZeYtCrb+eZo0eO8x7+jeAkrP70zaeAuMZPss=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=ASyPXe9heq6U6Ar58zgLGD/Gho5jQd0hvn0SVHz6mUj72XcFkxWVStfIPj5ShVeaA
         zaipQkjxcf5BHd1+cAbVEtJ3mxzEqLFgkOSKyFthMK19G+cNqM9X1bcuoCgAxVlddf
         LliRmkSUISgm3hsCtLOErVVMKGrjxwLvh1VuCuOk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.160.78]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5rU-1jX8nE4BDU-00M2cV; Sun, 14
 Jun 2020 10:50:45 +0200
Date:   Sun, 14 Jun 2020 10:50:42 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Whitespace cleanups in atomic.h
Message-ID: <20200614085042.GA18552@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:qAcpiaDLhlvgOj5Hc+pn9Zn73TaEO3ON3Xg+vSIyoBflOTX6542
 wMbq1uLxjVB0NVOg1m+DvekMOdIEIY8pueP7AO5t2hMmKfvoRPGKzw1R0jnXkfIHBaS/3wk
 tUUEecI5PfKI5WAY1g/5yu50Tqzz3FdxPJBXyVlbBcpO3AzeNMCxl9NtJGRm7bU4tVDUt5E
 AKDkZ3DYykw39uzly7DyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oKtetXVGNCU=:FEbvZw6UXYaIJRvtfmKIzl
 42+TEKzXXwT0dYWM0ZATdHg438tkloP2hUCwQl1IDVVah0OGfbefl3wlOtsIaahIY09CD2IV8
 QPAjwCxYqDoN+4xxs1Wmm0Qx/Y671nc+TLw0N8Qyu5Bw1BH3WnXD9/XJspee7++yqjwzm84RH
 9RGUG/IwzSIKM21scY84bTezxIgoSUwpTcUkVz47TV8FEze0icwTs7voUDDpSXE008peHOhRe
 OuCEzvEp5Z2hBf9eSk3b/vYsISYcfTTXjFYO4cjI4Tk9jWFXQVWUjUNVRlze1lo+oBy3FgYLj
 KCBXwjYwlqWaoK85ZGKXyc9Ra247mzMgW8+/e/8EquaMNBfbK6rvyXmiXuDiATNqPayPgzNdG
 HIowsMqUmALDdK8HuIh2GdNfNaBheUIAgF4DwFCTQwpFiOLgk84mby7jkB2pV2hIDmgpD7sDg
 GNW94u4tvb+9wbVfnz9l27aC+wj/96h/FSJOTTkGwbSOxE9x4hiqGQIBM+0ks48Z5GwmOnO/Z
 L2P/jo1JVyuK9LYS9kZTqC7ovBRD/RgCCKmSJBj2eKqPTfLA3b6i0YiOX2s/tAhjMshG5cbz0
 fkHpH5WAWZrZRZJhUlYPqw/Yz6phjK6WXKiQAIltNuTqo9TtA2DqcXXtsmTNdeUL/dV0tOfR0
 F5V3BFJDqO8x0j8k+kOxSHXtP3TEVrEsJ6RPUb+AF9Qoh1UmFVKQCiCcfbkZvYSG2Wf6gPfy1
 mKJDshgisQNixm0Jxau82jzBEWDpp23n8sqgY5s+2R7h2quSNWYG9Dfn9XyOkSIVo9H5PmwC6
 6S7d757UASlxqnBsPTYQn1sIiqOIQFkOzgz7VHJabTpuNPWtUTWTrukCTRDTfeWzyOiD5+EfA
 QwhMbh0w9n8xITbfePzwgaYg51bXGm5gSpQWbR1vwXgI3/iQWvyarPoIkWI4yLWtaQ34LYUEV
 9Q8maqa+Osx4v+fD1fi92wDsp97qwpGGxe6mkAS+7cG8fVU99a2/YrmBy2qqxre5bmS5kbEcJ
 i8AYIJLx/ONe53AsGK6r2T65RJbye2FbLaOCdvGTuB1xralZDMFKCIoxNb5zulN36JB0uIbKG
 y3CzEMQsrUU/mG45MSsw7tvsSsZy/jn9+7WukckVH8T3qDqQSUOZDqB5L/KEBA7OA8/pn1e2r
 /yuNFLTS9bI+jmLPzpCCYLjlfAwS4/eoxPE20+RXWUIwndWVaaomeqv+R2bK0nyzEnceaqfJS
 wa6ii294102kv5J32
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix whitespace indenting and drop trailing backslashes.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/at=
omic.h
index 118953d41763..656adf63b133 100644
=2D-- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -34,13 +34,13 @@ extern arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE]=
 __lock_aligned;
 /* Can't use raw_spin_lock_irq because of #include problems, so
  * this is the substitute */
 #define _atomic_spin_lock_irqsave(l,f) do {	\
-	arch_spinlock_t *s =3D ATOMIC_HASH(l);		\
+	arch_spinlock_t *s =3D ATOMIC_HASH(l);	\
 	local_irq_save(f);			\
 	arch_spin_lock(s);			\
 } while(0)

 #define _atomic_spin_unlock_irqrestore(l,f) do {	\
-	arch_spinlock_t *s =3D ATOMIC_HASH(l);			\
+	arch_spinlock_t *s =3D ATOMIC_HASH(l);		\
 	arch_spin_unlock(s);				\
 	local_irq_restore(f);				\
 } while(0)
@@ -85,7 +85,7 @@ static __inline__ void atomic_##op(int i, atomic_t *v)		=
	\
 	_atomic_spin_lock_irqsave(v, flags);				\
 	v->counter c_op i;						\
 	_atomic_spin_unlock_irqrestore(v, flags);			\
-}									\
+}

 #define ATOMIC_OP_RETURN(op, c_op)					\
 static __inline__ int atomic_##op##_return(int i, atomic_t *v)		\
@@ -150,7 +150,7 @@ static __inline__ void atomic64_##op(s64 i, atomic64_t=
 *v)		\
 	_atomic_spin_lock_irqsave(v, flags);				\
 	v->counter c_op i;						\
 	_atomic_spin_unlock_irqrestore(v, flags);			\
-}									\
+}

 #define ATOMIC64_OP_RETURN(op, c_op)					\
 static __inline__ s64 atomic64_##op##_return(s64 i, atomic64_t *v)	\
