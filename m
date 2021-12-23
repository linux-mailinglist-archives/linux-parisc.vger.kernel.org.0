Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B29F47E7C6
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Dec 2021 19:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244743AbhLWSsb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Dec 2021 13:48:31 -0500
Received: from mout.gmx.net ([212.227.15.18]:37327 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244751AbhLWSsa (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Dec 2021 13:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1640285297;
        bh=4P4JiUixVdrh/yKZHmQjy//mR5MyJ+hgMhTVYQbuwag=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Iqv1YBC/Gi27H+5+8caujNahL8+U03HtFaYFZ5VLoUX5kIAxmIe6dqpKOtzjzH9xs
         pnnrVytG8xAK21az/PL+1cg9VREHmoRDxtNQQvr9wcKobNWNk4X3pbum+cQtIK6F63
         UzkDzlSyv9fA2B+02P8ij4mOfKJAsIQs/LFpUaJs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.187.188]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDXz-1mAqYW16a5-00ucJo; Thu, 23
 Dec 2021 19:48:17 +0100
Date:   Thu, 23 Dec 2021 19:47:22 +0100
From:   Helge Deller <deller@gmx.de>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v2] parisc: Rewrite light-weight syscall and futex code
Message-ID: <YcTEOhVnmT8kQRmf@ls3530>
References: <YcScAR4cPgyI5B6d@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcScAR4cPgyI5B6d@mx3210.localdomain>
X-Provags-ID: V03:K1:HUlShgKO2b/pcXovUavSRfag3T4FlAZdOM7SrW1D5PW0p8XhanG
 EbVhAONTllHKQIhlIrGoXNRYI/tKVxoh10OZuQ1aCLNbntO3VmEtU6hEOHnmypiZ+xkeYfn
 A1WNO53ROMcvrgxniAOzKrgyrSagZ09DGf6tBnmf7/52T4akb0/oXKvNFmqi3Wkf4iDxJyV
 WUiVg6sqBTL7H0aXf9J8w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2i2WFEgiMwE=:hsllIJRpkqtOt5StsDmUui
 sjNAE0BBeyyj9gH8fMFXY5YoJzUADjbJlrRBpmzy/UgOZDmMTyzw+u1f7l7r3SQFKWrBqE+S/
 Pmivd3oTAhiHzJDXTAJ3iW0qXaSeKpeCQnLxs6xt/Z4fU6HOJBWFs3AeVbZHML0RPxUBh5EVQ
 8+/c5MI9ygppxgSyN9+Og6wChU0r8XU9A45t/bwVq5ydVIAovhe/yWUjrL0i9zEujgzrerdJm
 9VVeaI5tuhgFgEiKNajSfhqYQH8wUjVa65cAxrJtsK5u+DDdUq44sJAUh+r/3upqlhJLz6xBW
 nXvwujpHupw72Lx+IW7fSNK/WTrlIrhtCm5nHTI+1KSMVB4sxiznwyed9E57U3PwuY3uYwwOr
 DsrIR7ICYDimWlE7IazdsH64lFdcFtlYpgLvK/ZV5W9M858lBuFh+wXNn0Yjbu3PC3mN2QhRt
 3FXrBWTP/UvLAFwaU8dsTkFiHNRSfQuos/XrTqlN3c886J9r6elocBOSb5n0fsEPW/auMvmyE
 aAoyVLTNSLsH/iHhfSlN/Bo5+sj5IB6vUbU9/UPuhye7O9wvFK40lhV1bShusbSrDdSpcFcBO
 jYWaoU3Ljmc95VqWnu5t34+kvxKZHlGohcqJVBM/WYJsREszGyfwbse35H+9JdRkffs2derTi
 dQkEhd0xo45e2Adamzsti0heuIlilIi7gLljouBMMeM1Ep8HBrd3R0Xv/24mTtuMsVkS4rDWY
 a25vcIMRTY+YmB1PRxsx/2KPIkjn0DRaedKfZePnJRRqY5cnwaDxgF0KRltq0ISPf7oDo9Xcv
 Ja1eWAtzlLs/mu4EU+8Jf7ihrwdW3fV6NzoCPt8WF2H6431bjfXAZcfZVeopcOCZ8rrojjceU
 dr3MmAvxsQJRWqYhzL+U2a3VWvsRQiUCEWUEKjwgdrS31+Tx9xNErioWKcqMxz8l6s7HAXa83
 Zwvh0g/sRfDlV3dwlQ2UcWRT4HKlsr5JRRD9ysNpgrSDZkuDHHETwa8LDznent/zl+L9HIPth
 +nhS4SGN2T86XlXiMETZmYMvoaldZmoaewxvQ6JT/qyrI0EqqREQVQtclJfPYKkdand5G9I/M
 nXFA0J7MQj20s8=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

...
> In order to do this, we need a mechanism to trigger COW breaks outside t=
he
> critical region. Fortunately, parisc has the "stbys,e" instruction. When
> the leftmost byte of a word is addressed, this instruction triggers all
> the exceptions of a normal store but it does not write to memory. Thus,
> we can use it to trigger COW breaks outside the critical region without
> modifying the data that is to be updated atomically.
...
> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/f=
utex.h
> index 9cd4dd6e63ad..8f97db995b04 100644
> --- a/arch/parisc/include/asm/futex.h
> +++ b/arch/parisc/include/asm/futex.h
...
> +static inline bool _futex_force_interruptions(unsigned long ua)
> +{
> +	bool result;
> +
> +	__asm__ __volatile__(
> +		"1:\tldw 0(%1), %0\n"
> +		"2:\tstbys,e %%r0, 0(%1)\n"
> +		"\tcomclr,=3D %%r0, %%r0, %0\n"
> +		"3:\tldi 1, %0\n"
> +		ASM_EXCEPTIONTABLE_ENTRY(1b, 3b)
> +		ASM_EXCEPTIONTABLE_ENTRY(2b, 3b)
> +		: "=3D&r" (result) : "r" (ua) : "memory"
> +	);
> +	return result;

I wonder if we can get rid of the comclr,=3D instruction by using
ASM_EXCEPTIONTABLE_ENTRY_EFAULT instead of ASM_EXCEPTIONTABLE_ENTRY,
e.g.:

diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/fut=
ex.h
index 8f97db995b04..ea052f013865 100644
=2D-- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -21,20 +21,21 @@ static inline unsigned long _futex_hash_index(unsigned=
 long ua)
  * if load and store fault.
  */

-static inline bool _futex_force_interruptions(unsigned long ua)
+static inline unsigned long _futex_force_interruptions(unsigned long ua)
 {
-	bool result;
+	register unsigned long error __asm__ ("r8") =3D 0;
+	register unsigned long temp;

 	__asm__ __volatile__(
-		"1:\tldw 0(%1), %0\n"
-		"2:\tstbys,e %%r0, 0(%1)\n"
-		"\tcomclr,=3D %%r0, %%r0, %0\n"
-		"3:\tldi 1, %0\n"
-		ASM_EXCEPTIONTABLE_ENTRY(1b, 3b)
-		ASM_EXCEPTIONTABLE_ENTRY(2b, 3b)
-		: "=3D&r" (result) : "r" (ua) : "memory"
+		"1:\tldw 0(%2), %0\n"
+		"2:\tstbys,e %%r0, 0(%2)\n"
+		"3:\n"
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
+		: "=3Dr" (temp), "=3Dr" (error)
+		: "r" (ua), "1" (error) : "memory"
 	);
-	return result;
+	return error;
 }


Helge
