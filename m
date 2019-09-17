Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E9CB5092
	for <lists+linux-parisc@lfdr.de>; Tue, 17 Sep 2019 16:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbfIQOje (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 Sep 2019 10:39:34 -0400
Received: from mout.gmx.net ([212.227.17.20]:34739 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728256AbfIQOje (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 Sep 2019 10:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1568731172;
        bh=2XMe2tlFoiN7gFWUVjeAuOCK+Yejn13Jc9R9pVz68bI=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=QG2GEh2CXJoHYXkDbZKtJl4OrVq/9Se5PbKXFcMqMQSfFiyKeWUQnyRA52TvWTw6u
         ktVlLnBOL8E1c1+zlyjXsNsCiNNv+nILVaseVakxUMh0TNx/8xWp1x9ct5V0zTENfq
         /25Nj+nOQVbJxrdoNSwO490YiG8kOxnIX8kAUV4w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.144.77]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LeSOH-1hrdXN10Jh-00qEJU; Tue, 17
 Sep 2019 16:39:32 +0200
Subject: Re: [PATCH 0/4] kexec support for PARISC
From:   Helge Deller <deller@gmx.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20190908093306.31455-1-svens@stackframe.org>
 <f3d33f11-494e-b69d-cc0f-24c3d5ed4f93@gmx.de>
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
Message-ID: <b2995b87-6c4c-4641-9c0d-652939eea661@gmx.de>
Date:   Tue, 17 Sep 2019 16:39:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f3d33f11-494e-b69d-cc0f-24c3d5ed4f93@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZO1/FIuSqU/ZYsIQyMXNllMU/XkJIUI2mdo5caVcEX8qigjNbbi
 NgcEIsf2SJL5z2lhnOvh/nYcnmEYucwYI8tgauX+9mXJwanO2JvhNZyltDkuSQJE+t0Epgt
 5rwYf3RMG+hu5AY+2Uqk+9HTjGOjmv/NzK7LoLQC7qgDZAMVaPkpRbFGhPZrYr/RydKO928
 l4ermK3E1dtB4JJ8Hxolg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+isngWot7zY=:72i2wdteT4ifq3iiwqIkwZ
 /3Wdk+HVa1tbkaULdv0zLoNARrBL9SrUB7LfOlUnWUDGLbZZwD3K+t9Uq/yComlCv+aJxB3as
 1gfwacI2RasFWilOjjzdPQyUymafa6kkvlLLl9F9XhhBlF3en2KTlTjMHNfNjHKwaJeUVPk8V
 CC68IeMW63/jZewckc11+m29wdHcPvbPdNuF2Cexa8A9hifFteeDn787DICLU28LfmfGHCU/Q
 Enz1gukDHfiam9EdRvRUb9Wue7zszmfC28vhLWUOFkA2Kj02yH+olREuYA9mYHpBn28BnuYjd
 5ZOFSsOWtKG0dPRuZl6yzgeIJOk6L4Yo18xWVamUD6gwSHhbZX5gNFegcbGQ3DADVGQFpfef3
 P3h3GSqWQtVdFMZu1RDuaoSsIZONHZq3a9QkwTCUxQtXrEn9Ptgb67VKKJIphn89O2NT/+Tnk
 tStKhWrW83jx6O2UPjVqGIo3m4Dx6B7GZwW/aWreijFMvyq03Sw84BlrJd1dS4Nd9XrUNFWTm
 qn2x4KW3BhsyLnsIIUAVVh3PHAIxnoq/+nu08BLpAysJY2w1E5VUAZAzd5YqXgkh6hrbt+LH0
 LloE+MjRsQZes7jK1YyUPsxin2fLy6LecDrUUEA1WitI56uq0IrgwE1gmIqt9fDOHH1jqvbW5
 8CYwlTxxFdhlN8h6Qa+/YiIVswa2ed9gWjYEB04pNrJX9YDCd0vK4nHQvggMR90h6pQPsDRi2
 6y+mqEpIKWbNsIAc3n0ZV+URQMHh+ZDGWrBCM8/5vDQoc11aVtEdXJkxyXP4FqP7995JKwhwp
 4QHaG4ldas3WlOuBHZ1XzEVXSwQz1fM6eev8vrO0skIpX3xXXqzK3fRfuWJS/MTHSEVjo51px
 uirslULSXlNPVRZZuHn6yeFTfukANRciZmO26QFpF8iEu9TUdk4RXE+sk6YXMy+XxoxJekeUq
 twL6X08feORuZ2T9gzwx2gRnP43f0qaaYqrjT8wLDXRlV/t/1sjuVcP9C0TMAuSuL1l1IvZP0
 IH6YN+aiD7h+igC+OwmbIzepszVN4+bh7rPmmk9oFMW+Wzm6o27xe14Tb6exMc+d261fNOb0U
 tXSAw+vRnf2u4/nabogzImhVMgv9Ix7T+v7wg+jo62ygbVJN3pTwVA4y/dpReltEtAWMDGtde
 Yy4bmDpIcibXJlIkS1LBD8AQRxn6QR7fBwshX/a7HAMNkWcdd+sbpq7fAIkPZIGATC/xyBKGE
 SZ5W7v8M0ZhCY71SQ0ZrAaWuhcgVuYHFq0OGSwrv2pQb28efwTUZzb9Bgiwo=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Sven,

On 08.09.19 15:45, Helge Deller wrote:
> On 08.09.19 11:33, Sven Schnelle wrote:
>> this series adds support for the kexec syscalls to the PARISC architect=
ure.
>> ....
>> For testing you can use my patched kexec-tools:
>> https://git.stackframe.org/cgit/kexec-tools/log/
>>
>> I will submit these patches as soon as kexec is merged into the linux k=
ernel.

All kexec patches have been merged upstream and will be part
of kernel v5.4.
So, you may now push your patches to userspace kexec-tools
upstream too.

Thanks!
Helge
