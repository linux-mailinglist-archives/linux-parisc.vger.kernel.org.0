Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAFB87D04B
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 23:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbfGaVv2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 17:51:28 -0400
Received: from mout.gmx.net ([212.227.15.18]:41651 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727987AbfGaVv1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 17:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564609878;
        bh=kAy7NoaAVmviVQGadWUYyq5eqwBRrWZB50MhaFIISwk=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=ljX1tgljbpDEgdi6qdL3L5mGkaQNT0RSjegMf3ory50CcDza6bi8EU/9j+WmjzOmd
         LD3mt9HyR5Ek2NuiN2PyVuePaCnpSG35waWE5xyYxMEHWGTR5V3MlUTiPmqZwte+Hd
         Z+JPkTntNhncBgTRyTt9t9yAsvqUPAxYwc+tNL5g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.24]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MEoGY-1i7pwl43YI-00G1l8; Wed, 31
 Jul 2019 23:51:18 +0200
Subject: Re: Compressed kernels currently won't boot
From:   Helge Deller <deller@gmx.de>
To:     Sven Schnelle <svens@stackframe.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
References: <1564591443.3319.30.camel@HansenPartnership.com>
 <20190731173016.GA23520@t470p.stackframe.org>
 <1564595402.3319.40.camel@HansenPartnership.com>
 <1564602012.3319.45.camel@HansenPartnership.com>
 <20190731194413.GB23520@t470p.stackframe.org>
 <1564606894.3319.72.camel@HansenPartnership.com>
 <20190731210819.GE23520@t470p.stackframe.org>
 <4a79ab9c-c791-0c61-0664-60eab3567125@gmx.de>
Message-ID: <2bd11097-8de3-6cd8-f158-ec9926e47614@gmx.de>
Date:   Wed, 31 Jul 2019 23:51:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4a79ab9c-c791-0c61-0664-60eab3567125@gmx.de>
Content-Type: multipart/mixed;
 boundary="------------619C74AD75E7C61EFE17A3ED"
Content-Language: en-US
X-Provags-ID: V03:K1:+H0dmna7Yx1p3lssp/tQ2wds20iCEvglq+lnIGFb/rwLkDrbwKr
 1eN1rii4HQ1yt5ERV0s+go7J0qVGSK0/fs/s5u4s/huEWV4j7vzYvXU+ZxJa1iPVionjkd4
 GGmNTGr+/HPs3lu1N8qkjRdS9YlBqqCEcUNqAC8mjdWV4B+EzxwAnEaUnkkkC1kqlUCNMB8
 FdE58vG2x5PvVs34MQI1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a8NvUQx0Ea0=:k+mRcAZC3lWAKModnHIMyS
 HEyc0gzEMQ3CxsGcBYPoFgxJDye4k5MPO9KuZJsEmZIk2PP/eH1PR9gaKzBSDbumxaAV5ls+a
 8r3oNiEdbjfwiPP0cfCfmR5K0X/cpu+OeFH7O940e5q8CbGVhIUgF5cDWBNPHQMz2zn1Nx8pM
 czubUEm+REa+jYnEUUIiFzyPVQls+gOLnTt6B6nMB6ae3WJvE8sUYFmdbdZW9uZEZULggLH1v
 2UMGrIWA6d1w6xPFzSpQzE8ex8g8kLRmqaT4BR1z046Xk1GBbkW2O9Jjp/cPQX9TT1+OQ6Oz9
 3g+p9pmF9t08v7I2ry9csuiCkXf0nBy707G8GGYleEvXF5TOlYP3Hb4ZYDv+mKSvPcBXve/gu
 CKPt7npOFmBhzN6qrDJYXDjFuv6TqYq4sUHU9nhGGUlagHWwEmVd5fsOVdaxAzHTo8hqKv8oy
 uieo/RTekuM58yBJ17NCBrg2BMetcBnYNqObpF6sA5qQ/NNneNdTo2OPLGWaIxRVcXNxTKAJg
 uUG9wh88YRdm6ZlAHJqEyHePU+u9Sty0ZcG4FMk7tsQpDpd9UB41XUV5gRdK0MtmJGqcwKeyK
 eA1yAF4Xw8nYUzKLyinG4w6vl78MMYfPNAATh2r4oJ0bt3Fg/ZymQhAq6cl0Pu45igah/nahi
 htScd9sL+yl5R55Ekd4cPHmkJR3mxuYGpyl++s0cI1dZp7coTM0y+AHwOmGLHOU6LXm68fL32
 qQaEjeServ4kPisxAinuA25UnuXuX2xnWcGMdCV+kJm4XyzaLDqD3cpcpa9k4izxd/vIwFVkZ
 mONebrMis1rctMcg8EN7+5AvXNYsR2LXZq7cmYbEgM5a/4OAeTuk5G06bW4LpsgE6/piOgJP9
 62xpMUYjnGHCAhvVarBObn18W5AFOTBgq05K7edOR6Z6sSlxOMmQdnCmSZ2paJ61AWT6l07uO
 u90yD5+SGYbWkz+WlQQth8gDJcvV7au770N/Kh10oS4N+UP3wiVB7py1WCXhl66li1cQvaeA+
 IrW9ni7b95Mh/Q6XjWK+jq/7yIZFlwwoPoaZ9GuYadND+w3+BXS2VqqnjlFnG0gmflIbI8wDd
 sgWUq7QiXaXT8xarh9PSPYpAF8ap8hFOpU06nKqmu+qA04oBlBEa6Q+sr1RN1rhTxo4jdfRGx
 rSqbd+axUzyPS0kEC6V2/0mpiQzzUw3YWtzy1EMWhHCRThqqYgF4LFF69idV1VUzCFUp4=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is a multi-part message in MIME format.
