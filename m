Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A891F87C5
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Jun 2020 10:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgFNIyV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 14 Jun 2020 04:54:21 -0400
Received: from mout.gmx.net ([212.227.15.15]:53053 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726912AbgFNIyU (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 14 Jun 2020 04:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1592124853;
        bh=neNdfmcLX+S7T/c9710AkS/SoSyIIalwgqwzR016qSc=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=UucbnOXitxYWrHUB/OWiN3Z9TyiGL/azZitfzJGKmj8vvNpPDX0GptrOWv8TA1lr/
         4mURXK4OvnaeERxHqNOg+pYe2QJ8ouOfdlXDWMAf+SMJ7rjewddVeAlJmVVgHpsXKY
         A4o9RXXN0FCw4wkzK+mEyrgL3exg5Hf06YG7xf+0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.160.78]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLiCo-1jSj1p1aym-00Hf5N; Sun, 14
 Jun 2020 10:54:13 +0200
Date:   Sun, 14 Jun 2020 10:54:10 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Convert to BIT_MASK() and BIT_WORD()
Message-ID: <20200614085410.GB18552@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:U780awhbrH3IKv8U09v/0SfPG4mTtVocd9v4kElIUxUobzXl2Nq
 5iH/tp5YUFihK3WseqkDOft/8SWJWxE3E+G2Q2/sEfcRqvB8+Dg2oUlma24v1iFujFgqcma
 Qo2WHPMilCV24TwQLO86fxyAg5VEfAfCrCouXBAgJ2kJdvTkjyM084nBVdDiwtDTORuA4nT
 0m/pfyqyuFEpOE9WoJXfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ypE8njwZrzM=:vsxrnIjhhdZ9BPehBXzGo/
 U9LWjA1XYeu6i0/noI3moLoVsNr5qyaxnmVJ9OsNFziaZvukBnl6ZVrYEl4JDJMdeZSfbg+vU
 xcA1icD9EUwJQHEE0OCuKdF32XASSs6cfwWZ3UjDr3JsdxBP9TLiGDvN7r92b1N3QUfWj9foZ
 KFumBUxOJonmN88Qb4ITH4G1tgZz1q0fOledRtN4pMx1RGtVatW7moKDGaXP4aBgvOaCfitsR
 Qf8qecyFRxbVS6TBZNCHSxYZsSbzl8trXx6mvYRO0zzrSg4CcySxQRWRFPZo62wYz5PFQ9CYh
 3bS2s0oblvh6i+5QzVCedRewMGrgzULSN/7EHQYQF8QJg5bh5vIpQxbsoeEhDCS+Z054aek8G
 87AxJXsh6dU9TSRo3ODhhn6E4MKP2i3t68dLHXuH0oMCdENtNDicla+xvMSgo7EdigcjzSH2a
 ZDoCXzPBKVz6d8aPdKoeEkOcOCogfW3+VRdxZErfTAmEnw/D4kwC3j8caBGI8JwJ15Bg3cLt8
 JRiwGqENp877fqhlaTayESklqiQ7x2VtNCGrHlIZABw/WGfW6UvJb33Ynhjgymu0vjqo7SJBx
 UVUprXoDXCiQ9XboPLvKhL8KWZFrsH3Kf4YQ1Mx9P8qOk65Uos0MgxtW1xffLC6c5GRShTxev
 0OTKDvu+eAy3YEW5lqwt/PZRVxxCKQZy1I50udFc5LTEZCyw75JUY2DS6LTgM2gOew+mIKnq5
 +HUQ7uS4S8nLILNQPh7xg6R/l1DiadVyh4SPj9RJMgqHkP+bbP8ImlHrKSU81MdvN2AB6obEQ
 mppZnKZ0VRk60gg+pzn8otE7lIkyXk9EUlFH8NSQBoG2RgCqI76+wx+WDCC9OXb3CoauDVQ77
 pWirQLzzzN71T5GkdvS2LcT+Z8oYVYxD6uFuiVQGpCYq5ZAj43yXNsk1UnQgTvx9xHs7FSrq5
 MEZzIUMgDKZrvLGRisgDhQWjTDKxhBUfg82rPCetTe/De2unx/J1uf4skYX26OUlPeYarJC2M
 RhgHTaJzmNJzPvpGUARiPBqsZxmZkFC5g6ATV1fewuQAb7dWQqhdHhj6R4BXo/khthNSY7ChH
 WY6ztlqEQRYJYiBhy+ABkgcl5zbAJnAGT+6CRKaF2dYHBzU6aAVx/88eTjp/m+rawf1DvDK7+
 nzeikIUynih+J2h9SUOmLfCwj+CAWVqKmZuW03TxIqvBnfojEk/A4K1+AN71y7wdJp24dDwD0
 pp5Jng0HdVQaTQgfS
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Drop own open-coded implementation to set bits and use the kernel
provided BIT_MASK() and BIT_WORD() macros.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/bitops.h b/arch/parisc/include/asm/bi=
tops.h
index a09eaebfdfd0..aa4e883431c1 100644
=2D-- a/arch/parisc/include/asm/bitops.h
+++ b/arch/parisc/include/asm/bitops.h
@@ -12,21 +12,6 @@
 #include <asm/barrier.h>
 #include <linux/atomic.h>

-/*
- * HP-PARISC specific bit operations
- * for a detailed description of the functions please refer
- * to include/asm-i386/bitops.h or kerneldoc
- */
-
-#if __BITS_PER_LONG =3D=3D 64
-#define SHIFT_PER_LONG 6
-#else
-#define SHIFT_PER_LONG 5
-#endif
-
-#define CHOP_SHIFTCOUNT(x) (((unsigned long) (x)) & (BITS_PER_LONG - 1))
-
-
 /* See http://marc.theaimsgroup.com/?t=3D108826637900003 for discussion
  * on use of volatile and __*_bit() (set/clear/change):
  *	*_bit() want use of volatile.
@@ -35,10 +20,10 @@

 static __inline__ void set_bit(int nr, volatile unsigned long * addr)
 {
-	unsigned long mask =3D 1UL << CHOP_SHIFTCOUNT(nr);
+	unsigned long mask =3D BIT_MASK(nr);
 	unsigned long flags;

-	addr +=3D (nr >> SHIFT_PER_LONG);
+	addr +=3D BIT_WORD(nr);
 	_atomic_spin_lock_irqsave(addr, flags);
 	*addr |=3D mask;
 	_atomic_spin_unlock_irqrestore(addr, flags);
@@ -46,21 +31,21 @@ static __inline__ void set_bit(int nr, volatile unsign=
ed long * addr)

 static __inline__ void clear_bit(int nr, volatile unsigned long * addr)
 {
-	unsigned long mask =3D ~(1UL << CHOP_SHIFTCOUNT(nr));
+	unsigned long mask =3D BIT_MASK(nr);
 	unsigned long flags;

-	addr +=3D (nr >> SHIFT_PER_LONG);
+	addr +=3D BIT_WORD(nr);
 	_atomic_spin_lock_irqsave(addr, flags);
-	*addr &=3D mask;
+	*addr &=3D ~mask;
 	_atomic_spin_unlock_irqrestore(addr, flags);
 }

 static __inline__ void change_bit(int nr, volatile unsigned long * addr)
 {
-	unsigned long mask =3D 1UL << CHOP_SHIFTCOUNT(nr);
+	unsigned long mask =3D BIT_MASK(nr);
 	unsigned long flags;

-	addr +=3D (nr >> SHIFT_PER_LONG);
+	addr +=3D BIT_WORD(nr);
 	_atomic_spin_lock_irqsave(addr, flags);
 	*addr ^=3D mask;
 	_atomic_spin_unlock_irqrestore(addr, flags);
@@ -68,12 +53,12 @@ static __inline__ void change_bit(int nr, volatile uns=
igned long * addr)

 static __inline__ int test_and_set_bit(int nr, volatile unsigned long * a=
ddr)
 {
-	unsigned long mask =3D 1UL << CHOP_SHIFTCOUNT(nr);
+	unsigned long mask =3D BIT_MASK(nr);
 	unsigned long old;
 	unsigned long flags;
 	int set;

-	addr +=3D (nr >> SHIFT_PER_LONG);
+	addr +=3D BIT_WORD(nr);
 	_atomic_spin_lock_irqsave(addr, flags);
 	old =3D *addr;
 	set =3D (old & mask) ? 1 : 0;
@@ -86,12 +71,12 @@ static __inline__ int test_and_set_bit(int nr, volatil=
e unsigned long * addr)

 static __inline__ int test_and_clear_bit(int nr, volatile unsigned long *=
 addr)
 {
-	unsigned long mask =3D 1UL << CHOP_SHIFTCOUNT(nr);
+	unsigned long mask =3D BIT_MASK(nr);
 	unsigned long old;
 	unsigned long flags;
 	int set;

-	addr +=3D (nr >> SHIFT_PER_LONG);
+	addr +=3D BIT_WORD(nr);
 	_atomic_spin_lock_irqsave(addr, flags);
 	old =3D *addr;
 	set =3D (old & mask) ? 1 : 0;
@@ -104,11 +89,11 @@ static __inline__ int test_and_clear_bit(int nr, vola=
tile unsigned long * addr)

 static __inline__ int test_and_change_bit(int nr, volatile unsigned long =
* addr)
 {
-	unsigned long mask =3D 1UL << CHOP_SHIFTCOUNT(nr);
+	unsigned long mask =3D BIT_MASK(nr);
 	unsigned long oldbit;
 	unsigned long flags;

-	addr +=3D (nr >> SHIFT_PER_LONG);
+	addr +=3D BIT_WORD(nr);
 	_atomic_spin_lock_irqsave(addr, flags);
 	oldbit =3D *addr;
 	*addr =3D oldbit ^ mask;
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 48d628a1a0af..39ea464c8bd9 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -750,7 +750,7 @@ unsigned long alloc_sid(void)
 	free_space_ids--;

 	index =3D find_next_zero_bit(space_id, NR_SPACE_IDS, space_id_index);
-	space_id[index >> SHIFT_PER_LONG] |=3D (1L << (index & (BITS_PER_LONG - =
1)));
+	space_id[BIT_WORD(index)] |=3D BIT_MASK(index);
 	space_id_index =3D index;

 	spin_unlock(&sid_lock);
@@ -761,16 +761,16 @@ unsigned long alloc_sid(void)
 void free_sid(unsigned long spaceid)
 {
 	unsigned long index =3D spaceid >> SPACEID_SHIFT;
-	unsigned long *dirty_space_offset;
+	unsigned long *dirty_space_offset, mask;

-	dirty_space_offset =3D dirty_space_id + (index >> SHIFT_PER_LONG);
-	index &=3D (BITS_PER_LONG - 1);
+	dirty_space_offset =3D &dirty_space_id[BIT_WORD(index)];
+	mask =3D BIT_MASK(index);

 	spin_lock(&sid_lock);

-	BUG_ON(*dirty_space_offset & (1L << index)); /* attempt to free space id=
 twice */
+	BUG_ON(*dirty_space_offset & mask); /* attempt to free space id twice */

-	*dirty_space_offset |=3D (1L << index);
+	*dirty_space_offset |=3D mask;
 	dirty_space_ids++;

 	spin_unlock(&sid_lock);
