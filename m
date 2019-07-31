Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D72397C555
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 16:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387843AbfGaOtq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 10:49:46 -0400
Received: from mout.gmx.net ([212.227.17.20]:46307 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387593AbfGaOtq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 10:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564584581;
        bh=c7FRCOGcyydHMCQgEAYk4v4z9NGeHl3QVRadCIKEevY=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=SEXlw+1wIRdNW6nnvC4cY5AgHIOw4PYiWEV+I5t7KlJQapibfjN5uRRyKQYSFFjcW
         AvbPDRGo5xM4eS62zBKXBrNRStkUrkw6b9T/XGWhFFOhAHdwnuKGvO78bCj5k2LAzW
         sb+A12cbVH5ZQ94XNu0dKR0NZsHtLlZ9LPcBwkHY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.88.166.185] ([193.16.224.9]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LaXmV-1ieEN02J1r-00mJ55; Wed, 31
 Jul 2019 16:49:41 +0200
Subject: Re: Do NOT upgrade to palo v2.10
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <bff56161-3d9c-d4f1-c1cb-fd04de28eb59@gmx.de>
 <1564522225.4300.39.camel@HansenPartnership.com>
 <1564523273.4300.43.camel@HansenPartnership.com>
 <a9b20c26-d334-5626-5c59-8942879e374c@gmx.de>
 <1564584328.3319.5.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <79e734c5-64b8-2a56-28bc-eae50ecf5b43@gmx.de>
Date:   Wed, 31 Jul 2019 16:49:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564584328.3319.5.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RPF9KGNSeqLKfyE5NJlGT/VjxL7vatNVJ/emldTDLpchZPn0B0L
 9AZRbnWh1cWbKN+cqX3GZum1Ex5vIWi3EFwZHn+PquAjUiFJywCwDVfFiV2WlbHPmbdyI7Z
 nq+pwmY5CeAEIjNJfHREeRI+QXw8qpJsePD823is4jqpBiw+KnCAFV7DQwqd4lUaeWT0TGW
 YIbHaM6aIYaipof959kVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:01rPcN8cY0U=:UlTBxJc8NW11uP8zVMPxkB
 rkpjGFqnjd7bxp795NH4cS8iwhLhyNxafvwER+DcITM18pq3dBX53/i5hudOhPyaDa34O3yEm
 PZ+iEqcZmU6+ddN1L7lhvUZR8L0AShYhl/Z7SUlt2bk8NA0AVGJp1sXbQk0Z6DxcyQ3pMcNDb
 JyH3rTr8FULzAkw6pYheO7KGJcLlKGXfwm+IT87/v/K58mBtDc4Fgem5lgFB2Sv0ZKuLQfTTH
 YQ5fnFhc5ohoVXHSUc5yutGLRxQwttFUmwzzxq9qivatVOKprORW9HxcAVMJcMbkRQJEBlza8
 6AY20n0SzwGGpoHRcvKpmY0xsN7+b8i/8nsdTJJ1U5kgZfvpyhLyEyIoCy2AbLh5w1NIWWri9
 cwTS6i4pfDplOOACT06/0jxTpvu2NH7DVyBWSdHelzPKiMuQx6Yf3fIwkHOaAPm9xuR3+64OO
 4rOxvgCS5m1NxDZ1oQSssHVsxbfiYEECGXN35F5Xlb7owtcVe+8QqcLp6t4I6F9F/eCG7A/oF
 ysC7s1Bq2nwAemxyWuNj/PYWXesChPLCQlzW5BpeRwuVX/RM3H8e1daXZF2FnedrsPDWhcJyt
 vi9xuAJz8GJglc0KQwEPYyTfF+cudd2aCHzz2xaynZFlK4PbgA6hRFnhwsAHVvQ9jMWOud4Ly
 47xKxPkJkTSHAzu/8aFU6iEny/NhNXvatfpZRwZYK99Cic6Xluar54eCCKtj5s49j2YmjY0qT
 dx0gWhsMjbA4CjtSkHOGAs7X+t/6TJOL17WB7OTYtD9JFAgtk3sbMC1fZEaq8936gW+KjgPcS
 B6MskNOe3DZytASSzRPal+b+iYvpUObFDOOk/IneAWIFzJhSVo/pqEccqen0bwmn8IfAw4zxk
 CEeUfrFls7jdAWphURZr51KxnK60c1oNSM0c4HsgL0Iz/4anoJfLgScM4PYQmx5OAdLedn/PR
 Vlyg3mDgUem7NTBB1jggiFR5Fw8WKD63wk/rhPGohCCKN/TVQR4XLsJ5sSxbxGTsKuwaLLwFd
 blNiLFWmFIYaHMk5msMV2g4XpZrsRGZOUtYnqkGhz5+5UpXsHh2kbs3vcg8ajT6Yj4p8+aO1K
 gBFMFmMJar0Wx4=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 31.07.19 16:45, James Bottomley wrote:
> On Tue, 2019-07-30 at 23:54 +0200, Helge Deller wrote:
> [...]
>> Thanks for the patch below, I'll test tomorrow...
>
> It passed my test bed.

Very good.

> Just FYI, the code in question is never
> exercised unless you see the message:
>
> load extent tree[%d] block at %d

Actually, fyi, in the patch I committed I hided that message behind a
Debug flag, so normal users would never see that message.

> Somewhere in the boot.  The reason is that if you keep a separate /boot
> partition, the chances are it has very few files, so those files it has
> are very contiguous and ext4 doesn't need to build an extent tree so
> our IPL code handles everything in ext3_extent_leaf_find().  The way to
> build a fragmented /boot is (starting with an empty /boot):
>
> mkdir /boot/tmp
> a=3D0; while dd if=3D/dev/zero of=3D/boot/tmp/block.${a} bs=3D16k count=
=3D1; do a=3D$[$a+1]; done
> a=3D0 while rm /boot/tmp/block.${a}; do a=3D$[$a+2]; done
>
> And then copy the kernels in.

The fixed PALO version 2.11 is now available in the debian repositories.

Helge
