Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC77242A4CD
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Oct 2021 14:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbhJLMqJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Oct 2021 08:46:09 -0400
Received: from mout.gmx.net ([212.227.15.15]:54427 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236441AbhJLMqD (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Oct 2021 08:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634042636;
        bh=VK+JDNeV/bhDzEHKOhoyQFnNp/wJAgx81/7z4paG0oo=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=X9vScg/W//xRJTA/UV5CdX6Lnxh3QT4jjx/+O4kFLLSvAjS31BCDk3zRMVCAbOvIr
         psL6h4Wu0AviGfcROqyfsXhQTMCJbsAxjKbBpI2CpELTW3EiFKF4MKI2fFJvH/ZM+o
         KqUX6WLMXtFbnfBGRsDkAUfmCIaQyDY8zABg48ic=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.128.177]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwwZd-1myhfz2owN-00yMPs; Tue, 12
 Oct 2021 14:43:56 +0200
Message-ID: <2bc6a677-95f1-93c6-6a26-895912a5f7b2@gmx.de>
Date:   Tue, 12 Oct 2021 14:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] parisc: Fix xmpyu usage in 32-bit kernel
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YWSSVwQ9tc9YaC+f@ls3530>
 <d4c868f8-5001-495a-524f-752545146b20@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <d4c868f8-5001-495a-524f-752545146b20@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qNl23ylVfwbiw54a6JLaUyeIQbUKmbvEHlfNnrgc+Pxw2/yD1DQ
 MtVQdIVS2BkYFDcNmUp1G20i3w9Hl9WF4te9NqqZbvfmiCzjePRru7dtClxV8VNM9qaOMwW
 lT5HMdsugX7YU2ynf7Z3bLZToSaX+xRQMuTJjdUBy6YDh8VMIv2XsC9XY6hIDHCD143SqA2
 nsULSpkFDnoU8Ub+b03Ow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MVP6ov8eSnA=:3hKhn3r6QIcaHQkiEFaNRQ
 ZXrMSjOPzurjhF0TpXSEiLFW57Xfv1BHGW6DwW+dT86bK0PqNDtGyZwRem3hsxF3PZm4osIVE
 EKiQNsUMaF5lM0YBB5mcnCmHXpltYoePGYhJ0t7PGWaDfHhaNuk9hVJGNAlH5eOx4676dh46e
 fcvv3Lbw5G3j39t0YrRCQj18mTortt+dEnh6Iv8C7Ul/BsGRXcL8aU7Eog793G/bVR2AccpSp
 SABHlvVsT//dee9sZCOq45IW14fH9wEDyaKzpDAFl9H17WGCz692IgO+QauTUkLx480xMism0
 RvOW/a0F+zmaKIumIYTWDUzQLN8Xuns91sncxGV1mrlRqX/xU1BSnV5jlTzKtQBTR6IX9fAu0
 rEJUapOx1zxhNzXx+AII33ELkMgsaOxYx4pS2RYi7bV6HD64k9jZz3ensUDUtuA3WC75u+Z1n
 XXd7cYOcoBfbOgOJ6/LEEXrRJuzLZiXko8Vvwn8LrYmMPkPko/eo+iS3qFxfNRSuFbfaZjFVy
 nxSVoHVv8iLascOPjaF4qBIlvvRaF5PNM7j5gi0o8RQkiRj3sNYnQ9ejC+G/XHpvDpyahESvB
 HSJ8u3bZ/HRs5XqUWBWEnMSDkyR5HdKdAfWS2S080jHvbp+OH3PYiL/x3DQnC97H1NdxA635U
 ixNzh0USO2jT1tgbrA7MV4YIB7n1k/jYKJYBMNU95kPIcJbnAlGXv06Etv+deK0H7y/DRt9Nh
 rL0k43JBO0XPq7YaDP5pe3VdW8N7vDgQkzJFbv+qis4JqwtKuyfbUxq9onu4sW+lzOCwAamAh
 sq7eGjiz9Dygv4WVuwQmd0IfaAXScGyJHgQZuM3I0uY2ZulGC0etuwYLPpoGgj34qrXB9QBkt
 ZFoO10MDvG7bby2Olu2jqwQ86l6Jnr+kmXXZF+e1hgbOVTn0NnjuEZJ/TptIwNOVbotLnyA6G
 Kw40z3bdOz0ol3OVjG8eqC1M4bSNAWyxoPjNos+OI8JR8eeHJOwzMGzoxLQVjoQ9M+y23cGdE
 bXhSbHzl9XMS2VINu5nH76Pr00cEaJpB/0oK1xGDp7llRLMYd1Zq9iej8bDN/daI+4u3f+AB1
 PDR4nRCacxTTgM=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/12/21 13:43, John David Anglin wrote:
