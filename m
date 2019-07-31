Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5AA7CE10
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 22:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbfGaUTm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 16:19:42 -0400
Received: from mout.gmx.net ([212.227.15.18]:53003 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbfGaUTm (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 16:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564604375;
        bh=8WFkBEXNBWo7/aiR+LXQF60sdU830wqcpMy4CYfAt64=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Yzq3rVugaYUtoJrrhKj4LVRl+2Yd+Qk0jZ+mXg2D+S8y6gsr7YS211bXzjD4WE39C
         kTSRZa81/S1/UL7lnWuvdUV1Kr+ZzgI2EUjRGOeOxsk8cUuwN5PtQAxzNYxiZw46KU
         fEduTvkyh9XdcMB3GieIfaP5+kDX/WMLdDP//n0o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.24]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MF4eJ-1i8Y0431gZ-00GJ3e; Wed, 31
 Jul 2019 22:19:35 +0200
Subject: Re: Compressed kernels currently won't boot
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Sven Schnelle <svens@stackframe.org>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
References: <1564591443.3319.30.camel@HansenPartnership.com>
 <20190731173016.GA23520@t470p.stackframe.org>
 <1564595402.3319.40.camel@HansenPartnership.com>
 <1564602012.3319.45.camel@HansenPartnership.com>
 <20190731194413.GB23520@t470p.stackframe.org>
 <0084df92-ca9f-7600-187d-bc6123f30fd1@gmx.de>
 <1564602968.3319.56.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <2fc63e1d-dbcf-924b-e134-e5c2dcc75260@gmx.de>
Date:   Wed, 31 Jul 2019 22:19:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564602968.3319.56.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+hoHjzD7BejjsjDmGGMIkC7Hdi0gYjkuknOHndANYafMfFcldeC
 BGVorpRIfusE07c5u1i5RZ9VphFzq0+Uj2CoivqJUxlAzXySDkJ7oKtKyGvwGHwGRQblPvC
 RTcRIKgax24dMghFke8QWPxPFBkQ+uzox2xbqlSZAWxb4SsEW0pFuJ+4H6Vn9lG5iWDdBxC
 2Qx5pIKfKi1huS1KzukgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ja9mmUnU6es=:2JK5Gp1yAj76t7NJp7sIux
 P7NpUeBri0+a6jYX1Lv+fYtjMnidIegvv8l0ey+kWW3gsnJy27xOgbhSF6cyrG+HeMBxXg8bM
 hRRjMM8bJoYpgCRn9xE1CcWIA1IECbBgAK+AgtPP1PCiQnyfHmH7lBD8SkKSxlMygZgIl7BTJ
 pmXRgLTp/Pk33uoPK/pokAM+5EAc0xwBGZNSuPz29ZE6mTuHDVz6YD4My9XE+dk8+sE1ZD9Gi
 YWmWKxHY6B3L91RzD/CpCQRAK0DTB3JY8SWLZvQCrZDhwASyUbXfubsaw3tlGlS6ARvZ4Ek3W
 dZ9Bsrv2Hvqg/POgOke6HhwqkfKMwzT1HOlpqmCpONFXzmwRDt4Hf864eIghGTOAC7NVs41hL
 9Hi6PPHEllEpc3RWOVOq6krXEPV15YwzjO644lfNUJyh3qvNUWx7YueYuauBZxI1/ggZARg+L
 cEB5Ojn5u7UyTloJBy3VSnGteHE6s2wMveM2G1R+cdy+oG7ZEEH6tDgXGKJIx8MKW8IDt6M79
 BLdI7dBSAomNXGS6pH4JVrcIHalVVZDknQt8BIavuTlhL9a8ONb0CPt9GrYTmb8ox6gkc+/+Z
 ktcJ4sRKr2TEev+pIr9u7VIyw6u+lw2VS5HgjRb1XST8o6bEVr0IpXyXUvbbYPAoIfcx6dGqI
 0Oc40I2VPWcg5BctfNQD5KYfblIO2bdcagvsVUVw5vzUBpnKtzWHaq7Vb+GMcMkd8YL4aABxT
 A8OqHv5u7XX04WoDFxVcIC4wHlY0lCGuK9IdiCYhag2ic6Hw4GUJq8HQkyXPt+75OM6wJ7aQ2
 FUPQPOdfQcOQdyrwOHOgb1XCATLhg10GcnEjo3WJCw9nQGb+aYgguIpw0mLuRCGqssojzZErT
 xw3nD9XQeDKpsNIH7degOeOLhSpA5XiqU07UZnP4f/3muHwhna5Kdh1GSVAiB27IBUhzie6S8
 9sdQA4u2jMZlH+lgdSgp1L8hWdHvz+59R0mOucDJKtgs5seQFlbYiC3NE/BXWVoRnfvJDuj8L
 3N6wxRRhkWG+SpF5AZOeVVVf4BylNPorQDSS4PIZMauySo2fiYO288ukeLTM6f0mwf6Xa+xBr
 XHmzMhtBwG8VbkeLtcUWDrRgBCFUzQ8hQ2BnpGrFf8CkPwXVjlM6jEERKqDrmhg7+Oa8Ua9G5
 79Al5yLzKtQF6MlvMjso4WANV04xWuT0eIWplBmSQhR2TMKKzs9BD750fpJWwZGG9M0zY=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 31.07.19 21:56, James Bottomley wrote:
> On Wed, 2019-07-31 at 21:46 +0200, Helge Deller wrote:
>> On 31.07.19 21:44, Sven Schnelle wrote:
>>> Hi James,
>>>
>>> On Wed, Jul 31, 2019 at 12:40:12PM -0700, James Bottomley wrote:
>>>
>>>> What about causing the compressed make to build both a stripped
>>>> and a non-stripped bzImage (say sbzImage and bzImage).  That way
>>>> you always have the stripped one available for small size things
>>>> like boot from tape or DVD?  but in the usual case we use the
>>>> bzImage with full contents.
>>>
>>> In that case we would also need to build two lifimages - how about
>>> adding a config option option? Something like "Strip debug
>>> information from compressed kernel images"?
>>
>> I agree, two lifimages don't make sense. Only one vmlinuz gets
>> installed. Instead of the config option, I tink my latest patch is
>> better.
>
> It doesn't solve the problem that if a stripped compressed image is >
> 128kb then it overwrites the decompress area starting at 0x00100000 so
> we can't decompress the end because we've already overwritten it before
> the decompressor gets to it.

I don't get this point.
  hppa64-linux-gnu-objdump -h vmlinuz
shows:
Sections:
Idx Name          Size      VMA               LMA               File off  =
Algn
   0 .head.text    00000084  00000000000e0000  00000000000e0000  00001000 =
 2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
   1 .opd          00000340  00000000000e0090  00000000000e0090  00001090 =
 2**3
                   CONTENTS, ALLOC, LOAD, DATA
   2 .dlt          00000160  00000000000e03d0  00000000000e03d0  000013d0 =
 2**3
                   CONTENTS, ALLOC, LOAD, DATA
   3 .rodata.compressed 01f3c2b0  00000000000e0530  00000000000e0530  0000=
1530  2**0
                   CONTENTS, ALLOC, LOAD, DATA
   4 .text         00005cc0  000000000201d000  000000000201d000  01f3e000 =
 2**7
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
   5 .data         00000060  0000000002022cc0  0000000002022cc0  01f43cc0 =
 2**3
                   CONTENTS, ALLOC, LOAD, DATA

Only .head.text gets loaded at e0000, and it is basically just a few bytes=
 which
sets-up registers and jump to .text segment (at 0201d000 in this case).
See: arch/parisc/boot/compressed/head.S
How should that get bigger than 128KB ?

Then the code in .text decompresses the whole kernel image behind itself
(behind "data").
Then the ELF loader moves the parts from the high-memory to the final
destination (e.g. 1000000).

The steps are:
1. palo loads vmlinuz into memory.
2. vmlinuz' head starts, and decompress_kernel() in arch/parisc/boot/compr=
essed/misc.c
decompresses the vmlinuz file to a vmlinux file and stores it to
vmlinux_addr (which is behind the bss section of the boot decompressor).
3. Then the original kernel entry is started (arch/parisc/kernel/entry.S)
which moves the code to where it belongs and starts the kernel.

Helge

> What we could possibly do is be clever and align the .rodata.compressed
> so its last text byte ends where the uncompressed kernel text would
> end.  We could be even more clever and split .rodata.compressed into a
> load and a noload part so we would only load the part of the compressed
> kernel we need.  Then the lifimage creation scripts could discard the
> noload part containing the debug symbols.
>
> James
>

