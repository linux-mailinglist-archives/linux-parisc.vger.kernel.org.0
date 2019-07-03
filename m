Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1F45EB03
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Jul 2019 19:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfGCR7d (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Jul 2019 13:59:33 -0400
Received: from mout.gmx.net ([212.227.17.21]:34847 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfGCR7b (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Jul 2019 13:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562176765;
        bh=ufdAaLTu1TwRLOXrtRJxnakMcLqdLJyMGjdsc83Ijmg=;
        h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
        b=XIoGSRSN2J9IQbDus4WC0vhbdKXoP3a2aRizxbu30akc0WVo5O2dLu4odQo033FL8
         scoHvIHYj2jSBgiTqQIDfic4trHM+UrsGfEyUEemdVBb4cBq6NnStDQubyAPuLFjGd
         ER2YRbpQE0eVA9iII8XHtqPmoPcMVVjQAlMngfQE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.112]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0ME33j-1hkdCU1olT-00HQ4G; Wed, 03
 Jul 2019 19:59:25 +0200
Subject: Re: [PATCH] palo: fix IPL overlap with ext2/ext3 resize_inode
From:   Helge Deller <deller@gmx.de>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <1562131344.29304.100.camel@HansenPartnership.com>
 <67376425-6e29-3b20-a0aa-7fce2c030366@gmx.de>
 <1562164221.3438.3.camel@HansenPartnership.com>
 <38866dd3-665e-b71a-961b-d10859bf61d5@gmx.de>
Message-ID: <271150f3-3509-b657-181a-1d319b44b0f1@gmx.de>
Date:   Wed, 3 Jul 2019 19:59:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <38866dd3-665e-b71a-961b-d10859bf61d5@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g1BMXlkvVhtVPzpllpxcxSlWMrTk33CYOYEi4II1fC1OeWZGTKk
 2Eg2mm4WfyfM1jhzHp6VMgjNE7miLdVs9oFYvdQ+l2a/LUO44419z+C4cxmCVBvruvg2Own
 2g8d8M1QNHIsanmt2qviTyQiIldDe7mLTRdI2T8/KHCvbJu8erLg00mwOZ9lpQtZj1Fy6iH
 tIxozSKDHU/3J+XKkzHCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y/05h/jdP7E=:etUHPFPBlz1Xn4l8dOcHp+
 XW5e7aX7c7IwHu3p7sfR27um8W/fYtphV/Vp7TWv6f8uDbLQyXcm55q3U/QWjNWNG52+x3Pzr
 o6BVSNm+PE49CH9Pdb3fpBJWYCYxFa09TFJFU562rCRjgepGREVo5pXzWfKqg1PtkiDg1coEA
 gtHQHGcX/sgGtzDOpFGSjKw7INH0YLeNIL4toJT4GCjtuOS4nZpwArMw7+Kw6lhJ1vipTTFEu
 EibKbyIFi4bUJfjmkHfnIXgHSq9jmvVzZAMr306qUBuWj6nvtS8v2q5cd7gWqf8y7s104q53N
 38DCGK/4BEo9++1g/l4vkirH0YDY2bt2CaLZmWN9x2dDTj+6WxrtC8dbNm4XUUk6qU0toRIN3
 99BrnIe9V1royWuN/mBBp/W6kUDCPeWq76Lg+Jqh+RNmVObIa0sXmdzK1wAEuuJlfp1Py0bwM
 e1WCuyTVmfVAAtMeAr75Syglvh9SmaKVb/Gpxjp1Dj/pOLacWiMX3rq4MWZ0JPQfXBRS3kGxJ
 SYhhCnpd36IVQpvwBXKwTdy4rOFIfjap80onJlnYjFQhaCON9u3KO+oxKsrS5QfrlpozVDkuS
 2eYmsiLAkWL/M5kIZ5Z+Syk7geXRhZ+eVlivf8imwyy/zWDHZVqAOj8GU8gGgsVIf4CkMHGCD
 G8xZnmnsF2wk6mxT/9XuRx26KhPqHJ7PBWIAS5M6G3PSQA2TtQm15YpkZK/LhkV4afa/8S1Ct
 M7leNTQb3/MgPxglgHY1bG5h3Q8f3BledXbsvoXkTKOudVRuGrnJNY6HBIzllT+FTHYtl821B
 dHTcKmlea4TSe0A7/Ol/gxocSpt66TupIagw795RVLttANwo3RJJ3KIxEIKa751OfXaL6gY+1
 wMXQ1uCJHBLvlbt9vA4/N6nicr/juVs+y/wWQ+sfdNSvtuxlHd7fbiTYIrDEY1BKWIirOgQP1
 Sp93QL9bLMZl6YPQ035RiWAIetvRSEfL32jlw6juHjqSYH6JJ8mcIZyXO0FEF9SFqYg0/s4+h
 7OQzTxM3ybIPGL7yRJiom/QZl/O/qUIUo6c1EV8P0AGxL1QYZHZpsSWWeObCfq9ck5TaTTBdH
 9CgPJVuU2d8g4g=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 03.07.19 16:45, Helge Deller wrote:
> On 03.07.19 16:30, James Bottomley wrote:
>> On Wed, 2019-07-03 at 07:53 +0200, Helge Deller wrote:
>>> On 03.07.19 07:22, James Bottomley wrote:
>>>> palo is producing corrupt filesystems because ext2 can't cope with
>>>> any of the resize_inode, which is traditionally placed at blocks 3-
>>>> 258, being in the badblocks list.=C2=A0 If this happens, mke2fs silen=
tly
>>>> produces a corrupt filesystem image and the palo partition will
>>>> eventually trigger a filesystem error.=C2=A0 The fix is to force palo=
 to
>>>> specify -O^resize_inode to mke2fs which prevents ext2/3 from
>>>> allocating a resize_inode (and thus prevents the filesystem from
>>>> being
>>>> resized).
>>>>
>>>> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.c
>>>> om>
>>>> ---
>>>> =C2=A0=C2=A0 palo/palo.c | 8 ++++++--
>>>> =C2=A0=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/palo/palo.c b/palo/palo.c
>>>> index 68b85cf..e088993 100644
>>>> --- a/palo/palo.c
>>>> +++ b/palo/palo.c
>>>> @@ -443,7 +443,11 @@ do_cdrom(int media, int kernel32, int
>>>> kernel64,
>>>> =C2=A0=C2=A0 #define EXT2_HOLE=C2=A0=C2=A0=C2=A0 ((MAXBLSIZE + 1) / E=
XT2_BLOCKSIZE)
>>>>
>>>> =C2=A0=C2=A0 /* offset in bytes before start of hole,=C2=A0 ext2 does=
n't allow
>>>> holes at
>>>> - * to cover the first four blocks of the filesystem */
>>>> + * to cover the first four blocks of the filesystem
>>>> + *
>>>> + * Note: modern ext2/3 has a resize_inode covering blocks 3-258 so
>>>> you
>>>> + * must either always include the -O^resize_inode when creating
>>>> the
>>>> + * filesystem or define EXT2_OFFSET to (259*EXT2_BLOCKSIZE)*/
>>>> =C2=A0=C2=A0 #define EXT2_OFFSET=C2=A0=C2=A0=C2=A0 (4*EXT2_BLOCKSIZE)
>>>>
>>>> =C2=A0=C2=A0 int
>>>> @@ -502,7 +506,7 @@ do_formatted(int init, int media, const char
>>>> *medianame, int partition,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>
>>>> -=C2=A0=C2=A0=C2=A0 sprintf(cmd, "mke2fs %s -b %d -l %s %s", do_forma=
t =3D=3D 3 ?
>>>> "-j" : "",
>>>> +=C2=A0=C2=A0=C2=A0 sprintf(cmd, "mke2fs %s -O^resize_inode -b %d -l =
%s %s",
>>>> do_format =3D=3D 3 ? "-j" : "",

Now included in the palo v2.01 release...

Helge
