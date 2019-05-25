Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B35A72A6B9
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 21:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfEYTJL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 15:09:11 -0400
Received: from mout.gmx.net ([212.227.15.15]:42813 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbfEYTJK (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 15:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558811345;
        bh=1O/x2KEQAkToSfaZt0+x8qGEhGL4F6XPBQgyzUgv2nw=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=h1Yh9SEcRZRK2Dq6AIpCKwP2kJFXy9FsomYeqEVdXCPf0UFYd8ySobgvZ7NHuRLHT
         Etj4/3L99xMGcBB0oRovF+EDJvgO54GI7Ew+dMxVx9GEZ8G+XxPsLZfidAOAfXlc7l
         g5JKLXrj397Q0gLZ+xSb0GtvslQOZp2rWtM+3lro=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.242]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LkgAG-1gwNgT0tF6-00aUm6; Sat, 25
 May 2019 21:09:05 +0200
Subject: Re: HPPA problems with the PCI
To:     Sven Schnelle <svens@stackframe.org>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
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
Message-ID: <1a4a708b-09a0-cb46-1491-554df106967a@gmx.de>
Date:   Sat, 25 May 2019 21:09:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190525181304.GA5637@t470p.stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YKjQBSJRAXHi+KMlxdrA7rsuuQF+u1injPY55LyyBcDRmeTG+uW
 KghwOE76RwFnCq+pdWeK0MeX0CUeapI5yCNVfa9Nl6J2xktjieLrb94buC4Icp2ibYfaG8D
 oL1cfxSUtuAJ6i7dbsGizakGk5/Z2TV+npisptaLX77TkI9P8jQgh9wG+1Z+ZZP3W4mf8SH
 SdBGyedi/b8HgBRuZXdbA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PosPsAqGB4E=:jGg700K7/KJ6lAqi0cL9g1
 K8F6JJAHeCFNh28rJuc4wbYFpst6ZK0PwN1vNGlsl/dW7036Sdz4vj142Z/vmuhmPsN0GSBvX
 sMdAHjWqAvXAazOKgGoaKDLJWIDFt+M955ONLLSEKC4pF/YL8/hOM7dJf1hZ7RpXEi1i5yDkq
 d71bkphxbd1rzjO9rSqJLi5MNBY3qsj8WAPOGDjwKMlh33d2w+z25zEmSlBInABOs0DFWcvZZ
 RlZMs9e9jfcHaqf+RZg0WbUCYkb9JRWVnwh0clojaZ2K8Mdm7gAXgMCQFQKiSKpOGhEISyoD9
 JgWkTtoJ7KK/VZB1bgQ+434yH1d2BpTEZzZdu05KLtpA2vRtPOxVPpDQIoNTiHVE7xtzj3pmZ
 CZouXiF6ycVNhNoW55S08jXCJHt9ZrUoDPAJVAFNGsEo+0NgRrywGR5QRV+8kp9hcsKFEaZ3o
 GHKBe8rBxG18K9XmITB6RCyNn454+WLjWx2iM6Kh3o6Sqo6qcp21fmPF+cBP3pUJFKfP3Va16
 OGaYoPjB+MPv0uRKBSdl930ttBJW0U393EBqcrC8OY1hDA9wNRh15WLjxblTiD2GwINSPjcYh
 YHioFZE12GVuzaLcxaq4Fw590FEbrk5MRhP0tbrviY4Dsdkuuk1Bs4HZ2ouytjBtTmHMbZ7GT
 5Sb5o+pkL+XFm+z3kHLn3bSkRYA5erf3YLYRYrZF7nNTom+peS7KF4B8RsqipOxaq5NlBeKRe
 KyqoGApEYIwjW4ai8i+0kV3OIwePqSFxYh4Zd/bxiWBF87owIJ+cC58F4HO6n9TwBSeN+/pfQ
 vOQckq1306DK0FghPupwoHOl4qWJcPdWdPry9tlTPdv6A066oCPpxWgI2WfccuifsJf+81SF/
 v7lcgKFsXNbKWjIxEWuXC/LiK5OvdTk0oVtJA2VrgQLi3bAIkGlexlKEtF6KLZoQkL/hhLo3P
 yxcDFLcHYJhOqJdP+K1NaspQ4aSXArP62odYHIMzC+xFgXtdNvpgH
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 25.05.19 20:13, Sven Schnelle wrote:
> On Sat, May 25, 2019 at 01:50:01PM -0400, John David Anglin wrote:
>> On 2019-05-25 1:19 p.m., Carlo Pisani wrote:
>>>> Carlo, can you run "cat /proc/cpuinfo" and paste the output here?
>>> # cat /proc/cpuinfo
>>> cpu             : PA8600 (PCX-W+)
>>> capabilities    : os32 os64 nva_supported (0x03)
>> I think the PDC is buggy on c3600.=C2=A0 The NP (iopdir_fdc) bit is set=
 on my c3750:
>> cpu             : PA8700 (PCX-W2)
>> cpu MHz         : 875.000000
>> capabilities    : os32 os64 iopdir_fdc nva_supported (0x07)
>> model           : 9000/785/C3750
>
> It's also set on my C3750, but not on my J5000 (PDC FW 5.0):
>
> root@j5000:~# cat /proc/cpuinfo
> cpu		: PA8500 (PCX-W)
> capabilities	: os32 os64 nva_supported (0x03)
> model		: 9000/785/J5000
> model name	: Forte W 2-way

Carlo & Sven, do you run 32- or 64-bit kernel?
Maybe the 32-bit PDC does not return the NP (iopdir_fdc) while the 64-bit =
PDC does?
Otherwise we maybe should only trust this bit, if it's a "PA8700 (PCX-W2)"=
 or higher CPU ?

Helge
