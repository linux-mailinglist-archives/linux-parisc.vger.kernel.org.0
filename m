Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DF83FF457
	for <lists+linux-parisc@lfdr.de>; Thu,  2 Sep 2021 21:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhIBTuO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 2 Sep 2021 15:50:14 -0400
Received: from mout.gmx.net ([212.227.17.21]:32949 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231440AbhIBTuB (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 2 Sep 2021 15:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630612127;
        bh=EJDxPamZniM21DfkbqA6rC+S6EjteWLNJcfMwKSFJK0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Boc3Vo/pi0Sk3Gp295QbDWvaVafxUcol13zIhKjsYjXRIyMJRS5fdOr2ureQzSwFk
         si7AbkfbIuiIQWJ1BewXFdpJelcHuCr4287ntigeJy80XgUanxLicPrYorPQufYsGP
         JSe6/D8gv5GkNkqi+ZrhgjCkcJCjGZuZdGC3MLOM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.158.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKGP-1mAaAR3EXR-00FkaK; Thu, 02
 Sep 2021 21:48:46 +0200
Subject: Re: [PATCH v2] parisc: Fix boot with kernel v5.14
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <YS6VGsZ7fZtZeu/i@ls3530> <YTDaZAMvAipdvkaB@ls3530>
 <CAK8P3a0zwnEUK_ztPRBx0H9VGBoPVY-+aASFV97zSKrL=diXUA@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <51d6b8cb-a64f-0cf7-1545-4c2fee89799e@gmx.de>
Date:   Thu, 2 Sep 2021 21:48:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0zwnEUK_ztPRBx0H9VGBoPVY-+aASFV97zSKrL=diXUA@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------404C2534A1D1F3DF5C714E70"
Content-Language: en-US
X-Provags-ID: V03:K1:XLPBKH7p3rszIZGdmhPMAqj5h/eHeZ8BjwjakGwUyZ96lFvHUlc
 ALdz0uOJI8jf+e+/VGhnjYt+bUmuscyM9XDwxoiSdpm395DreIvT3unhFo5Q54CmySECs3M
 TtW0Ko0Zf2tAnlxddnPjCIKZB62iJyr2MMay9xaTxrTVgXfRlq4HnoX+ayrtFa2NGTUUtfx
 NDK2uXR33CrWJLE/2z/+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MNSPPa/qTN4=:CF+el20QJKOnV+zFNzSBB6
 iFPBpqhvNpHjEKeY/5e22xdgTVN09fK+f+61Is4Ulikd64e8GyMtdpVgMnbLmGCc18EjiNsxG
 rnJ3fTYPnkNoLQQ/7QlTNodXCVjsVWLIx5xoGVP+ObiyJ8crEWOqIOK6G+tpn9Lg07dJnWbAY
 qhrHY809wahwyqC2npbBawMu4cvNfk96yoyLAtdXiewbfdfLl4WHrNxbB5FHo1BBpnSFYeHS0
 O7gmZ8mfEg01T3RF+kYGMpQpprAIB+MsPbwp6JgdDrUkoKtW9XQHYYf/Mk/O4J0JPsfIqvffE
 vBXRZ1bAjudD0EhdsEC4ulfL4bMaSChnZpnIiGeC6A+dSJKrYuxLltxiFv+8JFN3SeQtskT8x
 OfQuUVNW/nk5HnzdgHf+3HxrZe2OUQk56ygrPfMY5fC6k1LnfoWuCcqFVrOmc2Ge+zSio1Xg1
 JMKNL1fucyzzGgG49+HtUgLteWdcu1rFui0V9XFt40wpIVD2PUiMJwrNQMi/weA8VhAlUqvmu
 3NQjZGTQNhjL2V1svHvPGoZORcLAab2lchczwcQhSNZqq7pxiu2jJl2iEK2T5YhvEcgQRricu
 qugysSbtuukug94zeM/vmlwbmKe+kXWzm35lIiWhk6pTAvbnPTREtLskvRRkmITWP1WvVjpSk
 FU/rqupuPq+YEsRkVu4CYtPQF9Ue31fQkBb06FahIktLjJIRwE0IMz6xT6WCM0xAyd6jIlFq4
 OCfYxLlL6E3EOrRn8PFUMDzQJWrZPcHNY/19VY9i8uLSAWviu0RQIo6TOba2CzJqGogEgJLy/
 N2L4ROwKziYorKxBs9e5OoAxTsG2hE60CJVaBY4QVwFEIir0IXLwCxHNMku3pLQrpOwJPe3+A
 B97f7fKFl0EMraC1cTBcqYGdjsFo5tHZf3zQMpECqRS0cVnFGnJw2dPobiSbGEZFwqFxv+M3z
 eq5LkF1+BI3EZ/sLdquWazpvqHX4mEVkIus7HfmC1a3iP42R0B2UioXel/nXDhrxju53gVXyg
 IiD47w4bawf5qdT9BtL1PiH0zYaB9tT5/OsVVz9kVyj8dBnMB3BGc8KZ8QnrKOrHrtdEWcOwc
 HnwIdPDQv1UUPnD+eydnUePPRkJNxB7Iugn
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is a multi-part message in MIME format.
--------------404C2534A1D1F3DF5C714E70
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 9/2/21 8:35 PM, Arnd Bergmann wrote:
> On Thu, Sep 2, 2021 at 2:06 PM Helge Deller <deller@gmx.de> wrote:
>>
>> Kernel v5.14 has various changes to optimize unaligned memory accesses,
>> e.g. commit 0652035a5794 ("asm-generic: unaligned: remove byteshift hel=
pers").
>>
>> Those changes break the bootloader and other places in kernel for paris=
c
>> which needs byte-wise accesses to unaligned memory.
>>
>> Here is an updated patch/hack which fixes those boot problems by adding
>> a compiler optimization barrier. More info and background can be found =
in BZ:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D102162
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>
> Right, this should fix it, but I tend to agree with what Andrew Pinski
> said: the existing version is actually correct and allows valid
> optimizations on static variables as long as those are correctly
> annotated in C.
Let's look at generic kernel code, e.g. in fs/btrfs/inode.c.
You will find many similiar cases all around the kernel.
=2D-----------
struct dir_entry {
         u64 ino;
         u64 offset;
         unsigned type;
         int name_len;
};

static int btrfs_filldir(void *addr, int entries, struct dir_context *ctx)
{
         while (entries--) {
                 struct dir_entry *entry =3D addr;
                 char *name =3D (char *)(entry + 1);

                 ctx->pos =3D get_unaligned(&entry->offset);
                 if (!dir_emit(ctx, name, get_unaligned(&entry->name_len),
                                          get_unaligned(&entry->ino),
                                          get_unaligned(&entry->type)))
                         return 1;
                 addr +=3D sizeof(struct dir_entry) +
                         get_unaligned(&entry->name_len);
                 ctx->pos++;
         }
         return 0;
}
=2D----------
According to Andrew Pinski's statement, the compiler will assume here that=
 all of
those get_unaligned() calls will access naturally aligned memory and I'm p=
retty
sure the compiler will generate native 4/8 byte accesses on all platforms.
Most likely you will not notice on most platforms because it will get fixe=
d by
exception handlers or natively in hardware.
But anyway, it's not what the developers intended by adding get_unaligned(=
).

I see no chance to change all those places in the kernel.

> The problem on parisc seems to be that at least
> one variable is generated by the linker in a way that is incompatible
> with the psABI but declared as a regular __u32.

I'm happy to change it if it's just this one variable.
Currently there are more, but I'm still testing.

But generally, would you be willing to consider applying something similia=
r to
the attached patch (untested) until we get it finally resolved on parisc?

Helge

--------------404C2534A1D1F3DF5C714E70
Content-Type: text/x-patch; charset=UTF-8;
 name="force-byte-access.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="force-byte-access.patch"

diff --git a/arch/parisc/include/uapi/asm/byteorder.h b/arch/parisc/includ=
e/uapi/asm/byteorder.h
index a59d9b7e35a8..dcf103b5bd4b 100644
=2D-- a/arch/parisc/include/uapi/asm/byteorder.h
+++ b/arch/parisc/include/uapi/asm/byteorder.h
@@ -2,6 +2,8 @@
 #ifndef _PARISC_BYTEORDER_H
 #define _PARISC_BYTEORDER_H

+#define ARCH_FORCE_BYTE_ACCESSES(ptr)	__asm__ ("" : "+r" (ptr))
+
 #include <linux/byteorder/big_endian.h>

 #endif /* _PARISC_BYTEORDER_H */
diff --git a/include/asm-generic/unaligned.h b/include/asm-generic/unalign=
ed.h
index 1c4242416c9f..cf8c9460e575 100644
=2D-- a/include/asm-generic/unaligned.h
+++ b/include/asm-generic/unaligned.h
@@ -9,13 +9,19 @@
 #include <linux/unaligned/packed_struct.h>
 #include <asm/byteorder.h>

+#ifndef ARCH_FORCE_BYTE_ACCESSES
+#define ARCH_FORCE_BYTE_ACCESSES(ptr)	do { } while (0)
+#endif
+
 #define __get_unaligned_t(type, ptr) ({						\
 	const struct { type x; } __packed *__pptr =3D (typeof(__pptr))(ptr);	\
+	ARCH_FORCE_BYTE_ACCESSES(__pptr);					\
 	__pptr->x;								\
 })

 #define __put_unaligned_t(type, val, ptr) do {					\
 	struct { type x; } __packed *__pptr =3D (typeof(__pptr))(ptr);		\
+	ARCH_FORCE_BYTE_ACCESSES(__pptr);					\
 	__pptr->x =3D (val);							\
 } while (0)


--------------404C2534A1D1F3DF5C714E70--
