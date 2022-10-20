Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0FE6069C5
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Oct 2022 22:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiJTUpA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Oct 2022 16:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbiJTUol (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Oct 2022 16:44:41 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6798C64EB
        for <linux-parisc@vger.kernel.org>; Thu, 20 Oct 2022 13:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666298612;
        bh=xsDqx+Qa9VKiVikoFrT93nSEoLijA4SXTiwiadxNVtk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=UoIapG/pqka65sRvJQwIE+s9/if8zoOTu+BOAJQNV8ZJAkAvn2ekMDKM7LGkpQz9M
         zKLSMMz9ZAHdlh3tJ27a8iWWBuGhD9LHTMQg5jOk4bKHSz50//1IUpJmkSYq4qzAaK
         6a5KZCMEeFJJDZ5+5Gq2ZnJMWLFobukjTRV4JZ4Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.193]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWih0-1oae0C2Mbw-00X4G0; Thu, 20
 Oct 2022 22:43:32 +0200
Message-ID: <fe739cd9-509b-13ec-fe9d-810a226ae316@gmx.de>
Date:   Thu, 20 Oct 2022 22:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: the patch "Convert PDC console to an early console" breaks the^M
 console
Content-Language: en-US
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
References: <1MhlGq-1pGSQJ2Koq-00dm3N@mail.gmx.net>
 <alpine.LRH.2.21.2210200917320.31339@file01.intranet.prod.int.rdu2.redhat.com>
 <430864f0-da89-cc2b-e357-d7aaf41f31fa@gmx.de>
 <4011ff49-294a-aa08-e087-d60995649e00@gmx.de>
 <alpine.LRH.2.21.2210201552400.9506@file01.intranet.prod.int.rdu2.redhat.com>
 <fe983997-22c9-a58b-136c-15e2303350d8@gmx.de>
 <alpine.LRH.2.21.2210201626280.28324@file01.intranet.prod.int.rdu2.redhat.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <alpine.LRH.2.21.2210201626280.28324@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yQbF58aRKSquEMh44YiPgLbUocd6Q02LSlT7HFizM6/MvdNRMw5
 zfzqWMssfqtPa+KUatYGdRXJk2xsNmLIWTwmKpV+hWMvkGB7xQg7f3esGRt5ZkF3Nkzulrp
 5zvk5yqScAT5EtKMKI+4YzIiGu1eyX/e897ZMiT1LqpuRs1F6ZkfOpa5kHLl+WgZIoPCDCE
 I0UvoMGQM29nwFsm46Hng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cGrnuEiXPQk=:fJae2+oZ8WR01KpTc6yFXW
 RAPHf3jS/kkIwPPHfy2E90qesqsClYgf4ss9JK64HENTkGljeGrL6Ykr7o3SpGHKA9y88Tjt9
 zrZINkAFY/qo5V8PCHe1rgZu9MmWsaK4QkDKjsVVt02+w9BNHsqzjDNT/ngwWwu6uCMw+2vAT
 9kG1njppgKodil7LboWImOPqc19L3Q058D8+8c0M6PhpyGo8sZrQ6i7t4/duhBYns67WqcWjP
 oX04OElGV3N+SVz4jiJH7LWY030XeGhnNyrs56tp3AyclpjEGOnFoYcsn5DatRanwGwExJcOX
 804hLH0MxmYoEnDpDdqbtgGcFTnE2bvtesVUhowHXxG0vXQEMd9M/SeIzE82fHeI9ADPY3DD5
 guPo0PfmG41QgR6jaeQQnhct3ayG4FgN8UXs/7/zMEGaayakqL9VCMvNLbagO4eokZ6yvVM7k
 Faus0WYOZbQd5eAsPsyGCE4DbwP2n6M60JdGOQf0KlXVYH/bVEAF7kZyYQ+KMH/zQJCSwlzb4
 F3L2C5TIiQt7Dh25i1UwEFhgk1qAH0WzDaCOPI2ZIQGe6rMt/BbtaAubsG5EvZIRt+wT5+SRa
 eatdpHBeZrTafRE9VURuVAsydLcobawpglJNkxEi1AcAruxdGLOt7X+/nUWN/5M1zadCFEl6d
 hn7QXz+Q+WfbB6FPoMURJljuLJYq9z4W6zrzuGiKfUZNyInsXB55JAz0xMMy4kN7bqagOXn9B
 FTJ7d9noVpxMsLiRGrzippqtUH7HEm/nlzp5Xp+q9dvrbBHQnMk9UIRqQEkGo/Dy3hueISJFW
 av+nqNV0lGeDXw8jEdX6ahMkQbSceopx3WXuaUHY4iPe+v3JN7+v4sjUxLxfEn8tePlgB4LmE
 0dbhsJSCXi+S/3ssrZxyu+L/TXnBwiNT9TIWgpXDlwosvi/qSYMPLmnTzC4mOM5xZOE8tHFS8
 ypektrxbPPoUfaojz45yxeTxzoKSWFe+ze1etIBma3kDHukz/TGkoTcV2fqdFAVKaRPTGhR+O
 Kz7TE0/jXvZjLzpGJEFAM0APlk7kKThv5ZCz5CYEHscyyijbWMqDlZmEAkuJh3igHhHMzAwMS
 lB2xyWGAN+JT/5YmGj44XgtNi0Rn5JQ6A6DLXl8keQf8hL/AlK2qFkl9G4qdwy2j89JS+QpE6
 NoRYkofP7ZIgIG1123uIFvrCrhCtobl9BV0BtHtpVH8upOV7o0UUWTkY4UEnY2sFJpq1D7UZa
 gEK89+l9v+pG+VA2xQyo0XpWYWQpXBtTKy4jxLUymTvHfPC4AXv68z5nSaj2g1RglKVtBjFHq
 4F6K5ci+pIouKrAtQ7sP9ScyYxUndpX7kmVsW78k56UUa9l2M7Dm/Fnak9wmCagkV3V7OMuup
 AxALGk8tT3pRYAumFMxyVw2bEY+uh7vX3Qde3u8DqK8+s8R8iA/lcnJ7SXTv/li3zcKz4GMRH
 wrW1U9s0H1GxIGNcL9k2BMd+ZZYC3HPpXCQ/KIMl5drG1q7CKFXKv4RtGB2KuTZxTyXGXhKUw
 xIKU+fKFOtUhhBvJdM3Wwh0Tv17MFujWaPdx0l1S1aWVE
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/20/22 22:34, Mikulas Patocka wrote:
>
>
> On Thu, 20 Oct 2022, Helge Deller wrote:
>
>> On 10/20/22 21:57, Mikulas Patocka wrote:
>>>
>>>
>>> On Thu, 20 Oct 2022, Helge Deller wrote:
>>>
>>>> On 10/20/22 20:01, Helge Deller wrote:
>>>>> On 10/20/22 15:26, Mikulas Patocka wrote:
>>>>>> On Thu, 20 Oct 2022, Helge Deller wrote:
>>>>>>
>>>>>>> Your serial ports don't seem to be detected and thus missing...?!
>>>>>>
>>>>>> It seems to be so. Does it work on your C8000? - if it does, send m=
e
>>>>>> your
>>>>>> config and I'll find the difference.
>>>>
>>>> Works for me on c8k with serial console (parameter console=3DttyS0):
>>>> config attached.
>>>
>>> Thanks. CONFIG_GSC=3Dy fixed it for me.
>>
>> Good.
>>
>>> Maybe you should update the help text for CONFIG_GSC. It says that it =
is
>>> "not found in B1000, C3000, J5000, A500, L1000, N4000 and upwards" - s=
o I
>>> turned it off when making my config.
>>
>> The help text is actually correct.
>> Your C8000 does not has a GSC bus, so why does CONFIG_GSC=3Dn disables =
your
>> serial ports?
>> Needs checking..
>>
>> Helge
>
> There's drivers/tty/serial/8250/Kconfig:
> config SERIAL_8250_GSC
>          tristate
>          depends on SERIAL_8250 && GSC
>          default SERIAL_8250
>
> drivers/tty/serial/8250/Makefile:
> obj-$(CONFIG_SERIAL_8250_GSC)           +=3D 8250_gsc.o
>
> drivers/tty/serial/8250/8250_gsc.c contains this device table:
> static const struct parisc_device_id serial_tbl[] __initconst =3D {
>          { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00075 },
>          { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008c },
>          { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008d },
>          { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x000ad }, <-=
-- this matches the serial port on C8000
>          { 0 }
> };
>
> So, perhaps it should depend on CONFIG_PARISC instead of CONFIG_GSC.

Right, I just came to the same conclusion.
Do you want to post a patch here on the list?

Helge
