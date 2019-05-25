Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073BC2A6C5
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 21:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbfEYTYe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 15:24:34 -0400
Received: from mout.gmx.net ([212.227.15.15]:60849 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727334AbfEYTYe (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 15:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558812270;
        bh=algbc9pHhBegAyCfawPsWJbrhjVfQnDH+fsgVniJFxQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=OIdjOGlAHzHlBEsfQbdn0OrR398lbggGBNAHw7+kMYO8eaIubAZMYNWHUMIVCkruk
         JQGrlC9W68tgYqJKBBrLZnUk99gBYiTAgIjHHcX480ptJSG8UsIfdQ9P9jLrqyLJ0M
         CRP47/aYdoO2qB4p3ER2A5DFHIP5U4aoKbY9gkFM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.242]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD6W-1h0DDL3iKY-00eHzC; Sat, 25
 May 2019 21:24:29 +0200
Subject: Re: HPPA problems with the PCI
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     Sven Schnelle <svens@stackframe.org>,
        John David Anglin <dave.anglin@bell.net>,
        Grant Grundler <grantgrundler@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org>
 <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
 <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
 <9aa6caf2-c9d0-8bbb-8f62-dc1becea841d@bell.net>
 <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
 <CA+QBN9A9jw-QsZXcDHUMZU03TY_m5=kfcmVhpUNyv-y3xy2Heg@mail.gmail.com>
 <55e937b6-a95e-d6e4-ef30-f9040f4daafd@bell.net>
 <20190525181304.GA5637@t470p.stackframe.org>
 <1a4a708b-09a0-cb46-1491-554df106967a@gmx.de>
 <CA+QBN9AMfD_uB2+9HaOy8-NcHOwttNiLWA-DZWnRrfZkeyzeZg@mail.gmail.com>
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
Message-ID: <e8fdd8c0-c559-0942-53d7-6960c2eff7c4@gmx.de>
Date:   Sat, 25 May 2019 21:24:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+QBN9AMfD_uB2+9HaOy8-NcHOwttNiLWA-DZWnRrfZkeyzeZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F8D3USIhbpjmMgHj7mr+WTG4XQdcalrHAhPu2vtVEC0uQ+/+Z8f
 tThuEHXCYvGRc0YTBUM+RcqhrQp5iwDnMotBUlQBxxncuuin5rzqUY2JR9kcdDe0rzY0n6R
 ZvwPXDq+85ge44VoQxMzzJZJ2XA/PefirMzWOLuBqiVTVTgtDDutm3ZASEqt44T+yAEQBXA
 vCOsrv07zBkCQmL0AcDZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Eup5ZnxX+8o=:tDdXg/thtlErczQJsmL2Xd
 Dtx+lWuHihOGZ2wxKsg4akUfIb9KLlABq523lTwkydMju6SScb0/w3r64JhlaGq56hwCZO+ck
 gYiX1u0HhNW7NOAis5lX6cQGgvBivLDvrL+46i2edyPy+Fga51MnGahg4kLWtTJy48xmLN2jq
 2kW5fapJ2dAyG2sWu8WUtYP/4+lGMCFi+ugzHgjvbKkJXUfObo2i3aYDKrr2UTIRupDwx4smP
 e/HtODKPF6su35RB/vZpgB6j9xb4NM40i+PDgX8xz3X/LCWB2tlzgO+7SoShALRWfzhD7myxQ
 cDwnLr1SjCvwkcFo4zbL70UrBzViHUr2+gCoibVxxLIr7B4Gharc3bgu4ed8dRRyi77bqtKTB
 grAvdB1+YRl0yB2/UgvgJYGZN5l+BWpt0d0t1XnVke1FBB7rHORaAjcZwf5xqJCa1PDiDFpmd
 ErvNo0Amp81MTm6FWogpVcWBYEYGx8JXGv4uPPDAllQoN0p9hYi0W4FjKuNZlrrH0reXdjnpV
 HySJQ1BV14I5XHxqwVjkC3wXtSQ3JoOjtjo/IignGALZsDnAi9x+RC5C+YBi1oYnUAdqWWf4w
 oBII9FJA7DH8wYNtsTjdlwznss9PriG0/8nlZEUbgV64ivitTrdu1Cr3mm2fbOfRRWd0w/sP+
 lIWIzAgWTRE2+lJw6TRWA4d079zo/na9eC5U2730JW3oyMu/cQwGmwyjN6WVqoOgxhBgn1oA2
 TPTbxz/Z3ZUTzg6rSpaLEM2gvEHBPq2pLyIMQfGVMpoYDK5GI5gkgjhELJDd04PGvX9Vk4wYa
 TtCf5HXMpjjrKdAUDbisAxF3w4diN76eOSC1fxMt403V3NBXqf+9UkoNIEu6aMkkAry0KVLT+
 YgkBuQnxVIRp8HUKpQtaZP4rBiuhk/DHgaklvHZjRIS+nZEMTY5+8zudemoaqa/7q4XD5oXdn
 A+0663fzEG/mkvo6RLFW/2j0yAhu2HU6DNQko5ePNv6vfHQ0VQNj+
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 25.05.19 21:20, Carlo Pisani wrote:
>> Carlo & Sven, do you run 32- or 64-bit kernel?
>
> 8Gbyte of ram, I am on 64-bit kernel.

Run "uname -m" or "uname -a" and paste output here.
64bit kernel reports "parisc64", 32bit kernel says "parisc".

Same output via "lscpu", or "dmesg | grep 'has started'"
[    0.000000] The 64-bit Kernel has started...

>> Maybe the 32-bit PDC does not return the NP (iopdir_fdc) while the 64-b=
it PDC does?
>> Otherwise we maybe should only trust this bit, if it's a "PA8700 (PCX-W=
2)" or higher CPU ?
>
> Good question. I do not know. But, maybe it's related to the firmware?
> C3750 seems to have an updated one.

Firmware versions most likely differ in version between models...

Helge
