Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621CB5E70A
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Jul 2019 16:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfGCOpn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Jul 2019 10:45:43 -0400
Received: from mout.gmx.net ([212.227.17.21]:46415 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbfGCOpn (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Jul 2019 10:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562165138;
        bh=8WeBJmmEza3jgsAHbI28s2It/QpCHynhoGn1ImsLnbU=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=garzAUfhlOOzfJhbmQLuu8R/PQWoVdRq4jMSRiiqmVNe9NB0oXl/FnwyjQynxpqYX
         BhyrRVFRYJ7TX2bphaqrsm2mK1jC/p+wxIYpAf6G/A/V9s3UDAokz7S9lqjiUk9FKO
         cXE5/T+P3AJ3foKuYh1FCwnsc9UfA4Hqs6OBFlsM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.112]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MfSrf-1huY5x1HTP-00P2Az; Wed, 03
 Jul 2019 16:45:38 +0200
Subject: Re: [PATCH] palo: fix IPL overlap with ext2/ext3 resize_inode
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <1562131344.29304.100.camel@HansenPartnership.com>
 <67376425-6e29-3b20-a0aa-7fce2c030366@gmx.de>
 <1562164221.3438.3.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <38866dd3-665e-b71a-961b-d10859bf61d5@gmx.de>
Date:   Wed, 3 Jul 2019 16:45:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562164221.3438.3.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pN/hDQVDk5GVintSDcu94Ze105f/oKSVtmG3e2j3MwnGG1eR/DY
 jEAYmzx5U0JpH//i7M/ILZn9EjBRfWYmEnxv/b+e1zhYo2naPqv6NAsIVONTAB85pRTk443
 hs17sfz2k33t8bUuvty3bcJ/pjJNMFpxoEIM207rwvZSPHKRTy6Yrx/Kp/mCZ+Hk+WWUrd6
 hDguc6BAS9m3yMfAvFjMw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:knwg5E4oYTk=:PTPMc9J47IPDn/cOI1rq+8
 QYtjSK/UsU1Ap7DcI+2aScej4yQyqpfzth4ItyyTapETKmEKnbQ8soxKnnJyt4P/V407LZGcz
 vANpBBN+Tu+6fC94E3Zq7zgJ4eRw7CAaM+dMC9lPjWmMrHuegCSYCSP77CbX9igNO0497BF/N
 Mj63d/TM8co/tEwvexuDAf0zPr/60HrZpbX4fzC16UmgIgfNSW/WRHVCnvblEJTkUGP86XApj
 iN3zTXk8ryI50ZODzLSCLScPQUhyWWJDGDTWQnZbmewaQ5QMCRXqmqJZLfKlgFKDHOm0TyR6N
 hXnIKzUaSKE7x9PdzzGfEup4RzD1c678YsM60EuRIbabo9kxtZy48ENAESBZ79yXrjTotuCuc
 tw0ZbeJCvy0/P/TPJOG7WFdxMo6obwbziRQ+nASYi+kQsDWLepGZsR6RW/Jp+9VVd9Mx5FXuv
 uo5dA8fx15db6DC0DRB/1ROYqxGpnJp8ht91b9hVpig4JAbhppvAxF+mWhFSFEBL5tD54j7Xe
 zapKVyO6iXh1NruWIuOAykNex06LZFiYLITHvJ0SRzPRnY5wm2EPxkiuhvE2UiblBoO1n/5ls
 LVLynxTjUVNLlB9iMMkf07mGIO2mCCsiMNvyc7swZ2utTCpRu0QzjN8GHJ8Um07kWLyj3L91K
 JDlTXIcb6UMk+Zyi5EcrFV3pLFl9wyghPhJFMUv5RpDf7W+c59wiK9M3V9fW8z5BWm4Z33JYc
 dbNRxrLdg2YK8tS2IdLVK85gGgGsjjH6aqV3SSL4H/YJ/PLSiTh3nVm8/3MSU3p35G0BDKQfG
 loPD0DpljDP+2fiVezSd9pIioX1cXW7GEwu86tSNst2Cl8WgrLf01DN18gR8Pe+6Ldl4nS6d3
 zzSIgbmxQ4t6vdd+4vj9XAAVw205o8CReWj52VjdvOg+TKpqLXnr4Ix7S0otJkbkxq86ZYsji
 uacFsFDGZnkNJBR2pzQv+zmNJYL1q/s31Iew1xH3UCIDmrzDih701fvE1kUsXaJviu/wCabxY
 DGituShSpdMkEcor4orRrhGVFnEYo6TLsDi7/PX9eQmmX5eiY3NpfsgcTx4tAylWfW9oPYua8
 FkvwRan00P1DlE=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 03.07.19 16:30, James Bottomley wrote:
> On Wed, 2019-07-03 at 07:53 +0200, Helge Deller wrote:
>> On 03.07.19 07:22, James Bottomley wrote:
>>> palo is producing corrupt filesystems because ext2 can't cope with
>>> any of the resize_inode, which is traditionally placed at blocks 3-
>>> 258, being in the badblocks list.  If this happens, mke2fs silently
>>> produces a corrupt filesystem image and the palo partition will
>>> eventually trigger a filesystem error.  The fix is to force palo to
>>> specify -O^resize_inode to mke2fs which prevents ext2/3 from
>>> allocating a resize_inode (and thus prevents the filesystem from
>>> being
>>> resized).
>>>
>>> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.c
>>> om>
>>> ---
>>>    palo/palo.c | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/palo/palo.c b/palo/palo.c
>>> index 68b85cf..e088993 100644
>>> --- a/palo/palo.c
>>> +++ b/palo/palo.c
>>> @@ -443,7 +443,11 @@ do_cdrom(int media, int kernel32, int
>>> kernel64,
>>>    #define EXT2_HOLE	((MAXBLSIZE + 1) / EXT2_BLOCKSIZE)
>>>
>>>    /* offset in bytes before start of hole,  ext2 doesn't allow
>>> holes at
>>> - * to cover the first four blocks of the filesystem */
>>> + * to cover the first four blocks of the filesystem
>>> + *
>>> + * Note: modern ext2/3 has a resize_inode covering blocks 3-258 so
>>> you
>>> + * must either always include the -O^resize_inode when creating
>>> the
>>> + * filesystem or define EXT2_OFFSET to (259*EXT2_BLOCKSIZE)*/
>>>    #define EXT2_OFFSET	(4*EXT2_BLOCKSIZE)
>>>
>>>    int
>>> @@ -502,7 +506,7 @@ do_formatted(int init, int media, const char
>>> *medianame, int partition,
>>>    	    }
>>>    	}
>>>
>>> -	sprintf(cmd, "mke2fs %s -b %d -l %s %s", do_format =3D=3D 3 ?
>>> "-j" : "",
>>> +	sprintf(cmd, "mke2fs %s -O^resize_inode -b %d -l %s %s",
>>> do_format =3D=3D 3 ? "-j" : "",
>>
>> What happens if we face an "old" mke2fs binary which doesn't know
>> about this feature and thus fails?
>> I wonder if it makes sense to add a fallback path?
>
> It would fail according to my tests.  It's a bit unlikely that anyone
> who's updating palo is not also updating the rest of their system, and
> even when parisc fell off debian we had a version of mke2fs recent
> enough to understand resize inodes because the feature was introduced
> in 2006.
>
> The other alternative is simply to change EXT2_OFFSET to always not
> clash with the resize inode ... that would work for all cases.

If mke2fs would be too old to know about the resize_inode, I'd expect
it to be able to still handle the old calling syntax (as it did before).
So my inital though would be, that if the call with -O^resize_inode fails,
we simply call the commmand again without that option.

But given that's 16 years ago when it was introduced, I think we should
be fine with your patch as it is. I'll apply it shortly.

Thanks!
Helge