> On 2021-10-11 3:36 p.m., Helge Deller wrote:
>> Dave noticed that the libgcc.a which is linked into the kernel binary
>> uses the xmpyu assembler statement. This asm statement uses floating
>> point registers which are forbidden in the kernel, because we don't sav=
e
>> the FP regs at kernel entry.
>>
>> Switch the parisc kernel to use the already existing shared copies of
>> some GCC library routines instead of linking in those from libgcc.
>>
>> This patch avoids all uses of xmpyu in the 32-bit kernel, but the 64-bi=
t
>> kernel still needs fixing.
>>
>> Reported-by: John David Anglin <dave.anglin@bell.net>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
>> index fc17285f4da1..e412d5c6c64f 100644
>> --- a/arch/parisc/Kconfig
>> +++ b/arch/parisc/Kconfig
>> @@ -36,6 +36,12 @@ config PARISC
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select GENERIC_SMP_IDLE_THREAD
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select GENERIC_CPU_DEVICES
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select GENERIC_LIB_DEVMEM_IS_ALLOWED
>> +=C2=A0=C2=A0=C2=A0 select GENERIC_LIB_ASHLDI3
>> +=C2=A0=C2=A0=C2=A0 select GENERIC_LIB_ASHRDI3
>> +=C2=A0=C2=A0=C2=A0 select GENERIC_LIB_LSHRDI3
>> +=C2=A0=C2=A0=C2=A0 select GENERIC_LIB_MULDI3
>> +=C2=A0=C2=A0=C2=A0 select GENERIC_LIB_CMPDI2
>> +=C2=A0=C2=A0=C2=A0 select GENERIC_LIB_UCMPDI2
> I would avoid using the generic routines in the kernel.=C2=A0 The routin=
es from libgcc are better maintained
> and produce better code.
>
> This is really a gcc bug.=C2=A0 libgcc needs to be built with -msoft-flo=
at.=C2=A0 This will prevent the use of
> the xmpyu instruction in __muldi3, __divdi3, __udivdi3, __moddi3 and __u=
moddi3, and fix both
> 32 and 64-bit kernels.
>
> The libgcc build also needs to be fixed to provide the full compliment o=
f software floating-point
> routines.
>
> The -msoft-float and -mdisable-fpregs options are equivalent but current=
ly only -msoft-float disables
> generation of all floating-point instructions.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select SYSCTL_ARCH_UNALIGN_ALLOW
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select SYSCTL_EXCEPTION_TRACE
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_MOD_ARCH_SPECIFIC
>> diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/par=
isc_ksyms.c
>> index 00297e8e1c88..da8c99c5a8c6 100644
>> --- a/arch/parisc/kernel/parisc_ksyms.c
>> +++ b/arch/parisc/kernel/parisc_ksyms.c
>> @@ -92,18 +92,6 @@ EXPORT_SYMBOL($$divI_12);
>> =C2=A0 EXPORT_SYMBOL($$divI_14);
>> =C2=A0 EXPORT_SYMBOL($$divI_15);
>>
>> -extern void __ashrdi3(void);
>> -extern void __ashldi3(void);
>> -extern void __lshrdi3(void);
> If these are actually being used, pa.md needs to be enhanced to avoid th=
ese calls from being generated.
> It should be possible to handle these using hardware shifts.
>> -extern void __muldi3(void);
>> -extern void __ucmpdi2(void);
>> -
>> -EXPORT_SYMBOL(__ashrdi3);
>> -EXPORT_SYMBOL(__ashldi3);
>> -EXPORT_SYMBOL(__lshrdi3);
>> -EXPORT_SYMBOL(__muldi3);
>> -EXPORT_SYMBOL(__ucmpdi2);
>> -
>> =C2=A0 asmlinkage void * __canonicalize_funcptr_for_compare(void *);
>> =C2=A0 EXPORT_SYMBOL(__canonicalize_funcptr_for_compare);
>>
>> diff --git a/arch/parisc/lib/Makefile b/arch/parisc/lib/Makefile
>> index 7b197667faf6..2bfafb3c9ae0 100644
>> --- a/arch/parisc/lib/Makefile
>> +++ b/arch/parisc/lib/Makefile
>> @@ -4,6 +4,6 @@
>> =C2=A0 #
>>
>> =C2=A0 lib-y=C2=A0=C2=A0=C2=A0 :=3D lusercopy.o bitops.o checksum.o io.=
o memset.o memcpy.o \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ucmpdi2.o delay.o
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delay.o
>>
>> =C2=A0 obj-y=C2=A0=C2=A0=C2=A0 :=3D iomap.o
>> diff --git a/arch/parisc/lib/ucmpdi2.c b/arch/parisc/lib/ucmpdi2.c
>> deleted file mode 100644
>> index 8e6014a142ef..000000000000
>> --- a/arch/parisc/lib/ucmpdi2.c
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0
>> -#include <linux/module.h>
>> -
>> -union ull_union {
>> -=C2=A0=C2=A0=C2=A0 unsigned long long ull;
>> -=C2=A0=C2=A0=C2=A0 struct {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int high;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int low;
>> -=C2=A0=C2=A0=C2=A0 } ui;
>> -};
>> -
>> -int __ucmpdi2(unsigned long long a, unsigned long long b)
>> -{
>> -=C2=A0=C2=A0=C2=A0 union ull_union au =3D {.ull =3D a};
>> -=C2=A0=C2=A0=C2=A0 union ull_union bu =3D {.ull =3D b};
>> -
>> -=C2=A0=C2=A0=C2=A0 if (au.ui.high < bu.ui.high)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> -=C2=A0=C2=A0=C2=A0 else if (au.ui.high > bu.ui.high)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 2;
>> -=C2=A0=C2=A0=C2=A0 if (au.ui.low < bu.ui.low)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> -=C2=A0=C2=A0=C2=A0 else if (au.ui.low > bu.ui.low)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 2;
>> -=C2=A0=C2=A0=C2=A0 return 1;
>> -}
> This should be removed and libgcc routine used.

I fully agree with you!
The problem is though, that the current kernel is buggy and we
need to solve it ASAP.
The question is, when a fixed libgcc will become available...?

Helge
