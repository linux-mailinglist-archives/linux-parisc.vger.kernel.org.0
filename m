Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8C21282FC
	for <lists+linux-parisc@lfdr.de>; Fri, 20 Dec 2019 21:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfLTUA1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 20 Dec 2019 15:00:27 -0500
Received: from mout.gmx.net ([212.227.17.21]:39975 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727411AbfLTUA1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 20 Dec 2019 15:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1576872022;
        bh=e6yeiVFatuyStjuRpRL9Ddb2nb1owAxvNuaKrH0Oh5Y=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=UgctRokGF+3KNGMVIBfIp9+Ssi59RxL20KbqrBUw8g4yM5O3cxDnHSEysvVS6VaEW
         gaueN1lZSyQEyRzUh4ViO/JQjLu/0cJKdNPWiscXe04Fu5CiVP2zRdOc1e3aqHAIu8
         hCM7Wm8zKp+ZJ9zWv3lEIi3jPVM83GfqeniZSvy4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.172.235]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf4c-1i13Ho1hfG-00ilSi; Fri, 20
 Dec 2019 21:00:22 +0100
Date:   Fri, 20 Dec 2019 21:00:19 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix compiler warnings in debug_core.c
Message-ID: <20191220200019.GA20308@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tyWlO0mlTpd6w0BeqZ0qKLZZKbgg3aRXIZq0qiDyo+gLVTtBhtT
 qRB7wbgrVCZft4+sUP2m1H2tWDoz6Jfphb0j+N2J3VNNiVAd3DJqGz6zJejJpDWByVowqY9
 +xBrKKqaic9ZDqkInbCaI5koPMPv6MM7az0vf3cejJ7cqnm15D5st2W5jebvrE/K8J71yxE
 hgqAK5DOYvNPwgA53hhSw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sRFpxfBof38=:h9ePR/DKGDvsDYATq7jQTx
 9KmvTVZMDoH+vzPuMobM7Zo9NPU5WhEXH/YlTrEKrmUmn8OtBoN70xM8M64++rWw7BWqDOaUH
 WbWmKMiDNzKHe2JTxsTnwYVYjsfxoXbWuCctCZl5asoXVDPg5cW6aJw7gMT6zRC+2MI1nWNXC
 Cw6wgcrefVxAxYj/K7hOr6oQGOHMSmZhVq6EH8HPUS2ZcgAAM+pkqFBOLzIEYGgxQ63TF4JOV
 gychuqrnn6KyXkdLnEWW9geCIi9ovSizeVEdAalN/RC5XsEA8rtgWDUg0VJJUoHaTOBqDsbnv
 J+60KDdBYkYKpDMwe9iO+Ht3UvH/+4GlkN35p16GXyNbmnZprcpmToWBX/URDWAmQFrwsbv8J
 3zD6y7EbIKVEEotf6e2LFcegLxcmUWEA3vrCZEf+aBtkL6qhUo0tSd2YlIDWgmCzl0w4f2XnS
 bkUytKfrZjliztbuMtbMkIS0v8jVb8rW2T/9JeX7THwN0Ug5pVIAA1Cws3YYWPQ09xkXrCBLR
 G07mo0++aeZ9DFTLzhOexIpWvqi6LuFlAqs78YWI8oOmDudzkZuJlhsKP52H81QOrNOFl6fln
 dcN1ZDoLhsEpXxkujeDh2SCqcQHZB9bHM85WMfW7JDmtGNbfw4ZnHiHupmEtWTF3rYos/6hJ8
 BTKnoIlmqGU0uCem/0tfo9p/0ZuAkXawOnDSuDjkWyST5nHQq3bZrbBoCU+4SItc4THqvQP2r
 J/4loYQrNeEfQHD0aqnd6bACYQ8KBdJr4BmNALKqjYVDb3D7vlRAyNcfkVv/Dc8+SdgvPmlfo
 lii16qsIiYgiSGYDI4SiI1iQLu7CVJXtJQF7FBqLZ0GhU9OkTe4GOjyWiTYJ7Ba5HqnjHywJ1
 rix04mbyKW9apgy3glB688NyfD7wIbgCxePGDBEoejQ+uagDT6FNAP6TtYyC51zW8392Y2FNO
 stmyYh1xby8zsDFXFX6O/0BcJwoctSU5EUFhwXJrAgoakQmCl54q4nxR2Qh4aTaMxOpLN2Er/
 JYJxEvORQSB80jT2vZHx6uvel7Cdu8ATQ4h2kfNwzE5Lfa6CjV9EIsiYPJMNUaJjUe2Oc2c4f
 YQhEhj697reuYdw2jE2MZh2F8JayYIXafjDevT7Kl/kqD0cytr0ekLJAGx3oh7MKHiHizWICN
 z+CdWZmgxe6S1bJQeUrJlSV9bAmhKdauMQfhpYSWpfPxfh1/l3uNXrJtfcSjr+GSgrCIaxIst
 Qg3VhNYve0oQzUQJyUzr07teFALOHVe/n6AaWMA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix this compiler warning:
kernel/debug/debug_core.c: In function =E2=80=98kgdb_cpu_enter=E2=80=99:
arch/parisc/include/asm/cmpxchg.h:48:3: warning: value computed is not use=
d [-Wunused-value]
   48 |  ((__typeof__(*(ptr)))__xchg((unsigned long)(x), (ptr), sizeof(*(p=
tr))))
arch/parisc/include/asm/atomic.h:78:30: note: in expansion of macro =E2=80=
=98xchg=E2=80=99
   78 | #define atomic_xchg(v, new) (xchg(&((v)->counter), new))
      |                              ^~~~
kernel/debug/debug_core.c:596:4: note: in expansion of macro =E2=80=98atom=
ic_xchg=E2=80=99
  596 |    atomic_xchg(&kgdb_active, cpu);
      |    ^~~~~~~~~~~

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/cmpxchg.h b/arch/parisc/include/asm/c=
mpxchg.h
index f627c37dad9c..ab5c215cf46c 100644
=2D-- a/arch/parisc/include/asm/cmpxchg.h
+++ b/arch/parisc/include/asm/cmpxchg.h
@@ -44,8 +44,14 @@ __xchg(unsigned long x, __volatile__ void *ptr, int siz=
e)
 **		if (((unsigned long)p & 0xf) =3D=3D 0)
 **			return __ldcw(p);
 */
-#define xchg(ptr, x) \
-	((__typeof__(*(ptr)))__xchg((unsigned long)(x), (ptr), sizeof(*(ptr))))
+#define xchg(ptr, x)							\
+({									\
+	__typeof__(*(ptr)) __ret;					\
+	__typeof__(*(ptr)) _x_ =3D (x);					\
+	__ret =3D (__typeof__(*(ptr)))					\
+		__xchg((unsigned long)_x_, (ptr), sizeof(*(ptr)));	\
+	__ret;								\
+})

 /* bug catcher for when unsupported size is used - won't link */
 extern void __cmpxchg_called_with_bad_pointer(void);
