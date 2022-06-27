Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA49E55B48F
	for <lists+linux-parisc@lfdr.de>; Mon, 27 Jun 2022 02:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiF0AJD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 26 Jun 2022 20:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiF0AJC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 26 Jun 2022 20:09:02 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A282A0
        for <linux-parisc@vger.kernel.org>; Sun, 26 Jun 2022 17:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656288536;
        bh=3yJ1i/LIZde0U/okUTURqyrBU7TCWRhlgFb31aajWbQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=NpaunRlR1L4ei+zhnMfVAFgkC7ujkyZbSus9N8GtQMPZQiNI0H4Ro7wsAAQ4QWgxy
         VxLcuWj5ocMKbfdioCuWepwGf7NkjQl8pzwMu1G4iD36Pf9TlPGuIKukKCvdxrurRy
         cuutcciDCyYwT99wAV1Dan6x3ibujyoWHOsEwWsQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.135.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MORAU-1oIBdu0wd4-00PtrP; Mon, 27
 Jun 2022 02:08:56 +0200
Message-ID: <faea80e5-de8f-f1ca-1412-43f513b3b45c@gmx.de>
Date:   Mon, 27 Jun 2022 02:08:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: linux v5.18.3 fails to boot
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        Kuniyuki Iwashima <kuniyu@amazon.com>
Cc:     kuniyu@amazon.co.jp, linux-parisc@vger.kernel.org
References: <07d91863-dacc-a503-aa2b-05c3b92a1e39@bell.net>
 <20220610160624.95035-1-kuniyu@amazon.com>
 <7beb6e90-4532-cba2-8121-4cfc413f4d3f@bell.net>
 <76323d1a-114b-2cf7-2f4a-05612b28c9e2@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <76323d1a-114b-2cf7-2f4a-05612b28c9e2@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G9ca4IrIbrFsWpl6QnyNTomJTz07EPyOGjnW5Z3cthjdbN6HrhJ
 g2Ae7fsAiopK8oGJ62Tms9zwA3rd14zVXv41+mi6N/AqNW1IKYS1JvN74Vx9WXAZYDJsyTF
 z/mU6Ln9MWgvDtiefl58x/rO5cq8Gmhb2mB8pn5/FI+Z9h5XfueszJU2q9YzZom3VOxUpzm
 T7VwORsN8o52QuQhnxMKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:10Iq3SlamkA=:60Ogu/NdzmSUYTj7tKkRuc
 Uc1U6ppGYJLkHJcKis5qoVNczQjtajm7O0GUQrWJBPhrT3RTA10ilQ7xkUAy+w6ZbD7WOtFLY
 uSVuWyofaUbtaqL0tQktr+4fiDS5cK8fnwHWai8cJvXDouHWnn3+fQ2XI/hO+AqiHwUtkW/m8
 XNQ981ssYqb0rRvSeg0L5Q9oDmEJvtmv0N9XoVyRkMpX9Uw3dR7c9lmUqQ9DSYYlXTQNd5i3E
 p5aiASATkG08Qo9QVU1cRMLkgxQ+7CzR+MAPIjwWR1mJB5BsiLoamd/fxpoidpO2BcOjvsI4N
 0BJVm7/Uf9AghkcABuPtqc3z7E/5eJ+8uIRjahYIiYlSfibRXqkbwe9QyVIVlRV/G0+6sE5oc
 /BOf6u8YN5npf7xNNlKQ7HsPzGRb0pe5UPBnNc5SJ297XJJvRbOdtfh1Bw9HNeD8IA7UyRPWD
 JwrxvGxMoOMYp99Liqck6S0TUPA/g6mDMf8txb9qYJsDHINC8+gUuWX/siJoUG5mCN30Tb/IP
 iVXALfdIT06mMv+hSmxoJ/xLjoHBt5Oze3JY5xsYQvU5njug6fivvLQZ2TwEewTosLNxdFsRI
 1dMGcYRwbHVqNlXzc+8IU5PqkBchXtjc/XwqYM62DheAp9KshiLkpp40R4sm9W3tYWSDduIpO
 t7w+vOpR1e0xBJMdjgLrO7L/LFulA7IBSghp+57lHWGL0ph1jXdK9h5S0RTfgnY8dCggLpNpd
 CUEMQOhPd+mYYVsEnuF6OfUJ5454qasftQnkDeNu5BKqh5WFJ7sN12T4wnmrzisqyR32DTl6K
 0XSrEf14SHhQk/A5qcY7RmxS2HtIZaCp8li0jYk00DPBACLb7yu9dESgNX44aszeb/a+yPItt
 5OKaKm+bo5YHx3goGFT+TpEnLUDEyO/+PAERs+kt0MiCF3o3gDZTnfVr+/LAsHVVL8DNteaax
 K5fDwNEIOPKGvXArEG9aeiRpKI4+kLZi46DSVniVQZDPGbn5tZov5EU0EOeSU2X4L1WV0zprr
 bQzdGblhjCZArL/Lbhz4IkMfRao63GjI2pmiYXF2zFY8XxcA04kmsBclPDLwSMi0GXnS7GIrt
 7xEssOrl8ZIqqZdbN0UO32inH4Z/EK8NB8t6uS0xc7XluZLs5HUyNcc2w==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 6/10/22 20:18, John David Anglin wrote:
