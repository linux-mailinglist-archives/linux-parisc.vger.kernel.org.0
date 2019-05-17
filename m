Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C50721C5A
	for <lists+linux-parisc@lfdr.de>; Fri, 17 May 2019 19:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfEQRVW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 17 May 2019 13:21:22 -0400
Received: from mout.gmx.net ([212.227.17.22]:38201 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbfEQRVW (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 17 May 2019 13:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558113680;
        bh=9vUw5vAzaoDe2Bb3r0oNfScT4Zfm2yMDAeUkb3BT+9E=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ficvPfCn7vy2OLycK0yZ2o3epVrm6kq+pEjLj8M5R5xcCbe2kvyv+0szYllmsUvo0
         RjskS+TjNY/7ow1+LBQa/MTCkOlCa4iJyTSfEyfe8SpvYQfXn4ZvycKF8llmM5TBKE
         cGcSBN/fQddSyzu+M4jgKQH/zQPONw+5fpIX8e3k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.183]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MTSmp-1hHPAG3vZX-00SN2A; Fri, 17
 May 2019 19:21:19 +0200
Subject: Re: C3600, sata controller
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
References: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net>
 <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net>
 <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
 <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net>
 <CA+QBN9CgMRFmv+isvH-Y=FCCFwKhmD5_5s5u32xg+wk-gTLK5A@mail.gmail.com>
 <44c01dbf-4b6c-c37d-d5cc-844e5679dea5@bell.net>
 <CA+QBN9BqufJM+8Jm-x_zMgMo0cLHKxHCxuYPrLgbvGsbdQofvw@mail.gmail.com>
 <20190514130151.GA530@t470p.stackframe.org>
 <922dc8c9-f401-ed07-ce83-a534fecefb04@bell.net>
 <CA+QBN9Did5PqWkp3rcCN15n+dFd11jqCe+L2q33sTr2d6Ow15g@mail.gmail.com>
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
Message-ID: <9e2370bc-95e2-97fe-ebc8-7e6626d06deb@gmx.de>
Date:   Fri, 17 May 2019 19:21:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+QBN9Did5PqWkp3rcCN15n+dFd11jqCe+L2q33sTr2d6Ow15g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TvWYK7XConUdhhuUSemsUOrSUgl3+58DezZ7jDv5XQnKiyBLc8P
 35RJS39qwt9Ajf0GbVRQzjAPbyoOLsCbz3AE+nUhI6i5UrtBSJGEfRXBvc0hTHD8wfMbOel
 6r6V1cWHLlhOLbT3RXTgrC98xSh9GdsNcMhYBiLI8D7f+cbpwNhMhMko7Pwow9rXSGg3Ps9
 tWR5CP7glH9R6HlzDrusg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/H41HNH12Wc=:YDTK+tuWvHY3HKaVytjF7t
 WC8Ca+ss4hhBx1/1B295MMW8MjdMqHdJ7I7jC524vgwgu5rQOJuomUIOZWU+farMKgM3V8Bvj
 jcJfY8bTaU1HClpTebJnPO6jgyQMaSckNV7xFCa4+KDxWlRKmJ8CrrjmNCHG+AYcWCJf0rD7h
 MMaTToMoUcofFO9oaUCCmpAETB/d2S650dw1NyFpjZ7q3oH6MlO5q8FeTdFj/LgQFUKxNRl2q
 RDQR2vtqzBdpyUCcwgnSlc9RLP/jAsRSVFzOemL9tb0WLC+QmmcAxldDPT6u6Kik3NE5MXSwN
 wsMza3HmoEF6d8SP8LQ9jxMCAThM/yAZgQYeJ+Sjs03H/BWM+b4AmuzRXsgDmkUiKp3O3oasv
 rb7ONIYklyou32Bn4qSUBbNC11bJL28EX7CSZqN6fkhodgVA9YUZBWUGEV9SvpfsY2bJXCc7P
 3faZ9AyAYraspn2PESjCXB1XJAb6i7C7TPZq/yf+l0+SfJeBvgebdE2gVJ/ZlPglLPkfrIxwV
 MVhZ3+xlJ6jSXK7w8wxpeU8CQMEPIDl7yLvvUETxdtMe/KZ4D2jaFzBzolS1i9PUbF/4QTweY
 q65jkf7mxNfJEL6dLiRTro1wJdpI+RjcsA3F9iFK6OkKTjmyPIsfHhcTTnoWyBKynMebgnnte
 g94FYILa3r1oF8bwqSkFCIgT1wY+QV22MSp+UL8cSa96gFU4orZfdNmPpVrsIRjHW2P7S+tGd
 +p9ec5auGtTBHCUOuUywTXYm3D6WJtcKHFYoIj1ZDp6TBcHrYLczAvFT0HIuODeNgOhNUAkoy
 9BMX1QOerazggSCUytbvHDupR8Do2Vn242UofbcDAR6zHddbGC7haTUdodEXy7hp+FqfACGRY
 Mgc69+vErsfcXum+nezdXzXev8w3EYK7FVEz//6pnpBfu/MsfgPSN8YiNswFemKJ/hnwbJbY/
 4KLDuKCQbFLy4XlFTtXEqfVfhSTtQh1cfXi7x/qUTSB3bkisxeTUk
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Carlo,

On 17.05.19 17:43, Carlo Pisani wrote:
> guys, new tests(1) with SYBA-SY-PCX40009 on C3600
> tested on different slots: it always fails with the same behavior
> (1) http://www.downthebunker.com/reloaded/space/viewtopic.php?f=3D50&t=
=3D337&p=3D1663
>
> I really do not understand the random failure, because it seems
> working for a while, and then, it suddenly fails I don't know how to
> investigate.

Random failure could happen because of missing calls to DMA syncs in the d=
river.
PCI device drivers on PA-RISC require that you strictly follow the rules a=
s mentioned in:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/DMA-API-HOWTO.txt
and
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/DMA-API.txt

Not following those rules may lead to the same device driver working on x8=
6
but failing on parisc, simply because x86 is much more relaxed regarding D=
MA
and CPU caches.

That said, I would not expect every device driver to work out of the box
on parisc...

Helge
