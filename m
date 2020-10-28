Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAABA29D9DA
	for <lists+linux-parisc@lfdr.de>; Thu, 29 Oct 2020 00:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389785AbgJ1XE0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 28 Oct 2020 19:04:26 -0400
Received: from mout.gmx.net ([212.227.17.21]:53361 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389929AbgJ1XDt (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Oct 2020 19:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603926223;
        bh=RzrXXl+zln/MpCAkGXL+H+67BNU7ubw+neKkmpPTxVM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Da1Fh54Aui0xuHaTSnjwfhjbjh/uepUvYHBzmjC/KBOpcbQ8LPa0eOkFbWA8ylN//
         JsW9d33dptjgCAfi7y9Vyfp02LGwv9cvMfUKiwAobIqbP2P8ZCTV6LzGkxf7RlA8ym
         iUa/r2DcEZRVsbQXxKJBDXBTXcF7KZbyQg1uU2+o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.58] ([92.116.189.175]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fIQ-1kRib23Qqo-007AQp; Wed, 28
 Oct 2020 14:13:46 +0100
Subject: Re: HPPA support for IGNITE-UX install discs
To:     Keith Monahan <keith@techtravels.org>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Sven Schnelle <svens@stackframe.org>
Cc:     Richard Henderson <rth@twiddle.net>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        qemu-discuss@nongnu.org
References: <fad1bbcf-51c4-f381-87cf-23d5f9787df3@techtravels.org>
 <69e13e3a-f236-871c-0491-bb8d53c74a18@amsat.org>
 <d84eea18-3bd6-bda9-3e63-749a96e1ed94@gmx.de>
 <daaf28c5-c0d6-87bd-3b60-2687913e7a12@techtravels.org>
 <6ae9bf84-bf40-caf4-d22e-a8df4de26d3d@gmx.de>
 <c13cafb3-7a0f-2ebf-9a48-b203168376b4@techtravels.org>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <0cc5a8b7-5c31-cdf7-aa07-92b5945e0841@gmx.de>
Date:   Wed, 28 Oct 2020 14:13:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c13cafb3-7a0f-2ebf-9a48-b203168376b4@techtravels.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GrtCCPWLYvAxR8v7h0Ks+1waDAc6dMp6I+KPZdcI7OnXbmraXMH
 PEU40vg/QI1WJS5X5EZghmNLZgsIkJd+LXxbcFS7AoHSExgDQSDXs0Mc8+GMw+xQ7ppThHZ
 UBX9O3cJqjl0KJ4Ve9AxItQ+nqzrDNVxm9E/sYi2R8qCnyH7JOwAdp+ZRuKu7tZCcUHM9of
 q5loDe/BqTHFPctmCixGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ril1nvId218=:I6Qe8DtwanFXIBqub5huRp
 I8dNijCEWwEEW5eyY66i0L6ek+UmWTBDObjjOpvLlakGwbyFJ0RJHd1N7U+A3ZzVtGZ71jtsj
 tbkFTgGS8e80vWeXMNmj6+l4tXEiN8+avf9fPVBd52LYNDwKulNmocUrcRMuLySygCU5wBKQI
 7wQM0TQDpnE8ltyiM5sZ1ffyffbk/63Ekr5evApEf16RaZIBMqdxR7/HyqvTcc+IlOMYYeZFZ
 xhWsKAUh2Ls4UFaGy7WeA5KGmspUBTbNZQNeyWmI5B7LIWHanXITr5o9sUQNA3WTxgAtIwexX
 TruFkxNy8dCQkC5s6d817beMm0qXnDTVfZ9MociE5hUX1vHWkpvZpl9Ibb3uByeqYwYxH6nBN
 TWCOurP6tk62a96DxiGhUIrEIFRdFQsYUaHOihVWVsDPX//KmoHR7QgBVVnwgZHRL83dN0x6a
 1NLrfUhg+4FbuZUD+JYU1nkgJXewPrhUf0YD34t6H5TH44JJdLFCv45MzLiFveI5G3d0l4sil
 wXhypCaHL7HgGjjD3A3rapa4UfRzZgy/4/xR55LbvO8Fg1x1KSMUC7s/spht5pkc085On9AV8
 mmOAAtCH1+aQfdsuOwwa2n9i7oX/Hke8GZNPSMMQGWAKx6isT9Tf3Gl7AMeaLzU4vdld+sVQd
 ie/7r3uzyjiPv8dLvyNKFzlvMZzd1im9umOkMZO3yTuhXC0MS14Pve/Lu9sQePQZcb5HdTUPS
 keJEVKz3iGgvI8PhSMtV3zXOc513v4m3m5kxcNUiptlGFD+RyFVNMA2tpaLettl66AN264ZmI
 zb1K0uAVcrDHwkHi9UJiURvKaWi4Q0LzZjhsPkfrCxRh1oPe7D9bvzSdMhKthpQPToRbLrEmi
 J7ZiB82CK4w1NFvuIxtg==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/28/20 1:29 PM, Keith Monahan wrote:
> On October 26, 2020 4:01:52 PM Helge Deller <deller@gmx.de> wrote:
>> On 9/22/20 2:28 AM, Keith Monahan wrote:
>>> Here's the ioscan from the actual hardware
>>>
>>> no_hostname:/> ioscan
>>> H/W Path=C2=A0=C2=A0=C2=A0 Class Description
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bc
>>> 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bc=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Pseudo Bus Converter
>>> 8/0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ba=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI Bus Bridge
>>> 8/0/15.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 instrument PCI(103c1650)
>>
>> That seems to be a specific HP PCI card.
>> Maybe it's possible to pass-through it at some point in an emulation ?
>
> Not super concerned with emulating that hw there. That card is used to c=
onnect the PCI bus (in turn, connected to GSC via DINO) to the logic analy=
zer backplane.
>
>>
>>> 8/16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ba=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Core I/O Adapter
>>> 8/16/0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ext_bus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bu=
ilt-in Parallel Interface
>>> 8/16/1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 audio=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Built-in Audio
>>> 8/16/4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 tty=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Built-in RS-232C
>>> 8/16/5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ext_bus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bu=
ilt-in SCSI
>>
>> ^ this one isn't implemented yet in qemu.
>> As I said in another mail, we currently emulate a PCI SCSI card instead=
.
>> Maybe emulating the original SCSI controller isn't hard, but I don't kn=
ow
>> and I'm not a SCSI expert.
>
> The NCR 53C710 SCSI that's present inside LASI was pretty common. One
> of the uses includes the Commodore A4091, a SCSI controller sold for
> the Amiga 4000. The A4091 is emulated on WinUAE, which is open
> source. To make my story go full circle, looking at that source,
> located below, is based on QEMU source!!
>
> https://github.com/tonioni/WinUAE/blob/master/qemuvga/lsi53c710.cpp
>
> which is based on
>
> qemu/hw/scsi/lsi53c895a.c

Cool, so someone already modified the qemu lsi53c895a.c driver
to work as a 53C710 controller.
And it probably works, which is good.

> I don't know the significance/complexity of the difference between
> emulating a PCI card vs accessing things via LASI, which would sit on
> the GSC bus. Wishful thinking is that once we get there, that we've
> got existing (albeit different system emulation platform) working
> code that emulates those chip functions.

I think to get it glued up with the GSC bus isn't hard.
The LASI SCSI documentation is here:
https://parisc.wiki.kernel.org/images-parisc/7/79/Lasi_ers.pdf
page 8 of 114 (page 20 in pdf)
The SCSI controller ports are mapped at offset 0x100 of the SCSI
part of LASI.
So, if someone has enough time to add a NC53C710 code to qemu, it
should be possible.
I think I could do that, but as soon as something doesn't work
I'm not sure I would be able to debug it - I'm simply missing
the SCSI knowledge.

Helge
