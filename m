Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 983402C9D5
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 17:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfE1PLw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 11:11:52 -0400
Received: from mout.gmx.net ([212.227.15.15]:41407 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726760AbfE1PLw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 11:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1559056298;
        bh=C3ROpEmm/31Tn/sc94Ff+OtwksXqJ5cyTaSqgDyo1PY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=bNawWjw2z/TLipXrf0AfxCcBCyVxmwALGoGQv+7jhhvItQlDlNyD/rluD7JVllVJj
         xNuLzd6tiANTmF+5vpTYZaxCpkzh7JSczypsSct9VjpwUszYhSm2yrxW8W6838IQ6b
         uByl8fdo4/daI0flI6qVB9lP2KwUepYMDdq8vqdg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.62]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD2O-1h1XoG26R0-00eLMm; Tue, 28
 May 2019 17:11:38 +0200
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
To:     John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>,
        Carlo Pisani <carlojpisani@gmail.com>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
 <20190527201538.GD29337@t470p.stackframe.org>
 <20190528110627.GA16860@t470p.stackframe.org>
 <e81b7ae4-3126-5fda-58e4-4a83bd4fcfcf@bell.net>
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
Message-ID: <3396728e-622c-eb88-dbf6-bb577e045600@gmx.de>
Date:   Tue, 28 May 2019 17:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e81b7ae4-3126-5fda-58e4-4a83bd4fcfcf@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6kC4MY1D9VuYLUTt1fyI/Y1fMPy8jWjhoMRZ0VwbZQwyAwp3hv3
 vqH4yCyB+6JckWD+5qlpJUO1fQsPazgtjbHBWU4RTgseaH8U+tGr9T9EGiHeBEYWXI44gqB
 dxxV6rjzs/qL9hol2djRhsI+aYfdZe84l/jsBSJrRqJmhvC7wggP0BVB3Qy8h80bMQXJijd
 8MDHewc9iWKCMkE0aS28w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ot3yrKx9lvU=:EzL1jaWG3sZAVTe8iDbHj7
 0d9z9/UfI1f1II9stc2gU7ZF31ljiEpn3Y82bQdpSkAF3MHIPybt277fY5/whzwHNVCCbTQg8
 YD7fFgZEzdTC6+MlqwNRPQzFfvF77J86gbhSV04F6FZaEPRTN4GLeb1HPfKEVUULy6vgPNh3C
 fHVLd2Tql5W7lO/t5XT9ijLVCro98sfzQO0IcKLFjSMk/V+EpoIFBR8K8Qvv6f2ZO28Btv/bR
 UdEn2+sDkdK4fbopmNOzpyDSFB4SlsUSYjzIDPgM7F0l8rTg1dkvfK6m/0LUl5pqnckWDbtZT
 qhzthk12EqOVrT0g3yS5x/saZd4u+nSP7Wt+LSH2FqWwM/XvLujuSOLAo41MQ09qPQqsafNEg
 2GmxPTaQtjUJ3UTWAE0gnCutrlVC3WvnMyG2YIunZzHK9CYMmJjywkfg963Tb1K2YhpattNtT
 f3Eq05WeICcMlZgBvzNoWDts0smRjxmQDTyFubCphBXaxUf0yxjEe2WWkrfkbFMxz8R0EdxxN
 stah4wgLajQXC9TaWngJI3RNKVum2gyjA9LXBNnoxZwFtv5ghxXHawpRmHhd4F07NfiV95w90
 YHiTlT9bIAN8RD74/DCInEIScuL2jTwkFokiz2dGox/wCkiIHxCu9XFbF7+ijLkiSHIuHmzFB
 P7Bjk+P35RJs0kozLe9H1WsSD7reLxyjkGtsA4Y20iDZB4f/JOZjGL+7vi7qLuKgR0w/Z851F
 R68dR/8Rfd1tZYR2+yXHeSz+sw81zQEa6DwXsSFlpxB8/NdUGLjwjOmQNH1myQZ6viBMpjs8/
 5FNdLoKiK2lVNwQEmyiH2Q0v+28lieRB1qmoH65c2Q6NgxJMlhv7YNiYSQyQn8MiXC/CxrL9O
 Oho5rkztGU9ESSQZoaCcAqiJIuq25o810MXCaIkyYa/xMYhjh5luqhtFTprfiW1zXfPBaXQLX
 VIH6AqCfmK136Nq0MF+UliNaNoEtL8ujNrLvvM/ll3+SsPN6fV7xX
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 28.05.19 14:11, John David Anglin wrote:
> On 2019-05-28 7:06 a.m., Sven Schnelle wrote:
>> This is interesting, because:
>>
>> Version 2.0: always sets NP
>> Version 3.1 and 5.0 always clears that bit
>
> My c3750 prints "Firmware 2.0" and NP is set, but it might also be 3.1?
>
> [    0.000000] Initialized PDC Console for debugging.
> [    0.000000] Determining PDC firmware type: System Map.
> [    0.000000] model 00005dc0 00000481 00000000 00000002 77e45e84 100000=
f0 00000008 000000b2 000000b2
> [    0.000000] vers  00000301
> [    0.000000] CPUID vers 19 rev 11 (0x0000026b)
> [    0.000000] capabilities 0x7

Same as Dave: My C3700 prints "Firmware 2.0" and NP is set, but it might a=
lso be 3.1?
[    0.000000] model 00005dc0 00000481 00000000 00000002 777c3e84 100000f0=
 00000008 000000b2 000000b2
[    0.000000] vers  00000301
[    0.000000] CPUID vers 19 rev 11 (0x0000026b)
[    0.000000] capabilities 0x7
[    0.000000] model 9000/785/C3700

Helge
