Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1172A5C422
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Jul 2019 22:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfGAUFX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 1 Jul 2019 16:05:23 -0400
Received: from mout.gmx.net ([212.227.17.22]:60613 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726664AbfGAUFX (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Jul 2019 16:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562011518;
        bh=xSTYMAPsr2nQrotxbJrYubii4WvDbZCmmcZr4ib42mI=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=gKh+Cxi5hvOKpDfsXcttHM8edvtTCcD2YPc7sR6gCzV8L0hrYjg+KKooq51+YkgmE
         vMoIQcoTtMki6Pl3Tahm9OkUds7XD9iL7lOfj6rDTIG3Zg4hqv2+9orbfyY/mMOLEK
         0kYB6bVJI3p57RNgLZYIqcmyZXqW/zM3sBr5BtEg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.90]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MJWAZ-1hfZRN3BKV-0037cY; Mon, 01
 Jul 2019 22:05:18 +0200
Subject: Re: palo not working on ext2/ext3 partitions
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org
References: <1562010854.2762.8.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <cec14b8a-4230-8320-990c-f4808f0ab9f8@gmx.de>
Date:   Mon, 1 Jul 2019 22:05:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562010854.2762.8.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4g+NLpIKpjrWsn/HxocROpsdSG6CO1hC9RDErDoC65iRcFGcPPv
 /LXJVeckumAR8BX/Q6qt+XpjzGGXgLkf3DiViYItNoHNlLxpqQBHERaAfQ92rHL8XsATvi3
 wqXGC80x3MiSZdD0SxW95oY+gxbzEXdzU/5s/3NpsDcFBTQQ5mHUayg9Dili9QuYiz4i+f6
 XdUuu42ioDLVYO2PZ+Twg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bDl98iGn5Jw=:SRwJOGuliTX0NnStW6tVZY
 aaQuHsPevJ4FfhKNGDGRH5B8gfdkbCMVYfpgjOQAO8atFppeKJkhHqaJqoybdAuXyCMjr+NaE
 OM+7OcGT2zK81JR3xecPzgNx/jqRUok51AP1pRY+XYY5m1oy7BLUVzvEy67429PPwCZM2CeoE
 76K+28XtzqAVUyhglQJfVCUnQCV29H27/0Ymfp0h7MDY63Y42HtpP1fvIbtUqv95xH6H1bslm
 EDrRGSDUUMljqijopcvezxMW6JesjDmUwhMLxMDo4/XjyTgv4JhvvKQZphJMembmR8k1CKGfn
 HiBDc4gk/ar2pEz9v0yOpuzkuQCsFc0EHVQfxbUDl0zVTO2j6B+CvLY1FAb/eomj9AXdvuq+q
 3sA23sPnb9EZVm7v6pwLQm9YqL5CU7pDtNuD3mUjK1sh6nYIox3uF+p9tgRD/6vwAc5giS6wA
 ziuFaXWlZwcvSFw8GCwDGjyFCQHSqvIAgRHoaQAR39fi1VY+md6YXZtud+/4E4vEmR4/Qbq6x
 ieDPZI4O6Vl/jNNMV9EaRjo/4yGucQrqZuMvM0G+8IMD+cyZts8ht50ddZx8lOpcI4OC2Y7wz
 Ma5LPnSykPaQZPWtKNummXsPjq2S3/DyfuALGZ+Y7q6Td6w+LvMifXjnOtLTpMQDuSWMFBb5u
 X4kHcDCtfFLFFuppBU9htE7ExnGizxRcwhq+l0lR2qwz6lMmPSYA7QYH+LBGrjFCqAgLiQYp0
 8FSXh4e5e5CzIOfVsRBxxYcXqLQLmn+6fAabhHVJJg9Ly65a+S5+XmQtGFepA9J9qCAWzGbuB
 meBNMADGdnIoIsV+X92zpiOZntV6WsYpJFM8oAJhH4wZ5WW9Cg9o4jft3jFNxZLdlUJefGCiP
 RxP9hEKJ0svhb9aZ/Tl6a1Y+nfE6p9CdxZ6MKN81SsEkAk+n5dDo/5IDk+XmHYz66lSmO6yPg
 b+hQ6Ndi240+e0jLA9ncdP1m1bvh2tqPbV4E7572Jey2bEp2JeK41hNoYjcW3LmHLELpINseR
 2ozCDSxla78P6JcahfbL3AmVtHL4IxKD9EZTSwdM4D4seIvS2I6HbAu1J8Dy6Hzq66ZavY5Rp
 WYSrBzYOL8X8zw=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 01.07.19 21:54, James Bottomley wrote:
> I recently had the pleasure of a complete reinstall and found that I
> can't set up palo on the new system (at least not palo that loads from
> an ext2/ext3 filesystem).  The problem doesn't seem to be within palo
> itself, but the fact that mke2fs is no longer working for us.  The
> symptom I see is that after a couple of uses the palo partition
> corrupts itself and then e2fsck destroys the iplboot stored in the
> badblocks list.
>
> The problem seems to be with the badblock list because if I do
>
> palo -I /dev/sdb
>
> Followed by a fsck -f on the palo partition, it finds errors and wants
> to clear the badblock inode.
>
> I can reproduce this simply by doing
>
> dd if=3D/dev/zero of=3Dbbtest.img bs=3D1M count=3D100
> losetup /dev/loop0 bbtest.img
> a=3D237; while [ $a -le 450 ]; do echo $a >> bblist.txt; a=3D$[$a+1]; do=
ne
> mke2fs -b 1024 -l /home/jejb/bblist.txt  /dev/loop0
> e2fsck -f /dev/loop0
>
> With no palo involvement, so I don't think it's our fault.
>
> I'll take this to the ext2 tools development list.  Whatever it is
> seems to be really old because I unearthed an mke2fs from 2011 that
> still has the problem.

Thanks for trying to fix it.
I'm not using this boot-from-extfs feature on any of my machines.
All boot from a palo partition, so I agree, that hasn't been tested much.

Helge
