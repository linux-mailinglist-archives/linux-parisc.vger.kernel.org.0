Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5D35DDD4
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Jul 2019 07:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfGCFxY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Jul 2019 01:53:24 -0400
Received: from mout.gmx.net ([212.227.17.22]:45369 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725927AbfGCFxY (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Jul 2019 01:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562133196;
        bh=jywyFliSuZBSHgxIJCsZ0h+JX42pPm8lv2oqLbxkV7I=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=knAHRitsJFL5Gb0Q0yrrZ9zYzXeXFBwTKJOT47zi6lDTZwooqrLp2R4BFYNY9fQ4v
         Pm1gj0LB/c/9pQGbaJiNJ1dnwraZ+KPCfukCgcK8extICdIRXuAKW9kRm3M7YMBDYP
         1jEA95a+WbYnxY6TbWeCZR7kW6BBTWRC6qzaP4AQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.112]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpnm-1iKh3G2GR0-00pPIE; Wed, 03
 Jul 2019 07:53:16 +0200
Subject: Re: [PATCH] palo: fix IPL overlap with ext2/ext3 resize_inode
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <1562131344.29304.100.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <67376425-6e29-3b20-a0aa-7fce2c030366@gmx.de>
Date:   Wed, 3 Jul 2019 07:53:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562131344.29304.100.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jzHJ62+ZfpnZpD9/+6zzkKiVjKXjClvXupVjLlp/7Pw3ciJpmLY
 NhzRM9RNC6odGmpA33PM7EP+O+Nvyu3IhOWIxDkRE/cv34cU+WqYnz1QGn+GmSMReL2ab6d
 BvJQ0iYUm1fAjoYTds1IPA4tyUppPH64oYcu64px+tz9ufzCN7wJoGJihT0pfsj1QWhBGKD
 PR5p1uZOdOjlLJFR1eGJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6xLmf1wjxMc=:1lpw4hYOvt8Ds2M3Puf+7T
 53dgmin6tGqxfuZhk3Y+Y09ssUHmALneJRwb7Qzx5k5VIsxQ5d2W+/zBduaXcdfmnrYW4P7ux
 KFKwuXkpB6ApOyRii3jRT0WikBn5mWXW9yWtk3xXkTT9ebWty6e7Hb08PsKY1a1LulojElhyS
 zRs4uh/kGxNxZJfNG45grAITWcTxh+bBJNWdksxFNpz1e0KIQldelFcgMXPZsbLz4Vh17XMsk
 TmHRgkn/jwWSy2igsK+Jcm6vVwMkZtweVWOXVJHDtKavyGl9NojJ+2OWR0jv9bBAHTS+RpYof
 5C+OesUiI0hoBNaS5tjCKSKkWLrjH6Rmxzwdqu2paA468IQCGCK0ksBQISd0+Lk77dPHkL4Kd
 rgvjUWD4zjrMORwxpIAWEd/cAiGwqUEy5HZ0Ax9zfcnhDTKmTP/kBaJu9st9c6QkzhboNEB7w
 uz57siKMaCIzU2A5z5p3v2YbxqRTFzmnCez6BeDj9CYfrOomcPAz3sFMtI2dwE9mkwFQwLw+o
 ARCngCm1q8crve66pkFrSS0etLCZjvZ1tpSsSlcCeW3xk2Ts4eIBTCsR+KSYCgMis2658b3b0
 8QaVyLiKabtuCtVrm+/4L9DCgtSCNjSpX19AEIhE015E8bIt1U+gwbFs/Lfd19HR9n4YG6EkQ
 sxNmmM7mlYZZA28VxRpHDBtn/1F/ANz3f8jb4vwWTcwC2Cu+Ed5389YYcTYyGFRTPmevDv8kT
 K600vkmrHTvf7WuYbRKihkvS4otj2Bpdkh/AdQ+bQDwLjDr7gXTn1wuCAs3pgweVR4+BaEiKa
 Zv6ALdL/5fnVA3FGNzqttZIR0STkcOTqutuWW6gFFycnyTvBoe0g+gBycaMcW9VJkUASMvpVr
 wbApNi8NOVVuL1hlJ5jMr/Y5LT1OKBwBKRTUgGJ5UWDlfX3fODfdKQhqmPxNam/1xsD3BNBi0
 5YhbmzN3yYCoCIcjIV+r/T/sBVNS4d5kMml+0PEGDR4y1gC3y20MEiK6zm+hXmBz+wLmL2iRS
 DtHmjwZnbMmZ8+2o7w/wwVMYhDU1R/ATUAaIE5FiiMhFtOW+uNUvr9sq6G9i5qbtNmbCeo5Sh
 RAwn1Q5pmpGDfs=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 03.07.19 07:22, James Bottomley wrote:
> palo is producing corrupt filesystems because ext2 can't cope with any
> of the resize_inode, which is traditionally placed at blocks 3-258,
> being in the badblocks list.  If this happens, mke2fs silently
> produces a corrupt filesystem image and the palo partition will
> eventually trigger a filesystem error.  The fix is to force palo to
> specify -O^resize_inode to mke2fs which prevents ext2/3 from
> allocating a resize_inode (and thus prevents the filesystem from being
> resized).
>
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> ---
>   palo/palo.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/palo/palo.c b/palo/palo.c
> index 68b85cf..e088993 100644
> --- a/palo/palo.c
> +++ b/palo/palo.c
> @@ -443,7 +443,11 @@ do_cdrom(int media, int kernel32, int kernel64,
>   #define EXT2_HOLE	((MAXBLSIZE + 1) / EXT2_BLOCKSIZE)
>
>   /* offset in bytes before start of hole,  ext2 doesn't allow holes at
> - * to cover the first four blocks of the filesystem */
> + * to cover the first four blocks of the filesystem
> + *
> + * Note: modern ext2/3 has a resize_inode covering blocks 3-258 so you
> + * must either always include the -O^resize_inode when creating the
> + * filesystem or define EXT2_OFFSET to (259*EXT2_BLOCKSIZE)*/
>   #define EXT2_OFFSET	(4*EXT2_BLOCKSIZE)
>
>   int
> @@ -502,7 +506,7 @@ do_formatted(int init, int media, const char *median=
ame, int partition,
>   	    }
>   	}
>
> -	sprintf(cmd, "mke2fs %s -b %d -l %s %s", do_format =3D=3D 3 ? "-j" : "=
",
> +	sprintf(cmd, "mke2fs %s -O^resize_inode -b %d -l %s %s", do_format =3D=
=3D 3 ? "-j" : "",

What happens if we face an "old" mke2fs binary which doesn't know about th=
is feature and thus fails?
I wonder if it makes sense to add a fallback path?

Helge