> On 2022-06-10 12:49 p.m., John David Anglin wrote:
>>> The=C2=A0commit=C2=A0was=C2=A0added=C2=A0to=C2=A0prevent=C2=A0compiler=
=C2=A0optimisation=C2=A0from=C2=A0splitting
>>> read/write=C2=A0operations.=C2=A0=C2=A0I=C2=A0think=C2=A0it=C2=A0can=
=C2=A0lead=C2=A0in=C2=A0a=C2=A0change=C2=A0in=C2=A0opcodes=C2=A0but
>>> must=C2=A0be=C2=A0safe.=C2=A0=C2=A0So=C2=A0I'm=C2=A0not=C2=A0sure=C2=
=A0why=C2=A0the=C2=A0commit=C2=A0causes=C2=A0boot=C2=A0failure=C2=A0for=C2=
=A0now.
>> Neither=C2=A0am=C2=A0I.
>>>
>>> I'm=C2=A0not=C2=A0familiar=C2=A0with=C2=A0PARISC=C2=A0and=C2=A0this=C2=
=A0may=C2=A0be=C2=A0a=C2=A0stupid=C2=A0question=C2=A0though,
>>> what=C2=A0does=C2=A0`ldd`=C2=A0exactly=C2=A0do?=C2=A0and=C2=A0which=C2=
=A0line=C2=A0is=C2=A0it=C2=A0executed=C2=A0in=C2=A0the=C2=A0func/file?
>> ldd=C2=A0performs=C2=A0a=C2=A064-bit=C2=A0load=C2=A0to=C2=A0register=C2=
=A0rp=C2=A0(r2).=C2=A0=C2=A0It=C2=A0is=C2=A0part=C2=A0of=C2=A0mpt_reply's=
=C2=A0epilogue.
>> The=C2=A0prior=C2=A0"sync"=C2=A0instruction=C2=A0corresponds=C2=A0to=C2=
=A0the=C2=A0"mb()"=C2=A0at=C2=A0the=C2=A0end=C2=A0of=C2=A0mpt_reply.
>>
>
> Possibly, this might affect Fusion MPT base driver but no patches are ap=
plied:
>
> [=C2=A0=C2=A0 29.971295] mptbase alternatives: applied 0 out of 3 patche=
s
> [=C2=A0=C2=A0 29.971295] Fusion MPT base driver 3.04.20
> [=C2=A0=C2=A0 29.971295] Copyright (c) 1999-2008 LSI Corporation
> [=C2=A0=C2=A0 29.971295] Fusion MPT SPI Host driver 3.04.20

To sum it up - this issue war triggered by a few special situations:

The kernel patching code uses the altinstructions table from kernel module=
s to patch
in alternative assembly instructions.
To read the entries it uses a 32-bit ldw() instruction since the table hol=
ds 32-bit values.
Because of another issue this table was located at unaligned memory addres=
ses.
That's why then the kernel ldw() emulation jumped in and read the content.
Commit e8aa7b17fe41 ("parisc/unaligned: Rewrite inline assembly of emulate=
_ldw()")
broke the ldw() emulation and as such invalid 32-bit values were read back=
.
This then triggered random memory corruption, because the kernel then patc=
hed addresses which it shouldn't.

I just sent a patch to the parisc mailing list to fix up the ldw() handler=
, which
finally fixed this issue here too.

Everyone who runs kernel v5.18+ on parisc should better apply the patch I =
sent:
https://patchwork.kernel.org/project/linux-parisc/patch/20220626233911.102=
3515-1-deller@gmx.de/

Helge
