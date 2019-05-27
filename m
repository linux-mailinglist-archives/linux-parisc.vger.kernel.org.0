Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC482B718
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 15:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfE0N4o (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 09:56:44 -0400
Received: from mout.gmx.net ([212.227.15.15]:60607 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbfE0N4o (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 09:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558965398;
        bh=ahi+QJmzG9BeU/pUacIWW5qdfX7QdAiqiwPT/val+Cc=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=L4x1/9iOi630sXLBttZ40BWNg8VDzuOmKNCOzCKDPqcHnSNvtvM9B01b6d8z5zHKk
         2TrJfqpqIB7+zvVE2Qci9WVWwVShxQPLp2gc6hIGb+zSOtqLJuAwUfdswC9nQNVT3O
         QfM4NtzGOgKz963db30TLTb4anm33GLXRPRZrQvE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.20.71.87] ([193.16.224.7]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNbp3-1hEyiL2tdT-00P9YK; Mon, 27
 May 2019 15:56:38 +0200
Subject: Re: Updated installation images for Debian Ports 2019-05-09
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
References: <b8a14609-9bf9-5956-4e6e-5415306a95ac@physik.fu-berlin.de>
 <FseoXokiJzdprrRNbtaWjm5KHvHa5mlMA2PqnBgbvx8PwHGKzYObU38sBMOuJFy9fuNDYJ0Iaf_so-ju5rMz8lvTtgEcMcOjRogVc0mI6FA=@wintercode.de>
From:   Helge Deller <deller@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=deller@gmx.de; keydata=
 xsBNBFDPIPYBCAC6PdtagIE06GASPWQJtfXiIzvpBaaNbAGgmd3Iv7x+3g039EV7/zJ1do/a
 y9jNEDn29j0/jyd0A9zMzWEmNO4JRwkMd5Z0h6APvlm2D8XhI94r/8stwroXOQ8yBpBcP0yX
 +sqRm2UXgoYWL0KEGbL4XwzpDCCapt+kmarND12oFj30M1xhTjuFe0hkhyNHkLe8g6MC0xNg
 KW3x7B74Rk829TTAtj03KP7oA+dqsp5hPlt/hZO0Lr0kSAxf3kxtaNA7+Z0LLiBqZ1nUerBh
 OdiCasCF82vQ4/y8rUaKotXqdhGwD76YZry9AQ9p6ccqKaYEzWis078Wsj7p0UtHoYDbABEB
 AAHNHEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT7CwJIEEwECADwCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEE9M/0wAvkPPtRU6Boh8nBUbUeOGQFAlrHzIICGQEACgkQh8nB
 UbUeOGT1GAgAt+EeoHB4DbAx+pZoGbBYp6ZY8L6211n8fSi7wiwgM5VppucJ+C+wILoPkqiU
 +ZHKlcWRbttER2oBUvKOt0+yDfAGcoZwHS0P+iO3HtxR81h3bosOCwek+TofDXl+TH/WSQJa
 iaitof6iiPZLygzUmmW+aLSSeIAHBunpBetRpFiep1e5zujCglKagsW78Pq0DnzbWugGe26A
 288JcK2W939bT1lZc22D9NhXXRHfX2QdDdrCQY7UsI6g/dAm1d2ldeFlGleqPMdaaQMcv5+E
 vDOur20qjTlenjnR/TFm9tA1zV+K7ePh+JfwKc6BSbELK4EHv8J8WQJjfTphakYLVM7ATQRQ
 zyD2AQgA2SJJapaLvCKdz83MHiTMbyk8yj2AHsuuXdmB30LzEQXjT3JEqj1mpvcEjXrX1B3h
 +0nLUHPI2Q4XWRazrzsseNMGYqfVIhLsK6zT3URPkEAp7R1JxoSiLoh4qOBdJH6AJHex4CWu
 UaSXX5HLqxKl1sq1tO8rq2+hFxY63zbWINvgT0FUEME27Uik9A5t8l9/dmF0CdxKdmrOvGMw
 T770cTt76xUryzM3fAyjtOEVEglkFtVQNM/BN/dnq4jDE5fikLLs8eaJwsWG9k9wQUMtmLpL
 gRXeFPRRK+IT48xuG8rK0g2NOD8aW5ThTkF4apznZe74M7OWr/VbuZbYW443QQARAQABwsBf
 BBgBAgAJBQJQzyD2AhsMAAoJEIfJwVG1HjhkNTgH/idWz2WjLE8DvTi7LvfybzvnXyx6rWUs
 91tXUdCzLuOtjqWVsqBtSaZynfhAjlbqRlrFZQ8i8jRyJY1IwqgvHP6PO9s+rIxKlfFQtqhl
 kR1KUdhNGtiI90sTpi4aeXVsOyG3572KV3dKeFe47ALU6xE5ZL5U2LGhgQkbjr44I3EhPWc/
 lJ/MgLOPkfIUgjRXt0ZcZEN6pAMPU95+u1N52hmqAOQZvyoyUOJFH1siBMAFRbhgWyv+YE2Y
 ZkAyVDL2WxAedQgD/YCCJ+16yXlGYGNAKlvp07SimS6vBEIXk/3h5Vq4Hwgg0Z8+FRGtYZyD
 KrhlU0uMP9QTB5WAUvxvGy8=
Message-ID: <d4871533-32c4-e8ec-72ef-6fb5f62f6ef8@gmx.de>
Date:   Mon, 27 May 2019 15:56:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <FseoXokiJzdprrRNbtaWjm5KHvHa5mlMA2PqnBgbvx8PwHGKzYObU38sBMOuJFy9fuNDYJ0Iaf_so-ju5rMz8lvTtgEcMcOjRogVc0mI6FA=@wintercode.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kcv8tPQ6TQlAFRWEradgXahB6zCTKDT4vqU0EsHDOUrm6lIrjMl
 gcy4puq+xA+DEeOWZm5dsLkZKuYEztyuf8IyNUdjP2Ds6azlivaECiWhBFfP7upJZKZFTrb
 ub/vXUP48cLIJqnKG9H81sgRJdtwDi3lF88+YIC0pgpwPJWGdoLQ+PeI/zgTP7cB25P78uq
 YXeab99NkZXZSrZpYNvtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WeGtWyRU6ls=:SGJXV0fn5xqZhjYZnsPv/y
 jeSD0oQKyJbqLEl0M1Nn34+S02OoBvWmQfu5Y+mgjCQw07taIxkYEPUXxOwuKSlB/hw9aYRjs
 GohOWOZ3LlY4PYOPQrMmehmKs7YltelHsDfk2CS4q3yV88tehphsHFfEUp0XHoPmCREEpgQxw
 9NVx5Q2qPJ198xPDLARezGI5Cz/3NU0/s5uoL2ppAmEe/21tThGr64xJUyan1m+HwsDOMmbJy
 VuP/R89DPzr2OC/oh4HPWp4mqAPRaP2fwqbBJSunZhLhS8LEvLsADv15hcfcWz7pvqPwjpO7E
 oUgnu0dmbcKfzxgTq0u1Nvu9h//4wKxKCOyWA8zEvS+6qwJrwi1t4Ocdmi441lgMt428YpGGC
 yD+n5ZKj0Y2nyfIenrxtT7Safsjs/bZT0BM4JVqorEeMdxbD1144rb9dU8kzlHRHXdQ+9pUQE
 /CKf9D0BdGtr+8X105hZdTG1DNOPQfpyUcW4CUOR3xHAQiGucNUFiSyvEe19jOuWtL4YkMSyf
 52LPV4FNDPf4/AZFvKjczyo/41Ug45HnBj7V1BjBoDXhiuWiQEUETkHTLIbBckmPzRqLEoq/p
 CmUwmj5/1pXDoi88HxUFI2UDuVGDPpcYBacC552aog61D3XUTfJ8Y4h8zFLGA+6xGUShRZ+wN
 rYLGuK7Cj5h+j7WxeK/0CleUHsk6W9NDRgviu78CjGJ/u9TLJTYXBqYOntPfy2LBRZj7xBP/c
 VnQ9mDv6IOkqmsKrTZyBixPYPll8PuneF1kayL5RQGssDNECrjpJB7yi0t1PM2qNACJoJy1wi
 p5Xbass9d8g0TD/ytFjLfwVB0TOvKjRc/ikWI2u9aT2foPzLAdK8w5Gara4yZwm4sblFququW
 OECU0fIdpskbdN7s8K/ea6oMG7wyTF7jOLbqVkfvHDhmBsvoRu8xCEXTFmIVS8ZjLeTBswpnU
 X3BG2Bc/6mB9JyPjwQCpuHogJyVtR8atfXLYNacLsbj0kqDCb8veM
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Adrian,

I just sucessfully installed a hppa B180L workstation.

Installation happened via serial console, since it seems the kernel has
a bug which hangs the machine when started via graphic console (STIcon and=
 stifb).
I dropped the 2019-05-09 NETINST ISO image via "dd" to a second hard disc =
and
installed from there, which worked.

Good work!

Helge


On 12.05.19 14:42, LX wrote:
> 2019-05-09 works now well on my hppa C8000 [on boot, usage of IPL must b=
e NO, else the installer crashes on hardware detection]
> IPL no: installation successful, system boots (with and without IPL)
>
> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original=
 Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
> On Thursday, May 9, 2019 6:23 PM, John Paul Adrian Glaubitz <glaubitz@ph=
ysik.fu-berlin.de> wrote:
>
>> Hello!
>>
>> I just uploaded updated installation images 2019-05-09 for the
>> following Debian Ports architectures:
>>
>> -   alpha
>> -   hppa
>> -   ia64
>> -   m68k
>> -   powerpc
>> -   ppc64
>> -   sh4
>> -   sparc64
>>
>>     I uploaded both CD images [1] as well as netboot images [2].
>>
>>     Please test those images and report back over the mailing list for
>>     the corresponding architecture.
>>
>>     Known issues:
..
>>
>> -   hppa
>>     -   No known issues and changes.
...
>>
>> when installing over a serial console. I also need to know
>> what hardware was used, which installation steps (normal
>> vs. expert) and which image was used.
>>
>> I am currently collecting bug reports but cannot push the fixes
>> immediately as the imminent Debian Buster release means that
>> debian-installer and components are effectively frozen.
>>
>> Thanks,
>> Adrian
>>
>>> [1] https://cdimage.debian.org/cdimage/ports/2019-05-09/
>>> [2] https://cdimage.debian.org/cdimage/ports/debian-installer/
