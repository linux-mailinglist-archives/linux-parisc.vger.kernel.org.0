Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C60BA2CAB1
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 17:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfE1PxB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 11:53:01 -0400
Received: from mout.gmx.net ([212.227.15.19]:41925 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbfE1PxA (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 11:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1559058742;
        bh=p+aUpsf8qAITneNuEXlootZjXPeJ/M1S442eSLwEVXU=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=SS01riMEsCCMvxREJktLcIz0YebFl1oNOrdwPp3pBIT3jgU0vCU9aHMMSax2xifqq
         nqF+dB+zK1Obbp58wEnCdbJ4+KG+/tUa1BbkbR4+z5ynanG72MlJip7FuNEF15KIb+
         EFSb7JX9JpOI31D6c4f9wCWw7nHxAyKm4D0EVIzE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.62]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysRk-1gjrGR3iLa-00w0Wq; Tue, 28
 May 2019 17:52:21 +0200
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
To:     Sven Schnelle <svens@stackframe.org>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc-owner@vger.kernel.org
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
 <20190527201538.GD29337@t470p.stackframe.org>
 <20190528110627.GA16860@t470p.stackframe.org>
 <8250bd3cf4a0bf32ff3ecb21dd81eca6@sf-tec.de>
 <20190528154107.GC16860@t470p.stackframe.org>
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
Message-ID: <3e8548e0-7409-2cc6-d44f-3f3637c2ed1b@gmx.de>
Date:   Tue, 28 May 2019 17:52:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528154107.GC16860@t470p.stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TvECNxrSSJTzVlclVlnckPfeOHUgI7QzzmL32SydOFv3bkbeKeX
 AxZl29/5zo+5fua8CgWdJlPB6iLBEabGlUriWawBVsLD9P23d1ZXDy2pIRjkB3xhSW9vint
 9xK4SVgnDJjNwbOkrf77+KU3nL8EKGNig4uhVYmhhVJYbgHYshppuWT0MiTbw350QgMClmI
 2MXpggcvGxPaI//u3fJPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6mrb2AkNgJs=:Bu36ewEaBPMrOJIcyjaXEN
 ZktPiAu8fJcM1kEN9t4TsKojVH5iamGbAXCDWHDodNI7ktdpwYNQrLb+1mUodwGFx9C4NlqSz
 uWza0g8IhAhbzzJm/JHa5JfiXHzxMPIsduFMomU8YvWQpASweJWLGayGap0ILYPEVy3bz0NSe
 mNpLBig0j3x/j/RORp+ig9iHDLwZTyCm2s2ASi66U+dZBtNvsXHxU10sS1LOAAVN9zBCVFIoX
 LKqu2JMBOXq7hw8zZp2ENGb+8rAzF9BJOCHLbS+x3+1YYNzoGOz64+7cXPJcwf0mfl1RMQZM6
 6paad9/1SwM4z4PhNbhb1DpDmV9KVTBHoqJqsrpDiK4gJuBHtEKHtdR2rJdpy39z1mPh+rGoY
 7EYxtIOtxGf2Q77/TyaYYAfi/3fyBnfuhmXACbDgRzJ5ot9ODTqiFVtDYce7Gpjzsjw+nESpq
 nVBdBO9lh/GjAj/PWa4J5KWO+jwrPZMQLPp1L3gdgpCcOjY+bjvClEvMSMq3XSVjTqCDW3nW+
 cSuV54CJe3BPQV/AOHqxNkP17wEEvTrENgYx9A/gKoSgbKFb8kZRzbiljMocu8xVS7qCUK2Oz
 JAiH8+oU4MlZhH7fEi/GO/tFLPzQOdaw6UnVug5HazVAwjb15WI9lE9b+Kyfw3qp88mcX++tX
 PIeYoJ6RDfBCGP4OsCeJWn8spQnpK5rwpUMHFhva/Vf5xpFEgcBnnED0Som51EWc5B5Q09bRJ
 s138LGh2S8AFUZTMFAhIi2LXU+t9vZuxeWaKEGaox2eIWldY5vGwYXT6GZrQSbXnQrCIMnlnL
 UIO7Yc9H1EZuITUnAZbA1AUOE/K2Rk1IDxTMlDEmi++tUJqBRVmVgo+uxr8irXMjNIW6vIMag
 Zz3p7Ts7zhCqUXv9BO8UoU91IY3Dmr5zAZGcRtLGH8OGbgSl4QIb3cc7Opvh+ZrXM2pwYZuF3
 xrsa/vtXwo8BgH1VQghvk8MKUOkkn7BxX6pCA4QozrjdYuFDAcdOF
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 28.05.19 17:41, Sven Schnelle wrote:
> Hi,
>
> On Tue, May 28, 2019 at 01:28:12PM +0200, Rolf Eike Beer wrote:
>>> FWIW, i hacked up a small driver to read the firmware, i'm attaching i=
t
>>> to this
>>> Mail. Would be nice if some people could try reading the firmware from
>>> their PA-RISC
>>> system so we can collect and archive them. Note that it HPMC's in 32 B=
it
>>> Mode,
>>> but it worked in 64 Bit mode on my C3750/J5000.
>>
>> Nice!
>> [..]
>> Any particular reason you are not simply using BIN_ATTR_RO?
>
> The reason is just my missing experience with Kernel APIs. If anyone say=
s such
> a driver is helpful in the upstream kernel, we could clean it up. But fo=
r now
> i just wanted to get the contents of the flash, no matter how nice the c=
ode is
> :-)

I think it's helpful, and I'm happy to include it if someone cleans it up =
:-)
I suggest to let it build by default (but as module).
Helge
