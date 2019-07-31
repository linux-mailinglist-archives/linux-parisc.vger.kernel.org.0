Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8B17D03C
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 23:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbfGaVpE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 17:45:04 -0400
Received: from mout.gmx.net ([212.227.15.18]:56493 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727865AbfGaVpE (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 17:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564609495;
        bh=k/L2B9XZWGOeGCdl7IR2u3v0tS0EKKPALzvRyBSTcfU=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Swbzs7dom2pa1ZZ3yq9+XZdtoufKKt3NJ4EtTQk4AEwBXzC3SxYmfilv9juxUPHCC
         E11MwUadIR7dGABlXBzsqFtV++lWRlV94O6VHi1JmpXsgeiV6K9WfZtdr3WZYabNgj
         pUK4TnBr5rNEVNs4glFbMYYo5TRQNL9lWg36SuSs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.24]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MUHoI-1hjgzV1ILC-00Qy9e; Wed, 31
 Jul 2019 23:44:55 +0200
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
 <2fc63e1d-dbcf-924b-e134-e5c2dcc75260@gmx.de>
 <1564606179.3319.70.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <8b4dc77f-27a0-bbce-8fdf-0c631e0bfd16@gmx.de>
Date:   Wed, 31 Jul 2019 23:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564606179.3319.70.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EunU2xstTWZzToutEx7YQ9Sn0HgIwsp2ivK8RFMz6sYN7GO20vv
 MHCH16kyyxs/DDg3SuFxNfRWiX6wxFX7epHVElxHzn6xPaA5U8ziKfxz7iRweinIE1XPpDz
 FtKlKk6a1gYeKfLbibcmsy16lw3KIEvZWFFwsZvG8FDZXXUxWcrUFrk3XjfQTwrr/uHbW1k
 SNnoFPSCr720YjU7xCEIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yoF3VWF8qxY=:0D3GPrVNGKGrs+S2fIvTVV
 nTMSIZ/hcYEzsaw9sR5kQSRij5jpTmpSUU25Giv3zEij/FEsS1/FtubpLKrSSO5/Ll1sp/CLU
 92cfJlKi+VofPSHLHbTPFuGGL9N7K0qfVc4MlYNztaACYhnsBhrMCBIxXLLi4EW4KuwYi0TgL
 1H7rxiANaHqyUdcAW2ESDInRIt8PAZ5Yc1erZL4notSGEA2JNn8FVf8z1qRjGmqbXB0zQNnF/
 kccdxOvwRfftNlqHqr7taWGyaxY3aofS7zo3R4ny4yG+d1n5GtQLg+KXBgDTQWI6gcB6K842q
 bmbuUdy7Yr4CGHs0grTdCrc2O95DEvnYH5xrpm16Wtpu6J6q2qDF06H7IYnjlkoLbCi4nidzp
 oJgcR5tDhY0y/MmHKrG857KY5h+/XXedufe+Qsn7Y0f8EeTj1jnUXBUscYXpncpb7a9PbqI38
 RRwyApDj90ghcKahe4lQSeOoGOoCT08aGr/veLuE8g9VHDqrHbiVxEmRO0UNVoIZDKsEhd4bP
 iig6/E41b5rTNdUBa5tdXNlUhfGnQ+jo0FeGITRj8Oa/xCUX6+zMys6G8YJL7y/aRcPRH667O
 DPYivwGJLtJF9/B+iESxwCUj1BTaUT+U5AmOS2zgQ0xpA/EnP23M63/rLqOItKErnxp0FjCb+
 DRaUgjDnGlVszCfeBS9ugDx9n1zixvLuK8Jo/7QHgCCZYb/N0ZZkGWR1Pz+XpQU89hWVIn9XL
 YVdE1v9gfhPK9zkLQW4Xob8rnvvLD+S/g5f7PN0/eUm9JO8UOn+91sXlTcG3CBFrrDk+F+TYI
 g85RKEYk+ZGWYqvOFZ91fCxyBUngLo0+VvMsQrMW7VK3DzLsAMy+jkfLXn0KQBizC9z0QQO99
 imask7KTJvrWVgEfWZtvFMEe6oooIdx0/dJnLdmKxWxVi37NH168xn2bYNAJrpuBaOjOzPFdC
 dwu422CTX8rubjLV3uZbu0IpU4Bjj1osEmyFsvn0aAcNgJubMrANJOidn33zgg4rGZazivzJf
 0tkNn+T9gZ/NpyF7ZV0ilrQkO0Pz+vFCtXdqEaFsasR4Vk9B6lvYippAsrqOpO3NdplglzAH2
 KiuhGvZvVkB8kI=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 31.07.19 22:49, James Bottomley wrote:
> On Wed, 2019-07-31 at 22:19 +0200, Helge Deller wrote:
>> On 31.07.19 21:56, James Bottomley wrote:
>>> On Wed, 2019-07-31 at 21:46 +0200, Helge Deller wrote:
>>>> On 31.07.19 21:44, Sven Schnelle wrote:
>>>>> Hi James,
>>>>>
>>>>> On Wed, Jul 31, 2019 at 12:40:12PM -0700, James Bottomley
>>>>> wrote:
>>>>>
>>>>>> What about causing the compressed make to build both a
>>>>>> stripped and a non-stripped bzImage (say sbzImage and
>>>>>> bzImage).  That way you always have the stripped one
>>>>>> available for small size things like boot from tape or
>>>>>> DVD?  but in the usual case we use the bzImage with full
>>>>>> contents.
>>>>>
>>>>> In that case we would also need to build two lifimages - how
>>>>> about adding a config option option? Something like "Strip
>>>>> debug information from compressed kernel images"?
>>>>
>>>> I agree, two lifimages don't make sense. Only one vmlinuz gets
>>>> installed. Instead of the config option, I tink my latest patch
>>>> is better.
>>>
>>> It doesn't solve the problem that if a stripped compressed image is
>>>>
>>> 128kb then it overwrites the decompress area starting at 0x00100000
>>> so we can't decompress the end because we've already overwritten it
>>> before the decompressor gets to it.
>>
>> I don't get this point.
>>    hppa64-linux-gnu-objdump -h vmlinuz
>> shows:
>> Sections:
>> Idx Name          Size      VMA               LMA               File
>> off  Algn
>>     0
>> .head.text    00000084  00000000000e0000  00000000000e0000  00001000
>>   2**2
>>                     CONTENTS, ALLOC, LOAD, READONLY, CODE
>>     1
>> .opd          00000340  00000000000e0090  00000000000e0090  00001090
>>   2**3
>>                     CONTENTS, ALLOC, LOAD, DATA
>>     2
>> .dlt          00000160  00000000000e03d0  00000000000e03d0  000013d0
>>   2**3
>>                     CONTENTS, ALLOC, LOAD, DATA
>>     3 .rodata.compressed
>> 01f3c2b0  00000000000e0530  00000000000e0530  00001530  2**0
>>                     CONTENTS, ALLOC, LOAD, DATA
>>     4
>> .text         00005cc0  000000000201d000  000000000201d000  01f3e000
>>   2**7
>>                     CONTENTS, ALLOC, LOAD, READONLY, CODE
>>     5
>> .data         00000060  0000000002022cc0  0000000002022cc0  01f43cc0
>>   2**3
>>                     CONTENTS, ALLOC, LOAD, DATA
>>
>> Only .head.text gets loaded at e0000, and it is basically just a few
>> bytes which sets-up registers and jump to .text segment (at 0201d000
>> in this case).
>
> Actually, you're looking at the wrong thing, you want to look at the
> program header (the segments) not the section header.  It's the program
> header we load.  If I extract this from the current debian kernel we
> get
>
> jejb@ion:~/git/linux-build/arch/parisc/boot/compressed> readelf -l /boot=
/vmlinuz-4.19.0-5-parisc64-smp
>
> Elf file type is EXEC (Executable file)
> Entry point 0xe0000
> There are 4 program headers, starting at offset 64
>
> Program Headers:
>    Type           Offset             VirtAddr           PhysAddr
>                   FileSiz            MemSiz              Flags  Align
>    PHDR           0x0000000000000040 0x0000000000001040 0x00000000000000=
00
>                   0x00000000000000e0 0x00000000000000e0  R E    0x8
>    LOAD           0x0000000000001000 0x00000000000e0000 0x00000000000e00=
00
>                   0x00000000000004d8 0x00000000000004d8  RWE    0x1000
>    LOAD           0x0000000000002000 0x0000000001400000 0x00000000014000=
00
>                   0x00000000003dd46c 0x00000000003e1000  RWE    0x1000
>    GNU_STACK      0x0000000000000000 0x0000000000000000 0x00000000000000=
00
>                   0x0000000000000000 0x0000000000000000  RWE    0x10
>
>   Section to Segment mapping:
>    Segment Sections...
>     00
>     01     .head.text .opd .dlt
>     02     .text .data .rodata .eh_frame .bss
>     03
>
> The two LOAD sections corresponding to what PALO actually loads. The
> problem happens if the length of the first load section is bigger than
> 0x20000.

What exactly is the problem if the first section is bigger than 0x20000?

> Now if you look what happens after your change:
> jejb@ion:~/git/linux-build/build/parisc64/arch/parisc/boot> readelf -l b=
zImage

Ok - bzImage is the same as ./vmlinuz.

> Elf file type is EXEC (Executable file)
> Entry point 0xe0000
> There are 4 program headers, starting at offset 64
>
> Program Headers:
>    Type           Offset             VirtAddr           PhysAddr
>                   FileSiz            MemSiz              Flags  Align
>    PHDR           0x0000000000000040 0x0000000000001040 0x00000000000000=
00
>                   0x00000000000000e0 0x00000000000000e0  R E    0x8
>    LOAD           0x0000000000001000 0x00000000000e0000 0x00000000000e00=
00
>                   0x00000000004ae760 0x00000000004ae760  RWE    0x1000
>    LOAD           0x00000000004b0000 0x000000000118a000 0x000000000118a0=
00
>                   0x0000000000006044 0x000000000000a000  RWE    0x1000
>    GNU_STACK  0    0x0000000000000000 0x0000000000000000 0x0000000000000=
000
>                   0x0000000000000000 0x0000000000000000  RWE    0x10
>
>   Section to Segment mapping:
>    Segment Sections...
>     00
>     01     .head.text .opd .dlt .rodata.compressed
>     02     .text .data .rodata .eh_frame .bss
>     03
>
> So the first section tries to load between 0x000e0000-0x0058e760 and
> that's overwritten at 0x00100000 when the decompression starts because
> 0x00100000 is our KERNEL_BINARY_TEXT_START.

The decompression decompresses the image from .rodata.compressed
to an area behind .bss.
So, "vmlinux" ends up behind .bss for further processing.
This "vmlinux" (which can have multiple ELF sections) is then started at t=
he high address.
That address is way above the 0x00100000 or KERNEL_BINARY_TEXT_START.
It then finally moves itself (the ELF sections) to 0x00100000.

> The result for me is that
> I get the Decompressing linux ... message followed by a HPMC.

It actually does boot for me and Sven without a HPMC.
The decompression is slow (~40 seconds on my c3000 for 160MB).
I still *believe* you are facing a HPMC because of other reasons.
On which machine do you start.
How much memory?

Helge
