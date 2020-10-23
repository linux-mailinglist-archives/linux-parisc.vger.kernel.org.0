Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A50296B40
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 10:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375955AbgJWIcF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 04:32:05 -0400
Received: from mout.gmx.net ([212.227.17.20]:60499 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S375948AbgJWIcE (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 04:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603441876;
        bh=GJuIfHMWtzCCtbZZjYN6t/cTWMxaXYfbdjeorhWYxk4=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=MVSCTajnbecd9Kgcw28YMWm+esPGFloU1+n3qZszffOKHTWqtZyggquwwAR4Myzx9
         xdrRL0Pa5LzwP0IaFwEIvNos0K5CV0/d4L2puL2fPl4rLjpFZ7JtBENpwOI50F28tl
         X2e8ymDo2NMMmTFwQR6z403kN3QBBR6GCCA9LvDo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.58] ([92.116.145.200]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sHy-1kQuf80gxW-0055DZ; Fri, 23
 Oct 2020 10:31:16 +0200
Subject: Re: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag
 usage
From:   Helge Deller <deller@gmx.de>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Jeroen Roovers <jer@xs4all.nl>, Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org
References: <20200829122017.GA3988@ls3530.fritz.box>
 <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
 <20201022164007.GA10653@ls3530.fritz.box> <5650648.lOV4Wx5bFT@eto.sf-tec.de>
 <05c101c9-c790-68ec-40a6-d248452fe60d@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <15a0414d-9c6d-76ed-becc-f62635763da0@gmx.de>
Date:   Fri, 23 Oct 2020 10:31:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <05c101c9-c790-68ec-40a6-d248452fe60d@gmx.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6vaXWlBSS8rxNkexTlvXg5eh+DaeOKP97tSCkePjkab0t/hKhl/
 KI5JDMAyNELAM0SC6qENpxMQtZ4bVGDVn9Id2s5MNob7cxpq/imlo2c0DFkuyZyHEsLHHd9
 fCmQIKl0Mz1bepJ8cW+8a3T8YhLGxUtidQ5X6qkDg8z9hV4ytSh+ML3pXOMajGSV64uLm9p
 aTxpGtSGa2kZy3M/RsKwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SDpdIxZ4iDA=:54LZpglzfCVMzzyXNBpRIu
 Bapo9DrrTcpez91aLv4oiwAFZjZm6JuknsKxEMRb0HqYAb4s5JRFKaa4qJD+/iw1ffQeNhzyV
 EkDWDXO96Oe0lZJFo5Jc2KSvCKWzOV6iHKeZ7wMWIP7yJfu4FzKpl/YD18t4upNODGR14mO3w
 m+ngFccR1FD7mDDRfTvbHchve7EFF1juaxc9m+e6dHi6mSTMeL0P9dNZWiKRTaY31eJn/u5ej
 YI5e7MZk1OL0iUvsLQH8YwdwY7q1MF6XEYqSFeB1G9nmZKn3vKQ01iXOz4iNBSatSO4YXj0g1
 C/lsv/NQ5v9tdmIufjlgn6jPaucJBRHfuyZf6YkVDJ3aXpYbu3E4YRD8Le06WNIl1/qwu3VMM
 yLqJS9ZwlwoutRJ+aX0WlyV+a6E5HZ5HUSUc1cu6kw73uqWExb/sHPFx4dAw3xvzDaaBIwj9q
 8U4l3PjWDe6K9H6qWmAa2pCS0snUXC4W9wzjyet1aX/SPID4ksQhTFGfP8skBJ1urFhzhPL6d
 JBqPXQYWCfYuTG1q5BbO1hncHwTxzcYo+JCDNWDC5KXt6bxRad9uLS6TBWoktY7FcRhJzo02B
 U4s8BD774UHzkG0Z4o0DeSpLPuvGQVwIYb0yhzN0yyjDRIs/ZEG2TbkfiyzEWsdJkp52HO0mz
 jGKGsJ51c0MfrNEhoPVH3tPjDtFk6wQ1gOWkissxnUM6geXeL4O/lxbU4dA6lmo/HD5x0fknW
 uCDIbPGVIHnJiJVj+cJjn5BZbY4hT6qtTPJ2Drx7P8u32PQGGhJKtOcajh7T5e5wyobnF3IzS
 FvRNmiKZYMwOw+Row/0/4Gg4x6HBF2UUaLmOrWizywkb2vXPZxw+VG35kMri3puskhLtyMqzz
 fGSetoRnk0p+sTsNe/mQ==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/23/20 10:18 AM, Helge Deller wrote:
> On 10/23/20 9:25 AM, Rolf Eike Beer wrote:
>>> +#define O_NONBLOCK_OLD		000200004
>>> +#define O_NONBLOCK_MASK_OUT	(O_NONBLOCK_OLD & ~O_NONBLOCK)
>>> +static int FIX_O_NONBLOCK(int flags)
>>> +{
>>> +	if (flags & O_NONBLOCK_MASK_OUT) {
>>> +		struct task_struct *tsk =3D current;
>>> +		pr_warn("%s(%d) uses old O_NONBLOCK value. "
>>> +			"Please recompile the application.\n",
>>> +			tsk->comm, tsk->pid);
>>> +	}
>>> +	return flags & ~O_NONBLOCK_MASK_OUT;
>>> +}
>>
>> This will also trigger if I just pass 0x4 in flags, no? The check shoul=
d be
>>
>> 	if ((flags & O_NONBLOCK_OLD) =3D=3D O_NONBLOCK_OLD)
>
> RIGHT!
> That's a very good point.
> I was thinking about what would happen if over time a new (unrelated) de=
fine
> gets created which then gets 0x4 as value. My code would then have wrong=
ly
> modified it.

After some more thinking....

It's not that easy.
Let's assume there will be another new flag at some time with value 0x4.
Now, the caller sets this flag (0x4) and new O_NONBLOCK (000200000),
so you end up with 000200004 again, which then triggers your check:
 	if ((flags & O_NONBLOCK_OLD) =3D=3D O_NONBLOCK_OLD)

So, my check to test only the mask for 0x4 was basically better,
because it would prevent the usage of 0x4 as any new value.
In any way, it seems we need to avoid using 0x4 for a long time...

Helge