--------------619C74AD75E7C61EFE17A3ED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 31.07.19 23:13, Helge Deller wrote:
> On 31.07.19 23:08, Sven Schnelle wrote:
>> Hi,
>>
>> On Wed, Jul 31, 2019 at 02:01:34PM -0700, James Bottomley wrote:
>>> On Wed, 2019-07-31 at 21:44 +0200, Sven Schnelle wrote:
>>>> Hi James,
>>>>
>>>> On Wed, Jul 31, 2019 at 12:40:12PM -0700, James Bottomley wrote:
>>>>
>>>>> What about causing the compressed make to build both a stripped and
>>>>> a non-stripped bzImage (say sbzImage and bzImage).=C2=A0 That way yo=
u
>>>>> always have the stripped one available for small size things like
>>>>> boot from tape or DVD?=C2=A0 but in the usual case we use the bzImag=
e
>>>>> with full contents.
>>>>
>>>> In that case we would also need to build two lifimages - how about
>>>> adding a config option option? Something like "Strip debug
>>>> information from compressed kernel images"?
>>>
>>> Actually, I just looked at what x86 does.=C2=A0 It has this in the
>>> arch/x86/boot/compressed/Makefile:
>>>
>>> OBJCOPYFLAGS_vmlinux.bin :=3D=C2=A0 -R .comment -S
>>> $(obj)/vmlinux.bin: vmlinux FORCE
>>> =C2=A0=C2=A0=C2=A0=C2=A0$(call if_changed,objcopy)
>>>
>>> So it basically strips all the debug information from the kernel befor=
e
>>> compressing, which argues there's no need to retain the information
>>> because x86 doesn't bother.
>>
>> Nice. So we could convince Helge by saying "Look, x86 is also stripping=
 it"! :-)
>
> I'm fine with doing exactly why x86 does :-)

Attached is the revised patch, and it gets the compressed kernel down
from 32MB to 3.8MB.

Helge

--------------619C74AD75E7C61EFE17A3ED
Content-Type: text/x-patch;
 name="drop-debug.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="drop-debug.patch"

diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compr=
essed/Makefile
index 2da8624e5cf6..c54d9d0f6043 100644
=2D-- a/arch/parisc/boot/compressed/Makefile
+++ b/arch/parisc/boot/compressed/Makefile
@@ -55,7 +55,8 @@ $(obj)/misc.o: $(obj)/sizes.h
 CPPFLAGS_vmlinux.lds +=3D -I$(objtree)/$(obj) -DBOOTLOADER
 $(obj)/vmlinux.lds: $(obj)/sizes.h

-$(obj)/vmlinux.bin: vmlinux
+OBJCOPYFLAGS_vmlinux.bin :=3D  -R .comment -S
+$(obj)/vmlinux.bin: vmlinux FORCE
 	$(call if_changed,objcopy)

 vmlinux.bin.all-y :=3D $(obj)/vmlinux.bin
diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boot/=
compressed/vmlinux.lds.S
index bfd7872739a3..2ac3a643f2eb 100644
=2D-- a/arch/parisc/boot/compressed/vmlinux.lds.S
+++ b/arch/parisc/boot/compressed/vmlinux.lds.S
@@ -48,8 +48,8 @@ SECTIONS
 		*(.rodata.compressed)
 	}

-	/* bootloader code and data starts behind area of extracted kernel */
-	. =3D (SZ_end - SZparisc_kernel_start + KERNEL_BINARY_TEXT_START);
+	/* bootloader code and data starts at least behind area of extracted ker=
nel */
+	. =3D MAX(ABSOLUTE(.), (SZ_end - SZparisc_kernel_start + KERNEL_BINARY_T=
EXT_START));

 	/* align on next page boundary */
 	. =3D ALIGN(4096);

--------------619C74AD75E7C61EFE17A3ED--
